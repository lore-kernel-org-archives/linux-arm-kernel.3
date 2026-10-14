Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33ECC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mA6mwuU/8KGkmZBYxzmUPrKtz6y2loB+9vkSMCJlaCA=; b=aBlYK5/DPnlE9GmrH+E2PcPWb0
	YVQiyvh1GY9CaznEiNfHqf4VQks/tlP+mZ+cIK/yHL7dzeUKdfJJNnB8DjXqc5OFEh/6B2t++XWe/
	A0EnIjextR9E7YuMUh9CKcavyn9fMYSinvrE0FjNiMGwwlz+iAHfhnduLrV8KpFD9wuvPwrQv+A2/
	tByDaGFxlDEZVXOAAj7lqMvElrEKsY3p7WWNJxGPtvf0oK/PCCeeSyBRRth24kHsRtHSlQ/BqFsHo
	WqdUp51o2d6u2VFfFNUXTd24jNSfK4bn4az7mpB0unFFLHRFf5rczg9Reg3+BuDZyujsDNcA3GZeb
	FFJbGetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxvJ-0000000FPx2-3DMa;
	Wed, 14 Oct 2026 12:17:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxvG-0000000FPwP-2X4g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791980250; x=1823516250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VwGEM9bG+gm8aZY+vx8GaLjgb1ELCuBd2Ygqztwzy94=;
  b=IwFLJlPjqETJZHywaDx1VgS4yfiwAvrHZ4+6r79x65j5Ja9REgeArjdH
   OxdTZ9q3pQuxEHlozx8zYx3GOyq/FVyFrMuEzjmPruUG4a+NhAxrJ+QjK
   rPe2Ys8p+rpEKCeL9qTOUnH92zq2I1ir0b4IC5kvBrMtr+ATyJ9rsNCGE
   1mvO6AMm5CxxGBHvigwdhThEWGk4dxnnP+VVga0V+2RQbHoLd5HothxhW
   Nlf7tifznt5VvQFz5JM4AYTD4s3Wma9jG7hKdPaNP+kCcHI5dT0doL7jk
   vCFwcmi1447mRu7to9M0VXXuuJ57ffesvK3vngeR+NLPQNcBDfWRyd1Kp
   w==;
X-CSE-ConnectionGUID: AS0fM4N0TTu+W0y8BvP7CQ==
X-CSE-MsgGUID: e/ISQjFySC2entXgr5BMBQ==
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="296441734"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Oct 2026 05:17:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 14 Oct 2026 05:17:28 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 14 Oct 2026 05:17:26 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Date: Wed, 14 Oct 2026 15:16:56 +0300
Message-ID: <20261014121656.1634-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_051730_888679_469B193C 
X-CRM114-Status: GOOD (  12.22  )
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

Use dev_dbg() instead of pr_debug() in the probe function
to provide a more specific device message.
This ensures the log message is properly associated with
the corresponding platform device instance.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/usb/host/ehci-atmel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 65747270fd88..b6ba7005be69 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
 	if (usb_disabled())
 		return -ENODEV;
 
-	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
+	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-- 
2.56.0


