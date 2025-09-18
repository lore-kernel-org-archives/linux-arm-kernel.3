Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FB3CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eizq3SRccQK82tw/Y0lr9wBjCHGtgfX17yvM6S/hXw0=; b=MieXj/jSqXnbxlBlqsFK8i379Y
	whww1y0bqXYHQjnbBsn0YwTl7wY8rKLLoiP+VlYzGkNLZPjMY0q8i6meYZ77/ZemonayjorsFaB0L
	dokkQ6CiGNgjXveRt91d8hUjK4WRiKGvtFKL81xRnn1k7XOlkLus4KFtywZDz3gCiJ1OeddX1+MHR
	MXT7kA+F1KGADUSpNshZ2e//xC3PpaMwhvkP0f8VoyY6hcIuWmwydNGmPnLYh5hyVyJkLpk30pArm
	MOVly+HCOo+JURD96XIbmerT14B01JIoesQPB5uNyt0MgS02YhRX+jhCRtLZzFUay+rc5xcAJGMZ3
	tPAVWHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGFz-00000000Hdf-2yET;
	Thu, 18 Sep 2025 15:09:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGFu-00000000HZU-2u0s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758208146; x=1789744146;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=GfGwxZKLqGpRvWdmOw4AEDvBya2xCMOPOJ7k3R+7fE4=;
  b=TFrRXsa5sLWkZC5zQXgvVSy8//H+lEwpgWjCgBWVK2GzugS63/6p009a
   H+b1O7trgL1PwRuAyV/UYtLhZgZ4NYUESPXXQXAbNTkx/EDVL9q3gwC6T
   vQIpAI43Ctl8rMqvA2nLfVQspS9xIQ/ezq4F1GBric5Pm/+yYjhT6MoQX
   M8b3V1laRnY8TTQELHyl/Rapw7QDgBb7tiaRUWLjBL+Qtk3vJFPX+8M6v
   Z5ymcKSP6NpTjaXvgpp8C+IhhUlvIUmz1YTTqENA1aBaLSam2gie9DFfi
   Ske749hoFsvrc/2Geh/YSI+zMZtWoBntv1kA5sJJ5qPdhzasrU/qheFam
   A==;
X-CSE-ConnectionGUID: ugeKBCocT/GeJhh6l5hQPQ==
X-CSE-MsgGUID: i3+164+6RtufCuMJv0SKKQ==
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="47215040"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 08:09:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 08:08:36 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 08:08:32 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 18 Sep 2025 17:07:37 +0200
Subject: [PATCH v2 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250918-cpitchen-mainline_gfx2d-v2-3-6cfac9d56612@microchip.com>
References: <20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com>
In-Reply-To: <20250918-cpitchen-mainline_gfx2d-v2-0-6cfac9d56612@microchip.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Russell King <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Cyrille Pitchen <cyrille.pitchen@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=GfGwxZKLqGpRvWdmOw4AEDvBya2xCMOPOJ7k3R+7fE4=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8YZheQzDtM8XlbMmv1x6d3m6Q/X6J+Lf7iaqXiCoYyr+
 VbLbcJeHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAiF4sYfjKeneEX1798LnPM
 nhyh/OCbZn4NG44qXwv1k+769nPGj20M/0Oby0zE9zCWfFlw6tfJ9xIVz+t284v+MG/Zr/StR/T
 CHRYA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080906_842096_3C1ACAF3 
X-CRM114-Status: GOOD (  10.67  )
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

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 arch/arm/boot/dts/microchip/sam9x60.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
index b075865e6a7688005d471665459b3f6f1f26f7a4..338a0f3b336ffa6f1e3f900a4b4a58e4e3f93bb8 100644
--- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
@@ -353,6 +353,14 @@ AT91_XDMAC_DT_PERID(26))>,
 				status = "disabled";
 			};
 
+			gpu: gpu@f0018000 {
+				compatible = "microchip,sam9x60-gfx2d";
+				reg = <0xf0018000 0x4000>;
+				interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+				clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+				status = "disabled";
+			};
+
 			i2s: i2s@f001c000 {
 				compatible = "microchip,sam9x60-i2smcc";
 				reg = <0xf001c000 0x100>;

-- 
2.48.1


