Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90EBC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgLs8NK0XHHTysnGduh8WTtXMi/Zls+hjiJh2kwYBOI=; b=YZsThHrYQQE7NxtlMzRPF/XBN+
	uYcUxARMVbIJxrjaTiLBF+MVnoYYP/qycd7L3/E0PVJUhdmMvgK5NTtVCOuo66/Eqlrpqt4WgUx6B
	vsB2h36dNIyepG3w6yycnL8/vCc0HdnQY5j/ZawHThoRHT8lYeMQHhaY5cOxvnWDM2qQTKx3tS4iS
	buyvncRt0Y6FBuhSH20nVU06ohhD3DJxjz9WSy/7b8KewZ5mhRj4Oe2ZNQ6EKKX1MxKR9D1aJYwRN
	P1KV8v/lXRnHPA56osYJxwI6WAY5AFGCVwTcyAARUW/ayal5wfnwqWkAMBKx6T/RPWs2aHL30BWUD
	ppQDwXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkP-00000007MNO-1bnN;
	Mon, 20 Jul 2026 16:21:41 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqkK-00000007MKK-2kdX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:21:37 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceed7018c8so45440425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564496; x=1785169296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgLs8NK0XHHTysnGduh8WTtXMi/Zls+hjiJh2kwYBOI=;
        b=tMHkcy4go3EiA/qhZ9ALCnv1nFIa9Ua8tn+KE4Nze+d8i42f8aVU83NTzVqMk11Fny
         Ja7c5NCcTYyHlTzif31Zyo1hirKyWW9wocPIpaEHyxO3MaxejTqDihNNT9tLs+DwsEQl
         Oygn+fQgdEEONjrSh8l04oQQwrZ9udkdivHLQbXGVHHxaUvcyG7fhN2CsVU5pFGWIEXC
         X5c+mbJjdyIWe+mtARgMj34oIntUj9ByUqAcPNpCt1Nc1cmHJ9e59RkmBPGHZZp9dOTt
         pfd/fkjV7H+tQ/UTc0OnSOCMdl4v75vzlCYBMBq1Np2QG0YHphIUL+qvH7KmMVkQav63
         RRtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC6vaou1pLJBfnFz0Y3tMBNCQX9iFFOr0OE+nHGTUiZP/EZ5nWThVZan98BSK+kZNAdVhTCsgESuDfPUPYx+Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YyELXLxZ+IVsmNMadaIDr4bvxArZBTO08c+pkQ2HwXlY0kQ1dkW
	DTUh7gQ0i/9mTBhTqX11lQkuIqaI10yORpYko0GgGRWlbb21v/4AboI=
X-Gm-Gg: AR+sD116bqXLaeLervtj8YNaGfukFsVritc7FapFjKL6ydXaXHBXN98sgViVmkRSyee
	tPlWHgzHGfM2bjPwmxQnKABktRg4L3kSKHRuK14xPykgjnrWS0Rl4BVY4fpBtgLq2nl+VMv/48U
	B2MU494YC8yKjePgsJEwjBuaRJ5m4fyeMGD6JRMgXghvjWN91eVUHQCPvOVpQSjReSPa2n2ECQ1
	EnJw0e6g5p22LJhylRUnlAsb2TAuWYlMmxFuIcVRS6R8PlldAovUundY2XKWieuGhh0QpG+D+r+
	Gpwxi0jeo7So8h97u6r0ic5WLaZvqpePSMC8G9hvJkuV3HzOQ5yNtabO5uDe3krOITGYIn/AwdG
	qwwZHJjA4VqUxHCA6x5Uk/C45r92YW1nZmqgk8pab5s59jQA5/z0JJ3M3/wNOVIXSxcIN6PfJbV
	VVKgJQ99D4VkiGO9vdJkoFYeqSf9JA4YJQy3L/ZqPTaEafh1ugYRagl6v4UXa4nqPPl5cJFglZ9
	eXmYbtQ5FwiC3GSBQ==
X-Received: by 2002:a17:903:2350:b0:2c6:a981:b591 with SMTP id d9443c01a7336-2cf349961dcmr158135355ad.30.1784564495679;
        Mon, 20 Jul 2026 09:21:35 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm58467385ad.80.2026.07.20.09.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:21:35 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Date: Tue, 21 Jul 2026 00:21:14 +0800
Message-Id: <20260720162117.32304-6-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720162117.32304-1-fourdollars@debian.org>
References: <20260720162117.32304-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_092136_691264_1A45696D 
X-CRM114-Status: GOOD (  15.55  )
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
00:15.4 suffers from hardware DMA handshake failures and interrupt
routing bugs, causing keyboard/touchpad transactions to fail when
DMA is enabled.

Move the forced PIO mode DMI quirk to spi-pxa2xx-pci.c (the LPSS host
controller PCI glue driver) to avoid layering violations in client
drivers (such as applespi).

Add an explicit DMI match table for MacBook8,1 and a module parameter
spi_pxa2xx_force_pio to allow forcing PIO mode on demand.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=108331
Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>
---
 drivers/spi/spi-pxa2xx-pci.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index cae77ac18520..31bdaa096d9e 100644
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
 
@@ -238,7 +269,7 @@ static int mrfld_spi_setup(struct pci_dev *dev, struct pxa2xx_spi_controller *c)
 
 	c->dma_filter = lpss_dma_filter;
 	c->dma_burst_size = 8;
-	c->enable_dma = 1;
+	c->enable_dma = pxa2xx_spi_pci_can_dma(dev);
 	return 0;
 }
 
-- 
2.39.5


