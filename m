Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5E3CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRkOYhMC8sbVplv828DowOEo6OjLCAbHbvcg1bLlquU=; b=1TycuvmX3i4+wW5I0xbCBqb51k
	QXNN1AkkSIi6bywL0u2dt0Pi0NfCMkcNURTUXc7qyxeBu70byb/f2iSLx61ej9rNruLe3x0w89teL
	jbeJzWil+zbtGtL0hw+AjVNseYYp/19KDj0SsWFYeQx/g66hEx/q7Gs76gjJreS4ohwG9JVwtS6e/
	fgbQY8e7+fzHx/T/lYd4T7XRVyXdSAyBrBnf0RcM+dAW4wK1hk5aZn+mU0uizSBkibCN0uesGprZ9
	aAPLJEWRFoe/XQxrfN6RresSIIeIWrMRG2MqZuEjXtYHLftLBajf5nPPBPFups/xEbmElGydlh6er
	woNyGHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMC2d-0000000Bh95-1LFr;
	Sun, 10 May 2026 21:50:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMC2a-0000000Bh72-3y2C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:50:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43eb05b1875so2121676f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778449823; x=1779054623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRkOYhMC8sbVplv828DowOEo6OjLCAbHbvcg1bLlquU=;
        b=WqQaQCm++OH0DShTFZb2sYfc6fCbjQyzNDuIGvOgOkNFngx9PSw+KSkcBi7E9fAasm
         qR7zF8JpxQYppBmDlO9WyOiCzsZ9PyLSKZLNKO0sNgNl4pUIQDCCs/5JyfTx9UUwUxAb
         hTsbukShpUzsgY22z9FyXE7grYit7pDJdF0c/BLrMlYJHY9T0Vkv+VbEnC3DvANvqTpS
         cw50vIUJsRmeD3cVP7n9aXtrrPM8/+GCP1xpN+hFXbOIeLtze4npRBSs2Vx/vRCF2nQh
         WUJ3wq2UG1B2MFnSpuhIzc28jYac9GTbErxOdfPOVlpas0Rc5RrnPjks6E1dFbjNwicp
         3yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778449823; x=1779054623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LRkOYhMC8sbVplv828DowOEo6OjLCAbHbvcg1bLlquU=;
        b=AIFvZ+GHGOQdwQ2jTPgn4jtvWRvpsvyOz0nA2AzH17lbx6XHLdKYvWG/xz/CAMisEb
         xOy1OHfzz7qjXQBkeEzQLG6E9/ohk8kZcWCcK7VWky0qDhK0Zi7B2e+tzTNz57C66WYL
         TKGka+ioaVTYpgSy68uokEM+GOsf/GPFIuv6tjlbaVmvXvcjIkohcFnP/SJGGRRzUO23
         +99C5h+HlsmTnmTjxUyCWqXW/wxSb34xpxciQgKvH4ASCRwGRuGn+Igf0DDziYTfIWjd
         BB9/Y2BxR/liyugMYHyPLXUvrtGp+ywxPrnOr8GF7LiOqJ2V72dd/P/H3MKQrXafl6/I
         HmZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HKi6sou6R8DX+pmtGTUS20VBo9XeF4czAHBGBE8Z04Z5/Os4sDYPLR1Vm5lr5d2CQgd2S/l/fcmZ522fc5SGb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj8rc7MEocKHDf74hMG8m/9uL5QSUffWNQKZE4O2oi687rwUdE
	hFJhJeL2VclQnaZv/d3DhONOh4hLGp2wonvp7WmEjQMbZ8Z3552HF3/N
X-Gm-Gg: Acq92OFyphRU9oK8+2sowJRNgd+VNniKfx5RyLEhs1o//imUjp1R1F1Ze61BSUCLeUD
	bUqlNpLRPFQgaI9MP/bDHom1iSiD029A5moDttlZTU7R4eFp7+IWYME2jTPaeM6cWuF87USb4FK
	c4Iyrxz0aTGLYZU9GAh8M2TptzuSJFQOtwozrUM4s04dZTYZQOD/j74ZQWlGcBNZPwhT/aGamFx
	ppJhcxlXtaimghQb9SNQb0bw8b7MAQExnOipbk5LGtiKnte2Ou2UYBDVCX0Nf/Gll+bs8HYkHzX
	lFUeCsbs9qR6E9JbKkreyY3/CU1qWBl9nhWAFnVOWcWltfWyp7OLIpJZQDNRDMVPPJVvf2t4cHE
	gc8D8cknLZt+b5DIX2kBzNfF8I302Eu5b2gcPmhG90CIGTKB9sUfhQEfP00mmJAT1pbgDqDM53M
	avpUq1GIDo4C1TZi3M128equ0nzM6NWME=
X-Received: by 2002:a05:6000:144b:b0:43c:f7e5:817b with SMTP id ffacd0b85a97d-4568ae17224mr10528380f8f.19.1778449822930;
        Sun, 10 May 2026 14:50:22 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a68ebsm19207317f8f.1.2026.05.10.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 14:50:22 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 11 May 2026 00:49:52 +0300
Subject: [PATCH RFC v2 3/4] clk: zte: Introduce a driver for zx297520v3
 matrix clocks and resets.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-zx29clk-v2-3-29f0edc300f5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10145;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=pxOX5J9a6t3qJy8x/9h97yQyy0Kh8VtqmvNPfJ6QVj8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqAP2SDir1CuTCLtPRJH1i7/B8EcaSN1veBsq4X
 UO+zqKSJeGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagD9khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIIqBAAg+3hXvr7t48dhJ6fUgn5AKr7wTfesco
 Lv9d17gQZxbkRN8lX6n+4RVPUW5HoDZx9IBIbwPvTNiXIZDtWI2c8TzjtWyV4A6fjjLkNLdnDjR
 kIYGa78euQsytsHWWRIP+zBci07ISJSb/TLsETo5z+A7PPhV/lytHMkR1X//8FxzdGQmSweAqA+
 kFI/uovpnMngGKlgsesWQ0Tx+y/pkGAFQlDB1SNa4/T15TgPpEBhZJOV0DknC+jC3hZU3kvvEuy
 ECJopaG56alUsUKwMsz3mVQl81jPTg+vztbYQVASuj2uNOUhRaMJznu10X1w2OOAan7+/sbosSO
 o+mOoVePqPnQDqWboMS5KmB6AbbnGrUSrLfXwMmfSCahhXgf5EXdjlldXhtoMfLix9tzw0psThZ
 s/39PLck//DbZAWLhDsm0mZ4OhzulAaI6KV+nzVw4UKGI3dqL475eHWAblyhgNKB7R93IexYJgt
 v9zbnTOEtJpc8V9oeQfOnQh7dpV/CH5vsOlQD1bm4X84v6atTijVSnI9PwICQgioxG+6+Bu6HOS
 sxu3m4NOdS2AmjphcLlfmc01SloV21iQIAt/wrkCYDRHxlMiSP9zXTZbISWOPif5i7QvXhIeLLN
 ccoCDBqu+scetD06BvMeugw/05Acnd4o59y3pdqSuLUqSGLt/aGI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_145025_090584_5B590B4B 
X-CRM114-Status: GOOD (  38.75  )
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

This controls the CPU, DSP, DDR RAM, ethernet, SDIO controllers and a
few more devices. It also contains a number of clock gates to pass
clock signals down to the next controller.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/clk/zte/clk-zx297520v3.c | 215 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 214 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index aa304dd34b7b..d4b683cb6354 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -266,7 +266,7 @@ static int zx297520v3_pll(struct device *dev, void __iomem *base, const char *na
 	/* These are the fractionals of the PLLs I have seen. There should be a better way to
 	 * generate them than hardcode the list.
 	 */
-	static const unsigned int pll_fract[] = {2, 3, 4, 5, 6, 8, 12, 26};
+	static const unsigned int pll_fract[] = {2, 3, 4, 5, 6, 8, 12, 16, 26};
 
 	unsigned long ref, refdiv, fbdiv, vco, postdiv1, postdiv2, freq;
 	struct clk_hw *hw;
@@ -578,6 +578,219 @@ static struct platform_driver clk_zx297520v3_topclk = {
 };
 module_platform_driver(clk_zx297520v3_topclk);
 
+static const char * const cpu_sel[] = {
+	"osc26m",
+	"mpll",		/* 624 MHz */
+	"mpll_d2",	/* 312 MHz */
+	"mpll_d4",	/* 156 MHz */
+};
+
+static const char * const sd0_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const sd1_sel[] = {
+	"osc26m",
+	"gpll_d2",	/* 100 MHz */
+	"mpll_d8",	/* 78 MHz */
+	"gpll_d4",	/* 50 MHz */
+	"mpll_d16",	/* 39 MHz */
+	"gpll_d8",	/* 25 MHz */
+};
+
+static const char * const nand_sel[] = {
+	"mpll_d4",	/* 156 MHz */
+	"osc26m",
+};
+
+static const char * const edcp_sel[] = {
+	"osc26m",
+	"mpll_d4",	/* 156 MHz */
+	"mpll_d5",	/* 124.8 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const char * const tdm_sel[] = {
+	"osc26m",
+	"dpll_d4",	/* 122.88 MHz */
+	"mpll_d6",	/* 104 MHz */
+};
+
+static const struct zx297520v3_composite matrix_clocks[] = {
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+28 and top+138. The clock can be disabled and enabled from the
+	 * Cortex M0 and it will nicely stop and restart the A53, retaining all state.
+	 *
+	 * 0x50, bits 0-3 have the DDR clock. A lot of DDR gates and resets are in 0x100.
+	 */
+	ZX_CLK_CRIT(CPU,    0x28,  1,  0x24,  1,  2, 0x20,  0, 2, cpu_sel,     0,     0, 0),
+	/* TODO: 0x54 bit 14 and 0x54 bit 6 are supposed to be card detection clocks. */
+	ZX_CLK(SD0,         0x58,  1,  0x54, 12, 13, 0x50,  4, 3, sd0_sel,     0,     0, 0),
+	ZX_CLK(SD1,         0x58,  0,  0x54,  4,  5, 0x50,  8, 3, sd1_sel,     0,     0, 0),
+	/* This is some "denali" NAND, not the qspi connected one. */
+	ZX_CLK(NAND,        0x58,  4,  0x54, 20, 21, 0x50, 12, 2, nand_sel,    0,     0, 0),
+	ZX_CLK(SSC,         0x94, 24,  0x84,  1,  2, 0,     0, 0, clk_unknown, 0,     0, 0),
+	ZX_CLK(EDCP,        0x68,  0,  0x64,  2,  1, 0x50, 16, 2, edcp_sel,    0,     0, 0),
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. */
+	ZX_CLK_CRIT(PDCFG,  0x94, 20,  0x88,  0,  1, 0x50, 16, 2, clk_unknown, 0,     0, 0),
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	ZX_CLK(VOU,        0x16c,  0, 0x168,  0,  1, 0,     0, 0, clk_main,       0,     0, 0),
+};
+
+static const struct zx297520v3_gate matrix_gates[] = {
+	/* ZTE's driver has a statemt to the effect of *(matrix->base+0x11C) = 5, with a comment
+	 * suggesting that this sets a 50 mhz clock. The clock code itself lists the parents of
+	 * these clock as 50mhz pll output, but the GMAC driver never enables the clocks.
+	 *
+	 * The clocks below are enabled by the boot loader though, so they are on. And it turns
+	 * out that they are necessary for proper operation of the ethernet hardware. As far as
+	 * I can see trough experimentation, bit 1 affects the PHY whereas 0 and 2 affect the
+	 * MAC chip itself.
+	 *
+	 * Chain the wclk and rmii clk together for now. I haven't found a way to make either
+	 * the mdio node or the phy node enable a clock. According to ethernet-phy.yaml it is
+	 * supposed to be possible, but I can't find code to that effect in of_mdio.c.
+	 */
+	{ZX297520V3_GMAC_PCLK,	"gmac_pclk",		"gpll_d4",	0x110,	  0},
+	{ZX297520V3_GMAC_RMII,	"gmac_rmii",		"gpll_d4",	0x110,	  1},
+	{ZX297520V3_GMAC_RMII,	"gmac_wclk",		"gmac_rmii",	0x110,	  2},
+
+	/* ZSP aka LTE DSP clock. I think there is a mux at matrix+0x30, but I have no idea
+	 * about the frequencies it selects. Gate is at matrix+0x3c.
+	 */
+	{ZX297520V3_ZSP_WCLK,	"zsp_wclk",		"osc26m",	0x3c,	  0},
+
+	/* Mailbox. I haven't found a reset for this. It seems to have a PCLK only - turning it off
+	 * makes the MMIO area read 0x0. It looks like it does not need a WCLK. It generates IRQs
+	 * fine with just bit 2 set. Bits 1 and 3 are 0 by default in this register.
+	 */
+	{ZX297520V3_MBOX_PCLK,	"mbox_pclk",		"osc26m",	0x88,	  2},
+
+	/* DMA Controller. It has a reset and PCLK, but no WCLK. */
+	{ZX297520V3_DMA_PCLK,	"dma_pclk",		"osc26m",	0x94,	  3},
+
+	/* There is another clock controlling some "GSM" IP at 0xF3000000 in 0x88, bit 8. It appears
+	 * to be a PCLK, but I have not found a matching WCLK or reset yet.
+	 */
+
+	/* LSP uplink clocks. The PCLK is fairly obvious (disabling it shuts off the entire LSP
+	 * register area). The WCLK speeds were deduced by setting timers and qspi muxes to a
+	 * specific speed and seeing which bit in matrix+0x7c needs to be enabled for the device
+	 * to work.
+	 *
+	 * Due to the timers I am certain about the 26mhz and 32khz clocks. I cannot directly
+	 * observe the qspi mux frequency, so the clock rates depend on ZTE's qspi mux selection
+	 * being correct.
+	 *
+	 * Two additional bits are specific to sound components - the mux for the LSP's TDM IP is
+	 * in matrixclk and gets passed down. I2S has a mux in LSP, which can select the dpll_d4
+	 * clock.
+	 *
+	 * This code is commented out until the next patch because disabling unused clocks without
+	 * an LSP consumer breaks the UART.
+	 */
+#if 0
+	{ZX297520V3_LSP_MPLL_D5_WCLK,	"lsp_mpll_d5",	"mpll_d5",	0x7c,	  0},
+	{ZX297520V3_LSP_MPLL_D4_WCLK,	"lsp_mpll_d4",	"mpll_d4",	0x7c,	  1},
+	{ZX297520V3_LSP_MPLL_D6_WCLK,	"lsp_mpll_d6",	"mpll_d6",	0x7c,	  2},
+	{ZX297520V3_LSP_MPLL_D8_WCLK,	"lsp_mpll_d8",	"mpll_d8",	0x7c,	  3},
+	{ZX297520V3_LSP_MPLL_D12_WCLK,	"lsp_mpll_d12",	"mpll_d12",	0x7c,	  4},
+	{ZX297520V3_LSP_OSC26M_WCLK,	"lsp_osc26m",	"osc26m",	0x7c,	  5},
+	{ZX297520V3_LSP_OSC32K_WCLK,	"lsp_osc32k",	"osc32k",	0x7c,	  6},
+	{ZX297520V3_LSP_PCLK,		"lsp_pclk",	"osc26m",	0x7c,	  7},
+	{ZX297520V3_LSP_TDM_WCLK,	"lsp_tdm_wclk",	"tdm_mux",	0x7c,	  8},
+	{ZX297520V3_LSP_DPLL_D4_WCLK,	"lsp_dpll_d4",	"dpll_d4",	0x7c,	  9},
+#endif
+};
+
+static int zx297520_matrixclk_probe(struct platform_device *pdev)
+{
+	struct zx29_clk_controller *matrix;
+	struct device *dev = &pdev->dev;
+	struct clk_hw *hw;
+	unsigned int i;
+	int res;
+
+	dev_info(dev, "Registering zx297520v3 matrix clocks\n");
+
+	matrix = devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
+					    resets[ZX297520V3_MATRIXRST_END]), GFP_KERNEL);
+	if (!matrix)
+		return -ENOMEM;
+
+	matrix->clocks = devm_kzalloc(dev, struct_size(matrix->clocks, hws,
+				   ZX297520V3_MATRIXCLK_END), GFP_KERNEL);
+	if (!matrix->clocks)
+		return -ENOMEM;
+	matrix->clocks->num = ZX297520V3_MATRIXCLK_END;
+
+	matrix->base = devm_platform_ioremap_resource(pdev, 0);
+	WARN_ON(!matrix->base);
+
+	/* One stray mux: The TDM mux is in matrixclk and it is passed to the LSP controller. In a
+	 * way the link gate (LSP_TDM_WCLK) could be considered a matching gate, but there is no
+	 * reset and no pclk.
+	 */
+	hw = devm_clk_hw_register_mux(dev, "tdm_mux", tdm_sel, ARRAY_SIZE(tdm_sel), 0,
+				      matrix->base + 0x50, 24, 2, 0, &reg_lock);
+
+	res = zx297520v3_composite(dev, matrix->base, matrix->clocks, matrix->resets,
+				   matrix_clocks, ARRAY_SIZE(matrix_clocks));
+	if (res)
+		return res;
+
+	res = zx297520v3_gate(dev, matrix->base, matrix->clocks,
+			      matrix_gates, ARRAY_SIZE(matrix_gates));
+	if (res)
+		return res;
+
+	for (i = 0; i < ZX297520V3_MATRIXCLK_END; i++) {
+		if (IS_ERR(matrix->clocks->hws[i])) {
+			pr_err("zx297520 clk %d: register failed with %ld\n",
+				i, PTR_ERR(matrix->clocks->hws[i]));
+			return -ENODEV;
+		}
+	}
+
+	res = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, matrix->clocks);
+	if (res)
+		return res;
+
+	matrix->resets[ZX297520V3_DMA_RESET].reg = matrix->base + 0x70;
+	matrix->resets[ZX297520V3_DMA_RESET].mask = BIT(0) | BIT(1);
+	matrix->resets[ZX297520V3_GMAC_RESET].reg = matrix->base + 0x114;
+	matrix->resets[ZX297520V3_GMAC_RESET].mask = BIT(0) | BIT(1);
+
+	matrix->rcdev.owner = THIS_MODULE;
+	matrix->rcdev.nr_resets = ZX297520V3_MATRIXRST_END;
+	matrix->rcdev.ops = &zx297520v3_rst_ops;
+	matrix->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &matrix->rcdev);
+}
+
+static const struct of_device_id of_match_zx297520v3_matrixclk[] = {
+	{ .compatible = "zte,zx297520v3-matrixclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_matrixclk);
+
+static struct platform_driver clk_zx297520v3_matrixclk = {
+	.probe = zx297520_matrixclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-matrixclk",
+		.of_match_table = of_match_zx297520v3_matrixclk,
+	},
+};
+module_platform_driver(clk_zx297520v3_matrixclk);
+
 MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
 MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0


