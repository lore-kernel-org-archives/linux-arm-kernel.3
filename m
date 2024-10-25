Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E5AD0C60D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mSP0Idfdl9Bddnm7Irkt+YNMMsQJrdvTnch1RJ4UlY=; b=q88dKqA2FcKgdve5zvKSL5YU9f
	H9rfK0ny3lB1M/cNlzVfxooMoW5SaHL4VOhz1tQpzEhdzBqhFp45hgLEYAiAVkWK2RwI2+kqye1Ys
	YQ/lf2aGON2xrcuSoPB37irGss+GdoQ6gtKfG23rDIPrZptcQF+tvd/2pcpOdNDHoZ9R+mW6Ui0yq
	nH0Hc9wMj9X3g14zhCSPMOK4m0XKZeGShtY08HhwOF/6+O4H6tp3doDb/aJi8VjuQ1/i92TQkXMq5
	MHkwrcxa5QPKyiUAzQHKiXLpnk2teCw9QQo+15aZKN7L/he2nNkDYCAnnSL4i6NHJK5F0es2XQbfS
	T454Z+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KWJ-00000003qLC-3DzV;
	Fri, 25 Oct 2024 13:38:27 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9c-00000003mkx-2udP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2359271e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862098; x=1730466898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mSP0Idfdl9Bddnm7Irkt+YNMMsQJrdvTnch1RJ4UlY=;
        b=kt/vKlRcU3IlPabyscKRmThZ/kxWJhjPBndymP2HXoqcXrkooK+Gzy/iZtPHW8aBA2
         MpcXeV46e2E+92KpxnEAq+yOmYSjJBDCu+J6NeIpkB/oExIS5GKjT+ZLJ3/fEw+hkp56
         pXIhkTqLRWhM2WeY/B3QEJpUm1bbz0wsxV7pI1c/ffF12MXzWW7FlTZY9wUNt/2GDL1S
         UqI0l+QwOldVMyiofJdPvagETnpJSAE+lCjOd2m35/Oqqq6aAU5hdqc6l971rHJ2fHdp
         NObSJuFnIkJceUDGmW/Vcx0xq6bBQx6oxjqyrtgTCuleCMIxnD92fQV0PTLBTHMQsaTv
         nDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862098; x=1730466898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mSP0Idfdl9Bddnm7Irkt+YNMMsQJrdvTnch1RJ4UlY=;
        b=YKBThB0eISdlt2wacUxwTzqhCzkcpL4Mhh4+UvTDvmmt3LqS7dRZpOZHHOPfs8HbH/
         35leNifpV8YLn0pmCi82LyPM8JvOUgaHbwOGNsi6K4ml7OPtkGBXiUU6IK/S08wpRHDb
         ky9NA7Ti6546y6hgMgdlszHl6wfRgEJdxpMj+MEmYGwoegla6O8A3MojIPEee1+YU3e1
         O6MmtOHdqFwxhOOQloGJ94h/i5ADqr8dFkFbARwoTjXWj5kBaqUR4sCgXFtDOTUv83JR
         iZMCZFl1iQvRdA0Bj6cex27la0icWaKBEHNUJbChSeDifOWBs8bUJd6t/7JDQa+HsJKd
         5Qmw==
X-Forwarded-Encrypted: i=1; AJvYcCURuyB3rU4wV8x+6rlQDib2H/3Nw5MIBwV2uYxOg62rLhT/IIQFZaIflQ2tjleu9JpTWSs+aYynMrzNgy5KsJyV@lists.infradead.org
X-Gm-Message-State: AOJu0YxowQZ6pDYiOq323J3c3eygpS7ZCewDBJRWwjOrrg5Ahzf//3XK
	qnym6mpphFDebao5uFWJq7R2KuUdoUgx528jCM6XWOo2P/HEgAV3d6d/oJPUqDE=
X-Google-Smtp-Source: AGHT+IFIjxCtFqGk3E1YIZeIbZDApteEen8rQ8qLd9MWNW7M5VeqNXGVeyRg3HBljC/8CXJKDn+GyA==
X-Received: by 2002:ac2:4c55:0:b0:539:fc75:99ae with SMTP id 2adb3069b0e04-53b23e1df9emr3392181e87.31.1729862098342;
        Fri, 25 Oct 2024 06:14:58 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:58 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ebiggers@kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 07/11] scsi: ufs: exynos: add gs101_ufs_drv_init() hook and enable WriteBooster
Date: Fri, 25 Oct 2024 14:14:38 +0100
Message-ID: <20241025131442.112862-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061500_758758_DB5E9851 
X-CRM114-Status: GOOD (  14.83  )
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

Factor out the common code into a new exynos_ufs_shareability() function
and provide a dedicated gs101_drv_init() hook.

This allows us to enable WriteBooster capability (UFSHCD_CAP_WB_EN) in a
way that doesn't effect other SoCs supported in this driver.

WriteBooster improves write speeds by enabling a pseudo SLC cache. Using
the `fio seqwrite` test we can achieve speeds of 945MB/s with this feature
enabled (until the cache is exhausted) before dropping back to ~260MB/s
(which are the speeds we see without the WriteBooster feature enabled).

Assuming the UFSHCD_CAP_WB_EN capability is set by the host then
WriteBooster can also be enabled and disabled via sysfs so it is possible
for the system to only enable it when extra write performance is required.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index d4e786afbbbc..40b2563fe011 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -203,7 +203,7 @@ static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 	return 0;
 }
 
-static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
+static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 {
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
@@ -215,6 +215,21 @@ static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 	return 0;
 }
 
+static int gs101_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
+{
+	struct ufs_hba *hba = ufs->hba;
+
+	/* Enable WriteBooster */
+	hba->caps |= UFSHCD_CAP_WB_EN;
+
+	return exynos_ufs_shareability(ufs);
+}
+
+static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
+{
+	return exynos_ufs_shareability(ufs);
+}
+
 static int exynosauto_ufs_post_hce_enable(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
@@ -2124,7 +2139,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
-	.drv_init		= exynosauto_ufs_drv_init,
+	.drv_init		= gs101_ufs_drv_init,
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
 	.pre_pwr_change		= gs101_ufs_pre_pwr_change,
-- 
2.47.0.163.g1226f6d8fa-goog


