Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC6CCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x249jX8ld0QHuh7j+Gf35qQREt3Vaq29sGjtrOr/jo=; b=rC+wY6jcPlBz7v/MP76Xl9BO60
	BCZUCPfvGdSkzMFfYFsZOevpJmH3JWAET+KbEDes+8M8cJ4H8XH4pqM63WYwdufl/8waKQ2oTa5zG
	7FyKYqRROmTOGTv+79tBxs9MAVuM0lWmXh6Sdz9JeIF9CkdZgkHbTLbyq7wg7WCQnEq5PrUy8DBV3
	Hr8MXv4eMFlYG1fxKSx+I8wtHZer3Hv2SuzH6/SknYHWztBSVD9HZCYNzWYfsinWlr90vmm8Y0Akg
	gQ0ewfKkbXMEGTyizZw2kLGXk1/7Q2d+W57zquDNjuRuOHUNGOZ/7yEaegLdPN5k+h2zfb23nT4D/
	qluvq6Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQQ1-0000000DDGD-3cS2;
	Tue, 02 Jun 2026 14:48:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQPz-0000000DDEo-0Lf4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:48:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b3e03939so4803345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780411713; x=1781016513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x249jX8ld0QHuh7j+Gf35qQREt3Vaq29sGjtrOr/jo=;
        b=b/D5wfTNPXY5KOCI1/9qtrEbJazZPTvDtotkdGi9AHBIVzlGcnQd0zVe3q/CXVReqw
         OVkyEUFeaUxPjrsN+lk/+zexMaGCbx7eNr/y7Ug6uzwHaM8OdXeIR7b74PfzTvDJix1P
         YdLJpvYXim5S6gYkjNImcI4OKz67MubqQ37gFcuLYp3EDzxU33ABSTo1jjn1fC72E2r6
         F5okoTmr3/Bf11NctB45o/TVmGOpHbiZkp9GgvGwW7rZ/yOBbStiZ7DI3G9fCQtdZokB
         2QObCyDpDP33KUcUV54lZtX3GoxvQVjraGnso4qcqSGDnhPPtCG+wsmYpNue1KQfGEfu
         R8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780411713; x=1781016513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7x249jX8ld0QHuh7j+Gf35qQREt3Vaq29sGjtrOr/jo=;
        b=iGNUO+KiWaufSKB+qPIMgYDOKT0aM59KLxs6fO4kCml07IwfH42rrjM6JmwQ0016VW
         H7H4HRH+6Bg0/DIa7HSrxArvJWZToX3N1ayCmNZL6YkVzSLYq7WEU7bSqxeAXTwH+G4M
         Hh9Rtadn8Y3lqit5zRGx5aCoAFNTy6JpmsbkF00ZIvEzLmxX2nyX5M9zVX6rTUahhHwj
         FXXxm+96LKrCm6CwirESjuWPp0puaDhWhEVt07X0uIoobAM1Nz4v7ovi0zvdKMaIVAfd
         CunlZgHZa6rDDmJdDdFx4OVhxrGqLZiNdH+wIZ740miZ5oqkf3Yx86/OWGJqvM76tn+n
         wlsA==
X-Forwarded-Encrypted: i=1; AFNElJ/auUQI1DgsDsWXx2PhkXi4++FKD11H7v8a92sOm5iZknYfYIA7OngXCkOBbd0G4qY+qFr+GFmeSxhXzP0DY6Dv@lists.infradead.org
X-Gm-Message-State: AOJu0YyWEMI1mtnyzERvwQMiukHJdnoydVz8RtEfeBmGRESLXJaG18Fs
	2/3McUi+uEh3pzMb2snSUvIdARUGlIvfcGqRaZZYWJpatm1HvGDMKNEiSdXD5CXEot8=
X-Gm-Gg: Acq92OHtaHpikr51Of/+Tv9bqHTtlS+VCE60msvLWHW2ztroPHOZ04pOP2Fgn0SXfCt
	8tLmIe2KT1j0ZGUDi+c5vmDJuLzs7HF7zky8dyWBoDw5zbciMfV8+VNHuAwRvhBYeUpbjFlu+tn
	BBFtGACY+q094M1al3p1UQ9ofgGcC9m1FSV6ZCAOdvwTwb/yACK35DM3lxxEe550zfU2B8VUrW2
	1G9cvMITFE1L1/ClRyAep8KsNlogGZbUDVpteAD0FnbGV/GlhTmgQ/wMpIVrXAIOKhA4Jb351RS
	c0mgYSwsBmYaejvKx0IqSwN1m4f4VWwMkpgtHVxfo/Xi0e2qAylCQjX5i8YQzqpJLru2gJ50lYS
	BHLP+947oZPjgpvdC0T5M8IIzgJ2IL0upcXU//5q+APrEKOEH9IKVZTEO4nZfPUa4QIXfLvMog3
	7hJmwpwvDBJwhgsRZ5rDY3ISRd8AvDKtofCFKo7j0iWicGC8DwoPYqgJHAFJLSJhqgEEfYmuk=
X-Received: by 2002:a05:600c:c84:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490b0e9f45cmr63144845e9.14.1780411712899;
        Tue, 02 Jun 2026 07:48:32 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e88fdesm74881395e9.14.2026.06.02.07.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:48:32 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
Date: Tue,  2 Jun 2026 16:42:44 +0200
Message-ID: <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1780409151.git.gregoire.layet@9elements.com>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_074835_309919_C5FE9100 
X-CRM114-Status: GOOD (  24.49  )
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

Taken from ASPEED 6.18 Kernel SDK

Add support for PCIe communication BMC<->host.
This add Host side driver.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Signed-off-by: aspeedyh <yh_chung@aspeedtech.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
Tested-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/soc/aspeed/Kconfig               |  13 +
 drivers/soc/aspeed/Makefile              |   1 +
 drivers/soc/aspeed/aspeed-host-bmc-dev.c | 664 +++++++++++++++++++++++
 3 files changed, 678 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 341728df07b3..e8670dfef1e6 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -13,6 +13,19 @@ config ASPEED_BMC_DEV
 	  providing a shared-memory BAR, host-to-BMC and BMC-to-host
 	  message queues with doorbell interrupts and PCIe-to-LPC bridge.
 
+config ASPEED_HOST_BMC_DEV
+	tristate "ASPEED Host BMC Device"
+	depends on PCI
+	depends on SERIAL_8250
+	help
+	  Enable support for the ASPEED AST2600/AST2700 BMC Device on the Host.
+	  This configure the PCIe and setup:
+	  - Two 8250 compatible VUART ports.
+	  - A character device exposing the BMC's shared memory
+	    region for host<->BMC data exchange.
+	  - A mailbox interrupt path and BMC message queue handler for
+		doorbell-style host<->BMC signaling.
+
 config ASPEED_LPC_CTRL
 	tristate "ASPEED LPC firmware cycle control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fab0d247df66..3fd3f6d8d36e 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ASPEED_BMC_DEV)		+= aspeed-bmc-dev.o
+obj-$(CONFIG_ASPEED_HOST_BMC_DEV)	+= aspeed-host-bmc-dev.o
 obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
diff --git a/drivers/soc/aspeed/aspeed-host-bmc-dev.c b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
new file mode 100644
index 000000000000..9e6f1d39f18a
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-host-bmc-dev.c
@@ -0,0 +1,664 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright (C) ASPEED Technology Inc.
+
+#include <linux/init.h>
+#include <linux/version.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/pci.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/serial_core.h>
+#include <linux/serial_8250.h>
+#include <linux/poll.h>
+#include <linux/bitfield.h>
+
+#include <linux/if_arp.h>
+#include <linux/skbuff.h>
+#include <linux/mctp.h>
+#include <net/mctp.h>
+#include <net/pkt_sched.h>
+
+#define PCI_BMC_HOST2BMC_Q1 0x30000
+#define PCI_BMC_HOST2BMC_Q2 0x30010
+#define PCI_BMC_BMC2HOST_Q1 0x30020
+#define PCI_BMC_BMC2HOST_Q2 0x30030
+#define PCI_BMC_BMC2HOST_STS 0x30040
+#define BMC2HOST_INT_STS_DOORBELL BIT(31)
+#define BMC2HOST_ENABLE_INTB BIT(30)
+
+#define BMC2HOST_Q1_FULL BIT(27)
+#define BMC2HOST_Q1_EMPTY BIT(26)
+#define BMC2HOST_Q2_FULL BIT(25)
+#define BMC2HOST_Q2_EMPTY BIT(24)
+#define BMC2HOST_Q1_FULL_UNMASK BIT(23)
+#define BMC2HOST_Q1_EMPTY_UNMASK BIT(22)
+#define BMC2HOST_Q2_FULL_UNMASK BIT(21)
+#define BMC2HOST_Q2_EMPTY_UNMASK BIT(20)
+
+#define PCI_BMC_HOST2BMC_STS 0x30044
+#define HOST2BMC_INT_STS_DOORBELL BIT(31)
+#define HOST2BMC_ENABLE_INTB BIT(30)
+
+#define HOST2BMC_Q1_FULL BIT(27)
+#define HOST2BMC_Q1_EMPTY BIT(26)
+#define HOST2BMC_Q2_FULL BIT(25)
+#define HOST2BMC_Q2_EMPTY BIT(24)
+#define HOST2BMC_Q1_FULL_UNMASK BIT(23)
+#define HOST2BMC_Q1_EMPTY_UNMASK BIT(22)
+#define HOST2BMC_Q2_FULL_UNMASK BIT(21)
+#define HOST2BMC_Q2_EMPTY_UNMASK BIT(20)
+
+static DEFINE_IDA(bmc_device_ida);
+
+#define VUART_MAX_PARMS 2
+#define ASPEED_QUEUE_NUM 2
+#define MAX_MSI_NUM 8
+
+enum aspeed_platform_id {
+	ASPEED,
+};
+
+enum queue_index {
+	QUEUE1 = 0,
+	QUEUE2,
+};
+
+enum msi_index {
+	BMC_MSI,
+	MBX_MSI,
+	VUART0_MSI,
+	VUART1_MSI,
+};
+
+/* Match msi_index */
+static int ast2600_msi_idx_table[MAX_MSI_NUM] = { 4, 21, 16, 15 };
+static int ast2700_soc0_msi_idx_table[MAX_MSI_NUM] = { 0, 11, 6, 5 };
+
+struct aspeed_platform {
+	int (*setup)(struct pci_dev *pdev);
+};
+
+struct aspeed_queue_message {
+	/* Queue waiters for idle engine */
+	wait_queue_head_t tx_wait;
+	wait_queue_head_t rx_wait;
+	struct kernfs_node *kn;
+	struct bin_attribute bin;
+	int index;
+	struct aspeed_pci_bmc_dev *pci_bmc_device;
+};
+
+struct aspeed_pci_bmc_dev {
+	struct device *dev;
+	struct miscdevice miscdev;
+	struct aspeed_platform *platform;
+	kernel_ulong_t driver_data;
+	int id;
+
+	unsigned long mem_bar_base;
+	unsigned long mem_bar_size;
+	void __iomem *mem_bar_reg;
+
+	unsigned long message_bar_base;
+	unsigned long message_bar_size;
+	void __iomem *msg_bar_reg;
+
+	void __iomem *pcie_sio_decode_addr;
+
+	struct aspeed_queue_message queue[ASPEED_QUEUE_NUM];
+
+	void __iomem *sio_mbox_reg;
+	struct uart_8250_port uart[VUART_MAX_PARMS];
+	int uart_line[VUART_MAX_PARMS];
+
+	/* Interrupt
+	 * The index of array is using to enum msi_index
+	 */
+	int *msi_idx_table;
+};
+
+#define PCIE_DEVICE_SIO_ADDR (0x2E * 4)
+#define BMC_MULTI_MSI 32
+
+#define DRIVER_NAME "aspeed-host-bmc-dev"
+
+static struct aspeed_pci_bmc_dev *file_aspeed_bmc_device(struct file *file)
+{
+	return container_of(file->private_data, struct aspeed_pci_bmc_dev,
+			    miscdev);
+}
+
+static int aspeed_pci_bmc_dev_mmap(struct file *file,
+				   struct vm_area_struct *vma)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = file_aspeed_bmc_device(file);
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	pgprot_t prot = vma->vm_page_prot;
+
+	if (vma->vm_pgoff + vsize > pci_bmc_dev->mem_bar_base + 0x100000)
+		return -EINVAL;
+
+	prot = pgprot_noncached(prot);
+
+	if (remap_pfn_range(vma, vma->vm_start,
+			    (pci_bmc_dev->mem_bar_base >> PAGE_SHIFT) +
+				    vma->vm_pgoff,
+			    vsize, prot))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static const struct file_operations aspeed_pci_bmc_dev_fops = {
+	.owner = THIS_MODULE,
+	.mmap = aspeed_pci_bmc_dev_mmap,
+};
+
+static ssize_t aspeed_queue_rx(struct file *filp, struct kobject *kobj,
+			       const struct bin_attribute *attr, char *buf,
+			       loff_t off, size_t count)
+{
+	struct aspeed_queue_message *queue = attr->private;
+	struct aspeed_pci_bmc_dev *pci_bmc_device = queue->pci_bmc_device;
+	int index = queue->index;
+	u32 *data = (u32 *)buf;
+	int ret;
+
+	ret = wait_event_interruptible(
+		queue->rx_wait,
+		!(readl(pci_bmc_device->msg_bar_reg + PCI_BMC_BMC2HOST_STS) &
+		  ((index == QUEUE1) ? BMC2HOST_Q1_EMPTY : BMC2HOST_Q2_EMPTY)));
+	if (ret)
+		return -EINTR;
+
+	data[0] = readl(pci_bmc_device->msg_bar_reg +
+			((index == QUEUE1) ? PCI_BMC_BMC2HOST_Q1 :
+					     PCI_BMC_BMC2HOST_Q2));
+
+	writel(HOST2BMC_INT_STS_DOORBELL | HOST2BMC_ENABLE_INTB,
+	       pci_bmc_device->msg_bar_reg + PCI_BMC_HOST2BMC_STS);
+
+	return sizeof(u32);
+}
+
+static ssize_t aspeed_queue_tx(struct file *filp, struct kobject *kobj,
+			       const struct bin_attribute *attr, char *buf,
+			       loff_t off, size_t count)
+{
+	struct aspeed_queue_message *queue = attr->private;
+	struct aspeed_pci_bmc_dev *pci_bmc_device = queue->pci_bmc_device;
+	int index = queue->index;
+	u32 tx_buff;
+	int ret;
+
+	if (count != sizeof(u32))
+		return -EINVAL;
+
+	ret = wait_event_interruptible(
+		queue->tx_wait,
+		!(readl(pci_bmc_device->msg_bar_reg + PCI_BMC_HOST2BMC_STS) &
+		  ((index == QUEUE1) ? HOST2BMC_Q1_FULL : HOST2BMC_Q2_FULL)));
+	if (ret)
+		return -EINTR;
+
+	memcpy(&tx_buff, buf, 4);
+	writel(tx_buff, pci_bmc_device->msg_bar_reg +
+				((index == QUEUE1) ? PCI_BMC_HOST2BMC_Q1 :
+						     PCI_BMC_HOST2BMC_Q2));
+	//trigger to host
+	writel(HOST2BMC_INT_STS_DOORBELL | HOST2BMC_ENABLE_INTB,
+	       pci_bmc_device->msg_bar_reg + PCI_BMC_HOST2BMC_STS);
+
+	return sizeof(u32);
+}
+
+static irqreturn_t aspeed_pci_host_bmc_device_interrupt(int irq, void *dev_id)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_device = dev_id;
+	u32 bmc2host_q_sts =
+		readl(pci_bmc_device->msg_bar_reg + PCI_BMC_BMC2HOST_STS);
+
+	if (bmc2host_q_sts & BMC2HOST_INT_STS_DOORBELL)
+		writel(BMC2HOST_INT_STS_DOORBELL,
+		       pci_bmc_device->msg_bar_reg + PCI_BMC_BMC2HOST_STS);
+
+	if (bmc2host_q_sts & BMC2HOST_ENABLE_INTB)
+		writel(BMC2HOST_ENABLE_INTB,
+		       pci_bmc_device->msg_bar_reg + PCI_BMC_BMC2HOST_STS);
+
+	if (bmc2host_q_sts & BMC2HOST_Q1_FULL)
+		dev_info(pci_bmc_device->dev, "Q1 Full\n");
+
+	if (bmc2host_q_sts & BMC2HOST_Q2_FULL)
+		dev_info(pci_bmc_device->dev, "Q2 Full\n");
+
+	//check q1
+	if (!(readl(pci_bmc_device->msg_bar_reg + PCI_BMC_HOST2BMC_STS) &
+	      HOST2BMC_Q1_FULL))
+		wake_up_interruptible(&pci_bmc_device->queue[QUEUE1].tx_wait);
+
+	if (!(readl(pci_bmc_device->msg_bar_reg + PCI_BMC_BMC2HOST_STS) &
+	      BMC2HOST_Q1_EMPTY))
+		wake_up_interruptible(&pci_bmc_device->queue[QUEUE1].rx_wait);
+	//chech q2
+	if (!(readl(pci_bmc_device->msg_bar_reg + PCI_BMC_HOST2BMC_STS) &
+	      HOST2BMC_Q2_FULL))
+		wake_up_interruptible(&pci_bmc_device->queue[QUEUE2].tx_wait);
+
+	if (!(readl(pci_bmc_device->msg_bar_reg + PCI_BMC_BMC2HOST_STS) &
+	      BMC2HOST_Q2_EMPTY))
+		wake_up_interruptible(&pci_bmc_device->queue[QUEUE2].rx_wait);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t aspeed_pci_host_mbox_interrupt(int irq, void *dev_id)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_device = dev_id;
+	u32 isr = readl(pci_bmc_device->sio_mbox_reg + 0x94);
+
+	if (isr & BIT(7))
+		writel(BIT(7), pci_bmc_device->sio_mbox_reg + 0x94);
+
+	return IRQ_HANDLED;
+}
+
+static void aspeed_pci_setup_irq_resource(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	/* Assign static msi index table by platform */
+	if (pdev->revision == 0x27) {
+		pci_bmc_dev->msi_idx_table = ast2700_soc0_msi_idx_table;
+	} else {
+		pci_bmc_dev->msi_idx_table = ast2600_msi_idx_table;
+	}
+
+	if (pci_alloc_irq_vectors(pdev, 1, BMC_MULTI_MSI,
+				  PCI_IRQ_INTX | PCI_IRQ_MSI) <= 1)
+		/* Set all msi index to the first vector */
+		memset(pci_bmc_dev->msi_idx_table, 0,
+		       sizeof(int) * MAX_MSI_NUM);
+}
+
+static int aspeed_pci_bmc_device_setup_queue(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_device = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	for (i = 0; i < ASPEED_QUEUE_NUM; i++) {
+		struct aspeed_queue_message *queue = &pci_bmc_device->queue[i];
+
+		init_waitqueue_head(&queue->tx_wait);
+		init_waitqueue_head(&queue->rx_wait);
+
+		sysfs_bin_attr_init(&queue->bin);
+
+		/* Queue name index starts from 1 */
+		queue->bin.attr.name = devm_kasprintf(
+			dev, GFP_KERNEL, "pci-bmc-dev-queue%d", (i + 1));
+		queue->bin.attr.mode = 0600;
+		queue->bin.read = aspeed_queue_rx;
+		queue->bin.write = aspeed_queue_tx;
+		queue->bin.size = 4;
+		queue->bin.private = queue;
+
+		ret = sysfs_create_bin_file(&pdev->dev.kobj, &queue->bin);
+		if (ret) {
+			dev_err(dev, "error for bin%d file\n", i);
+			return ret;
+		}
+
+		queue->kn =
+			kernfs_find_and_get(dev->kobj.sd, queue->bin.attr.name);
+		if (!queue->kn) {
+			sysfs_remove_bin_file(&dev->kobj, &queue->bin);
+			return ret;
+		}
+
+		queue->index = i;
+		queue->pci_bmc_device = pci_bmc_device;
+	}
+
+	return 0;
+}
+
+static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	u16 vuart_ioport;
+	int ret, i;
+
+	for (i = 0; i < VUART_MAX_PARMS; i++) {
+		/* Assign the line to non-exist device */
+		pci_bmc_dev->uart_line[i] = -ENOENT;
+		vuart_ioport = 0x3F8 - (i * 0x100);
+		pci_bmc_dev->uart[i].port.flags =
+			UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
+		pci_bmc_dev->uart[i].port.uartclk = 115200 * 16;
+		pci_bmc_dev->uart[i].port.irq = pci_irq_vector(
+			pdev, pci_bmc_dev->msi_idx_table[VUART0_MSI + i]);
+		pci_bmc_dev->uart[i].port.dev = dev;
+		pci_bmc_dev->uart[i].port.iotype = UPIO_MEM32;
+		pci_bmc_dev->uart[i].port.iobase = 0;
+		pci_bmc_dev->uart[i].port.mapbase =
+			pci_bmc_dev->message_bar_base + (vuart_ioport << 2);
+		pci_bmc_dev->uart[i].port.membase = 0;
+		pci_bmc_dev->uart[i].port.type = PORT_16550A;
+		pci_bmc_dev->uart[i].port.flags |=
+			(UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
+		pci_bmc_dev->uart[i].port.regshift = 2;
+		ret = serial8250_register_8250_port(&pci_bmc_dev->uart[i]);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Can't setup PCIe VUART\n");
+			return ret;
+		}
+		pci_bmc_dev->uart_line[i] = ret;
+	}
+	return 0;
+}
+
+static int aspeed_pci_bmc_device_setup_memory_mapping(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	pci_bmc_dev->miscdev.minor = MISC_DYNAMIC_MINOR;
+	pci_bmc_dev->miscdev.name = devm_kasprintf(
+		dev, GFP_KERNEL, "%s%d", DRIVER_NAME, pci_bmc_dev->id);
+	pci_bmc_dev->miscdev.fops = &aspeed_pci_bmc_dev_fops;
+	pci_bmc_dev->miscdev.parent = dev;
+
+	ret = misc_register(&pci_bmc_dev->miscdev);
+	if (ret) {
+		pr_err("host bmc register fail %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aspeed_pci_bmc_device_setup_mbox(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	/* setup mbox */
+	pci_bmc_dev->pcie_sio_decode_addr =
+		pci_bmc_dev->msg_bar_reg + PCIE_DEVICE_SIO_ADDR;
+	writel(0xaa, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0xa5, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0xa5, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0x07, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0x0e, pci_bmc_dev->pcie_sio_decode_addr + 0x04);
+	/* disable */
+	writel(0x30, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0x00, pci_bmc_dev->pcie_sio_decode_addr + 0x04);
+	/* set decode address 0x100 */
+	writel(0x60, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0x01, pci_bmc_dev->pcie_sio_decode_addr + 0x04);
+	writel(0x61, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0x00, pci_bmc_dev->pcie_sio_decode_addr + 0x04);
+	/* enable */
+	writel(0x30, pci_bmc_dev->pcie_sio_decode_addr);
+	writel(0x01, pci_bmc_dev->pcie_sio_decode_addr + 0x04);
+	pci_bmc_dev->sio_mbox_reg = pci_bmc_dev->msg_bar_reg + 0x400;
+
+	ret = devm_request_irq(
+		dev, pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[MBX_MSI]),
+		aspeed_pci_host_mbox_interrupt, IRQF_SHARED,
+		devm_kasprintf(dev, GFP_KERNEL, "aspeed-sio-mbox%d",
+			       pci_bmc_dev->id),
+		pci_bmc_dev);
+	if (ret) {
+		pr_err("host bmc device Unable to get IRQ %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void aspeed_pci_host_bmc_device_release_queue(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < ASPEED_QUEUE_NUM; i++)
+		sysfs_remove_bin_file(&pdev->dev.kobj,
+				      &pci_bmc_dev->queue[i].bin);
+}
+
+static void aspeed_pci_host_bmc_device_release_vuart(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < VUART_MAX_PARMS; i++) {
+		if (pci_bmc_dev->uart_line[i] >= 0)
+			serial8250_unregister_port(pci_bmc_dev->uart_line[i]);
+	}
+}
+
+static void
+aspeed_pci_host_bmc_device_release_memory_mapping(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	if (!list_empty(&pci_bmc_dev->miscdev.list))
+		misc_deregister(&pci_bmc_dev->miscdev);
+}
+
+static int aspeed_pci_host_setup(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+	int rc = 0;
+
+	/* Get share memory BAR */
+	pci_bmc_dev->mem_bar_base = pci_resource_start(pdev, 0);
+	pci_bmc_dev->mem_bar_size = pci_resource_len(pdev, 0);
+	pci_bmc_dev->mem_bar_reg = pci_ioremap_bar(pdev, 0);
+	if (!pci_bmc_dev->mem_bar_reg)
+		return -ENOMEM;
+
+	/* Get Message BAR */
+	pci_bmc_dev->message_bar_base = pci_resource_start(pdev, 1);
+	pci_bmc_dev->message_bar_size = pci_resource_len(pdev, 1);
+	pci_bmc_dev->msg_bar_reg = pci_ioremap_bar(pdev, 1);
+	if (!pci_bmc_dev->msg_bar_reg) {
+		rc = -ENOMEM;
+		goto out_free0;
+	}
+
+	/* AST2600 ERRTA40: dummy read */
+	if (pdev->revision < 0x27)
+		(void)__raw_readl((void __iomem *)pci_bmc_dev->msg_bar_reg);
+
+	rc = aspeed_pci_bmc_device_setup_queue(pdev);
+	if (rc) {
+		pr_err("Cannot setup Queue Message");
+		goto out_free1;
+	}
+
+	rc = aspeed_pci_bmc_device_setup_memory_mapping(pdev);
+	if (rc) {
+		pr_err("Cannot setup Memory Mapping");
+		goto out_free_queue;
+	}
+
+	rc = aspeed_pci_bmc_device_setup_mbox(pdev);
+	if (rc) {
+		pr_err("Cannot setup Mailnbox");
+		goto out_free_mmapping;
+	}
+
+	rc = aspeed_pci_bmc_device_setup_vuart(pdev);
+	if (rc) {
+		pr_err("Cannot setup Virtual UART");
+		goto out_free_mbox;
+	}
+
+	rc = devm_request_irq(
+		&pdev->dev,
+		pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[BMC_MSI]),
+		aspeed_pci_host_bmc_device_interrupt, IRQF_SHARED,
+		pci_bmc_dev->miscdev.name, pci_bmc_dev);
+	if (rc) {
+		pr_err("Get BMC DEVICE IRQ failed. (err=%d)\n", rc);
+		goto out_free_uart;
+	}
+
+	return 0;
+
+out_free_uart:
+	aspeed_pci_host_bmc_device_release_vuart(pdev);
+out_free_mbox:
+	devm_free_irq(&pdev->dev,
+		      pci_irq_vector(pdev, pci_bmc_dev->msi_idx_table[MBX_MSI]),
+		      pci_bmc_dev);
+out_free_mmapping:
+	aspeed_pci_host_bmc_device_release_memory_mapping(pdev);
+out_free_queue:
+	aspeed_pci_host_bmc_device_release_queue(pdev);
+out_free1:
+	pci_iounmap(pdev, pci_bmc_dev->msg_bar_reg);
+out_free0:
+	pci_iounmap(pdev, pci_bmc_dev->mem_bar_reg);
+
+	pci_release_regions(pdev);
+	return rc;
+}
+
+static struct aspeed_platform aspeed_pcie_host[] = {
+	{ .setup = aspeed_pci_host_setup },
+	{ 0 }
+};
+
+static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
+					    const struct pci_device_id *ent)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev;
+	int rc = 0;
+
+	pr_info("ASPEED BMC PCI ID %04x:%04x, IRQ=%u\n", pdev->vendor,
+		pdev->device, pdev->irq);
+
+	pci_bmc_dev =
+		devm_kzalloc(&pdev->dev, sizeof(*pci_bmc_dev), GFP_KERNEL);
+	if (!pci_bmc_dev)
+		return -ENOMEM;
+
+	/* Get platform id */
+	pci_bmc_dev->driver_data = ent->driver_data;
+	pci_bmc_dev->platform = &aspeed_pcie_host[ent->driver_data];
+
+	pci_bmc_dev->id = ida_alloc(&bmc_device_ida, GFP_KERNEL);
+	if (pci_bmc_dev->id < 0)
+		return pci_bmc_dev->id;
+
+	rc = pci_enable_device(pdev);
+	if (rc) {
+		dev_err(&pdev->dev, "pci_enable_device() returned error %d\n",
+			rc);
+		return rc;
+	}
+
+	pci_set_master(pdev);
+	pci_set_drvdata(pdev, pci_bmc_dev);
+
+	/* Prepare IRQ resource */
+	aspeed_pci_setup_irq_resource(pdev);
+
+	/* Setup BMC PCI device */
+	rc = pci_bmc_dev->platform->setup(pdev);
+	if (rc) {
+		dev_err(&pdev->dev,
+			"ASPEED PCIe Host device returned error %d\n", rc);
+		pci_free_irq_vectors(pdev);
+		pci_disable_device(pdev);
+		return rc;
+	}
+
+	return 0;
+}
+
+static void aspeed_pci_host_bmc_device_remove(struct pci_dev *pdev)
+{
+	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
+
+	if (pci_bmc_dev->driver_data == ASPEED) {
+		aspeed_pci_host_bmc_device_release_queue(pdev);
+		aspeed_pci_host_bmc_device_release_memory_mapping(pdev);
+		aspeed_pci_host_bmc_device_release_vuart(pdev);
+
+		devm_free_irq(
+			&pdev->dev,
+			pci_irq_vector(pdev,
+				       pci_bmc_dev->msi_idx_table[BMC_MSI]),
+			pci_bmc_dev);
+		devm_free_irq(
+			&pdev->dev,
+			pci_irq_vector(pdev,
+				       pci_bmc_dev->msi_idx_table[MBX_MSI]),
+			pci_bmc_dev);
+	}
+
+	ida_free(&bmc_device_ida, pci_bmc_dev->id);
+
+	pci_iounmap(pdev, pci_bmc_dev->msg_bar_reg);
+	pci_iounmap(pdev, pci_bmc_dev->mem_bar_reg);
+
+	pci_free_irq_vectors(pdev);
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
+}
+
+/**
+ * This table holds the list of (VendorID,DeviceID) supported by this driver
+ *
+ */
+static struct pci_device_id aspeed_host_bmc_dev_pci_ids[] = {
+	/* ASPEED BMC Device */
+	{ PCI_DEVICE(0x1A03, 0x2402), .class = 0xFF0000, .class_mask = 0xFFFF00,
+	  .driver_data = ASPEED },
+	{
+		0,
+	}
+};
+
+MODULE_DEVICE_TABLE(pci, aspeed_host_bmc_dev_pci_ids);
+
+static struct pci_driver aspeed_host_bmc_dev_driver = {
+	.name = DRIVER_NAME,
+	.id_table = aspeed_host_bmc_dev_pci_ids,
+	.probe = aspeed_pci_host_bmc_device_probe,
+	.remove = aspeed_pci_host_bmc_device_remove,
+};
+
+static int __init aspeed_host_bmc_device_init(void)
+{
+	return pci_register_driver(&aspeed_host_bmc_dev_driver);
+}
+
+static void aspeed_host_bmc_device_exit(void)
+{
+	/* unregister pci driver */
+	pci_unregister_driver(&aspeed_host_bmc_dev_driver);
+}
+
+late_initcall(aspeed_host_bmc_device_init);
+module_exit(aspeed_host_bmc_device_exit);
+
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED Host BMC DEVICE Driver");
+MODULE_LICENSE("GPL");
\ No newline at end of file
-- 
2.51.2


