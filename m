Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C62E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 18:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlLEgXZghTPhT1JJ7bfDY+dyCUCM2CmoWF3OX++7OhI=; b=Akxbv6Ppwmt9K2ok3v60KedT/v
	zovq/ZC5qQh/e49NNbhUAP2DKeTJjgH4jtbv3UICAM9VBBM6WPM6DFbqeegl7V6+7oOf5kNKM8L69
	JBqzteNBanLQYRFg0TTuGbWrBqu5BprTPG+UHqFxZg8ACnk7t6KK4nomCUy4mVzPH4kiqCeYH06Ee
	cEPgpiVQu9gkSPUQIWksxZLuP1hfZD80XY1eWxP1vEE8E880/DVPDCoFphAt8NLlJIeGDsFmqRwAH
	Xc1GZtSAYQiSnE1J0eIxbGGvEnsajN8kccyf0NW49BqK8PS2CFQEg3Ob4Wf21rXcaXLkHA2iBXIqg
	iPxa3ICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRqI-0000000FmY4-0rx1;
	Wed, 11 Dec 2024 18:53:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRnC-0000000Flda-44Os
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 18:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4D5BA41881;
	Wed, 11 Dec 2024 18:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9787AC4CED2;
	Wed, 11 Dec 2024 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943038;
	bh=qrrMUOSZEfY/cTaNeMEEDWyFjmfOCB6G3PQly+6iqjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnYxS5tahjnBIDKL6W1G4XMFjoiORdj5TFan4lrQOfPLoYA45Y7lt/JaC6y7PimxK
	 0tSdwfjIU7RZ00amc17CkJ5qnhyLkVUXkBVX6gRjnoQH39yfUKCjo36Fpjai4aq7Tx
	 FWDSSWdLPzbDIY+4ZYUD3jy1efqbA5HRICM3M8cxSJfxn+mcN8mave5JHEv4EPLXr8
	 yBJdJUAeX4Lndx81C+BlMOlFvYxOiRcEWn1yVx5Fp9Yv615kwGrguFOCTWx3gPAYkG
	 0JmwykS1aH5dE8On76PHWRF5nUynqkuxTxVoTCdTIw/zFGBta7nU1VzRCAZMah5hSh
	 8hwM0cqlZcSSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Byoungtae Cho <bt.cho@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 05/36] watchdog: s3c2410_wdt: add support for exynosautov920 SoC
Date: Wed, 11 Dec 2024 13:49:21 -0500
Message-ID: <20241211185028.3841047-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_105039_135569_4901575A 
X-CRM114-Status: GOOD (  13.74  )
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

From: Byoungtae Cho <bt.cho@samsung.com>

[ Upstream commit a5cb13980e00e9c4fbc382d68eda250ab6a14d7c ]

Adds the compatibles and drvdata for the ExynosAuto V920 SoC. This SoC
is almost similar to ExynosAutoV9, but some CPU configurations are quite
different, so it should be added. Plus it also support DBGACK like as
GS101 SoC.

Signed-off-by: Byoungtae Cho <bt.cho@samsung.com>
Signed-off-by: Taewan Kim <trunixs.kim@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20241021063903.793166-3-trunixs.kim@samsung.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/s3c2410_wdt.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 349d30462c8c0..30450e99e5e9d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -63,6 +63,10 @@
 #define EXYNOS850_CLUSTER1_NONCPU_INT_EN	0x1644
 #define EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT	0x1520
 #define EXYNOSAUTOV9_CLUSTER1_NONCPU_INT_EN	0x1544
+#define EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT	0x1420
+#define EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN	0x1444
+#define EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT	0x1720
+#define EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN	0x1744
 
 #define EXYNOS850_CLUSTER0_WDTRESET_BIT		24
 #define EXYNOS850_CLUSTER1_WDTRESET_BIT		23
@@ -303,6 +307,32 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
 		  QUIRK_HAS_DBGACK_BIT,
 };
 
+static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
+	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
+static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
+	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT,
+	.cnt_en_reg = EXYNOSAUTOV920_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
 	{ .compatible = "google,gs101-wdt",
 	  .data = &drv_data_gs101_cl0 },
@@ -320,6 +350,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	  .data = &drv_data_exynos850_cl0 },
 	{ .compatible = "samsung,exynosautov9-wdt",
 	  .data = &drv_data_exynosautov9_cl0 },
+	{ .compatible = "samsung,exynosautov920-wdt",
+	  .data = &drv_data_exynosautov920_cl0 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
@@ -643,7 +675,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
 	    variant == &drv_data_exynosautov9_cl0 ||
-	    variant == &drv_data_gs101_cl0) {
+	    variant == &drv_data_gs101_cl0 ||
+	    variant == &drv_data_exynosautov920_cl0) {
 		u32 index;
 		int err;
 
@@ -662,6 +695,8 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 				variant = &drv_data_exynosautov9_cl1;
 			else if (variant == &drv_data_gs101_cl0)
 				variant = &drv_data_gs101_cl1;
+			else if (variant == &drv_data_exynosautov920_cl0)
+				variant = &drv_data_exynosautov920_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.43.0


