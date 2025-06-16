Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0406EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2NrHHsiCFl09VeD6KVgs7NnrjZ8O25hI7HRClT9kbiQ=; b=y7P0f3NAQNHy/AYGB2TrSLvcKm
	e3NfYM8eIROLLOavF5YVFMcJ0SDvneJ9Djhg6Y3shAcoAdXuP95C3cvlGCcc+7GIbLlJjtSoYlR0z
	XlVyRZvusIryrgighm+hyL3E1w59fe79nU1KYo1nRbTT5zPmRitgiIW/eojuCatTXRLF0D56NJhlS
	x/7SpsYMvLx1aR6YLK9TGk6wh9JzhEG8TKs598yfmBSaECyjkRZAa7yoKfbrJujXbYSf6I24DF7CR
	Q/OybQw2nCcdootBViObV3T5tzG6dl/kCa6YcJ5loiJe8BfB9uAgRAu4J/3s/LReGXmw2w4VjyR+v
	AnoDqaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3FU-00000003VBV-3iaJ;
	Mon, 16 Jun 2025 06:23:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3BU-00000003UmW-0QUk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750054747; x=1781590747;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yf7CYDWOszU1weAxe35FQgpofMbkBbfHlDIiXDmtfwk=;
  b=ZDVj52/KLDvNXVydiL6ZA/DQ0iZnjXBYIldaZ+C1X5Y7lGV2oV610SyJ
   0ekTHp70/ul8TtU81eXArUXGjJm/eEO6G/VadvPXpdwqWpJI5o2yd9uJ/
   5wjMWHgJleQddC7rrrcHqffXOvvOebsF8PD5FJ9kWbv+rJFPV2ZG5h0Dl
   Ir1XP2nY7CnGU+30Y1MRIuMQNFCEUj1tqkCrPQ8vNtuOQxp+kRAimzggD
   A0iZW6X9ZPnLn7ngGS4rlkgMaK+iIYcM7zQwqV+df6yJLmAhVp38b4M/M
   ptAuklU+2iiMI+KlACUIKlC5yoj4UChHbhJjTQ2X7nBpXVUjyqDQmygI9
   g==;
X-CSE-ConnectionGUID: lpnJe+SITWGM2Ln9dodNAw==
X-CSE-MsgGUID: 5eStiWdKR6izcsMfXw90LA==
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="47833217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2025 23:19:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 15 Jun 2025 23:18:34 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 15 Jun 2025 23:18:32 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2] usb: ohci-at91: Use dynamic device name for OHCI HCD creation
Date: Mon, 16 Jun 2025 09:18:00 +0300
Message-ID: <20250616061759.3384-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_231908_329272_59C0F030 
X-CRM114-Status: GOOD (  12.18  )
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

Use the dynamic device name instead of the hardcoded string "at91"
when creating the OHCI host controller driver.
This ensures that the device name is more flexible
and correctly reflects the actual device in the system.
This will be in sync with ehci at91 driver.

Before this patch:

[root@sam9x75eb ~]$ dmesg | grep usb
[    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
[    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
[    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
[    1.601406] usb usb2: SerialNumber: at91

After this patch:

[root@sam9x75eb ~]$ dmesg | grep usb
[    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
[    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
[    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
[    1.601406] usb usb2: SerialNumber: 600000.usb-ohci

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/usb/host/ohci-at91.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index 5df793dcb25d..12fdb18934cf 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -193,7 +193,7 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
 	if (irq < 0)
 		return irq;
 
-	hcd = usb_create_hcd(driver, dev, "at91");
+	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd)
 		return -ENOMEM;
 	ohci_at91 = hcd_to_ohci_at91_priv(hcd);

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.49.0


