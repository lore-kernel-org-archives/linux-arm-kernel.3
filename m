Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9CFC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/ysBhP73KBKKeuY3njuqxvc7WsSQpiMxy9XgBQloPo=; b=zVYQ7Pp38kdAt7EjJmjZ2rCVf7
	wxa80i3RQPiYYZJe0DitpNDsXjLep+cVKd/0XXPZp+9yOf9WXVKYMudsbqG/CXTNX5wzroSDrp6BL
	40wW8Ba38I7/YHmZegynLdZ68wHp+61tvB8VNJfHvCqEHWNBFZ1YT1qv+wumom0m5PY1hKgcQYpjT
	/TZ5eTYfKHA3SeGiX2LClFSWHLH5ooL2dQC5UpQ1+/hUpsqs0Oy23tXMzRAWV1MT4V6mu4SSKfmiz
	kw06Hz3Af8zyOxGMGhUB6X6gCY7r49vI1nJHwVJl2iPsl6EyCR6bbx4QOgrlumAMfzqvjH+Qef/p0
	QMOnM2gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoDT-00000000c2z-2qXk;
	Fri, 17 Jan 2025 15:24:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzy-00000000ZFe-0NWD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51DB82247;
	Fri, 17 Jan 2025 07:11:30 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 335C03F73F;
	Fri, 17 Jan 2025 07:11:01 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 10/11] arm_mpam: Skip inapplicable cases when reprogramming a resctrl domain
Date: Fri, 17 Jan 2025 15:10:20 +0000
Message-Id: <20250117151033.1517882-11-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071102_168846_5DC41A24 
X-CRM114-Status: GOOD (  12.37  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The implementation of resctrl_arch_update_domains() currently
iterates over all types of staged configuration changes passed from
resctrl, irrespective of whether a given type (CDP_CODE, CDP_DATA
or CDP_NONE) makes sense for the affected MPAM resource.  Since
resctrl will not stage any updates of inappropriate type for the
resource, this is mostly harmless.

When doing a forced update as a result of a call via
resctrl_arch_init_domains() however, there is a need to update the
cpartid (intPARTID) even if no staged configuration changes are
supplied.  This can result in intPARTID being repeatedly
reprogrammed with different values.  As well as being inefficient,
the final value may not be the correct one.

To program just once with the correct intPARTID, only apply the
update types that actually make sense for the resource.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index f1d0d9f59771..1f31b1455f66 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -1263,6 +1263,10 @@ static int __resctrl_arch_update_domains(struct rdt_resource *r, u32 closid,
 
 	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
 		for (t = 0; t < CDP_NUM_TYPES; t++) {
+			if ((t == CDP_NONE) !=
+			    (!cdp_enabled || mpam_resctrl_hide_cdp(r->rid)))
+				continue;
+
 			cfg = &d->staged_config[t];
 			if (!force && !cfg->have_new_ctrl)
 				continue;
-- 
2.34.1


