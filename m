Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD538CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZvEpaFZrL7sZc8hczs8U0IzP8KZqdxqF/bu88DD5Gs=; b=ozYb5WszOFa97ygjr/U8OtWqh/
	ZqeyfRMVVT2WsOwsC0quCI4jbRmskMMp6IjSWo9gUA24RjDm25OKfhhHx7nK7GmV0Y/6/71dycimQ
	rYKH+Kv+9JDUK6YAXk037kQFxaYFAPgXfv37/eKfn0vWOd/xoVXUoSXCakhLmX3fFqqxTHI0A6vSU
	KbdU+Kp5F5c5smtsHI7atXIwQyTcOKi0jYCgAzN5CPfYdh7XSIo145TsyMcEKEv0PCf3ejXfmRNa3
	bOV3x/1pJit/uXFDZUI7y2OPD45q12r5rqgMt3dFLqzH8no7+JriIEx1NeGUS0+W+LWET3XwCVsmU
	+MPYHhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy4l-00000006p7f-0TVI;
	Wed, 30 Sep 2026 17:26:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy47-00000006owW-2dMh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:26:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 201841A107D;
	Wed, 30 Sep 2026 17:25:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8B2D60749;
	Wed, 30 Sep 2026 17:25:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55912103284B8;
	Wed, 30 Sep 2026 19:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mZvEpaFZrL7sZc8hczs8U0IzP8KZqdxqF/bu88DD5Gs=;
	b=Rab9vyKX9unXZrb7kEb33b15+oA/6TTGmowd/60xRiBdmH7mTY4Pi8klCIuURd8c5kzBB9
	RO8r2lgHSmWU07bNnLMnF7CFRcSps96IPHIsGh3m4vBEW5bA9Gfyh43cRh1yo0OQxc9FEC
	zFiQkRSlvTEM43umBc9jpzat2nuSWvPZ8H0MmVRayD/AiDJq51zVPtxDt2q40UL19Wj/lx
	tqE7nF71tSFbybIrX91uOd18HKI9AZlHnP6S80+jo7TMqEgNHyhsehOgHrPTihjtHEUXxo
	T1FzbrsQlg8xl/92z6PH6fa4QOeK+Jo+KfIFSnbHVCFQEjmFJis1SFAtxcRFug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Sep 2026 19:24:54 +0200
Subject: [PATCH v6 08/12] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
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
X-CRM114-CacheID: sfid-20260930_102559_814430_3276614B 
X-CRM114-Status: GOOD (  16.82  )
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

HXT and LXT are crystal oscillator inputs of the clock controller, they
are described in the DT, so retrieve them, in order, and store them in
their respective HXT/LXT hw table entries.

Since old DTs reference the HXT fixed-clock without naming it and do not
describe LXT at all, we assume that HXT must be present, and fallback to
creating a fixed clock for LXT if it is not described (for backward
compatibility purposes).

The downstream gate clocks can directly use the hw clocks as parents,
instead of relying on string matching.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 43 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index ceebcbd8c18b..d955d79abdd2 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -4,6 +4,7 @@
  * Author: Chi-Fang Li <cfli0@nuvoton.com>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -191,6 +192,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
 				    reg, shift, 0, &ma35d1_lock);
 }
 
+static struct clk_hw *ma35d1_clk_gate_parent(struct device *dev, const char *name,
+					     struct clk_hw *parent,
+					     void __iomem *reg, u8 shift)
+{
+	return devm_clk_hw_register_gate_parent_hw(dev, name, parent,
+						   CLK_SET_RATE_PARENT,
+						   reg, shift, 0, &ma35d1_lock);
+}
+
 static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
 {
 	const char *of_str;
@@ -215,10 +225,12 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *clk_node = pdev->dev.of_node;
+	struct clk_bulk_data *clks;
 	void __iomem *clk_base;
 	static struct clk_hw **hws;
 	static struct clk_hw_onecell_data *ma35d1_hw_data;
 	u32 pllmode[PLL_MAX_NUM];
+	int num_clks;
 	int ret;
 
 	ma35d1_hw_data = devm_kzalloc(dev,
@@ -240,12 +252,27 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
-	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
-					clk_base + REG_CLK_PWRCTL, 0);
-	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
-	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
-					clk_base + REG_CLK_PWRCTL, 1);
+	num_clks = devm_clk_bulk_get_all(dev, &clks);
+	if (num_clks < 0)
+		return num_clks;
+
+	if (!num_clks) {
+		dev_err(dev, "missing crystal input clocks\n");
+		return -ENODEV;
+	}
+
+	hws[HXT] = __clk_get_hw(clks[0].clk);
+
+	if (num_clks > 1)
+		hws[LXT] = __clk_get_hw(clks[1].clk);
+	else
+		/* Old DTs do not describe the low-speed crystal */
+		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+
+	hws[HXT_GATE] = ma35d1_clk_gate_parent(dev, "hxt_gate", hws[HXT],
+					       clk_base + REG_CLK_PWRCTL, 0);
+	hws[LXT_GATE] = ma35d1_clk_gate_parent(dev, "lxt_gate", hws[LXT],
+					       clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);
@@ -632,8 +659,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[UART16_GATE] = ma35d1_clk_gate(dev, "uart16_gate", "uart16_div",
 					   clk_base + REG_CLK_APBCLK0, 28);
 
-	hws[RTC_GATE] = ma35d1_clk_gate(dev, "rtc_gate", "lxt",
-					clk_base + REG_CLK_APBCLK0, 29);
+	hws[RTC_GATE] = ma35d1_clk_gate_parent(dev, "rtc_gate", hws[LXT],
+					       clk_base + REG_CLK_APBCLK0, 29);
 	hws[DDR_GATE] = ma35d1_clk_gate(dev, "ddr_gate", "ddrpll",
 					clk_base + REG_CLK_APBCLK0, 30);
 

-- 
2.55.0


