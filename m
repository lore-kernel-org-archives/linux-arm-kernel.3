Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2dOaZAG8Wamwt78Lsh6vwhePE7jN3aEyJys1wTvXR4=; b=BmtyOtXBQ89UzJHDvI/0iVWbDG
	V/NX+CP1yU8u1nEfErxJYSkUFZRRA3Qhc/ebpPdMEjLC5h9bSJKyY5nOAb06kgO+2hEON+YFeI646
	W+sWPSgSel59VQriuYzY6pXyt+ecoPFSbRz0F5Jmoh42uIkwqRvYxVqh/Fc5QBqBPJOGlOIATdnc5
	z88QRlp09DC6BrjmCi/MNEExEe3X0ClsUg5tS5pH1tlEJDsMxhu4jqGFaygtQP0/TaBBDbANwo8dF
	qtuvFREywZy7Yyoo55p1617dxxPYwibhSVMczQWTaK1qJhC5vrWW0BHfyMiAFPL9xwNoBYYkud/lW
	EKSwbCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfg-0000000DLFB-0Ka5;
	Sun, 28 Jun 2026 20:00:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfZ-0000000DL8U-1JTQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 20:00:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493b0fe95feso236845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676795; x=1783281595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2dOaZAG8Wamwt78Lsh6vwhePE7jN3aEyJys1wTvXR4=;
        b=aE7K/NwsTuxktjnPb+NSjmLRHPf3kX9XmBMwNFNXtkiGX3Mi6wxl9cdWNkoFr4JBbF
         RHpc+WWovzKaTD3tZYCIwpx/GxyXF7RI2GEY8ESnFG9s4vUG6bwNxF6OAs4dB+vauauL
         aYLb6qSfDQFQ3Ug3Ws5LrCjRNmtbLQsH3ga44Nk8xHFv1FO8iz98C6bwMW7YmZbKL7TI
         zG8d+nFxrpDQwYUGgdX42PM54d7cA37sUWEzrIzZ0+fRm4sfZdiqSIigVL57b5F8he42
         pli+Fh4R3Jdzxh30ySvNce9TnRf990P/9pVjhTSA6tM1Ec39oD9DkD0gcciY2LUikwP9
         MCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676795; x=1783281595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/2dOaZAG8Wamwt78Lsh6vwhePE7jN3aEyJys1wTvXR4=;
        b=U+9/YS+09a5BWqCud76yc9xSxVIDU1TAA038xSPd1H5T5QILxEwKe9isOELNTT/Zv3
         xq+xe7aZZTBzQrNxDAs7V3PPBuIM0QL7mkNVM9llNarBRStObn5UoyPH6EjeWLr92H/2
         tnP1nB7g22FqS3n2fH7q3tBmWhdmjNYJ7GPdcTV1/77Mmpj1yT5RyXS8EzPRL9s1xFyZ
         LGgS66mw7k1HeSTxRE+gZ/4kPTCMun8ahThFhYsjsIx0Ox23+ekgn/YJp2+1hJun/YVq
         rkuDuvk2S4/3Aq39B81Zsg59b48EtjZgynszyw7twWXPtZCw0sqhjXUshuBtAnJkOcwl
         9g8w==
X-Forwarded-Encrypted: i=1; AFNElJ9SVia7x+7Ve1/j+i3jPajULGZEMTg8doFSHXK+ykO8ZUV9svzZ2RETl04vzvln9UGbL4velK0ZHGfuT0IOGO+B@lists.infradead.org
X-Gm-Message-State: AOJu0YwH5wwDmAapuYwh1vZ9sVZ1RdN+9XANSGNaJOTruHugEb5PM+Zr
	/LsSOVVUkxyhmzS2yVkoVytLDnckgSAigOF48JYvjDIrK59JqzvncR6v
X-Gm-Gg: AfdE7cm8k4SNCE2OZiwit259GhKs3gyE8rQ41W3KGSlGHubgN77ehZFLDfhNRQxNKYh
	oNYBnXEVEgcXBJIOPdfUu5cKlhcb4fxyvvfLLHcWla15bXaXzPzm+n6unyP3vhC7QnqnRTN0sSZ
	r8klYlLpn3Xhs1ryvfPToCGsQCExKFzVH7kZFtms3o3+RQCkp5hqm4054/pJXPDfahjhcqLZJ6d
	XPjWT5tsD1xuNwN+FPPHNLMWvhhHZcnDx5GNf047VFrMg2PdPOS1GvlodsVNymHeq7rUuzsJ4LD
	6ohXbJ97rJfimdAVAAufcoZOR+3Ooa5fa53AhxpgJEAcdzCzNpKIIKmc+FrvNrcYZNKc/9wWFpZ
	qv/X8tyNFIxwkafodj2ngiPzfYDh0ITNS0djX0HAPDoJPf+vGzrw2Ml8B7OmsFyM1Jdl4el0Scr
	bD5TUf1u7GSx13jdoAt82wIG0=
X-Received: by 2002:a05:600c:8b61:b0:492:6efe:2e6b with SMTP id 5b1f17b1804b1-4926efe2eebmr133910875e9.29.1782676795312;
        Sun, 28 Jun 2026 12:59:55 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:54 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:05 +0300
Subject: [PATCH RFC v5 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks and resets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-10-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11479;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2m9KdtXVJgvv500dnx4UrGc5BWnSmjaCdhF3tea9QCs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UifAd2ySO+MGIdASV+yef6EP7QP/Rxi6AN
 Km75sGLJxGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLRKQ/+MHsDErQZHGUepdnrixoY6uDiZONrkAj
 CjCuBfCSX50qdYQ3Z+mex0jyF7oT99RJmX7p3T1eq2kftmE6OHIXSsRmhFPbdWYRNcCsYpFjP9P
 /Ni498Ro9QCU9hdrH368r+JaCj+Mxhx54rOeiHa7hHemtGZmqiS7/y6NYO9rzAtufRueEH56njB
 OsAM892HfQ1uW3e44wlwXL7hTWXuaielDOyi42rZfaBMEALvw3KEEMDjMYbVa6nJIjXgROMdje2
 KrnsKsQ8SaPgOmra42FA2vhgel3smRTMgjb5jHJH2wkkVOEY1S8Qnq44tSsXxLbW89mS6NyCb9q
 90LurREuU4oaRs6m3MtLwFhTQHs+pqjORZT3zJwBjmHbjy3aM08b88bkJdbRI1aetA6+xEu9Zz2
 g9Vnp2D/k9folYDIZJ2l5/Nlaw1RwRWjjxuwzL6NoxVZC00/A3iDtc7Rj/QnVZArp/183p6UC2F
 MIEeRLnEHMyGG6RWLVRdyvvGhnJoEy+D56qJY4K4kSAncrfsBfeyAW/DEHyNMD5gFhWHZfHaBeE
 xikSAG/gyeNlNqC26uAn/ST5UqpQNBzWfvayN29v4Xu6kJGEsRNfqcbM0o8dL4/CcCQpp3Lkdke
 tdJ2yZ9GRIDhF5GUT+l/yNVmU2yEXbQDEeIsPxkeV/5mTqYab2Ao=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125957_539192_5ADBE2EA 
X-CRM114-Status: GOOD (  21.44  )
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

It also has one more I2C controller that supposedly connects to a
battery charger, SPI for displays and I2S for analog telephones. The
boards I have don't have any of these components though.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 5:
Removed unused tdm_lsp_sel. Fix zx297529 vs zx297520 typo.
Adjusted .compatible to zte,zx297520v3-lspcrm
---
 drivers/clk/zte/clk-zx297520v3.c | 208 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 17e1f741b48c..f4ab065ee496 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -616,9 +616,217 @@ static struct platform_driver clk_zx297520v3_matrix = {
 	},
 };
 
+/* LSP clock entries have a common pattern: Bit 0 for WCLK, Bit 1 for PCLK. Bit 4 (and sometimes
+ * more) for WCLK mux.
+ *
+ * Bit 8 and 9 are resets handled by the reset-zte-zx297520v3 driver.
+ *
+ * Bits 15:12 can be a divisor, but not all clocks have it. Some clocks have a divisor in 19:16.
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
+ * 0x10:	pwm		N	0x4000			0x01020000
+ * 0x14:	i2s0		Yh	0x5000			0x01030000
+ * 0x18:	always 0	-	-			-
+ * 0x1c:	i2s1		Yh	0x6000			0x01030000
+ * 0x20:	always 0	-	-			-
+ * 0x24:	qspi		N	0x7000			0x01040000
+ * 0x28:	uart1		N	0x8000			0x01060000
+ * 0x2c:	i2c1		N	0x9000			0x01020000
+ * 0x30:	spi0		Y	0xa000			0x01040000
+ * 0x34:	timer_lb	Y	0xb000			0x02020000
+ * 0x38:	timer_lc	Y	0xc000			0x02020000
+ * 0x3c:	uart2		N	0xd000			0x01060000
+ * 0x40:	watchdog_le	Y	0xe000			0x02020000
+ * 0x44:	timer_lf	Y	0xf000			0x02020000
+ * 0x48:	spi1		Y	0x10000			0x01040000
+ * 0x4c:	timer_l11	Y	0x11000			0x02020000
+ * 0x50:	tdm		Yh	0x12000			0x01040000
+ *
+ * Registers 0x58, 0x5c, 0x60, 0x64, 0x68 seem to contain more controls for i2s and tdm.
+ *
+ * I am not sure about the device at offset 0x4000 (clk reg 0x10). The ID matches that of i2c, but
+ * it has a larger register set. I suspect it is a PWM device, but I have not seen any ZTE kernel
+ * operate it - even devices with displays only use a GPIO to control the backlight.
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
+static const struct zx_mux_desc zx297520v3_lsp_muxes[] = {
+	MUX(0,                             "timer_l1_mux",   timer_lsp_sel,    0x04,  4, 1),
+	MUX(0,                             "wdt_l2_mux",     timer_lsp_sel,    0x08,  4, 1),
+	MUX(0,                             "wdt_l3_mux",     timer_lsp_sel,    0x0c,  4, 1),
+	/* PWM: No mux bit can be set */
+	MUX(0,                             "i2s0_mux",       i2s_lsp_sel,      0x14,  4, 2),
+	/* 0x18: Always 0 */
+	MUX(0,                             "i2s1_mux",       i2s_lsp_sel,      0x1c,  4, 2),
+	/* 0x20: Always 0 */
+	MUX(0,                             "qspi_mux",       qspi_lsp_sel,     0x24,  4, 3),
+	MUX(0,                             "uart1_mux",      uart_lsp_sel,     0x28,  4, 1),
+	MUX(0,                             "i2c1_mux",       uart_lsp_sel,     0x2c,  4, 1),
+	MUX(0,                             "spi0_mux",       spi_lsp_sel,      0x30,  4, 2),
+	MUX(0,                             "timer_lb_mux",   timer_lsp_sel,    0x34,  4, 1),
+	MUX(0,                             "timer_lc_mux",   timer_lsp_sel,    0x38,  4, 1),
+	MUX(0,                             "uart2_mux",      uart_lsp_sel,     0x3c,  4, 1),
+	MUX(0,                             "wdt_le_mux",     timer_lsp_sel,    0x40,  4, 1),
+	MUX(0,                             "timer_lf_mux",   timer_lsp_sel,    0x44,  4, 1),
+	MUX(0,                             "spi1_mux",       spi_lsp_sel,      0x48,  4, 2),
+	MUX(0,                             "timer_l11_mux",  timer_lsp_sel,    0x4c,  4, 1),
+	/* TDM: No mux in LSP. Instead, it is in matrix with a separate clk line to LSP */
+};
+
+static const struct zx_div_desc zx297520v3_lsp_dividers[] = {
+	DIV(0,                             "timer_l1_div",   "timer_l1_mux",   0x04, 12, 4),
+	DIV(0,                             "wdt_l2_div",     "wdt_l2_mux",     0x08, 12, 4),
+	DIV(0,                             "wdt_l3_div",     "wdt_l3_mux",     0x0c, 12, 4),
+	/* PWM: No div */
+	DIV(0,                             "i2s0_div",       "i2s0_mux",       0x14, 16, 4),
+	/* 0x18: Always 0 */
+	DIV(0,                             "i2s1_div",       "i2s1_mux",       0x1c, 16, 4),
+	/* 0x20: Always 0 */
+	/* qspi, uart1, i2c1: No div */
+	DIV(0,                             "spi0_div",       "spi0_mux",       0x30, 12, 4),
+	DIV(0,                             "timer_lb_div",   "timer_lb_mux",   0x34, 12, 4),
+	DIV(0,                             "timer_lc_div",   "timer_lc_mux",   0x38, 12, 4),
+	/* uart2: No div */
+	DIV(0,                             "wdt_le_div",     "wdt_le_mux",     0x40, 12, 4),
+	DIV(0,                             "timer_lf_div",   "timer_lf_mux",   0x44, 12, 4),
+	DIV(0,                             "spi1_div",       "spi1_mux",       0x48, 12, 4),
+	DIV(0,                             "timer_l11_div",  "timer_l11_mux",  0x4c, 12, 4),
+	DIV(0,                             "tdm_div",        "lsp_tdm_wclk",   0x50, 16, 4),
+};
+
+static const struct zx_gate_desc zx297520v3_lsp_gates[] = {
+	GATE(ZX297520V3_TIMER_L1_WCLK,     "timer_l1_wclk",  "timer_l1_div",   0x04,  0, 0),
+	GATE(ZX297520V3_TIMER_L1_PCLK,     "timer_l1_pclk",  "lsp_pclk",       0x04,  1, 0),
+	GATE(ZX297520V3_WDT_L2_WCLK,       "wdt_l2_wclk",    "wdt_l2_div",     0x08,  0, 0),
+	GATE(ZX297520V3_WDT_L2_PCLK,       "wdt_l2_pclk",    "lsp_pclk",       0x08,  1, 0),
+	GATE(ZX297520V3_WDT_L3_WCLK,       "wdt_l3_wclk",    "wdt_l3_div",     0x0c,  0, 0),
+	GATE(ZX297520V3_WDT_L3_PCLK,       "wdt_l3_pclk",    "lsp_pclk",       0x0c,  1, 0),
+	/* I don't know the LSP parent. It must be one of the LSP inputs though. */
+	GATE(ZX297520V3_PWM_WCLK,          "pwm_wclk",       "lsp_osc26m",     0x10,  0, 0),
+	GATE(ZX297520V3_PWM_PCLK,          "pwm_pclk",       "lsp_pclk",       0x10,  1, 0),
+	GATE(ZX297520V3_I2S0_WCLK,         "i2s0_wclk",      "i2s0_div",       0x14,  0, 0),
+	GATE(ZX297520V3_I2S0_PCLK,         "i2s0_pclk",      "lsp_pclk",       0x14,  1, 0),
+	/* 0x1c: Always 0 */
+	GATE(ZX297520V3_I2S1_WCLK,         "i2s1_wclk",      "i2s1_div",       0x1c,  0, 0),
+	GATE(ZX297520V3_I2S1_PCLK,         "i2s1_pclk",      "lsp_pclk",       0x1c,  1, 0),
+	/* 0x20: Always 0 */
+	GATE(ZX297520V3_QSPI_WCLK,         "qspi_wclk",      "qspi_mux",       0x24,  0, 0),
+	GATE(ZX297520V3_QSPI_PCLK,         "qspi_pclk",      "lsp_pclk",       0x24,  1, 0),
+	GATE(ZX297520V3_UART1_WCLK,        "uart1_wclk",     "uart1_mux",      0x28,  0, 0),
+	GATE(ZX297520V3_UART1_PCLK,        "uart1_pclk",     "lsp_pclk",       0x28,  1, 0),
+	GATE(ZX297520V3_I2C1_WCLK,         "i2c1_wclk",      "i2c1_mux",       0x2c,  0, 0),
+	GATE(ZX297520V3_I2C1_PCLK,         "i2c1_pclk",      "lsp_pclk",       0x2c,  1, 0),
+	GATE(ZX297520V3_SPI0_WCLK,         "spi0_wclk",      "spi0_div",       0x30,  0, 0),
+	GATE(ZX297520V3_SPI0_PCLK,         "spi0_pclk",      "lsp_pclk",       0x30,  1, 0),
+	GATE(ZX297520V3_TIMER_LB_WCLK,     "timer_lb_wclk",  "timer_lb_div",   0x34,  0, 0),
+	GATE(ZX297520V3_TIMER_LB_PCLK,     "timer_lb_pclk",  "lsp_pclk",       0x34,  1, 0),
+	GATE(ZX297520V3_TIMER_LC_WCLK,     "timer_lc_wclk",  "timer_lc_div",   0x38,  0, 0),
+	GATE(ZX297520V3_TIMER_LC_PCLK,     "timer_lc_pclk",  "lsp_pclk",       0x38,  1, 0),
+	GATE(ZX297520V3_UART2_WCLK,        "uart2_wclk",     "uart2_mux",      0x3c,  0, 0),
+	GATE(ZX297520V3_UART2_PCLK,        "uart2_pclk",     "lsp_pclk",       0x3c,  1, 0),
+	GATE(ZX297520V3_WDT_LE_WCLK,       "wdt_le_wclk",    "wdt_le_div",     0x40,  0, 0),
+	GATE(ZX297520V3_WDT_LE_PCLK,       "wdt_le_pclk",    "lsp_pclk",       0x40,  1, 0),
+	GATE(ZX297520V3_TIMER_LF_WCLK,     "timer_lf_wclk",  "timer_lf_div",   0x44,  0, 0),
+	GATE(ZX297520V3_TIMER_LF_PCLK,     "timer_lf_pclk",  "lsp_pclk",       0x44,  1, 0),
+	GATE(ZX297520V3_SPI1_WCLK,         "spi1_wclk",      "spi1_div",       0x48,  0, 0),
+	GATE(ZX297520V3_SPI1_PCLK,         "spi1_pclk",      "lsp_pclk",       0x48,  1, 0),
+	GATE(ZX297520V3_TIMER_L11_WCLK,    "timer_l11_wclk", "timer_l11_div",  0x4c,  0, 0),
+	GATE(ZX297520V3_TIMER_L11_PCLK,    "timer_l11_pclk", "lsp_pclk",       0x4c,  1, 0),
+	GATE(ZX297520V3_TDM_WCLK,          "tdm_wclk",       "tdm_div",        0x50,  0, 0),
+	GATE(ZX297520V3_TDM_PCLK,          "tdm_pclk",       "lsp_pclk",       0x50,  1, 0),
+};
+
+static const char * const zx297520v3_lsp_inputs[] = {
+	"mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+	"osc26m", "osc32k", "tdm_wclk", "dpll_d4"
+};
+
+static const char * const zx297520v3_lsp_inputs_enable[] = {
+	"pclk"
+};
+
+static const struct zx_clk_data zx297520v3_lsprm_data = {
+	.inputs_enable = zx297520v3_lsp_inputs_enable,
+	.num_inputs_enable = ARRAY_SIZE(zx297520v3_lsp_inputs_enable),
+	.inputs = zx297520v3_lsp_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_lsp_inputs),
+	.muxes = zx297520v3_lsp_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_lsp_muxes),
+	.divs = zx297520v3_lsp_dividers,
+	.num_divs = ARRAY_SIZE(zx297520v3_lsp_dividers),
+	.gates = zx297520v3_lsp_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_lsp_gates),
+	.reset_auxdev_name = "zx297520v3_lsprst"
+};
+
+static const struct of_device_id of_match_zx297520v3[] = {
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = &zx297520v3_lsprm_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3);
+
+static int zx297520v3_lspclk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	return zx_clk_common_probe(dev, dev->of_node, device_get_match_data(dev));
+}
+
+static struct platform_driver clk_zx297520v3_lsp = {
+	.probe = zx297520v3_lspclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3",
+		.of_match_table = of_match_zx297520v3,
+	},
+};
+
 static struct platform_driver * const clk_zx297520v3_drivers[] = {
 	&clk_zx297520v3_top,
 	&clk_zx297520v3_matrix,
+	&clk_zx297520v3_lsp,
 };
 
 static int __init clk_zx297520v3_init(void)

-- 
2.53.0


