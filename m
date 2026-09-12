Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254A1C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=; b=GDRQK9wPvEj6W2nN1ZBzMCbtk0
	LyoSm2UG4cb8mfIopsJcDE55egHQ6SYu6n4oBMtWoKRro1uLw6pR0g4A5LtP187Ny6lk6cwqh6FyA
	RJuicJQekA7OrEzEV+gVVWKuXVFlFActOFmZIpL1MDdWq2V8sdwlYCxnuIzdOdZBrnLA2qsRQxTXk
	J50F8pwF66Bj9SQLm1GHpbyx3fFUBXyZEI5Wpz9V3R9cGt9ngJMKviBZ62u+ehrUpwr0ygDnH8MTV
	gDaomEZWGqJ8CldeuO6YSFv8+SMoBdZ3c3FxNw1jcoeIPXbs0EposYxs8h45QUYrvYF6VZdT9ZvL4
	cbnv4DSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TA0-0000000165t-1C5t;
	Sat, 12 Sep 2026 19:13:12 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9x-0000000163w-0c6e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:13:10 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso839183a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240388; x=1789845188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=dAtSSGF+nitKtfe1If6jV8wLF8bptcb+t4IkEI0Fs/R4gepRjxI/Npy2zVd5hixVSV
         s0ntLomDuRCasmc8bjcx1X/vK/25G/AwtAvE2haE4URgo4zaodiVfgaxZe9EDOa1EEFp
         q5vEmyr3QXi5GtdhRLgNXTU6xu2YK5GT18SW4QNLTu6GPI1MV+5NTv+vvgHiN+egHeQE
         o+O349uQd+u51IDe9n+DEkn+sYw7oU6AuOrNJZKzZSO8QNE86sFU3tmub6yf9i3SEatU
         /mMi4KIXRs9KgOT8xFoGpfvIUT832QdRyLsEJwFJKSTbI1pnh3dTNx3gAcs50HK0ncDt
         vMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240388; x=1789845188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=W2/hUGzVfmLJUSTFBHNVFRfa4j9cccPxLJ8eTM1WXImeCx7eFQKXwBVM0hTjeFr3Pa
         O6dOlbW7mznc+0hFzJ6+6dvJH4RX8FaqAicjsVX8QhNW/j+7OTdQwgc4K4yMaf3UXBNk
         gQiLHvaHjdpXxDPyoZuGyiKJSNwkaeWYNGVuIKQCS3e9fzyz83pWA2tYN4nOdnPUSePw
         /espJB5YhLOZMKRgYR/hZ5W12JnSZVezDjkoTwSWNQCcOFZ52tr3s6Zkkcjw8+FvBgJl
         PYznyZ9YkOPA91QBE5Sa50jNFSyBcu687e21FjNhbmqMVtHbnXmiP2fqm/RoVu0+UgE5
         ntXw==
X-Forwarded-Encrypted: i=1; AKwUvBwtJj+jC4hVTl+pQcR80Q0Z4wqyZZp/7fJDTEvLZvs/kqeeIMsbGFAJOWTYuE3wRxEnostKlF9wk13zWWrpfUvS@lists.infradead.org
X-Gm-Message-State: AFuF++l8k+baaab2EQJdS92W0bhAdCctiKh7SmIieYOMQNwdfyA9rT5R
	jghreOFCkhMdR5EC+T9pPjjCEjd6mh18HmHsrN+H5yENJApWzasarHGv
X-Gm-Gg: AYBFou3HvRrScKJBK/0XRouICgWlssgrXfnCfLe6CPLI0ZQvoV7P7Ooi56KMN3xxyFB
	dTxhBXTE/G2xqcSYNaNNH6RIYjbOK60C/90AFFaAMObVQPFpKZRacmeAPB2ouSIpbPMlg4JHkAE
	BIVCI6b2GKaJfsDaG0A9R05gk0rwgOABw7+iNzE6t/XeEQmtra09OoeZa9cGbJ1C8ZkcLizodgI
	aiIP3PmeqNwOhhBsTbx3ZAggTK/lHZgVQ4wTQ6Mbt4liiNfmd5T2cBzFftFzf/WISo2xw/xmRyY
	BEjTtJVLYlslbNSepEcfcb4aoEN0ziQxRzL1dGmIT1pGRGAGl4q97b3CkW22WOvw0p1XXxb4mWd
	5/hd/IZEwCqQaIf7htAt7so3t0v+QbiAjgQAAQWZhpPnSo5c/i+RTtKutAaX6xw6ZMHSQfaFJaF
	5dZXH2yFY+IrPNGUCbsm3Ic3Yo9TSygvDAvUxMHdSJuQzAN/WcUKTxIaF/5rymp9Y+ixwZ
X-Received: by 2002:a05:6a20:d807:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3daed15f5b6mr20435411637.8.1789240388372;
        Sat, 12 Sep 2026 12:13:08 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:07 -0700 (PDT)
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
Subject: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:54 +0530
Message-ID: <20260912191156.185448-5-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121309_355489_765C5F47 
X-CRM114-Status: GOOD (  14.02  )
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
 3 files changed, 6 insertions(+), 6 deletions(-)

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
-- 
2.43.0


