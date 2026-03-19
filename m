Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA45109024D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4Fkq0BpRh/daBqnf+0j3WwUVTWZQZIYHKaumJ6a8Wc=; b=QzV8pDAWtSAJxCLavJSWZMhRQs
	gRhlCKIY/GN+Z5RlhCAtQcJEBHPL79ZAY7OfgayCTyZbAW5F5cMTVTfNXUPFeWQ+6f4FCEvdZYdor
	ricabIR1RZEZjkeTo0iHFGjly6SNHMgJOTVjR8n+YP0a7mhkqj/6HNM1vnWSWwJbB7womo7IBR7J2
	9Eu7lpjtwBzJyGU3zzjBM00pJOlL/Mu3z6kHUclrfequp2z0uCgdeXtb2/DDJJThRrzGZLUCcEbwk
	Ly9ANZ3/VP0ziTZFAmDT0FZn4p/0//UZICBi/K7/lqeFzv0AiRtz49XfelOXqmpXcD7Ph2VLRyVOj
	WFpurtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fwv-0000000B2Fq-1LuS;
	Thu, 19 Mar 2026 16:10:17 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fwq-0000000B2Do-2NXO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A4Fkq0BpRh/daBqnf+0j3WwUVTWZQZIYHKaumJ6a8Wc=; b=j8gh51Fnt3ugvEg0v58zAFHwat
	1QqmTI54sPEnCirz41zxi/VTubbrcpjBYsnCO2Yf4ng4tyrCcDZ93VIVzkwkA/aJ6NJONWkJdlbl2
	wLH3UhYfMb8HTyfNZ5LoTmT0RzwHCRZc7kgf8VfTBI0LZkxu6WzBOt0pu1TrxNbIg3IVPIwiqwmfI
	k5fYhgEh07VR+e+1dz4WaWdSqD4cOBAk729zn8WkPOdgHWi3jDsLdB4qXCKB5ltqFL1AP3zbYF/AQ
	iNO1WVD9Kj+DaurIqK1u2HkEBMjMZqUVspc4vNr38qhwDiUulzwkZGiH80cYF7ryL8FLlzd1qsNak
	bfSA97KQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3Fwo-0000000FeUM-0BVY;
	Thu, 19 Mar 2026 17:10:10 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Thu, 19 Mar 2026 17:09:55 +0100
Subject: [PATCH v4 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-rc2-boot-hang-v4-2-4372f47cb6b8@mmpsystems.pl>
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl>
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773936605; l=2466;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=/HFuwOyepZBcoKn4qdROtpBfFPXhQv03vCmHiEIqhrc=;
 b=6hdF4CYJBWZwR/0NIfa0VSmV4DSB6Nn2VI7kon8NEWAVLcyHTWoH+QwDJ9TGmRBTM5qCCDJmu
 XZcxF7ijXknALkyMbhT4W2z24DD2NeBSCO/JTP5dabYocddLvH9j4B+
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_091013_103362_88932716 
X-CRM114-Status: GOOD (  12.85  )
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
is in unitialized state.

Solution is to set pinmux to GPIO INPUT in
sunxi_pinctrl_irq_request_resources() if it wasn't initialized
earlier.

Tested on Orange Pi Zero 3.

Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 19 +++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 685b79fc0bf8..321ee97f5745 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1092,13 +1092,32 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
 	struct sunxi_desc_function *func;
+	unsigned int offset;
+	u32 reg, shift, mask;
+	u8 muxval;
 	int ret;
+	bool is_new_layout;
+	bool is_reset_mux;
 
 	func = sunxi_pinctrl_desc_find_function_by_pin(pctl,
 					pctl->irq_array[d->hwirq], "irq");
 	if (!func)
 		return -EINVAL;
 
+	offset = pctl->irq_array[d->hwirq] - pctl->desc->pin_base;
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	muxval = (readl(pctl->membase + reg) & mask) >> shift;
+
+	/* Change muxing to GPIO INPUT mode if at reset value */
+	is_new_layout = pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT;
+	is_reset_mux = (!is_new_layout && muxval == SUN4I_FUNC_DISABLED_OLD) ||
+		       (is_new_layout && muxval == SUN4I_FUNC_DISABLED_NEW); 
+
+	if (is_reset_mux) {
+		sunxi_pmx_set(pctl->pctl_dev, pctl->irq_array[d->hwirq],
+			      SUN4I_FUNC_INPUT);
+	}
+
 	ret = gpiochip_lock_as_irq(pctl->chip,
 			pctl->irq_array[d->hwirq] - pctl->desc->pin_base);
 	if (ret) {
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


