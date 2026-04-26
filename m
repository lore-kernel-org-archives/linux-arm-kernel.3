Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAA2FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oNeD0Gjuiyl0hRsTH+1sk2t+V7IAJjF8eo4+EiMzD0=; b=uc17oEd6S+nD/ZIk+9cUp6ktBj
	xgsRqehRyjEAi3bRmX6cukYQCWLWxC56QWuAKzcZwmgy0ORUB4UX/Jmh+6dOPIVNZKWhyLe9d63Nj
	A1KUEL8xklzLZD/nxHhK2utRVdriruZ8nJgBfTp54DrV5gxQLBpVQtcRWS2CjL5T/0qEwAL4O97Ll
	yYTBXQ3O/yEaQRplKZkfjSeeHXjnCG7sTYAZuB41GHVYf6DUYHnsu5vp6lt4qaPV4uKQZ5Z2InvQV
	qsOIV1SkknnwvlzPHDoIXdxIGrKYmX+04Rn0JF2KL24VmUVcCURBx2t6MGlXDRMler5+PaJGSEKZP
	rzF9ZNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXJ-0000000FRHV-0aWw;
	Sun, 26 Apr 2026 10:16:25 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwXB-0000000FRDu-46Qa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 10:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+oNeD0Gjuiyl0hRsTH+1sk2t+V7IAJjF8eo4+EiMzD0=; b=jecAcGkE/icL+1Odx8tBzt9mEC
	LXj4I8dvPYr7ugPLx7BKIvGrVnyMmI3kcRDgkdjxro2VQErhNrDnV651nEZvhbnhlpVnzfWTUcjKR
	sfwcVyS8lhy1eMnLpljSr0mcQsvE4VKtRUxJRiv0PlsQGPc8hRDBBEklNGOXu5rPTyddRB2FIavpu
	+9qsUWkHy3hW1CBM9shFWUx5ulfP8pXontxLF6jVYf0t2TaigrkagR5jw93Edl4x4AHYaAs0LS6U9
	wjWLUJRrhjQ4yJJ4f061Prznk5or5lemFKAviORTK4L2ksXfROklxZiS+gdFkzXRDAqee7qCRM4QH
	9zMmpSKw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGwX8-0000000CBKl-2Hxm;
	Sun, 26 Apr 2026 12:16:14 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sun, 26 Apr 2026 12:15:27 +0200
Subject: [PATCH v2 2/4] clocksource/drivers/sun5i: add D1 hstimer support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-h616-t113s-hstimer-v2-2-e65e9dc0c9da@mmpsystems.pl>
References: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
In-Reply-To: <20260426-h616-t113s-hstimer-v2-0-e65e9dc0c9da@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777198529; l=7183;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=OfqHcszwXfWEIT+eQuG3sEAaKeCtKqRoPXDzDMxKQsM=;
 b=JojX/9Zg4U7Spr3NlkhLhRETJ5CLp0ijaZnPA6EaWdRoDTQA3stYbDstW7o57ix6I2hKirWxo
 Esy6Fj4hI3OCvoVZ+LrNAKJaTpVJMjl1hZSgWygUw5szqFmwGHrjKFJ
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_031618_215466_B618B7AF 
X-CRM114-Status: GOOD (  17.89  )
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
 drivers/clocksource/timer-sun5i.c | 88 ++++++++++++++++++++++++++++++---------
 1 file changed, 69 insertions(+), 19 deletions(-)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index f827d3f98f60..2b17904debfa 100644
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
@@ -237,7 +257,9 @@ static int sun5i_setup_clockevent(struct platform_device *pdev,
 
 static int sun5i_timer_probe(struct platform_device *pdev)
 {
+	const struct sunxi_timer_quirks *quirks;
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev_of_node(&pdev->dev);
 	struct sun5i_timer *st;
 	struct reset_control *rstc;
 	void __iomem *timer_base;
@@ -251,6 +273,9 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, st);
 
+	if (!node)
+		return -EINVAL;
+
 	timer_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(timer_base)) {
 		dev_err(dev, "Can't map registers\n");
@@ -273,11 +298,18 @@ static int sun5i_timer_probe(struct platform_device *pdev)
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
@@ -311,9 +343,27 @@ static void sun5i_timer_remove(struct platform_device *pdev)
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


