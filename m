Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRFub8kSA/fS8InEMuVJNmE6mYQvQVfDODAvVSAOiMA=; b=nIvVS9ThTNr5pnh2oQrpkTUud/
	cCaGUqoafJVbtxXduI6EfRdSUWWlz57T/0PtijSK0jue4taIBLYlLTIGqG9qhHSS16dWC7TPWFz7u
	2O41TWZHlwBomR//GTuYnxLGxJGhjxJg0+Ai6JCjOUg7mu0i2LleU2ocXGKV+M9iNMYhKH9amXlSl
	dQDmi/R3SUwD3gdTTY41xFCVxXbvYuM1h+06/VXRZ/L8qz0EPS2XB+gocbyOUEHL+7MDrj96QEpRC
	cnZ2Y2jESE2hvSZm3sVrmYCfFV5c8Hov1utfg61lei3IYpY8AfdO1xWpQ+6lByJXO8tEjX8nKOca9
	sHNyBe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDk-00000006VSQ-2RXI;
	Sat, 11 Jul 2026 11:50:12 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiWDf-00000006VPm-0EaK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 11:50:08 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1810705a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 04:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783770606; x=1784375406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRFub8kSA/fS8InEMuVJNmE6mYQvQVfDODAvVSAOiMA=;
        b=PkDud+SUXLz4f+xlISg50KTfPmqohL2df/RT4phPpOuMYI1P2YZ7bOt8TpWDFo8HFU
         C/EjYEdQkS6zPiSbxjYrND1twciGXVIVqnN3i6+xEMFfmNU3Q1x/l8teDtF/9vVMPiAf
         j6HATTqy1N3lTuAtwr8K9Hw+6EmvCpNr44MyPS4BBgDdLlJL1TH2lC8jp0VflSHPgasE
         hPK7FPBGWuilKb1oooV6JAU3q37mhSQXT9VRApBGo2L2Lv52JIp1Wsit2o2uYhKs/q6q
         7ikfD9SXPkx46uPI7kvIe4lIHy59u8PXIK0sExD6Yk+zcZUobI+PrMHFCMROuC/+QMN4
         mDPA==
X-Forwarded-Encrypted: i=1; AHgh+RqEXs/2glpz9rTVkIp8SJMmhyLUDc+3gjI1ijKIhvb4SxAFr6qx06ThZc8krw+ATDgNzMTT0TdoNosjs86iS+Aj@lists.infradead.org
X-Gm-Message-State: AOJu0YyUhqSoznI5juL8Rgaj71o+k5dzwZ270S7e8oXcn+53ybo0aLVO
	XiaUE2K5FYhPg0tHIysyPV8U8nkSwiua0fCIqk9zuDUTimMm4I70f3w=
X-Gm-Gg: AfdE7cn547ItPG4pF6EcV/gEQSQXTw0W49tVV3ISTOnYON/PupJgrrEz9kFkixxgNLq
	cJlSnxXCdSj5NOFDI7SKS5rciFkNpp4ZtM9I15YTKfu96zsI98W2QHFuAv9l5uUU5GRpvsP+iJo
	w++wHTCvhMQOFY/GkEYqE2cFQRHXP5EVhm9WH+dhk4EUWiAqsvzSTnF6n3VwiLhHpYPoCGg+GUk
	EWw2QIfEd2QdiWbnuuX3dFwwSqlT0yKV1DUiXWmRz1a0lwgBB2GHGOIYyJIrmOTG2rwXPHByTje
	6SX1uDbFIyTki/Y4j15q8BABFb+Wfg/XbPbhGzjAly6WfF7LhkoyZDRD5AYg/tWMGXj8lWH2gib
	ZuMoR/C/naVYrSQXAVc6FHqzSi3mD3lPAe27WMtCVW9vF93sSDylnGTEU1ZjYolYatBuCSMnmhI
	swynq07qZ0E6licl+fwkREWq2E++NGCATtlb6I/SjKxK7ZS0TfPpGZNQqjiJyTZwhiQ1sPYoLno
	xvpIpeU9mtG6rPOjWytn0HOCQ==
X-Received: by 2002:a17:90b:3806:b0:384:5dbc:cba5 with SMTP id 98e67ed59e1d1-38dc777c6d4mr2735418a91.26.1783770606205;
        Sat, 11 Jul 2026 04:50:06 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b48bsm3957570a91.1.2026.07.11.04.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:50:05 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Shih-Yuan Lee <fourdollars@debian.org>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] spi: pxa2xx: disable DMA for Apple MacBook8,1
Date: Sat, 11 Jul 2026 19:49:37 +0800
Message-Id: <20260711114937.16670-4-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260711114937.16670-1-fourdollars@debian.org>
References: <20260711055247.5412-1-fourdollars@debian.org>
 <20260711114937.16670-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_045007_105331_8EA74464 
X-CRM114-Status: GOOD (  17.17  )
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

On MacBook8,1 (early 2015 12" MacBook), the LPSS SPI controller's DMA
handshake and interrupt routing frequently fail or time out on boot,
causing the keyboard and trackpad to become unresponsive.

Avoid this architectural bug by disabling DMA and forcing the SPI
controller to use PIO mode. Move this platform/motherboard-level quirk
to the SPI host controller driver (spi-pxa2xx-pci.c) where LPSS setup
occurs, preventing layering violations, TOCTOU races, or execute-after-free
bugs in the client driver.

Additionally, introduce a `force_pio` module parameter in the PCI
host controller driver to allow other users to force PIO mode for
debugging.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=108331
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx-pci.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index cae77ac18520..96bbc7a7c381 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -18,9 +18,14 @@
 
 #include <linux/dmaengine.h>
 #include <linux/platform_data/dma-dw.h>
+#include <linux/dmi.h>
 
 #include "spi-pxa2xx.h"
 
+static bool spi_pxa2xx_force_pio;
+module_param_named(force_pio, spi_pxa2xx_force_pio, bool, 0444);
+MODULE_PARM_DESC(force_pio, "Force PIO mode (disables DMA) for SPI transfers. ([0] = disabled, 1 = enabled)");
+
 #define PCI_DEVICE_ID_INTEL_QUARK_X1000		0x0935
 #define PCI_DEVICE_ID_INTEL_BYT			0x0f0e
 #define PCI_DEVICE_ID_INTEL_MRFLD		0x1194
@@ -93,6 +98,32 @@ static void lpss_dma_put_device(void *dma_dev)
 	pci_dev_put(dma_dev);
 }
 
+static const struct dmi_system_id pxa2xx_spi_pci_dmi_table[] = {
+	{
+		.ident = "Apple MacBook8,1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook8,1"),
+		},
+	},
+	{ }
+};
+
+static bool pxa2xx_spi_pci_can_dma(struct pci_dev *dev)
+{
+	if (spi_pxa2xx_force_pio) {
+		pci_info(dev, "Forcing PIO mode (disabling DMA)\n");
+		return false;
+	}
+
+	if (dmi_check_system(pxa2xx_spi_pci_dmi_table)) {
+		pci_info(dev, "MacBook8,1 detected: disabling DMA to force PIO mode\n");
+		return false;
+	}
+
+	return true;
+}
+
 static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 {
 	struct ssp_device *ssp = &c->ssp;
@@ -166,7 +197,7 @@ static int lpss_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 
 	c->dma_filter = lpss_dma_filter;
 	c->dma_burst_size = 1;
-	c->enable_dma = 1;
+	c->enable_dma = pxa2xx_spi_pci_can_dma(dev);
 	return 0;
 }
 
-- 
2.39.5


