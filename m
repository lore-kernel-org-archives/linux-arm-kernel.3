Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CACC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZbT0Bi0HBJMhnFqg3mGe9eR0Pi0hz39Oao8TpKg6R8=; b=azjpRSckfJZN5Dp17ywxlGgLL+
	alfOavnkAwRRT+lqYeM1FAmimkkoHLvnsptg57pfinkbzXA2As3BojaTnasQZj8Lb2bbKO+DhefDN
	pP0EWG/K2z978cbdqNUcLRAcKH7uJgHclS4+cH43B0pFVcbNUgfzALKMAjAQfpCzJ3ak68sDBat2k
	7MHUSI9ayT4AWPpVay392zpvfcDEUpTS9EeongwWNHauYFbfdq8gGUFUCk3PnuQVJSQRM/yIMbhs1
	96Si3k1Li5UByW16/S1DBDp7usD26wQP9Ze/kdnmIeaBNyuB1uAystPRjgAuM7JZUWZE5xRdxHf3Y
	hBWWcpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1z-00000005Rtr-24LS;
	Thu, 02 Jul 2026 20:29:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfO1w-00000005Rpz-3Ohq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:29:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso14404385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024143; x=1783628943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZbT0Bi0HBJMhnFqg3mGe9eR0Pi0hz39Oao8TpKg6R8=;
        b=pXpAb05hXki3iW2aPkj05DgiqyDgj/F7NVh5fSKsv2Eo1dlD9d95E5GjptsU2gX5GT
         VFtnzNzGv5hB0o0H/yOrfuZXhVik1t/13+tSQsAWnziPdWpgrIDM5CSPauIKczKTb9w5
         5gbVlgZoagGZT5u0MiFsfFQ5mOw+vhhVOX6syz7N9lXpCf3KSyGhwcDl3bjX54x4X4cW
         iMec2CnHjuXxRU7xNJjgd3I6doF99Zq/PyrZqDZEe9uUsqLJioetorCbtyX0/H8lAiBr
         I3S3CAhMBfQkBWX30awJEBxk5+yypAE+6WEk0Yur558A10uHWEGyzG+4BnSi9XzuU9pi
         JL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024143; x=1783628943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZbT0Bi0HBJMhnFqg3mGe9eR0Pi0hz39Oao8TpKg6R8=;
        b=K/znE9F/PStM8zO+nSyRc4iNZ9Bw0rxVT5y6yvJuzg4dL/9GqmiLDfLXd3DkKoXNyU
         5NDdQMd6/rem4NQtAfJPNm/187Sk2ncVl19ouVcU1gk4iRnRPw9Isjgm/oikzltClBfZ
         nc/UJDrh4IeKxVLKw4fjan48iP+aDD7VhXokRx2mXCLXW9j9sdy+jkGvT3mQRUu1KClg
         ygdp/RxYhVSf7X4Q0IzJ10A9Lb360feL7CW/u8JVzf5SK6PunUgk4jKflaGW1IoFYe6i
         1ReM6nAuLzkr1Qqe8w4lX6VFPBmRvyGMIixTHe2RU8P/bPHod9e38LFuwyg1rXQYDg0p
         VIhw==
X-Forwarded-Encrypted: i=1; AFNElJ9QEEVCNkrMxF/INoeqoAnhlJaKOiWgKlWYSY/f9LyJiOGyQxfgnRLkbpsZhFg3bCdyZIDgzliwgeuV9UfVGoVz@lists.infradead.org
X-Gm-Message-State: AOJu0YwQZXTJSYpmI6lLCqXE6sJYJ59RBMtWPNu9xvZwXHT3Pofk96EJ
	0GAyyVPxiq5T0A9GOzURwFLBanU/Vz1BSPdRpNkpntveaz37W0MGH4Di
X-Gm-Gg: AfdE7cnMb0/466ox7Tmzl8RAmPBMGJsJQB+m9YFzAnCZQW12iLJ9FjBznYC0jKJQ4zD
	fdUCswbtMiYAzew0IXAR7q7KK/bo+ZesB3SsGwufcGrepEB5hTYIzntB+3nio9DhWPQDPE+H79o
	cBUn/uUT+SQ8ifmmra5WXb1sDCvYuUHbuP6nL0BA8nsT4R+D4Lv/s0/lHWJMTO2h38F3oxrt/iU
	ntBpEMVR6Uj4yvau3mo2RpCRhmVpJlKMlDQ5+plI/vooEezGPi9bzL9StWJgYnz9wGZ0Mg3dhUi
	psua2aabzgJQdr+sXCKG74cDJXyrB+LgkiaA+bVgMMG4WeHC1ULnHkiUTSUX3Sz0BRTGdpBamHZ
	9Rx3Qc6ZuSgi1iGJ+WEGwu45irEGT0pQvLJL4pkTaEVd3Adb2ccr0YJKaqFGymOTSpbc1bTIfDL
	DKQLsFZ2F4PKfpn8zjMBwKXH0Thrz3CODWrA==
X-Received: by 2002:a05:600c:3510:b0:493:be08:c372 with SMTP id 5b1f17b1804b1-493c2b43923mr117304065e9.17.1783024142797;
        Thu, 02 Jul 2026 13:29:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:29:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:04 +0300
Subject: [PATCH v6 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-9-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9992;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=by1PdQn8rq3EWFTQ7qk7AhNTkSnPgbFBVoCfGLLbwDQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnqIulNFRiwg+UdkUVdRa6F/79AUzxOr1et7
 JIWRKnoLhSJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJN9w/+I/fPh2R/ZIxrABtrq8K79gqbi+2Jyao
 nNgrHDil8+SWWUBCxRGtv50gCu3sMBz28787j5/TrJoiwRVPy+54IgpMmm2QzUM2TmXXNg4rzSF
 QQm85KmB6szVbYPIbTKOAk/8bLVfydWcoKpMMeUbyF2pd8NcSanV3t6up+CUK+kM5HkkLRTNI9i
 wcGkLKaSXwfUkrC03/K9xJ8LgZMMLoJ47v/6M1+TNyPUfk3YufKY1oXDXq0Cf0fE5skGZ0x9v+r
 0Lo4Lz2BNRrh7zsSsSMuyakFC+6HLC9K5fob2XAyEMH5a5ILKl8DvVdwrJ0c7xeeCFAC94q/HFc
 euMw02c9mhl3cgLiLSPV8hh716KRR6/iy3uZ4/neHx0kKbPyS78p2j4uCqK9rlK3L69rEKmD6ix
 JiX5ExM25rvfGAZ2mlZAes7C7dYgSbAUfSQZPrZkXP2OD7DoekfYgif960TNEbo/UJ6RmRm2Vv+
 9V7pndKaG3x+v9MMUr6Ct/Xacl9KMMSDLQJVHVkYfXOOq7nU/X0o+hU7+q/6m0m/osJ2Y+G+H2J
 B1dMi36ZFO3egOqshWadG+VfDvkX6YMdeylGeF2AFDNegsxAAZ0VdLB6aKBLbqqMi+3TUKZw3X0
 Re28DYMK5ePJEDhdVZ+2nmryDZSeC0+sUK9rIFui95Wdalyk8G4Y=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132904_921771_7F63E701 
X-CRM114-Status: GOOD (  28.98  )
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
 drivers/clk/zte/clk-zx297520v3.c | 176 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297520v3.c
index 6fc98f98cf9c..501f333b84fe 100644
--- a/drivers/clk/zte/clk-zx297520v3.c
+++ b/drivers/clk/zte/clk-zx297520v3.c
@@ -420,6 +420,178 @@ static const struct zx_clk_data zx297520v3_topclk_data = {
 	.num_gates = ARRAY_SIZE(zx297520v3_top_gates),
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
 static int clk_zx297520v3_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
@@ -436,6 +608,10 @@ static const struct platform_device_id clk_zx297520v3_ids[] = {
 		.name = "zx297520v3-topclk",
 		.driver_data = (kernel_ulong_t)&zx297520v3_topclk_data,
 	},
+	{
+		.name = "zx297520v3-matrixclk",
+		.driver_data = (kernel_ulong_t)&zx297520v3_matrixclk_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, clk_zx297520v3_ids);

-- 
2.54.0


