Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C29C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf94xrPCacIGgIU8E7miuCZD7yF5tVDjvl3GPUfT3sY=; b=xVYVIIbSv0hj40BIrIt7f0KoKP
	8PBmBUzsl4PdrjhcNMVdgSyoepN4pDqVdV7n5vGk2HNEXL9ictglR2QvM9k2YfpKKvR4EvI9vIsJO
	uHHCmapM0x4kZN0jTxu5iegqmYQ4UwoIzTKvFTYh7UGB2SwIon57/SaU9nIa9I0GAqlVNKKL7Mlpy
	cDqFPQ4mLzs8aRbnEmduMP9CDm8DRGQ8fmJ2a9qrcGfyAlh2/TU/zMZUZ1vSN+vNGw9Gf574uepEX
	Z62rS9FH7l2Iz71tASGP0+Mbuvr8nVq+aVzh4hQf9oPyyMSFTk93iB2Fgup8PLIz+kEDfDGv3Gd2Z
	Twws240Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbOX-00000001Usb-49CN;
	Mon, 10 Feb 2025 21:32:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6Y-00000001SVB-2BMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222050; x=1770758050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tr+5ctybWd1qXbabAXHiNSfhGJo/z7RoiOi9HQGyK+g=;
  b=gIdTAZILrJreWjeIjM/WM0OOz57iPwtIf34x2MkAaGyKyiStosiTArwx
   7LUD/ibUYdPmSRn7k6SoYANgi5YoReawLKIh6wQMKOdXOTw+ODvr5evfK
   ppR5+SQBkWD0nFRDcK6TG5v/blCNpvAlwhKGkyC7txs8kMJ8MJsVcH18V
   YYdofIRZpbw+LDW5NAoQMZhoWm6mDK4Orx5axmNGMJm2o2QFbtjCTFCLN
   9tvh0y2VCW0cg8Drbpnl9M6xgSkjHBL0GOfmfRyHxbqQAxIt/bfbVWFNL
   3D+0QV5lnWO9tsdYFAeRRHeUgPuEIUu7UlZ6H9y9xDAafVFxaUzzN8W+i
   Q==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: 3/XXqYBWQPeiFfEj3UQroQ==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027980"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:46 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:46 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 08/15] ARM: at91: Add PM support to sama7d65
Date: Mon, 10 Feb 2025 14:13:08 -0700
Message-ID: <2bb7550c7f7bd573abcbaf6060ea3a0b59117e4c.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131410_620013_C62C69A6 
X-CRM114-Status: UNSURE (   8.68  )
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


