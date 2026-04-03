Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F51CC6B3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0XcTKJSZv00lNgVXjUFXubjiKj+C90x3kNuWZLzTwo=; b=aop4nOSN7jxD4fGeYzzvLk4cB5
	2pTL/Ep+U4TYu0unzNmDwVp1bRmpUQIRMt5HLyg6YYhtPsupfE9dWZfwvT6Xn8Y7jF38J0qEdcxov
	xElwxt2dsrYb5BmMfux7a49vLyjlBaT+U8afBImsFWQF8XE7tAZ8LqJF9GidX9k20W/CGAIXJphLq
	oxTzGbAkRMlcWmO/nGddmqBl0ANobnZLJwvgFc6uPxXc7hs+/g33jT2PJsXiiR/Vl2AECPfhn8U1j
	CllhK16qzTFTE60yp4avBEWR1BKhqHHMWrXFI+Ilm5w1yoUw/N62IygFlqaXm6xIazYLrRYoQJCGz
	N80QuZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8SlZ-00000000zdF-29YR;
	Fri, 03 Apr 2026 00:52:05 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8SlW-00000000zbk-3KXc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 00:52:03 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1817550eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 17:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177522; x=1775782322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0XcTKJSZv00lNgVXjUFXubjiKj+C90x3kNuWZLzTwo=;
        b=DDoVpdc7xavkUNfyxsnloB1Ou3GAjrFhg9fSOI5VR6h//LHE6LGv9C6uAc0yE0sG0p
         tDwghFs5A/Cb1GiSHnzKNXm5a8E2mRYtohGiPMTL4/m6d6hKt69MM73NL4cNcbJX26YA
         XuRgPlo9dc58VX3AmnwaoGFd2PZ6oX5s6gsfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177522; x=1775782322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0XcTKJSZv00lNgVXjUFXubjiKj+C90x3kNuWZLzTwo=;
        b=b11h1jLYTLjFl3w3eakWJ4bpystZHxw85x/D+XfROBhj83K3KWS6w1hwRq1zlrPluh
         E3z4WpvWHk7X+le68LQ4HjYZSPkXglGcRlt3NgMmMoaAw8CInVq+jlRBuGJg1pumGsQw
         ICAbHIuTHiqygMpcOvC2mtH9aO92FxXUcrBY38hzlKWaUzUzYUqAlJN23OcqJr8ayryI
         4JjHYDnHdW/RojqluyriFT96erTZruPlc0IR+5/Pfpp2tF1gXs7M3qmjRNypVE7aO//A
         phG01+Dx6OHIntwr8tZUG/go42P5BXTILPmrEl8C3eAw3zPKboN/LF4wsn75ZV/Fo3Z1
         mx9g==
X-Forwarded-Encrypted: i=1; AJvYcCU1qBYGjoaggow1cjk/JCy2pSUQ+iqoK7Kmkj+JLokIZX5HUJwAfhM1PGZ0eJ1vLbeJvcWd5afxhgcVZnAlQKE1@lists.infradead.org
X-Gm-Message-State: AOJu0YwlNmDGmZwmoAURUuB4jZbAt4Xp4BAg5q+eLh4ExIoQUvOlGjYe
	yKu1c4sCN2rUA++sGKyhSyOeHxTmQG3XXN0KnWj0FQIxSeuHAfGGTdhbzeGRr7bM5A==
X-Gm-Gg: AeBDiesv1bzxEidvdLvRrZILvuNs4VtFuk06aXNuKfhtPW25CEIjBeJFyfB+DNqEWnI
	1swxgIci3rXaTg/+zLDI4eor6njDyQrLzUAkYHW6qPsMuZeW7IDLTAH5x8SfuEMIOECmzOws3l2
	JXVuBDKzxFgqD6Nd5YJZEIIvU4jdHp0bc9TNuIAptTkkFTtZLxJiRifozSsynvqIRL6VDeqnEEc
	cMLshyPYtz2NwPE+sBxmugw+kytVRgohWjM+QqiHQVL/JLrf4KWsfRbuUSJt0z19SP6DJq0WNMO
	WYrhxN5vKio7ApjREc+aG32x5G7pZGZa0PlArzgAgV/D9r3JFPq4/Qi6C+23v4uc1og9EuNZVVO
	KfJAYADJ9BfeYHcUUJfU08XoNZk0Z2RU6CBCdAC63O8eRji4JxSVLQjF0A+AHToq3bVrp1T5XlL
	BZeTjKrNHLK9JxZ7SH0tfLFa1Y8bLzxgYmj6uLl/Y+jlWJ4EqSwQUy2JMn6EJy3mE4kY8cU5Epm
	DhdsL43BdQ=
X-Received: by 2002:a05:7300:2315:b0:2c8:b5e1:6b03 with SMTP id 5a478bee46e88-2cbfbf77d16mr618666eec.23.1775177521837;
        Thu, 02 Apr 2026 17:52:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:51:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	alexander.stein@ew.tq-group.com,
	andrew@codeconstruct.com.au,
	andrew@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	astewart@tektelic.com,
	bhelgaas@google.com,
	brgl@kernel.org,
	broonie@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	hkallweit1@gmail.com,
	jirislaby@kernel.org,
	joel@jms.id.au,
	kees@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	mani@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	robh@kernel.org
Subject: [PATCH v3 8/9] driver core: Replace dev->of_node_reused with DEV_FLAG_OF_NODE_REUSED
Date: Thu,  2 Apr 2026 17:49:54 -0700
Message-ID: <20260402174925.v3.8.I806b8636cd3724f6cd1f5e199318ab8694472d90@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403005005.30424-1-dianders@chromium.org>
References: <20260403005005.30424-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_175202_839940_F2FEA87C 
X-CRM114-Status: GOOD (  20.79  )
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

In C, bitfields are not necessarily safe to modify from multiple
threads without locking. Switch "of_node_reused" over to the "flags"
field so modifications are safe.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

Changes in v3:
- New

 drivers/base/core.c                      | 2 +-
 drivers/base/pinctrl.c                   | 2 +-
 drivers/base/platform.c                  | 2 +-
 drivers/net/pcs/pcs-xpcs-plat.c          | 2 +-
 drivers/of/device.c                      | 6 +++---
 drivers/pci/of.c                         | 2 +-
 drivers/pci/pwrctrl/core.c               | 2 +-
 drivers/regulator/bq257xx-regulator.c    | 2 +-
 drivers/regulator/rk808-regulator.c      | 2 +-
 drivers/tty/serial/serial_base_bus.c     | 2 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 +-
 include/linux/device.h                   | 6 +++---
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 00005777c21f..a87bd40499b6 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5282,7 +5282,7 @@ void device_set_of_node_from_dev(struct device *dev, const struct device *dev2)
 {
 	of_node_put(dev->of_node);
 	dev->of_node = of_node_get(dev2->of_node);
-	dev->of_node_reused = true;
+	set_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags);
 }
 EXPORT_SYMBOL_GPL(device_set_of_node_from_dev);
 
diff --git a/drivers/base/pinctrl.c b/drivers/base/pinctrl.c
index 6e250272c843..62c228c75d50 100644
--- a/drivers/base/pinctrl.c
+++ b/drivers/base/pinctrl.c
@@ -24,7 +24,7 @@ int pinctrl_bind_pins(struct device *dev)
 {
 	int ret;
 
-	if (dev->of_node_reused)
+	if (test_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags))
 		return 0;
 
 	dev->pins = devm_kzalloc(dev, sizeof(*(dev->pins)), GFP_KERNEL);
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index d44591d52e36..5128ff7e5e78 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -856,7 +856,7 @@ struct platform_device *platform_device_register_full(
 	pdev->dev.parent = pdevinfo->parent;
 	pdev->dev.fwnode = pdevinfo->fwnode;
 	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
-	pdev->dev.of_node_reused = pdevinfo->of_node_reused;
+	assign_bit(DEV_FLAG_OF_NODE_REUSED, &pdev->dev.flags, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {
 		pdev->platform_dma_mask = pdevinfo->dma_mask;
diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index b8c48f9effbf..c2722d8bd98a 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -349,7 +349,7 @@ static int xpcs_plat_init_dev(struct dw_xpcs_plat *pxpcs)
 	 * up later. Make sure DD-core is aware of the OF-node being re-used.
 	 */
 	device_set_node(&mdiodev->dev, fwnode_handle_get(dev_fwnode(dev)));
-	mdiodev->dev.of_node_reused = true;
+	set_bit(DEV_FLAG_OF_NODE_REUSED, &mdiodev->dev.flags);
 
 	/* Pass the data further so the DW XPCS driver core could use it */
 	mdiodev->dev.platform_data = (void *)device_get_match_data(dev);
diff --git a/drivers/of/device.c b/drivers/of/device.c
index f7e75e527667..fd77295a8c0f 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -26,7 +26,7 @@
 const struct of_device_id *of_match_device(const struct of_device_id *matches,
 					   const struct device *dev)
 {
-	if (!matches || !dev->of_node || dev->of_node_reused)
+	if (!matches || !dev->of_node || test_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags))
 		return NULL;
 	return of_match_node(matches, dev->of_node);
 }
@@ -192,7 +192,7 @@ ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len)
 {
 	ssize_t sl;
 
-	if (!dev || !dev->of_node || dev->of_node_reused)
+	if (!dev || !dev->of_node || test_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags))
 		return -ENODEV;
 
 	sl = of_modalias(dev->of_node, str, len - 2);
@@ -254,7 +254,7 @@ int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *
 {
 	int sl;
 
-	if ((!dev) || (!dev->of_node) || dev->of_node_reused)
+	if ((!dev) || (!dev->of_node) || test_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags))
 		return -ENODEV;
 
 	/* Devicetree modalias is tricky, we add it in 2 steps */
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279e..197b60c5a660 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -38,7 +38,7 @@ int pci_set_of_node(struct pci_dev *dev)
 	struct device *pdev __free(put_device) =
 		bus_find_device_by_of_node(&platform_bus_type, node);
 	if (pdev)
-		dev->bus->dev.of_node_reused = true;
+		set_bit(DEV_FLAG_OF_NODE_REUSED, &dev->bus->dev.flags);
 
 	device_set_node(&dev->dev, of_fwnode_handle(no_free_ptr(node)));
 	return 0;
diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
index 7754baed67f2..cfbe9b615b88 100644
--- a/drivers/pci/pwrctrl/core.c
+++ b/drivers/pci/pwrctrl/core.c
@@ -39,7 +39,7 @@ static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
 		 * If we got here then the PCI device is the second after the
 		 * power control platform device. Mark its OF node as reused.
 		 */
-		dev->of_node_reused = true;
+		set_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags);
 		break;
 	}
 
diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index dab8f1ab4450..01d3139e1d87 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -143,7 +143,7 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	struct regulator_config cfg = {};
 
 	pdev->dev.of_node = pdev->dev.parent->of_node;
-	pdev->dev.of_node_reused = true;
+	set_bit(DEV_FLAG_OF_NODE_REUSED, &pdev->dev.flags);
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(struct bq257xx_reg_data), GFP_KERNEL);
 	if (!pdata)
diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index e66408f23bb6..375ea7861134 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -2115,7 +2115,7 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 	int ret, i, nregulators;
 
 	pdev->dev.of_node = pdev->dev.parent->of_node;
-	pdev->dev.of_node_reused = true;
+	set_bit(DEV_FLAG_OF_NODE_REUSED, &pdev->dev.flags);
 
 	regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!regmap)
diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
index a12935f6b992..86c6003bbebb 100644
--- a/drivers/tty/serial/serial_base_bus.c
+++ b/drivers/tty/serial/serial_base_bus.c
@@ -74,7 +74,7 @@ static int serial_base_device_init(struct uart_port *port,
 	dev->parent = parent_dev;
 	dev->bus = &serial_base_bus_type;
 	dev->release = release;
-	dev->of_node_reused = true;
+	set_bit(DEV_FLAG_OF_NODE_REUSED, &dev->flags);
 
 	device_set_node(dev, fwnode_handle_get(dev_fwnode(parent_dev)));
 
diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 2ecd049dacc2..57048e3aa6bb 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -593,7 +593,7 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 		d->gadget.max_speed = USB_SPEED_HIGH;
 	d->gadget.speed = USB_SPEED_UNKNOWN;
 	d->gadget.dev.of_node = vhub->pdev->dev.of_node;
-	d->gadget.dev.of_node_reused = true;
+	set_bit(DEV_FLAG_OF_NODE_REUSED, &d->gadget.dev.flags);
 
 	rc = usb_add_gadget_udc(d->port_dev, &d->gadget);
 	if (rc != 0)
diff --git a/include/linux/device.h b/include/linux/device.h
index c2a6dba7a036..f6ca067bacca 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -482,6 +482,8 @@ struct device_physical_location {
  *		driver/bus sync_state() callback.
  * @DEV_FLAG_DMA_COHERENT: This particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
+ * @DEV_FLAG_OF_NODE_REUSED: Set if the device-tree node is shared with an
+ *		ancestor device.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE,
@@ -491,6 +493,7 @@ enum struct_device_flags {
 	DEV_FLAG_DMA_OPS_BYPASS,
 	DEV_FLAG_STATE_SYNCED,
 	DEV_FLAG_DMA_COHERENT,
+	DEV_FLAG_OF_NODE_REUSED,
 };
 
 /**
@@ -570,8 +573,6 @@ enum struct_device_flags {
  *
  * @offline_disabled: If set, the device is permanently online.
  * @offline:	Set after successful invocation of bus type's .offline().
- * @of_node_reused: Set if the device-tree node is shared with an ancestor
- *              device.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -678,7 +679,6 @@ struct device {
 
 	bool			offline_disabled:1;
 	bool			offline:1;
-	bool			of_node_reused:1;
 
 	unsigned long		flags;
 };
-- 
2.53.0.1213.gd9a14994de-goog


