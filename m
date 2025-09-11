Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF0CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pm4rtmrvmzak3T6LyQrg/vpX/OsctGCPi4Nt5WlEdD0=; b=YR36sU147kPJEG/eECUV1vXfdP
	7lMDkB2gG6kGWwP/sVs/Ja0mL6K1oRE5J1AiwAGa4a02hFSL3+iLPihJKAIGHa9v9EAXJTtZy03hs
	db2Qx2ET/ol5eQoFy91i00OQhGVeYEZ18Jeie6Hp1OrKDfS3+t50NKfUr/XxFolCPxwMTMJ5JW2Sd
	EUBcbyYoYpqD5PyFlPXVjSB+6XUqRyty0KaXBYTeVdEp6rZLq3y2yD/QCgLOgWVkecZEC0mPPK/Th
	drHYT29loM46gK5HCdE+0bA7BupVmHZHiLjk25ZZGeX+ZnkBAeKWedQ5h2wZXpEwo8HPQiFHXYstV
	n8MPry6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjDP-00000003sv5-2iau;
	Thu, 11 Sep 2025 15:28:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjDM-00000003ssO-1cIw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757604480; x=1789140480;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=vPI8d+Ewn3tGtC66dDnYrvhtUwCZSoHr3JQkHahYKWs=;
  b=S+mo4z1VHlE+uoPcO53Qfd0Gnl8D2eCHRxq2KzwOoVaLNL89MJuvkGcg
   l1iFCsK0RZ1kFdtDyX25Ly/K77anIxH/yLZzeRszi9OpV0uoqlpRirj3M
   JmxnBp+SIaui6++l1QCdBA1C2Z/JS+dM4O/bA6QfwNsHRXzRE0nFvaa8I
   3AbLBBmPBbn0TPN5jghjuJFuZELWsoeMKQM3d4sIfuZGMZGRNhYhvyFIc
   TQOLZ49cf+ZnQmGJWeofvo31FDStljgJe5Ct1GZRbNx3PFOWHmw0ATz5z
   EJKOJ1Sy3Uds3PTBhTtTFJin7UWqbnb/ZivtEBOIo2riKCUOv2Q0jHDBZ
   Q==;
X-CSE-ConnectionGUID: GfrnwuRcTGGvDy+5ZTnmUQ==
X-CSE-MsgGUID: mleIvvMGQdmn2L4xn2amqA==
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="277761655"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Sep 2025 08:27:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 11 Sep 2025 08:27:44 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 11 Sep 2025 08:27:41 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Thu, 11 Sep 2025 17:26:25 +0200
Subject: [PATCH 1/5] dt-bindings: gpu: add bindings for the Microchip GFX2D
 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250911-cpitchen-mainline_gfx2d-v1-1-d7fab1a381ee@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=vPI8d+Ewn3tGtC66dDnYrvhtUwCZSoHr3JQkHahYKWs=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ8ahV+mhj7ms1RXWHHLc7+u6KW72C9Mv29e84n9xblrpI
 /aFRkendJSyMIhxMciKKbIcerO1N/P4q8d2r0SlYOawMoEMYeDiFICJVEgx/DN5MDcj3pWhbzGv
 b0RvasW9MqeDv17Kdt7Zv2B7xo/0R8qMDC/3uTTFt/OYNZu93G+sdXWf3skTFx/e2qtrf/vSuRK
 dPh4A
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_082800_599849_476EB20B 
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
---
 .../devicetree/bindings/gpu/microchip,gfx2d.yaml   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml b/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e416e13bc6627a0fef3c70625a6a3e2d91636ffc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/microchip,gfx2d.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/microchip,gfx2d.yaml#
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
+  clock-names:
+    items:
+      const: periph_clk
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/at91.h>
+    gfx2d@f0018000 {
+      compatible = "microchip,sam9x60-gfx2d";
+      reg = <0xf0018000 0x4000>;
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+      clock-names = "periph_clk";
+    };
+
+...

-- 
2.48.1


