Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=; b=OFR9kCKgHnM8+Yfi9HERZS+XpE
	Ql3wyxtle15HivWKhA03U57HWqDD4JTIB7NM4oL46+Jy4/8Sk9RU0Vzp+B1bAkKeQPqR3mLTZbSu+
	4qDWlVYdKKVGdr6mUgg3lHBBSCGsxjYT0VEKOvpCI3SN3YYooeWMHU8RpitUCqYu2epyyFEMXX8IC
	JuJjpjnXUJKMfQGM1Nv703Fx3JjXOjjXQaMYaDUbKEdO0ea1AI5VoUxptcRk9Z6fMF3FhmKEdOkyQ
	Yr5AR36yzGdIG1qlZQ6Ys51MdX1pzfMdaapdZ+VUZUE2q1o6+Cf8Fk4l4u89h0nQdcenxFXsYsJCP
	3Dj9pO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqh-00000002I0J-02F4;
	Fri, 22 Aug 2025 11:22:23 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFXl-000000011A2-00vF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:22:10 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7e8704c52b3so176450585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755822128; x=1756426928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=;
        b=fe9Ey2BOKS9f5bkWaQC9uTQvEudHxw9Qr/hAAUFo55AHuQz11JXS3k1Y2duUTuX4cV
         7iPvnSboC804ZnTWLcJCXDfuN9h3rMe/fiTDUT1mCmORb6bCEuWPNIJWgWj6bT9foVi5
         EUwjmzXhX/fEEDehbogpjoiOWgfS1iwlBgPDR4AbrjqZgcQAGKsPZpZwBD9s0ZwXQoMc
         R5ZJZqHN8NLTTH0UG2EapAKppiMWsYjJNzNGMeyqcS4dARuitoo6ADi25xwcUBCj0Yir
         AM39cfNW0Jk9iObwvo9kXBbp9qGrSnbkaBrtZnXk0eJstQFMhNz466Wrng2+EZJFrYOO
         Vnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755822128; x=1756426928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=;
        b=eqRgEQCL0Ov6AV89fM7DDcuUSejiE/KSIpM+krbYV+Cn44hoHcyO5JrfLpANMQhWz4
         cok2F3wSsGJyRTE4ohuP9/S3mUDO2nUB9biugFAykoIzWJM45nv6jCpLNDz54J8JA6lX
         W8aJK1xDQIJVN6CQb3YHqglElKJ4PKrGFvi9BDskmeZTkUBkpG9U0X1Xv6wSntIx1f62
         CAsNl7zhiOw/K70w421BWscCxLLhxKuh7e+7h9vkR0SaNQFUzkhlBK7NAGU6s+dYzgjA
         Yu5iV75xrW9KB/INgJvjnByAjrEZoSv51HiLDh9AbEX4DTX9y5k0zzfvKG2D6QCzPUJ/
         bKvA==
X-Forwarded-Encrypted: i=1; AJvYcCW5UR2dajMedRir6gYOcddzrF1v3UhBbtX/JSlOGzNb1GAxjoaX8itOtdVOKOh6GTa+kRDZ576/7tc2JP3Iz/YQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtiW+sKgpvXBrloijr6zbNZ1uUjcqofoFbDSprZqG5EZyAtF1
	fwZXdwvrd3Oa3RTMVbtBvy0OOTW9jJfxMgeXw5MsAHN5tExVWCMKJmb9Nm0MFrrujA==
X-Gm-Gg: ASbGncuyOENZQ22Nk5aLz8hu0qHayvaDJKSRcUHh2yuXQKJtbtKvkV5K/mP1KRZxFrI
	QiUxPzw+hu2PNBeIveLA5E89RllQBlZZ2GHZpd73IWB4Cv7DKiYhtXEJyeM3r8FofIrU98u0nUk
	YEmBBXFWIwEJ54A2jn047WtDNZWwTY6MIsHXu6QeRqJph82Gqdf81Bp98FwTJtUZcBscwESXjsi
	tyIW0AVfPKytbItJOxnx1J1VzpeniIxkpZ2p73x7+eiqLm+o1ApMybYXTLuVSj5nBGSP5GZHnn1
	5mH0wIGPkYroc0rkgLUQgCj0aO72Q6vTz8zqRSMDDo7yQ5zsYrmwTiq3Bl2tlTo2U/B4jjHLYl1
	EcEkE4bkYaAe68lAKA/hOZjM1QyeM9mlwnNSrcS4o
X-Google-Smtp-Source: AGHT+IGHm6rZ2RaOlXfMgFSf4U8z7KV1Q+DwlLKsqiFCn1DG+L7TJ0TPCwJKMIb2sZIk+AiQv0UV3A==
X-Received: by 2002:a05:620a:3195:b0:7e8:2989:1149 with SMTP id af79cd13be357-7ea1103a64fmr184064785a.49.1755822127818;
        Thu, 21 Aug 2025 17:22:07 -0700 (PDT)
Received: from localhost ([2607:fb91:3b82:29b4:add9:bee5:e413:378f])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e87e075df5sm1228228685a.30.2025.08.21.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 17:22:07 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>
Cc: Da Xue <da@libre.computer>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and hifi pll
Date: Thu, 21 Aug 2025 20:22:02 -0400
Message-ID: <20250822002203.1979235-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172209_056179_5A770DFB 
X-CRM114-Status: GOOD (  12.96  )
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

The bit range 17:0 does not match the datasheet for A311D / S905D3.
Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.

The frac field is missing for sys pll so add that as well.

Patched:

+ sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
/sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
996999
500000
+ sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
 hifi_pll                      0    +/-1562Hz
 sys_pll_div16                 0    +/-1562Hz
 sys_pll_cpub_div16            0    +/-1562Hz
+ sudo cat /sys/kernel/debug/clk/clk_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
    hifi_pll_dco                     0       0        0        0
       hifi_pll                      0       0        0        0
    sys_pll_dco                      1       1        0        3999999985
       sys_pll                       0       0        0        499999999
          sys_pll_div16_en           0       0        0        499999999
             sys_pll_div16           0       0        0        31249999
    fixed_pll_dco                    1       1        1        3987999985
       fixed_pll                     3       3        1        1993999993

Unpatch:

+ sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
/sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
1000000
500000
+ sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
 hifi_pll                      0    +/-1562Hz
 sys_pll_div16                 0    +/-1562Hz
 sys_pll_cpub_div16            0    +/-1562Hz
+ sudo cat /sys/kernel/debug/clk/clk_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
    hifi_pll_dco                     0       0        0        0
       hifi_pll                      0       0        0        0
    sys_pll_dco                      1       1        0        4800000000
       sys_pll                       0       0        0        1200000000
          sys_pll_div16_en           0       0        0        1200000000
             sys_pll_div16           0       0        0        75000000
    fixed_pll_dco                    1       1        1        3999999939
       fixed_pll                     3       3        1        1999999970

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66f0e817e416..f78cca619ca5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
 		.frac = {
 			.reg_off = HHI_FIX_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_FIX_PLL_CNTL0,
@@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = HHI_SYS_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 19,
+		},
 		.l = {
 			.reg_off = HHI_SYS_PLL_CNTL0,
 			.shift   = 31,
@@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HIFI_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_HIFI_PLL_CNTL0,
-- 
2.47.2


