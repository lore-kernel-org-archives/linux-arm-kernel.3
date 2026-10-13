Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FBCC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebSoV5XiUnrw+INdzHAjw6zeV1hjAXXoo/TgIsxQyzk=; b=4fxU+HlRvZT/w5Je74t8SJlBHl
	owoFMMYYdWMr3c3AHAH97og4aSPxd9Ww6DwSVnbVQZBXboLYDwPBqkBbgXDjX8Th5eTKKGJjZJuOF
	IdVq3JVYE1OGVlRiaYV9QW3YjQ40HArJtC87Z1uwVpN2xrWE60TmztAXbyHP+3Uwc37r2heZmWHmp
	AOVJqtLfRhAjorlGXP0rsBAcCG/2g74KEEn+D55Mg3+lQxPMeR6a4EzRFGtTTWpIHRZB5OtfFeB1x
	0MwvpEkl7GQLW3/SNfdYZY3x2BNdBgQopatJep7zZveMRpIkT9cAFAKDF7mDzkshFzK98VhFL+5KX
	exnSySsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfVs-0000000DYTc-3fHK;
	Tue, 13 Oct 2026 16:38:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfVq-0000000DYSF-1wHH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791909483; x=1823445483;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
  b=XoACY4lJGiPp1Hv1OarNy1PO5gJRl0HCWEGO0wnE0eExzWCTX2/64UT5
   PzZ5cHHyBjg2zbtdAGtyXMCo1TRgKlK4QG+BGsZYwc9Qr8+jhYEigYjpR
   GM5x7u1xGo7YFE0BiZ/aBczGktgwjdeW+Fn1JMdv4wWPY5E6jYzkK6Ecb
   jE/8lo7356RyLaI60tuvUGNenFdEp5lfSWKWU5yTRjavSN8UhtlIRn/im
   TBLb8Hx8NooH3mmIX2wex6JfaVihOXoxA6diBpFjFpPTwBy9WLa6AlSva
   wCIFgTHaU6pTKJnUG6aG2U+T4ABXy+XHFzDt1cnKB0DKJZwmLsoI4DPpa
   A==;
X-CSE-ConnectionGUID: s07STZ+qRmK3MM0z9piNRA==
X-CSE-MsgGUID: fuvovqN1SIaEwS/pH+fkhg==
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="296388313"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:38:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 13 Oct 2026 09:38:01 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 09:37:57 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Oct 2026 18:37:26 +0200
Subject: [PATCH v11 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261013-cpitchen-mainline_gfx2d-v11-4-7527f2efab0a@microchip.com>
References: <20261013-cpitchen-mainline_gfx2d-v11-0-7527f2efab0a@microchip.com>
In-Reply-To: <20261013-cpitchen-mainline_gfx2d-v11-0-7527f2efab0a@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9a5uEDPrReCo/8IaM7a3VV0x8+8qpXJQCMrUfLSxMIPO
 geaip06SlkYxLgYZMUUWQ692dqbefzVY7tXolIwc1iZQIYwcHEKwESs2xgZZl33V27Y41beLB6n
 vcH8wNJza15oxLCmT8n4ciRwafMdLYb/RcvO3LyWcsvEsz9QvTexQ6hOZOfyzY8ryw5HZsqsSb/
 KDQA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093802_517703_F27572D7 
X-CRM114-Status: UNSURE (   9.70  )
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
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index c680a5033b6b..5450fddf89dd 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
 			status = "disabled";
 		};
 
+		gpu: gpu@f0018000 {
+			compatible = "microchip,sam9x7-gfx2d";
+			reg = <0xf0018000 0x100>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+			status = "disabled";
+		};
+
 		i2s: i2s@f001c000 {
 			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
 			reg = <0xf001c000 0x100>;

-- 
2.53.0


