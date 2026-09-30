Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD84CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 16:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgFvgtep6pV4jOhS6T6V7f+YjEM/TwU2OLrH6PudRcE=; b=wzn3Clh5Dq5ArqXcdxFqz5O1Y6
	1X2vtbm4xG+oNQueoC43E1sBJbn7O461D3Kn/BV4LUg6APKjccI1M+epzqXQFj3mIKYhhFKnXu88z
	6QWiYvrPVkDEK9JsMW1k9OIGOVEGkKTNMWxWVrI1iescEWAIGojX8WouiI8fBCVHUWLYrP1AKyPuN
	QOMetG90+Wn9C528GA1ErWWh+QDpG4zTjR1AjikR+X+n/pfL0o3Fy3Ti2PZy+K0e87Tqy1t39/Fj6
	z+k3rWWZPHB1jXr5+iWdzBCxt+4ikGxPb6oTkfcW8BuYqyvZCsjMh0c5TfRWFuXQtw9N8BMBSLhII
	luhzQuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwqE-00000006ddn-0vyh;
	Wed, 30 Sep 2026 16:07:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwpt-00000006dTQ-3soH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 16:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VgFvgtep6pV4jOhS6T6V7f+YjEM/TwU2OLrH6PudRcE=; b=QciMKdA6TgczdVUEavyi8MSlyX
	pZ634NYFu8gL6a6XwJtG5buX4IUai2EcIxJq2/0CtipTXc/SbpGeEL+rtIBKrtWBRESGFPK8koJi2
	AQREozqY8t3f0K4OpjBSn4288IZuP9etu7Cq0+Z927c87KB6bOlE3RcD9qtAfMaDSBCoAPlGbdqkg
	yRGHdSCc4ENHGk3KKQ0ateLUlqXW4n2d2vEhXVBJ4klgRhX82qPPa6qxScxUhDo8to2MIvJITkLQK
	odnbHSb6799JLcCtLk9MRi4Ie8rSHV/NhK2zWfJlr7suHFwuUXeZKnNACL1lmu0HCYoWhRJXBNsOp
	ABLz7CFw==;
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwpq-0000000436o-48lx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 16:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VgFvgtep6pV4jOhS6T6V7f+YjEM/TwU2OLrH6PudRcE=; b=QRy4gjYAIyPebTmoSJz/DoEG3z
	LWc/cfhYZ/dU0421ek7DlJaHZ7F+Iyld33tYrU7Y12D+i0Ilh7BQB0CD8zDpwFiKaGHR9qQMkNe9O
	IhyNlYjCTeyl836jH7NCGo2eMzEJrlEmFvwq8Zvp7NZzsd3U8DVJh+FekH6NUTTWXAaKM1btSt+sE
	8AaQzSC/R3a8F/OL+pcrfecJb2PHmFPdmXbIVEJDmz1NMWYwZH1Bq6Lyc+lZDReBM/lvKO4N4uk5s
	yJMJ4xXAo/V7pDAXxDTUMLi2lDUkWL9jbvuZsnCq8yZAAv2vBQ8Tz8SPrdjETkJFCHavFPETlzBci
	UfCB0PMg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <fourdollars@debian.org>)
	id 1xBwpk-009IoV-1o;
	Wed, 30 Sep 2026 16:07:05 +0000
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
Subject: [PATCH v17 5/6] spi: pxa2xx-pci: restore LPSS private register state across S3 resume
Date: Thu,  1 Oct 2026 00:06:28 +0800
Message-Id: <20260930160629.1822-6-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930160629.1822-1-fourdollars@debian.org>
References: <20260930160629.1822-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: fourdollars
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_170711_220497_49822F45 
X-CRM114-Status: GOOD (  29.16  )
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

On platforms where Intel LPSS SPI is enumerated as a bare PCI device
(such as the Apple MacBook8,1 on Lynxpoint-LP), the LPSS power island
loses power during system sleep and powers up with the controller held
in reset. Because the device lacks ACPI companion objects or MFD
binding, neither drivers/acpi/x86/lpss.c nor drivers/mfd/intel-lpss.c
restore the private register context across S3 resume.

This causes memory-mapped I/O reads on resume to return ~0, resulting
in PCIe Completion Timeouts, missing interrupts, and dead
keyboard/touchpad.

Restore LPSS private registers and deassert functional, APB, and iDMA
resets in the PCI glue layer:
1. In suspend, quiesce the controller queue via spi_controller_suspend()
   so no transfers remain in flight and chip select is deasserted.
   Then save the LPSS private registers (LPSS_PRIV_REG_COUNT 9 covering
   up to offset 0x20 including reg_cs_ctrl at 0x18). Ensure the clock is
   active for reading MMIO registers using pm_runtime_resume_and_get(),
   balanced by pm_runtime_put_noidle(), before calling
   pm_runtime_force_suspend().
2. In resume, restore LPSS private registers and deassert functional,
   APB, and iDMA resets via pxa2xx_spi_pci_lpss_restore_ctx() before
   calling pm_runtime_force_resume(). Because the controller clock
   remains gated (clk_enabled is false) during this restoration, any
   interrupt arriving on a shared line bails out early in ssp_int()
   without accessing registers on a controller held in reset. Once
   resets are deasserted and private registers are restored, call
   pm_runtime_force_resume() to enable the clock and mark the device
   active, and restart the queue with spi_controller_resume().
3. In probe, call pci_d3cold_disable() for Lynxpoint-LP (is_lpt) to
   ensure the PCI device cannot enter D3cold during runtime PM,
   guaranteeing that LPSS private registers are retained during S0 idle
   periods and only require restoration across S3 system sleep. Set
   DPM_FLAG_NO_DIRECT_COMPLETE to prevent PCI subsystem direct-complete
   bypassing system sleep callbacks.
4. Scope LPSS context restoration specifically to Lynxpoint-LP
   (PCI_DEVICE_ID_INTEL_LPT*) devices to avoid perturbing other LPSS
   PCI platforms (BYT, BSW) or non-LPSS platforms.

Export lpss_ssp_setup() and core runtime PM ops so the PCI glue layer
can invoke them around private register restoration.

Assisted-by: Antigravity:gemini-3.8-flash sparse
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx-pci.c | 151 ++++++++++++++++++++++++++++++++++-
 drivers/spi/spi-pxa2xx.c     |   9 ++-
 drivers/spi/spi-pxa2xx.h     |   4 +
 3 files changed, 157 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index cae77ac18520..f8d71362e840 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -12,6 +12,7 @@
 #include <linux/pci.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/spi/spi.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -33,10 +34,22 @@
 #define PCI_DEVICE_ID_INTEL_LPT1_0		0x9ce5
 #define PCI_DEVICE_ID_INTEL_LPT1_1		0x9ce6
 
+#define LPSS_PRIV_RESETS			0x04
+#define LPSS_PRIV_RESETS_FUNC			BIT(0)
+#define LPSS_PRIV_RESETS_APB			BIT(1)
+#define LPSS_PRIV_RESETS_IDMA			BIT(2)
+#define LPSS_PRIV_REG_COUNT			9
+
 struct pxa_spi_info {
 	int (*setup)(struct pci_dev *pdev, struct pxa2xx_spi_controller *c);
 };
 
+struct pxa2xx_spi_pci_config {
+	struct pxa2xx_spi_controller pdata;
+	u32 lpss_priv_ctx[LPSS_PRIV_REG_COUNT];
+	bool is_lpt;
+};
+
 static struct dw_dma_slave byt_tx_param = { .dst_id = 0 };
 static struct dw_dma_slave byt_rx_param = { .src_id = 1 };
 
@@ -95,6 +108,7 @@ static void lpss_dma_put_device(void *dma_dev)
 
 static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 {
+	struct pxa2xx_spi_pci_config *cfg = container_of(c, struct pxa2xx_spi_pci_config, pdata);
 	struct ssp_device *ssp = &c->ssp;
 	struct dw_dma_slave *tx, *rx;
 	struct pci_dev *dma_dev;
@@ -131,6 +145,7 @@ static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 		ssp->port_id = 0;
 		c->tx_param = &lpt0_tx_param;
 		c->rx_param = &lpt0_rx_param;
+		cfg->is_lpt = true;
 		break;
 	case PCI_DEVICE_ID_INTEL_LPT0_1:
 	case PCI_DEVICE_ID_INTEL_LPT1_1:
@@ -138,6 +153,7 @@ static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 		ssp->port_id = 1;
 		c->tx_param = &lpt1_tx_param;
 		c->rx_param = &lpt1_rx_param;
+		cfg->is_lpt = true;
 		break;
 	default:
 		return -ENODEV;
@@ -261,22 +277,143 @@ static const struct pxa_spi_info qrk_info_config = {
 	.setup = qrk_spi_setup,
 };
 
+static void pxa2xx_spi_pci_lpss_save_ctx(struct device *dev)
+{
+	struct driver_data *drv_data = dev_get_drvdata(dev);
+	struct pxa2xx_spi_pci_config *cfg;
+	unsigned int i;
+
+	if (!drv_data || !drv_data->controller_info)
+		return;
+
+	cfg = container_of(drv_data->controller_info,
+			   struct pxa2xx_spi_pci_config, pdata);
+
+	if (cfg->is_lpt && drv_data->lpss_base) {
+		for (i = 0; i < LPSS_PRIV_REG_COUNT; i++)
+			cfg->lpss_priv_ctx[i] = readl(drv_data->lpss_base + i * 4);
+	}
+}
+
+static void pxa2xx_spi_pci_lpss_restore_ctx(struct device *dev)
+{
+	struct driver_data *drv_data = dev_get_drvdata(dev);
+	struct pxa2xx_spi_pci_config *cfg;
+	unsigned int i;
+	u32 resets;
+
+	if (!drv_data || !drv_data->controller_info)
+		return;
+
+	cfg = container_of(drv_data->controller_info,
+			   struct pxa2xx_spi_pci_config, pdata);
+
+	if (cfg->is_lpt && drv_data->lpss_base) {
+		/*
+		 * Deassert functional, APB, and iDMA resets, preserving any
+		 * platform-specific bits in LPSS_PRIV_RESETS.
+		 */
+		resets = cfg->lpss_priv_ctx[LPSS_PRIV_RESETS / 4] |
+			 LPSS_PRIV_RESETS_FUNC | LPSS_PRIV_RESETS_APB |
+			 LPSS_PRIV_RESETS_IDMA;
+		writel(resets, drv_data->lpss_base + LPSS_PRIV_RESETS);
+
+		for (i = 0; i < LPSS_PRIV_REG_COUNT; i++) {
+			if (i == LPSS_PRIV_RESETS / 4)
+				continue;
+			writel(cfg->lpss_priv_ctx[i], drv_data->lpss_base + i * 4);
+		}
+
+		/*
+		 * Program chip select to deasserted state before resuming the
+		 * controller queue, preventing races with the message pump kthread.
+		 */
+		lpss_ssp_setup(drv_data);
+	}
+}
+
+static int pxa2xx_spi_pci_suspend(struct device *dev)
+{
+	struct driver_data *drv_data = dev_get_drvdata(dev);
+	struct pxa2xx_spi_pci_config *cfg;
+	int ret;
+
+	if (!drv_data || !drv_data->controller_info)
+		return 0;
+
+	cfg = container_of(drv_data->controller_info,
+			   struct pxa2xx_spi_pci_config, pdata);
+
+	ret = spi_controller_suspend(drv_data->controller);
+	if (ret)
+		return ret;
+
+	if (cfg->is_lpt) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0) {
+			spi_controller_resume(drv_data->controller);
+			return ret;
+		}
+
+		pxa2xx_spi_pci_lpss_save_ctx(dev);
+		pm_runtime_put_noidle(dev);
+	}
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		spi_controller_resume(drv_data->controller);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int pxa2xx_spi_pci_resume(struct device *dev)
+{
+	struct driver_data *drv_data = dev_get_drvdata(dev);
+	struct pxa2xx_spi_pci_config *cfg;
+	int ret;
+
+	if (!drv_data || !drv_data->controller_info)
+		return 0;
+
+	cfg = container_of(drv_data->controller_info,
+			   struct pxa2xx_spi_pci_config, pdata);
+
+	if (cfg->is_lpt)
+		pxa2xx_spi_pci_lpss_restore_ctx(dev);
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	return spi_controller_resume(drv_data->controller);
+}
+
+static const struct dev_pm_ops pxa2xx_spi_pci_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(pxa2xx_spi_pci_suspend, pxa2xx_spi_pci_resume)
+	RUNTIME_PM_OPS(pxa2xx_spi_runtime_suspend, pxa2xx_spi_runtime_resume, NULL)
+};
+
 static int pxa2xx_spi_pci_probe(struct pci_dev *dev,
 		const struct pci_device_id *ent)
 {
 	const struct pxa_spi_info *info;
-	int ret;
+	struct pxa2xx_spi_pci_config *cfg;
 	struct pxa2xx_spi_controller *pdata;
 	struct ssp_device *ssp;
+	int ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret)
 		return ret;
 
-	pdata = devm_kzalloc(&dev->dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
+	cfg = devm_kzalloc(&dev->dev, sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
 		return -ENOMEM;
 
+	pdata = &cfg->pdata;
+
 	ssp = &pdata->ssp;
 	ssp->dev = &dev->dev;
 	ssp->phys_base = pci_resource_start(dev, 0);
@@ -300,6 +437,12 @@ static int pxa2xx_spi_pci_probe(struct pci_dev *dev,
 	if (ret)
 		return ret;
 
+	if (cfg->is_lpt) {
+		pci_d3cold_disable(dev);
+		dev_pm_set_driver_flags(&dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
+		pxa2xx_spi_pci_lpss_save_ctx(&dev->dev);
+	}
+
 	pm_runtime_set_autosuspend_delay(&dev->dev, 50);
 	pm_runtime_use_autosuspend(&dev->dev);
 	pm_runtime_put_autosuspend(&dev->dev);
@@ -336,7 +479,7 @@ static struct pci_driver pxa2xx_spi_pci_driver = {
 	.name           = "pxa2xx_spi_pci",
 	.id_table       = pxa2xx_spi_pci_devices,
 	.driver = {
-		.pm	= pm_ptr(&pxa2xx_spi_pm_ops),
+		.pm	= pm_ptr(&pxa2xx_spi_pci_pm_ops),
 	},
 	.probe          = pxa2xx_spi_pci_probe,
 	.remove         = pxa2xx_spi_pci_remove,
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 2a3fa9ca7213..56ddfa67708e 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -343,7 +343,7 @@ static bool __lpss_ssp_update_priv(struct driver_data *drv_data, unsigned int of
  * Perform LPSS SSP specific setup. This function must be called first if
  * one is going to use LPSS SSP private registers.
  */
-static void lpss_ssp_setup(struct driver_data *drv_data)
+void lpss_ssp_setup(struct driver_data *drv_data)
 {
 	const struct lpss_config *config;
 	u32 value;
@@ -365,6 +365,7 @@ static void lpss_ssp_setup(struct driver_data *drv_data)
 		}
 	}
 }
+EXPORT_SYMBOL_NS_GPL(lpss_ssp_setup, "SPI_PXA2xx");
 
 static void lpss_ssp_select_cs(struct spi_device *spi,
 			       const struct lpss_config *config)
@@ -1563,7 +1564,7 @@ static int pxa2xx_spi_resume(struct device *dev)
 	return spi_controller_resume(drv_data->controller);
 }
 
-static int pxa2xx_spi_runtime_suspend(struct device *dev)
+int pxa2xx_spi_runtime_suspend(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
@@ -1579,13 +1580,15 @@ static int pxa2xx_spi_runtime_suspend(struct device *dev)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_runtime_suspend, "SPI_PXA2xx");
 
-static int pxa2xx_spi_runtime_resume(struct device *dev)
+int pxa2xx_spi_runtime_resume(struct device *dev)
 {
 	struct driver_data *drv_data = dev_get_drvdata(dev);
 
 	return pxa2xx_spi_clk_enable(drv_data);
 }
+EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_runtime_resume, "SPI_PXA2xx");
 
 EXPORT_NS_GPL_DEV_PM_OPS(pxa2xx_spi_pm_ops, SPI_PXA2xx) = {
 	SYSTEM_SLEEP_PM_OPS(pxa2xx_spi_suspend, pxa2xx_spi_resume)
diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index 3352239f74a0..a31022256202 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -138,6 +138,10 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 		     struct pxa2xx_spi_controller *platform_info);
 void pxa2xx_spi_remove(struct device *dev);
 
+void lpss_ssp_setup(struct driver_data *drv_data);
+int pxa2xx_spi_runtime_suspend(struct device *dev);
+int pxa2xx_spi_runtime_resume(struct device *dev);
+
 extern const struct dev_pm_ops pxa2xx_spi_pm_ops;
 
 #endif /* SPI_PXA2XX_H */
-- 
2.39.5


