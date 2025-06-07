Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F12C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rb2pt6bSvJ74KoT6+m+vgEPTgOl4YHy8otCzkwq1vRM=; b=ztpvavVydcq1U3YTWyba4XFW7K
	als0uA/VdaZWfP9g9kgV6NiCwrGEbzf2QM1bzFsRzBMpDkcytD7TnF9l6ShgA6evs5iv2QC2NJXnF
	q64f3GNY4JnwUQkuHUdDAl87msT9tYhgZ33hiHn6W4NXyakCgpsiJ8YROiNJOwQkAi3KK76ahOHow
	+NOcVY006jxBVxNulPsBiHzkMHON/2K+KRqI35sBb/IEPaPbukVBSlhtRFsDarKNIyTIG8jEyLZLR
	81iV3KByz3PnbmdZW5uxCQlyw5ySZPXrZxXo8u2N5uT3kvdebykEKx0Jj4clNYaVo5TTEPRdGpgN+
	/uEIEEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNu0o-00000001jO9-057E;
	Sat, 07 Jun 2025 13:55:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNtxw-00000001j9c-1t4C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 13:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EE875C56B5;
	Sat,  7 Jun 2025 13:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572F7C4CEE4;
	Sat,  7 Jun 2025 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304327;
	bh=9zSazWezvyHshE0sEu5aQkyy5OabfF5jzCtXfOLRKO4=;
	h=From:To:Cc:Subject:Date:From;
	b=DeqQ8Dbh8aETNHEVlm1+aC3sbVBlmPuB+tlCEUfzmn7hnbp4lwQ0qlz1Me9kqJKJS
	 JXVEuHqU20jWN5lyfpmkdFlvlxQl52a6kdxQOMVoJ48y+oiqITNP8m3Tbd9d1JZZrm
	 sDGltNTz9lqMUZdXi7HmYI8jLwOvuKRLjvU9NmH/MAPJDl7ccTVRqivI4YSrdVs07m
	 Ab7iWNLWVFn2h8zZmRdcl7qDV9BO/GByjn9GWd+yMtSj9qFqxA+2GljoYF/mIAllTh
	 eCVvzPBuzoZrM8/D/1SDeGarVd3zNUengRasMOqk54dIkIZgVJSSvc/Iz1S2avpnVs
	 0+juCQ6rjh36A==
Received: by wens.tw (Postfix, from userid 1000)
	id BA7335FD0C; Sat,  7 Jun 2025 21:52:04 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH] pinctrl: sunxi: dt: Consider pin base when calculating bank number from pin
Date: Sat,  7 Jun 2025 21:52:03 +0800
Message-Id: <20250607135203.2085226-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_065208_535180_A597CB1F 
X-CRM114-Status: GOOD (  13.68  )
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

From: Chen-Yu Tsai <wens@csie.org>

In prepare_function_table() when the pinctrl function table IRQ entries
are generated, the pin bank is calculated from the absolute pin number;
however the IRQ bank mux array is indexed from the first pin bank of the
controller. For R_PIO controllers, this means the absolute pin bank is
way off from the relative pin bank used for array indexing.

Correct this by taking into account the pin base of the controller.

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 1833078f6877..4e34b0cd3b73 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -143,7 +143,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
  */
 static int prepare_function_table(struct device *dev, struct device_node *pnode,
 				  struct sunxi_desc_pin *pins, int npins,
-				  const u8 *irq_bank_muxes)
+				  unsigned pin_base, const u8 *irq_bank_muxes)
 {
 	struct device_node *node;
 	struct property *prop;
@@ -166,7 +166,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 */
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
-		int bank = pin->pin.number / PINS_PER_BANK;
+		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
 
 		if (irq_bank_muxes[bank]) {
 			pin->variant++;
@@ -211,7 +211,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	last_bank = 0;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
-		int bank = pin->pin.number / PINS_PER_BANK;
+		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
 		int lastfunc = pin->variant + 1;
 		int irq_mux = irq_bank_muxes[bank];
 
@@ -353,7 +353,7 @@ int sunxi_pinctrl_dt_table_init(struct platform_device *pdev,
 		return PTR_ERR(pins);
 
 	ret = prepare_function_table(&pdev->dev, pnode, pins, desc->npins,
-				     irq_bank_muxes);
+				     desc->pin_base, irq_bank_muxes);
 	if (ret)
 		return ret;
 
-- 
2.39.5


