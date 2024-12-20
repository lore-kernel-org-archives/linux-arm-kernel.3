Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2B0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBrnaemLjJf78eZYb7N2PVcFoC0rpPVg2FLTR3LOBxQ=; b=aHinSbLhST8k6ROQSRH02YjS72
	3gowqmuM7vdd6ReYPROsLqYG38cial7ckDRkHGIeAuymQ1epuzXnd42C8n/uK1hP2lgoJEypQeKvi
	K2xn2YCC+Ns5MQpVqjV6thxoYjDKvVbKXa0Ixu5QsXQ5vXMdlsYEnGMWi8/TJ4CSGxytouwPYwe3R
	l9/e2b3oGZ3uD6pyxt8jGKWppyuo5RCq85ltpQnpAMSuYbISWvlGsKenqsT9Xw471jgnXuUymYMCC
	WRzu9xguC2C7e9I0vSzElBgAnDWK32ROOfaE9QtTcvievu0fGOxZAAtGaDAT1Tj7sqqpPyKk4ws8o
	FXHUiDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkUw-000000066vH-3ETZ;
	Fri, 20 Dec 2024 21:25:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOkFU-000000064Uc-2ADp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 21:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734728969; x=1766264969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Sc5e5S6Ark7/RKpxpSHi1yxsShKypU8cVy4XdHazvk=;
  b=YjXu/jbxWjlOB347VZVu+qDN+yorupTTA1o2pPSGa0e9L5M4fv4eoCi9
   kORl8Zjw9NqkkXHdnBjtqMsZk/1IDrzJl1PEQq2le5YB56ndGALfLG5RX
   Nq5/KTKLLvdZ5lTnuLCfMN9DrQF0idFyOxEesZUk85CiZF3OvluMdL9uf
   2hyFF9C6f4/b/lJwvEvURkRnrA6VfITcYqjAJVr64UbolO3yJYGn2Fq+e
   odWPnerjC4wJdCNns6ulyHbre0uE7FUB3VyEO3wwgRYHMw1i6hPmtQ9Tp
   R0nW9AF3NgDThXAsiYtbzaoRdQbVRlbcuTRppoMs57ZxwFwzjxA9ucXRP
   w==;
X-CSE-ConnectionGUID: USBJ4PpbRGWL74rt+H8wuw==
X-CSE-MsgGUID: 6PnJBJnNSu+Dl0QxuQ4+Ag==
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35811489"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 14:09:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 14:08:44 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 14:08:44 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v4 13/13] ARM: at91: add new SoC sama7d65
Date: Fri, 20 Dec 2024 14:07:14 -0700
Message-ID: <aafa6115adc52d30bc83206f8fab5964d4dd7fb7.1734723585.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_130928_566790_05313BF5 
X-CRM114-Status: UNSURE (   7.60  )
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

Add new SoC from at91 family: sama7d65

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 arch/arm/mach-at91/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 344f5305f69a..04bd91c72521 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -58,6 +58,17 @@ config SOC_SAMA5D4
 	help
 	  Select this if you are using one of Microchip's SAMA5D4 family SoC.
 
+config SOC_SAMA7D65
+	bool "SAMA7D65 family"
+	depends on ARCH_MULTI_V7
+	select HAVE_AT91_GENERATED_CLK
+	select HAVE_AT91_SAM9X60_PLL
+	select HAVE_AT91_USB_CLK
+	select HAVE_AT91_UTMI
+	select SOC_SAMA7
+	help
+	  Select this if you are using one of Microchip's SAMA7D65 family SoC.
+
 config SOC_SAMA7G5
 	bool "SAMA7G5 family"
 	depends on ARCH_MULTI_V7
-- 
2.43.0


