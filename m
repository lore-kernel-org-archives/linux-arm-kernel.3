Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E690CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYgeF6EE4HK9y1FXGURsNGn2Dslu8jTlzME3jbPfcO8=; b=z4JtWtQOfj1Gicv8zeNyydQyLv
	4VOEw/Fig6yTWctcRy6WlSHScDpZYuxaaKrh7dyoCvDG6r4FP3N8wkcG1xV99VB3W9X2U2OuOoq20
	ekWB6KWQfzOGi9ve+WKRgfo2vuBcFjfEzNKdOq4cg15fNdEheGP4cI2vWXslOFW/I7rhWd01Bn5Qg
	mAIM0g9Y1dtSeyVEJF0imUZa6Nv/wCH7k2ZfIwlkkP0GVThs8ZqHA9u5k1kHzMDLUW65dB1WI8Ure
	6nrMz3Q3VBBg96wty5dozlRfyBwoJz0CxIMRppVoloQbHC3EJrt1kfek3BmIJGnMVBJ59FNKSRew7
	J+Vy02HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwqJ-00000006djA-3vw2;
	Wed, 30 Sep 2026 16:07:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpy-00000006dUo-0mVr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LYgeF6EE4HK9y1FXGURsNGn2Dslu8jTlzME3jbPfcO8=; b=adTJo9n9mnOSlhoMJ6rw6I8cHm
	j7NLbhTfE8pPjs5x+6TpkEt+uk3QOXhu2TK7c9RmIMs9uTBxpFZE8kyexp0POhCRgWqCes0aXhIav
	MPlZNpsVJnhdfcZOlnBFaKDh7ePs4a2ZnCoQAOCzDKNoTlk4rkW/SWmK5/4oulvOLPlzsNtKFH9sc
	npc66hA8L+nXf+KFybQcxtYn2WIEavTV5y40iLpRtML0Kp7jMRgGjlIGwXsvAJi2XZGwdAFO/nkkl
	F8J9uwQYm9t85S4x9QKBUZ5aSONCyHUy9EgGIBHKWWBboL7PyN9sOmUM9PqalatHSpjybxBpwWJIm
	YOsAGncw==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwpv-0000000438N-1Bnf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LYgeF6EE4HK9y1FXGURsNGn2Dslu8jTlzME3jbPfcO8=; b=RY+5H+Dn9k7UAguo5mXsvQYEDF
	A5fTwAhuFTqU4ZWVhmcCtwiJpRLbLqmzOKudlid0KufnhzZzy4nOm4Ogb/oXG869cquE868TEWxTv
	4YRf1QBcvUqrL19byRYGzcfJIBI/hg6zfvZBNMeLbKVX/vWRUzgAYWYOPVoKmq2I6chLSnQ/mAlZz
	8ViPfdUvJ/YaN5JZqgLP5SA5zdBaEScjqSyLyAWjg1EGHGrdH0iTweSiq8Qxso5phW0Zm4s5vvJhP
	5+LyEp5mIE398vkGDv4OsUrelhnSZhtKWXYjm4bdwpYUwf6fQza81Odft/pZyigJs3BTxqUd25sNP
	ci+54k0Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwpo-009IoV-0j;
	Wed, 30 Sep 2026 16:07:08 +0000
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v17 6/6] spi: pxa2xx-pci: disable DMA and runtime autosuspend for Apple MacBook8,1
Date: Thu,  1 Oct 2026 00:06:29 +0800
Message-Id: <20260930160629.1822-7-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930160629.1822-1-fourdollars@debian.org>
References: <20260930160629.1822-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_170715_440545_E65C0D0A 
X-CRM114-Status: GOOD (  24.51  )
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

On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller at
00:15.4 (PCI ID 8086:9ce6, PCI_DEVICE_ID_INTEL_LPT1_1) registers and
allocates DMA channels successfully. However, during actual SPI
transfers, the DMA handshake synchronization fails.

This leads to continuous transfer timeouts and locks up the driver
queue, making the connected keyboard and touchpad completely dead:

[ 1582.050494] spi_master spi1: failed to transfer one message from queue
[ 1582.258387] applespi spi-APP000D:00: SPI transfer timed out
[ 1582.258498] applespi spi-APP000D:00: Error reading from device: -110

Empirical hardware register inspection reveals that the companion LPSS
DMA controller at 00:15.0 has its LPSS Private Reset Register (BAR0 +
0x204) left strictly at 0x00000000 by the EFI firmware. Even after
deasserting this reset and overriding ACPI _PRT to assign shared IRQ 21,
the DMA interrupt counter remains strictly at 0, confirming that DMA
completion interrupts are not delivered on this platform. Furthermore,
the SPI controller driver at 00:15.4 cannot safely reach across the PCI
bus to manipulate private registers of the separate DMAC function at
00:15.0 without violating driver layering.

Reverse engineering of the official OS drivers on the same hardware
corroborates that DMA is deliberately bypassed:

  1. On macOS (Big Sur), IOKit registry shows that while the LPSS DMAC
     driver (AppleIntelLpssDmac) is loaded, the allocated channel count
     (AppleIntelLpssDmacChannel) is 0 when the SPI device driver
     (AppleHSSPIHIDDriver) is active.
  2. On Windows 10 (Boot Camp), dynamic MMIO monitoring of BAR1 shows
     that the LPSS DMA control registers (offset 0x800+) remain
     inactive (all zeros) during active keyboard and touchpad
     transactions, and transfers are handled solely via the FIFO data
     registers at the beginning of BAR1.
  3. Logic board schematics confirm that a dedicated out-of-band GPIO
     interrupt line (TPAD_SPI_INT_L) is routed directly to the PCH for
     input events.

Additionally, when operating in PIO mode servicing high-frequency
keyboard and touchpad input streams operating at 60-125 Hz, the default
50 ms autosuspend delay causes the controller to repeatedly transition
between D0 and D3hot between bursts of user input. These runtime resume
transitions introduce latency spikes that drop key presses and cause
erratic touchpad motion.

Implement the forced PIO mode and runtime autosuspend lockout DMI quirk
in spi-pxa2xx-pci.c (the LPSS host controller PCI glue driver) scoped
strictly to MacBook8,1:
1. Include <linux/dmi.h> in alphabetical order for DMI system matching.
2. Add 'quirks' field in struct pxa2xx_spi_pci_config and define
   PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND.
3. Add pxa2xx_spi_pci_dmi_table matching Apple MacBook8,1 and query it
   once in lpss_spi_setup() scoped to PCI_DEVICE_ID_INTEL_LPT1_1
   (0x9ce6). When matched, log the system ident with pci_info(), set
   enable_dma = 0 as a workaround, cache PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND
   in cfg->quirks, and return immediately to skip unused DMA channel
   setup.
4. In pxa2xx_spi_pci_probe(), configure autosuspend with a 50 ms delay
   for all devices, but conditionally skip pm_runtime_allow() when
   PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND is set. This keeps the controller in
   D0 by default (as initialized by PCI core pci_pm_init()) while bound,
   eliminating D3hot resume latency spikes, while ensuring that if
   userspace explicitly enables autosuspend via sysfs, the safe 50 ms
   delay is preserved rather than defaulting to 0. Standard system
   sleep (S3) remains fully operational via pm_runtime_force_suspend().

Assisted-by: Antigravity:gemini-3.8-flash sparse
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx-pci.c | 61 +++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index f8d71362e840..f12a8ef12b17 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -7,6 +7,7 @@
  */
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -40,6 +41,8 @@
 #define LPSS_PRIV_RESETS_IDMA			BIT(2)
 #define LPSS_PRIV_REG_COUNT			9
 
+#define PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND		BIT(0)
+
 struct pxa_spi_info {
 	int (*setup)(struct pci_dev *pdev, struct pxa2xx_spi_controller *c);
 };
@@ -47,6 +50,7 @@ struct pxa_spi_info {
 struct pxa2xx_spi_pci_config {
 	struct pxa2xx_spi_controller pdata;
 	u32 lpss_priv_ctx[LPSS_PRIV_REG_COUNT];
+	u8 quirks;
 	bool is_lpt;
 };
 
@@ -106,8 +110,53 @@ static void lpss_dma_put_device(void *dma_dev)
 	pci_dev_put(dma_dev);
 }
 
+/*
+ * Apple MacBook8,1 (early 2015 12" MacBook):
+ *
+ * The LPSS SPI controller at 00:15.4 connects to the internal SPI keyboard
+ * and touchpad (applespi). When DMA mode is enabled, DMA transfers consistently
+ * time out (-110) because DMA completion interrupts are never delivered.
+ *
+ * Empirical hardware inspection and OS analysis show that:
+ * 1. Hardware/firmware configuration: EFI leaves companion LPSS DMA (00:15.0)
+ *    held in reset (LPSS_PRIV_RESETS == 0x0 / BAR0 + 0x204). Even after
+ *    deasserting the reset and overriding ACPI _PRT to assign shared IRQ 21,
+ *    the DMA interrupt counter remains strictly 0, confirming that DMA
+ *    completion interrupts are not delivered on this platform.
+ * 2. Operating system parity: Both macOS (AppleIntelLpssDmac channel count
+ *    is 0) and Windows 10 Boot Camp bypass DMA and handle keyboard/touchpad
+ *    transactions strictly in PIO mode via FIFO registers.
+ * 3. Layering: The SPI controller driver (00:15.4) cannot safely reconfigure
+ *    the private registers of the separate DMAC PCI function (00:15.0).
+ * 4. Runtime autosuspend: In PIO mode servicing 60-125 Hz input events, the
+ *    default 50 ms autosuspend delay introduces D3hot <-> D0 transition
+ *    latency spikes that drop key presses and cause erratic touchpad motion.
+ *
+ * Therefore, as a workaround, disable DMA channel allocation to force PIO mode
+ * and keep the device in D0 without enabling runtime autosuspend.
+ */
+static const struct dmi_system_id pxa2xx_spi_pci_dmi_table[] = {
+	{
+		.ident = "Apple MacBook8,1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBook8,1"),
+		},
+	},
+	{ }
+};
+
+static const struct dmi_system_id *pxa2xx_spi_pci_get_dmi_id(struct pci_dev *dev)
+{
+	if (dev->device == PCI_DEVICE_ID_INTEL_LPT1_1)
+		return dmi_first_match(pxa2xx_spi_pci_dmi_table);
+
+	return NULL;
+}
+
 static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 {
+	const struct dmi_system_id *dmi_id;
 	struct pxa2xx_spi_pci_config *cfg = container_of(c, struct pxa2xx_spi_pci_config, pdata);
 	struct ssp_device *ssp = &c->ssp;
 	struct dw_dma_slave *tx, *rx;
@@ -165,6 +214,14 @@ static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 	if (ret)
 		return ret;
 
+	dmi_id = pxa2xx_spi_pci_get_dmi_id(dev);
+	if (dmi_id) {
+		pci_info(dev, "%s detected: disabling DMA to force PIO mode\n", dmi_id->ident);
+		c->enable_dma = 0;
+		cfg->quirks |= PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND;
+		return 0;
+	}
+
 	dma_dev = pci_get_slot(dev->bus, PCI_DEVFN(PCI_SLOT(dev->devfn), 0));
 	ret = devm_add_action_or_reset(&dev->dev, lpss_dma_put_device, dma_dev);
 	if (ret)
@@ -446,7 +503,9 @@ static int pxa2xx_spi_pci_probe(struct pci_dev *dev,
 	pm_runtime_set_autosuspend_delay(&dev->dev, 50);
 	pm_runtime_use_autosuspend(&dev->dev);
 	pm_runtime_put_autosuspend(&dev->dev);
-	pm_runtime_allow(&dev->dev);
+
+	if (!(cfg->quirks & PXA2XX_SPI_QUIRK_NO_AUTOSUSPEND))
+		pm_runtime_allow(&dev->dev);
 
 	return 0;
 }
-- 
2.39.5


