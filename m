Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41F1CA5FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHX3FxLc35EBcXDgU8Mdx/URxIIN4Tfi71fuJNvMy00=; b=xxB1kfRBcD5EzvAGHu3fmji2Nl
	g8sMG2ypgqbAA9MtRrEN00eSZw8YvJ1NL6U+tX9WBDI4KsdGOBKBPWrARuOKYE0BKAGQKN2pX3aqL
	uerQpJ/Q+c+azIubckhmU5ZC87XWx7yttp4P/COosABdY1Q1y9CQNHqzbQKvuIpHEOU+Iy+3N0tT8
	Jj/rQYbRbEyGMPp8sGMhVzQrR3Z2N5OrPeS0V9dPnL62AvXhhQzg/8EJ/tN+bnRI4PCUxJMM+GcaU
	0hvp3ow5evsM7nvy5Pxtut6RD0OLePR1oTDH0FJmiyhw9YMfV9Arh2zTqpGD1cPjTWEz2d3t9YQs4
	BC2N6N3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy4p-00000006pB4-0y9K;
	Wed, 30 Sep 2026 17:26:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy4H-00000006ozo-4AhK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pHX3FxLc35EBcXDgU8Mdx/URxIIN4Tfi71fuJNvMy00=; b=Rbe7BvUaobLDayXpqkAVSgYCWR
	kSajPeuDywibd5nBQqEbLciQzV6vEN3cK7qyM9TlchF10I+cECt/3BnjJuurh7DVd2vGIB9ZYJvel
	BIJQTnnoQd/bU+x95eIM3fS4eljDwF/Uh7jbZIiDpJw7K+4gomGBhbEleZmjv1DtsQAMF447GNSWg
	c1fnLNY+RmkIfl6VwSIFrsDiPQjr9HkkF67M7E7065tT63PjYk/d60Clm1L8c927vye627Wr9YkMl
	T09BmIjsFD9+r+mRoGCgyuM5cAzL7vLmqDvsro1zQyFmZm/eHWPM8nzjPV7n2IzPvzV57V2drI68z
	aLKOsP4Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy4E-000000048Xu-3BvO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:26:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1CE3B4E410D4;
	Wed, 30 Sep 2026 17:26:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4DE760749;
	Wed, 30 Sep 2026 17:26:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB6A0103291EA;
	Wed, 30 Sep 2026 19:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pHX3FxLc35EBcXDgU8Mdx/URxIIN4Tfi71fuJNvMy00=;
	b=qFDgMJ/oG8VxVZ+30z+n9OIXk6YwD5PXCM58pPi1s8UaEV5wdFpxt3/47CT1xq6zIVRHIu
	VFU6pyViiqeYaiJwYzqmCw3VGM64WW/ei6NqmNLrNDU18pQOykBdKpFRTRrJGclugn1x09
	UOvCe/Dptw4ElC8C+by4wkGix2UZhVI/y2yAPQCWtzLqWVWNFrH7ae0pWS0vSKQZQZTPHB
	0OjF8ybmBi79oOjTeMWIhRffBnnXFc5Qno8HI93Zn3FSpHFr1ehuEZZc+SMj+rcZ+q3Mmf
	YcM0Xdu2u5TM6I/hG9CzNPXkzobiKKReN2qtAru7SYWycbgba2/+oXKysUo8HQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Sep 2026 19:24:56 +0200
Subject: [PATCH v6 10/12] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-10-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182607_360517_AE58318A 
X-CRM114-Status: GOOD (  17.18  )
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

The clock tree is still incorrect. SYSPLL is derived from HXT, very much
like CAPLL, DDRPLL, VPLL, APLL and EPLL. SYSPLL has a fixed frequency,
but if HXT gets gated, SYSPLL stops running.

Reparent SYSPLL under HXT_GATE to properly define the clock tree
topology. After this change, the frequencies are identical, but the
clock tree looks (again) much closer to the reality.

Even though the TRM does not explicitly shows that HIRC and LIRC are
internally sourced from HXT and LXT, respectively, there are high
chances that these should be reparented as well. I will not do it but
the discussion is open and in case it becomes relevant, the 'parent'
field of the modified ma35d1_clk_fixed() helper can just be set
accordingly.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 384449d473c7..16cf2771e5ed 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -132,9 +132,9 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
-static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
+static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate, const char *parent)
 {
-	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	return clk_hw_register_fixed_rate(NULL, name, parent, 0, rate);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -279,22 +279,22 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 		hws[LXT] = __clk_get_hw(clks[1].clk);
 	else
 		/* Old DTs do not describe the low-speed crystal */
-		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+		hws[LXT] = ma35d1_clk_fixed("lxt", 32768, NULL);
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent(dev, "hxt_gate", hws[HXT],
 					       clk_base + REG_CLK_PWRCTL, 0);
 	hws[LXT_GATE] = ma35d1_clk_gate_parent(dev, "lxt_gate", hws[LXT],
 					       clk_base + REG_CLK_PWRCTL, 1);
-	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
+	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000, NULL);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);
-	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000);
+	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000, NULL);
 	hws[LIRC_GATE] = ma35d1_clk_gate(dev, "lirc_gate", "lirc",
 					 clk_base + REG_CLK_PWRCTL, 3);
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000, "hxt_gate");
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
@@ -335,8 +335,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
 	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
-	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
-	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
+	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000, NULL);
+	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000, NULL);
 
 	/* DDR */
 	hws[DDR0_GATE] = ma35d1_clk_gate(dev, "ddr0_gate", "ddrpll",

-- 
2.55.0


