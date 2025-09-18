Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C066CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEkdLktlDvN1oVUv5Lqzht+cyiipJS09AUc5YnCU0eU=; b=OYI2F+lSVq7cAb5r7jM7vFxag+
	3avR/ben/Q6k8uggwQym+F0yK/qNHdjhA5jHRkPYRCzmzeCRoeuYymuDIM7zPuSjIKbVEwQjcnTol
	mkqmU+bDDN7/fRHCxK8KODlC9wBEaHKqcxV+8n8+GYRA55GZfHVQLpn3WQZEqw3hKXI++eMlShURT
	Qhlc3OuWOLBJcOod0FyPSTGOkyigikHn6A9lQN3weW+ByYMxBMZFmFcpYyDOxGnyHY63fK/HQtJEG
	twW2vQK/wpW6HUrRVwXr5ImLb1AoQ01yhgEZPL4lcBb6i59YZmtRoLXs08Mfc/6Nibkd2rnu4iWGY
	SIuqEXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGG0-00000000He1-01u2;
	Thu, 18 Sep 2025 15:09:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGFu-00000000HZ5-2yfP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758208146; x=1789744146;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4j8vRBELdW0QshfmtFprRBJA+qWBo/IXVvkjTX5z0Qk=;
  b=JplNVxCig5esDpJYYp5NpWj9awgS+eKKuaLVpXa2kmYr8UxMRakJAJpu
   kik2EiadSShUYv3wjeEz388Tpu3iNr3vKoJvR3dtslMC91YZtda/gHGyi
   Ih48dYu68QNKpDKqDhUNLVY7Q7tAo379DBEx4FxZlceHBmUy+o/KzyeqO
   eTH1CAW5cP1gw5EHIS97lxlsB7dL6BlCfXnZdS1eC0/h8Hq220IEbfJm5
   0qvPBMU31GH1NFHSUGt9NdqqXG+k1TM74HiWX1nRE+wrTR9PP2z9+GEKu
   1IgWA/9B1UJv8m5+iL9ZhOojiA1oQFGc+U9zdAmksL4OTXXAQTaQkph1q
   Q==;
X-CSE-ConnectionGUID: ugeKBCocT/GeJhh6l5hQPQ==
X-CSE-MsgGUID: V29oNPwLRZ65zNFa1cLTlg==
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="47215042"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 08:09:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 08:08:39 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 08:08:36 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 18 Sep 2025 17:07:38 +0200
Subject: [PATCH v2 4/5] ARM: dts: microchip: sam9x7: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250918-cpitchen-mainline_gfx2d-v2-4-6cfac9d56612@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=4j8vRBELdW0QshfmtFprRBJA+qWBo/IXVvkjTX5z0Qk=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8YZhZQ37Nq75l3qvefYfzKjbPrzXxOk579ddPmukDzTu
 vQXQi6fO0pZGMS4GGTFFFkOvdnam3n81WO7V6JSMHNYmUCGMHBxCsBEKmcw/DM+mvPU9k+2yc9/
 4onT3BmZZq/7ciiuWyw+n//s0S/XBZUY/kdqZYhHmyub1uqmz+tbeePZjsLQ2bJcG7ied3zbl77
 DgRMA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080906_862963_48BE0D97 
X-CRM114-Status: GOOD (  10.57  )
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
index 66c07e642c3e1a2272490ec311062dfdf291c1cc..d61a7e2da5b587bfe399fdb51dea4dd6c6b9e552 100644
--- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
+++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
@@ -271,6 +271,14 @@ AT91_XDMAC_DT_PERID(38))>,
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
2.48.1


