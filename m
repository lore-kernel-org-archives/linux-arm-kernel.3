Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54F4C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCb0z5xqaaAdwJPK3SuzqFe1KNqErWNzN+I5fVOkGlc=; b=l4OjZgPiMUvWkNu7z2Y3mjKcQx
	xUWUR95vhx6A0l7Iqasjp9icKHMdrifDuYX2tzAuEICUn5yjlqOLD/co+9syGrzy/GbECNxFyFr1a
	34w6cfpljlBxa9eGkKz/hSro0Zn8iufwv+3+pIuoxq2jEuhBrW1V6XKZZPCGb8+QF2pxOzsiX875h
	xpLBdM1W8FclxW9AnYd3J3pCtbCZ5UBR2WtoRlHo1j8qCqBn9vF+nLlvfQ+T1xowJ79wJ1oT5F9YS
	ypYicrCzGk23WA5pPKDPsTB2qRLC9Ne5v7zoS8Hah0bi5ZaNjlNlEr1HU7P1AsUnbTscct5LVKm0b
	5gwiZYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJHXy-00000007bsz-118b;
	Sun, 25 May 2025 20:02:14 +0000
Received: from 18.mo581.mail-out.ovh.net ([188.165.56.163])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJHVr-00000007bej-32FZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 20:00:05 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.14])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4b58rH2Q2Sz1Qh5
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 19:59:59 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-rkhfw (unknown [10.111.174.16])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5C61410022A;
	Sun, 25 May 2025 19:59:58 +0000 (UTC)
Received: from m-works.net ([37.59.142.111])
	by ghost-submission-5b5ff79f4f-rkhfw with ESMTPSA
	id 0m0tCL52M2jm2AIAmH6SxQ
	(envelope-from <maciej.andrzejewski@m-works.net>); Sun, 25 May 2025 19:59:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-111S0053e591385-ad35-48be-9c25-d36640ecf727,
                    541B4E8188618F4BBD52FD3E2510040D9AEB4DAF) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 80.238.108.7
Date: Sun, 25 May 2025 21:59:57 +0200
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, maciej.andrzejewski@m-works.net,
	maciej.andrzejewski@iceye.com
Cc: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>,
	Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
Subject: [PATCH 1/2] Driver for Xilinx ZynqMP AXI Timeout Block (ATB)
Message-ID: <20250525195955.2843076-1-maciej.andrzejewski@m-works.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0
X-Ovh-Tracer-Id: 8556557820375964574
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheehudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtgguofesthdtredtredtvdenucfhrhhomhepofgrtghivghjucetnhgurhiivghjvgifshhkihcuoehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtqeenucggtffrrghtthgvrhhnpedtvddtveegfeffkeeiieefhefgveeggeffhefggfffhfeijeegjeekudeltdfhkeenucfkphepuddvjedrtddrtddruddpkedtrddvfeekrddutdekrdejpdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_130004_070069_3343D32C 
X-CRM114-Status: GOOD (  33.67  )
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

This module implements a driver for the Xilinx AXI Timeout Block (ATB).
The ATB is used to detect and handle timeouts on AXI transactions.
It supports configuration and handling of timeout interrupts for both
the Full Power Domain (FPD) and Low Power Domain (LPD) in Xilinx SoCs.
The driver reads configuration from the device tree, sets up the necessary
registers, and handles interrupts to report timeout events.

AXI timeouts can be harmful as they stall the bus and can potentially stall
the entire Linux system. Due to hardware limitations, this driver cannot
completely prevent bus stalls; only a limited number of AXI timeouts can be
registered before the bus will eventually stall.

It is important to note that this driver should produce dmesg error output
(grep for "atb: Timeout detected") to notify the user that the system
configuration is not properly handled. Once an AXI timeout is detected,
additional measures should be taken to address the issue.

To make this driver work, the device tree must contain the following
properties:

	atb {
		compatible = "xlnx,zynqmp-atb";
		status = "okay";

		fpd_afifs1_enable;
		fpd_afifs0_enable;
		fpd_fpds_enable;
		lpd_afifs2_enable;
		lpd_lpdm_enable;
	};

The bool properties enable the corresponding interrupts for the
FPD and LPD.
The driver will read these properties and configure the ATB accordingly.
If the bool property is not present, the functionality for this ATB will be
disabled.

Enable this driver by selecting ZYNQMP_ATB in the kernel config.

Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
---
 MAINTAINERS                     |   6 +
 drivers/soc/xilinx/Kconfig      |  53 ++--
 drivers/soc/xilinx/Makefile     |   1 +
 drivers/soc/xilinx/zynqmp_atb.c | 417 ++++++++++++++++++++++++++++++++
 4 files changed, 457 insertions(+), 20 deletions(-)
 create mode 100644 drivers/soc/xilinx/zynqmp_atb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c6f9e70ace0..37cd15a59d83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26734,6 +26734,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.yaml
 F:	drivers/nvmem/zynqmp_nvmem.c
 
+XILINX ZYNQMP ATB DRIVER
+M:	Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.txt
+F:	drivers/soc/xilinx/zynqmp_atb.c
+
 XILLYBUS DRIVER
 M:	Eli Billauer <eli.billauer@gmail.com>
 L:	linux-kernel@vger.kernel.org
diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
index 49d69d6e18fe..b2b1187c70ec 100644
--- a/drivers/soc/xilinx/Kconfig
+++ b/drivers/soc/xilinx/Kconfig
@@ -2,28 +2,41 @@
 menu "Xilinx SoC drivers"
 
 config ZYNQMP_POWER
-	bool "Enable Xilinx Zynq MPSoC Power Management driver"
-	depends on PM && ZYNQMP_FIRMWARE
-	default y
-	select MAILBOX
-	select ZYNQMP_IPI_MBOX
-	help
-	  Say yes to enable power management support for ZyqnMP SoC.
-	  This driver uses firmware driver as an interface for power
-	  management request to firmware. It registers isr to handle
-	  power management callbacks from firmware. It registers mailbox client
-	  to handle power management callbacks from firmware.
+    bool "Enable Xilinx Zynq MPSoC Power Management driver"
+    depends on PM && ZYNQMP_FIRMWARE
+    default y
+    select MAILBOX
+    select ZYNQMP_IPI_MBOX
+    help
+      Say yes to enable power management support for ZyqnMP SoC.
+      This driver uses firmware driver as an interface for power
+      management request to firmware. It registers isr to handle
+      power management callbacks from firmware. It registers mailbox client
+      to handle power management callbacks from firmware.
 
-	  If in doubt, say N.
+      If in doubt, say N.
 
 config XLNX_EVENT_MANAGER
-	bool "Enable Xilinx Event Management Driver"
-	depends on ZYNQMP_FIRMWARE
-	default ZYNQMP_FIRMWARE
-	help
-	  Say yes to enable event management support for Xilinx.
-	  This driver uses firmware driver as an interface for event/power
-	  management request to firmware.
+    bool "Enable Xilinx Event Management Driver"
+    depends on ZYNQMP_FIRMWARE
+    default ZYNQMP_FIRMWARE
+    help
+      Say yes to enable event management support for Xilinx.
+      This driver uses firmware driver as an interface for event/power
+      management request to firmware.
+
+      If in doubt, say N.
+
+config ZYNQMP_ATB
+    bool "Enable ZynqMP AXI Timeout Block driver"
+    depends on ARCH_ZYNQMP
+    help
+      Say yes to enable ZynqMP AXI Timeout Block driver.
+      The ATB is used to detect and handle timeouts on AXI transactions.
+      It supports configuration and handling of timeout interrupts for both
+      the Full Power Domain (FPD) and Low Power Domain (LPD) in
+      Xilinx SoCs. The driver reads configuration from the device tree,
+      sets up the necessary registers, and handles interrupts to report
+      timeout events.
 
-	  If in doubt, say N.
 endmenu
diff --git a/drivers/soc/xilinx/Makefile b/drivers/soc/xilinx/Makefile
index 33d94395fd87..30768593701e 100644
--- a/drivers/soc/xilinx/Makefile
+++ b/drivers/soc/xilinx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ZYNQMP_POWER)	+= zynqmp_power.o
 obj-$(CONFIG_XLNX_EVENT_MANAGER)	+= xlnx_event_manager.o
+obj-$(CONFIG_ZYNQMP_ATB) += zynqmp_atb.o
\ No newline at end of file
diff --git a/drivers/soc/xilinx/zynqmp_atb.c b/drivers/soc/xilinx/zynqmp_atb.c
new file mode 100644
index 000000000000..41e942352b38
--- /dev/null
+++ b/drivers/soc/xilinx/zynqmp_atb.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/**
+ * Implementation of Xilinx ZynqMP AXI Timeout Block peripheral driver.
+ *
+ * Copyright (C) 2025 ICEYE,
+ * Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/printk.h>
+
+// ATB register base for FPD and LTB
+#define FPD_SLCR_ATB_BASE_ADDR 0x00FD616000
+#define LPD_SLCR_ATB_BASE_ADDR 0x00FF416000
+
+// ATB register offsets
+#define ERR_ATB_ISR_REG 0x00
+#define ERR_ATB_IMR_REG 0x04
+#define ERR_ATB_IER_REG 0x08
+#define ERR_ATB_IDR_REG 0x0C
+#define ATB_CMD_STORE_EN_REG 0x10
+#define ATB_RESP_EN_REG 0x14
+#define ATB_RESP_TYPE_REG 0x18
+#define ATB_PRESCALE_REG 0x20
+
+#define ATB_PRESCALER_EN_MASK 0x10000
+#define ATB_PRESCALER_TIMEOUT_VAL 0x100
+
+// ATB interrupt masks
+#define LPD_ATB_LPDM_MASK 0x1
+
+#define LPD_ATB_AFIFS2_MASK 0x2
+#define FPD_ATB_FPDS_MASK 0x1
+#define FPD_ATB_AFIFS0_MASK 0x2
+#define FPD_ATB_AFIFS1_MASK 0x4
+
+// IRQ numbers
+#define IRQ_PLATFORM_SPECIFIC_OFFSET 32
+#define IRQ_ZYNQMP_GIC_ATB_FPD (153 - IRQ_PLATFORM_SPECIFIC_OFFSET)
+#define IRQ_ZYNQMP_GIC_ATB_LPD (86 - IRQ_PLATFORM_SPECIFIC_OFFSET)
+
+#define MOD_NAME "atb"
+
+/**
+ * atb_domain_config - ATB domain configuration structure
+ * @base: SLCR base address mapping
+ * @opt_val: Holds bit mask for ATB instance selection
+ * @irq: Mapped IRQ number
+ * @init: ATB domain has been initialized
+ */
+struct atb_domain_config {
+	void __iomem *base;
+
+	u32 opt_val;
+	int irq;
+	bool init;
+};
+
+/**
+ * atb_config - ATB all domains configuration structure
+ * @fpd: FPD domain configuration
+ * @lpd: LPD domain configuration
+ */
+struct atb_config {
+	struct atb_domain_config fpd;
+	struct atb_domain_config lpd;
+};
+
+/**
+ * atb_read - Read from ATB register
+ * @cfg: Pointer to ATB domain configuration
+ * @addr: Register offset
+ * @return: Read value
+ */
+static inline u32 atb_read(struct atb_domain_config *cfg, uintptr_t addr)
+{
+	return readl(cfg->base + addr);
+}
+
+/**
+ * atb_write - Write to ATB register
+ * @cfg: Pointer to ATB domain configuration
+ * @value: Value to write
+ * @addr: Register offset
+ */
+static inline void atb_write(struct atb_domain_config *cfg, u32 value,
+			     uintptr_t addr)
+{
+	writel(value, cfg->base + addr);
+}
+
+/**
+ * irq_handler - IRQ handler for ATB timeouts
+ * @irq: IRQ number. Must be one of IRQ_ZYNQMP_GIC_ATB_FPD or
+ * IRQ_ZYNQMP_GIC_ATB_LPD
+ * @data: Pointer to platform device
+ */
+static irqreturn_t irq_handler(int irq, void *data)
+{
+	irqreturn_t ret = IRQ_NONE;
+	u32 val;
+	struct atb_config *config;
+
+	config = platform_get_drvdata((struct platform_device *)data);
+	if (!config) {
+		printk_deferred(KERN_ERR "%s: config is NULL in %s\n", MOD_NAME,
+				__func__);
+		return IRQ_NONE;
+	}
+
+	if (irq == config->fpd.irq && config->fpd.init) {
+		val = atb_read(&config->fpd, ERR_ATB_ISR_REG);
+
+		if (val & FPD_ATB_FPDS_MASK) {
+			atb_write(&config->fpd, FPD_ATB_FPDS_MASK,
+				  ERR_ATB_ISR_REG);
+			ret = IRQ_HANDLED;
+			printk_deferred(KERN_ERR
+					"%s: Timeout detected on ATB FPD: FPDS\n",
+					MOD_NAME);
+		}
+		if (val & FPD_ATB_AFIFS0_MASK) {
+			atb_write(&config->fpd, FPD_ATB_AFIFS0_MASK,
+				  ERR_ATB_ISR_REG);
+			ret = IRQ_HANDLED;
+			printk_deferred(
+				KERN_ERR
+				"%s: Timeout detected on ATB FPD: AFIFS0\n",
+				MOD_NAME);
+		}
+		if (val & FPD_ATB_AFIFS1_MASK) {
+			atb_write(&config->fpd, FPD_ATB_AFIFS1_MASK,
+				  ERR_ATB_ISR_REG);
+			ret = IRQ_HANDLED;
+			printk_deferred(
+				KERN_ERR
+				"%s: Timeout detected on ATB FPD: AFIFS1\n",
+				MOD_NAME);
+		}
+	} else if (irq == config->lpd.irq && config->lpd.init) {
+		val = atb_read(&config->lpd, ERR_ATB_ISR_REG);
+
+		if (val & LPD_ATB_LPDM_MASK) {
+			atb_write(&config->lpd, LPD_ATB_LPDM_MASK,
+				  ERR_ATB_ISR_REG);
+			ret = IRQ_HANDLED;
+			printk_deferred(KERN_ERR
+					"%s: Timeout detected on ATB LPD: LPDM\n",
+					MOD_NAME);
+		}
+		if (val & LPD_ATB_AFIFS2_MASK) {
+			atb_write(&config->lpd, LPD_ATB_AFIFS2_MASK,
+				  ERR_ATB_ISR_REG);
+			ret = IRQ_HANDLED;
+			printk_deferred(
+				KERN_ERR
+				"%s: Timeout detected on ATB LPD: AFIFS2\n",
+				MOD_NAME);
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * read_dts - Read DTS configuration for the driver
+ * @config: Pointer to driver configuration
+ * @return: 0 on success, otherwise error code
+ */
+static int read_dts(struct device *dev, struct atb_config *config)
+{
+	struct device_node *np;
+
+	np = of_find_node_by_name(NULL, MOD_NAME);
+	if (!np) {
+		dev_err(dev, "unable to find device tree node '%s'", MOD_NAME);
+		return -ENODEV;
+	}
+
+	// FPD domain
+	config->fpd.opt_val = 0;
+	if (of_property_read_bool(np, "fpd_afifs1_enable"))
+		config->fpd.opt_val |= FPD_ATB_AFIFS1_MASK;
+	if (of_property_read_bool(np, "fpd_afifs0_enable"))
+		config->fpd.opt_val |= FPD_ATB_AFIFS0_MASK;
+	if (of_property_read_bool(np, "fpd_fpds_enable"))
+		config->fpd.opt_val |= FPD_ATB_FPDS_MASK;
+
+	// LPD domain
+	config->lpd.opt_val = 0;
+	if (of_property_read_bool(np, "lpd_afifs2_enable"))
+		config->lpd.opt_val |= LPD_ATB_AFIFS2_MASK;
+	if (of_property_read_bool(np, "lpd_lpdm_enable"))
+		config->lpd.opt_val |= LPD_ATB_LPDM_MASK;
+
+	dev_dbg(dev, "FPD option mask: %u, LPD option mask: %u",
+		config->fpd.opt_val, config->lpd.opt_val);
+
+	return 0;
+}
+
+/**
+ * map_irq - Map IRQ number to IRQ domain
+ * @dev: Pointer to device
+ * @irq: IRQ number
+ * @return: Mapped IRQ number
+ */
+static int map_irq(struct device *dev, int irq)
+{
+	int irq_mapped;
+	struct device_node *node;
+	struct irq_domain *domain;
+	struct irq_fwspec spec = { .param_count = 3,
+				   .param = { 0 /* gic */, irq,
+					      4 /* high level */ } };
+
+	node = of_find_node_by_name(NULL, "interrupt-controller");
+	if (!node) {
+		dev_err(dev, "could not find GIC device node");
+		return -EFAULT;
+	}
+
+	domain = irq_find_host(node);
+	if (!domain) {
+		dev_err(dev, "could not find IRQ domain");
+		return -EFAULT;
+	}
+
+	spec.fwnode = domain->fwnode;
+
+	irq_mapped = irq_create_fwspec_mapping(&spec);
+	dev_dbg(dev, "mapped IRQ %d, onto: %d", irq, irq_mapped);
+
+	return irq_mapped;
+}
+
+/**
+ * atb_domain_setup - Setup ATB in a domain
+ * @cfg: Pointer to ATB domain configuration
+ * @pdev: Pointer to platform device
+ * @base: Base address of the ATB domain
+ * @irq: IRQ number
+ * @domain_name: Domain name
+ * @irq_name: IRQ name
+ * @return: 0 on success, otherwise error code
+ */
+static int atb_domain_setup(struct atb_domain_config *cfg,
+			    struct platform_device *pdev, uintptr_t base,
+			    int irq, const char *domain_name,
+			    const char *irq_name)
+{
+	struct device *dev = &pdev->dev;
+
+	// get physical address
+	cfg->base = devm_ioremap(dev, base, SZ_64);
+	if (!cfg->base) {
+		dev_err(dev, "failed to map %s base address", domain_name);
+		return -1;
+	}
+
+	// map IRQ
+	irq = map_irq(dev, irq);
+	if (irq <= 0) {
+		dev_err(dev, "failed to map ATB %s IRQ", domain_name);
+		return -2;
+	}
+	cfg->irq = irq;
+
+	// request IRQ
+	if (devm_request_irq(dev, irq, irq_handler, IRQF_SHARED, irq_name,
+			     pdev)) {
+		dev_err(dev, "failed to request ATB %s IRQ.", domain_name);
+		return -3;
+	}
+
+	// disable ATB for configuration
+	atb_write(cfg, 0x0, ATB_RESP_EN_REG);
+
+	// response type: ATB returns 'SLVERR' on timeout
+	// which results in app 'bus fault'
+	atb_write(cfg, cfg->opt_val, ATB_RESP_TYPE_REG);
+	atb_write(cfg, cfg->opt_val, ATB_CMD_STORE_EN_REG);
+
+	// timeout prescaler: 16b - enable, 15:0b - prescaler value
+	// based on 100 MHz clock
+	atb_write(cfg, (ATB_PRESCALER_EN_MASK + ATB_PRESCALER_TIMEOUT_VAL),
+		  ATB_PRESCALE_REG);
+
+	// clear interrupt flags
+	atb_write(cfg, cfg->opt_val, ERR_ATB_ISR_REG);
+
+	// enable selected interrupts
+	atb_write(cfg, cfg->opt_val, ERR_ATB_IER_REG);
+
+	// enable ATB
+	atb_write(cfg, cfg->opt_val, ATB_RESP_EN_REG);
+
+	cfg->init = true;
+
+	return 0;
+}
+
+/**
+ * atb_probe - Probe function for the driver
+ * @pdev: Pointer to platform device
+ * @return: 0 on success, otherwise error code
+ */
+static int atb_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct atb_config *config;
+	struct device *dev = &pdev->dev;
+
+	config = devm_kzalloc(dev, sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, config);
+
+	// read DTS config
+	ret = read_dts(dev, config);
+	if (ret) {
+		dev_err(dev, "failed to read DTS: %d", ret);
+		goto err;
+	}
+
+	// configure FPD
+	ret = atb_domain_setup(&config->fpd, pdev, FPD_SLCR_ATB_BASE_ADDR,
+			       IRQ_ZYNQMP_GIC_ATB_FPD, "FPD", "atb_fpd_irq");
+	if (ret) {
+		dev_err(dev, "failed to setup FPD domain: %d", ret);
+		goto err;
+	} else {
+		dev_info(dev, "ATB FPD configured");
+	}
+
+	// configure LPD
+	ret = atb_domain_setup(&config->lpd, pdev, LPD_SLCR_ATB_BASE_ADDR,
+			       IRQ_ZYNQMP_GIC_ATB_LPD, "LPD", "atb_lpd_irq");
+	if (ret) {
+		dev_err(dev, "failed to setup LPD domain: %d", ret);
+		goto err_fpd;
+	} else {
+		dev_info(dev, "ATB LPD configured");
+	}
+
+	return 0;
+
+err_fpd:
+	if (config->fpd.init)
+		atb_write(&config->fpd, 0x0, ATB_RESP_EN_REG);
+err:
+	return -EFAULT;
+}
+
+/**
+ * atb_remove - Remove function for the driver
+ * @pdev: Pointer to platform device
+ * @return: 0 on success, otherwise error code
+ */
+static int atb_remove(struct platform_device *pdev)
+{
+	int val, reg;
+	struct device *dev = &pdev->dev;
+	struct atb_config *config = platform_get_drvdata(pdev);
+
+	if (!config) {
+		dev_err(dev, "config is NULL in remove");
+		return -EFAULT;
+	}
+
+	// disable ATB
+	if (config->fpd.init) {
+		val = config->fpd.opt_val;
+		reg = atb_read(&config->fpd, ATB_RESP_EN_REG);
+		val &= ~reg;
+		atb_write(&config->fpd, val, ATB_RESP_EN_REG);
+	}
+	if (config->lpd.init) {
+		val = config->lpd.opt_val;
+		reg = atb_read(&config->lpd, ATB_RESP_EN_REG);
+		val &= ~reg;
+		atb_write(&config->lpd, val, ATB_RESP_EN_REG);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id atb_of_match[] = {
+	{
+		.compatible = "xlnx,zynqmp-atb",
+	},
+	{},
+};
+
+static struct platform_driver atb_driver = {
+	.probe = atb_probe,
+	.remove = atb_remove,
+	.driver = {
+		.name = MOD_NAME,
+		.of_match_table = atb_of_match,
+	},
+};
+
+static int __init atb_early_init(void)
+{
+	return platform_driver_register(&atb_driver);
+}
+
+arch_initcall(atb_early_init);
-- 
2.43.0


