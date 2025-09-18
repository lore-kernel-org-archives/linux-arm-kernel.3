Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156F7CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tPjxzVHYBMwgG+A6cgniPmEf4h5Qe3gDqDI304iQqQ=; b=deOreKYrNPE3zV9VCaFXiXdHYD
	Q0yXhc8JQo6jaCQoShRuRipGZB/SELYXzU0+XLDJ3Ki2tyvDT4h+o1nNdhEBncqvjANfxxZ2Lrzh8
	AckNTKj5LMJCmjbiQ0UG+jHE+rNuzLR+3Vbjh+RnYXNxf8ySYJ2aNoniTYcjIG52JTcOMiHw4B7mY
	5z2rvvqCoa0faBkvnG285/37l0UkcXE5iKivLieiSdgXVlFLBmFeWU+44wDDignHmCwKXmd30Dp/Z
	ldQGJ+gRx5aSxbF07j1hiHYAExxMKZiyyRLofVn77NCq1kI7/iT4QAbzRlv/l9URy3DEMC9AoUV6r
	GGbt55ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGFz-00000000HdD-1jfl;
	Thu, 18 Sep 2025 15:09:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGFt-00000000HZ5-1Po1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758208145; x=1789744145;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=o9AvCqe1RapLzw4aumy2aAH7frFxWhYPrfFn5/14nH4=;
  b=xyuQ1JRHWygsuG99EPnX2Fn+BmCs5JC0cfVWtqaPWi/5hzj+tj5wD53E
   mImCdYrh4p01orkz+qv6b2I4G/sSd5iLzu/gbOs7QkJeMlLAEpsgvOYrg
   yISodilkStTpOaLCYGi6W7HZ62NWEsCXJcaU3C3AIKMb+XmxSwgcilSqs
   ZR3OvmAlbB6HdM2dQgQXFlHU5rMm6lKwrl6NTNrpJsghJqLBo8/joFVw3
   eYMRC25sPtLMBrcDRbmZxX4ywDAYJdOCA0bRki1YoNrdnZ7ntlsQiPpZ2
   EuaeGUGSV7g2S3Ay6+EyTLDaiys4hnSVN9aVN/nPR65ttRkt5bDvDvcOw
   Q==;
X-CSE-ConnectionGUID: ugeKBCocT/GeJhh6l5hQPQ==
X-CSE-MsgGUID: kDOUUt5uSPa92sro8bHbOg==
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="47215035"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 08:09:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 08:08:28 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 18 Sep 2025 08:08:25 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 18 Sep 2025 17:07:35 +0200
Subject: [PATCH v2 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250918-cpitchen-mainline_gfx2d-v2-1-6cfac9d56612@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=o9AvCqe1RapLzw4aumy2aAH7frFxWhYPrfFn5/14nH4=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8YZheT2tDWp024cqN/DOynw3Mrw28r/3d1Y8h9J1r/JE
 5r6Ia+mo5SFQYyLQVZMkeXQm629mcdfPbZ7JSoFM4eVCWQIAxenAExkXgLDP0v9VT6llRvmXlx8
 apO47DfWmyqmJ6WaU7S1z9WIM/8+8oGRYVrqtquZ9p+2rFA/paq4L+q03NqXU9ZMZl5+59TpTmX
 dIEYA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080905_445506_B67ECE22 
X-CRM114-Status: GOOD (  12.38  )
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

The Microchip GFX2D GPU is embedded in the SAM9X60 and SAM9X7 SoC family.
Describe how the GFX2D GPU is integrated in these SoCs, including
register space, interrupt and clock.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 .../bindings/gpu/microchip,sam9x60-gfx2d.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0f223ddda694e7edbc9f25c68d17ef01897a55a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/microchip,sam9x60-gfx2d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip GFX2D GPU
+
+maintainers:
+  - Cyrille Pitchen <cyrille.pitchen@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,sam9x60-gfx2d
+      - microchip,sam9x7-gfx2d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    gpu@f0018000 {
+      compatible = "microchip,sam9x60-gfx2d";
+      reg = <0xf0018000 0x4000>;
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+    };
+
+...

-- 
2.48.1


