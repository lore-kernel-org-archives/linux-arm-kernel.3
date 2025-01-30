Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06074C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf94xrPCacIGgIU8E7miuCZD7yF5tVDjvl3GPUfT3sY=; b=rccemHYzBXR05f5xGxPo0bum0I
	3T8pphKLYltsUzsGeLqFlVc8+4FsSo5TMim2zhmmkwHpbQNH7KPM+wM2Mi/8aBPn3kqI4ZMdpujNn
	zlrKXZJhW2/vVKKwvaTQf5Jf4HpdvEr+V3d2CQ68m+8WkIqv5T2vklZ8G+bvq3M89XaZbs+DI2q66
	6fNF0NZ55KhNbD+aIeMQaHWfl5AiWaGmc+dn8dBHFtihE/4Skg6UI8KxQVP0r4SeytDTGkMa4/KcY
	a+m6RCkNXlEgCTQ8rfsi4DsKpoVsLxisYE76aTF0535T9J1vCmwUASj4c2RfUWA6wNDL2YBtax332
	DnZiaU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYmk-00000009LFw-1Fu9;
	Thu, 30 Jan 2025 17:57:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSn-00000009IRQ-2TmZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258585; x=1769794585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tr+5ctybWd1qXbabAXHiNSfhGJo/z7RoiOi9HQGyK+g=;
  b=xowKKDCAJacUpqdrleER1GWiegnS0V3kAK7uNKAZYazJFtslDVhrjr+A
   Tv9sdalsyfKWxzQoj9JU5gI6Z/NM1Mi1g4bwvuBV7kOgLx5PMwBjJkkLN
   Sq1Y6nMJoDoVQhvm4Pvi0ZTtJfrbh11SJu4cl0qjGsfu4dBrAyhHPJu+X
   QMdiFhmWeDZBkugxwxzxYExgU93jxOGnrK/Ie1/GfeQPgntzeSplay43d
   /t5DWyHQuGkBbfI4hdO97JyIZahU1gtPl58sjNB0tEWteuiiRo+DxuZgf
   mNEN9G1IT9hGC1qVVdYSi+iJGbN3mzTU1TwSy4MlNx+I7D16Xzn7/DuBs
   w==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: QG7KiDv0SXmpwDdFB//Xow==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623018"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:41 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:41 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 09/16] ARM: at91: Add PM support to sama7d65
Date: Thu, 30 Jan 2025 10:33:49 -0700
Message-ID: <9a57da4b20f5fa7ec84af7353cfcdb43efbff29c.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093625_696638_F3E0BF59 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add PM support to SAMA7D65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/mach-at91/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 04bd91c72521c..f3ff1220c0fb0 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -65,6 +65,7 @@ config SOC_SAMA7D65
 	select HAVE_AT91_SAM9X60_PLL
 	select HAVE_AT91_USB_CLK
 	select HAVE_AT91_UTMI
+	select PM_OPP
 	select SOC_SAMA7
 	help
 	  Select this if you are using one of Microchip's SAMA7D65 family SoC.
-- 
2.43.0


