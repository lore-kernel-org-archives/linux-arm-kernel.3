Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2E5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6hfLsSuXXkQW+oQprMpqK3KHzdpSf8DxnzIWa6RWKI=; b=3PamV6//OjnlUNkslOAeo4z+LD
	yX0PwurK95hFjjY2Df0eww9icOiLo0E3+z3vyZPUd7LbrmQqAMTA2w5VfRKGf8a9aMhIQl8kg1oFK
	vDy0r/IdWPyeUUBtCFVFCSGMNGK8sC9ZYT6Q6roE+RIDqe9dXnA4J/5jAIDyPolm08g7FOi8lttXO
	HoiZQeXXHKgeIskPyd1t5MHBnq6RpP7n38Ihk6R3JpqUxoghIT3e+AfxrnzCHPZih5KbkvafWM3e5
	8rvtHFrgrWwBuSR9JHhW8gom2UdmH2OwZ3PdC5LrO5G4bHJ75YN63fHj3i1wg4UgymBTbXY23IXyP
	/TZO41og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSKl-00000008nIr-01NC;
	Wed, 26 Mar 2025 15:06:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvS-00000008iXH-2bmp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5290904f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000013; x=1743604813; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6hfLsSuXXkQW+oQprMpqK3KHzdpSf8DxnzIWa6RWKI=;
        b=AmNkgYzGLeE8ZeXTuGi3te0ef2zwzsc6H/EksGunXXUUTa98vq7Nnz9wsF/on16CjS
         XgzPrsy47uRxV5ih9V/S8fqKSSmfbya1IEcA+5oj9GH/48ggIMU0ADqma9/G5Ye1N+Bq
         azNxPC0heiz7ux8ShFa9fW9wYoMGvFljip2CXFoAI0jZGC6DG55llImNdp+/xrMbYH4I
         wb8UHWPNIHcETT2t8l1hi2UvcHzOs4smob8ajlHZrYfQrBko6vcW9fb3IGNc5j824caD
         v6YaiMbcxobfQbKSJ1UVv6/hnjrHLNMkpmKfhuDmAmHMJRemCgq/W1ioIFffN/hYxMkY
         8UzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000013; x=1743604813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6hfLsSuXXkQW+oQprMpqK3KHzdpSf8DxnzIWa6RWKI=;
        b=xIV9jSLtjD32OChVLDp/zh2brsIMQ7Hvt08s63oZ63Yj985LGc/Z+ROxO+YYA75mlm
         IoAdklC5U5eLo5JQ++tu97SboO2BKRPlrGfuZkDesAOb0JBE4mKqixdhceO6gZMXhfro
         KGz8EzwgeLCHk4w3DKwcfo0ySLnnm1EkhdqSu6KrT+CvBXhEo5nkYBVWl8nlBmWTySey
         eSjCVkx2Cnl0OkQGLWjv6OJxvsP8jQ75G83gerbNGGNGWuK7+wskInRIn2XXPLaScpL+
         eRJqrCAbgO8c7WPCVvJw08uPsAWKjqvkVIsU8Mb2ZNf7xCxOK99q7Lri8G5C82VENZ6v
         H10A==
X-Forwarded-Encrypted: i=1; AJvYcCWvjWW3XhyhG/QWmPEgGm68cx8HmupHG1/AL54K9PvWcFjXvH0IHZK6hdOmvMMZJz9kuUXvipjl6VE/Hsirzv4w@lists.infradead.org
X-Gm-Message-State: AOJu0YzaDh5Oyf1RWf8LGJY1YFMAK7FzfH5vnmBdL2R3o8gnEN4MIeyf
	vqSJhDIVQnSU/bQPRPkZlDXKAiA9JiVxL9ED/pVqEPxCpC+Hs/FA
X-Gm-Gg: ASbGnctRB/SYBKmCbY065G24BMis/IkQBZHgj1NazCvPMSQ7aRGBAVYKLQMeIbvquXX
	uvyJ4rH2Y/l1Hr92eKUKqEo2u2kIygTVTEfnUe4zix0Qv9h5KCF47WSWLViaV5dvGk7k1XyoKSf
	2dgVgK1z3iOVn0UT5O2J8phZl5JxNOpDykbGo2JnUR7lfdZX+zX0v8PPEAD8AQRWSLXSNIdC0ly
	7pFho/TGZ9TI3CqK7rXslaB9yw4mq8FuJZq2+h3FdDDDEifaGhHBPkzyrFqiyIA3MgqVrrzrfb4
	q+k3e7YzQxcN2l+wQC4o03B91nbcNNMpTeTWzuvzT9bXY0SMf7WWqzZrs7uDbzZjgwZK
X-Google-Smtp-Source: AGHT+IE4qtcNDA9+68gnJpQW7sH+JjJZJUZhlD6D7jXeTF/bWc027ggNQ2cK9NDwA9P5cuQE+xB1mA==
X-Received: by 2002:a05:6000:2cd:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-3997f940ec2mr19210115f8f.53.1743000012657;
        Wed, 26 Mar 2025 07:40:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/15] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:42 +0000
Message-ID: <20250326143945.82142-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074014_673297_B459223E 
X-CRM114-Status: GOOD (  20.51  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add pinctrl support for the Renesas RZ/V2N SoC by reusing the existing
RZ/V2H(P) pin configuration data. The PFC block is nearly identical, with
the only difference being the absence of `PCIE1_RSTOUTB` on RZ/V2N.

To accommodate this, move the `PCIE1_RSTOUTB` entry to the end of the
`rzv2h_dedicated_pins` array and set `.n_dedicated_pins` to
`ARRAY_SIZE(rzv2h_dedicated_pins) - 1` in the RZ/V2N OF data.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/Kconfig         |  1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 36 ++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 3c18d908b21e..e16034fc1bbf 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -42,6 +42,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_RZG2L if ARCH_RZG2L
 	select PINCTRL_RZV2M if ARCH_R9A09G011
 	select PINCTRL_RZG2L if ARCH_R9A09G047
+	select PINCTRL_RZG2L if ARCH_R9A09G056
 	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c72e250f4a15..ae5e040f3276 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2304,7 +2304,6 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
 	{ "SD1DAT3", RZG2L_SINGLE_PIN_PACK(0xc, 3, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
 						    PIN_CFG_IEN | PIN_CFG_PUPD)) },
 	{ "PCIE0_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
-	{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
 	{ "ET0_MDIO", RZG2L_SINGLE_PIN_PACK(0xf, 0, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
 						     PIN_CFG_IEN | PIN_CFG_PUPD)) },
 	{ "ET0_MDC", RZG2L_SINGLE_PIN_PACK(0xf, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR |
@@ -2359,6 +2358,14 @@ static struct rzg2l_dedicated_configs rzv2h_dedicated_pins[] = {
 	{ "ET1_RXD1", RZG2L_SINGLE_PIN_PACK(0x14, 5, (PIN_CFG_PUPD)) },
 	{ "ET1_RXD2", RZG2L_SINGLE_PIN_PACK(0x14, 6, (PIN_CFG_PUPD)) },
 	{ "ET1_RXD3", RZG2L_SINGLE_PIN_PACK(0x14, 7, (PIN_CFG_PUPD)) },
+
+	/*
+	 * This pin is only available on the RZ/V2H(P) SoC and not on the RZ/V2N.
+	 * Since this array is shared with the RZ/V2N SoC, this entry should be placed
+	 * at the end. This ensures that on the RZ/V2N, we can set
+	 * `.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins) - 1,`.
+	 */
+	{ "PCIE1_RSTOUTB", RZG2L_SINGLE_PIN_PACK(0xe, 1, (PIN_CFG_IOLH_RZV2H | PIN_CFG_SR)) },
 };
 
 static struct rzg2l_dedicated_configs rzg3e_dedicated_pins[] = {
@@ -3349,6 +3356,29 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
 
+static struct rzg2l_pinctrl_data r9a09g056_data = {
+	.port_pins = rzv2h_gpio_names,
+	.port_pin_configs = r9a09g057_gpio_configs,
+	.n_ports = ARRAY_SIZE(r9a09g057_gpio_configs),
+	.dedicated_pins = rzv2h_dedicated_pins,
+	.n_port_pins = ARRAY_SIZE(r9a09g057_gpio_configs) * RZG2L_PINS_PER_PORT,
+	.n_dedicated_pins = ARRAY_SIZE(rzv2h_dedicated_pins) - 1,
+	.hwcfg = &rzv2h_hwcfg,
+	.variable_pin_cfg = r9a09g057_variable_pin_cfg,
+	.n_variable_pin_cfg = ARRAY_SIZE(r9a09g057_variable_pin_cfg),
+	.num_custom_params = ARRAY_SIZE(renesas_rzv2h_custom_bindings),
+	.custom_params = renesas_rzv2h_custom_bindings,
+#ifdef CONFIG_DEBUG_FS
+	.custom_conf_items = renesas_rzv2h_conf_items,
+#endif
+	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
+	.pmc_writeb = &rzv2h_pmc_writeb,
+	.oen_read = &rzv2h_oen_read,
+	.oen_write = &rzv2h_oen_write,
+	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
+	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
+};
+
 static struct rzg2l_pinctrl_data r9a09g057_data = {
 	.port_pins = rzv2h_gpio_names,
 	.port_pin_configs = r9a09g057_gpio_configs,
@@ -3389,6 +3419,10 @@ static const struct of_device_id rzg2l_pinctrl_of_table[] = {
 		.compatible = "renesas,r9a09g047-pinctrl",
 		.data = &r9a09g047_data,
 	},
+	{
+		.compatible = "renesas,r9a09g056-pinctrl",
+		.data = &r9a09g056_data,
+	},
 	{
 		.compatible = "renesas,r9a09g057-pinctrl",
 		.data = &r9a09g057_data,
-- 
2.49.0


