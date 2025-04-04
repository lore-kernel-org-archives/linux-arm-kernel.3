Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C41DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6x83gL/65MaXshed1MGHV1G/Bw0QFznUQR/GQF+fLak=; b=yhwh73xUsTHTzfzbdw4xWNeGRh
	AHkvCelzqRzHHXGR0Lbvb/NrD/BAkI+lMpPlEQWWYkDJRTtLsO0XHby6xBV/9vz7QSNinwmvt0VFq
	OhZbU0muML2ug+rY8Mi6l3tQRyr/taxakyWlKy0qfmvVBTasSS5174aDd9v//cLl/Ox/PN3xEigrQ
	g6KTfj0hEljdESa7+19eKxVFvCdi0DAsy9XspoQt1po84UpSbWtk4Up2gZPH1SHvlHZrRKvc3XhSO
	OPHuNykvxU3xtUjGDgmDMzjr3Q5jbUx+KsPrEOVQa1FQYsSVeHgjakNP5x1r2BLvQtSPYpP2Cn1cJ
	x9fmWoVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fJ6-0000000BYfS-2jtQ;
	Fri, 04 Apr 2025 11:33:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0fDK-0000000BXyB-0eiE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 11:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=6x83gL/65MaXsh
	ed1MGHV1G/Bw0QFznUQR/GQF+fLak=; b=XkqPD76mdJ00JpoIehCMiNifODzMbD
	9cRf8okGwgcSYvgpRDvKrjaEO7fOOizPDK33erHXYQaU0NmxtImlcOYUz0GjWjz9
	ZzeG7w7X7Hn3F5P29ZG5PLKtTngl7ivnbqmad2sGNxVsg3/Fy9xEHXpkBKUGaKc/
	zTFjS4JX3o9XFeW+A7mCjplDEj1vJ5vam92fdkPVMFg0I/V0W8ywaTSEg76SFWEh
	VZc0jdORHiX1Tsd9Rio+1zl71u1Bj7Uh9US7rOla+Ofo+swMiyWSJUbUNrbCsQVy
	imO4AyWG2Unc95z6GsVHxlLcC1sohBnUzgzQvLWy3VP+X36KilM6N34Q==
Received: (qmail 2751198 invoked from network); 4 Apr 2025 13:27:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2025 13:27:52 +0200
X-UD-Smtp-Session: l3s3148p1@Q9xNLfIxNOQgAwDPXxG/ACep4iRxujz/
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
Date: Fri,  4 Apr 2025 13:27:43 +0200
Message-ID: <20250404112742.67416-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_042759_065879_F78B32D3 
X-CRM114-Status: GOOD (  10.56  )
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

Dataflash did not work on my board. After checking schematics and using
the proper GPIO, it works now. Also, make it active low to avoid:

flash@0 enforce active low on GPIO handle

Fixes: 2432d201468d ("ARM: at91: dt: usb-a9263: add dataflash support")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/microchip/usb_a9263.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
index ebaf198e1bc4..8e1a3fb61087 100644
--- a/arch/arm/boot/dts/microchip/usb_a9263.dts
+++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
@@ -58,7 +58,7 @@ usb1: gadget@fff78000 {
 			};
 
 			spi0: spi@fffa4000 {
-				cs-gpios = <&pioB 15 GPIO_ACTIVE_HIGH>;
+				cs-gpios = <&pioA 5 GPIO_ACTIVE_LOW>;
 				status = "okay";
 				flash@0 {
 					compatible = "atmel,at45", "atmel,dataflash";
-- 
2.47.2


