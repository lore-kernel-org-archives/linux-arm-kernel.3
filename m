Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30402C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm4It2ilbjn8iPFNXdh/VHiA0ksI7sibQShLq/q6s5c=; b=08lYyj0PYBoNhgelMTpoJJPs33
	xJ6ScYozZeDaFUwkA7+I5hyKsaiXYq1FA+6WLBKKrQogg7EWtbDf8ekipnazqKy9HcS+/JDB6i20n
	fJCKdYxa7hcdQP+eNQrCI25kzt4OXU3QY4BvXF4FVhzVWq1Z1rcD3CyFNlegehW4VBc1DVuH5R9L3
	zFpZL+LclU5rbLPWXyx3ZuHV/YihIrHrOS+JVWNAD+hyqN0/zShuz1Fafslng813gLk+1oVX5X+K3
	8aXQD8s7rfbs8ONPgy8fQMXwXc5joka9dUTy3s9XXf0fMgAwnxB82e0Jcd3gnlnXF9Cnpipy2n0Pl
	nIMqAB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo3b-00000000aAa-1rFo;
	Fri, 17 Jan 2025 15:14:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzr-00000000ZE6-1if6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:10:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 896101691;
	Fri, 17 Jan 2025 07:11:21 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA433F73F;
	Fri, 17 Jan 2025 07:10:52 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 01/11] arm_mpam: Fix read-back of cloned resource controls under CDP emulation
Date: Fri, 17 Jan 2025 15:10:11 +0000
Message-Id: <20250117151033.1517882-2-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071055_491582_281B8584 
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

When reading resource control values through a resctrl schemata
file, the index into the configuration array in the MPAM driver
is currently translated incorrectly.

This means that when resctrl is mounted with the "cdp" option, the
wrong array entry may be returned or an out-of-bounds array access
may occur when reading back of control values for the MB resource.

Fix it by translating the index for affected resources as if they
were "DATA" resources.  ("CODE" would also work, but because
resctrl_arch_update_one() clones schemata writes across "CODE" and
"DATA" for affected resources, it does not matter which one is
read.)

Signed-off-by: Dave Martin <Dave.Martin@arm.com>

---

This issue was introduced by the non-upstream commit
"arm_mpam: resctrl: Improve CDP emulation"

(commit b097a6193546dbbd27cd19d7e16e1e750ebb030f in
git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.12-rc1 )
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 76ddbce0ea9c..30f2caec11d7 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -1097,6 +1097,14 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	dom = container_of(d, struct mpam_resctrl_dom, resctrl_ctrl_dom);
 	cprops = &res->class->props;
 
+	/*
+	 * When CDP is enabled, but the resource doesn't support it,
+	 * the control is cloned across both partids.
+	 * Pick one at random to read:
+	 */
+	if (mpam_resctrl_hide_cdp(r->rid))
+		type = CDP_DATA;
+
 	partid = resctrl_get_config_index(closid, type);
 	cfg = &dom->comp->cfg[partid];
 
-- 
2.34.1


