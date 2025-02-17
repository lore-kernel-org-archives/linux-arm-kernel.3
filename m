Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8ADC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 03:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7VLMpAkCv+NNoZm6xY6MQLBQ9xjnrkPPWZAdSJRnQA=; b=Kystr+aioNRmPcGaISmkShuc6i
	wIpEco+pEQp1oQiuCUC+vU1P/mhK7wfHrw3B1VMmK0w15Nvl/1uYlPuNHFVCpGK+07SjZ3doNnJ/9
	ImZL5Na5yUYemJ9p8BKQJBqEaIleuMZspAtSCJpcGxqeU1eKe8MEaw3TDiv9//pZ95G414dKFxJct
	V62u/DF7eTSgb1kxnirb79as0vhYEYx3CcRBiCMXpbVwFO+4wtTtmK+wj6ylAoPVD3wr5KsFflEpo
	Boe/i1TJKDVVJhi43kMxtx1JmqXR2l1aNxM8c+zFDYBUpfr9suyEdreUFjzpWYx0pyScPmOjg7K6c
	n2aqQQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrcd-000000037H9-2kwX;
	Mon, 17 Feb 2025 03:16:39 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjrVR-000000036MN-0MYJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 03:09:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Yx6ys0f2szrYpg;
	Mon, 17 Feb 2025 11:07:33 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id EEBA61401E9;
	Mon, 17 Feb 2025 11:09:06 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 17 Feb
 2025 11:09:06 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <Dave.Martin@arm.com>, <james.morse@arm.com>
CC: <bobo.shaobowang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH mpam mpam/snapshot/v6.14-rc1 4/5] arm_mpam: Set INTERNAL as needed when setting MSC controls
Date: Mon, 17 Feb 2025 11:18:51 +0800
Message-ID: <20250217031852.2014939-5-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217031852.2014939-1-zengheng4@huawei.com>
References: <20250217031852.2014939-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_190913_423001_6522CEB2 
X-CRM114-Status: GOOD (  12.00  )
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
index c1b690effe29..a1efd08eb914 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -200,15 +200,27 @@ static u64 mpam_msc_read_esr(struct mpam_msc *msc)
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
@@ -1531,9 +1543,11 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
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


