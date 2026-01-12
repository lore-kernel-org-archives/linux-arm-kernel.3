Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE46C9EC6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5709uEBG2Uy+VI1LipKnJ6HbxTIyBuRpWdTcKY3NT90=; b=yuv5vYNo2GZrNRRwShjvP3kTbo
	rvJvd5imvyB+WNXA6G7lsRpD3C/Zbnyjbo9Dn/XYafdCdWo3n4GN6SBXifx+7WDMhTyNqXhLrz15I
	406nvYPDm+JA/E5NZiAh41Gi1jeXzMbCyZs4fzyGiwDO7ZVF280r3opTW6AkxpNjCa1kHufZC5eg9
	3TJyxV7ZxVyBFDGVPkt+TWBUuxTWYWlw2QNUYzte8WOj+JDJ35vl5rN8moC4SzS0fFtyfk+P6y/PS
	2Sz9xVfKEqYwn3lO+LesY+vxBdcF6sBWWa4uIHlI58qBow2YxcBiDDKmSmgvybbxgGK5slA4wLIu5
	3Uvp8gzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxk-00000005EcS-0BYP;
	Mon, 12 Jan 2026 11:19:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxe-00000005EXY-0nP6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768216790; x=1799752790;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9ej8J1aZ3loXRs29McB2qWVnK7bVOI1xJP2oRmJpeJc=;
  b=QYm5nu11sSQ7AQJvj3f7A4JCBLlr3Wub7dtX013amliIWrqbNbXdfvKU
   /gfbJZ6AwWrzyzN933IlO6Az+8adaJQERlJhNlJ3lB4hd61YWi1PqTJuJ
   uppl2wLGkrd8dOcKjCISpflWzeKa3Himbb4LODuGbnEWUtXFDi0WcNWBU
   aDQRsPrhspxzyB5hzaeNmYqRvFEpMh03JHrJrkWV/KkrwP6UuBFDJxnDh
   ixNRU+P7Sd6TR8fwhSiYGbyhr93pmF+S91h/Gvpv6e2h+PqMG/hIM9u3o
   jxXu4EHRhUUUk38e7HhpRQ2/CEUgGSS0uVFRn8KsixITVdbREV9rwyr0I
   g==;
X-CSE-ConnectionGUID: 2FQW9J3NQsejMtiFniwPwQ==
X-CSE-MsgGUID: 0fAS2BCVRAq74/RfstotZw==
X-IronPort-AV: E=Sophos;i="6.21,219,1763449200"; 
   d="scan'208";a="58675295"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 04:19:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 12 Jan 2026 04:19:12 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 12 Jan 2026 04:19:09 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 12 Jan 2026 12:17:59 +0100
Subject: [PATCH v4 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260112-cpitchen-mainline_gfx2d-v4-4-f210041ad343@microchip.com>
References: <20260112-cpitchen-mainline_gfx2d-v4-0-f210041ad343@microchip.com>
In-Reply-To: <20260112-cpitchen-mainline_gfx2d-v4-0-f210041ad343@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=9ej8J1aZ3loXRs29McB2qWVnK7bVOI1xJP2oRmJpeJc=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2bKjXm3rCYYf8r2WRHxbsHvqtchx8Lag+Nynn7evYo5I
 Tj5QVlVRykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAbjJBYwMn/10Ol8LvW3+b/b7
 5pPW2/8zy9a1e7a85Ly6wX3F3+kM7Qx/uJXqf81tX/C+q8ngXbLVPy/n4qPTxe8/T/kf/3+9wJl
 3DAA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_031950_262677_C08299AB 
X-CRM114-Status: GOOD (  10.51  )
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
 arch/arm/boot/dts/microchip/sam9x7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
index 46dacbbd201ddb68a7456d6fe1afafa59db90ec8..79a82962264f51c4c243530b9dad9010f8cf1347 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -292,6 +292,14 @@ AT91_XDMAC_DT_PERID(26))>,
 			status = "disabled";
 		};
 
+		gpu: gpu@f0018000 {
+			compatible = "microchip,sam9x7-gfx2d";
+			reg = <0xf0018000 0x4000>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+			status = "disabled";
+		};
+
 		i2s: i2s@f001c000 {
 			compatible = "microchip,sam9x7-i2smcc", "microchip,sam9x60-i2smcc";
 			reg = <0xf001c000 0x100>;

-- 
2.51.0


