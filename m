Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB231C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=; b=UAGZd/kvHC2CLueN+WmSYi43P3
	kC2c/BNmm749yCrg2f7AGwUJT5dAtTCEYz6Oka+ncJFgByr3lo28LzS6tQ4F46klgwHWbft8B/U2l
	itWN+PnrW6yRa3x3fPAgjs0IW9DU5E3DOlcJGYdiBvkDQWxV9EdXgtW/qjANXZlRktfaid1g/lvoZ
	h8joK4ZPmMpEOM0aVqvhc5eX4s3E0FXZCwJfZCbHsf8T0fz2uW9yq6FZi2YN4QkNQGguouJ9mqKgG
	QSpXmL9VC9QVPDxVVFbBjnJt6Vfazz0yBusC2/S94PKpiSJwIHfBFqZkyA4dOGQ5HATZV4Yob8JDk
	x8Fs58vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwk7-0000000AzZh-3HTK;
	Thu, 20 Aug 2026 06:59:15 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwk5-0000000AzZ6-2WPn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 06:59:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1538685a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209152; x=1787813952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=;
        b=Rw9d2ucykZwlzHX5OvN/DKf8prkNoCJLU2/hREsds0FoGfdIJHwCIdqNWciYKCuU4I
         BEkRmGnnBdqJdjlEbaxYrOoPEkQm2WpDy5283FEDEfVW71Y9/08j9eMj15E8WjXB2W3J
         Z+ojo488kMOd6ghweYCUMq3JcVP74DVJAx3HgtQFJyAvgI5bqjT+rl+Qsrx9dvvpquAv
         nmeh743JVuD6DakFtBDfsj9Y1pYAlKbG6o32w+3PwbxVprtW/aVOj0K3oMMDwD5v6hRR
         JTZ7vpsM0jbWyhHpqFy80xjZtna6HC6/BIi8BVEPvmEU/Jqegs66wjkQ8xTKtmLjJGr+
         brXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209152; x=1787813952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=;
        b=aEOzz31spQpPPNdFkdMazoi44I26GDvwJzpOvMTzx8ND6dgpL8Yz4MJRLovG1W5lXM
         A+x/vduSXJaVJZ1EzI4oZ5Dz0H0beLntkJR0F9yD5ga3vm96WMgcgMgZIN2CpgnM1eqm
         rloxGWwaDcV5eLsV+RC1DdZ+nxr8MpvqgHjXfieT2EGIS+AOty3DD0+n2BbwhYmttucn
         02/LMD857mk2Jd8XBOyOGpAnMiiD2PmLGcoinribizfhAE5Fik8lIadOVpRXoa51cDFV
         dtmjhf+WgCyroAdd2j/bmE/wdByMDJYvrTIRqBwZ7AG166bJYwHyOJfoLQum65IP2JAN
         iCzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvbusY4Be/vZK1ucSD2wJ/rAvwF0wqM+dExWeiopVe/2GbS03Xs+WQhgIIdIXXbTCtC7qzn0f7Ngs+muKSmET4@lists.infradead.org
X-Gm-Message-State: AFuF++mG/XdT5yPSV3rFjpboMeFzB8YfNnylrfGAPsFYUvRkNISMRYFQ
	y/x4SlE/dDN1WUtvG+1bdkaxEeE9J5f2PnzMhw5dJAAglKExqamXgUg=
X-Gm-Gg: AR+sD10n5KlqAMZgzK9lVnZ0LkLLbhvxS9zMPFVFRX0XSoMC4hE7E78md98Hl23Wykq
	Rf02fx/rpe3+cRN9BgxFzyIU0J8MZF5plBPuo9Akmxd5fqBUMIyQgoaSf2z34j7dM3sIXMzYuQE
	V4SFujjT7kKfitjq+Vus9gmJLckrxgx1eMxeHoW0OxuD48JQjwM01GZOAwCEQVEexV/SKfxIY8E
	IwVUbghek0NbpOIcNuB5bNVlzybyl98+EcBeh3+aINFAQ8By71NxR9sWwIXETZanqcau833hefg
	W4c0JyDhbCgOl9hga0E0yy7LqSTI83R/tZnhvE0l02MgKLWkmbvNiH+3IRpWj9J00+MuXOrAbsp
	hWWlURvHZOlJn6ZE9UOO1abDiqBAYH77D+cfFSgYliCeFqGOenvkoZTxy9KYGQot+QkjBPgcKY7
	p/O234mUKzWsh2NLNU7HD/NjwDfZY1L1fiOEXcPPIARrjQRbWsHi7ap8iHgnkX+PAGASRJ+OAC0
	g==
X-Received: by 2002:a17:90b:4c8c:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3958108a4bbmr17249377a91.10.1787209152046;
        Wed, 19 Aug 2026 23:59:12 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb87174sm5483221a91.12.2026.08.19.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:59:11 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	bmasney@redhat.com,
	luca.ceresoli@bootlin.com,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	michal.simek@amd.com,
	shubhrajyoti.datta@amd.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 13:59:04 +0700
Message-ID: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_235913_643864_F0A3BEC5 
X-CRM114-Status: GOOD (  13.36  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/clk/clk-si521xx.c                  | 8 ++++----
 drivers/clk/clk-versaclock5.c              | 8 ++++----
 drivers/clk/samsung/clk-exynos-clkout.c    | 8 ++++----
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index ceadc07bcb6d..9336d08e8083 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -341,7 +341,7 @@ static int si521xx_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int __maybe_unused si521xx_suspend(struct device *dev)
+static int si521xx_suspend(struct device *dev)
 {
 	struct si521xx *si = dev_get_drvdata(dev);
 
@@ -351,7 +351,7 @@ static int __maybe_unused si521xx_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused si521xx_resume(struct device *dev)
+static int si521xx_resume(struct device *dev)
 {
 	struct si521xx *si = dev_get_drvdata(dev);
 	int ret;
@@ -379,12 +379,12 @@ static const struct of_device_id clk_si521xx_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
 
-static SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
 
 static struct i2c_driver si521xx_driver = {
 	.driver = {
 		.name = "clk-si521xx",
-		.pm	= &si521xx_pm_ops,
+		.pm	= pm_sleep_ptr(&si521xx_pm_ops),
 		.of_match_table = clk_si521xx_of_match,
 	},
 	.probe		= si521xx_probe,
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 913fcc5675f1..bf2276981e01 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1223,7 +1223,7 @@ static void vc5_remove(struct i2c_client *client)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 }
 
-static int __maybe_unused vc5_suspend(struct device *dev)
+static int vc5_suspend(struct device *dev)
 {
 	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
 
@@ -1233,7 +1233,7 @@ static int __maybe_unused vc5_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused vc5_resume(struct device *dev)
+static int vc5_resume(struct device *dev)
 {
 	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
 	int ret;
@@ -1335,12 +1335,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
 
-static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
 
 static struct i2c_driver vc5_driver = {
 	.driver = {
 		.name = "vc5",
-		.pm	= &vc5_pm_ops,
+		.pm	= pm_sleep_ptr(&vc5_pm_ops),
 		.of_match_table = clk_vc5_of_match,
 	},
 	.probe		= vc5_probe,
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5f64d93b2fac..9c8b17cb5e7c 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -214,7 +214,7 @@ static void exynos_clkout_remove(struct platform_device *pdev)
 	iounmap(clkout->reg);
 }
 
-static int __maybe_unused exynos_clkout_suspend(struct device *dev)
+static int exynos_clkout_suspend(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -223,7 +223,7 @@ static int __maybe_unused exynos_clkout_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_clkout_resume(struct device *dev)
+static int exynos_clkout_resume(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -232,13 +232,13 @@ static int __maybe_unused exynos_clkout_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
 			 exynos_clkout_resume);
 
 static struct platform_driver exynos_clkout_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.pm = &exynos_clkout_pm_ops,
+		.pm = pm_sleep_ptr(&exynos_clkout_pm_ops),
 	},
 	.probe = exynos_clkout_probe,
 	.remove = exynos_clkout_remove,
diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71..da62c7b7f24d 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -955,7 +955,7 @@ static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 	}
 }
 
-static int __maybe_unused clk_wzrd_suspend(struct device *dev)
+static int clk_wzrd_suspend(struct device *dev)
 {
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
 
@@ -965,7 +965,7 @@ static int __maybe_unused clk_wzrd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused clk_wzrd_resume(struct device *dev)
+static int clk_wzrd_resume(struct device *dev)
 {
 	int ret;
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
@@ -981,7 +981,7 @@ static int __maybe_unused clk_wzrd_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
 			 clk_wzrd_resume);
 
 static const struct versal_clk_data versal_data = {
@@ -1242,7 +1242,7 @@ static struct platform_driver clk_wzrd_driver = {
 	.driver = {
 		.name = "clk-wizard",
 		.of_match_table = clk_wzrd_ids,
-		.pm = &clk_wzrd_dev_pm_ops,
+		.pm = pm_sleep_ptr(&clk_wzrd_dev_pm_ops),
 	},
 	.probe = clk_wzrd_probe,
 };
-- 
2.53.0


