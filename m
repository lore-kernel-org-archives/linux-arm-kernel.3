Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A5CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6Q2LdCcfc0b7tOZw82gElqK7SvqjvWQpF13mGE0gJs=; b=RRBhygdSzyN5zQL64AA5lBA+Xr
	B6yenB2dwi51IeqiWvwFVu7eV1Mmpy8H2I/PMsR2tUcsIRKYHZPLLLzc9lC+yx8F/rRrwp3RD7iTK
	0wHVBBB2s7m8x0fX2WJ/s21vWirUHDaqfnlOtT22ukivJ/nl1jP8wP6ZYhUWlzgeooWQgxOzDd77v
	VJvA0tvAAOn7lt3lUK6BcL88qM5aRsI8YijW57+aibqa+4Sz5Wc4/svT83VGGRheiYAhZhkG/8d2l
	X1SwCtDRu5GcGgPlEdcKy7nlhhdaebQVaVvQ7R9U/SM9Vy7E7n8V9d2KJ8dVFc5W5Y19oUcF1iEWJ
	EbHAiSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMC2g-0000000BhBn-36k9;
	Sun, 10 May 2026 21:50:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMC2e-0000000Bh8q-0mvX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:50:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2652928f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449826; x=1779054626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6Q2LdCcfc0b7tOZw82gElqK7SvqjvWQpF13mGE0gJs=;
        b=Ic0THxxSBQKGCCfRZg/xY9j5BbOKn9rt2Algj99sAPSQpVW8t2uufSxlvbSzuRhzAK
         cN7a3H50KWHyLrCARnnnQvPopRq2k2l53NfnAwgkUdnGDsLL40HV0GeT1SPSNM2rEzeH
         NOwl5ejwbdMaurm33odeQacgJZU4+6sicBtkj+jokpUulRIkeoiwGRly0xtL4ZwiiVSk
         6AdmyphcmbPkztHUEi75Asga9VfWmKN6FLyeOiW3rJrR0jpUga+akbCPbYwIjlc/+goX
         ZxG0b+UuIITmZ7tU8Nl2OdXvccxfOsPSAnxlQCO+G57NWPf3WH8f87qM5kzUGRK0u42I
         34xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449826; x=1779054626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F6Q2LdCcfc0b7tOZw82gElqK7SvqjvWQpF13mGE0gJs=;
        b=I6iUCrnt/1w9YMzPhpzPH5rZKTqhwhgSI6nlAfhgXZaM7c+NtcHZhu3+f1YQun70dU
         l6JMIruf91rRUsPxqw9XHBr4dVUpaarzt0xWprkiRdc95R3NgFHiT+/7e8iCULdrsY5Q
         QrXqZERCuXftTMDa2lK2W5UEM4+6q9hR73PS87jJddV2lC06j61im6HJgg+a2vO9DtGQ
         //Ax9/yDK3+17k8kKj5Msms5t6bnNg9dZEfCqQWSkUsPcM6mCO0t5n0LK41F5+RxTVkY
         Ix9DcaZ/sc0kDuFKXysLhlvh+gFJ4cKU34vGn+R9td13gf/nHnItTWyjr/PgjBfm+k7l
         Idpg==
X-Forwarded-Encrypted: i=1; AFNElJ98CiR2kelBKldfp9jbafOr4KdXFitOvU3MUuDXo2Hxlz5xH1pvpb754Jh+NC3aTZ3vcT80QknIlpPnBwXDIpRn@lists.infradead.org
X-Gm-Message-State: AOJu0YwY7osi05CbEi5UY5UbPzucNDE/Biq4mbq61J1ptF69KBox9SaA
	n6X3WNKfvOn+19zPLF1N/0ZYlyLUVyzLymRBbRVnNg9wiuTff6fqkCTk
X-Gm-Gg: Acq92OHi6y/XZfYI8Eab9HZ2lah289ESSWehU2n6P9zGVdMWEEYXhpHryU24PZMGsag
	7kQZZCtYYLlGjOOSBCfO2cw0T3WvJrEwI4DjWRmTOQZgEud00bdxzkSi+AQhWRE2b5OS43+FY2a
	6ej6GuTwtkV0k4HsPZcQONyHnbgfkXq5n+x2ip6soY01577a+YJhmniSFPxlDOf2hCNLDeK5xxe
	BeHOX7NzO853pgmOcVr5guWh2nfngfxtQvGOdPJQTQdWnJDIFreXx/ka1SNVFfzllr0GFxNNJhm
	nNajjBPenCsPKCaIsQmuMX0rTt5pKdNW1/pGIMB8qGIv72uZdzAoX9qkBxetPvB0gbR1Ux4F7dU
	owfnFRaEAX0ofaSW2+eDY9kC+aYpM5iYwK9wfwVrJTMVkm599Rmal0B1PyC2GZ5F7LueQKd9pd3
	gBynFtdBroNwAUzXcYscqqx2NU4Xxlnb8=
X-Received: by 2002:a05:6000:2311:b0:44d:261:54c5 with SMTP id ffacd0b85a97d-4515d3dc1f3mr33259120f8f.30.1778449825998;
        Sun, 10 May 2026 14:50:25 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19207317f8f.1.2026.05.10.14.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:50:25 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:49:53 +0300
Subject: [PATCH RFC v2 4/4] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks and resets.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-zx29clk-v2-4-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
In-Reply-To: <20260511-zx29clk-v2-0-29f0edc300f5@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7174;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=BPZww5hE1dLIIGa/RUA+R8wjr/jhPw5RMGELLQxayFk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqAP2S2Rkd/NDg1wBapyhyI91AEC44X3F8pcuNa
 BHP6T5bWZ+JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagD9khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIF0Q/+JU7tsyNxlCC3kfGboXXsID8jVZxTuVO
 IuWVRDtADsv8/RSwhKAWmzj2KEbZBsZ2w4Y98RIzyBfxWSmlMcE+uvjMNIHDoCXgRyLjYsFy+XK
 7/J5UzoX0ycpmSTO6SpxH6t4rc/dpVAUQRvCJSwpukl0yMlYnROVidbi7wTLMLoeNd+S59bHkpP
 YdPqtY39I594m+bDnW6Tuv4MnVcx4uAdakJXJttRvJ+tEqgTl0QXvn/m5aF/Cp9nH9icbVIZRDX
 c80JE5wcwc0wJ/9R9Dw36TjRKbZ8nRoC2LLHb0xNP5yYJARrca9eoddPk1pXoA05ka3osnf+aGF
 ZtW+UeinLpyrhj3CDtiUZWRuSkUFFTCgXNpuWCMjBT6zx/Flukm+57wWcYCXw1t/x0CHqleX3rc
 gdgDDzXfvj3X1EPqDlKyF8oWj43sxcsWFqo9XhXCNmnm0USOSAtldU1G4TcUi85j2POixQFINmZ
 htKGndEmgdXAimweY+benZXcgVjwBxS7ta1LtsVa/LPBerr5UJWvagjhs8qRFNqpTZmaXncsrdH
 YFIvRb1fyU38Em9hkJ8SPLd8rp86SVZm+7DHVw7q7xglivlrZP7QlnJcVQg/N1vd9HcQnrTnTqj
 B9X0CxWdOiaU+F5tjtV1anVYv+LA+ikG2wVnVTsxg5RSp0SoDLJ0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_145028_271288_2C34D48B 
X-CRM114-Status: GOOD (  25.86  )
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

"LSP" is ZTE's term for this part of the SoC, I suspect it stands for
"low speed peripherals". The main UART is here, together with the flash
controller and more surplus proprietary timers.

It also has two more I2C controllers that supposedly connect to a
battery charger, SPI for displays and I2S for analog telephones. The
boards I have don't have any of these components though.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/clk-zx297520v3.c | 183 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index d4b683cb6354..05b02c8f266b 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -791,6 +791,189 @@ static struct platform_driver clk_zx297520v3_matrixclk = {
 };
 module_platform_driver(clk_zx297520v3_matrixclk);
 
+/* LSP clock entries have a common pattern: Bit 0 for PCLK, Bit 1 for WCLK. Bit 4 (and sometimes
+ * more) for WCLK mux.
+ *
+ * Bit 8 and 9 are reset bits. I don't know the difference between the two, but they both
+ * need to be set to deassert the reset.
+ *
+ * Bits 12-16 can be a divisor, but not all clocks have it. Some clocks have a divisor in 16-20.
+ *
+ * The ID given in this table is the first register in the device's MMIO space. ZTE's drivers
+ * usually call this a version register, but it looks more like a device identifier.
+ *
+ * It looks like the registers map to devices like this:
+ *
+ * Timer reg	function	div	dev offset(lsp + xxxx)	ID
+ * 0x0: Read-only, probably device identifier			0x00752100
+ * 0x4:		timer_l1	Y	0x1000			0x02020000
+ * 0x8:		watchdog_l2	Y	0x2000			0x02020000
+ * 0xc:		watchdog_l3	Y	0x3000			0x02020000
+ * 0x10:	i2c1		N	0x4000			0x01020000
+ * 0x14:	i2s0		Yh	0x5000			0x01030000
+ * 0x18:	always 0	N	-
+ * 0x1c:	i2s1		Yh	0x6000			0x01030000
+ * 0x20:	always 0	N	-
+ * 0x24:	qspi		N	0x7000			0x01040000
+ * 0x28:	uart1		N	0x8000			0x01060000
+ * 0x2c:	i2c2		N	0x9000			0x01020000
+ * 0x30:	spi0		Y	0xa000			0x01040000
+ * 0x34:	timer_lb	Y	0xb000			0x02020000
+ * 0x38:	timer_lc	Y	0xc000			0x02020000
+ * 0x3c:	uart2		N	0xd000			0x01060000
+ * 0x40:	watchdog_le	Y	0xe000			0x02020000
+ * 0x44:	timer_lf	Y	0xf000			0x02020000
+ * 0x48:	spi1		Y	0x10000			0x01040000
+ * 0x4c:	timer_l11	Y	0x11000			0x02020000
+ * 0x50:	tdm		Y	0x12000			0x01040000
+ *
+ * Registers 0x58, 0x5c, 0x60, 0x64, 0x68 seem to contain more controls for i2s and tdm.
+ */
+
+static const char * const timer_lsp_sel[] = {
+	"lsp_osc32k",
+	"lsp_osc26m",
+};
+
+static const char * const uart_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d6",
+};
+
+static const char * const i2s_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_dpll_d4",
+	"lsp_mpll_d6",
+	/* Unknown */
+};
+
+static const char * const tdm_lsp_sel[] = {
+	"lsp_tdm_wclk",
+};
+
+static const char * const spi_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d4",
+	"lsp_mpll_d6",
+	/* Unknown */
+};
+
+static const char * const qspi_lsp_sel[] = {
+	"lsp_osc26m",
+	"lsp_mpll_d4",
+	"lsp_mpll_d5",
+	"lsp_mpll_d6",
+	"lsp_mpll_d8",
+	"lsp_mpll_d12",
+	"lsp_osc26m",
+	"lsp_osc26m",
+};
+
+#define LSP_CLOCK(offset, name, mux, div_shift, div_size) {\
+		ZX297520V3_##name##_RESET, ZX297520V3_##name##_WCLK, ZX297520V3_##name##_PCLK,\
+		#name, offset, 8, offset, 0, 1, "lsp_pclk", offset, 4, 4, mux, ARRAY_SIZE(mux),\
+		offset, div_shift, div_size, 0}
+
+static const struct zx297520v3_composite lsp_clocks[] =  {
+	LSP_CLOCK(0x4,	TIMER_L1,	timer_lsp_sel,	0,	0),
+	LSP_CLOCK(0x8,	WDT_L2,		timer_lsp_sel,	0,	0),
+	LSP_CLOCK(0xc,	WDT_L3,		timer_lsp_sel,	0,	0),
+	LSP_CLOCK(0x10,	I2C1,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x14,	I2S0,		i2s_lsp_sel,	16,	4),
+	LSP_CLOCK(0x1c,	I2S1,		i2s_lsp_sel,	16,	4),
+	LSP_CLOCK(0x24,	QSPI,		qspi_lsp_sel,	0,	0),
+	LSP_CLOCK(0x28,	UART1,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x2C,	I2C2,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x30,	SPI0,		spi_lsp_sel,	12,	4),
+	LSP_CLOCK(0x34,	TIMER_LB,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x38,	TIMER_LC,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x3c,	UART2,		uart_lsp_sel,	0,	0),
+	LSP_CLOCK(0x40,	WDT_LE,		timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x44,	TIMER_LF,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x48,	SPI1,		spi_lsp_sel,	12,	4),
+	LSP_CLOCK(0x4c,	TIMER_L11,	timer_lsp_sel,	12,	4),
+	LSP_CLOCK(0x50,	TDM,		tdm_lsp_sel,	16,	4),
+};
+
+#undef LSP_CLOCK
+
+static int zx297520_lspclk_probe(struct platform_device *pdev)
+{
+	static const char * const parent_names[] = { "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8",
+						     "mpll_d12", "osc26m", "osc32k", "pclk" };
+
+	struct zx29_clk_controller *lsp;
+	struct device *dev = &pdev->dev;
+	struct clk *parent;
+	unsigned int i;
+	int res;
+
+	dev_info(dev, "Registering zx297520v3 LSP clocks and resets\n");
+
+	lsp = devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
+					 resets[ZX297520V3_LSPRST_END]), GFP_KERNEL);
+	if (!lsp)
+		return -ENOMEM;
+
+	lsp->clocks = devm_kzalloc(dev, struct_size(lsp->clocks, hws,
+				   ZX297520V3_LSPCLK_END), GFP_KERNEL);
+	if (!lsp->clocks)
+		return -ENOMEM;
+	lsp->clocks->num = ZX297520V3_LSPCLK_END;
+
+	lsp->base = devm_platform_ioremap_resource(pdev, 0);
+	WARN_ON(!lsp->base);
+
+	/* TODO: Technically we can disable the pclk if all LSP devices are shut down, but that
+	 * needs custom clk ops to tiptoe around a disabled LSP pclk before attempting to access
+	 * the actual clock. In normal operation it is unlikely that all LSP devices are shut down
+	 * simultaneously though as UART and NAND are located here.
+	 */
+	parent = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(parent)) {
+		dev_err(dev, "failed to find lsp pclk\n");
+		return PTR_ERR(parent);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(parent_names); ++i) {
+		parent = devm_clk_get(dev, parent_names[i]);
+		if (IS_ERR(parent)) {
+			dev_err(dev, "failed to find lsp %s clock\n", parent_names[i]);
+			return PTR_ERR(parent);
+		}
+	}
+
+	res = zx297520v3_composite(dev, lsp->base, lsp->clocks, lsp->resets,
+				 lsp_clocks, ARRAY_SIZE(lsp_clocks));
+	if (res)
+		return res;
+
+	res = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, lsp->clocks);
+	if (res)
+		return res;
+
+	lsp->rcdev.owner = THIS_MODULE;
+	lsp->rcdev.nr_resets = ZX297520V3_LSPRST_END;
+	lsp->rcdev.ops = &zx297520v3_rst_ops;
+	lsp->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &lsp->rcdev);
+}
+
+static const struct of_device_id of_match_zx297520v3_lspclk[] = {
+	{ .compatible = "zte,zx297520v3-lspclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_lspclk);
+
+static struct platform_driver zx297520v3_lspclk = {
+	.probe = zx297520_lspclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-lspclk",
+		.of_match_table = of_match_zx297520v3_lspclk,
+	},
+};
+module_platform_driver(zx297520v3_lspclk);
+
 MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
 MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0


