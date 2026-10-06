Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4FECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebSoV5XiUnrw+INdzHAjw6zeV1hjAXXoo/TgIsxQyzk=; b=Mqzk57QAIKIpdUJJQyGA6+kJLP
	1htNOAq0Wp1h28dBK3EjBdsewm3+SFE81btltgmEidKCB+Y+liG47wyMbJAGrM9PMXQkEIw+0plV6
	xzPrwjszU2xzzcfsTBiRXnASFaokSoFJAgGXeorFpegA4XRepTQ17mQ0gN8RRakWCgpydxtfspU6u
	VFeng27D3V61K0BCBpCwFISLRS1bIZ4HeNMYPC1w7QZlMLDe67Rc2CEyCFlL08tmjH15SdVZ5Oq+3
	JJrPj5ScHcjpOVALsXe8ymD6zl5GAZ6W8TJV6QxxsvCbPg4L4fePvB1bKYkpmLZ1vc0tnEOCdL1CB
	Uxkmi4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4jc-00000000oSL-3sFI;
	Tue, 06 Oct 2026 12:57:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4jZ-00000000oPt-06dn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791291448; x=1822827448;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=90E4Y3iv3wZWZ7rk6RLZc9iA+z4ETFdFADS8b0uLgEQ=;
  b=0ai4/XybhzIsPBQ/n86LL+wJj9FX7D9lm1E7lSyrD8+Afsg0JTBPKntA
   0rF2bi76tSbYeXDAcXKYpK5ilHAgXu7Pz8Z2OPgyc0cMlRryZ3QeUfn5q
   rPfV+5Bv+E7/v8MCXDJzVrnZdO1R7VGYcickRUzQD4QXv0aBzbKHdfqoi
   nfWEFSZQpGPVGEvhVh5SfK96M/6rcaFJR7/eUkcpT2+zwOMcaej4jHCg/
   enFsFuqO24/rQP5/P2qMurtRzMXCFKSnWGGcARJTnAkIJDldYyShsuLs8
   NCxvenwQle+dIYyp9dw3+HVCz+PraH9/mt2rRpGDo3oAU4V3bovQ/rgD4
   A==;
X-CSE-ConnectionGUID: oTYxfA/dRDOOO6oih+iojw==
X-CSE-MsgGUID: KuMQzZxvT1CZRRjiYGAdsA==
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="63701587"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:57:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 6 Oct 2026 05:57:28 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 6 Oct 2026 05:57:24 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 6 Oct 2026 14:56:36 +0200
Subject: [PATCH v9 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-cpitchen-mainline_gfx2d-v9-4-74bd3df2e183@microchip.com>
References: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
In-Reply-To: <20261006-cpitchen-mainline_gfx2d-v9-0-74bd3df2e183@microchip.com>
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
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9aRDwpuYn1KRlcjNqQxnLKa3+oZFFrrEvOJzS0idZPx/
 eYpJ3Z3lLIwiHExyIopshx6s7U38/irx3avRKVg5rAygQxh4OIUgIkc283IcKunUDRgt4X5vwTf
 i+8dzqd16vUkfQmXcat1qTywwiyln5Hh5MRSyTMKtntZS7atYS7c8fUHc9GRR8mJLaeLnoZmT+D
 iAwA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_055729_105302_1ED2F8F1 
X-CRM114-Status: UNSURE (   9.37  )
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


