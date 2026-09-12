Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3BFC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=; b=LimZz2atZvVOXCe8EMSC6OFgRY
	xdQi1vHwCWB0WmeHUSmG60lYmodsBzP72SomIPO/9NoE0QHWyC6xEDR/3qOAc7GDx8Gn998nMElF1
	fCO3BMO3F+1AT4p/D+pH752b2tYlL2T7TbPIvpi3v6gJSK8QV+8jbdB5V8vXeI/lVPT4z6Vzq76u2
	jQ1ttUvwS9K9gmkluAT4mZeqCazMROKjB9WNMIvu8BNFAOWOH4yOL+9E+Z5v/g4imXErUhQtNSf1U
	iLPD6tLFx5muyH16f4NBvZlt8er9v3G8k25EkhJPfTO9hmkRdTF+SkUkMLIGBlzwC1uxCuVtZdkUw
	j0MTl/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9p-000000015zl-0Amk;
	Sat, 12 Sep 2026 19:13:01 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9l-000000015yO-0ZyY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:12:59 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so1644905a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240376; x=1789845176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=Y+5fJY1er/XQOwE87PfQZJZYSYwYznO8SQQxiw+qn6IEcyBz4adoV1uZnvEdr6bpmZ
         4S+eqXzpKfH6VgAeUxr3hr4AFiy0JGyUAkWsmlFB2T4GNHA6VLPbZR+26W+uriWRE5AG
         8xZHiV44+Z/Oq3K4nzjETXZoU7vNyu2RmUJkP4DgQDrorQyjUdrUux7ciyxgGWVqv27a
         cbWRUL/VXoTPDQSIvFDn4Snvm5qenFNucA2Hq6vwb/KxBofQMX09kLsfS/RSAZOhd/Mi
         FCJCVgV96caZAh9GAW5jZI3DZ2MgHx81OEkLc53Z9L7u1j0DNz8stQLznaVRoSKGkL/2
         JeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240376; x=1789845176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=jI4Bn3arDKFKIoZ4XLaJOnyUEfCXzohcWmk0mOcRvdO9mLAPR80L4c0BVA4s+AVjch
         FjZfG+7+oHsQoI5XIat3Fs/k6dlQnALaAHBvGtGTpCsCSF0Q0vn0ThXRH26Mf3PxNNRa
         u1mPhfbw2YzVsmS3OR8ySS5X+MAW8z8YxJ5qaTOmdAPHRaAEN1XPCVu9/B/O0VFbGVRf
         FRWtZs4FEHnA1Iki74bYmqKoaifW1VQrZynBPmEuhQeFRmjYqzsPwIqxonYKT+B2YOkc
         GPSLh9ed1+iI9Q1vq3XMBBvJsqXnpKgZ5opp1kDMyI5l91+l66mvrmNYJ06ny7BZT6Id
         whBw==
X-Forwarded-Encrypted: i=1; AKwUvBza9SuO2wXJWNTSxmBsUhzwcbXaa79fZfBgtxEOd5HtlDnYQZtWjnuT+UmrNSnP5bQEyo6hnAzU7Vx6FWPqT767@lists.infradead.org
X-Gm-Message-State: AFuF++lRO93VXz1dHhaUih9GwqWfWny/jmXgSMMSUrY20oXldbncBua/
	phZofdaGgItT9c7w8SFno9Zg+IrKMjIOV6yFHfc0cwWE9MgiVpF2TZoL
X-Gm-Gg: AYBFou3UMyQA2lT7PpbGMoBHt4skH7/XLKIqJ6EnnrJSOLtG2pZDfm1Qo3L1tRVhIes
	uDsWqkFp4Wwb0aqRbipRXo7VCglgYWLihJEtfLQkGpwtCbPQnXAmnqrFiPGgxi+l903qZkZlXLK
	hxUOYYcfgtW2XTyyc2Sy1rBaEELK/JS5KxgYYCuQ9SmpoPFCDODMXZaawIqZgFn+IMNqy+C1kW0
	mvbODQ3dzAhBnpXTggDin9GUfpSBmf1fWioRZKz+3qLlwIX/V/fcCnMbFCrCh5KxDNqKJ/5Esno
	xqCbpe9OIUOPeovABWQN1Lm1ag/WGip2X1S7uzMtXlG1RoRJjF/+8SlGMhIAWlfrRcM1emx4hLp
	hr+wzDhuJXqobsEtwQDVPpLwQcPMN7u9u++qYnFUcKqzfIcNzT5Pntwc3/NKhrhQ8GBH5zL/6tW
	riwCI6Pr89Atz6iBLgCvLHycARQJmUvb4R0bnwl4SteXdeUyM7xiYrBiG6J4KYUf6/dUcH
X-Received: by 2002:a17:90b:5745:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39d9bd685e6mr17887143a91.10.1789240376247;
        Sat, 12 Sep 2026 12:12:56 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:55 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
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
Subject: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:53 +0530
Message-ID: <20260912191156.185448-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121257_183312_3D21D0E5 
X-CRM114-Status: GOOD (  13.60  )
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
to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
 drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
 drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
 drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
index a8e35bc75fb2..389fff5e6f65 100644
--- a/drivers/cpufreq/bmips-cpufreq.c
+++ b/drivers/cpufreq/bmips-cpufreq.c
@@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
 
 	freq_table = bmips_cpufreq_get_freq_table(policy);
 	if (IS_ERR(freq_table)) {
-		pr_err("%s: couldn't determine frequency table (%ld).\n",
-			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
+		pr_err("%s: couldn't determine frequency table (%pe).\n",
+			BMIPS_CPUFREQ_NAME, freq_table);
 		return PTR_ERR(freq_table);
 	}
 
diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 80893844353c..f767898ebfb5 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
 
 	kworker_fie = kthread_run_worker(0, "cppc_fie");
 	if (IS_ERR(kworker_fie)) {
-		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
-			PTR_ERR(kworker_fie));
+		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
+			kworker_fie);
 		fie_disabled = FIE_DISABLED;
 		kworker_fie = NULL;
 		return;
diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
index 42edb41ad459..0652e5df0278 100644
--- a/drivers/cpufreq/qoriq-cpufreq.c
+++ b/drivers/cpufreq/qoriq-cpufreq.c
@@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
 	/* get platform freq by its clock name */
 	pltclk = clk_get(NULL, "cg-pll0-div1");
 	if (IS_ERR(pltclk)) {
-		pr_err("%s: can't get bus frequency %ld\n",
-		       __func__, PTR_ERR(pltclk));
+		pr_err("%s: can't get bus frequency %pe\n",
+		       __func__, pltclk);
 		return PTR_ERR(pltclk);
 	}
 
diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index 9cef71528076..9a01592425ee 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
 
 	policy->clk = clk_get(NULL, "armclk");
 	if (IS_ERR(policy->clk)) {
-		pr_err("Unable to obtain ARMCLK: %ld\n",
-		       PTR_ERR(policy->clk));
+		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
 		return PTR_ERR(policy->clk);
 	}
 
 #ifdef CONFIG_REGULATOR
 	vddarm = regulator_get(NULL, "vddarm");
 	if (IS_ERR(vddarm)) {
-		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
+		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
 		pr_err("Only frequency scaling available\n");
 		vddarm = NULL;
 	} else {
-- 
2.43.0


