Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236F7C9EC73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMdYgHTpNlITHXVinHvOGufH3SnYv55unWeKXvbUxF4=; b=AzfmJCX6WGs/61QrDkTwhzi5bP
	FLCEL4FLQ7aHhLHiuHc5v4XJlR3OFbHIBIU6KeDYM38fGF3Ibyg+YIpq3nQX/BsJRxSReDr028pro
	16P0IE1YS5W2oU8A+uEidTudA0QZXMBN2cUeSLLIcI5CVs5JoxDEdSDND/A9ECkQ/VrDjtGCmv2n6
	JMNaX9RcQUBhtNuHxhHs5fZCt6fCm+lXhXLbKXIsODBm1sjuk+ypep1aZqPR1FRO1m/nXQI0wRe8d
	3tLPNUWT7EjWQ0w4SynlzjFrqxZbMN2kgPSRM3lRxaoum5LUnI5oO7X4cj7PkoTMX1KPZNubhvIad
	RTrCAr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxW-00000005EUk-1DQf;
	Mon, 12 Jan 2026 11:19:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxR-00000005ERm-33W2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768216777; x=1799752777;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FQMKbDH+KVpbfbw4LnNPRQHYGOGtEYypT7zQgzx6SWI=;
  b=uEowbPPeliWEMgBBc9nBg+zlpR1k8ylfU+/TPQ3iSPSwm+m5GViUNoHl
   PJk5ePA/QWqNNh8NxJPp6k7vAAwuDmUnEB6yCb2ekzINQ5dg62DeOaCbA
   iEbRZJ/QBjdM9Ei7mxrK/C5U6+iQrBZ4m2dOwJDS99/MVAPb4E1wXs1iC
   UpIxNct93TeUXxJ+SEwe5nv8hxOIbO2eopMHWAkotyjLT5JEAYsT1j05m
   1iLh3Kyymju164KuxntMrOJ6Tgtt1n2JFlo4726Fgx+5RephVphLMK34g
   gxFqF7/cNf8hpFvQftBEBDWAIk1CZPQ5hhrq3S7KBQPCT1nTWErgtg/qV
   A==;
X-CSE-ConnectionGUID: ZruLiW7wTxePdKgkmfGDiw==
X-CSE-MsgGUID: 9myXGp1sTBWMkR2az03IBQ==
X-IronPort-AV: E=Sophos;i="6.21,219,1763449200"; 
   d="scan'208";a="52175794"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:19:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 12 Jan 2026 04:19:09 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 12 Jan 2026 04:19:06 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 12 Jan 2026 12:17:58 +0100
Subject: [PATCH v4 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260112-cpitchen-mainline_gfx2d-v4-3-f210041ad343@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=FQMKbDH+KVpbfbw4LnNPRQHYGOGtEYypT7zQgzx6SWI=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2bKjXlOyxtLj3/yCLn/MjYkarFfo9D3e30KjyZKH3n4m
 CNy3cT5HaUsDGJcDLJiiiyH3mztzTz+6rHdK1EpmDmsTCBDGLg4BWAiFrYMf2VFZGs5Mz4vZIlJ
 q8+wt3nOfKr70auu3tvVWX6VzGar6hn+O/vw55mHv2Cctv/yvM0lnf12FzOT37u/niiu9/XBP49
 2NgA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_031938_052464_7D7B3278 
X-CRM114-Status: GOOD (  10.42  )
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
2.51.0


