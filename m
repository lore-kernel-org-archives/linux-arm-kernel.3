Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88A3C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=; b=ckrnFXSptMRuyE+41FLH2/zRkY
	SQEfubveBrp+CXHz3ciFYxeXFT70L/3ow5yRlyZOgsU54puBK1dN9vzc4IVXwbumEuTKlR8CcAO6i
	0kMulpIv4RT6rpXjTrvAl0MwBdHpvdB/1O1oANujq7hARzsuPjCQXScBzd0piU5vVYsydC4YBeQDW
	u1FjaHT6+lSHHJi1kJOQ1XSJ8Xifbhn9+9bhKQY8+mkG9BW/tc1JHm+R4q4UZF1BPNIlBZlILpoDP
	JxqQek4ndwewGn2uLxQZ1O7PGGQZZljomIRZQYaRPhZwLKhQwb7G8BKHzxVJwqijh/chcvIC3uNn7
	Q11jBwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYopK-00000000iIg-2k6A;
	Fri, 17 Jan 2025 16:04:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYokN-00000000h2q-3ysd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:59:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso21829915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737129538; x=1737734338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=;
        b=bG5lDaBjpfB64zxHlnVFyX2y1pAXOYhOe7DrURJ1lb9TwszBiuWn2ONmyxwvR9ccAp
         FpKm/RntPdwfi1I4S03IS20zlHFj3MGyUXbJrAS7wAcURe5P7KqigDY8E10i6AQ3W1yZ
         ZGgQEPDpmrj2hQmG6krl2UUCJOfxNCV80oAKqiMytxFiRNzaw4d54wyl8exDX+tabod8
         Gu13On7skuhCqLby+w5ud0cYoxOAD8UNQEUdD0ZaDc5mxc0I1Hb+KXv7vAGeumf3PCuN
         tw93tA+QlJ+bsjJarHCa69xdGf+2KgjkGJ9Vw2kos23eq1DhdkNQD4hPcGd8ERrxm00P
         QY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129538; x=1737734338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZgWfYcl0Y7q7GLRHkSuwJI29tObEi0i8LhHvO7mET8=;
        b=T2OHFdZPoyCh/bOOYIZ7fGDLVLdkJEdgX4xBVnRUZEfIaHIsuMuldtD7doNDDrLxWf
         WX7CmlHvqLAAB0Bhuwl1312nOdOufjifnikQPcATbRyiZbKHLRNQipgyp099s7gP7d9x
         DusAj+iQejSRJGbwM3NffEe+NOJIccadwS4mUzqBpt/+20nJOH7f1igBGY3WtlPfNKps
         4cqtGlDgXPhQn+b3jCjzPzEDtqGtdCATC25XB4VtOBLaQKVQPjopbgKoJFfrXb1BN58e
         ynhdjdaId++C7Sg9A66eJ7kJO4p4CcOqDMSTsHyqQc9hGFhfSLxpWjBIY7qtV00NZ+W2
         mvtg==
X-Forwarded-Encrypted: i=1; AJvYcCU+FrXc1CJ9shxNnXDC8H8RI/NaN8dauVoflItsHDbzz7a2WQo3QfiYYMlELZGBnaDBCBBhpaB/O5pW7DRC9TzY@lists.infradead.org
X-Gm-Message-State: AOJu0YyGJjlwNmy1jAdPq8u0aJ+Cc7DfDC4Kx6x8h7SoNuRn6xzG0fHH
	sGC2PACWOH6+VgafzvYDE1eEeNldhSs98UrwXnsW5V2v6HoqiqaYxc/oskNq/wI=
X-Gm-Gg: ASbGncs5bXfw/bL1MDcrhr90o9lKDSclc4ra69I6fN0zBCH9z41HZSoIynanUxZ4wmD
	Roq/oFELu7x8BnKDnY9pqdxgBtJL7Tl23ooAZyvlEwT0px0v7gMigVNukhcaKhuYgdO916lsyIP
	+FPZMMceeDSV1UXBn+nG0brhMJx42ypsHYzVJ6T/Ew0G893EdL+sIZh03hKSmuAbREPyNLabo9C
	PmrGT2G/gIUSFeW0uZTha/TudCeO+X0NJ7R77uNJg5VabLV8k8AdL+VZqSmVsLNbXdlk7w=
X-Google-Smtp-Source: AGHT+IG1q33fs+KVW9RoZpITbOTAERwi/Qrs/bMhSVo+O25h9Rzl486JZ10j74BPtv3JPq3CtoOFWw==
X-Received: by 2002:a05:600c:3b26:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-438913cd4a1mr32341835e9.9.1737129538284;
        Fri, 17 Jan 2025 07:58:58 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b019:599d:2d51:f3c7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c7528076sm99382195e9.25.2025.01.17.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 07:58:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jan 2025 16:58:33 +0100
Subject: [PATCH v2 4/4] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-4-d1f77cb0773e@baylibre.com>
References: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
In-Reply-To: <20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=kjINnfrAI9Q/3kKsDXxY3oSmO93qEYxej4qAkFSN56g=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnin48q2Eofw3aXzoZm/XCT2+BvcA49CIxRaNuf
 GHWDOBwRaCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ4p+PAAKCRDm/A8cN/La
 hZCID/9JeS1XobTuZ2C7R9yy9weAaMjxw3YkRyVZznE6t25Cef2eTV8J5GScomUNOZUYtYe/HkJ
 MhLkGnbCPpLAW7gTinje3L3OIO68myR6euP3NLlYRMIN+q5IcNDbS104c5Yj4H2HvsW1GoKLlet
 dK8VtSmN+FZRbEMmR1JcoctDpt6DCQzaHFCqFzjqqYNXTrgWaAoLWpKdlTDc/lmx57pF5QoVF+g
 LTfSuo73WDGJosr+4utVQvqlkoBV7/3+cmubwwfRg0Ct/n4cH6WmD9vN3jbSygUq1u4oY9NJnLd
 6iS7inGwRhDW1ZBgstaKoUXQahF0N+nduQTDhWN2InROHU71cr1Nmt7hyZA680VvDOpj/yDduZj
 5rgY9ChsJy4Gi+BdTmBCp+rh7gR6Ro4G92KY2ELpj3jI6I6lADa6uN8LOqopz9k4xKNZTfnMthN
 gdbcgFYGiP+T9ywnrUlRa3QohUN+70cEy0rvCJQ+uYt/N47LVypWPE0MFG9AQatubPQegtQkC65
 5VBxPKL3JmugZuIjUIVRJjxQFF8KKihvcBNYfsTUhvduPu3zvfj4RtBwfPXRf2GdEbcwqon0Ljt
 eIQvXfj9mrI6KNi6zuXJQtMndLDYPnGX2y896qbD5BVdZ344gjhsl+0u8O1C5yiE27+u89vdt/f
 4tV3tRvB6em95JA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075859_999479_31C71007 
X-CRM114-Status: GOOD (  11.69  )
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
index 6a736e32e0ed8e2e8a37fbea94f9c5a90ea95fa6..853053b5f0689399a0224d263c30a985df6e1652 100644
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


