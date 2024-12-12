Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mm4It2ilbjn8iPFNXdh/VHiA0ksI7sibQShLq/q6s5c=; b=W4oYeFpBI5DU2AUm6zE85aVVcW
	9doknDlZWYUvdiCqQPTXuJ9U1A3bfn3U93PXRWnc1pXejlvitAScuxE3VvIJaCfbzBPxcV9nmmBBE
	sRgOed4wAyG+ro6ugcTQXiLrs3SaOOGflOmtItQfQqH5zruqxVOeraCyciFYM31NSm1kwmqZ58KMg
	bslfme6vbGQI6V2DLqjIU30CtFPPE04v3q7Ccj9iK92xujBmXtZ81sjNOtsrRscgHSjOSngOlwrLu
	Hw1ydtC+2155MxLrmm3VaQHO/Zl1/wExm0KdV7dkSK2QRst5zTpZRoQ4j8mn2WdQ8nDp/ZfAT7gEn
	0q+wHLDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlMu-00000000nlQ-2oQp;
	Thu, 12 Dec 2024 15:44:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlIk-00000000mvt-1rJ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:40:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A442A176A;
	Thu, 12 Dec 2024 07:40:55 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 914683F720;
	Thu, 12 Dec 2024 07:40:26 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 2/6] arm_mpam: Fix read-back of cloned resource controls under CDP emulation
Date: Thu, 12 Dec 2024 15:39:56 +0000
Message-Id: <20241212154000.330467-3-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212154000.330467-1-Dave.Martin@arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074030_530918_8B7D5D62 
X-CRM114-Status: GOOD (  11.97  )
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


