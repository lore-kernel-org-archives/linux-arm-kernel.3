Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8403ACD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6GY5IuJzx23m60s6A8vYe4mS1IBwBzCIrH9BI78VSQ=; b=OOH3QHuqW41LXVBr6NxvQO1ZOb
	i272exhPV5mdtQcCcFzw6kTxGuNdMkJOa9QwP1GoEMTdrk2Avnwq7MEQ/KoxPhkBTSzI9PboYsAdo
	24WJOyKvBX6v2r5kjaB3qDRrrDKXwYGqWErs1cpcQDOz/M+P7MCQW68HV3NZ6ZtQ0lvxQBAk42PhD
	zHLTSAU6LHNMPAEYLZs7FDLYB4cwAsq1yXJeLKPGYqfVYNPrpCcfZ9cTgi1MD/e9DDq+Bnrbp6oiS
	cgNVrzuWohbKAKH5FpBlOB6EGm34ncdV2juPqRd01zKNSSpOiFq+yZboYAd1ABolMHSYf1nLicCGh
	DqBfM8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSihH-00000006Qps-1HLR;
	Thu, 28 May 2026 21:55:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSih7-00000006Qjs-3oPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:55:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4903974854dso66214195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780005312; x=1780610112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6GY5IuJzx23m60s6A8vYe4mS1IBwBzCIrH9BI78VSQ=;
        b=GhBoUGIpJm/LcoocnHzeueiDJgM0HQczKB6Qok3Q4g/SwfIYYxwaDaZLPgG5Qf41wG
         OV53bTUQQdP1wZvm5syYjWFDeGdxEhNnCNuiyjKDcgVBcP6fmq3J4teXcOW5FhG2ulBK
         saqcPw+3fy69sGIw391v03FNT+PKU1nkgVP9zzy35kMcLo/WZOUmSgyYX9wtMLyjGVOL
         ZleTQAM0/gXf+9KIiuSQP2q3WDQWDoe7DsFAYKbL5qPLnULaz2gbk2RartcOM52wwDSc
         pDSujjg4uRPC5cDR2PT7Jg1X+MNP8N7WHxOSl9zkX1F8NtPsuG8kH+kVQ0xdLjWlYOr1
         hrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005312; x=1780610112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r6GY5IuJzx23m60s6A8vYe4mS1IBwBzCIrH9BI78VSQ=;
        b=pTq6CtGSYH0C0x2hn7/xT4kAV2NXNU5LoEImIsCkO0bjJY8GoRGH8ZotZ0Yfh82Ty6
         OZbr0qVHaRSnwcpBYigMisf9PjtSc+1JS5lfgkv3AS6285PZlJqkSsoSMw4uoUvksacd
         xj/at8l4eVDmqW7qkgqTIShod7inPzsDjcot7QUfRjNz91snyeHjOLErtbnjJ2IqhOUK
         fi4N14Mm2xqq5Llnkzf6vyY9GmcXKc4S+vrzxFi1GL33B+yGPMQbMTWJwUo96H/gAgO8
         ZR/eKiqPbJXW0HMXzkjGpp5tI2ySJLi8aVG5SGaV1u0ROdo5cR/oy9t6nNZroUFT7RLw
         o5+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+uasATUdMAmAnxTPttuaiHwP/dYdvxgni4aBsQ3MH/hl/KLZ91agbP1tUPrje2YWMkRQiMsWO5w46ycCW/dB8O@lists.infradead.org
X-Gm-Message-State: AOJu0YxkF+MSwlit043O3emj0Il+CTlKgjOOgF9yeSGGkQ1JSk+3PLmV
	sc2U3+iJ+MTVcQj9kNdq9KOslNqK115exzYy68TcXvmWRczehQ+K+aUnu/ad0ZaUq6OaMA==
X-Gm-Gg: Acq92OFBck4SYbdadE3Ndn+lGchd6HOlfdC3eacxPJ3oVwp/rWS5+26pM1/sEf07ez1
	Mm7YMOHddfNwoVXoKtdjsNX5dI0zVhCPVVWSzLUKZVXC4cV/V3mTuwCZrPQ49NhusLfIjRTFF1v
	VnZNh4Y2/i+yoge0zWR9VFISk06seHniDKznGryfafmagq8CVoIjT0ER8ENNFkpo6LhiFoW4nW0
	Ija8YUdssZ6A2nvdxXSxW4TZOhI1QjB9a/avB/8sQhBH3bYkwj4VoPUVFl3Gb90NDNwzjcvouQ/
	URNx9gpCKX1fsyvxVzjeTEcDOjcCjjXkF6H1YgDpGJcFR2aS521wveWLDt3dqTdAF5cVlinyzX9
	L4H116L+Rp8ae6/g08eRfmU8X+6yxX7HZWtE87lv4qn9SYeVjWloY0nZKZPjT7ilmI3ZR8ZO+VB
	b1ktu3MvXQ764On3vY5xjnXTJc4Vw7Ld411T19NrMeOoh6
X-Received: by 2002:a05:600c:1550:b0:490:846d:e2de with SMTP id 5b1f17b1804b1-4909c0bedc5mr4082985e9.28.1780005311929;
        Thu, 28 May 2026 14:55:11 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c967c6csm1191085e9.2.2026.05.28.14.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:55:11 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 29 May 2026 00:53:01 +0300
Subject: [PATCH RFC v3 4/5] clk: zte: Introduce a driver for zx297520v3 LSP
 clocks and resets.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-zx29clk-v3-4-c7fe54ea388f@gmail.com>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
In-Reply-To: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8696;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=AVUFgiK7WQ+mMjNIpR/liazNbRKizRRSLTK4vpplnYY=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqGLmoPxGIR38pv/G8my07awKQKo8toRvnXlCFt
 zwX/d3zrDiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCahi5qBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIB3w//SRm4tIyJw2mD8PlafrWszGcNacBB5JI
 rf7yozIEmAdXZOTMGC4yojuWxZ9V3i3GcNs5MptWRW31ajf0IAPWqgN882jNA4HiZMAzrC7QJMh
 yJcQUOyTpzlKop0FBiMc238oW2RWiG81N3AAVkIifcpwVbkXLZlAubmvFLcI0xYrGEuovO9+/oa
 bnM8FR/8Xv7pQD4YeS8EOBgyAnvCU8VOPBlFUEqPEtlvt0Gf0RxC3wdfEvXaJ9CShqFPD+LuZCZ
 85T6MM9TOspgWMH85TOUPCagXV3UKvcHUmMiIr5lil/Ho9jyh1vxyD5J0df2C/vxMcBGCo2Vo6G
 TkFN/lDycLLEIfvVKU3obXMQqISek42+kZF2mmUyfdUD8X+Rjio2uu61AXOqRBHAUxH1oG4EqAI
 cpkcmq8yn8DxMIIwGqyG98ILApYBu9a/kkxNvfu53K8XM53MGFYrHcfgufJlXH5cgQ5Iw5JxX97
 tTxVT4Pvv/u5D5uQR1paP3QnrnQnAuxIJzdB5VIQ9NEl+SLoGR3j7v9AUzdtKXBUvy5+mYPmLS1
 iphv+5qofVIq7Np6Bp+FLWW7Pm0fxy4I7BjIJ14Sy4Ew5zsP4XqDkuMcx8SRBW3vml0OU7xgv27
 dhOLuSR/H0nGW9kknwGtmzuQnUfs4vSxNameIdiBXsluJ3dEvSNE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145514_011394_F284C0A1 
X-CRM114-Status: GOOD (  29.02  )
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
 drivers/clk/zte/clk-zx297520v3.c | 230 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 229 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 986042dd4caf..a67b7fe332f3 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -755,6 +755,191 @@ static int zx297520_topclk_probe(struct platform_device *pdev)
 	return devm_reset_controller_register(dev, &top->rcdev);
 }
 
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
+						     "mpll_d12", "osc26m", "osc32k", "pclk",
+						     "tdm_wclk", "dpll_d4",
+	};
+
+	struct zx29_clk_controller *lsp;
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+	struct clk *parent;
+	unsigned int i;
+	int res;
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
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
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
+	res = zx297520v3_composite(dev, base, lsp->clocks, lsp->resets,
+				 lsp_clocks, ARRAY_SIZE(lsp_clocks));
+	if (res)
+		return res;
+
+	/* This is to catch holes in the tables rather than registration errors */
+	for (i = 0; i < ZX297520V3_LSPCLK_END; i++) {
+		if (!lsp->clocks->hws[i]) {
+			dev_err(dev, "Clock %u not registered\n", i);
+			return -ENODEV;
+		}
+	}
+
+	res = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, lsp->clocks);
+	if (res)
+		return res;
+
+	for (i = 0; i < ZX297520V3_LSPRST_END; ++i) {
+		if (!(lsp->resets[i].reg && lsp->resets[i].mask)) {
+			dev_err(dev, "Reset %u has no register or mask\n", i);
+			return -ENODEV;
+		}
+	}
+
+	lsp->rcdev.owner = THIS_MODULE;
+	lsp->rcdev.nr_resets = ZX297520V3_LSPRST_END;
+	lsp->rcdev.ops = &zx297520v3_rst_ops;
+	lsp->rcdev.of_node = dev->of_node;
+	return devm_reset_controller_register(dev, &lsp->rcdev);
+}
+
 static const struct of_device_id of_match_zx297520v3_topclk[] = {
 	{ .compatible = "zte,zx297520v3-topclk"},
 	{ }
@@ -768,7 +953,50 @@ static struct platform_driver clk_zx297520v3_topclk = {
 		.of_match_table = of_match_zx297520v3_topclk,
 	},
 };
-module_platform_driver(clk_zx297520v3_topclk);
+
+static const struct of_device_id of_match_zx297520v3_lspclk[] = {
+	{ .compatible = "zte,zx297520v3-lspclk"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_lspclk);
+
+static struct platform_driver clk_zx297520v3_lspclk = {
+	.probe = zx297520_lspclk_probe,
+	.driver = {
+		.name = "clk-zx297520v3-lspclk",
+		.of_match_table = of_match_zx297520v3_lspclk,
+	},
+};
+
+static int __init zx297520v3_clk_module_init(void)
+{
+	int res;
+
+	res = platform_driver_register(&clk_zx297520v3_topclk);
+	if (res) {
+		pr_err("Failed to register driver %s: %d\n",
+		       clk_zx297520v3_topclk.driver.name, res);
+		return res;
+	}
+	res = platform_driver_register(&clk_zx297520v3_lspclk);
+	if (res) {
+		pr_err("Failed to register driver %s: %d\n",
+		       clk_zx297520v3_lspclk.driver.name, res);
+		platform_driver_unregister(&clk_zx297520v3_topclk);
+		return res;
+	}
+
+	return 0;
+}
+
+static void __exit zx297520v3_clk_module_exit(void)
+{
+	platform_driver_unregister(&clk_zx297520v3_lspclk);
+	platform_driver_unregister(&clk_zx297520v3_topclk);
+}
+
+module_init(zx297520v3_clk_module_init);
+module_exit(zx297520v3_clk_module_exit);
 
 MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
 MODULE_DESCRIPTION("ZTE zx297520v3 clock driver");

-- 
2.53.0


