Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8930C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qfcKbr/m;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=e8TqIEvH;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=YuT7UvyZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ts/JzIkkGhElVCe5I3lwqSP7s8MMajHvt8JdHwP8t7c=; b=qfcKbr/mJrx9guvjzuSBwH/n2u
	l+X3zPk+BilZLvL3aNlA1zQMN3YGg2OU401WeTxqsDZ/H3nbIx74ElDWzSW6dV7fi9FuSg30fOixX
	uPtW+7JCYaBcIjKeDySROdXJCg4nbU2KamrQAE0lSuAFq52uV8pAkjOMazc3KilTv9qczMae/X1M/
	6IQHqThdWK6fit0KvGBs1m7EFYww2UkkY1mRYA7xD2IT1wBVZMDBQIY6ZlOZB3NMBcjVG6k7P0Jh2
	gUt5ajWb44F7k/UIkK0NNpZOkkjT83HhJOzPI07bshHRS9zFLEswQEuYhW2bShcDTCYgntE0YShAQ
	FKmNg/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbCB-0000000CfGT-3Nr3;
	Wed, 21 Oct 2026 18:37:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbC9-0000000CfG8-3M2X
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 21 Oct 2026 18:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Ts/JzIkkGhElVCe5I3lwqSP7s8MMajHvt8JdHwP8t7c=; b=e8TqIEvHWs1iQebACvp3y9VvcG
	u318JAdbmLfP2waZXhYudqV2PbSnwEkQ9uJfjDuG7k+rPXvZpTBI/EIiVxR3ex2rTBb3rjeIr2p/Y
	t134jgufliA/fLFhZkaKrndiHHUE8psL3nVgDfhkp2/SdN2u67eDVmjXqMBFhdA3ya4m7C43tD5//
	1YDmoIU1YbN89v6n0RgaZcA0Hh8sKURiBtU1wLpfcfI9ggBQ1PV+8qUH4xmC4B4LHH82x9QP3183c
	prvng84J7ghWInOVQIwYqt2UGPXecBfzhO2FKa0I8UjrYX+veCZzi+gcEMaxnmJcr/Wu1RkXXeQo9
	UkDxO3bQ==;
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJbC6-000000067r4-2VA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:37:48 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0E33CC0000F0;
	Wed, 21 Oct 2026 11:37:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0E33CC0000F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792607864;
	bh=gxE29atQqWRrcM8S0ab10Q9L+j74A67DwJdun4gbvMY=;
	h=From:To:Cc:Subject:Date:From;
	b=YuT7UvyZcMZSkScm1KlxS5cdXcZdypqo7qplBgeMc7y9fP0m21zKQfLDeKETv8sHm
	 XGH/QSvEKeVcHXlElm3l1H4R+ffsXNZN8+LJWcJkZG3HlPVm3pY/uG1DeozPxjynfr
	 /bdTDuiHwz5h2o87ISUiYQ/kKrEuO1qovzmJUuDw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E4C25A83;
	Wed, 21 Oct 2026 11:37:43 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM)
Subject: [PATCH] pinctrl: nsp: support both-edge GPIO interrupts
Date: Wed, 21 Oct 2026 11:37:16 -0700
Message-ID: <20261021183716.718318-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_193746_939055_9EDB7D79 
X-CRM114-Status: GOOD (  17.96  )
X-Spam-Score: -1.2 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SFP core requests rising and falling edge interrupts for module
presence, loss of signal and transmit fault GPIOs. GPIO-A only has one
edge polarity bit per pin, so the driver rejects IRQ_TYPE_EDGE_BOTH and
makes the SFP core fall back to polling.

Emulate both-edge detection by arming the edge opposite to the current
input level, then rearm it after acknowledging each interrupt and before
unmasking. Resample the input while programming the polarity so an edge
during that sequence leaves the controller armed for the new level.

Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 35 +++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 83fcc80d5967..cc990361b7b8 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -64,6 +64,7 @@ struct nsp_gpio {
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
 	raw_spinlock_t lock;
+	unsigned long both_edges;
 };
 
 enum base_type {
@@ -122,6 +123,18 @@ static inline bool nsp_get_bit(struct nsp_gpio *chip, enum base_type address,
 		return !!(readl(chip->base + reg) & BIT(gpio));
 }
 
+static void nsp_gpio_irq_rearm_both(struct nsp_gpio *chip, unsigned int gpio)
+{
+	bool level, new_level;
+
+	do {
+		level = nsp_get_bit(chip, REG, NSP_GPIO_DATA_IN, gpio);
+		/* A high input needs the falling edge and vice versa. */
+		nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_POLARITY, gpio, level);
+		new_level = nsp_get_bit(chip, REG, NSP_GPIO_DATA_IN, gpio);
+	} while (level != new_level);
+}
+
 static irqreturn_t nsp_gpio_irq_handler(int irq, void *data)
 {
 	struct gpio_chip *gc = (struct gpio_chip *)data;
@@ -157,10 +170,18 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
 	unsigned gpio = d->hwirq;
 	u32 val = BIT(gpio);
 	u32 trigger_type;
+	unsigned long flags;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH) {
 		writel(val, chip->base + NSP_GPIO_EVENT);
+
+		if (test_bit(gpio, &chip->both_edges)) {
+			raw_spin_lock_irqsave(&chip->lock, flags);
+			nsp_gpio_irq_rearm_both(chip, gpio);
+			raw_spin_unlock_irqrestore(&chip->lock, flags);
+		}
+	}
 }
 
 /*
@@ -203,6 +224,8 @@ static void nsp_gpio_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&chip->lock, flags);
+	if (test_bit(d->hwirq, &chip->both_edges))
+		nsp_gpio_irq_rearm_both(chip, d->hwirq);
 	nsp_gpio_irq_set_mask(d, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 }
@@ -229,6 +252,14 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		falling = true;
 		break;
 
+	case IRQ_TYPE_EDGE_BOTH:
+		/* The controller has a single edge polarity bit. Emulate both
+		 * edges by initially arming the edge opposite to the input and
+		 * switching polarity after every interrupt.
+		 */
+		falling = nsp_get_bit(chip, REG, NSP_GPIO_DATA_IN, gpio);
+		break;
+
 	case IRQ_TYPE_LEVEL_HIGH:
 		level_low = false;
 		break;
@@ -243,6 +274,8 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		raw_spin_unlock_irqrestore(&chip->lock, flags);
 		return -EINVAL;
 	}
+	__assign_bit(gpio, &chip->both_edges,
+		     (type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH);
 
 	nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_POLARITY, gpio, falling);
 	nsp_set_bit(chip, REG, NSP_GPIO_INT_POLARITY, gpio, level_low);
-- 
2.53.0


