Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08434E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2E7xqnCjNDMrY4c8PkIGqRI88xAe9s6dstqytTnSo0=; b=KbkRzqO4hH79XQTx3MUldefFNd
	Afxp0vqi8gV7s698v6QrizHlQa8VQGyYVGbv98f79ehQmEvX3km3Fi4VTAPRtP83+l9XXBvJaiDI0
	aaVTxZIYvIFTTen58S2J2TjO/sTl6EyPWHl0s1R/gywhg/4pU/pfjeqBaW3GYUQa2JiTHBJtd4e2z
	KGOC2nMIqmO8HIIC/Mr1O1K7i8Z2UMJKZxJ9QtiAEIWcNxpwI72f8RzdyuYkjw8fVGEhPfAwkYq7l
	8T7zfbVMMBh5IK/s/30HZ6T9DrPI+DLv2fCaVvjKFg603vBYrlT1Q0pt/t0NhX3PwvYOT9gnKyhS7
	YxLmyE3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqtg-00000003lI7-1H1N;
	Sat, 07 Dec 2024 09:14:44 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqoe-00000003kZp-3d5D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 09:09:35 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Y52Md1BL5zRhpr;
	Sat,  7 Dec 2024 17:07:41 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id D23001800FD;
	Sat,  7 Dec 2024 17:09:21 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 7 Dec
 2024 17:09:21 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jonathan.cameron@huawei.com>, <xiexiuqi@huawei.com>
Subject: [RFC PATCH mpam mpam/snapshot/v6.12-rc1 v3 3/5] arm_mpam: Set INTERNAL as needed when setting MSC controls
Date: Sat, 7 Dec 2024 17:21:34 +0800
Message-ID: <20241207092136.2488426-4-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241207092136.2488426-1-zengheng4@huawei.com>
References: <20241207092136.2488426-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_010933_228888_3D774E31 
X-CRM114-Status: GOOD (  11.55  )
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
left set to the reqPARTID while programming resource controls in
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
index ca621bb132e9..781c9146718d 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -205,15 +205,27 @@ static u64 mpam_msc_read_esr(struct mpam_msc *msc)
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
@@ -1540,9 +1552,11 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
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


