Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34646CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNZFHqqA00NITqaaOaGlzgkXwv3S1KF8SxlsgNZyUGQ=; b=y3tHqBqoqDIfZ/O4wQTCBKG+ke
	EnxZCyQkhzwmXO6y/CmuhrqZ+qOacPtwcLi3g42RPqaCkr+c++Yw/UW2H8ZAHWABCIu/czychmm/q
	9RsQIifolfWLrtDZpIbV+PJACc5wmLlmnt6REol6d3Rjt4hyC8H1E6HJM8oMfv9UMYBP6XnzHFUf7
	lz00rmeBRh73PEGSEjJxLSkHnCu6eBh26u4RQa2GLUu5grE1Q1ItUxL3K/cx7Ydd3wkrRyk/2ejGA
	K9/wxgotl2L2GGmIoDwBdFjZH1ZTExHcz9JJn6LAfoCjT0uIjrNBCMga631il9g515T2vFNwjN2zP
	HdmZNDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCelq-0000000BqNN-06Qa;
	Fri, 02 Oct 2026 15:01:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeln-0000000BqKG-1DYQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:01:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BAA2D4E41111;
	Fri,  2 Oct 2026 15:01:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E070603DC;
	Fri,  2 Oct 2026 15:01:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DF9810328276;
	Fri,  2 Oct 2026 17:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790953311; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GNZFHqqA00NITqaaOaGlzgkXwv3S1KF8SxlsgNZyUGQ=;
	b=CxzF/W+OnRIBwuy42CPAL/q7AAJsW3jP2FUjoo2P/Z8EzgWQySvukiNVQt0XP+1h5QvG7F
	d+hxcD6J5vvbCjuHAJ0n5ld0Q4hG3N/5mMthgOahBvSwcrkAPmzX2CtDtpacnNvAlOmBAq
	Ht9rA9CgJUfNhFBkMxGInsm+Sqt10cHbGN7DzBjZHbmgzamjBTYoWnGb0RrUWFqRRWb0Gm
	tipp8zUC5T9Cafn1+cB5sgwYtABsy8REWx/uZmpQM7l3KM61+hU5odo6brzHJqN91TGxCZ
	ARQ3xr8dpaJIh6vIGjJiM3TiGMm023SDzePVpUNhilny4I+eHXQGUceWOwIhWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 17:01:09 +0200
Subject: [PATCH v7 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-perso-ma35d1-upstream-clk-v7-5-cbd991fa6270@bootlin.com>
References: <20261002-perso-ma35d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com>
In-Reply-To: <20261002-perso-ma35d1-upstream-clk-v7-0-cbd991fa6270@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_080155_628908_5663FC4C 
X-CRM114-Status: GOOD (  16.37  )
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

The clock tree is still incorrect. SYSPLL is derived from HXT_GATE, very
much like CAPLL, DDRPLL, VPLL, APLL and EPLL. SYSPLL has a fixed
frequency, but if HXT gets gated, SYSPLL stops running.

Reparent SYSPLL under HXT_GATE to properly define the clock tree
topology. After this change, the frequencies are identical, but the
clock tree looks (again) much closer to the reality.

Since the TRM does not explicitly shows that HIRC and LIRC are
internally sourced from HXT and LXT, respectively, I haven't reparented
them (even though that was tempting). This can be done later anyway.

Side effect: since I am moving to a devm_* clk helper for SYSPLL, I can
reuse this helper to register the other fixed clocks, so they are also
become device managed.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 2e6e1c65d01e..0baaa93f1380 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -73,6 +73,8 @@ static const struct clk_parent_data lxtg_parent_data[] = {
 	{ .fw_name = "lxt", .name = "lxt" },
 };
 
+static struct clk_parent_data syspll_parent_data[] = {};
+
 /* Mux parent selection, by index into the controller's clock table */
 static const int ca35clk_parent_idx[] = { HXT_GATE, CAPLL, DDRPLL };
 static const int sysclk0_parent_idx[] = { EPLL_DIV2, SYSPLL };
@@ -139,9 +141,15 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
-static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
+static struct clk_hw *ma35d1_clk_fixed_parent_data(struct device *dev, const char *name, int rate,
+						   const struct clk_parent_data *parent_data)
 {
-	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	return devm_clk_hw_register_fixed_rate_parent_data(dev, name, parent_data, 0, rate);
+}
+
+static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
+{
+	return ma35d1_clk_fixed_parent_data(dev, name, rate, NULL);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -275,22 +283,23 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 
 	/* Old DTs do not describe the low-speed crystal */
 	if (num_clks == 1)
-		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+		hws[LXT] = ma35d1_clk_fixed(dev, "lxt", 32768);
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
-	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
+	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);
-	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000);
+	hws[LIRC] = ma35d1_clk_fixed(dev, "lirc", 32000);
 	hws[LIRC_GATE] = ma35d1_clk_gate(dev, "lirc_gate", "lirc",
 					 clk_base + REG_CLK_PWRCTL, 3);
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
+	syspll_parent_data[0].hw = hws[HXT_GATE];
+	hws[SYSPLL] = ma35d1_clk_fixed_parent_data(dev, "syspll", 180000000, syspll_parent_data);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
@@ -331,8 +340,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
 	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
-	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
-	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
+	hws[USBPHY0] = ma35d1_clk_fixed(dev, "usbphy0", 480000000);
+	hws[USBPHY1] = ma35d1_clk_fixed(dev, "usbphy1", 480000000);
 
 	/* DDR */
 	hws[DDR0_GATE] = ma35d1_clk_gate(dev, "ddr0_gate", "ddrpll",

-- 
2.55.0


