Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8526CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dmM4Z/K62obQMJtoATM7dbLY0Uor4qUOBp49Ia9JKaA=; b=OyhY39b5LFDlRMhFVnJa5DCwDV
	ty7D9VsxF436oQE960Cu4IOYGqBaDz7zy2XKgCx4a29JiaWj9gXcCIpAdtjrkiHRz89NpOPlKwbKX
	6FXXlwiCjfGnR6fkTIeA90GVT0+emvBnb4DEpQEnke96YnX8a4TCzoDm4SyLtSBcOZBWogL/7BSG9
	jMtXE1w3fZnSUsla1FjwJwMegfWLNE22D7U+HzSyQDz1pWU6+lVWJ0j91sBB5Ca43wbeIiAWtCphE
	igxo/IjyHU97isfUbZfMh7NfC2wR7TDbnbtb5tJDZ9Yc0rXK3KTVI91jCyIVksTTAEtD9T3REx1O3
	kIuTcqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeNC-0000000EIjK-1paX;
	Wed, 03 Jun 2026 05:42:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeNA-0000000EIir-1PRr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 05:42:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84275887a3fso128232b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 22:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780465355; x=1781070155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmM4Z/K62obQMJtoATM7dbLY0Uor4qUOBp49Ia9JKaA=;
        b=s/YpQ6SPPvOyhWue9hiZlt2fhIVLa8CBk4iUTtBfDzklNR2Dnvsq2aDp/fwYLxSorP
         +TDwwo28v9Cdb/9hXymVUe6EsKlVjqTslIV2Rbcnk2SBNryToEMLX3icW9BAbeKSu2Il
         bVVugZS0243Er/Xa6bnkhTzQi8T91t0Qqu0Z2ZlLZShXQ8hweV2ZfEasN3usmWmo1q6m
         hsjN3jAfXif43HWFpGJF/+l/j7n1RrkYeKgDkk4ED3DPo/gOYBbIKwaIoZ3L3k3Qviny
         PfazGo9PHk6KtkRdOG9PzRhCceDtmChhEOBqaj4NijcZ94TIJ7TSdOzK+VAKF2b+Xs9j
         vvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465355; x=1781070155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmM4Z/K62obQMJtoATM7dbLY0Uor4qUOBp49Ia9JKaA=;
        b=YRuJ0ePe00JGa85YboEFfC8cyKb3i0EGBhdthPyjhno17sjPeJFfKKgK9eEpZ1PxVK
         wuCYRmkt7vOEyyWVJSfce/XbEzj+A27/rcLrA4BVsXueMqf91Ni4VJMkzpE7ziDCUWV/
         VsnTRza9x0SpsPvTxXXA/+hvmzY0bNg57R7nytj7YUquVMBxqqx/3214mMIlDdbtr5+v
         SvqRksMiIsQt9UxgWMT43J8cAjxFFad2Bb77zzn4A4yV9LhmuSLzk4RVUVv4zz11s9Fa
         Uqp1xspGrtvK+AzO1wU+ly6uIDuq18movLNO4zdfnnf9OqX4UEFJwtbCaJzYgW+P/a/z
         jnxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9w2eANYtCOd4m/l+rUv8ECgdlrd/MTfWDqsYVVP4R4d1nqyYaakc5SagKRNrMEo7BEK2G7JMBnvHcUJ0YleOsg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvn/jlQjtKQ7ep7Q/tmyF+nI/aQWjdHBXaRySLwx8E7RFLLUL1
	qHGBy7heczQjSsXNDKKaiswfk3jDxHkgfczLun3jeH9ugWKW2LPgjbTR
X-Gm-Gg: Acq92OGLgPqKZ3f3x/1DOuEwmoJOE71MGZAn5X8rGFWU3otzXE2d/9j/Fg75kP4QA4v
	9FsrOipevQyNFrAXFRqLbdtZzaslLANmkghK2K1r53p//AL8t5MB63CIsFUPDZGDA6j4uGxFzaV
	hcjQjkdhZVsmCTYsrXRtTASSBjIOW1zUN37y7YxROftjbjlDjdpqkbWlOS2dayIT0JgJ0KoYrep
	hgeEJY0EaR4GHO5mwIQ4w66U6j4+wxNGDX0FhTc69oqRHSs9EB+mtcDcKTzmF0B0IyighDnpVjT
	h3qUQEvD1/bvYYjTlXnpijd4v/5wNYJnFy+hZP/u9QV22hds/04/G+OKFCLvx2djKlY2b0bp7oX
	62XWwqTeHZZkgekdXfzJ6ZR61EzQ4mo3c5j19z6QvBTn/QH3wKAaegYdWiCiGMPtqxqtoqPv7rX
	SEXveqKCOYhiCahkoMHfJEfIbPLXXhRWMwVU+Ac5xKsNskujyvLXDQEkVpFlHtlr55gGc0Qy36T
	ojABjwfHvtKD09eyTPC8EkmwbOwUHDWCVGn1cBUQZMvYdk1IymvpFjY
X-Received: by 2002:a05:6a00:2e9e:b0:842:3838:cb03 with SMTP id d2e1a72fcca58-842859f9b6emr1494731b3a.11.1780465355245;
        Tue, 02 Jun 2026 22:42:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm1909506b3a.61.2026.06.02.22.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 22:42:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE)
Subject: [PATCH] Input: xilinx_ps2 - remove driver
Date: Tue,  2 Jun 2026 22:42:17 -0700
Message-ID: <20260603054217.442016-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_224236_418177_4A3C73C7 
X-CRM114-Status: GOOD (  36.09  )
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

Remove the Xilinx XPS PS/2 controller driver. This driver supports an
old Xilinx EDK IP core that is no longer in active use. The hardware
is not available on modern platforms, and the driver has no users here.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/input/serio/Kconfig      |  10 -
 drivers/input/serio/Makefile     |   1 -
 drivers/input/serio/xilinx_ps2.c | 363 -------------------------------
 3 files changed, 374 deletions(-)
 delete mode 100644 drivers/input/serio/xilinx_ps2.c

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 5f15a6462056..bacab1f58400 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -188,16 +188,6 @@ config SERIO_RAW
 	  To compile this driver as a module, choose M here: the
 	  module will be called serio_raw.
 
-config SERIO_XILINX_XPS_PS2
-	tristate "Xilinx XPS PS/2 Controller Support"
-	depends on PPC || MICROBLAZE
-	help
-	  This driver supports XPS PS/2 IP from the Xilinx EDK on
-	  PowerPC platform.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called xilinx_ps2.
-
 config SERIO_ALTERA_PS2
 	tristate "Altera UP PS/2 controller"
 	depends on HAS_IOMEM
diff --git a/drivers/input/serio/Makefile b/drivers/input/serio/Makefile
index 8ab98f4aa28d..7f5137dc02e2 100644
--- a/drivers/input/serio/Makefile
+++ b/drivers/input/serio/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_SERIO_SGI_IOC3)	+= ioc3kbd.o
 obj-$(CONFIG_SERIO_LIBPS2)	+= libps2.o
 obj-$(CONFIG_SERIO_RAW)		+= serio_raw.o
 obj-$(CONFIG_SERIO_AMS_DELTA)	+= ams_delta_serio.o
-obj-$(CONFIG_SERIO_XILINX_XPS_PS2)	+= xilinx_ps2.o
 obj-$(CONFIG_SERIO_ALTERA_PS2)	+= altera_ps2.o
 obj-$(CONFIG_SERIO_ARC_PS2)	+= arc_ps2.o
 obj-$(CONFIG_SERIO_APBPS2)	+= apbps2.o
diff --git a/drivers/input/serio/xilinx_ps2.c b/drivers/input/serio/xilinx_ps2.c
deleted file mode 100644
index 411d55ca1a66..000000000000
--- a/drivers/input/serio/xilinx_ps2.c
+++ /dev/null
@@ -1,363 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Xilinx XPS PS/2 device driver
- *
- * (c) 2005 MontaVista Software, Inc.
- * (c) 2008 Xilinx, Inc.
- */
-
-
-#include <linux/module.h>
-#include <linux/serio.h>
-#include <linux/interrupt.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-#include <linux/list.h>
-#include <linux/io.h>
-#include <linux/mod_devicetable.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
-
-#define DRIVER_NAME		"xilinx_ps2"
-
-/* Register offsets for the xps2 device */
-#define XPS2_SRST_OFFSET	0x00000000 /* Software Reset register */
-#define XPS2_STATUS_OFFSET	0x00000004 /* Status register */
-#define XPS2_RX_DATA_OFFSET	0x00000008 /* Receive Data register */
-#define XPS2_TX_DATA_OFFSET	0x0000000C /* Transmit Data register */
-#define XPS2_GIER_OFFSET	0x0000002C /* Global Interrupt Enable reg */
-#define XPS2_IPISR_OFFSET	0x00000030 /* Interrupt Status register */
-#define XPS2_IPIER_OFFSET	0x00000038 /* Interrupt Enable register */
-
-/* Reset Register Bit Definitions */
-#define XPS2_SRST_RESET		0x0000000A /* Software Reset  */
-
-/* Status Register Bit Positions */
-#define XPS2_STATUS_RX_FULL	0x00000001 /* Receive Full  */
-#define XPS2_STATUS_TX_FULL	0x00000002 /* Transmit Full  */
-
-/*
- * Bit definitions for ISR/IER registers. Both the registers have the same bit
- * definitions and are only defined once.
- */
-#define XPS2_IPIXR_WDT_TOUT	0x00000001 /* Watchdog Timeout Interrupt */
-#define XPS2_IPIXR_TX_NOACK	0x00000002 /* Transmit No ACK Interrupt */
-#define XPS2_IPIXR_TX_ACK	0x00000004 /* Transmit ACK (Data) Interrupt */
-#define XPS2_IPIXR_RX_OVF	0x00000008 /* Receive Overflow Interrupt */
-#define XPS2_IPIXR_RX_ERR	0x00000010 /* Receive Error Interrupt */
-#define XPS2_IPIXR_RX_FULL	0x00000020 /* Receive Data Interrupt */
-
-/* Mask for all the Transmit Interrupts */
-#define XPS2_IPIXR_TX_ALL	(XPS2_IPIXR_TX_NOACK | XPS2_IPIXR_TX_ACK)
-
-/* Mask for all the Receive Interrupts */
-#define XPS2_IPIXR_RX_ALL	(XPS2_IPIXR_RX_OVF | XPS2_IPIXR_RX_ERR |  \
-				 XPS2_IPIXR_RX_FULL)
-
-/* Mask for all the Interrupts */
-#define XPS2_IPIXR_ALL		(XPS2_IPIXR_TX_ALL | XPS2_IPIXR_RX_ALL |  \
-				 XPS2_IPIXR_WDT_TOUT)
-
-/* Global Interrupt Enable mask */
-#define XPS2_GIER_GIE_MASK	0x80000000
-
-struct xps2data {
-	int irq;
-	spinlock_t lock;
-	void __iomem *base_address;	/* virt. address of control registers */
-	unsigned int flags;
-	struct serio *serio;		/* serio */
-	struct device *dev;
-};
-
-/************************************/
-/* XPS PS/2 data transmission calls */
-/************************************/
-
-/**
- * xps2_recv() - attempts to receive a byte from the PS/2 port.
- * @drvdata:	pointer to ps2 device private data structure
- * @byte:	address where the read data will be copied
- *
- * If there is any data available in the PS/2 receiver, this functions reads
- * the data, otherwise it returns error.
- */
-static int xps2_recv(struct xps2data *drvdata, u8 *byte)
-{
-	u32 sr;
-	int status = -1;
-
-	/* If there is data available in the PS/2 receiver, read it */
-	sr = in_be32(drvdata->base_address + XPS2_STATUS_OFFSET);
-	if (sr & XPS2_STATUS_RX_FULL) {
-		*byte = in_be32(drvdata->base_address + XPS2_RX_DATA_OFFSET);
-		status = 0;
-	}
-
-	return status;
-}
-
-/*********************/
-/* Interrupt handler */
-/*********************/
-static irqreturn_t xps2_interrupt(int irq, void *dev_id)
-{
-	struct xps2data *drvdata = dev_id;
-	u32 intr_sr;
-	u8 c;
-	int status;
-
-	/* Get the PS/2 interrupts and clear them */
-	intr_sr = in_be32(drvdata->base_address + XPS2_IPISR_OFFSET);
-	out_be32(drvdata->base_address + XPS2_IPISR_OFFSET, intr_sr);
-
-	/* Check which interrupt is active */
-	if (intr_sr & XPS2_IPIXR_RX_OVF)
-		dev_warn(drvdata->dev, "receive overrun error\n");
-
-	if (intr_sr & XPS2_IPIXR_RX_ERR)
-		drvdata->flags |= SERIO_PARITY;
-
-	if (intr_sr & (XPS2_IPIXR_TX_NOACK | XPS2_IPIXR_WDT_TOUT))
-		drvdata->flags |= SERIO_TIMEOUT;
-
-	if (intr_sr & XPS2_IPIXR_RX_FULL) {
-		status = xps2_recv(drvdata, &c);
-
-		/* Error, if a byte is not received */
-		if (status) {
-			dev_err(drvdata->dev,
-				"wrong rcvd byte count (%d)\n", status);
-		} else {
-			serio_interrupt(drvdata->serio, c, drvdata->flags);
-			drvdata->flags = 0;
-		}
-	}
-
-	return IRQ_HANDLED;
-}
-
-/*******************/
-/* serio callbacks */
-/*******************/
-
-/**
- * sxps2_write() - sends a byte out through the PS/2 port.
- * @pserio:	pointer to the serio structure of the PS/2 port
- * @c:		data that needs to be written to the PS/2 port
- *
- * This function checks if the PS/2 transmitter is empty and sends a byte.
- * Otherwise it returns error. Transmission fails only when nothing is connected
- * to the PS/2 port. Thats why, we do not try to resend the data in case of a
- * failure.
- */
-static int sxps2_write(struct serio *pserio, unsigned char c)
-{
-	struct xps2data *drvdata = pserio->port_data;
-	u32 sr;
-
-	guard(spinlock_irqsave)(&drvdata->lock);
-
-	/* If the PS/2 transmitter is empty send a byte of data */
-	sr = in_be32(drvdata->base_address + XPS2_STATUS_OFFSET);
-	if (sr & XPS2_STATUS_TX_FULL)
-		return -EAGAIN;
-
-	out_be32(drvdata->base_address + XPS2_TX_DATA_OFFSET, c);
-	return 0;
-}
-
-/**
- * sxps2_open() - called when a port is opened by the higher layer.
- * @pserio:	pointer to the serio structure of the PS/2 device
- *
- * This function requests irq and enables interrupts for the PS/2 device.
- */
-static int sxps2_open(struct serio *pserio)
-{
-	struct xps2data *drvdata = pserio->port_data;
-	int error;
-	u8 c;
-
-	error = request_irq(drvdata->irq, &xps2_interrupt, 0,
-				DRIVER_NAME, drvdata);
-	if (error) {
-		dev_err(drvdata->dev,
-			"Couldn't allocate interrupt %d\n", drvdata->irq);
-		return error;
-	}
-
-	/* start reception by enabling the interrupts */
-	out_be32(drvdata->base_address + XPS2_GIER_OFFSET, XPS2_GIER_GIE_MASK);
-	out_be32(drvdata->base_address + XPS2_IPIER_OFFSET, XPS2_IPIXR_RX_ALL);
-	(void)xps2_recv(drvdata, &c);
-
-	return 0;		/* success */
-}
-
-/**
- * sxps2_close() - frees the interrupt.
- * @pserio:	pointer to the serio structure of the PS/2 device
- *
- * This function frees the irq and disables interrupts for the PS/2 device.
- */
-static void sxps2_close(struct serio *pserio)
-{
-	struct xps2data *drvdata = pserio->port_data;
-
-	/* Disable the PS2 interrupts */
-	out_be32(drvdata->base_address + XPS2_GIER_OFFSET, 0x00);
-	out_be32(drvdata->base_address + XPS2_IPIER_OFFSET, 0x00);
-	free_irq(drvdata->irq, drvdata);
-}
-
-/**
- * xps2_of_probe - probe method for the PS/2 device.
- * @ofdev:	pointer to OF device structure
- *
- * This function probes the PS/2 device in the device tree.
- * It initializes the driver data structure and the hardware.
- * It returns 0, if the driver is bound to the PS/2 device, or a negative
- * value if there is an error.
- */
-static int xps2_of_probe(struct platform_device *ofdev)
-{
-	struct resource r_mem; /* IO mem resources */
-	struct xps2data *drvdata;
-	struct serio *serio;
-	struct device *dev = &ofdev->dev;
-	resource_size_t remap_size, phys_addr;
-	unsigned int irq;
-	int error;
-
-	dev_info(dev, "Device Tree Probing \'%pOFn\'\n", dev->of_node);
-
-	/* Get iospace for the device */
-	error = of_address_to_resource(dev->of_node, 0, &r_mem);
-	if (error) {
-		dev_err(dev, "invalid address\n");
-		return error;
-	}
-
-	/* Get IRQ for the device */
-	irq = irq_of_parse_and_map(dev->of_node, 0);
-	if (!irq) {
-		dev_err(dev, "no IRQ found\n");
-		return -ENODEV;
-	}
-
-	drvdata = kzalloc_obj(*drvdata);
-	serio = kzalloc_obj(*serio);
-	if (!drvdata || !serio) {
-		error = -ENOMEM;
-		goto failed1;
-	}
-
-	spin_lock_init(&drvdata->lock);
-	drvdata->irq = irq;
-	drvdata->serio = serio;
-	drvdata->dev = dev;
-
-	phys_addr = r_mem.start;
-	remap_size = resource_size(&r_mem);
-	if (!request_mem_region(phys_addr, remap_size, DRIVER_NAME)) {
-		dev_err(dev, "Couldn't lock memory region at 0x%08llX\n",
-			(unsigned long long)phys_addr);
-		error = -EBUSY;
-		goto failed1;
-	}
-
-	/* Fill in configuration data and add them to the list */
-	drvdata->base_address = ioremap(phys_addr, remap_size);
-	if (drvdata->base_address == NULL) {
-		dev_err(dev, "Couldn't ioremap memory at 0x%08llX\n",
-			(unsigned long long)phys_addr);
-		error = -EFAULT;
-		goto failed2;
-	}
-
-	/* Disable all the interrupts, just in case */
-	out_be32(drvdata->base_address + XPS2_IPIER_OFFSET, 0);
-
-	/*
-	 * Reset the PS2 device and abort any current transaction,
-	 * to make sure we have the PS2 in a good state.
-	 */
-	out_be32(drvdata->base_address + XPS2_SRST_OFFSET, XPS2_SRST_RESET);
-
-	dev_info(dev, "Xilinx PS2 at 0x%08llX mapped to 0x%p, irq=%d\n",
-		 (unsigned long long)phys_addr, drvdata->base_address,
-		 drvdata->irq);
-
-	serio->id.type = SERIO_8042;
-	serio->write = sxps2_write;
-	serio->open = sxps2_open;
-	serio->close = sxps2_close;
-	serio->port_data = drvdata;
-	serio->dev.parent = dev;
-	snprintf(serio->name, sizeof(serio->name),
-		 "Xilinx XPS PS/2 at %08llX", (unsigned long long)phys_addr);
-	snprintf(serio->phys, sizeof(serio->phys),
-		 "xilinxps2/serio at %08llX", (unsigned long long)phys_addr);
-
-	serio_register_port(serio);
-
-	platform_set_drvdata(ofdev, drvdata);
-	return 0;		/* success */
-
-failed2:
-	release_mem_region(phys_addr, remap_size);
-failed1:
-	kfree(serio);
-	kfree(drvdata);
-
-	return error;
-}
-
-/**
- * xps2_of_remove - unbinds the driver from the PS/2 device.
- * @of_dev:	pointer to OF device structure
- *
- * This function is called if a device is physically removed from the system or
- * if the driver module is being unloaded. It frees any resources allocated to
- * the device.
- */
-static void xps2_of_remove(struct platform_device *of_dev)
-{
-	struct xps2data *drvdata = platform_get_drvdata(of_dev);
-	struct resource r_mem; /* IO mem resources */
-
-	serio_unregister_port(drvdata->serio);
-	iounmap(drvdata->base_address);
-
-	/* Get iospace of the device */
-	if (of_address_to_resource(of_dev->dev.of_node, 0, &r_mem))
-		dev_err(drvdata->dev, "invalid address\n");
-	else
-		release_mem_region(r_mem.start, resource_size(&r_mem));
-
-	kfree(drvdata);
-}
-
-/* Match table for of_platform binding */
-static const struct of_device_id xps2_of_match[] = {
-	{ .compatible = "xlnx,xps-ps2-1.00.a", },
-	{ /* end of list */ },
-};
-MODULE_DEVICE_TABLE(of, xps2_of_match);
-
-static struct platform_driver xps2_of_driver = {
-	.driver = {
-		.name = DRIVER_NAME,
-		.of_match_table = xps2_of_match,
-	},
-	.probe		= xps2_of_probe,
-	.remove		= xps2_of_remove,
-};
-module_platform_driver(xps2_of_driver);
-
-MODULE_AUTHOR("Xilinx, Inc.");
-MODULE_DESCRIPTION("Xilinx XPS PS/2 driver");
-MODULE_LICENSE("GPL");
-
-- 
2.54.0


