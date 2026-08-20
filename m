Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B86C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1kOOBqdadqKd7sMsBzk2riCQDzvapQr8MFQipboziI=; b=xlWgGOqQx27AHUfCRKKN7c/6ft
	endDRXNRgA4jGOP8qocgjIdNH2gvns/zM3GCSLEtkq3X2jt7GWvNtg3YJesdPLM0xqgD3NXNNIC3u
	jrzU90QfTaszOBnDg20ffaCbPPlKWov9MsaqRpkjb4KDWY/kDo0ssSOyJaKt40iTgf6Wg6wKS8BDs
	Frtnjn4W8TLTg7PgQBUM4H3K9j/pVjmkik9HE1aLYnjrMfjOGokaQT4VX5RQ5PxpWq6Da+DtA/f36
	uDQXs22mMrhLsg4GY/aqo3QUXAl6toEEhBH+rh8ga5CXluUdVt/ENeasuw+ej/kvWGSSg29gpzEQ9
	kJBWJ4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwys4-0000000BEa0-1OWg;
	Thu, 20 Aug 2026 09:15:36 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwys1-0000000BEZ7-1jGB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:15:34 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c96739a46acso1035296a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787217332; x=1787822132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1kOOBqdadqKd7sMsBzk2riCQDzvapQr8MFQipboziI=;
        b=nqh8nZlUQQzDcNGpSBW4REpEaP4uEbYjpzW2RqKVv86sAKJyZurPnx9AslH/PcyCzS
         aRXNU9HNyv2SmulT+7GR+CoeuEfl04PxvBOodIZg/8blhux9rPE9AlPczqbVS2WmZpFY
         zOAo6fukSrRasRsVrEZvkMvRvPXXUhI47K9AjxhZdXP5hNQ0zE0pPMZR5QmlPJ6Q/eZc
         x0ahfA9xBqHZS8jytDEPJ6XIly3yoLlueV4mnrS2nqutsFQRyEHzmcx8wYu1rPyl3AaE
         KY/+I7MrNwE3i1rv3dDaHSYnDGu2JiJwv6P8kAUQZU39MVQapi9cbVw1Gn5/Mpu85+iK
         +dBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217332; x=1787822132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1kOOBqdadqKd7sMsBzk2riCQDzvapQr8MFQipboziI=;
        b=oQ9O6B3f5gTq2J0bpnc0leSataXodw0XsKW36G918uZRe2PcmTvG7MR9ignCnb7LJ0
         apI/RXUPzw7ecnqiSlz95iRd8oDEt9il6y84irTW3VgHdoBWi2jBNEEYn9maU+TUcCUJ
         vmwpUE+ICmeRwsaxtdo/56iyb+1KuQnH3cw1c9FQBmTLBTKa+OQqVG93wPumyrsx0Mak
         rtBJexNzU9SMOZbW6GpMMg9+alfYTAjimX1gjwh194eX2oRuLilgvMaIdhhYP5HQQ1Dq
         VOpCA/XbdrShhQ7lKMclBsyKgiyh74menUZ3lLBdKAnDZ2/BfiS1m32EsuXklxP7jV4p
         /ixQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLmAn3PPhGgfo6qG49xIFLpxXJf+wchWSPja/YIA6s0ti6keSZ98nDQbV7UxTXsrWgBsVYxyCcnveIqMQb3T8U@lists.infradead.org
X-Gm-Message-State: AOJu0YwqRQnniwxADrpxeBa/ohcDdO9PdAjiYlWtfmjja5BHrYPGfNsM
	rTaWNQGnBGtBCkhPTOkGZX5yHgYEcxn4JbMbhmBnoHgOVRRWpWztgGc=
X-Gm-Gg: AR+sD100zAy5e0AklOnwq8Rz1tO5VXnJEURVoFv6zEQ6XbSN0ailV4cN1LTCmGqNzXG
	eBTOSyHprS2Y/mD4SBOccM7lzqxIxSOSK9BIqPtqEpiHRNMfYqPUtvFVNYhDQX3b4HOLSyGhFr5
	0fStitrbyaic+IwpFIphYA0EHNFNZIU0SMsiE0vAkI2z0gmuTVu+B6kjFWYcqG83ckzIM1AVgUd
	c3Jhi8eQXyhjmn/vbUoLg67CT3D9nzvxxAeOArvOMWrg1NS/VVWXuoX9rYvImV6u96KK5CuYjZp
	4ulN60Q+NHRigrB740MPDBm5Bhd0XmVpDH6EUdby5YcmasQWFoRnUV+biwokDuhdM2BsC8FSOZB
	msO+Ygijf9H9JrrEYNtd40jc/kDEO+IUHjuEc6KDndh47cIuGXzYFtzuo5LN2GJsbQwrTFyd/5F
	A0UTGa60NSuVERzSCaT6vLWf52bvY5N4zkPVVViWwplJTPyMYmHDNwwmJBzQhZgoQKggRHBO9E6
	A==
X-Received: by 2002:a05:6a00:2305:b0:84f:dc19:b77d with SMTP id d2e1a72fcca58-851d3953250mr18184469b3a.12.1787217332306;
        Thu, 20 Aug 2026 02:15:32 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617434sm1431016b3a.29.2026.08.20.02.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:15:31 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: andi.shyti@kernel.org
Cc: chris.packham@alliedtelesis.co.nz,
	heiko@sntech.de,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] i2c: busses: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 16:15:27 +0700
Message-ID: <20260820091527.2118302-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021533_457438_05FA616A 
X-CRM114-Status: GOOD (  13.95  )
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
 drivers/i2c/busses/i2c-eg20t.c | 8 ++++----
 drivers/i2c/busses/i2c-mpc.c   | 8 ++++----
 drivers/i2c/busses/i2c-rk3x.c  | 6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 8c67ab4f2aad..405229cf8f1d 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -829,7 +829,7 @@ static void pch_i2c_remove(struct pci_dev *pdev)
 	kfree(adap_info);
 }
 
-static int __maybe_unused pch_i2c_suspend(struct device *dev)
+static int pch_i2c_suspend(struct device *dev)
 {
 	int i;
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -857,7 +857,7 @@ static int __maybe_unused pch_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pch_i2c_resume(struct device *dev)
+static int pch_i2c_resume(struct device *dev)
 {
 	int i;
 	struct adapter_info *adap_info = dev_get_drvdata(dev);
@@ -870,14 +870,14 @@ static int __maybe_unused pch_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pch_i2c_pm_ops, pch_i2c_suspend, pch_i2c_resume);
 
 static struct pci_driver pch_pcidriver = {
 	.name = KBUILD_MODNAME,
 	.id_table = pch_pcidev_id,
 	.probe = pch_i2c_probe,
 	.remove = pch_i2c_remove,
-	.driver.pm = &pch_i2c_pm_ops,
+	.driver.pm = pm_sleep_ptr(&pch_i2c_pm_ops),
 };
 
 module_pci_driver(pch_pcidriver);
diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index a21fa45bd64c..fc7bc0ddbeee 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -880,7 +880,7 @@ static void fsl_i2c_remove(struct platform_device *op)
 	i2c_del_adapter(&i2c->adap);
 };
 
-static int __maybe_unused mpc_i2c_suspend(struct device *dev)
+static int mpc_i2c_suspend(struct device *dev)
 {
 	struct mpc_i2c *i2c = dev_get_drvdata(dev);
 
@@ -890,7 +890,7 @@ static int __maybe_unused mpc_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mpc_i2c_resume(struct device *dev)
+static int mpc_i2c_resume(struct device *dev)
 {
 	struct mpc_i2c *i2c = dev_get_drvdata(dev);
 
@@ -899,7 +899,7 @@ static int __maybe_unused mpc_i2c_resume(struct device *dev)
 
 	return 0;
 }
-static SIMPLE_DEV_PM_OPS(mpc_i2c_pm_ops, mpc_i2c_suspend, mpc_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mpc_i2c_pm_ops, mpc_i2c_suspend, mpc_i2c_resume);
 
 static const struct mpc_i2c_data mpc_i2c_data_512x = {
 	.setup = mpc_i2c_setup_512x,
@@ -942,7 +942,7 @@ static struct platform_driver mpc_i2c_driver = {
 	.driver = {
 		.name = "mpc-i2c",
 		.of_match_table = mpc_i2c_of_match,
-		.pm = &mpc_i2c_pm_ops,
+		.pm = pm_sleep_ptr(&mpc_i2c_pm_ops),
 	},
 };
 
diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index fcede9f6ed54..878bf42c4d73 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1145,7 +1145,7 @@ static int rk3x_i2c_xfer_polling(struct i2c_adapter *adap,
 	return rk3x_i2c_xfer_common(adap, msgs, num, true);
 }
 
-static __maybe_unused int rk3x_i2c_resume(struct device *dev)
+static int rk3x_i2c_resume(struct device *dev)
 {
 	struct rk3x_i2c *i2c = dev_get_drvdata(dev);
 
@@ -1394,7 +1394,7 @@ static void rk3x_i2c_remove(struct platform_device *pdev)
 	clk_unprepare(i2c->clk);
 }
 
-static SIMPLE_DEV_PM_OPS(rk3x_i2c_pm_ops, NULL, rk3x_i2c_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rk3x_i2c_pm_ops, NULL, rk3x_i2c_resume);
 
 static struct platform_driver rk3x_i2c_driver = {
 	.probe   = rk3x_i2c_probe,
@@ -1402,7 +1402,7 @@ static struct platform_driver rk3x_i2c_driver = {
 	.driver  = {
 		.name  = "rk3x-i2c",
 		.of_match_table = rk3x_i2c_match,
-		.pm = &rk3x_i2c_pm_ops,
+		.pm = pm_sleep_ptr(&rk3x_i2c_pm_ops),
 	},
 };
 
-- 
2.53.0


