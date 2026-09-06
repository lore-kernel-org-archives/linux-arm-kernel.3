Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2F3C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=; b=V31nE7iOtS3zNkaWZNDA2oEqT/
	CYFjBvmdrHlzqTSNQFUudCS5Wk/UdvREoZ2/9b2WHAndEU/czVNpjssvP+zaG/Irhhg+DO6UKc+wQ
	UMtlDe79M3Mt7/W4Mlnx9uhXI8ghJdDPrFlon0hdoYPyaf7IkbUIhV8Y8/5E6T+pvAm8UHlucEZjr
	T/OQDhkMJV5/tJD/1HOraV4MdgXu/r5lTmgaZjYNfGcDDdWnEHKAu81Sy9bMqGLccvQhihEdNlAtQ
	BWADy7SRjDJGHV0XJDSpfAq0PLKtayyq3+7Fa6CMPss6I2tHfmZ6GBK11QPp9Kg+oCjeynQg6eZpO
	m29G34ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DC-00000004k5U-2ekh;
	Sun, 06 Sep 2026 06:18:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36D9-00000004k4G-3UOD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:18:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2d6efd73032so29727495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675519; x=1789280319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=;
        b=ksPZ7Kh/BPhxMz/pcVhk9rV2lavktkyzgoxAYJ1CCAiCcGSFlkeV3LgxcxdIi4CHU1
         nR5/HWyiysmoACWORa4+dSFg477J3sL0qEwRJyniPPpm/vSKj/bFkDsFzyLeKkWAF5l1
         T5pmcW8MMboBtKL8MJn+i+Fy4G1WlnV4esUy3tos/zjeRaTQiM4QItxRWMJo5H68azZx
         Cc+iZPedPBLUJ+iKXwwdpZXte9ZeVHUSwxE0uu28kNqPCZWW0C//dts7HAlB20QnCxB5
         yeb7hsdpCV98OpORyXSt3oUkTwbzZ5XOVVuhGXn2934ApADq6vpwEdVPpYWnOyFc8EdV
         xRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675519; x=1789280319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hstsV69fzA6quKQkqDKfuqXm3E+lvYW6BhdgjeUuEU8=;
        b=kNb9DEQNHovf1P4+e3ADxfQ8nd7tZIpZts68Yn/wpPWnW4ofwYZ3Re9DAWBzAneTue
         F9x7wPXP7ls/FzpKhwl+XRpu5gVR1lhotMiQURLQJdJ+4YsvGygtZlg6A3p5dT6NwEYA
         /ICKPnl4omsUYy3OmhOlIZOyzWMtSNpZS+/pAFSmHV8h1xwgzrJ44+/7y8mlcw8En9OI
         FY+cFHeJQj/YiWwXCz37vs244SQHVjbIn+Xy6vYmmwf4pjTN07bu4B9EVFc0gHFu/ILX
         6KfF3VSEi13HqMoK89F+kbhS4JB/PiVcnP7cVEI2FWHCvEfx5eAiqprqKvmt7nXYvAUH
         xSLw==
X-Forwarded-Encrypted: i=1; AKwUvBzPk3b3SBl7cpwSuu4RVMiuY49P1oOzvKu9Fz4hL6KLiNJaGslKfvn6KERJ2DyRl6fLpMqpAF+LP7glfLI7iFrD@lists.infradead.org
X-Gm-Message-State: AFuF++k8tm3X2TqkTTfcYNbrEMbcqCqj2xXlJUoaWOEBULZ6wUF7hhFb
	O1J5Y1C3WQApvwS4LPfhCDorhNwNXW7il1ce3B3zAyyJyq+J3QalYEcx
X-Gm-Gg: AYBFou3WSsfTz189zvkKBichYWCksSOuEJhiG2jn1pHgdBs97MBCfOUwGFZeIeEAevh
	jDikq/2otcCjUdEs20WcVgGeTAYiNELSibuRFdXflAM3Ul0tvBm/9Xn+KKO7ZsvJaUu8AiTF7zz
	MuXMpWU2F4nIgcYeM2eemoC5pqj7eNEOZN2N9EiZxOJsSf8dGhmBLSzgNMjNUko4J0Kus0nDZLZ
	BD4Jo1WAijQQb6KaPEwVx6oI6nAXGc73zlWQ2W2COMSqs9JU0UyCmpzyucewRzLrG5a9L2pVWud
	W/hWz9Q/HEljmVm8C+U2gl2pmYvPBXMXtPtTR3991+YNSselNFKG2mJlBjPGGeSmTd8MT937bRF
	p4Mjr1SyA1pQKZuxy3xUTznKUJhkUQUw35tFmPGNgW1RC5/PguQMsPkGcxyjz5mrRa3RkdF4+WL
	U8aU/O5TGyp08vY+ZR88AL69Y0W4NSXJKCCLN+o0TfJZDfw1I85sf1d4/DGkE=
X-Received: by 2002:a17:903:1247:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2dafb136bd7mr193207445ad.19.1788675518720;
        Sat, 05 Sep 2026 23:18:38 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:38 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 2/5] thermal: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:51 +0530
Message-ID: <20260906061755.5103-3-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231839_883273_F65D2433 
X-CRM114-Status: GOOD (  14.40  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 drivers/thermal/thermal_mmio.c           | 3 +--
 drivers/thermal/uniphier_thermal.c       | 3 +--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
diff --git a/drivers/thermal/thermal_mmio.c b/drivers/thermal/thermal_mmio.c
index 6845756ad5e7..b34e70991d3d 100644
--- a/drivers/thermal/thermal_mmio.c
+++ b/drivers/thermal/thermal_mmio.c
@@ -71,8 +71,7 @@ static int thermal_mmio_probe(struct platform_device *pdev)
 						     &thermal_mmio_ops);
 	if (IS_ERR(thermal_zone)) {
 		dev_err(&pdev->dev,
-			"failed to register sensor (%ld)\n",
-			PTR_ERR(thermal_zone));
+			"failed to register sensor (%pe)\n", thermal_zone);
 		return PTR_ERR(thermal_zone);
 	}
 
diff --git a/drivers/thermal/uniphier_thermal.c b/drivers/thermal/uniphier_thermal.c
index 1a04294effea..e451674d9709 100644
--- a/drivers/thermal/uniphier_thermal.c
+++ b/drivers/thermal/uniphier_thermal.c
@@ -286,8 +286,7 @@ static int uniphier_tm_probe(struct platform_device *pdev)
 	regmap = syscon_node_to_regmap(parent);
 	of_node_put(parent);
 	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to get regmap (error %ld)\n",
-			PTR_ERR(regmap));
+		dev_err(dev, "failed to get regmap (error %pe)\n", regmap);
 		return PTR_ERR(regmap);
 	}
 	tdev->regmap = regmap;
-- 
2.43.0


