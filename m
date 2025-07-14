Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFCEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLWqbeQHERoMsuo11ugHMN7yWlMf/OrKcNa6r4ulJTo=; b=ggI84ERN4x0X8SGN1jf0mrwvk8
	mDpYjTVW8lL+ZG2K1YrI/3W9U99Aob4xFfUtKE9kTUkyKC04GbJEkbsKcpGe88qStdpTrbyKap4Lc
	RMrIKPYdbn/dWNSncgy9nnfLYwgoJEYMKLrsMspxRfetGw+2Mr3Zc4YSmUcvX/H55BX5juSeKsSAt
	46Svo9xNsjOdnDZGwdblTIsRwWV7DtTcJJxwyQNDVDMFfeSZlsfOn6+Hw6xm5gi1Gfe0RnCnjuJsJ
	lRJJ8bUYeSNctmepFXjI1yaMo8SkXWFB4weA94k/DAlahObhJUMMrJgGplR+oPM6X5InfGhZW7ES1
	9FUmN6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCRp-00000001J4p-31L3;
	Mon, 14 Jul 2025 06:13:57 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCDT-00000001GKv-3Aea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 05:59:09 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250714055902epoutp0228f74889abce03bd9aa48228b1081906~SCKyUNlvz1693316933epoutp02K
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:59:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250714055902epoutp0228f74889abce03bd9aa48228b1081906~SCKyUNlvz1693316933epoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472742;
	bh=wLWqbeQHERoMsuo11ugHMN7yWlMf/OrKcNa6r4ulJTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxYw3JINzCEcGDrPM2LVvPpZwTuIpiiGmw0set2CopSyVAldNOSHixGtw53GEEuxV
	 so/GOgpciH8eBFnGOahoF1CAAGFVVDjRnwAEXbqvQ7av6broBtOfoqZQmWuut1R47p
	 0v2Hf3pHCMjll5KN5Cfn8e1DqXxorZFF7rTNDp9M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055901epcas2p21ffc6309e8371432412bc29fa5966fe2~SCKx7OdBU1842718427epcas2p2N;
	Mon, 14 Jul 2025 05:59:01 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bgWps212Qz3hhTD; Mon, 14 Jul
	2025 05:59:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61~SCKw32m5B1936819368epcas2p1d;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055900epsmtip107e682ee25a4c2ff4ca80ff03fe1ce7a~SCKw0lmzG0355503555epsmtip1g;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Mon, 14 Jul 2025 14:54:40 +0900
Message-Id: <20250714055440.3138135-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_225908_106673_AB037C3B 
X-CRM114-Status: GOOD (  13.16  )
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

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 184b1ad46ca6..16a845f41e74 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.25.1


