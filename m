Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D7ECA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 13:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijn+ih/Q433KYekDPNI73gbzpi5KW6K1yDdb5JKu9Cw=; b=2XYb+uK8+9SotdhxgLvjbOdedw
	C7TZwMdjJ5ES5kkF97nuBs2US7lydrLNSVg4lbImM50PZtrfb0HdrkKcBllY/PZ2fUf/wmfxfQI/B
	iROAlraYvg6hUbcyrYq0TDPgCkdDhQ9opMbt141yvsQttSHOg9rbu/OoKI8pptdi/yo1HYsUwb0ye
	DFhQIJlzqFwlXQr3rjoya/a+DVRTwtWhU5dipH77aovy9N8reWgjJh0RYATumTCU8kI8AwZHm4uM/
	iuN2qFFKLDZdC6Dhbd2Y0hScSYtgjXX+4pxPmZ8I0JpSBPRiL5t8k2Cwqp4eE64X06JlkoNtxc6mb
	Bweb28rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo2U-00000004RkA-3D7b;
	Thu, 08 Oct 2026 13:20:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEo2R-00000004Ri6-2jHp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 13:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791465599; x=1823001599;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
  b=u+b7roC39+gJzxR1uPHHXttbloXnkYaavhBC4FzEMwz3PCb+VZSuduoO
   iJF5Ey4/53b+8Ew+zlfC9bvUbxN2qRH8CN6mm0cyrPWghD7fd2fEp12EU
   dY+R5WUuIgS3r1CaNC1IHGPv+gbPbQ2v1ERyYSCDemQQo3YR2uK3Jxh3f
   b8Ngp+x9zW1ls9fWtaQJl+pDyr4IFoPPpETYrb7ZD4qMrvOlgxVKnHkmR
   6/GAbmnzfCUNcN7JOrmv/LldqJ5UgLJMC1iWPD1nbwVU5a9rdMsqdoWh1
   ldy9rRtSl40xC9BfM7JBGZ48Ig6qD/JXRKPhye3dQHkgwEdMjXefctLdG
   A==;
X-CSE-ConnectionGUID: L6K/bHZ6TFaHAjy0vIlGwA==
X-CSE-MsgGUID: UGxlOntCQYisPTRiN9YAqA==
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="65038497"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Oct 2026 06:19:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 8 Oct 2026 06:19:38 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 8 Oct 2026 06:19:34 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 8 Oct 2026 15:19:03 +0200
Subject: [PATCH v10 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261008-cpitchen-mainline_gfx2d-v10-3-67ca2477b3d5@microchip.com>
References: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
In-Reply-To: <20261008-cpitchen-mainline_gfx2d-v10-0-67ca2477b3d5@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Manikandan Muralidharan
	<manikandan.m@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9bxGaFzTv35OaNl3weNoxJKm7n8+x7ItC48OTWg5McDs
 VN2dbeLO0pZGMS4GGTFFFkOvdnam3n81WO7V6JSMHNYmUCGMHBxCsBE3FUZ/qdKnMly+1gZyLiH
 ySIj8D6Df8WJpxkHFj/ccuvVp5LTU1kZ/kdcuXeem+fOvruLr/MWTrq/suH/pml855a8Ynj4WPt
 iwyR2AA==
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061959_754870_DBEED28A 
X-CRM114-Status: UNSURE (   9.40  )
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

Add support for the GFX2D GPU.

Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index e708b3df4ccd..1155f4f997f8 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -351,6 +351,14 @@ AT91_XDMAC_DT_PERID(26))>,
 				status = "disabled";
 			};
 
+			gpu: gpu@f0018000 {
+				compatible = "microchip,sam9x60-gfx2d";
+				reg = <0xf0018000 0x100>;
+				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+				status = "disabled";
+			};
+
 			i2s: i2s@f001c000 {
 				compatible = "microchip,sam9x60-i2smcc";
 				reg = <0xf001c000 0x100>;

-- 
2.53.0


