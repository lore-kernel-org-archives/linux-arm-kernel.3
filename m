Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBACC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mXw6YIXrjMj2IOFl6uTLW0KMfgizoyTtgxeCmJk7pi8=; b=zIr6eu0h7QBu32+EdCzyQuKiSz
	qoUDqnxXKmA38k1ogA9drAB7gAzZuxW0a++Sc/C9mFtkfX9zUig+XeHlb7RNIb9AvD6/wFo5pfv/I
	vLpndyd/W1kkfrk7zBFaFqqyxfpoaB/tN4bQYbMWyJ385iCXdPx/TgiC/1G8Vwzk5dj53witwjqyt
	xVQZiKTQ9cq+KCy9Av62bhQbviorCTP3RQEJHpAX2MrurprisOLMQTS6ebQnCUyzUG9Q9xRUdUf+H
	qH3tSj2Ls+jqG7Lq/1l2UbyNyK9Nlq5hyG5/n5gi7SSqTKDF8uyBUWNpUMj8UTzeoOPGuq5vlavKj
	9UW04DGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGhA-00000009FN7-1bja;
	Wed, 11 Jun 2025 08:20:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGJP-00000009Age-3oUr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mXw6YIXrjMj2IOFl6uTLW0KMfgizoyTtgxeCmJk7pi8=; b=XGzMx2i8UB/9DnCIGuPCutKPgP
	8sk2VJs1dkQx2UP7WxkUwHmMrYKtY7Fs3LlAC6CAZ+bxlFflsMQPPJaeT3/FcR8YOROf+hqBZAB4/
	Z+Sb31MBJtec+cBUPTS65jf0gt0TXy9pf8q45XZG409bMYtrozmM3fJbh4hvNjBg69yphGT3M7zJy
	gXn27Yu/3M7d63wPQ4Ywrr6Y4W1a1JH4OMMl8GU/Cn9bQ782fr3ZbBoQGs44wOAj/dM0dKcNO7dtg
	s6uXWuLfawjhzuE9y7vVPEQkWmRjVnElIzSZt+DiZJGcFH9PIn+VNOM/exI8jFnxrVxdhQXJtxEfx
	poleK96A==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGJN-00000002Axi-1ULW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 07:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749628552; x=1781164552;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7klCgbHcdnpc/FRIacQPzSTO7zTDa1Elo06y8mgwqAM=;
  b=FUiC+CVAkbnPVAV0s2/je0pUG6Ueq91mjUfnZM0CIsBN8Ta4RT2BrcEJ
   +liieNMfkPVjFSjlrYe/dZu37gn1/w6ByRLzWhh2ukzdNWIBgZFM1n3F3
   jwIk5/WO6hRcmCGPxEJGN3C/ekbfD+CxK3WnQguyduZGJYCI9pVLgdLEJ
   /6uVOOhdcJfC69zWWC05EpiqiRdBn4+Li+ofCzDxhb9mGh0Fv3WHmvDYX
   0LYzLlU0HkLX6cKmHfeX4OhkkSPgf34rIcWmrnl3/TFEyppheo4Rmv3gN
   txXgOIfrudfVK5ab5+PoRfuFTYqLBdhjBjL+B//AVgKmgGFAp/nxc3jZ+
   Q==;
X-CSE-ConnectionGUID: SyFxjzU6S2+ui+bvqltq4w==
X-CSE-MsgGUID: 9ORByZ58QxymSLdZMDcnuA==
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="43238999"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 00:55:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 00:55:05 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 00:55:03 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD creation
Date: Wed, 11 Jun 2025 10:54:15 +0300
Message-ID: <20250611075414.4239-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_085554_115286_AEB6433D 
X-CRM114-Status: GOOD (  12.84  )
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

[root@sam9x75eb ~]$ dmesg | grep usb
[    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
[    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
[    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
[    1.601406] usb usb2: SerialNumber: 600000.usb-ohci

[root@sam9x75eb ~]$ cat /proc/iomem | grep usb
00600000-006fffff : 600000.usb-ohci usb-ohci@600000
00700000-007fffff : 700000.usb-ehci usb-ehci@700000

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

base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
-- 
2.49.0


