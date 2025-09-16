Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99C0CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xflK5flDZfJSSqs8Ucu3nNgJLvSI+OlVS+x2p62Y5p8=; b=4XYAqE3jFuDsanpqCn15WPbXz8
	x6aMpTumsAKAIcA8D5uh2L4Ua6u2R7YIiauEaaF5pzQieuiOK0eaMfZzfe1QglS9eDlHuA4zjC7iv
	6MxECrTJ87z3p23zeP2dhnpNyHHFcF9SEHeBeSjjNJj2a/+EbcUcAIP25qjpg7OjNjmkeQZ9hNMJB
	rSPQNsLvvuyP9IAOSiVShLcD9Dcf7HqxvDafF6wER3f+a82XtJ4dKF7TCp855xaz6x02cLaEdpBoA
	QC2fzq4i2gknmKH9aptW5aDdQtWRHv9O55Cwgss9ZRKRF6DPLyW+/ImG60x3e1B0JhY9puVxJgjh/
	OaCtwj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybhZ-00000008teN-048x;
	Tue, 16 Sep 2025 19:50:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uybhV-00000008tc3-0F1s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 19:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758052253; x=1789588253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rxU6PVmG83yicsKvP+6XTEJSdKPkh2zwzFo9IUSgHhg=;
  b=sYYzBF4xJXdDIRIMWd6b6IfK2vNSXqrfhLyoQcny4kZ+ezdvWTAL8dRw
   paYGT0OnzElOnr5EGckNXlMLowU5sYsTG3WT1X+Yp1108V2GIFXlheb7I
   JK1wrCRvV2GF7MTndnptpFj0dutlisK2gaXZlDTwiBuRVzHiweptMyeBz
   k80Atdhsolwd7lwcyUq7wzbLh8q2WyJLN+2AatDFvN7gaiHODnXr9/Jre
   Ny+jES4qtHf3ZJx45K+tjjTkfCkVF8Skafjp74PMyJwCwm8joKw9yVnch
   /zrim4NYVn/JACouNaRqiEgY/947VshDvKTBnsnPt0jMueYJZ3iUBrh5c
   g==;
X-CSE-ConnectionGUID: OpVEzCAsSoaW6AVT1s3wKQ==
X-CSE-MsgGUID: iEhMxX1lQ0qgWColzJt/pQ==
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47129849"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2025 12:50:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 16 Sep 2025 12:50:17 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 16 Sep 2025 12:50:17 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 3/3] ARM: dts: at91: sama7g5ek: add microchip,lpm-connection on shdwc node
Date: Tue, 16 Sep 2025 12:50:32 -0700
Message-ID: <e7b5108c07bd2b0b2bd83b22b373f0edeb6adc1a.1758051358.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758051358.git.Ryan.Wanner@microchip.com>
References: <cover.1758051358.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_125053_161202_7C41A5A9 
X-CRM114-Status: UNSURE (   9.81  )
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

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add microchip,lpm-connection binding to shdwc node. On SAMA7G5-EK REV4
LPM is connected to GMAC1's PHY, 24MHz oscillator and PMIC. On board
PMIC is not listed here as it is only treated on BSR mode
uncoditionally.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 3924f62ff0fb..50e9a5a5732a 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -872,6 +872,7 @@ &sdmmc2 {
 
 &shdwc {
 	debounce-delay-us = <976>;
+	microchip,lpm-connection = <&gmac1 &main_xtal>;
 	status = "okay";
 
 	input@0 {
-- 
2.43.0


