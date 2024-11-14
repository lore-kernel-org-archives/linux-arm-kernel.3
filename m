Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00374D68B18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNrlvvL21ME0NOO4edlkQNtP9UaBe8f68aKe8AvVql8=; b=OPr2A9z60Jex8/Uj8N+Je8P5e0
	OGRAOkNg5hw/JxDmLRTfhqKwSKHWGpvRJeFQk8OxcOJFLvW2UN5pWdQxzqZRwKccDqaHuglI3YG+t
	MlrD3PNqx4obUE6T2bcPeh3oNiXdi9QCYNrv3lTWhPqGbr++3arP6PrNeeI6Ln/TwguzHlFVTrTbG
	yydnOQGK3ao+LIC4JOLrjN+MD7+JV7b/euO3Pcx7PnWsR8MT3Y3aL9H/kNuWR5zGGCEBecdGZ2MHI
	s+LTlM0NIg/NXkq4GVTYh2NvogaqREw+gGSoe8wDlOsJ0+bSGts1qcNDuH7T3hIqKw2ozmeGEy8G5
	xrgSTtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaA8-0000000A6M8-11e3;
	Thu, 14 Nov 2024 13:45:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBa2e-0000000A50H-3Zzt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:37:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xq1Np5tbYz10RqK;
	Thu, 14 Nov 2024 21:35:06 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id A97D9140157;
	Thu, 14 Nov 2024 21:37:37 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 14 Nov
 2024 21:37:36 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <james.morse@arm.com>, <Dave.Martin@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH mpam mpam/snapshot/v6.11-rc1 1/6] arm_mpam: Set INTERNAL as needed when setting MSC controls
Date: Thu, 14 Nov 2024 21:50:32 +0800
Message-ID: <20241114135037.918470-2-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114135037.918470-1-zengheng4@huawei.com>
References: <20241114135037.918470-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_053749_294171_2D4881F6 
X-CRM114-Status: GOOD (  13.35  )
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

From: Dave Martin <Dave.Martin@arm.com>

Currently, when an MSC implements PARTID narrowing, MPAMCFG_PART_SEL is
left set to the reqPARTID while while programming resource controls in
an MSC.

The MPAM architecture does not guarantee that any particular resource
controls will be updated correctly in this scenario.  Instead,
MPAMCFG_PART_SEL must be written with the corresponding intPARTID and
with the INTERNAL bit set before attempting to program resource controls.
Only the PARTID->intPARTID mappings can be written without the INTERNAL
bit set in MPAMCFG_PART_SEL.

Fix it, by rewriting MPAMCFG_PART_SEL appropriately after setting the
intPARTID mapping.

The MPAMCFG_INTPARTID_INTERNAL flag is not currently accepted as
input to the __mpam_part_sel() helper.  In the interest of keeping
the code clean, break this helper up.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/platform/arm64/mpam/mpam_devices.c | 26 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index 954b0017eda8..e7ab1bfbf831 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -204,15 +204,27 @@ static u64 mpam_msc_read_esr(struct mpam_msc *msc)
 	return (esr_high << 32) | esr_low;
 }
 
+static void __mpam_part_sel_raw(u32 partsel, struct mpam_msc *msc)
+{
+	lockdep_assert_held(&msc->part_sel_lock);
+	mpam_write_partsel_reg(msc, PART_SEL, partsel);
+}
+
 static void __mpam_part_sel(u8 ris_idx, u16 partid, struct mpam_msc *msc)
 {
-	u32 partsel;
+	u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
+		      FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, partid);
 
-	lockdep_assert_held(&msc->part_sel_lock);
+	__mpam_part_sel_raw(partsel, msc);
+}
 
-	partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
-		  FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, partid);
-	mpam_write_partsel_reg(msc, PART_SEL, partsel);
+static void __mpam_intpart_sel(u8 ris_idx, u16 intpartid, struct mpam_msc *msc)
+{
+	u32 partsel = FIELD_PREP(MPAMCFG_PART_SEL_RIS, ris_idx) |
+		      FIELD_PREP(MPAMCFG_PART_SEL_PARTID_SEL, intpartid) |
+		      MPAMCFG_PART_SEL_INTERNAL;
+
+	__mpam_part_sel_raw(partsel, msc);
 }
 
 int mpam_register_requestor(u16 partid_max, u8 pmg_max)
@@ -1529,9 +1541,11 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
 	mutex_lock(&msc->part_sel_lock);
 	__mpam_part_sel(ris->ris_idx, partid, msc);
 
-	if (mpam_has_feature(mpam_feat_partid_nrw, rprops))
+	if (mpam_has_feature(mpam_feat_partid_nrw, rprops)) {
 		mpam_write_partsel_reg(msc, INTPARTID,
 				       MPAMCFG_INTPARTID_INTERNAL | partid);
+		__mpam_intpart_sel(ris->ris_idx, partid, msc);
+	}
 
 	if (mpam_has_feature(mpam_feat_cpor_part, rprops)) {
 		if (mpam_has_feature(mpam_feat_cpor_part, cfg))
-- 
2.25.1


