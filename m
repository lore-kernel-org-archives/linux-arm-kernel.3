Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE32CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgQrLmoR5UysWXNDyUe0kLQ0kXA+CSQM27+pikOv+vo=; b=Tw1qnGYT1e7reR4bpcl/07UqmF
	RJ88O61ymjH6OjIiVMN4hK6hud5UbKjklfuZgkqP6HDpBy+NHH7iH/auUFym0PY2uDl9IbO4RgRIo
	stWZqaXxRke9WsiY7UN5fO56QXxU3TeHROR2vM+hqgK/2766l9R2QCcvVPWqo8SyMYrpeCD1vBs0n
	KZ1dO8Y0w97r9orafTAmiZ4R5VIgcc4oV9jigr7V9dGgG2WIxhA9ZaYF7iObcvycsh+Z66ENMRDin
	XvXwMmgTgv/YLy8gTGYPDXCkm3ylGqv7NYV/KBj9DsgxZd09XDh9xhZhfrP/cwOi1mg8C/SKrAont
	GRF7Nsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjDm-00000003tBM-1rAt;
	Thu, 11 Sep 2025 15:28:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjDj-00000003t8G-3dbc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757604503; x=1789140503;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=G0vF1nRRo8OGJwgxh7Qj2pyP4VAf4yh2TssGDuryO30=;
  b=1iZ9Cj6KM/xJwkjgmrvBC5Js0Lwh3JlrXOeGZka/iBioCrNdodN4Dh1s
   q9zqH84WuwmZQcZ+k4CLil2kWNy9u0j3IThSxkpahmbopV0owhBzkGIJT
   oK4EjFx+G6DpnRN/t+Iqw1qHP/9DPDLjsteTi1HorG1LIAFJA12RFRVne
   73zTSdquSducbJFoCGDgwxnroVLeBTbcG5FYsQDIcHkTiC5DGDKB5payo
   kwcAgFNHusAzVLZqMn62y+Zf0Q0sHW6wh3J6/vMuQbgewQuyjVLGsJnDV
   zjYncAlQPe+fBkgwAK6NWFCbSGNfDI4QJao8i9UjJUbsfyDBYGpjPBM1V
   w==;
X-CSE-ConnectionGUID: wLSDZ5hSTNSXS1TQWmJymw==
X-CSE-MsgGUID: rw9Z7iT0R72cz3BXA9hQCA==
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="213773302"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2025 08:28:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 11 Sep 2025 08:27:57 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 11 Sep 2025 08:27:53 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 11 Sep 2025 17:26:28 +0200
Subject: [PATCH 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-cpitchen-mainline_gfx2d-v1-4-d7fab1a381ee@microchip.com>
References: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
In-Reply-To: <20250911-cpitchen-mainline_gfx2d-v1-0-d7fab1a381ee@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=G0vF1nRRo8OGJwgxh7Qj2pyP4VAf4yh2TssGDuryO30=;
 b=kA0DAAoWT8aJemB2VRwByyZiAGjC6miimge2+cexOmj7icCfis/c18+WmVfwOURkp1iomv1CN
 Yh1BAAWCgAdFiEEwuy1jWnH6uM+6hUaT8aJemB2VRwFAmjC6mgACgkQT8aJemB2VRz1+gEA4/xg
 Np9W2rxV/CcHc7TPcOH/0tkY5Aqwc5s8/VbnmvkA/A4ecn/d3xQVu3MagJtATPhmnsaCtwZzFT4
 4+BFGKT0G
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_082823_980727_F18F72F5 
X-CRM114-Status: GOOD (  10.04  )
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
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 66c07e642c3e1a2272490ec311062dfdf291c1cc..f4b71a49e6c167a0c9ad89b0c58fadb1ed467a5d 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -271,6 +271,15 @@ AT91_XDMAC_DT_PERID(38))>,
 			status = "disabled";
 		};
 
+		gpu: gfx2d@f0018000 {
+			compatible = "microchip,sam9x7-gfx2d";
+			reg = <0xf0018000 0x4000>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+			clock-names = "periph_clk";
+			status = "disabled";
+		};
+
 		i2s: i2s@f001c000 {
 			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
 			reg = <0xf001c000 0x100>;

-- 
2.48.1


