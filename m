Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F2BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 02:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQuJQ6PIs6ycumh8Z3M1kZRXSBJcfL6xMyJNTAbCb/o=; b=mqLI0Zo/oA+AxuLGDmlwsHyt8K
	CYXy1kDpAxWxjm2q6KZATgNVFDLTDxNyWaZ7OhL9BEwPSoyXNebwrrOpaWLdqoOTyFGI46HVq/jFD
	pJPdUSWtGJotY1xgziq7UxmRaGeNM4fBPKUWZnbgUCVsHMl/Hbfb9B3y5iKA5a947guvGTGOM3uuN
	TbvVEdE8POl0BvmVAhoClY1iHnjSN4iG2fQx0+crYLhk2zksPrwwXc7UbsaJzXkwjUT4KbZ1SjU4P
	AfloDQs/04CFeJPUaqMaZVr1vjOBtp0tdEIiGcoiY1ZC0o7Qc6krWxiC9zvISItwsRh7X9qqJy2uE
	g+ia17Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpah-00000006L3o-31q1;
	Mon, 18 Aug 2025 02:27:19 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpY7-00000006Kkg-1Aiq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 02:24:41 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp03f1a0caf88aab197d1d46d4eda73d85ef~cu0iePlc60945109451epoutp03s
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818022435epoutp03f1a0caf88aab197d1d46d4eda73d85ef~cu0iePlc60945109451epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=qQuJQ6PIs6ycumh8Z3M1kZRXSBJcfL6xMyJNTAbCb/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BoT1UgP47ZwIXTCFwuQdwElDFoY/QurjgpamzYm1Y8mKlIE1806FmKUz2EpoLFkJU
	 IhrILd0sTPNAgLebhXfpd89a9U9oQP8TSZiQpVJQdmCCUZiuqm/1I5AEIsw47an1By
	 ZSHFLghSZztGn8FwJO3u2o2Lw2O+nvgVQptfZOxk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p48a2039081745d48c81ae1d2525ed196d~cu0iHWMsa2945329453epcas2p4W;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c4xPG2rCFz2SSKt; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4~cu0hB1wga1646616466epcas2p1s;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1417e39541ef8e8ca54bf08bf507fcf7a~cu0g96fme2020320203epsmtip1P;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Mon, 18 Aug 2025 11:18:26 +0900
Message-Id: <20250818021826.623830-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_192439_827501_455CEDE3 
X-CRM114-Status: GOOD (  12.47  )
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
- QUIRK_HAS_32BIT_CNT

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 915d3c88565a..b774477190b6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -306,7 +306,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -318,7 +319,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.25.1


