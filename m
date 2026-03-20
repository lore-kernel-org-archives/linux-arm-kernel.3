Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2101099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5pKY2eSspVqqY3nsOZ1gQ+ssdoRyfh9wUR9eYtNMao=; b=W6RRfCstJ7+Fp0dpiUt9hCD/gf
	iLgGrhfwUZRnxd8ndiTbv0nxxnzJ7AmZ0PF6sro1/CAYPj/87UucaNm6quzrXRqqF5iTSyydMo05R
	iE2JQjs3Pwe2rULisgZQisMgeOWWG1Tj0+7BmLQDY3t0Rr83sAs+GstlStdz42aZ/gsLgbz/rJ6Jk
	MjC0bgTqGHpJuqmc90jZCJCOpOSwJynF9vGGg/glshGcsLahv1fVv9C0lzmbvyECM+cdrqZS1PQGa
	xPVJLudsvSP0h+tlEeeSbKxPXvCxR9bnjZYdCsTtEVXIvaA6KB48rnEGAT4uKDJAdIUsBZD16u8ml
	zZ7M79pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e2H-0000000DKLw-2BNc;
	Fri, 20 Mar 2026 17:53:25 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3e2D-0000000DKKW-3fab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+5pKY2eSspVqqY3nsOZ1gQ+ssdoRyfh9wUR9eYtNMao=; b=T2ahv+dodZUILVWl1mJkUKcm1c
	UXhL3IZqk0LmYTbQIaEI2eiUFyh2/laid1Qm+Vn+QxBjZ7Q1tDNIMEnFuaplwvoJX/BhaLiyvPe0I
	NxkP+rtsVABKTtIO11+4x+LMJBxWAwI7NDztdI98ckYavoAtVk4x0QpgjEapvk/pz5a9CUt+v5cRf
	U3x1AaYrN9ReZfU66Dyau5WKyQQOounL2WoEgikNZGyWvwc1DIileJiGcGse3IGW6dzru0Waqj/YH
	MN/qbj64eNsleqZzbTYhAsPZiwmrdCz78s2ovMqxG4qJgQWTYS7/om6DBUDOR8Pl5Xg4VgbNatWS1
	g/woX1eQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3e2B-00000005OnI-1SW7;
	Fri, 20 Mar 2026 18:53:19 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Fri, 20 Mar 2026 18:52:31 +0100
Subject: [PATCH v6 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-rc2-boot-hang-v6-2-74dca70dd60e@mmpsystems.pl>
References: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
In-Reply-To: <20260320-rc2-boot-hang-v6-0-74dca70dd60e@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774029161; l=2683;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=rZ8GolW8aT1v8bfrIeIl9S12jlFKdW++KGKQxWnb5Xc=;
 b=JM0Yz0qx+b3ioJx5PketJuePCKqOuSTNIiAD7JoTPWldPKr9KzlNDN2kUXm7Iz89xnHKSBI64
 y57MhvTpr2jCB4nvNougc8nI8yNcUgqX2nWYtzvQ2AmyRVJ9cuJh96B
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_105322_088359_ED64C8F5 
X-CRM114-Status: GOOD (  14.01  )
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

Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.

The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
is in uninitialized state.

Solution is to set pinmux to GPIO INPUT in
sunxi_pinctrl_irq_request_resources() if it wasn't initialized
earlier.

Tested on Orange Pi Zero 3.

Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 20 ++++++++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 685b79fc0bf8..d3042e0c9712 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1092,6 +1092,9 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 disabled_mux, muxval;
 	int ret;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
@@ -1099,8 +1102,21 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 	if (!func)
 		return -EINVAL;
 
-	ret = gpiochip_lock_as_irq(pctl->chip,
-			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
+	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	/* Change muxing to GPIO INPUT mode if at reset value */
+	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
+		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
+	else
+		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
+
+	if (muxval == disabled_mux)
+		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
+			      SUN4I_FUNC_INPUT);
+
+	ret = gpiochip_lock_as_irq(pctl->chip, offset);
 	if (ret) {
 		dev_err(pctl->dev, "unable to lock HW IRQ %lu for IRQ\n",
 			irqd_to_hwirq(d));
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 22bffac1c3f0..0daf7600e2fb 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -86,6 +86,8 @@
 
 #define SUN4I_FUNC_INPUT	0
 #define SUN4I_FUNC_IRQ		6
+#define SUN4I_FUNC_DISABLED_OLD 7
+#define SUN4I_FUNC_DISABLED_NEW 15
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
 #define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)

-- 
2.43.0


