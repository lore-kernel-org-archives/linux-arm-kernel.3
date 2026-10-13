Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D5ECC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijn+ih/Q433KYekDPNI73gbzpi5KW6K1yDdb5JKu9Cw=; b=hubUPq/QejftRXPhN7vAZDmO9S
	X9fPofxoLbShqqRKUO7bxe7R6XPgrxQJ+L388sReyKgVhiUarAjSFTBR+P76dlZ9GS9wfFJBS7/+u
	yzC3CHmac3Iude9pC12iq9zhk7527VdSnW+iIbsjNcsb5bQmRhyNz8P56PSwUkJCV6OE+QN3BVbXU
	5bNgVwf5b89wLxgCgsC2ly0OSniSSurIRHLzbHd6lDea3e7qN/MD1IEGatgCjNOyXIjAGa9PaBfk7
	MYCm2SxOiwvEtIdX7CZEMWy1RZnTojKFVk35OjatJMNWYKHukKFejd081bXqtcig0T9iTjVOyZitK
	ChsV00Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfVp-0000000DYRe-2X1P;
	Tue, 13 Oct 2026 16:38:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfVl-0000000DYQ9-3toB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791909483; x=1823445483;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
  b=BM7PBBQtKcZ4gLOkHrMrXy7Ivc0QeTXxXgyKUeNfeIvnMo1B1+tGzsYr
   MC3TH7JHZrIkrR5/e+uy3J0hR8V1PFVsSkgGumZDzOSB9ALINRutYNRVU
   jE1vSuV2vWkITxwszcLRE598q32rQXgoJB9QQcES1g9/n+bl4tVTbZYel
   0cP92Ms1Akjk99vokS6YNEgvMsA8e3Scw9xWOF47itXCGf4OfHQe8X1u8
   wL2s7FjnyfhCWvXT0nSF2PEqXCHj/o6dAnR+yAFOv0WAaX00c6mcp3FmL
   oZrOylo4wS6M7fJyZLNSSeNEdbUIi+J9prG7KLQueCaUbhSG3LCv4Kh13
   g==;
X-CSE-ConnectionGUID: iemulpAURH6sc6gEF2PvMg==
X-CSE-MsgGUID: naGB6ideTLm0McSAMAm0nQ==
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="232062271"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 09:38:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 09:37:56 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 09:37:52 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Oct 2026 18:37:25 +0200
Subject: [PATCH v11 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261013-cpitchen-mainline_gfx2d-v11-3-7527f2efab0a@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=+u2grcbCdhxCd975l0htRzcuvftDxE2QAvyE3v3OQ9Y=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ9a5uEDTM7OtudtyTLl45myem7no7b6z0nbzJx3yL7p/9
 Fod99lvHaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAi2x4yMtzUr/nJcrBg3cGI
 KaIW1YqN/b/jyn3uNNooCdj9ur1UkYfhr0xRn3ZFvGhNkOP2GvGJbNbmG4U3+zd+aaoo2OibZ/u
 KEQA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093758_008303_2473B99F 
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


