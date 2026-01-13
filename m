Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5560D2D0F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMdYgHTpNlITHXVinHvOGufH3SnYv55unWeKXvbUxF4=; b=IgjztVEeYtgvI8Rwt7aGGktjer
	FqEfkKhQeYlLgOmh6hO5TcDZJ35PGMhwKe6RqnJjssSfh3szBaNWoiaU1yVDh9up5JzM+35F4rfgk
	9LyFvisbDtxQj+alYRb1wV4L3/hGCE5/5TuSM7F7xbvVIYRCsqCQPfHSbIl6oyfwte1OWoajgyQ0C
	JA5FSwefrJ1ice5/M147mr05x5QAzjiv4yrBniGc5Ri3CK5AICY2wllUbycuNRE1dprODpU5ghN4t
	WV2prQeVoVDEYKlHEyGNTk9+RN7/pBBDDXkp2Tb8PhZc9xBhLgV4Qrz9BLEQJXBUvaeXeASAOflON
	S2NuD3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBd-000000078Y5-14Nh;
	Tue, 13 Jan 2026 13:11:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBa-000000078Uz-1Nrd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768309908; x=1799845908;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FQMKbDH+KVpbfbw4LnNPRQHYGOGtEYypT7zQgzx6SWI=;
  b=Pd7jprrRyJF040uANMNi5PS01GKA+DXH/Nvqw7iAEIVlYTtxaZdk72oQ
   tE7XCgkrCtYpWkmCSOAtyLwBYo+F2B60jTMeqLc3u/jR4Y1/C5N/0lVTv
   8J58vzMDu7xD3K5cJAWtPZF/KJQpCxW5Y12CuLFJAEnYYqA/Iu+ZF7iBb
   g2A+vDy7pT2vNlRMuZL9v3Im2gO9yJE+oCL6u0HS4N411w0Y6XpSzk/ex
   kdXmOJeXvYuq9+QzXof9/84Q1sE15fWtDgR4Xy6Ik64+zmPyVOrAfBaSi
   FUMMVc2nT9d2bK/tzKmvk8o0njgB8fxNWRwlWOx9lJvtNw/fOHm2zPp0Y
   A==;
X-CSE-ConnectionGUID: 8rvEDYAoRBeujHnu6Z8ZqA==
X-CSE-MsgGUID: yh0PkwHVTxu1lKgCh5mNgA==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="219095248"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2026 06:11:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 06:11:21 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 06:11:18 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Jan 2026 14:10:39 +0100
Subject: [PATCH v5 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-cpitchen-mainline_gfx2d-v5-3-9cdab8fa699b@microchip.com>
References: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
In-Reply-To: <20260113-cpitchen-mainline_gfx2d-v5-0-9cdab8fa699b@microchip.com>
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
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2aaS/aG1kouH+EOp/kHeqdtORjw/vPFJZ8OetyInu2nc
 dvRhk2vo5SFQYyLQVZMkeXQm629mcdfPbZ7JSoFM4eVCWQIAxenAEzkqDvDP+vbJbcbXUWcuKaE
 lJ+6HvFx4Z3nz8T3eTI19KmF50zQsWf4n933atIds7/6XI9dWvKd2I+Ll4r9P5ZqJTibT1oj2XI
 pHwA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_051150_424504_1DFA3F2F 
X-CRM114-Status: GOOD (  10.13  )
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


