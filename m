Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6256D2D0F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vbVaccjXTiSZv/bz/B330dGgKa3JfQ2/noGNEvAIDg=; b=s7cCNLRr02MC9VpJy48mLvRHyA
	Ek6AZfBTn/+KyVh7/TMwwViFeICmCoWMpNKseOrYZ0zc7DIlQOLw/U7Zg5EOmojHL/9UCqb8ByKU8
	DIPKt403VJFwUXOVyVsO3pr1tcURHhCOVbWS/rXK4z+FUxHcmWKRzGfUsn3fJ+U8JLKmWE0J1Fa8f
	jREEG1PJqvmHExBoxiSMaLe/luPbf040axylgMsRcoL5hoj0bx1XHWIthTIKVeOsOVChei+Kf7/2Z
	pwJlMnTljkWPp4IhIuKbhGnygEFFTcOI95MiPJX2AEcUvDlqb4/1IkmE3Tzb4OLTiVldgQNzDaWhQ
	WPM64x1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBc-000000078Xe-3S7R;
	Tue, 13 Jan 2026 13:11:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfeBY-000000078Uz-3dhC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 13:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768309907; x=1799845907;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=/EDpiv+xt9RiRNe7Z3N4mA4E34lVS7KV2XC1qtYwZSY=;
  b=pGvs6bmKLOzMtEEPQkMBF6tDTSHa24PDvRYGtlRRmBuYWTXbx9R7LDX9
   dWro4Bn0NHEDUpOCXRj4Zge37kb7zwZAXUMpFwLdlEealSzytV8iZ368U
   8+ORGv528kPq5olcpclIrlsXc0dHYPz8pgNnPyp/ZCq1FbmYG/hp/G/By
   r9aW7f6hZddKXzT4TUbZuAHTaeyNgFo9MCephgSCI6aaV3FQGOiBhr6+L
   iyk6CxW6vry3zv1N/EY+An/+8WwF7SryViAn5YupfPF/BBq8KmlKXeJKh
   4SX9juQwF+m0iZEVkf6ZmjY/qQO60CbR3RAUbBAH2lVlzrP4c8VMDaBry
   w==;
X-CSE-ConnectionGUID: 8rvEDYAoRBeujHnu6Z8ZqA==
X-CSE-MsgGUID: wZZY2brKTaW2ulabbL9MWQ==
X-IronPort-AV: E=Sophos;i="6.21,222,1763449200"; 
   d="scan'208";a="219095245"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Jan 2026 06:11:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Jan 2026 06:11:15 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Jan 2026 06:11:11 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 13 Jan 2026 14:10:37 +0100
Subject: [PATCH v5 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260113-cpitchen-mainline_gfx2d-v5-1-9cdab8fa699b@microchip.com>
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
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=/EDpiv+xt9RiRNe7Z3N4mA4E34lVS7KV2XC1qtYwZSY=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2aaS9btA/tsOGN3q/l7dfNsqmzgXliXJ7VPzG/Dvtjrz
 wJ5Ard3lLIwiHExyIopshx6s7U38/irx3avRKVg5rAygQxh4OIUgInE5zAyrOCzEig4ZR3jwXxh
 k6Rg5xb/iq8B8+NVCm9y71lQL7Pfk+Gfeuykn13mtkK7b714JDRrju9C9QCDWXZuLy1zN4TFH93
 GBgA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_051148_960650_32CB324B 
X-CRM114-Status: GOOD (  12.15  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.51.0


