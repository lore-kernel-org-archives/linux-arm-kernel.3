Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857F4CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5Hc/tjqdVuOb4b4/ulXL7QCu2jXkperHgbFn9acRJE=; b=cc3VncJRQiLiACPRlM4l7m8dhH
	KfMWvOrL36CK46Dr3+9FJnENnJUiSfAOrNB6xuDy9b2opm8WGzgDLpkLZAB+LUNKzhoAuHsMLmg3W
	2QnuFaJr4q33Q7IN5oc+OqgDB4ttftQX2Pg+urRjmGRz2+MgqIMOt+AcJGDddlKtZV68Yko3fngTa
	u40E1adGHxYE5yI5kLtn35kY7zLYJKhfbod7MfGJumgufwRPUkpZ4P619IeAkZRDzaEXDITQQxNz8
	/nwDscLxCejIcgCrnGi01zaQVey6rDRyEYJ9VIKT0WB+rGaquNCnquHZosBsGtuxes0pm6o6dfbED
	AfJ68nEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9F0-00000006iRk-1ako;
	Wed, 10 Jun 2026 03:04:30 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Ex-00000006iQT-4784
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:04:29 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso1060906a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 20:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060667; x=1781665467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5Hc/tjqdVuOb4b4/ulXL7QCu2jXkperHgbFn9acRJE=;
        b=YXiD6ppr6A0NtYv81g26brR2vGp/y2eBOcD2UwM9oZLrSmoRFWF8VQ1tHBXuPliyxH
         ioMgObKTgdwM1KghFBCbPflanHIeV+lXrB8FjVxRHHVDaWGiMbaYzfx3Eg7pMNFOqHyo
         BhYDOZ7dCpEPCcQdnLN+T08Ls2TkGUch+Y1Hd547T7pT0CJLYulPDlmgla/xvp/c/C+E
         6sHx6WOVoyzjAfbZ3o3JTpc/mtACdsfWifHH9fhqZRZjiT/wxXAF0sCI+eGiBGRg8mWM
         6ZKdHkq3nnEXPsFvg0NDF5Ja0sqi4qRNiA0e3cd9g7OMwpUrFGbgKRkX7Paqgze+Df2A
         Sflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060667; x=1781665467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5Hc/tjqdVuOb4b4/ulXL7QCu2jXkperHgbFn9acRJE=;
        b=Cqkh0OK8YVDkHtP3sXr55rx9j4zBv3MfEy+hOAmkCwperYn85WvsTZfWq9wdPZ3frR
         UbEaKCNQt8IB3bEzzCu36aqIRSX18czPjRhoEq9o8ijU+89zGfPMXsgJ6MIVdoL+ZUpT
         wnf/OocWJGRJ68gUu3794gf8QUws5sdZ3yYTDf7tQEoWmymVmICPaxy8h7ib8jhj05d+
         FpjbpsWkhbzuq11NlJ1yeJRBgc8oOxAxh00Pt6QJGNZVPn2C9EgQyz/oZutb/A/cNLhO
         Hxy2GimdNsbuO98YsCjXZH71rmS3IxXZjgzZqKyWDSDd2e5ZxQAx8t26g3SQnYS1yZS6
         nakw==
X-Forwarded-Encrypted: i=1; AFNElJ98ukN5qEV/QzuDOdnsEZ5coFFpf9GHPEjvdC1PthZl0jvOj5iiB96l/Au9BJrdi97WboQ0hh9QBpYvc34ylCrh@lists.infradead.org
X-Gm-Message-State: AOJu0YyPAJXEL8SXRyJC0FjQcIkHfQTTiorsNwmD+vKPEsTSQNEISXN2
	vFxF0aAnyZLTQAtd+wBKsquZMUbSL/OcdvU2osBrKsYnNzkhTjZ8wtiM
X-Gm-Gg: Acq92OHVc1f0Q506QAD8/uhnptFqGIdb6UwWJkhZNGISMljjX9pGQ4/YiXLDORuO/dA
	rO3hlgc2Igv5iRsUyTBcHXbtny/EjR96TZBpHik1hBAhQcCy2lzqJpsRGATh1TuE2mLEbX5+FYn
	9lcKcZpvj2lDMuOd9sDHKS3cvTGaaGUqow9xWG3/uIbQUuhMzF3CqYpcYIyzoIi/oLme18fZ+vX
	ebIkQg3ztpGy+53dWOZDY70tYfYoggtNT/2W3+RASsT9xE8Bh/obZOVAQ9QTcyaYs5Ge17wDr12
	Cza9OHf4D81PO+O89ncgsLrU5087w5k6BhYHI9p/AFvfDZUkbUUv5Nn+XkAseZj1z2C/hXfvI/q
	vYVpgRi7kqYaB/pGNUuj91A0fe2SU7towtJIJQBaX2V7tI8PGEP8QnT3fsAxpY1fCDtppLpIkiI
	46pLhmvOn4H67+8c3qHinehBrIYv91M3UhZEeGpAEzCTKSLuc7CU2X88xX7MYF+dvzf6vij6PkW
	yDgxcRhON68E78PEMC42+zSs2QwL1Q=
X-Received: by 2002:a05:6a21:a345:b0:39c:787:f197 with SMTP id adf61e73a8af0-3b53beb47c6mr7646315637.36.1781060666860;
        Tue, 09 Jun 2026 20:04:26 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:26 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v4 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
Date: Wed, 10 Jun 2026 11:02:07 +0800
Message-Id: <20260610030208.2020275-3-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610030208.2020275-1-zychennvt@gmail.com>
References: <20260610030208.2020275-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_200428_053941_F3D3E0E6 
X-CRM114-Status: GOOD (  27.83  )
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

Add I2C support for Nuvoton MA35D1 SoC.
The controller supports standard, fast and fast-plus modes,
and provides controller/target functionality.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 drivers/i2c/busses/Kconfig      |  13 +
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-ma35d1.c | 778 ++++++++++++++++++++++++++++++++
 3 files changed, 792 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ma35d1.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 8c935f867a37..816c55814ed4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1590,4 +1590,17 @@ config I2C_VIRTIO
           This driver can also be built as a module. If so, the module
           will be called i2c-virtio.
 
+config I2C_MA35D1
+	tristate "Nuvoton MA35D1 I2C driver"
+	depends on ARCH_MA35 || COMPILE_TEST
+	select I2C_SLAVE
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C controller in the Nuvoton MA35D1 SoC. This driver
+	  supports the standard I2C bus protocols, including master and
+	  slave modes.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called i2c-ma35d1.
+
 endmenu
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 547123ab351f..264f6f3f608d 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -130,6 +130,7 @@ obj-$(CONFIG_I2C_XILINX)	+= i2c-xiic.o
 obj-$(CONFIG_I2C_XLP9XX)	+= i2c-xlp9xx.o
 obj-$(CONFIG_I2C_RCAR)		+= i2c-rcar.o
 obj-$(CONFIG_I2C_GXP)		+= i2c-gxp.o
+obj-$(CONFIG_I2C_MA35D1)	+= i2c-ma35d1.o
 
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d1.c
new file mode 100644
index 000000000000..7b6b20c0996d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ma35d1.c
@@ -0,0 +1,778 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Nuvoton technology corporation.
+ *
+ * Author: Zi-Yu Chen <zychennvt@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+/* MA35D1 I2C registers offset */
+#define MA35_CTL0		0x00
+#define MA35_ADDR0		0x04
+#define MA35_DAT		0x08
+#define MA35_STATUS0	0x0c
+#define MA35_CLKDIV		0x10
+#define MA35_TOCTL		0x14
+#define MA35_ADDR1		0x18
+#define MA35_ADDR2		0x1c
+#define MA35_ADDR3		0x20
+#define MA35_ADDRMSK0	0x24
+#define MA35_ADDRMSK1	0x28
+#define MA35_ADDRMSK2	0x2c
+#define MA35_ADDRMSK3	0x30
+#define MA35_WKCTL		0x3c
+#define MA35_WKSTS		0x40
+#define MA35_CTL1		0x44
+#define MA35_STATUS1	0x48
+#define MA35_TMCTL		0x4c
+#define MA35_BUSCTL		0x50
+#define MA35_BUSTCTL	0x54
+#define MA35_BUSSTS		0x58
+#define MA35_PKTSIZE	0x5c
+#define MA35_PKTCRC		0x60
+#define MA35_BUSTOUT	0x64
+#define MA35_CLKTOUT	0x68
+#define MA35_AUTOCNT	0x78
+
+/* MA35D1 I2C Status */
+/* Controller */
+#define MA35_M_START				0x08	/* Start */
+#define MA35_M_REPEAT_START			0x10	/* Controller Repeat Start */
+#define MA35_M_TRAN_ADDR_ACK		0x18	/* Controller Transmit Address ACK */
+#define MA35_M_TRAN_ADDR_NACK		0x20	/* Controller Transmit Address NACK */
+#define MA35_M_TRAN_DATA_ACK		0x28	/* Controller Transmit Data ACK */
+#define MA35_M_TRAN_DATA_NACK		0x30	/* Controller Transmit Data NACK */
+#define MA35_M_ARB_LOST				0x38	/* Controller Arbitration Lost */
+#define MA35_M_RECE_ADDR_ACK		0x40	/* Controller Receive Address ACK */
+#define MA35_M_RECE_ADDR_NACK		0x48	/* Controller Receive Address NACK */
+#define MA35_M_RECE_DATA_ACK		0x50	/* Controller Receive Data ACK */
+#define MA35_M_RECE_DATA_NACK		0x58	/* Controller Receive Data NACK */
+#define MA35_BUS_ERROR				0x00	/* Bus error */
+
+/*  Target */
+#define MA35_S_REPEAT_START_STOP	0xa0	/* Target Transmit Repeat Start or Stop */
+#define MA35_S_TRAN_ADDR_ACK		0xa8	/* Target Transmit Address ACK */
+#define MA35_S_TRAN_DATA_ACK		0xb8	/* Target Transmit Data ACK */
+#define MA35_S_TRAN_DATA_NACK		0xc0	/* Target Transmit Data NACK */
+#define MA35_S_TRAN_LAST_DATA_ACK	0xc8	/* Target Transmit Last Data ACK */
+#define MA35_S_RECE_ADDR_ACK		0x60	/* Target Receive Address ACK */
+#define MA35_S_RECE_ARB_LOST		0x68	/* Target Receive Arbitration Lost */
+#define MA35_S_RECE_DATA_ACK		0x80	/* Target Receive Data ACK */
+#define MA35_S_RECE_DATA_NACK		0x88	/* Target Receive Data NACK */
+
+/* GC Mode */
+#define MA35_GC_ADDR_ACK			0x70	/* GC mode Address ACK */
+#define MA35_GC_ARB_LOST			0x78	/* GC mode Arbitration Lost */
+#define MA35_GC_DATA_ACK			0x90	/* GC mode Data ACK */
+#define MA35_GC_DATA_NACK			0x98	/* GC mode Data NACK */
+
+/* Other */
+#define MA35_ADDR_TRAN_ARB_LOST		0xb0	/* Address Transmit Arbitration Lost */
+#define MA35_BUS_RELEASED			0xf8	/* Bus Released */
+
+/*  I2C_CTL constant definitions. */
+#define MA35_CTL_AA			BIT(2)
+#define MA35_CTL_SI			BIT(3)
+#define MA35_CTL_STO		BIT(4)
+#define MA35_CTL_STA		BIT(5)
+#define MA35_CTL_I2CEN		BIT(6)
+#define MA35_CTL_INTEN		BIT(7)
+#define MA35_CTL_SI_AA		(MA35_CTL_SI | MA35_CTL_AA)
+#define MA35_CTL_STO_SI		(MA35_CTL_STO | MA35_CTL_SI)
+#define MA35_CTL_STA_SI		(MA35_CTL_STA | MA35_CTL_SI)
+#define MA35_CTL_STA_SI_AA	(MA35_CTL_STA | MA35_CTL_SI | MA35_CTL_AA)
+#define MA35_CTL_STO_SI_AA	(MA35_CTL_STO | MA35_CTL_SI | MA35_CTL_AA)
+
+/* Constants */
+#define MA35_CLKDIV_MSK		GENMASK(15, 0)
+#define MA35_I2C_ADDR_MASK	(0x7f << 1)
+#define I2C_PM_TIMEOUT_MS	5000
+#define STOP_TIMEOUT_MS		50
+#define MA35_I2C_GC_EN		1
+#define MA35_I2C_GC_DIS		0
+
+struct ma35d1_i2c {
+	wait_queue_head_t wait;
+	struct i2c_msg *msg;
+	unsigned int msg_num;
+	unsigned int msg_idx;
+	unsigned int msg_ptr;
+	int err;
+	int irq;
+	void __iomem *regs;
+	struct clk *clk;
+	struct device *dev;
+	struct i2c_adapter adap;
+	struct i2c_client *target;
+	struct reset_control *rst;
+};
+
+static inline bool ma35d1_is_controller_status(unsigned int status)
+{
+	return status >= MA35_M_START && status <= MA35_M_RECE_DATA_NACK;
+}
+
+/*
+ * ma35d1_i2c_write_CTL - Update the I2C control register
+ * @i2c: Pointer to the ma35d1 i2c instance
+ * @ctl: Control bits to set (e.g., MA35_CTL_STA, SI, AA)
+ *
+ * This helper reads CTL0, clears the sticky state-change bits (STA, STO, SI, AA),
+ * and then applies the new control bits provided by @ctl.
+ */
+static void ma35d1_i2c_write_CTL(struct ma35d1_i2c *i2c, unsigned int ctl)
+{
+	unsigned int val;
+
+	val = readl(i2c->regs + MA35_CTL0);
+	val &= ~(MA35_CTL_STA_SI_AA | MA35_CTL_STO);
+	val |= ctl;
+	writel(val, i2c->regs + MA35_CTL0);
+}
+
+static void ma35d1_i2c_set_addr(struct ma35d1_i2c *i2c)
+{
+	unsigned int rw = i2c->msg->flags & I2C_M_RD;
+
+	writel(((i2c->msg->addr & 0x7f) << 1) | rw, i2c->regs + MA35_DAT);
+}
+
+static void ma35d1_i2c_controller_complete(struct ma35d1_i2c *i2c)
+{
+	dev_dbg(i2c->dev, "controller_complete\n");
+
+	i2c->msg_ptr = 0;
+	i2c->msg = NULL;
+	i2c->msg_idx++;
+	i2c->msg_num = 0;
+
+	wake_up(&i2c->wait);
+}
+
+static void ma35d1_i2c_disable_irq(struct ma35d1_i2c *i2c)
+{
+	unsigned long tmp;
+
+	tmp = readl(i2c->regs + MA35_CTL0);
+	writel(tmp & ~MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
+}
+
+static void ma35d1_i2c_enable_irq(struct ma35d1_i2c *i2c)
+{
+	unsigned long tmp;
+
+	tmp = readl(i2c->regs + MA35_CTL0);
+	writel(tmp | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
+}
+
+static void ma35d1_i2c_reset(struct ma35d1_i2c *i2c)
+{
+	unsigned int clkdiv, slvaddr;
+
+	clkdiv = readl(i2c->regs + MA35_CLKDIV);
+	slvaddr = readl(i2c->regs + MA35_ADDR0);
+
+	reset_control_assert(i2c->rst);
+	reset_control_deassert(i2c->rst);
+
+	writel(clkdiv, (i2c->regs + MA35_CLKDIV));
+	ma35d1_i2c_write_CTL(i2c, MA35_CTL_I2CEN);
+
+	if (i2c->target)
+		writel(slvaddr, i2c->regs + MA35_ADDR0);
+}
+
+static void ma35d1_i2c_stop(struct ma35d1_i2c *i2c, int ret)
+{
+	ma35d1_i2c_write_CTL(i2c, MA35_CTL_STO_SI);
+
+	if (ret)
+		i2c->err = ret;
+
+	ma35d1_i2c_controller_complete(i2c);
+}
+
+/* Check if this is the last message in the set */
+static inline bool is_last_msg(struct ma35d1_i2c *i2c)
+{
+	return i2c->msg_idx >= (i2c->msg_num - 1);
+}
+
+/* Check if this is the last byte in the current message */
+static inline bool is_last_byte(struct ma35d1_i2c *i2c)
+{
+	return i2c->msg_ptr == i2c->msg->len - 1;
+}
+
+/* Check if reached the end of the current message */
+static inline bool is_msgend(struct ma35d1_i2c *i2c)
+{
+	return i2c->msg_ptr >= i2c->msg->len;
+}
+
+/*
+ * i2c_ma35d1_irq_target_trx - I2C Target state machine handler
+ * @i2c: ma35d1 i2c instance
+ * @i2c_status: hardware status code from MA35_STATUS0
+ */
+static void i2c_ma35d1_irq_target_trx(struct ma35d1_i2c *i2c,
+				      unsigned long i2c_status)
+{
+	unsigned char byte;
+
+	switch (i2c_status) {
+	case MA35_S_RECE_ADDR_ACK:
+		/* Own SLA+W has been receive; ACK has been return */
+		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
+		break;
+	case MA35_S_TRAN_DATA_NACK:
+	/* Data byte or last data in I2CDAT has been transmitted.
+	 * Not ACK has been received
+	 */
+	case MA35_S_RECE_DATA_NACK:
+	/* Previously addressed with own SLA address;
+	 * NOT ACK has been returned
+	 */
+		break;
+
+	case MA35_S_RECE_DATA_ACK:
+		/* Previously address with own SLA address Data has been received;
+		 * ACK has been returned
+		 */
+		byte = readb(i2c->regs + MA35_DAT);
+		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_RECEIVED, &byte);
+		break;
+
+	case MA35_S_TRAN_ADDR_ACK:
+		/* Own SLA+R has been receive; ACK has been return */
+		i2c_slave_event(i2c->target, I2C_SLAVE_READ_REQUESTED, &byte);
+
+		writel(byte, i2c->regs + MA35_DAT);
+		break;
+
+	case MA35_S_TRAN_DATA_ACK:
+		i2c_slave_event(i2c->target, I2C_SLAVE_READ_PROCESSED, &byte);
+		writel(byte, i2c->regs + MA35_DAT);
+		break;
+
+	case MA35_S_REPEAT_START_STOP:
+	/* A STOP or repeated START has been received
+	 *  while still addressed as Target/Receiver
+	 */
+		i2c_slave_event(i2c->target, I2C_SLAVE_STOP, &byte);
+		break;
+
+	default:
+		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
+			i2c_status);
+		break;
+	}
+	ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
+}
+
+/*
+ * i2c_ma35d1_irq_controller_trx - I2C Controller state machine handler
+ * @i2c: ma35d1 i2c instance
+ * @i2c_status: hardware status code from MA35_STATUS0
+ */
+static void i2c_ma35d1_irq_controller_trx(struct ma35d1_i2c *i2c,
+					  unsigned long i2c_status)
+{
+	unsigned char byte;
+
+	switch (i2c_status) {
+	case MA35_M_START:
+	case MA35_M_REPEAT_START:
+		ma35d1_i2c_set_addr(i2c);
+		ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI);
+		break;
+
+	case MA35_M_TRAN_ADDR_ACK:
+	case MA35_M_TRAN_DATA_ACK:
+		/* SLA+W has been transmitted and ACK has been received */
+		if (i2c_status == MA35_M_TRAN_ADDR_ACK) {
+			if (is_last_msg(i2c) && i2c->msg->len == 0) {
+				ma35d1_i2c_stop(i2c, 0);
+				return;
+			}
+		}
+
+		if (!is_msgend(i2c)) {
+			byte = i2c->msg->buf[i2c->msg_ptr++];
+			writel(byte, i2c->regs + MA35_DAT);
+			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI);
+		} else if (!is_last_msg(i2c)) {
+			dev_dbg(i2c->dev, "WRITE: Next Message\n");
+
+			i2c->msg_ptr = 0;
+			i2c->msg_idx++;
+			i2c->msg++;
+
+			ma35d1_i2c_write_CTL(i2c, MA35_CTL_STA | MA35_CTL_SI);
+		} else {
+			ma35d1_i2c_stop(i2c, 0);
+		}
+		break;
+
+	case MA35_M_TRAN_DATA_NACK:
+		ma35d1_i2c_stop(i2c, -EIO);
+		break;
+
+	case MA35_M_TRAN_ADDR_NACK:
+	case MA35_M_RECE_ADDR_NACK:
+		/* Controller Transmit Address NACK */
+		/* 0x20: SLA+W has been transmitted and NACK has been received */
+		/* 0x48: SLA+R has been transmitted and NACK has been received */
+		if (i2c->msg->flags & I2C_M_IGNORE_NAK) {
+			ma35d1_i2c_stop(i2c, 0);
+		} else {
+			dev_dbg(i2c->dev, "\n i2c: ack was not received\n");
+			ma35d1_i2c_stop(i2c, -ENXIO);
+		}
+		break;
+
+	case MA35_M_RECE_ADDR_ACK:
+		if (is_msgend(i2c)) {
+			if (is_last_msg(i2c)) {
+				ma35d1_i2c_stop(i2c, 0);
+			} else {
+				dev_dbg(i2c->dev, "READ: Next Transfer\n");
+
+				i2c->msg_ptr = 0;
+				i2c->msg_idx++;
+				i2c->msg++;
+
+				ma35d1_i2c_write_CTL(i2c, MA35_CTL_STA_SI);
+			}
+		} else if (i2c->msg->len == 1) {
+			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI);
+		} else {
+			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
+		}
+		break;
+
+	case MA35_M_RECE_DATA_ACK:
+	case MA35_M_RECE_DATA_NACK:
+		/* DATA has been transmitted and ACK has been received */
+		byte = readb(i2c->regs + MA35_DAT);
+		i2c->msg->buf[i2c->msg_ptr++] = byte;
+
+		if (is_last_byte(i2c)) {
+			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI);
+		} else if (is_msgend(i2c)) {
+			if (is_last_msg(i2c)) {
+				dev_dbg(i2c->dev, "READ: Send Stop\n");
+
+				ma35d1_i2c_stop(i2c, 0);
+			} else {
+				dev_dbg(i2c->dev, "READ: Next Transfer\n");
+
+				i2c->msg_ptr = 0;
+				i2c->msg_idx++;
+				i2c->msg++;
+
+				ma35d1_i2c_write_CTL(i2c, MA35_CTL_STA_SI);
+			}
+		} else {
+			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
+		}
+		break;
+
+	default:
+		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
+			i2c_status);
+		ma35d1_i2c_stop(i2c, -EIO);
+		break;
+	}
+}
+
+static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
+{
+	struct ma35d1_i2c *i2c = dev_id;
+	unsigned long status;
+
+	status = readl(i2c->regs + MA35_STATUS0);
+
+	if (status == MA35_M_ARB_LOST) {
+		dev_err(i2c->dev, "Arbitration lost\n");
+		ma35d1_i2c_stop(i2c, -EAGAIN);
+		goto out;
+	}
+
+	else if (status == MA35_BUS_ERROR) {
+		dev_err(i2c->dev, "Bus error during transfer\n");
+		ma35d1_i2c_stop(i2c, -EIO);
+		goto out;
+	}
+
+	if (ma35d1_is_controller_status(status))
+		i2c_ma35d1_irq_controller_trx(i2c, status);
+	else
+		i2c_ma35d1_irq_target_trx(i2c, status);
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msgs,
+			     int num)
+{
+	unsigned long timeout;
+	unsigned int val;
+	int ret, err;
+
+	i2c->msg = msgs;
+	i2c->msg_num = num;
+	i2c->msg_ptr = 0;
+	i2c->msg_idx = 0;
+	i2c->err = 0;
+
+	ma35d1_i2c_enable_irq(i2c);
+	ma35d1_i2c_write_CTL(i2c, MA35_CTL_STA_SI);
+	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
+	ma35d1_i2c_disable_irq(i2c);
+	ret = i2c->msg_idx;
+
+	if (timeout == 0) {
+		dev_dbg(i2c->dev, "xfer timeout\n");
+		ret = -ETIMEDOUT;
+		goto reset;
+	}
+
+	err = readl_poll_timeout(i2c->regs + MA35_CTL0, val,
+				 !(val & MA35_CTL_STO), 100,
+				 STOP_TIMEOUT_MS * 10000);
+	if (err) {
+		dev_err(i2c->dev, "bus idle timeout\n");
+		ret = -EBUSY;
+		goto reset;
+	} else if (i2c->err) {
+		dev_dbg(i2c->dev, "xfer error %d\n", i2c->err);
+		ret = i2c->err;
+	} else if (ret != num) {
+		dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
+	}
+	return ret;
+
+reset:
+	ma35d1_i2c_reset(i2c);
+	return ret;
+}
+
+static int ma35d1_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			   int num)
+{
+	struct ma35d1_i2c *i2c = i2c_get_adapdata(adap);
+	int retry, ret;
+
+	ret = pm_runtime_resume_and_get(i2c->dev);
+	if (ret)
+		return ret;
+
+	for (retry = 0; retry < adap->retries; retry++) {
+		ret = ma35d1_i2c_doxfer(i2c, msgs, num);
+		if (ret != -EAGAIN)
+			break;
+
+		dev_dbg(i2c->dev, "Retrying transmission (%d)\n", retry);
+		fsleep(100);
+	}
+
+	if (ret == -EAGAIN)
+		ret = -EREMOTEIO;
+
+	if (i2c->target) {
+		ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
+		ma35d1_i2c_enable_irq(i2c);
+	}
+	pm_runtime_put_autosuspend(i2c->dev);
+
+	return ret;
+}
+
+static int ma35d1_reg_target(struct i2c_client *target)
+{
+	struct ma35d1_i2c *i2c = i2c_get_adapdata(target->adapter);
+	unsigned int val, slvaddr;
+	int ret;
+
+	if (i2c->target)
+		return -EBUSY;
+
+	if (target->flags & I2C_CLIENT_TEN)
+		return -EAFNOSUPPORT;
+
+	ret = pm_runtime_resume_and_get(i2c->dev);
+	if (ret) {
+		dev_err(i2c->dev, "failed to resume i2c controller\n");
+		return ret;
+	}
+
+	ma35d1_i2c_enable_irq(i2c);
+
+	i2c->target = target;
+
+	val = readl(i2c->regs + MA35_CTL0);
+	val |= MA35_CTL_I2CEN;
+	writel(val, i2c->regs + MA35_CTL0);
+	slvaddr = target->addr << 1;
+	writel(slvaddr, i2c->regs + MA35_ADDR0);
+
+	/* I2C enter SLV mode */
+	ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
+
+	return 0;
+}
+
+static int ma35d1_unreg_target(struct i2c_client *target)
+{
+	struct ma35d1_i2c *i2c = i2c_get_adapdata(target->adapter);
+	unsigned int val;
+	int ret;
+
+	if (!i2c->target)
+		return -EINVAL;
+
+	/* Disable I2C interrupt */
+	ma35d1_i2c_disable_irq(i2c);
+
+	/* Disable I2C */
+	val = readl(i2c->regs + MA35_CTL0);
+	val &= ~MA35_CTL_I2CEN;
+	writel(val, i2c->regs + MA35_CTL0);
+
+	i2c->target = NULL;
+
+	ret = pm_runtime_put_sync(i2c->dev);
+	if (ret < 0)
+		dev_err(i2c->dev, "failed to suspend i2c controller");
+
+	return 0;
+}
+
+/* Declare Our I2C Functionality */
+static u32 ma35d1_i2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_SMBUS_EMUL;
+}
+
+/* I2C Bus Registration Info */
+static const struct i2c_algorithm ma35d1_i2c_algorithm = {
+	.xfer = ma35d1_i2c_xfer,
+	.functionality = ma35d1_i2c_func,
+	.reg_target = ma35d1_reg_target,
+	.unreg_target = ma35d1_unreg_target,
+};
+
+static int ma35d1_i2c_probe(struct platform_device *pdev)
+{
+	struct ma35d1_i2c *i2c;
+	struct resource *res;
+	int ret, clkdiv;
+	unsigned int busfreq;
+	struct device *dev = &pdev->dev;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	init_waitqueue_head(&i2c->wait);
+
+	i2c->dev = dev;
+
+	i2c->clk = devm_clk_get_prepared(dev, NULL);
+	if (IS_ERR(i2c->clk))
+		return dev_err_probe(dev, PTR_ERR(i2c->clk),
+				     "failed to get core clk\n");
+
+	i2c->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(i2c->regs))
+		return PTR_ERR(i2c->regs);
+
+	i2c->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(i2c->rst))
+		return dev_err_probe(dev, PTR_ERR(i2c->rst),
+				     "failed to get reset control\n");
+
+	/* Setup info block for the I2C core */
+	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));
+	i2c->adap.owner = THIS_MODULE;
+	i2c->adap.algo = &ma35d1_i2c_algorithm;
+	i2c->adap.retries = 2;
+	i2c->adap.algo_data = i2c;
+	i2c->adap.dev.parent = &pdev->dev;
+	i2c->adap.dev.of_node = pdev->dev.of_node;
+	i2c_set_adapdata(&i2c->adap, i2c);
+
+	/* Default to 100kHz if not specified in DT */
+	busfreq = 100000;
+	device_property_read_u32(dev, "clock-frequency", &busfreq);
+
+	/* Calculate divider based on the current peripheral clock rate */
+	clkdiv = DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;
+	if (clkdiv < 0 || clkdiv > 0xffff)
+		return dev_err_probe(dev, -EINVAL, "invalid clkdiv value: %d\n",
+				     clkdiv);
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq < 0)
+		return dev_err_probe(dev, i2c->irq, "failed to get irq\n");
+
+	platform_set_drvdata(pdev, i2c);
+
+	pm_runtime_set_autosuspend_delay(dev, I2C_PM_TIMEOUT_MS);
+	pm_runtime_use_autosuspend(dev);
+	devm_pm_runtime_enable(dev);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to resume device\n");
+
+	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
+
+	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
+			       i2c);
+	if (ret) {
+		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
+		goto rpm_put;
+	}
+
+	ret = devm_i2c_add_adapter(dev, &i2c->adap);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add bus to i2c core\n");
+		goto rpm_put;
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	dev_info(&i2c->adap.dev, "%08llx MA35D1 I2C adapter registered\n",
+		 res->start);
+	return 0;
+
+rpm_put:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int ma35d1_i2c_suspend(struct device *dev)
+{
+	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
+	unsigned int val;
+
+	/* Prepare for wake-up from I2C events if target mode is active */
+	if (i2c->target) {
+		val = readl(i2c->regs + MA35_CTL0);
+		val |= (MA35_CTL_SI | MA35_CTL_AA);
+		writel(val, i2c->regs + MA35_CTL0);
+
+		/* Setup wake-up control */
+		writel(0x1, i2c->regs + MA35_WKCTL);
+
+		/* Clear pending wake-up flags */
+		val = readl(i2c->regs + MA35_WKSTS);
+		writel(val, i2c->regs + MA35_WKSTS);
+
+		enable_irq_wake(i2c->irq);
+
+		ma35d1_i2c_enable_irq(i2c);
+	}
+
+	return 0;
+}
+
+static int ma35d1_i2c_resume(struct device *dev)
+{
+	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
+	unsigned int val;
+
+	if (i2c->target) {
+		/* Disable wake-up */
+		writel(0x0, i2c->regs + MA35_WKCTL);
+
+		/* Clear pending wake-up flags */
+		val = readl(i2c->regs + MA35_WKSTS);
+		writel(val, i2c->regs + MA35_WKSTS);
+
+		disable_irq_wake(i2c->irq);
+	}
+	return 0;
+}
+
+static int ma35d1_i2c_runtime_suspend(struct device *dev)
+{
+	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
+	unsigned int val;
+
+	/* Disable I2C controller */
+	val = readl(i2c->regs + MA35_CTL0);
+	val &= ~MA35_CTL_I2CEN;
+	writel(val, i2c->regs + MA35_CTL0);
+
+	clk_disable(i2c->clk);
+
+	return 0;
+}
+
+static int ma35d1_i2c_runtime_resume(struct device *dev)
+{
+	struct ma35d1_i2c *i2c = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock in resume\n");
+		return ret;
+	}
+
+	/* Enable I2C controller */
+	val = readl(i2c->regs + MA35_CTL0);
+	val |= MA35_CTL_I2CEN;
+	writel(val, i2c->regs + MA35_CTL0);
+
+	return 0;
+}
+
+static const struct dev_pm_ops ma35d1_i2c_pmops = {
+	SYSTEM_SLEEP_PM_OPS(ma35d1_i2c_suspend, ma35d1_i2c_resume)
+		RUNTIME_PM_OPS(ma35d1_i2c_runtime_suspend,
+			       ma35d1_i2c_runtime_resume, NULL)
+};
+
+static const struct of_device_id ma35d1_i2c_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ma35d1_i2c_of_match);
+
+static struct platform_driver ma35d1_i2c_driver = {
+	.probe      = ma35d1_i2c_probe,
+	.driver     = {
+		.name   = "ma35d1-i2c",
+		.of_match_table = ma35d1_i2c_of_match,
+		.pm = pm_ptr(&ma35d1_i2c_pmops),
+	},
+};
+module_platform_driver(ma35d1_i2c_driver);
+
+MODULE_AUTHOR("Zi-Yu Chen <zychennvt@gmail.com>");
+MODULE_DESCRIPTION("MA35D1 I2C Bus Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


