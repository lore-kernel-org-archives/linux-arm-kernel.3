Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9B2C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=; b=yE7ygys8pNlj5spYC3y5xEZyhR
	V96Xo9ynrzkDZfWbPFp6jqTNBszNcBoNmaZB6U/X6rU8VLWu5WnZNgijINGqE8Lo4E8Bb0y6ZYN9l
	/9GSvncb+U7cywmG1RIAkcbWVGWkN5/UE13Y458SbFxmOxGVt4qWB5b9vR5jrvpe7D03hMpNNDNIV
	W62JnGdkowqdeEnzHOtLKZEZU/XsPz+Re5pdkGDkiemYoXY53zfn2pyCPW+uMTKHSzrPOIkuj1NaL
	Qpkwr6lTWefHC0cvciznkpozh0iEv3C8eC4Bqyhsuhy16HkXaij1LTde6uaT2VfwFviJ+MkPZ5ivE
	dybQFU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DO-00000004kBm-3Rdn;
	Sun, 06 Sep 2026 06:18:54 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DL-00000004kA6-4BCk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:18:53 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso1849974a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675531; x=1789280331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=B55SyVRDqYVJGJdikfKYj0QLLzwkuoiUIv8LkDLjYOHs4On+YN34Sa8XpQvlJCVHIp
         N5DpR74HKGCeDCOEsBkMPJPCjXjmRwzxDGRM+cBUoNEsUE1CGCctEfHYEozek9Ye7iiQ
         fDMSzlm2pIenPmsBOY1jx9528wLHMtJFevwQY3ryjKbn7x0fyzzII738DPqmPw3h9Egh
         h1niUCMspEO1adJbiExRaXAT8OM/vtt6IdKZj2nHoObNwUVSz44dvLlD6MrRC23aRb+q
         1sAmV/U04XDEhWW5du21SlzHtLSD8HpsnVv4vmA96ThJNLvcINjEFn2pJ6KaycekfDHS
         sa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675531; x=1789280331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUZ0W7BgdhCNDmsYtUGV+m5Ja5WSQeyPJ2CLwoaFY60=;
        b=cGxXFCTuB7SaEWPjnxjo1GpmxKyz+P6NlryWtB+OqZejPk740cXXB5kIEsd1uApQvh
         ku3pmmHRIKfmS5skpBpikFvGf1XBkHz8QE30crKyWjg9aFANS+dQmiHmRPL3YvYmTEu/
         HXEkFJUca6JJWFOgW+g183Q7b77ZKc71Bye1eqiNRy6dOjb2CnfhP7xrKAp3J1kAC0p0
         InI22vXmpMvooQsCz2TXjOjTrC6+w5Wxr4//FoOAczC5gpuSIS6O9KggonCZZ0Hmuyii
         TkuyD6UiiTWZK+P5iQBkru1tlgMEzhYkdrMdK/H1WUEIUvJhme4COFvsA5MnG2HqL7wb
         Zr4w==
X-Forwarded-Encrypted: i=1; AKwUvByqL5FHrCg2IOdD8wIqYyup5GxU1NnvyxnetvRbhv8QouZCCccsBSVW2NwQr3lmfyVc2z3/EMRjPWIKImWZJLR2@lists.infradead.org
X-Gm-Message-State: AFuF++kOwGm/pvoK0wiSsR9IkHIVMTjA+28tJ7+P3rs1YlFBiPG28nIp
	Soy0wnpK7bu5zfUM+Y2VEdirbww30A2PJl+nrqZ5p2Gd67dkRH7dvvU0
X-Gm-Gg: AYBFou35ko1zhcjWMVXaD3xL02/tk+kitKj9zg3t+VoWaR+g/HljdTzc8DmNYnVkL10
	ZMog8Lk57uR+1fqwUCPlqt6GfaZDipZePaVAGTKGBPm9OPeTMEiMmYTFnsYtcWhpkuS1X0SOiea
	tdLabtzIfp7cs0oXNKfTOqitJpK/MV95uJuvJEfEv6mKkZz6KlVaHpuLxenY4lxE1xAk3/r5K8X
	70On0sAQx9Ltn3HTEbqdJWfiSxonU+Fh5YaVs2DGVvPX74DDvrxxdjTTfK9Z4eEkfDd9Ju1GGuz
	hnDo6UNddC+9T9d255CVR2laWAg+azA9vYOgygD3lDIzDXcPMkaXOGZM6FfBNfQ0FtIIDPWMDkN
	GBwIUs+cJCpDKKoSjQq1lk3+34ljs2xvt4tWBVtEIH9N7h+B2kyGs9g78akvuCOCG51qh+CcraJ
	ShP7+fUjuWcdFjWmHW/YEBqbrCmqwGtK7c+2qz7Nlt+lMkkL0bPaTVMexXuF4cNF4Z4Zq5+A==
X-Received: by 2002:a05:6a21:6003:b0:3d3:adbf:7780 with SMTP id adf61e73a8af0-3da3a16a4e9mr27908167637.21.1788675531001;
        Sat, 05 Sep 2026 23:18:51 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:50 -0700 (PDT)
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
Subject: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:52 +0530
Message-ID: <20260906061755.5103-4-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231852_046118_037291DA 
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


