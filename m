Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B481090257
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzsVAb42s53WXqAjWUga9OZyG9wFBa2wXJBkO6CnKoM=; b=4YTp0luYgYNhK/8LjHaaPc37HQ
	E6n1NLeD+INhLFLOtT20FAGbqmZ/O0C9XsIR3hbbtGIqNls+pqgOYl3pvsqtop4yHhPPq5bLS9ulx
	tPn+4iWV96tO02K8ozFMqlllTxqmlfuXplzGhqpAvia8Th6dyBjBREIv6e9CFgbX3tyKilkTrEeOK
	eSiPGOP28BlMB49erYHL3Yu8Ix1CfP4xpdPTQo8h0lVbwbybQl0M4d6n1ShkeUj/mRiM63Xt+XKQz
	/Gfr2tPGgRGqzBcZhe/6WEHDKeEe7EpyV+bWawFIPIFxjxnAUIJPnPubF16Ive19M2gG1tER0gOSO
	yVeGH3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H1l-0000000BB6G-12fK;
	Thu, 19 Mar 2026 17:19:21 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3H1Z-0000000BB0w-1tIz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rzsVAb42s53WXqAjWUga9OZyG9wFBa2wXJBkO6CnKoM=; b=TXJJbwx6ioPQR5/dL6m2CYRgRZ
	hvxRx4jj9bEmteiuRHbufbKeXnccBQjGQHFZpmETN5QAMc3TUX0DDBc5sBWkkQ5v4eUYVrIVYbfkx
	ptYZtQVwKQRUfG3GzE1vi+QDieArbJ324rFHCvQkuhnoJHOb/JovJBqLS4oqiSR0AVAHvuMT0ZcnX
	qRlhG2rCPh1MP/PZLX27gLWk8hTSR4eKKmdzLc2o+7tIUkFQdQjm26d58sp9F5frq+iU9InGNvEDo
	wCxsMdhoZlg7dxW9OeEgYoVm70CpKggZlTZTH0oU91px3UoQy6Z46xGTQzXbN4EFW9x3DPOAVeLRg
	ZSUq2GJg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3H1W-0000000HM7W-1kVr;
	Thu, 19 Mar 2026 18:19:06 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Thu, 19 Mar 2026 18:19:03 +0100
Subject: [PATCH v5 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773940742; l=2608;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=HIn/7AWM4rxYQ9Wt1cYh0+dNNUA4CpEdu/C69TAeiWk=;
 b=AjQ/09Qp3ksyJFRwDYdrVSUFgYf8UcWCYAKSUaNcpqjfPUetEc2pz58OOifBQzbZ9wyTf2nn8
 /rrDy4WJ1gzBPpvZH/zGNcXR/asjl6OMZhWpApxGRtcqzk21kCGSU1N
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_101909_667854_585A0819 
X-CRM114-Status: GOOD (  14.58  )
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
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 21 +++++++++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 685b79fc0bf8..e3aa2b70aa7d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1092,15 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 muxval;
 	int ret;
+	u8 disabled_mux;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
 					pctl->irq_array[d->hwirq], "irq");
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


