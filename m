Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB07EC44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgLs8NK0XHHTysnGduh8WTtXMi/Zls+hjiJh2kwYBOI=; b=XDlNCIIiR/caqVvIOHR/KeK8Ox
	pUNXb1fm3z1M57YcAETiu26UGrrlDaxmNq5wkdukX+aYeh70FuLns8DjF/KLW8BVG/FIgauTc9ieO
	GcceOS0OZw2JouFFZGvaghlPQglD/js/xxgdkmD+1K1R+qKt53wO5lduj95GeyVyvFvtgcG2kmKjU
	Y2n9tWemuYNJ8fae5VmWFw9/yuahcF7J4GIpPH1VIFwFU79S7ZBbhRDm3zaFQk9W+F5kfM1RK24V1
	IFVWvGaHN9fTMHGKOOio4L1e3kpX55iktA2trw/fz1yUtZVhZsVtBaJlLeEVJewqb9XLS7qL75S1V
	INsaPagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQc-00000006Vps-0zuD;
	Mon, 20 Jul 2026 10:40:54 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wllQV-00000006Vla-0dDi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:40:48 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cab973140bso121803855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 03:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544046; x=1785148846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgLs8NK0XHHTysnGduh8WTtXMi/Zls+hjiJh2kwYBOI=;
        b=i+nm/YD2YXeks1qoG6YLFsIi9UWqLqIgD6jV4cQpIId06Xolczyo8VvvlJkngUWTVf
         UQ74mqUjOxYjlBycfbtXdwsYXUqc7lDfyBEiKBBLHnTdXC8e48ocMA2/99pxQ45cVoor
         wMIToJ7IW0Cw/OAQicTDWN4hg2bSbkU/n+p0i4TYgp1XlynQNvYSl8PPANg4gkQK6vD5
         qC40LfcOS1ylaZdaowJZJdw6nHCmsJiOFcHGR0rRjYyT5o/J99SQTyzyFrKZhGK9xeD8
         prT3q3LAeYd2U0IZG4D7oE8dUxSw8zWzUtYs8uBSKZ3XmlgCX+e0l2jcOi0pc2O6zBUW
         Xwbw==
X-Forwarded-Encrypted: i=1; AHgh+RrAhjFMrjKNjJBKq6rfhAPv7LD3tAy4E7SFxafj6Z+oEr+ct/ajHX3D13r6cEOkjlWsXJoWkF3fo6GJIw9PtSXf@lists.infradead.org
X-Gm-Message-State: AOJu0YxvgBHlWKEXIoWIGbhlCbsDeMg9g0FhKA2OpCShP45V2NqaiQD/
	92mY4ltVGH9AIx8E3fRFW6oVWcyGQhKtzRgYNtoXehvihX7z1QEre+w=
X-Gm-Gg: AfdE7cmBVtt8HYT5gK+bb+N6gZJiSpYudhpaiDzz8ZRotC6bwdvKuE2JUHDBqBo0qbn
	OUxg/wgUkGEO47YIiQgduFWGjdoecSicHwxzVkYjm0kcHHdJ2tfBeKAIFOcQ1p40hFnVWrAT1Ej
	lChWc30zDfYaj+5p6+eVWLtuPHgjnqiP1O32WWlX1vujM0K60UyJdNlYOu8glhg1cvO3f5HfDHR
	XvlnDjRuW7ZzjiI5q56EhmpIx6QJSfFer2RMR95d8rCIbw5KuqdmQyut0sKY4vy3G18csDhue+e
	z8iwBdIyz2nCQEhnbTxxh3z/cXY9hSZ1nQq8Yg4jMa2qMRWHlBjpvm07yWzGmyAFLiE3HwPEh8W
	MPMxkqc25GKtlJVbaxxzljqQA4kFH1hmsHrMVlvjayb8mfoYdyqud9JZERot15VhpMpc6Iy5pLf
	bGsy+J3HaV+UPXE0qvllJCzd9G8uveDDxKvj56ueqweX115QfTCiQ4WZ1mOdDJxf6b3gIRehq8c
	uQuxoga+aldO+NQ2Q==
X-Received: by 2002:a17:903:19cc:b0:2cc:db71:4db5 with SMTP id d9443c01a7336-2cf349d3ee3mr147347175ad.37.1784544046271;
        Mon, 20 Jul 2026 03:40:46 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-16-100.dynamic-ip.hinet.net. [61.228.16.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f61ffsm54900325ad.33.2026.07.20.03.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:40:45 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v15 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Date: Mon, 20 Jul 2026 18:40:27 +0800
Message-Id: <20260720104029.13740-6-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260720104029.13740-1-fourdollars@debian.org>
References: <20260720104029.13740-1-fourdollars@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_034047_202532_EB0DFB99 
X-CRM114-Status: GOOD (  15.52  )
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


