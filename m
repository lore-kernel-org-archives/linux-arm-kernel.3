Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD090C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eirY1w1ehwYGHYRaAvZaN+edvh4cuYnCoMC6w9KS9p4=; b=ynZDDFxrIYdkKTIsPv23jgy/8C
	rYHzFGrOPe9Dv7gyJTnUiu7sYwoNXDcbyop5GCaIgCZ53UpjIBGHhTMvI8jgNF5QQgxmZVgIWgb+I
	nd81uH3iR5LrHfTHWgoHUB4Fv6bvM3kWyCrypCKzl3hxw/Tl04c1532PNy1HqQlFbvCy6CCb1658w
	vO+0TS1ZvoDbSzttmVb3CSoASNQ2P/Wp9t7hn8AqAkDBUon46y5Ubluqwu4y/Q2msPfZARmV4fIph
	UXWETP9C4oKbDIl/udGcCB/Ijk1I5CvITIY6G6hqjB5f+5AJrCUZquT6sCUJaeqB/kqFROxszNqfP
	pnfFaNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvff-0000000DLF2-3xbI;
	Sun, 28 Jun 2026 20:00:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdvfV-0000000DL5x-2OFp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 19:59:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493a613571eso6201615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676792; x=1783281592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eirY1w1ehwYGHYRaAvZaN+edvh4cuYnCoMC6w9KS9p4=;
        b=MnZ48xseLAWLPLTAbfjbbZwZf56ry+Cx4NNZQEKY5zSS0wDGecaw9eNUmQXOrm7pZa
         lmJYxCSDbWP87hlXmsHSdgHkpjbZfy8ERbmDbtT4Jglv1Ws33OXa5qFsSBt1TuTcCjQQ
         M9UfIR2WqPXp/loHOl/AtPXz71q36AlVX2WC3/9Ql3KrRAxFxA3G/4sxf6F1jjPTHsCd
         12OSyujmFToiQLFk1dUjE9ikCHlTUrVuLO0EmnZ0w9PmqA33QySUh1ap/6yPqIq1nbOK
         PqHrzhAysphm7HxDVIn393TRrrK46/I87ewfW4BBYS+dZBeIjhwaf38gO+tcxgrfdhtD
         aPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676792; x=1783281592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eirY1w1ehwYGHYRaAvZaN+edvh4cuYnCoMC6w9KS9p4=;
        b=FwYaG7as/WxRWyF5Zob/QrnwiCYc/tkhW0Vz4JFm6yZHtDFJZxCMmHvc9gRHsBfZBO
         bn3lKpvc/yYz557P6/M5/BBbw2L4Xi27Sj2Y4DSbwYpgvo4v4l298nX4YgLP1Ygsq82g
         7cVLjzTAV5FVUz3DL8W/wAAEqFXMZk93ebNku6782mjIEr+BRdlxpkHwJc1Kp+jkwYsf
         st7S96cTPJVRVWAJP0e5f85ZAG+2+zJe4nNcZc6pZDyzlk1bwN7ulKkjgcrJLMb9pEv5
         HIc7TD2bI48BCYgo25LA1wEYdCkirLZDpQY5yKd30nmSGVmADHQ0qgu08BC4W/G2fALc
         apUA==
X-Forwarded-Encrypted: i=1; AFNElJ+mTsjAzZnE/TuAW4LPqUTfe1xo5dFRtYlW8J3LiTuuHgE3k3VippGdfcLIUooma/rRbHo2zwFBSiNUC4Ty9xI1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmbrw32z/1YV/ZAMkNXObxwKs3fFtYnZKxnI39lVbPvoZHWkFf
	0K5ko4l9L9arAEI7GaNf5dSYxZHChxoZ9UDe0uwGpHYmdtUjpqLg5SyE
X-Gm-Gg: AfdE7cnJF2OOtqOazw7Vb0P2+9KHkk/Jf30pWYEqoB93q4RYNtQE7WgCHgGZ0qt0lLH
	lSp0jJSb51r0RzvsCB307+XopkRrVHqHeZLtIS063EqZvm3SA38tkL1+Ji57JoA8DD1ymWyaxkT
	mAeRMxyURo775s3sR3jikHz5+gqaOJ6+bV8XK1TNx4Gr1bNKXxmuhTnzW8+bKk7RAAwZ3BvJewk
	Of3SV++gBeeWxTh8Qo4SFscCCfKLtVFJlA4Mt6YZpIO7Yt/yBUWwPHzXcyE0qCUaTFPYxUo6n+h
	Ny3tC7SUF8xxpiAD/5FANC5khhERQRUj2CsZ5uHbCj003iwui7ncYshD9oNMPdlsFoQFg/bh7y/
	02kHKV4VjOWpLJ1zVTtllhAmXOIQdMjI5bvnHBBhoBLigbz6bwOUwMcsUrBpGmt8/MsB7Luivu+
	mjP35WWLWFZqJfwc0WAQLXgsu2C5c2qPPG0A==
X-Received: by 2002:a05:600c:154d:b0:493:a6b7:cae5 with SMTP id 5b1f17b1804b1-493a6b7cc46mr47911315e9.28.1782676791821;
        Sun, 28 Jun 2026 12:59:51 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:51 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:04 +0300
Subject: [PATCH RFC v5 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-9-79ff044e4192@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9968;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2Wm8V/omJ4palb5x1gunNjT+n3CuQAqFKlg4b4DcTPs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0Uv7oMNPi4DCMh2VQ/6CUEm5MZ5ByKi6Sl5
 jO82byXMzKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIK6g//drGqHGQtTZdKLqxMAShcWiiXjPsl8MW
 wbPZHkFxyzDLZNlnU0TUITlZAx+qTmG+2u5R82rHYktB9G5w4Zf6cbm0c2dlCaiZrX3G8lGupTQ
 rJTLiLKExpO3C4/AZo8p8az3KXVpDJsdewmOKPdlBDaJGSTu+d6nI67ZKATq1qgtV39FBYhDExX
 2z/857Pi2/F+A/SgwIba1WUg6x++M55HJHCxi476lHo5Hm/nSThcvypyD6HCarxuKkrZbJny/6J
 LzOI7yGMBqDLEIRrrw4r9VCMhZlRpJem90lr6H/FvOtMzqr7eUFi0Oui+EyuRe1bl6X5CfxB6R3
 jtsssmzJnRpBbOiYZExYXYoJOkJ1aHhT02ULiwDUtjWxq3KPev1ArKwIdRAZf3/qatEyzgazvON
 Arw2TooN1rIdniSc8y7c14MjJ+1zirxPZ07L9tQVs9Pp3gesoV/5s9m4QtmE65zUo+DQkgCqRrS
 iqiTvaN6aKApfmjPuOnZ4V/H6r6r7j/FXDg9ofsXskhU1yY705nWnRpmFuEahPK2rN3cprv68C8
 R7wY3TKoLXBxDjIuwDefShklwRsiRmqRhBEI+TZXiMvcx5sF1/tZiEFWsl/Y+A7r8mTwJOzADH2
 3pT08SMbooHsc4cFDWCrRIY1U3IO7AQxJSxCv+zHa48zR03mAaZw=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_125953_685914_6A15EDFB 
X-CRM114-Status: GOOD (  28.36  )
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

This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
Ethernet. The only non-clock, non-reset registers I have spotted here
are hardware spinlocks.

I put the entire set of PLL generated frequencies as consumed clocks in
the binding. Due to lack of a data sheet I can't rule out that the any
of the PLL subdivions are used.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 5:
Make it an MFD child device, remove aux device
Fix zx297529 -> zx297520 typos
Fix AHB_wclk -> ahb_wclk. That was a leftover of my old composite structs
Add SRAM0 and GSM_CFG clocks
---
 drivers/clk/zte/clk-zx297520v3.c | 186 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index bb3d64eff909..17e1f741b48c 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -431,8 +431,194 @@ static struct platform_driver clk_zx297520v3_top = {
 	},
 };
 
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
+static const struct zx_mux_desc zx297520v3_matrix_muxes[] = {
+	MUX(0,                             "cpu_mux",        cpu_sel,          0x20,  0, 2),
+	MUX(0,                             "sd0_mux",        sd0_sel,          0x50,  4, 3),
+	MUX(0,                             "sd1_mux",        sd1_sel,          0x50,  8, 3),
+	MUX(0,                             "nand_mux",       nand_sel,         0x50, 12, 2),
+	MUX(0,                             "edcp_mux",       edcp_sel,         0x50, 16, 2),
+	MUX(0,                             "tdm_mux",        tdm_sel,          0x50, 24, 2),
+};
+
+static const struct zx_gate_desc zx297520v3_matrix_gates[] = {
+	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in topclk+0x138, which
+	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't really tell the
+	 * difference between matrix+28 and top+138. The clock (maxtrix+0x24) can be disabled and
+	 * enabled from the Cortex M0 and it will nicely stop and restart the A53, retaining all
+	 * state.
+	 *
+	 * 0x50, bits 0-3 have the DDR clock. A lot of DDR gates and resets are in 0x100.
+	 */
+	GATE(ZX297520V3_CPU_WCLK,          "cpu_wclk",       "cpu_mux",        0x24,  1,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_CPU_PCLK,          "cpu_pclk",       clk_main[0],      0x24,  2,
+		CLK_IS_CRITICAL),
+
+	/* ZSP aka LTE DSP clock. I think there is a mux at matrix+0x30, but I have no idea
+	 * about the frequencies it selects.
+	 */
+	GATE(ZX297520V3_ZSP_WCLK,          "zsp_wclk",       clk_unknown[0],   0x3c,  0, 0),
+
+	GATE(ZX297520V3_SD0_WCLK,          "sd0_wclk",       "sd0_mux",        0x54, 12, 0),
+	GATE(ZX297520V3_SD0_PCLK,          "sd0_pclk",       clk_main[0],      0x54, 13, 0),
+	GATE(ZX297520V3_SD0_CDET,          "sd0_cdet",       "osc32k",         0x54, 14, 0),
+	GATE(ZX297520V3_SD1_WCLK,          "sd1_wclk",       "sd1_mux",        0x54,  4, 0),
+	GATE(ZX297520V3_SD1_PCLK,          "sd1_pclk",       clk_main[0],      0x54,  5, 0),
+	/* I don't know how the cdet clock works. Card detection in the way the dwc,mmc driver uses
+	 * it appears broken no matter this clock's setting.
+	 */
+	GATE(ZX297520V3_SD1_CDET,          "sd1_cdet",       "osc32k",         0x54,  6, 0),
+
+	/* This is some "denali" NAND, not the qspi connected one */
+	GATE(ZX297520V3_NAND_WCLK,         "nand_wclk",      "nand_mux",       0x54, 20, 0),
+	GATE(ZX297520V3_NAND_PCLK,         "nand_pclk",      clk_main[0],      0x54, 21, 0),
+	GATE(ZX297520V3_SSC_WCLK,          "ssc_wclk",       clk_unknown[0],   0x84,  1, 0),
+	GATE(ZX297520V3_SSC_PCLK,          "ssc_pclk",       clk_main[0],      0x84,  2, 0),
+
+	/* Yes, WCLK bit > PCLK bit for EDCP */
+	GATE(ZX297520V3_EDCP_WCLK,         "edcp_wclk",      "edcp_mux",       0x64,  2, 0),
+	GATE(ZX297520V3_EDCP_PCLK,         "edcp_pclk",      clk_main[0],      0x64,  1, 0),
+
+	/* There are a lot more VOU related controls in these registers, but turning off the main
+	 * clock seems to shut off the entire VOU MMIO range.
+	 */
+	GATE(ZX297520V3_VOU_WCLK,          "vou_wclk",       clk_unknown[0],  0x168,  0, 0),
+	GATE(ZX297520V3_VOU_PCLK,          "vou_pclk",       clk_main[0],     0x168,  1, 0),
+
+	/* PDCFG. Like PMM, either clock bit will allow the device to function. */
+	GATE(ZX297520V3_PDCFG_WCLK,        "pdcfg_wclk",     clk_unknown[0],   0x88,  0,
+		CLK_IS_CRITICAL),
+	GATE(ZX297520V3_PDCFG_PCLK,        "pdcfg_pclk",     clk_main[0],      0x88,  1,
+		CLK_IS_CRITICAL),
+
+	/* ZTE's driver has a statemt to the effect of *(top->base+0x11c) = 5, with a comment
+	 * suggesting that this sets a 50 mhz clock. The clock code itself lists gmac clocks in
+	 * matrix+110 and lists the parents of these clock as 50mhz gpll output, but the GMAC
+	 * driver never enables the clocks. It turns out ZTE's code is highly misleading.
+	 *
+	 * The GMAC's work clock is definitly not any gpll output because it keeps working fine with
+	 * gpll disabled. The MDIO speed is mostly unaffected by mpll speed changes, so it is most
+	 * likely not fed by mpll either. All other PLLs can be disabled without breaking GMAC, so
+	 * osc26m is the only possible remaining parent.
+	 *
+	 * The GMAC Gates are left enabled by the boot loader and are required for the GMAC to work.
+	 *
+	 * As for the 50 MHz comment: See rmiiphy_wclk.
+	 */
+	GATE(ZX297520V3_GMAC_WCLK,         "gmac_wclk",      clk_main[0],     0x110,  0, 0),
+	GATE(ZX297520V3_GMAC_PCLK,         "gmac_pclk",      clk_main[0],     0x110,  1, 0),
+	GATE(ZX297520V3_GMAC_AHB,          "gmac_ahb",       "ahb_wclk",      0x110,  2, 0),
+
+	GATE(ZX297520V3_MBOX_PCLK,         "mbox_pclk",      clk_main[0],      0x88,  2, 0),
+	GATE(ZX297520V3_SRAM0_PCLK,        "sram0_pclk",     clk_main[0],      0x88,  4, 0),
+	GATE(ZX297520V3_GSM_CFG_PCLK,      "gsm_cfg_pclk",   clk_main[0],      0x88,  8, 0),
+	GATE(ZX297520V3_DMA_PCLK,          "dma_pclk",       clk_main[0],      0x94,  3, 0),
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
+	 */
+	GATE(ZX297520V3_LSP_MPLL_D5_WCLK,  "lsp_mpll_d5",    "mpll_d5",        0x7c,  0, 0),
+	GATE(ZX297520V3_LSP_MPLL_D4_WCLK,  "lsp_mpll_d4",    "mpll_d4",        0x7c,  1, 0),
+	GATE(ZX297520V3_LSP_MPLL_D6_WCLK,  "lsp_mpll_d6",    "mpll_d6",        0x7c,  2, 0),
+	GATE(ZX297520V3_LSP_MPLL_D8_WCLK,  "lsp_mpll_d8",    "mpll_d8",        0x7c,  3, 0),
+	GATE(ZX297520V3_LSP_MPLL_D12_WCLK, "lsp_mpll_d12",   "mpll_d12",       0x7c,  4, 0),
+	GATE(ZX297520V3_LSP_OSC26M_WCLK,   "lsp_osc26m",     clk_main[0],      0x7c,  5, 0),
+	GATE(ZX297520V3_LSP_OSC32K_WCLK,   "lsp_osc32k",     "osc32k",         0x7c,  6, 0),
+	GATE(ZX297520V3_LSP_PCLK,          "lsp_pclk",       clk_main[0],      0x7c,  7, 0),
+	GATE(ZX297520V3_LSP_TDM_WCLK,      "lsp_tdm_wclk",   "tdm_mux",        0x7c,  8, 0),
+	GATE(ZX297520V3_LSP_DPLL_D4_WCLK,  "lsp_dpll_d4",    "dpll_d4",        0x7c,  9, 0),
+};
+
+static const char * const zx297520v3_matrix_inputs[] = {
+	"osc26m", "osc32k",
+	"mpll", "mpll_d2", "mpll_d3", "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+	"mpll_d16", "mpll_d26",
+	"upll", "upll_d2", "upll_d3", "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+	"upll_d16",
+	"dpll", "dpll_d2", "dpll_d3", "dpll_d4", "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12",
+	"dpll_d16",
+	"gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5", "gpll_d6", "gpll_d8", "gpll_d12",
+	"gpll_d16",
+};
+
+static const struct zx_clk_data zx297520v3_matrixclk_data = {
+	.inputs = zx297520v3_matrix_inputs,
+	.num_inputs = ARRAY_SIZE(zx297520v3_matrix_inputs),
+	.muxes = zx297520v3_matrix_muxes,
+	.num_muxes = ARRAY_SIZE(zx297520v3_matrix_muxes),
+	.gates = zx297520v3_matrix_gates,
+	.num_gates = ARRAY_SIZE(zx297520v3_matrix_gates),
+};
+
+static int zx297520v3_matrixclk_probe(struct platform_device *pdev)
+{
+	return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node,
+				   &zx297520v3_matrixclk_data);
+}
+
+static struct platform_driver clk_zx297520v3_matrix = {
+	.probe = zx297520v3_matrixclk_probe,
+	.driver = {
+		.name = "zx297520v3-matrixclk",
+	},
+};
+
 static struct platform_driver * const clk_zx297520v3_drivers[] = {
 	&clk_zx297520v3_top,
+	&clk_zx297520v3_matrix,
 };
 
 static int __init clk_zx297520v3_init(void)

-- 
2.53.0


