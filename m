Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C057C61DB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BAOhFCOmsJ4kUYgNn0gFr0HDX2KAssojLnYs1lQlFqk=; b=FIJySD2nv6M46HwpLDNSxLX6yo
	LWqGEiDJRqNChiA+3krlItpylSUczCkC3xCgd0+31Xq2SU27KmM/4rmZcKUzlkqK78YLOwo8ie4DA
	AOE0kvymq2OtLTVNBAufHB7h80cSrJHEe3pjCLfuBlOOEN6hti4Yd03V9h8HoK0+o1iNa1oE7vAzP
	9IX8z2ZZBZ9Iy42mVWLM67Gzu2YUxPhknbBxfiQ8cgbPl1MXOyjwrwogLmnfsSdw7Mmo4TEJJWpz8
	+JRfWCFJ7pMZ5PI6YETOD7QyHUD+J3PtIwnG1yKP1s9EKX44O0bgKFHiJTZPQZjoj5hL564xMLgSq
	8zMO+Pxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNu2x-00000001jZn-3EF3;
	Sat, 07 Jun 2025 13:57:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNu0d-00000001jLS-1t47
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 13:54:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3612262A1E;
	Sat,  7 Jun 2025 13:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9133C4CEE4;
	Sat,  7 Jun 2025 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749304493;
	bh=cmThDcb02rdfOWIo8z/d3jAmVfEg/kXS4OHfeoZ1jmY=;
	h=From:To:Cc:Subject:Date:From;
	b=jsLZhJm2UN37rYwys1H4vv3Yj23hoDiLQqK/rMBMeIC3kckiwvu0LPiSq2Tp8aiAi
	 mm8uOHNKZYXjQWg6/kshWPM8DdTWRhpj6vHZVZlv/+ci6wXljnpiLxS5JpSI6gmoTk
	 2XylaOhu0TWKNTOQUbNH2t7EPZlxnd78WLpb7hRcK8PDtC1Atuh0PdkdEfHUGwbW3I
	 4aDvxG5repQir8/seK2hsTkU8VXQzYByC0/pODw62E/olz/clIp7ktorRSVOfgEaOe
	 EQ1j1q0RUOztGi1QsJ79XuTTP32TeST37CqbFhMv3rT9LkaGP1puIjM84IBxAOEcPv
	 Q0CU+w8Uu3pkw==
Received: by wens.tw (Postfix, from userid 1000)
	id 1153A5FD0C; Sat,  7 Jun 2025 21:54:51 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH resend] pinctrl: sunxi: dt: Consider pin base when calculating bank number from pin
Date: Sat,  7 Jun 2025 21:54:50 +0800
Message-Id: <20250607135450.2086806-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Resent to linux-gpio mailing list instead of linux-clk.

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


