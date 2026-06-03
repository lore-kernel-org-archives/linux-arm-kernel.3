Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E291CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 04:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1evQ5kO8HQHNHnOMnCQhjQduCxfR+jr1fpIIuR9xz8=; b=OzyuC9iEWwUy99lsNGYo6vGom6
	lDF4CNdVNUD68AP//6w/rEqZcsGGngRNYdwo3+EC36kgtQYBLeJU69A+nZZjdCRHmHg525h7vdKPU
	fT4+FMu6qtfPVLQO7TI4eNKzfirE4GYBT6ebJzDBw6yOFbKQ/K46gGyZ2qeooW1weNx+CRPdZ9djC
	+T59xTwCNg1J5gTo0VxZV3jqPZr2p7GbtCzECR/UUV9BtJvYaIfcZ7TtYn5u2+bjLOG80lJleRN/J
	BCSAU2bmlKjov3I2c9dW5gqGq5lQeseJU7xph9NfY0GX/fr5RcxXwLH29LuzltA+W/j20ElXEvApk
	oFDnIsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdKw-0000000EFL1-2wcU;
	Wed, 03 Jun 2026 04:36:16 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdKu-0000000EFKG-2qll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 04:36:14 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8422f148dfcso1827974b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780461372; x=1781066172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1evQ5kO8HQHNHnOMnCQhjQduCxfR+jr1fpIIuR9xz8=;
        b=MeZkG64cgh4phJCbw5/BAsglGo5Iba0CGQkezW2BmYoiTaH2s1NJiPESkcKK3X/uHd
         2Pmxh7HwlIFENAb3u7dyYFOXbET7Hg3m7TAwTbUdNmApPrKMyV+RT3+u1zRxRrtuZ3+N
         q4LOaFPmwuUsyY1G8uPSPebSRBPyRZL2UJXd5w6TtbULWFgcrTZNK1G3dlKuMhgu2e61
         tTXMIo1GlKq3dFvGtmhYhaqt5P/7RpxbfEUKrIPJif2RaliCp2phEl5/1Z8JFXWmXsc8
         TNVsJP014bMlQybKV2fhwi7ckHBkOt0+AmdCka/DIX/UVfMcmFBk9rqvCwwXqppzLmvX
         +2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780461372; x=1781066172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1evQ5kO8HQHNHnOMnCQhjQduCxfR+jr1fpIIuR9xz8=;
        b=NFS+CI2uJx+AFtH2MIkpuDZGd96PsqrARo3dkIAO0XpSsPJ0Sb+pF3AxFpWobiCAJX
         Ffx76MhrqJoNnRj0TA/AdmwU43qIf/FHhqVUzIlCF08EOo4CxDURIRRbIV4BFx837KQ6
         qZcSE2dZGGd9uoRzVZHSqzg6iPnvhYgIx1uFTtNPXDBILracvNpW1FeNEj9wD+qdea4y
         pS23voO2nDnoZYbRyK7+hPohdbqEaKpxkMx9TYiBF1Qi7xqw2HGvMna0hfvjDP2Sbkri
         MnsV4lBIoph2F2D3b6TRPlYJDvVlMrp0VP5RcGWA2RAjxl7q8zct3o9YuCPPTTVCBKqz
         lFLg==
X-Gm-Message-State: AOJu0YwsQpNbF7MKp1ys2RquDdyDQpY7x3v+u4i9Vv+fZxt+8uoiZqxR
	nFF+GQSNmLrNQCV8+6ItOq5ifbhcrZ/pnzrOmUT0ba/R4G0R5AFXzgYjzz+Igw==
X-Gm-Gg: Acq92OG/lhcNISPiAtiJMVUH7YA1UMbdPEB9F5thiDlN/i8EFHJmWPaPiKJa9daSAd4
	pXyXxBRBeQaufgt033SkYUgam22b6CkeIrUbfQ8xR3dUWWdOh7iUPTI67E9OD37pVGFaxygaroU
	4YaDgClJzaVv0HvPbUublcWsJyg1axOOL3V6HYbe5wpjSInA6AQMDvetJDgH04XNFfaL6ERgSQ6
	KmYIKk9jowYxI7ZQKIu7QKcA3g6u1u3W+ZH+LLeu9frpvkNsT0aI5vebtuXosJ7lq7DF/cVWs39
	zfwa4+mTMSgZeTgRCvB+as2ykjaUGwT5WOFXkG8dHbghvEcttzyJCtR/oa0b84K0Gspia502XN4
	rMwihDelDbEWGpKYTStCh8FYhzf1/WVsp+EzPqjQNHBgTBZdlEPpsZa1Cn67CtLUhTtNLKcHMZg
	tA5evtJ8RHDo6ySIqx/NPNL4i58oOt3DTZaZHlzf2gvAqH9VWsWVmW9iU8/JlEtn4t3QgNEa3Ga
	troXG2Nvl+dF6mE7Amsuigi
X-Received: by 2002:a05:6a00:1d96:b0:842:5b63:6114 with SMTP id d2e1a72fcca58-84284db32e5mr1797496b3a.13.1780461371681;
        Tue, 02 Jun 2026 21:36:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282904889sm1478742b3a.55.2026.06.02.21.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 21:36:11 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH 2/2] spi: Add Nuvoton MA35D1 QSPI controller support
Date: Wed,  3 Jun 2026 12:35:51 +0800
Message-Id: <20260603043551.1062112-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603043551.1062112-1-cwweng.linux@gmail.com>
References: <20260603043551.1062112-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_213612_751242_4781F5D0 
X-CRM114-Status: GOOD (  24.94  )
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

Signed-off-by: Chi-Wen Weng <cwweng.linux@gmail.com>
---
 drivers/spi/Kconfig           |   6 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ma35d1-qspi.c | 579 ++++++++++++++++++++++++++++++++++
 3 files changed, 586 insertions(+)
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index b563f49e2197..1fde55abc36a 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -694,6 +694,12 @@ config SPI_LJCA
 	  This driver can also be built as a module. If so, the module
 	  will be called spi-ljca.
 
+config SPI_MA35D1_QSPI
+	tristate "Nuvoton MA35D1 QSPI Controller"
+	help
+	  This driver provides support for Nuvoton MA35D1
+	  QSPI controller in master mode.
+
 config SPI_MESON_SPICC
 	tristate "Amlogic Meson SPICC controller"
 	depends on COMMON_CLK
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 9d36190a9884..ed1615bf5684 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_SPI_LOONGSON_CORE)		+= spi-loongson-core.o
 obj-$(CONFIG_SPI_LOONGSON_PCI)		+= spi-loongson-pci.o
 obj-$(CONFIG_SPI_LOONGSON_PLATFORM)	+= spi-loongson-plat.o
 obj-$(CONFIG_SPI_LP8841_RTC)		+= spi-lp8841-rtc.o
+obj-$(CONFIG_SPI_MA35D1_QSPI)           += spi-ma35d1-qspi.o
 obj-$(CONFIG_SPI_MESON_SPICC)		+= spi-meson-spicc.o
 obj-$(CONFIG_SPI_MESON_SPIFC)		+= spi-meson-spifc.o
 obj-$(CONFIG_SPI_MICROCHIP_CORE_QSPI)	+= spi-microchip-core-qspi.o
diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
new file mode 100644
index 000000000000..119c06464cb0
--- /dev/null
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Nuvoton MA35D1 QSPI controller driver
+ *
+ * Copyright (c) 2026 Nuvoton Technology Corp.
+ * Author: Chi-Wen Weng <cwweng@nuvoton.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+/* Register offset definitions */
+#define NUVOTON_QSPI_CTL_OFFSET		0x00 /* Control Register, RW */
+#define NUVOTON_QSPI_CLKDIV_OFFSET	0x04 /* Clock Divider Register, RW */
+#define NUVOTON_QSPI_SSCTL_OFFSET	0x08 /* Slave Select Register, RW */
+#define NUVOTON_QSPI_FIFOCTL_OFFSET	0x10 /* FIFO Control Register, RW */
+#define NUVOTON_QSPI_STATUS_OFFSET	0x14 /* Status Register, RW */
+#define NUVOTON_QSPI_TX_OFFSET		0x20 /* Data Transmit Register, WO */
+#define NUVOTON_QSPI_RX_OFFSET		0x30 /* Data Receive Register, RO */
+
+/* QSPI Control Register bit masks */
+#define NUVOTON_QSPI_CTL_QUADIOEN_MASK	BIT(22) /* Quad I/O Mode Enable */
+#define NUVOTON_QSPI_CTL_DUALIOEN_MASK	BIT(21) /* Dual I/O Mode Enable */
+#define NUVOTON_QSPI_CTL_DATDIR_MASK	BIT(20) /* Data Port Direction Control */
+#define NUVOTON_QSPI_CTL_REORDER_MASK	BIT(19) /* Byte Reorder Function Enable */
+#define NUVOTON_QSPI_CTL_LSB_MASK	BIT(13) /* Send LSB First */
+#define NUVOTON_QSPI_CTL_DWIDTH_MASK	GENMASK(12, 8) /* Data Width */
+#define NUVOTON_QSPI_CTL_SUSPITV_MASK	GENMASK(7, 4) /* Suspend Interval */
+#define NUVOTON_QSPI_CTL_CLKPOL_MASK	BIT(3) /* Clock Polarity */
+#define NUVOTON_QSPI_CTL_TXNEG_MASK	BIT(2) /* Transmit on Negative Edge */
+#define NUVOTON_QSPI_CTL_RXNEG_MASK	BIT(1) /* Receive on Negative Edge */
+#define NUVOTON_QSPI_CTL_SPIEN_MASK	BIT(0) /* QSPI Transfer Control Enable */
+
+/* QSPI Clock Divider Register bit masks */
+#define NUVOTON_QSPI_CLKDIV_MASK	GENMASK(8, 0) /* Clock Divider */
+
+/* QSPI Slave Select Control Register bit masks */
+#define NUVOTON_QSPI_SSCTL_SSACTPOL_MASK	BIT(2) /* Slave Selection Active Polarity */
+#define NUVOTON_QSPI_SSCTL_SS1_MASK	BIT(1) /* Slave Selection 1 Control */
+#define NUVOTON_QSPI_SSCTL_SS0_MASK	BIT(0) /* Slave Selection 0 Control */
+
+/* QSPI FIFO Control Register bit masks */
+#define NUVOTON_QSPI_FIFOCTL_TXRST_MASK	BIT(1) /* Transmit Reset */
+#define NUVOTON_QSPI_FIFOCTL_RXRST_MASK	BIT(0) /* Receive Reset */
+
+/* QSPI Status Register bit masks */
+#define NUVOTON_QSPI_STATUS_TXRXRST_MASK	BIT(23) /* TX or RX Reset Status */
+#define NUVOTON_QSPI_STATUS_TXFULL_MASK	BIT(17) /* Transmit FIFO Full */
+#define NUVOTON_QSPI_STATUS_TXEMPTY_MASK	BIT(16) /* Transmit FIFO Empty */
+#define NUVOTON_QSPI_STATUS_SPIENSTS_MASK	BIT(15) /* QSPI Enable Status */
+#define NUVOTON_QSPI_STATUS_RXFULL_MASK	BIT(9) /* Receive FIFO Full */
+#define NUVOTON_QSPI_STATUS_RXEMPTY_MASK	BIT(8) /* Receive FIFO Empty */
+#define NUVOTON_QSPI_STATUS_UNITIF_MASK	BIT(1) /* Unit Transfer Interrupt Flag */
+#define NUVOTON_QSPI_STATUS_BUSY_MASK	BIT(0) /* Busy Status */
+
+#define NUVOTON_QSPI_DEFAULT_NUM_CS	2
+#define NUVOTON_QSPI_DEFAULT_BPW	8
+#define NUVOTON_QSPI_TIMEOUT_US		10000
+
+struct nuvoton_qspi {
+	void __iomem *regs;
+	struct clk *clk;
+	struct device *dev;
+	u32 speed_hz;
+	u8 bits_per_word;
+};
+
+static u32 nuvoton_qspi_read(struct nuvoton_qspi *qspi, u32 reg)
+{
+	return readl(qspi->regs + reg);
+}
+
+static void nuvoton_qspi_write(struct nuvoton_qspi *qspi, u32 val, u32 reg)
+{
+	writel(val, qspi->regs + reg);
+}
+
+static void nuvoton_qspi_update_bits(struct nuvoton_qspi *qspi, u32 reg,
+				     u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = nuvoton_qspi_read(qspi, reg);
+	tmp &= ~mask;
+	tmp |= val & mask;
+	nuvoton_qspi_write(qspi, tmp, reg);
+}
+
+static int nuvoton_qspi_wait_ready(struct nuvoton_qspi *qspi)
+{
+	u32 val;
+
+	return readl_poll_timeout(qspi->regs + NUVOTON_QSPI_STATUS_OFFSET,
+					 val,
+					 !(val & NUVOTON_QSPI_STATUS_BUSY_MASK),
+					 0, NUVOTON_QSPI_TIMEOUT_US);
+}
+
+static int nuvoton_qspi_reset_fifo(struct nuvoton_qspi *qspi)
+{
+	u32 val;
+
+	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_FIFOCTL_OFFSET);
+	val |= NUVOTON_QSPI_FIFOCTL_TXRST_MASK |
+	       NUVOTON_QSPI_FIFOCTL_RXRST_MASK;
+	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_FIFOCTL_OFFSET);
+
+	/* FIFO reset is extremely fast, safe to keep atomic for this micro-wait */
+	return readl_poll_timeout_atomic(qspi->regs + NUVOTON_QSPI_STATUS_OFFSET,
+					 val,
+					 !(val & NUVOTON_QSPI_STATUS_TXRXRST_MASK),
+					 1, NUVOTON_QSPI_TIMEOUT_US);
+}
+
+static int nuvoton_qspi_set_speed(struct nuvoton_qspi *qspi, u32 speed_hz)
+{
+	unsigned long clk_rate;
+	u32 div;
+
+	if (!speed_hz)
+		return -EINVAL;
+
+	if (qspi->speed_hz == speed_hz)
+		return 0;
+
+	clk_rate = clk_get_rate(qspi->clk);
+	if (!clk_rate) {
+		dev_err(qspi->dev, "failed to get clock rate\n");
+		return -EINVAL;
+	}
+
+	div = DIV_ROUND_UP(clk_rate, speed_hz) - 1;
+	if (div > FIELD_MAX(NUVOTON_QSPI_CLKDIV_MASK)) {
+		dev_err(qspi->dev, "unsupported SPI clock %u Hz\n", speed_hz);
+		return -EINVAL;
+	}
+
+	nuvoton_qspi_write(qspi, FIELD_PREP(NUVOTON_QSPI_CLKDIV_MASK, div),
+			   NUVOTON_QSPI_CLKDIV_OFFSET);
+	qspi->speed_hz = speed_hz;
+
+	return 0;
+}
+
+static int nuvoton_qspi_set_bits_per_word(struct nuvoton_qspi *qspi, u8 bpw)
+{
+	u32 val;
+
+	if (bpw != 8 && bpw != 16 && bpw != 32)
+		return -EINVAL;
+
+	if (bpw == 32)
+		val = NUVOTON_QSPI_CTL_REORDER_MASK;
+	else
+		val = FIELD_PREP(NUVOTON_QSPI_CTL_DWIDTH_MASK, bpw);
+
+	nuvoton_qspi_update_bits(qspi, NUVOTON_QSPI_CTL_OFFSET,
+				 NUVOTON_QSPI_CTL_DWIDTH_MASK |
+				 NUVOTON_QSPI_CTL_REORDER_MASK, val);
+	qspi->bits_per_word = bpw;
+
+	return 0;
+}
+
+static int nuvoton_qspi_setup_transfer(struct spi_device *spi,
+				       struct spi_transfer *xfer)
+{
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+	u32 speed_hz = spi->max_speed_hz;
+	u32 mode = spi->mode & SPI_MODE_X_MASK;
+	u8 bpw = spi->bits_per_word;
+	u32 ctl = 0;
+	int ret;
+
+	if (!bpw)
+		bpw = NUVOTON_QSPI_DEFAULT_BPW;
+
+	if (xfer) {
+		if (xfer->bits_per_word)
+			bpw = xfer->bits_per_word;
+		if (xfer->speed_hz)
+			speed_hz = xfer->speed_hz;
+	}
+
+	ret = nuvoton_qspi_set_speed(qspi, speed_hz);
+	if (ret)
+		return ret;
+
+	ret = nuvoton_qspi_set_bits_per_word(qspi, bpw);
+	if (ret)
+		return ret;
+
+	if (mode == SPI_MODE_0 || mode == SPI_MODE_3)
+		ctl |= NUVOTON_QSPI_CTL_TXNEG_MASK;
+	else
+		ctl |= NUVOTON_QSPI_CTL_RXNEG_MASK;
+
+	if (spi->mode & SPI_CPOL)
+		ctl |= NUVOTON_QSPI_CTL_CLKPOL_MASK;
+
+	if (spi->mode & SPI_LSB_FIRST)
+		ctl |= NUVOTON_QSPI_CTL_LSB_MASK;
+
+	nuvoton_qspi_update_bits(qspi, NUVOTON_QSPI_CTL_OFFSET,
+				 NUVOTON_QSPI_CTL_TXNEG_MASK |
+				 NUVOTON_QSPI_CTL_RXNEG_MASK |
+				 NUVOTON_QSPI_CTL_CLKPOL_MASK |
+				 NUVOTON_QSPI_CTL_LSB_MASK, ctl);
+
+	return 0;
+}
+
+static void nuvoton_qspi_set_bus_width(struct nuvoton_qspi *qspi,
+				       unsigned int buswidth,
+				       enum spi_mem_data_dir dir)
+{
+	u32 ctl = 0;
+
+	if (buswidth == 4)
+		ctl |= NUVOTON_QSPI_CTL_QUADIOEN_MASK;
+	else if (buswidth == 2)
+		ctl |= NUVOTON_QSPI_CTL_DUALIOEN_MASK;
+
+	if (buswidth > 1 && dir == SPI_MEM_DATA_OUT)
+		ctl |= NUVOTON_QSPI_CTL_DATDIR_MASK;
+
+	nuvoton_qspi_update_bits(qspi, NUVOTON_QSPI_CTL_OFFSET,
+				 NUVOTON_QSPI_CTL_QUADIOEN_MASK |
+				 NUVOTON_QSPI_CTL_DUALIOEN_MASK |
+				 NUVOTON_QSPI_CTL_DATDIR_MASK, ctl);
+}
+
+static u32 nuvoton_qspi_tx_word(const void *txbuf, unsigned int idx, u8 bpw)
+{
+	if (!txbuf)
+		return 0;
+
+	if (bpw <= 8)
+		return ((const u8 *)txbuf)[idx];
+	if (bpw <= 16)
+		return ((const u16 *)txbuf)[idx];
+
+	return ((const u32 *)txbuf)[idx];
+}
+
+static void nuvoton_qspi_rx_word(void *rxbuf, unsigned int idx, u32 val, u8 bpw)
+{
+	if (!rxbuf)
+		return;
+
+	if (bpw <= 8)
+		((u8 *)rxbuf)[idx] = val;
+	else if (bpw <= 16)
+		((u16 *)rxbuf)[idx] = val;
+	else
+		((u32 *)rxbuf)[idx] = val;
+}
+
+static int nuvoton_qspi_wait_tx_not_full(struct nuvoton_qspi *qspi)
+{
+	u32 val;
+
+	return readl_poll_timeout_atomic(qspi->regs + NUVOTON_QSPI_STATUS_OFFSET,
+					 val,
+					 !(val & NUVOTON_QSPI_STATUS_TXFULL_MASK),
+					 0, NUVOTON_QSPI_TIMEOUT_US);
+}
+
+static int nuvoton_qspi_wait_rx_not_empty(struct nuvoton_qspi *qspi)
+{
+	u32 val;
+
+	return readl_poll_timeout_atomic(qspi->regs + NUVOTON_QSPI_STATUS_OFFSET,
+					 val,
+					 !(val & NUVOTON_QSPI_STATUS_RXEMPTY_MASK),
+					 0, NUVOTON_QSPI_TIMEOUT_US);
+}
+
+static int nuvoton_qspi_txrx(struct nuvoton_qspi *qspi, const void *txbuf,
+			     void *rxbuf, unsigned int len)
+{
+	unsigned int bytes_per_word = DIV_ROUND_UP(qspi->bits_per_word, 8);
+	unsigned int words;
+	u32 val;
+	int ret;
+	int i;
+
+	if (!len)
+		return 0;
+
+	if (len % bytes_per_word)
+		return -EINVAL;
+
+	words = len / bytes_per_word;
+
+	ret = nuvoton_qspi_reset_fifo(qspi);
+	if (ret) {
+		dev_err(qspi->dev, "FIFO reset timed out\n");
+		return ret;
+	}
+
+	/*
+	 * Use conservative word-by-word PIO access. This keeps the initial driver
+	 * simple and avoids relying on FIFO threshold interrupts or DMA support.
+	 */
+	for (i = 0; i < words; i++) {
+		ret = nuvoton_qspi_wait_tx_not_full(qspi);
+		if (ret) {
+			dev_err(qspi->dev, "TX FIFO full timeout\n");
+			return ret;
+		}
+
+		nuvoton_qspi_write(qspi, nuvoton_qspi_tx_word(txbuf, i,
+							      qspi->bits_per_word),
+				   NUVOTON_QSPI_TX_OFFSET);
+
+		if (rxbuf) {
+			ret = nuvoton_qspi_wait_rx_not_empty(qspi);
+			if (ret) {
+				dev_err(qspi->dev, "RX FIFO empty timeout\n");
+				return ret;
+			}
+
+			val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_RX_OFFSET);
+			nuvoton_qspi_rx_word(rxbuf, i, val, qspi->bits_per_word);
+		}
+	}
+
+	ret = nuvoton_qspi_wait_ready(qspi);
+	if (ret)
+		dev_err(qspi->dev, "controller busy timeout\n");
+
+	return ret;
+}
+
+static int nuvoton_qspi_hw_init(struct nuvoton_qspi *qspi)
+{
+	u32 val;
+	int ret;
+
+	ret = nuvoton_qspi_set_bits_per_word(qspi, NUVOTON_QSPI_DEFAULT_BPW);
+	if (ret)
+		return ret;
+
+	nuvoton_qspi_update_bits(qspi, NUVOTON_QSPI_CTL_OFFSET,
+				 NUVOTON_QSPI_CTL_SUSPITV_MASK |
+				 NUVOTON_QSPI_CTL_TXNEG_MASK |
+				 NUVOTON_QSPI_CTL_RXNEG_MASK |
+				 NUVOTON_QSPI_CTL_CLKPOL_MASK |
+				 NUVOTON_QSPI_CTL_LSB_MASK,
+				 NUVOTON_QSPI_CTL_TXNEG_MASK);
+
+	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_CTL_OFFSET);
+	nuvoton_qspi_write(qspi, val | NUVOTON_QSPI_CTL_SPIEN_MASK,
+			   NUVOTON_QSPI_CTL_OFFSET);
+
+	ret = readl_poll_timeout(qspi->regs + NUVOTON_QSPI_STATUS_OFFSET, val,
+				 (val & NUVOTON_QSPI_STATUS_SPIENSTS_MASK),
+				 1, NUVOTON_QSPI_TIMEOUT_US);
+	if (ret) {
+		dev_err(qspi->dev, "failed to enable controller\n");
+		return ret;
+	}
+
+	ret = nuvoton_qspi_reset_fifo(qspi);
+	if (ret)
+		dev_err(qspi->dev, "FIFO reset timed out\n");
+
+	return ret;
+}
+
+static bool nuvoton_qspi_mem_supports_op(struct spi_mem *mem,
+					 const struct spi_mem_op *op)
+{
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
+	if (op->cmd.buswidth > 4 || op->addr.buswidth > 4 ||
+	    op->dummy.buswidth > 4 || op->data.buswidth > 4)
+		return false;
+
+	if (op->addr.nbytes > 4)
+		return false;
+
+	return true;
+}
+
+static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
+{
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+	unsigned int cs = spi_get_chipselect(spi, 0);
+	u32 mask;
+	u32 val;
+
+	if (cs == 0)
+		mask = NUVOTON_QSPI_SSCTL_SS0_MASK;
+	else
+		mask = NUVOTON_QSPI_SSCTL_SS1_MASK;
+
+	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_SSCTL_OFFSET);
+
+	/* SPI core passes enable=true when CS is asserted (typically active-low) */
+	if (enable)
+		val |= mask;
+	else
+		val &= ~mask;
+
+	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_SSCTL_OFFSET);
+}
+
+static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
+				    const struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+	u8 addr[4];
+	int ret;
+	int i;
+
+	ret = nuvoton_qspi_setup_transfer(spi, NULL);
+	if (ret)
+		return ret;
+
+	nuvoton_qspi_set_cs(spi, true);
+
+	nuvoton_qspi_set_bus_width(qspi, op->cmd.buswidth, SPI_MEM_DATA_OUT);
+	ret = nuvoton_qspi_txrx(qspi, &op->cmd.opcode, NULL, 1);
+	if (ret)
+		goto out_deassert_cs;
+
+	if (op->addr.nbytes) {
+		for (i = 0; i < op->addr.nbytes; i++)
+			addr[i] = op->addr.val >> (8 * (op->addr.nbytes - i - 1));
+
+		nuvoton_qspi_set_bus_width(qspi, op->addr.buswidth,
+					   SPI_MEM_DATA_OUT);
+		ret = nuvoton_qspi_txrx(qspi, addr, NULL, op->addr.nbytes);
+		if (ret)
+			goto out_deassert_cs;
+	}
+
+	if (op->dummy.nbytes) {
+		nuvoton_qspi_set_bus_width(qspi, op->dummy.buswidth,
+					   SPI_MEM_DATA_OUT);
+		ret = nuvoton_qspi_txrx(qspi, NULL, NULL, op->dummy.nbytes);
+		if (ret)
+			goto out_deassert_cs;
+	}
+
+	if (op->data.nbytes) {
+		nuvoton_qspi_set_bus_width(qspi, op->data.buswidth,
+					   op->data.dir);
+		ret = nuvoton_qspi_txrx(qspi,
+					op->data.dir == SPI_MEM_DATA_OUT ?
+					op->data.buf.out : NULL,
+					op->data.dir == SPI_MEM_DATA_IN ?
+					op->data.buf.in : NULL,
+					op->data.nbytes);
+	}
+
+out_deassert_cs:
+	nuvoton_qspi_set_bus_width(qspi, 1, SPI_MEM_DATA_IN);
+	nuvoton_qspi_set_cs(spi, false);
+
+	return ret;
+}
+
+static const struct spi_controller_mem_ops nuvoton_qspi_mem_ops = {
+	.supports_op = nuvoton_qspi_mem_supports_op,
+	.exec_op = nuvoton_qspi_mem_exec_op,
+};
+
+static int nuvoton_qspi_transfer_one(struct spi_controller *ctlr,
+				     struct spi_device *spi,
+				     struct spi_transfer *xfer)
+{
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(ctlr);
+	enum spi_mem_data_dir dir = SPI_MEM_DATA_IN;
+	unsigned int buswidth = 1;
+	int ret;
+
+	ret = nuvoton_qspi_setup_transfer(spi, xfer);
+	if (ret)
+		return ret;
+
+	if (xfer->tx_buf) {
+		dir = SPI_MEM_DATA_OUT;
+		if (xfer->tx_nbits == SPI_NBITS_QUAD)
+			buswidth = 4;
+		else if (xfer->tx_nbits == SPI_NBITS_DUAL)
+			buswidth = 2;
+	} else if (xfer->rx_buf) {
+		if (xfer->rx_nbits == SPI_NBITS_QUAD)
+			buswidth = 4;
+		else if (xfer->rx_nbits == SPI_NBITS_DUAL)
+			buswidth = 2;
+	}
+
+	nuvoton_qspi_set_bus_width(qspi, buswidth, dir);
+	ret = nuvoton_qspi_txrx(qspi, xfer->tx_buf, xfer->rx_buf, xfer->len);
+	nuvoton_qspi_set_bus_width(qspi, 1, SPI_MEM_DATA_IN);
+
+	return ret;
+}
+
+static int nuvoton_qspi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spi_controller *ctlr;
+	struct nuvoton_qspi *qspi;
+	int ret;
+
+	ctlr = devm_spi_alloc_host(dev, sizeof(*qspi));
+	if (!ctlr)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ctlr);
+
+	qspi = spi_controller_get_devdata(ctlr);
+	qspi->dev = dev;
+	qspi->bits_per_word = NUVOTON_QSPI_DEFAULT_BPW;
+
+	qspi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(qspi->regs))
+		return PTR_ERR(qspi->regs);
+
+	qspi->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(qspi->clk))
+		return dev_err_probe(dev, PTR_ERR(qspi->clk),
+				     "failed to get and enable clock\n");
+
+	ctlr->num_chipselect = NUVOTON_QSPI_DEFAULT_NUM_CS;
+	ctlr->mem_ops = &nuvoton_qspi_mem_ops;
+	ctlr->set_cs = nuvoton_qspi_set_cs;
+	ctlr->transfer_one = nuvoton_qspi_transfer_one;
+	ctlr->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
+				   SPI_BPW_MASK(32);
+	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST |
+			  SPI_RX_DUAL | SPI_TX_DUAL |
+			  SPI_RX_QUAD | SPI_TX_QUAD;
+	ctlr->dev.of_node = dev->of_node;
+
+	ret = nuvoton_qspi_hw_init(qspi);
+	if (ret)
+		return ret;
+
+	ret = devm_spi_register_controller(dev, ctlr);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register spi controller\n");
+
+	return 0;
+}
+
+static const struct of_device_id nuvoton_qspi_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-qspi" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nuvoton_qspi_of_match);
+
+static struct platform_driver nuvoton_qspi_driver = {
+	.driver = {
+		.name = "ma35d1-qspi",
+		.of_match_table = nuvoton_qspi_of_match,
+	},
+	.probe = nuvoton_qspi_probe,
+};
+module_platform_driver(nuvoton_qspi_driver);
+
+MODULE_DESCRIPTION("Nuvoton MA35D1 QSPI controller driver");
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


