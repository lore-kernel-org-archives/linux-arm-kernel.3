Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FDCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=; b=cvV6nX2uuz/y01iu/gqDdVgHUz
	IzsviTP23cU6cv3XxDjt98zTEdZu1e5zgRZUvhzD6JBt5YETtc9kEkBOjX/NIZXY8LfPsQ8nTjDQ+
	y5mJXSqoMG3r/h3/mKeOZ9LN38beDW+e4mni9nO9/owO52vW2o3oudB70X23ZAVRcbmKwjEmQno8P
	br9rdY9vGJsgj+WyAQv/XCoGZmQGK++SzwQ4UjRZ25XQtNiW3VdfewSPkhNBU7Y5cnkYrRJi+vUVL
	XDIFYoFBQ4XJKolNfprW2i7UlGa6/znVjfpsaKDRM05L4jmFaTBH4I/Ony1S0K5bLrBwSQzM2VKFf
	C9eYqaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgxk-00000005fZo-40tN;
	Fri, 20 Dec 2024 17:38:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgdP-00000005bWW-1h6q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:17:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso15894665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715073; x=1735319873; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=;
        b=zdGpSvETjTiCTobF0FiztxJUL8IRTebJbj0jPAnNSzo4YQkrl2QipT5eKOSCmgwef7
         LEPLZxhq0FbL9tPzlkyaa2hLgD25U8oQmZRrWilxQtuzkXD5Sc+Jax/SWZE2YbxNCN4j
         kGuZULIa9e8hjFdmq+opruPWkNwXp7bmY+HI6DUzbUOoaDBUihDpF3WKzyDehdKVoIbL
         zShw5jBeIQOV/hItd+9g24r2a3IsofEHatKFXzIDDab2mqLSPniGMmhaCWRVGRzwwaFh
         tMd2NTSs+glEFG8aVu3Z1ZbYOGQRAiT3lFMifUTloY+lWL9HwbAp5CdnGx+dXr5HDDX8
         nLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715073; x=1735319873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cgs5QNP7O8iugv52YTWDU3oFoGi5v9FMjpGDuCdwf+k=;
        b=f1J1V4J0hV7awff00f6kr/HNbsF6naGnsktqrJ+kAPlBBHUwmZdueHydteuPFKrkDB
         bwc3tePMsPCm3JyjKutZZZgvBEL1DE35wOQzeT91ONpKefzrAqAXDI9JuYxfuWcMm9sk
         shUsPd3k0dIWQfKBy9ibgokk9uuI5QITKfCADhY73s0k5r2AcEbUF9ssuU/sxQbpLp0t
         Pp6+6BmAp16mCyN9uhTE26oS+t1U4mCp5F57NnalJpxnmqfqPZmZzc4sk+hXK9JHGYhh
         vWu8NI0Ny7O+guFfwxdakpThsCdZBhQqZEPbAvhhRKXzqp5Q6fRQlFvsNyvEqJnrPZo9
         uz8A==
X-Forwarded-Encrypted: i=1; AJvYcCVfYN6k6O7Pzz9tXQwRdTAGU92qbNFLlye4BcU80OtMcjsUllBJnTiOjpoQvDg3Pz7nYqMLqc81qlFxXtVzvK4l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3aCDbBJgRcBEG3/50mfBnVYTeQ+/SsAp5s61Ec7NExFmZ6hmZ
	vPuqISetimPW/v+fbbB9OY2UDoNv5LxRClLw/rDTz+EFiRbZQHUGbqaKzWebRhA=
X-Gm-Gg: ASbGncv0JBQj2q+U7a+QFebHiMtYzL/milSe/2Hbv6PY9iBOMJ0sUlFZPSERRJAi98/
	jAtwuCFnEsBJ/mxdL6zO1hZNIoI5fVYNyKqNwDTyjRDpodFN8yAUE8wCtrQ0dzqKgxKX0JyFLzw
	vCrpl5Ruz2U3pA013+BTrPnLaEYiMp7MEBSItDZS1/6uPDF2teqa+NRCb5mypUycw1G5nGB7/rw
	sepnXeKQLl63F5vDSplc6b8IuOJZEaYDiVG3ubUpYLy2EdSmP8+Sneu2Rqw+YToVvXQv8A=
X-Google-Smtp-Source: AGHT+IGYlzQLR4J9adpke1hx6AAFsWeyzGPiUR+SyMcWO2IVMtoisGzuqWJuHjjRKM9zNCOgImfvIw==
X-Received: by 2002:a5d:598f:0:b0:386:424e:32d5 with SMTP id ffacd0b85a97d-38a221ea939mr4106400f8f.14.1734715073465;
        Fri, 20 Dec 2024 09:17:53 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 18:17:44 +0100
Subject: [PATCH 3/3] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tvh8JlfNuT44ThrGDFE2JBh8kT+71CwmF8GtX4Rjbzo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa8huQnimyWNluiyiI+CqSpsbYXDeVZSFdL+
 Ho18RI74oqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmvAAKCRDm/A8cN/La
 haBXD/9AGOS2JTSDO6JJiE8kB1oiX8eb7GTQH3ESwZO99Ez7orpE9CFgr4umREPh6u+yUUQIIsi
 VuJW6e5VJoBA4G6Ueh9SC9IFQF/u5FsG2KGWz18UCo+u7mCL8A+OSt6yZunQtV3uMplGPy9+O+p
 q52jusn0iNnjqVM3gtuBYcl85n4c0FkUhdqpac0rsedIl5KdIrCKe3d6ks05QGYab+exnrWQMNa
 31zoRaSJ7JL2ljimtgjMjYloq4h9XlsrTII/JK1kbHCePAuajq7RLrRNjfri3OQJglSUNekRorz
 PFAjLgfdfFTeIa7f/jshO04/RaSMl6jUcSJNLGLxvJ4M24v5jUPmNeDL7HL0UFpcmk7PA25QOi8
 c+Kqfd5GPduZ6s4SI1Dp6THKlPH+n+CuVDTvwk18mnvOvjPSCJMNFIJByEkWmx3rWcW9nJ5SKWh
 XyzvmHaUg2p5jOm77UHUnE2TqR8lAtQ1IFPnM+hcTrJc9FRHyDnSFKZetihmgnUNOoRGf8p2b3W
 VHjgPcvpUykOmIJAQOdUjYUVxDxtQdSOs038LZq5BSpTggX7zsAmXu5Bhr4Iw5MGapneO/VDUhr
 WVxqUruSDsT6SyNc/ABvI4PSj+nQmwKsZRrEbhsz2GKyOVCugml60Kf+thdSZg87fW8MVPj9B3a
 xJKiAoUM1rwzd7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091755_489744_4194F3CC 
X-CRM114-Status: GOOD (  11.15  )
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

Following the removal of the big clk_regmap clock table from the
s4-peripherals clock controller driver, it appears some clocks are unused,
which means these are not exported or even registered.

In all likelihood, these clocks have not been tested. Remove the unused
clocks for now. These can added back later when they have been properly
tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 91c7b10c2b68c626dd1d6164ea855370aae71485..72b990fc0de8e4e2c83d0fc3b4c6e3fc1fc96367 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3129,118 +3129,6 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
-static const struct clk_parent_data s4_adc_extclk_in_parent_data[]  = {
-	{ .fw_name = "xtal", },
-	{ .fw_name = "fclk_div4", },
-	{ .fw_name = "fclk_div3", },
-	{ .fw_name = "fclk_div5", },
-	{ .fw_name = "fclk_div7", },
-	{ .fw_name = "mpll2", },
-	{ .fw_name = "gp0_pll", },
-	{ .fw_name = "hifi_pll", },
-};
-
-static struct clk_regmap s4_adc_extclk_in_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x7,
-		.shift = 25,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = s4_adc_extclk_in_parent_data,
-		.num_parents = ARRAY_SIZE(s4_adc_extclk_in_parent_data),
-		.flags = 0,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 16,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_adc_extclk_in_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 24,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "adc_extclk_in",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_adc_extclk_in_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_mux = {
-	.data = &(struct clk_regmap_mux_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.mask = 0x3,
-		.shift = 9,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_mux",
-		.ops = &clk_regmap_mux_ops,
-		.parent_data = (const struct clk_parent_data []) {
-			{ .fw_name = "xtal", },
-			{ .fw_name = "fclk_div7", },
-			{ .fw_name = "fclk_div4", },
-			{ .hw = &s4_adc_extclk_in_gate.hw }
-		},
-		.num_parents = 4,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_div = {
-	.data = &(struct clk_regmap_div_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.shift = 0,
-		.width = 7,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk_div",
-		.ops = &clk_regmap_divider_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_mux.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
-static struct clk_regmap s4_demod_core_clk_gate = {
-	.data = &(struct clk_regmap_gate_data) {
-		.offset = CLKCTRL_DEMOD_CLK_CTRL,
-		.bit_idx = 8,
-	},
-	.hw.init = &(struct clk_init_data){
-		.name = "demod_core_clk",
-		.ops = &clk_regmap_gate_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&s4_demod_core_clk_div.hw
-		},
-		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
-	},
-};
-
 #define MESON_GATE(_name, _reg, _bit) \
 	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
 

-- 
2.45.2


