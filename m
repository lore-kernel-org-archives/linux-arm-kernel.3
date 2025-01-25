Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458A5C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBxdX+pDRGBBw2V4lK1CenNQQ1raR5rv8Dl3DBVJp/4=; b=HWW8HI9NynxlH7h08tMgIiSP+z
	lWxuzc4XvXLfLU8zg3jbwE8o85kEabghQZyUo7i4zVUTqaF2OyupTHYSoQ740X/kHGGugNNaqEne7
	Wzc86wwg1evAB3+pQDk/OXx9I/KjILH15RCgmeyuMpq8EJcPYB6aTPNo2Bjfi6S2L2LaTFPVKMaPO
	ErsxydMeHXAc9h7iRhMxZ/wXfqJsCCe108lA3okmA2wvFpSF6zKAD9vjP5cb3ZjBHVULPccOr6AAb
	NmF1UJwHGYgMYZjckiBWD4/xrCADn0HeefR+isiiGhgWPDqj5AmIBEbapAePIToIXZPIcMfwMpn6w
	z3wmXIeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbbu6-0000000GGEC-1vHv;
	Sat, 25 Jan 2025 08:52:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbbsn-0000000GGAg-2Mdi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 08:51:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-218c8aca5f1so68498505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jan 2025 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737795073; x=1738399873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBxdX+pDRGBBw2V4lK1CenNQQ1raR5rv8Dl3DBVJp/4=;
        b=RTWS6mEvLxfehgvSNNXZP8s5VVve+A6i7Hojr6wyksHMphPfOZEsTmYv6Iikghy2G4
         r+/eF9HUbIBZOZCguP1G/APhJyQmfMe8XtfQHPDxNqCY+hQEHRJuYfHLsSFtAOSWHFdl
         bLTAVaPjenhJzvzCwbiwWdzToc0O4+cRmtpi04f5Us8aJ+QVl92rYqqLEq5PLEpxXQex
         abjy3Plh8FzACLZy2+pZJ/RFE0PX3GGCQKHVdDUz+cMFUTD40euVkoX04LRRUdxbz6S+
         ZuFMkfZlTxo2teEjeKHMTBNJJ8K3p3AhpU41BkVcJCbGK9nEOSkBritc8oTQEqdd4D+R
         BGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737795073; x=1738399873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBxdX+pDRGBBw2V4lK1CenNQQ1raR5rv8Dl3DBVJp/4=;
        b=REfLRE6f6UhNKpYE7D/31Ki3PKr8juDanPT/1BAWQFWwpNJMtw9cFB2AP9S9BlqCq5
         hI6NiffQVaVz+ea6BmBT41BVxyXPa/plF6v3TUsqj2PL3WKkMKiDj3NFNCRKWxlHnVIZ
         r/nz8q2YLWg8/zwfG0PZj01/nP7yiNzAKa5F5bXSnLoOI29ttV1yxpt4DTJAPxwcifju
         stEuU2R9gP2FJEcjdDvBhVWghIJNohoUDdklukrM51MbdIPy06vnTzguTXCcfSS0VDIG
         nPFEozhgpxaoo3KRFRYtSmq4iZZ1IHdIlDc08WD6cm7DrpF0FA+PtcXjq5XtqASA9d2J
         M+7g==
X-Forwarded-Encrypted: i=1; AJvYcCWmtu/nZRXkLNxXvpIZWG5Brd5N52KCDkZZCM9G4mAXiTXIj3hP9s63UR61W39I7qzGXerONyjAU426E5sCE7Za@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnym7uyQII7j9/JF6963yZ1ZOOVwT4uBse3jPnc2fc0miId75r
	xI2zPwvWGGo7NO2XYGF9MzNjlSYc9zRhJ7W8XZeq4MH9RaKNW5Fq
X-Gm-Gg: ASbGncv7DC2+SjF6w7EO71XvPFJgtWTtjvffaPMGaiIG1jnQdDBgX5P6nDHGQBfDRZz
	qqZmlgyl7sW2h+4Bn2ko/esoh+cwKq5ilxNXU1u9VF2wnqu3rf7vuaNZH7bMc18wPS2sDJBJI1y
	2rjRRNGYT0SPUiLETWaDXN5CNEM5lgzXq6gccWyYBlRwmLN9paNXgMMMueLQ6dquBDsF5p2/BDV
	M2E2f2k2WX+inmXBFDRtdJ85XBJDg5zG5l7mcygZcu2D+QsMzJM3UFG44bMSTGDpLPrQ1a+roZ9
	LIZWjl+MUsA=
X-Google-Smtp-Source: AGHT+IGYCHcPPJzFAwOLFsqByGZMJhSQta+6ueiLdNEcAg1/S285xQuqJARwbKjkKlRnBneHJqnaHg==
X-Received: by 2002:a17:902:e5d1:b0:215:6e01:ad07 with SMTP id d9443c01a7336-21c353ef811mr447000735ad.6.1737795072698;
        Sat, 25 Jan 2025 00:51:12 -0800 (PST)
Received: from phytium-Ubuntu.. ([218.76.62.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3bc4sm27860765ad.95.2025.01.25.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 00:51:12 -0800 (PST)
From: zuoqian <zuoqian113@gmail.com>
To: sudeep.holla@arm.com,
	dan.carpenter@linaro.org,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	zuoqian <zuoqian113@gmail.com>
Subject: [PATCH v2] cpufreq: scpi: compare kHz instead of Hz
Date: Sat, 25 Jan 2025 08:49:49 +0000
Message-ID: <20250125084950.1680-1-zuoqian113@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123075321.4442-1-zuoqian113@gmail.com>
References: <20250123075321.4442-1-zuoqian113@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_005113_623158_6317F8AA 
X-CRM114-Status: GOOD (  12.82  )
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

The CPU rate from clk_get_rate() may not be divisible by 1000
(e.g., 133333333). But the rate calculated from frequency(kHz) is
always divisible by 1000 (e.g., 133333000).
Comparing the rate causes a warning during CPU scaling:
"cpufreq: __target_index: Failed to change cpu frequency: -5".
When we choose to compare kHz here, the issue does not occur.

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
Signed-off-by: zuoqian <zuoqian113@gmail.com>
---
V1 -> V2: rename freq to freq_khz, change rate to unsigned long, and
update patch summary.
---
 drivers/cpufreq/scpi-cpufreq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index cd89c1b9832c..9e09565e41c0 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 static int
 scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
 {
-	u64 rate = policy->freq_table[index].frequency * 1000;
+	unsigned long freq_khz = policy->freq_table[index].frequency;
 	struct scpi_data *priv = policy->driver_data;
+	unsigned long rate = freq_khz * 1000;
 	int ret;
 
 	ret = clk_set_rate(priv->clk, rate);
@@ -48,7 +49,7 @@ scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
 	if (ret)
 		return ret;
 
-	if (clk_get_rate(priv->clk) != rate)
+	if (clk_get_rate(priv->clk) / 1000 != freq_khz)
 		return -EIO;
 
 	return 0;
-- 
2.43.0


