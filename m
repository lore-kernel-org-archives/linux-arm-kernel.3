Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A5EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lyxdy796hLpUJj9EnQoEnVMUSThmvftMavjmWl7Rps=; b=vHfE5gvlvOHk5N7xO9sYhL8vmI
	EjSiqTu+/75zvlXSe/a0w8I1UQ6lGKFnyQfEkN5BimsKQweBEfVKauwooYKERXTUzEDfhBII70xxZ
	cx+KuBt0mHTvgPjbBGWIxzrteEvLlEFb1vD/+FqLRNHN2aIzwsDgn3vhAXJvVXEJu85xpoKwzBKr8
	YLo8SDI9PcuN4WMG98yMGjZiwZAUbceQNyYX6hN50yaMteo0cqz6feE9nFkXTLsvmmR+VLIm4dC7m
	WG06SMABhpiEZ77gixmonBhWCEQSLbakG5bnBFktybiGWKnmzCcVlqZ/voL0ayhRpHtXTwIksOJgX
	QQDwSGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlJe-00000001wHU-224a;
	Tue, 28 Apr 2026 16:29:42 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlJT-00000001wBa-3Mv8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0lyxdy796hLpUJj9EnQoEnVMUSThmvftMavjmWl7Rps=; b=AXV0lsIoega3f6IufHX5MxLliZ
	91EhvIruNzdJQPYDajDHlloU8T4Ulh4pbZA9pnzXPojXIOGDjcF4wUbYQSZVl2XLBh1FWjF/7CV9P
	efDL904A25El1ijRZixvo65kvTMLAETrP549qS3Og+rGsVCcP1Y6sdd4GhGshUt/3JbuOgzdo0Udl
	hawdnGP299QiNzGXs8185JxczYuK0fNfW7h25uHwd4wuTDA/chhtZ9WuD+BE0FczXbYVO7b4YGBFZ
	3PBu9Qyn83F3c4S1XwBSqa6N2kcIdhu+WNUV3r+xZttN9XdBcncffBl2qfjDdD2Y9akOH567QrbZt
	QwIJoDDA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wHlJR-0000000Ay8E-0x82;
	Tue, 28 Apr 2026 18:29:29 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Tue, 28 Apr 2026 18:26:59 +0200
Subject: [PATCH v3 2/4] clocksource/drivers/sun5i: add D1 hstimer support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-h616-t113s-hstimer-v3-2-7e02178a93ee@mmpsystems.pl>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777393718; l=6812;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=1L3rHOJVuAnpxzydteKfdfNTRtbJkFSx+Yr9EHtcqh8=;
 b=zi0Ki2SpVY7XaTjmE9tVQjQqPcFQw2hU5vlPZJ0slaIW1d3YB08n16yFEgcpXIFp3Ivb1e0V8
 B5gtqbzKuf6CX3DUdacsu3AJ3sfG8loq4voSrau2tZfWIn0pE7xE7ah
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_092932_053634_7112DFFC 
X-CRM114-Status: GOOD (  17.64  )
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

D1 high speed timer differs from existing timer-sun5i by register base
offset.

Add sunxi quirks to handle D1 specific offset.
Add D1 compatible string to OF match table.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/clocksource/timer-sun5i.c | 84 ++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 19 deletions(-)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index f827d3f98f60..517c048a4870 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -18,21 +18,30 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 
-#define TIMER_IRQ_EN_REG		0x00
+#define TIMER_IRQ_EN_REG			0x00
 #define TIMER_IRQ_EN(val)			BIT(val)
-#define TIMER_IRQ_ST_REG		0x04
-#define TIMER_CTL_REG(val)		(0x20 * (val) + 0x10)
+#define TIMER_IRQ_ST_REG			0x04
+#define TIMER_CTL_REG(val, offset)		(0x20 * (val) + 0x10 + (offset))
 #define TIMER_CTL_ENABLE			BIT(0)
 #define TIMER_CTL_RELOAD			BIT(1)
 #define TIMER_CTL_CLK_PRES(val)			(((val) & 0x7) << 4)
 #define TIMER_CTL_ONESHOT			BIT(7)
-#define TIMER_INTVAL_LO_REG(val)	(0x20 * (val) + 0x14)
-#define TIMER_INTVAL_HI_REG(val)	(0x20 * (val) + 0x18)
-#define TIMER_CNTVAL_LO_REG(val)	(0x20 * (val) + 0x1c)
-#define TIMER_CNTVAL_HI_REG(val)	(0x20 * (val) + 0x20)
+#define TIMER_INTVAL_LO_REG(val, offset)	(0x20 * (val) + 0x14 + (offset))
+#define TIMER_INTVAL_HI_REG(val, offset)	(0x20 * (val) + 0x18 + (offset))
+#define TIMER_CNTVAL_LO_REG(val, offset)	(0x20 * (val) + 0x1c + (offset))
+#define TIMER_CNTVAL_HI_REG(val, offset)	(0x20 * (val) + 0x20 + (offset))
 
 #define TIMER_SYNC_TICKS	3
 
+/**
+ * struct sunxi_timer_quirks - Differences between SoC variants.
+ *
+ * @from_ctl_base_offset: offset applied from ctl register onwards
+ */
+struct sunxi_timer_quirks {
+	u32 from_ctl_base_offset;
+};
+
 struct sun5i_timer {
 	void __iomem		*base;
 	struct clk		*clk;
@@ -40,6 +49,7 @@ struct sun5i_timer {
 	u32			ticks_per_jiffy;
 	struct clocksource	clksrc;
 	struct clock_event_device	clkevt;
+	const struct sunxi_timer_quirks *quirks;
 };
 
 #define nb_to_sun5i_timer(x) \
@@ -57,28 +67,36 @@ struct sun5i_timer {
  */
 static void sun5i_clkevt_sync(struct sun5i_timer *ce)
 {
-	u32 old = readl(ce->base + TIMER_CNTVAL_LO_REG(1));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+	u32 old = readl(ce->base + TIMER_CNTVAL_LO_REG(1, offset));
 
-	while ((old - readl(ce->base + TIMER_CNTVAL_LO_REG(1))) < TIMER_SYNC_TICKS)
+	while ((old - readl(ce->base + TIMER_CNTVAL_LO_REG(1, offset))) <
+	       TIMER_SYNC_TICKS)
 		cpu_relax();
 }
 
 static void sun5i_clkevt_time_stop(struct sun5i_timer *ce, u8 timer)
 {
-	u32 val = readl(ce->base + TIMER_CTL_REG(timer));
-	writel(val & ~TIMER_CTL_ENABLE, ce->base + TIMER_CTL_REG(timer));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+	u32 val = readl(ce->base + TIMER_CTL_REG(timer, offset));
+
+	writel(val & ~TIMER_CTL_ENABLE,
+	       ce->base + TIMER_CTL_REG(timer, offset));
 
 	sun5i_clkevt_sync(ce);
 }
 
 static void sun5i_clkevt_time_setup(struct sun5i_timer *ce, u8 timer, u32 delay)
 {
-	writel(delay, ce->base + TIMER_INTVAL_LO_REG(timer));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+
+	writel(delay, ce->base + TIMER_INTVAL_LO_REG(timer, offset));
 }
 
 static void sun5i_clkevt_time_start(struct sun5i_timer *ce, u8 timer, bool periodic)
 {
-	u32 val = readl(ce->base + TIMER_CTL_REG(timer));
+	u32 offset = ce->quirks->from_ctl_base_offset;
+	u32 val = readl(ce->base + TIMER_CTL_REG(timer, offset));
 
 	if (periodic)
 		val &= ~TIMER_CTL_ONESHOT;
@@ -86,7 +104,7 @@ static void sun5i_clkevt_time_start(struct sun5i_timer *ce, u8 timer, bool perio
 		val |= TIMER_CTL_ONESHOT;
 
 	writel(val | TIMER_CTL_ENABLE | TIMER_CTL_RELOAD,
-	       ce->base + TIMER_CTL_REG(timer));
+	       ce->base + TIMER_CTL_REG(timer, offset));
 }
 
 static int sun5i_clkevt_shutdown(struct clock_event_device *clkevt)
@@ -141,8 +159,9 @@ static irqreturn_t sun5i_timer_interrupt(int irq, void *dev_id)
 static u64 sun5i_clksrc_read(struct clocksource *clksrc)
 {
 	struct sun5i_timer *cs = clksrc_to_sun5i_timer(clksrc);
+	u32 offset = cs->quirks->from_ctl_base_offset;
 
-	return ~readl(cs->base + TIMER_CNTVAL_LO_REG(1));
+	return ~readl(cs->base + TIMER_CNTVAL_LO_REG(1, offset));
 }
 
 static int sun5i_rate_cb(struct notifier_block *nb,
@@ -173,12 +192,13 @@ static int sun5i_setup_clocksource(struct platform_device *pdev,
 				   unsigned long rate)
 {
 	struct sun5i_timer *cs = platform_get_drvdata(pdev);
+	u32 offset = cs->quirks->from_ctl_base_offset;
 	void __iomem *base = cs->base;
 	int ret;
 
-	writel(~0, base + TIMER_INTVAL_LO_REG(1));
+	writel(~0, base + TIMER_INTVAL_LO_REG(1, offset));
 	writel(TIMER_CTL_ENABLE | TIMER_CTL_RELOAD,
-	       base + TIMER_CTL_REG(1));
+	       base + TIMER_CTL_REG(1, offset));
 
 	cs->clksrc.name = pdev->dev.of_node->name;
 	cs->clksrc.rating = 340;
@@ -237,6 +257,7 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 
 static int sun5i_timer_probe(struct platform_device *pdev)
 {
+	const struct sunxi_timer_quirks *quirks;
 	struct device *dev = &pdev->dev;
 	struct sun5i_timer *st;
 	struct reset_control *rstc;
@@ -273,11 +294,18 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	quirks = of_device_get_match_data(&pdev->dev);
+	if (!quirks) {
+		dev_err(&pdev->dev, "Failed to determine the quirks to use\n");
+		return -ENODEV;
+	}
+
 	st->base = timer_base;
 	st->ticks_per_jiffy = DIV_ROUND_UP(rate, HZ);
 	st->clk = clk;
 	st->clk_rate_cb.notifier_call = sun5i_rate_cb;
 	st->clk_rate_cb.next = NULL;
+	st->quirks = quirks;
 
 	ret = devm_clk_notifier_register(dev, clk, &st->clk_rate_cb);
 	if (ret) {
@@ -311,9 +339,27 @@ static void sun5i_timer_remove(struct platform_device *pdev)
 	clocksource_unregister(&st->clksrc);
 }
 
+static const struct sunxi_timer_quirks sun5i_sun7i_hstimer_quirks = {
+	.from_ctl_base_offset = 0x0,
+};
+
+static const struct sunxi_timer_quirks sun20i_d1_hstimer_quirks = {
+	.from_ctl_base_offset = 0x10,
+};
+
 static const struct of_device_id sun5i_timer_of_match[] = {
-	{ .compatible = "allwinner,sun5i-a13-hstimer" },
-	{ .compatible = "allwinner,sun7i-a20-hstimer" },
+	{
+		.compatible = "allwinner,sun5i-a13-hstimer",
+		.data = &sun5i_sun7i_hstimer_quirks,
+	},
+	{
+		.compatible = "allwinner,sun7i-a20-hstimer",
+		.data = &sun5i_sun7i_hstimer_quirks,
+	},
+	{
+		.compatible = "allwinner,sun20i-d1-hstimer",
+		.data = &sun20i_d1_hstimer_quirks,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sun5i_timer_of_match);

-- 
2.43.0


