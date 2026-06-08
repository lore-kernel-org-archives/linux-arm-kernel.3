Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB11FCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5vlAed6ekw6trVzaMQpkscUoZVvZa9XiEglZZfEY7o=; b=qGa8jgNMzS4HlAnr4qdLTqCflz
	sMUg5TLEfx8j1/GzIKZ2z9Lv9z7+0umA1fsTw1k6jganXNMX60Lii6Om4MkNi2MyHo959Y/2Dr/KT
	ERsqqa6Gm7y7EDVxTmDePzg6hbMH+wIWvE5SpvH9vBF1foU63wnYsGON1AIUJVeO13ieZkmUqCOkS
	mfUUqEZSL9ief8PbLn6Rg2B5BOXphretFhkQ2Jd+UAY0BjWK4bkOIY63y+tspxxXzgYZdDemFXGbn
	AwarrdjDbb25XjH/KzSKEhoKy+wvokcacXCcY+yAnwQ/I9Un22vtfVPJdPBiyqQFhuL8KFBj3AYcu
	Ue8mf5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQ4O-00000002kEK-108x;
	Mon, 08 Jun 2026 02:50:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWQ4L-00000002kD6-0Ra8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:50:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0c35980fdso38491835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780887028; x=1781491828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5vlAed6ekw6trVzaMQpkscUoZVvZa9XiEglZZfEY7o=;
        b=PTp3VNtZk0oz8OiN6TFDj7mVSrgEtr7/DFw/I0CDfrJCo6RCmXg+cuRj4PEJqhwEiC
         4tRjYpvFcilzV4wA7rO4ttyKqE96++4R0QhHeds8dCMYmkFWpgHEyqapW/Brqwpvbpt6
         xCw7qZt9qeCgvpryIlA9/5cmPjLFmbwWkgUaJtIo7XnOCxrFcZmhZerCs7NFXCg+fOdf
         nDq0xOpK7rAULZS8qZQrTvZHHyRo4zduf/DfBU07gVhcYa7Qe57KXo1EVA7lh4gJxfLt
         381Gj/ljvzhG44KJNBcKXXmwgmOBRs1EKB/49TcviYXCOXJ5yvy1o7U0EeS9UtwHA/Uj
         Ujxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887028; x=1781491828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5vlAed6ekw6trVzaMQpkscUoZVvZa9XiEglZZfEY7o=;
        b=Rj3fqhV4YnmdbypAxejmVBNa/fc6vlOi8r25dxOcRCiaOBzNmldQryE+uxWlygNmPv
         OItu6HynPkT1wpWEfknd+SJH0KKGVviDOVCmwfyK5Hi4UifKaT8sVvlHVN/FWqxL4U1p
         ZpKYDgFgZbxjeOTWCZvLBxrwpFM0OSclsaPN2tH1vYG59JDe8S5BB8WD3A1Cu9HYCw77
         6ftBQ+8yig+z+/0v4Jfg0Yj1+22B8zFKJZo0FZvhQ1Tk4i1GRG0j9C3dqpM0tci1Vhvw
         sGxBMx/QxX9uh1RHiJzmehoK8iz31sVrIxd6EiYdQPwvM3QR+RZI0/AHS00Nea/B1m3F
         P+fg==
X-Gm-Message-State: AOJu0YzsXii+AabiRu3FClEuWhArUkzsxd/l7wOAYTjVT406CBu57/H4
	Vf1hQxeLLaDFlsmBsXpCnMkuq+qHd5YjSo59ZM8VWd+XPUkcQomBxQ/+y6m/DQ==
X-Gm-Gg: Acq92OHa6ExIc0q2nVaHn6YhQI0yZpQuqa4SE07QarIj0qZraehoCodlYnPWkXZauVL
	og5QG2/3Py9nQBL11mu7NxOHExbKJ5bDSOlIkumgxRjpS9ml1wMv67+iepl8aDLuP6qesDm+ERj
	hxUiTfT2mQEavjGrNtjmL79qfY5aHJI+X0pRFwItcQMpkqS5pe46XjzyoUaI3eOeJsEUTlvB0X0
	GZMBy3QrU3l89QnAom1eSV0lfhruxXcL3WtbaRuE8jiQW26GjwS/kzdwZNKc7qI5UoRxdMQLeCr
	zmZw7t1DN4QiyuvF8rZNCB5mCaiDvF00ZlwM6MDnNOjQqfO38os27gzHmrS6vYqrBLEciNxGOX9
	m1jgI2VCb/TY7/zdcYqmVKiUWxAjr6Yn6bLWR0yAsJj+X3b42Rb0Y1AlHSbBoEykfi94cayRNTW
	NkISkSjq3VmJPK9S7LBogF4zNHoVbrhBkPr+NGfGRUnXA3UVdeS0ZtZ5CIBw0IU3CPKfA7iQE9P
	gajZPA5VgHT+wg9azY=
X-Received: by 2002:a17:903:2a84:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c1e85c5022mr157552485ad.31.1780887028128;
        Sun, 07 Jun 2026 19:50:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d211sm165745555ad.3.2026.06.07.19.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:50:27 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
X-Google-Original-From: Chi-Wen Weng <cwweng@nuvoton.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: [PATCH v2 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI controller support
Date: Mon,  8 Jun 2026 10:50:09 +0800
Message-Id: <20260608025009.1504971-3-cwweng@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260608025009.1504971-1-cwweng@nuvoton.com>
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_195029_179424_26AF09C0 
X-CRM114-Status: GOOD (  25.18  )
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

Add SPI controller driver support for the Nuvoton MA35D1 Quad SPI
controller.

The controller supports standard SPI transfers and spi-mem operations
for SPI memory devices such as SPI NOR and SPI NAND flashes. The driver
supports single, dual and quad I/O modes and uses a conservative
word-by-word PIO transfer path for the initial upstream version.

The driver also handles controller reset, clock divider programming,
chip-select control, transfer mode setup and spi-mem command/address/
dummy/data phases.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/spi/Kconfig           |  10 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ma35d1-qspi.c | 622 ++++++++++++++++++++++++++++++++++
 3 files changed, 633 insertions(+)
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index b563f49e2197..8b8297ee3f2e 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -694,6 +694,16 @@ config SPI_LJCA
 	  This driver can also be built as a module. If so, the module
 	  will be called spi-ljca.
 
+config SPI_MA35D1_QSPI
+	tristate "Nuvoton MA35D1 QSPI controller"
+	depends on ARCH_MA35 || COMPILE_TEST
+	help
+	  This enables support for the Quad SPI controller found in
+	  Nuvoton MA35D1 SoCs.
+
+	  The controller supports SPI memory devices such as SPI NOR and
+	  SPI NAND flashes in single, dual and quad I/O modes.
+
 config SPI_MESON_SPICC
 	tristate "Amlogic Meson SPICC controller"
 	depends on COMMON_CLK
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 9d36190a9884..c5bb0efd108c 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_SPI_LOONGSON_CORE)		+= spi-loongson-core.o
 obj-$(CONFIG_SPI_LOONGSON_PCI)		+= spi-loongson-pci.o
 obj-$(CONFIG_SPI_LOONGSON_PLATFORM)	+= spi-loongson-plat.o
 obj-$(CONFIG_SPI_LP8841_RTC)		+= spi-lp8841-rtc.o
+obj-$(CONFIG_SPI_MA35D1_QSPI)		+= spi-ma35d1-qspi.o
 obj-$(CONFIG_SPI_MESON_SPICC)		+= spi-meson-spicc.o
 obj-$(CONFIG_SPI_MESON_SPIFC)		+= spi-meson-spifc.o
 obj-$(CONFIG_SPI_MICROCHIP_CORE_QSPI)	+= spi-microchip-core-qspi.o
diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
new file mode 100644
index 000000000000..93b60b6142e5
--- /dev/null
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -0,0 +1,622 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Nuvoton MA35D1 QSPI controller driver
+//
+// Copyright (c) 2026 Nuvoton Technology Corp.
+// Author: Chi-Wen Weng <cwweng@nuvoton.com>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
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
+				       u32 speed_hz, u8 bpw)
+{
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+	u32 mode = spi->mode & SPI_MODE_X_MASK;
+	u32 ctl = 0;
+	int ret;
+
+	if (!speed_hz)
+		speed_hz = spi->max_speed_hz;
+
+	if (!bpw)
+		bpw = NUVOTON_QSPI_DEFAULT_BPW;
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
+		ret = nuvoton_qspi_wait_rx_not_empty(qspi);
+		if (ret) {
+			dev_err(qspi->dev, "RX FIFO empty timeout\n");
+			return ret;
+		}
+
+		val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_RX_OFFSET);
+		if (rxbuf)
+			nuvoton_qspi_rx_word(rxbuf, i, val, qspi->bits_per_word);
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
+	if (op->cmd.nbytes != 1)
+		return false;
+
+	if (op->addr.nbytes > 4)
+		return false;
+
+	return true;
+}
+
+static void nuvoton_qspi_set_cs_level(struct nuvoton_qspi *qspi,
+				      unsigned int cs, bool assert)
+{
+	u32 mask;
+	u32 val;
+
+	switch (cs) {
+	case 0:
+		mask = NUVOTON_QSPI_SSCTL_SS0_MASK;
+		break;
+	case 1:
+		mask = NUVOTON_QSPI_SSCTL_SS1_MASK;
+		break;
+	default:
+		dev_warn(qspi->dev, "invalid chip select %u\n", cs);
+		return;
+	}
+
+	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_SSCTL_OFFSET);
+
+	if (assert)
+		val |= mask;
+	else
+		val &= ~mask;
+
+	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_SSCTL_OFFSET);
+}
+
+static void nuvoton_qspi_set_cs(struct spi_device *spi, bool enable)
+{
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+
+	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), enable);
+}
+
+static void nuvoton_qspi_mem_set_cs(struct spi_device *spi, bool enable)
+{
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+	bool assert = enable;
+
+	if (spi->mode & SPI_CS_HIGH)
+		assert = !assert;
+
+	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), assert);
+}
+
+static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
+				    const struct spi_mem_op *op)
+{
+	struct spi_device *spi = mem->spi;
+	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
+	u8 opcode = op->cmd.opcode;
+	u8 addr[4];
+	int ret;
+	int i;
+
+	ret = nuvoton_qspi_setup_transfer(spi, op->max_freq, NUVOTON_QSPI_DEFAULT_BPW);
+	if (ret)
+		return ret;
+
+	nuvoton_qspi_mem_set_cs(spi, true);
+
+	nuvoton_qspi_set_bus_width(qspi, op->cmd.buswidth, SPI_MEM_DATA_OUT);
+	ret = nuvoton_qspi_txrx(qspi, &opcode, NULL, 1);
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
+					   SPI_MEM_DATA_IN);
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
+	nuvoton_qspi_mem_set_cs(spi, false);
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
+	ret = nuvoton_qspi_setup_transfer(spi, xfer->speed_hz, xfer->bits_per_word);
+	if (ret)
+		return ret;
+
+	if (xfer->tx_buf && xfer->rx_buf) {
+		if (xfer->tx_nbits != SPI_NBITS_SINGLE ||
+		    xfer->rx_nbits != SPI_NBITS_SINGLE)
+			return -EOPNOTSUPP;
+	}
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
+	struct reset_control *rst;
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
+	rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to get reset\n");
+
+	qspi->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(qspi->clk))
+		return dev_err_probe(dev, PTR_ERR(qspi->clk),
+				     "failed to get and enable clock\n");
+
+	ret = reset_control_assert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	udelay(2);
+
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset\n");
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
+		return dev_err_probe(dev, ret,
+				     "failed to register spi controller\n");
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


