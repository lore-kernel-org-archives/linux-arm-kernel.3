Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0B5D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJHH+54/7iVNE4i4diSPI10UBcoNqAIc7OXNq8bnSuM=; b=fGeVVueG0m6BeiH80XqOIWUwjf
	x/pVdo2zCK25a9G4e+9XlKYym4tf7DvSMv1klMzg+7QK8YrG0yO0gODvDU6DOLmKxb4I6Uhsd8Zoh
	CwA/S/eFggvq+tZ/fKB8o/eZQfuPkyDh7KYD0DU9Z+f/y/0GFoNlQdiBu1hCH3SHpedLu9fiPkMPG
	0EM3fEwbbdZZNaWVErSct3yW6HCdQgE97PVUBmh4PLDq5PYaBufIqCcmW6sgAez/Xr2WtJfSilPGx
	4MZTlwCVtn4kIx6dYTvu8ZtsaaSa4QMBaKxNLDFxxOkbNRCg5N1+7H7GDyFxOvW/S4p55/t3UT3nJ
	gNlohgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAVE-00000003mm6-3T18;
	Tue, 20 Jan 2026 12:06:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAVA-00000003mjp-1f2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768910786; x=1800446786;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=2eXSGPP5bHZvIZVUTzZbcAndWWo39uIzV1dzMrzYILw=;
  b=0d1A7/i0TuanLy8H90C+ttCuzKB5r+H9zNk8fHaXEoZTOoNP0NSXYLPM
   sjnbeJdnLzrsLJlMm+9L9X6jBMx0GtBmJj8FKVmIFcYpQqjJL3gdCdgtd
   J4R5QN8KhaMpjwCzeP1Uyefw5kdrD5aRtrgMxECGd4iVbPoTa2+HdXe6W
   IBOGC3hA4IaLJXqCqaXvrplcql9AbQ7u/37/AfDW1U+olvsEgJWbAOTR+
   XQQMVY5Icu0l39pZ7BvTMN5GK5WtlrYqRj4ZApoJekrmnAf5oPcp+CQZT
   P+n1uDHExg9cwAipz0wZm397uPZmwoNSwPU1XNb4XoD6cMxX6ntgjUnZa
   w==;
X-CSE-ConnectionGUID: RIjIUVvaSN6E1cLoqpze5w==
X-CSE-MsgGUID: +rLIYRWEQaS685PncyVxDA==
X-IronPort-AV: E=Sophos;i="6.21,240,1763449200"; 
   d="scan'208";a="52590465"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:06:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Tue, 20 Jan 2026 05:06:02 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Jan 2026 05:05:58 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Tue, 20 Jan 2026 13:05:34 +0100
Subject: [PATCH v6 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-cpitchen-mainline_gfx2d-v6-1-1a16cd1d70b8@microchip.com>
References: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
In-Reply-To: <20260120-cpitchen-mainline_gfx2d-v6-0-1a16cd1d70b8@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=2eXSGPP5bHZvIZVUTzZbcAndWWo39uIzV1dzMrzYILw=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2Z+/gK17q8+RSfD9T5c9C/5+UxlWsnE+yZd20stl88Xf
 sXgfmtSRykLgxgXg6yYIsuhN1t7M4+/emz3SlQKZg4rE8gQBi5OAZiIZBbDf8d5h5R4s8KPuU5e
 dzL/6J8d2zZIafIezH9Vs7twfv783fGMDHueFR1wZ4q5apjkYHzO/s7RfwlZRz0Fj/kumpvc4zL
 1LSsA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_040628_502892_64FA8F0F 
X-CRM114-Status: GOOD (  12.00  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
---
 .../bindings/gpu/microchip,sam9x60-gfx2d.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml b/Documentation/devicetree/bindings/gpu/microchip,sam9x60-gfx2d.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1c0faef83900e5771746032f1ad6fa9388f16da1
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
+      reg = <0xf0018000 0x100>;
+      interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
+      clocks = <&pmc PMC_TYPE_PERIPHERAL 36>;
+    };
+
+...

-- 
2.51.0


