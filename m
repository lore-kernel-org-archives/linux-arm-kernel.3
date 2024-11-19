Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F00D44161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNcw/Db0CFJ7QMk8o070ecj1YZWiqTblxiEleUQEAIc=; b=PCYEWr9Qx3m9vaKFyNsx0muRyU
	s0uclgs984DPNnJ14EJXdSvd2/ARMWwq8KG2uS0C+FuXtrm+SmLT6XLlBPODMm+nLI93vLZCJwPcd
	pbinusWlz/Ncb2odjSOqhA0kYOeK+YvDeDv9BSMkMFxDjijaXzRK1yx84Baj+EmpOpid7RkgNt2QR
	Ip6ovcIPDffY4+6gqhEMYW/7Xa7zy32j06IrH+y068hji+AWpw8PPA8eiYlu50tPfg2jd61iyvqfO
	fxmAzPxcFnmqKCTDsJTSpWJF37G+6QaptRRu6JEzSmoJUsdNxKpdTwCvcigpAqupJ1oPgmy/Iobd6
	cSFPqF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDP6G-0000000Cg2P-3WBI;
	Tue, 19 Nov 2024 14:21:04 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDP5J-0000000Cfvz-1OdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 14:20:07 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5D1FF1F0003D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 14:19:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0F2FAA47008; Tue, 19 Nov 2024 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 78E00A47001;
	Tue, 19 Nov 2024 14:08:06 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Date: Tue, 19 Nov 2024 15:08:05 +0100
Message-ID: <20241119140805.3345412-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_062005_698732_631D424B 
X-CRM114-Status: GOOD (  19.29  )
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

From: Paul Kocialkowski <contact@paulk.fr>

The sunxi external interrupts (available from GPIO pins) come with a
built-in debouncing mechanism that cannot be disabled. It can be
configured to use either the low-frequency oscillator (32 KHz) or the
high-frequency oscillator (24 MHz), with a pre-scaler.

The pinctrl code supports an input-debounce device-tree property to set
a specific debouncing period and choose which clock source is most
relevant. However the property is specified in microseconds, which is
longer than the minimal period achievable from the high-frequency
oscillator without a pre-scaler.

When the property is missing, the reset configuration is kept, which
selects the low-frequency oscillator without pre-scaling. This severely
limits the possible interrupt periods that can be detected.

Instead of keeping this default, use the minimal debouncing period from
the high-frequency oscillator without a pre-scaler to allow the largest
possible range of interrupt periods.

This issue was encountered with a peripheral that generates active-low
interrupts for 1 us. No interrupt was detected with the default setup,
while it is now correctly detected with this change.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 49 ++++++++++++++++-----------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 73bcf806af0e..06c650d97645 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1416,6 +1416,7 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 	unsigned int hosc_diff, losc_diff;
 	unsigned int hosc_div, losc_div;
 	struct clk *hosc, *losc;
+	bool debounce_minimal = false;
 	u8 div, src;
 	int i, ret;
 
@@ -1423,9 +1424,9 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 	if (of_clk_get_parent_count(node) != 3)
 		return 0;
 
-	/* If we don't have any setup, bail out */
+	/* If we don't have any setup, use minimal debouncing. */
 	if (!of_property_present(node, "input-debounce"))
-		return 0;
+		debounce_minimal = true;
 
 	losc = devm_clk_get(pctl->dev, "losc");
 	if (IS_ERR(losc))
@@ -1439,29 +1440,37 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 		unsigned long debounce_freq;
 		u32 debounce;
 
-		ret = of_property_read_u32_index(node, "input-debounce",
-						 i, &debounce);
-		if (ret)
-			return ret;
+		if (!debounce_minimal) {
+			ret = of_property_read_u32_index(node, "input-debounce",
+							 i, &debounce);
+			if (ret)
+				return ret;
 
-		if (!debounce)
-			continue;
+			if (!debounce)
+				continue;
 
-		debounce_freq = DIV_ROUND_CLOSEST(USEC_PER_SEC, debounce);
-		losc_div = sunxi_pinctrl_get_debounce_div(losc,
-							  debounce_freq,
-							  &losc_diff);
+			debounce_freq = DIV_ROUND_CLOSEST(USEC_PER_SEC,
+							  debounce);
 
-		hosc_div = sunxi_pinctrl_get_debounce_div(hosc,
-							  debounce_freq,
-							  &hosc_diff);
+			losc_div = sunxi_pinctrl_get_debounce_div(losc,
+								  debounce_freq,
+								  &losc_diff);
 
-		if (hosc_diff < losc_diff) {
-			div = hosc_div;
-			src = 1;
+			hosc_div = sunxi_pinctrl_get_debounce_div(hosc,
+								  debounce_freq,
+								  &hosc_diff);
+
+			if (hosc_diff < losc_diff) {
+				div = hosc_div;
+				src = 1;
+			} else {
+				div = losc_div;
+				src = 0;
+			}
 		} else {
-			div = losc_div;
-			src = 0;
+			/* Achieve minimal debouncing using undivided hosc. */
+			div = 0;
+			src = 1;
 		}
 
 		writel(src | div << 4,
-- 
2.47.0


