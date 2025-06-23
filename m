Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA875C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 21:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=; b=MtROyU+XkUB9TnF3Fvrr+hm/OC
	oi1iXiTd++PqXDCAe6+wV57akkp739Znjtczze5Tni4k6U33mhl+92xcIUd0+P1frWAAixkYs3WA8
	gPf13QonNE24AeIPpAB+cZtSaQpv4Wp4akDtojVGQ4Udt+hUptUlGZ+htfyVF8EviAGFnTOc2fJCR
	QxMKaJjzIowx06vH4Nkp+fE++mJXItcJS4kfHIBbJIL7c36PboSmm0Y+fCDhDWSQGn+83kLWwgQOF
	1eSOnnTZLYLAd8NvXJ1TqMBnE4PzoE3QVtTez1wlnZX7tk2XQ/2IbgfoGQZYbQjVjJszS8oEyZxPN
	2m00lL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToci-000000040Cj-2tZT;
	Mon, 23 Jun 2025 21:22:40 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkB4-00000003SCA-2VSc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 16:37:51 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so26558125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696669; x=1751301469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=;
        b=nfpTAQCHodya4Jle3kZb+NO7t04grZHamywEmRawqBkEJ+dYBFQ38mIvs1SsSAw14z
         J579Ot1cuOQxetpPLmUwdDFom+qejOz2irT2D+bzX+Mj8offxr0rA3+3VpQUEMmqAVWd
         LKvRIZldrbMZKw/R4wO7hpoMY7e1OtFVy0ZiwrdBon9pHV12x/3XdDs4/am6vYw2rBx/
         5MTZ33HWe3Ru6AN/tYfmisl1D46rJwRnynHd1nlXpGTS/aH6BQRsmn2uKuqWa22wS6AE
         CHu42cfXUxUPuBCLA9ZkODUH4yuXqAxrVditZtPJc66NVvl5djV1rXKzMjKrCLrR34V5
         jbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696669; x=1751301469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsxgOlrXfF5DThbMKG1kzcbU55xtnGyMNENY81j7+2I=;
        b=gjWbNhGRgs6Rm2YIQh2EEMJkps773C+VRkOl4oUIhgA1k/Q13LQrwA5ixjn8xHS0lc
         NT79rasBZbLCneDcTLmOEi0Q5NwVQQO2glUPE8cOpmp00y5xqkwRgFwfq4BQb5XCicAf
         YP9Ief0SPBQz9oXTwMKGavsQbs4cvXBMVHlTqBjfN803DMafUVi+ory348bjaQ+pQJ0c
         xGmem3du42IiVIFmlnAb8SLrS5XepKJU/qjS49G0RVAL9++WnWDEpiIwfDuzDPBa5mN1
         ywRkdtB+ACVFuGPPYodw97sWj1GDS/+DbF5FFH1tdY5OuUzFv+e5na1s/7i4DxvOJYc5
         cIcg==
X-Forwarded-Encrypted: i=1; AJvYcCVwX9pvs9PJQwbCRPOmorDwR3CkbVlllWsR7qb6pM2qce2wgR8ulOuj0bqdS+dJqhNzEyLtylQcF/ouOPXIlHnd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyie3T2U2O0kcuLh0C3nFpTfA9lGeDneWSS7QDECtOv/3w/dyJq
	CJk1fjUBv9Qvl49zJ11HBSbp6hxaNXL0Q7jfGJiF9BBekML2su2QM5ZiVLpcoRRdG54=
X-Gm-Gg: ASbGncsbvESMEybTLlF9YuhT51NyqcIqJ+mu9MKjBZj+LD5TCMfiA+n9Wuk3OdQdKXM
	Ua4Pv188gjmQHsqGocjhAlAq1E7B9NSI+Ja0U4Eo2ZL4UGfSdKsrPyNbewc/bABV0ImP9/+Hcba
	Ttz6YmuTHG3YH6WMN1VsSEf78wbpff1TZfae1MTI1otAkZ+3UREN+z9MiMc/oHMKlpzVORL0X8C
	Zn9x6rBvfvjzzkUNMacPbSWNs8th6c8PKv9kfjOpfGViMfE6nn9FqdXOjC1QG67BttJO/9Q/wR+
	gdQw2XwjLY9GNh80ur7f3VkrYDjjarrgFi20/013p+NRCgMbkwAhxg4+GKwaukdirf/jITvqBYS
	g
X-Google-Smtp-Source: AGHT+IFi/UBk2HwAnllzHqb7XPWGf9QFYR4a94bir3bwedo9/Llza5DcgNihEeICX6IArc5TRzULPA==
X-Received: by 2002:a05:6000:3103:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a6d13013eemr12059049f8f.13.1750696668742;
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 18:37:39 +0200
Subject: [PATCH v4 3/3] clk: amlogic: s4: remove unused data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-3-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lY/+jeINkrBTULMr0fgrgjWAsXe5te4CfoeDV9q3UOI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLYO0zm2Ij1fDff8rSEVAszTwR1HrjavXeaU
 0Uem7bF9VeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC2AAKCRDm/A8cN/La
 hc/CD/4m/uWRim24OFAgeUrpZSDUlhz+owSrV5ms30HqiIr49Tu/MkLik1fNxtOZoP7F3o7Vd9w
 I1ljZ786kW8PqUn9WvzghDsgbY2H1rmf7myPVPgO5cMxtzP8JXFozngMvwPnlm7xoZ1+6P0Bkdc
 PN47s/Ji69FMhx2JWbZVT/+0qfmpBKAlGn5Sbh2OOKCtkMazBWQRAU3jfjqLGpVpiQbwqVd8jPV
 gNF3JSxbQwnX8ghEC1HWQI4h/sq3w0UeLo68K3qGcJTLE3MSQARLwLdmn9VYdQqkKiGzGDrPRn+
 J3xBs9BrRzWyanNumrpOXqPnZADZHYudv5rkwY4gvuFWpMyO9KlcLiOvihX7nmgDrruDdaK7hkR
 bbQ1br1vNnTrPZK4A62Jkxj/z8v7A3KjL89I7RuBdBlVTZi1UfM511q5UtYXSPQMvYW/VNJWqUK
 MiueAteGQhWVE7a2BSwOKqlhQoH55D5JXdSS/xmcdYkTAj/g5Z455Z9oY00R4VzDcCxyeoiwEEM
 uJHCFa6zgqTUKmuka6A3+RdRpVg7HHo+qG6u1n/AYvNT6eAFgqyPxWbG3RbuRV72dJcNpca+mJ1
 4iNSzWhQuYvDOhufnvDkni/Yn/JiALR2mA9mC75E8Fu6x/LCJyq3tFDOwfQsOD6kH/RQUTM2bos
 H0LyBCHLEn47Unw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_093750_653682_A34221DC 
X-CRM114-Status: GOOD (  12.24  )
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

Following the removal of the clk_regmap clock table from the s4-peripherals
clock controller driver, it appears some clocks are unused, which means
these are not exported or even registered.

In all likelihood, these clocks have not been tested. Remove the unused
clocks for now. These can added back later when they have been properly
tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 112 -------------------------------------
 1 file changed, 112 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index fd2d4d725f9e2595a865909db3c0c598309ef448..c9400cf54c84c3dc7c63d0636933951b0cac230c 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3174,118 +3174,6 @@ static struct clk_regmap s4_gen_clk = {
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
2.47.2


