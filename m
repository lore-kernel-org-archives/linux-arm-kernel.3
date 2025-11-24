Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83146CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tce0MZ+w3yV9rpgAMKuFlEPlioZ2LRo/cTilOKQJLME=; b=Vk5Yzdls2uvzdFcIR/CadfiJy/
	cjXJLd29G/M/Wp3b7H/AqPM7KqGompvUnS/JRh1LKQGIQrFCr7C92+9Yj31onxPo8L0cP3IQddEih
	p2wx8YghlerFW5iSmvWC6gx+kHpX5UL/PPegXeA+a/yMvT/pX3OFb4bD/0+25U59J9n7uDxuGGx/b
	/O2/noKs5Gp1MYe8uC4BzFj66FKbQisueSL4Oq8HaPe6hEdWYbwhiL7PXKwgAS2A20u4QqJnUGbKH
	Slk0tEUM09CSKF6pfV+CAtxAMu4plitmct+zpJ32XoSrEO0NiVj2H/QPHXwCJJ5aDQhyamfRZ3AjY
	Un37+kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVNA-0000000BbjT-1uFN;
	Mon, 24 Nov 2025 12:08:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVN9-0000000Bbiy-14Xi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 12:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Tce0MZ+w3yV9rpgAMKuFlEPlioZ2LRo/cTilOKQJLME=; b=X+7DAcn3YnP/QGnzjJ6grgeXT1
	efoe383DfilMX0DRdnhkSoe1UCPTtTp/BpKoBQQaDlatAnwdLWxTc5V+0bscOixBExn/PNjq1bASt
	3cSjbF2wiZ2gk1tiApl0jmczo7ILksty5vJny2V7wDfU0J3WG7mxKN4sR2b2RHVhpQ7rIJYYi8eaY
	dPIhB3O7eYPZJ3yo0RYAKInVcLMkWuI8G0veGcV/CwBZgz0FQUpGYBAZbp7Nylm2akmv5qrGaPXtf
	LPUAM5FqoL2T/fUZDD85wuuHoAPOSrkogBIcOzwDD8uu7Vgevexy42FX+BOqwcy7TmfX7MR/0pC+p
	qF9pFwDA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUVT-00000003bf3-44YL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763986121; x=1795522121;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=PG4wSEX77CXNfaW+kOPrPS3wXYz3EgWni/UqQoAtQSA=;
  b=VcM7uo3xKdM8cxGJSrND8VLDz2Vi9XjU/0KVnNeNZ8SMujDmTKZjL1OC
   kdUARi++9aZQxuvK3afUM/WCpto/M/mGyzWJnYCkQyYVeVbBZzeA0lgEw
   O7v2N+t5jLd6k3MwVpjS+gLfnTHBN2gpFebBiBRekvSKCE9I5r/7kirmS
   iKFIQacro7KCMsxJ3fl6hB9Hxy2o6ms0kAavZK3uB8IlRHP9Ovl4/jZgz
   D520olS0FupwTAc92wDTgxBaQZ1EljaPDruqw37Y1zlBQkUcr3W3t7bdw
   x7BLy9ODjUb39a4Zt5u7TLInPeNaIWNpEgdb9dFxBrEATjbH2RTtDD2lT
   A==;
X-CSE-ConnectionGUID: YHrtvy5xRn+N01J9f5nEwg==
X-CSE-MsgGUID: ZD/nry72SmaprGTnlQRd7g==
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="280948038"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2025 05:08:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 24 Nov 2025 05:08:05 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 24 Nov 2025 05:08:02 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 24 Nov 2025 13:07:17 +0100
Subject: [PATCH v3 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251124-cpitchen-mainline_gfx2d-v3-1-607f8c407286@microchip.com>
References: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
In-Reply-To: <20251124-cpitchen-mainline_gfx2d-v3-0-607f8c407286@microchip.com>
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
 bh=PG4wSEX77CXNfaW+kOPrPS3wXYz3EgWni/UqQoAtQSA=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ6aK15zYa0y+qes8l3LI3d+t/tv7hbR6zjJTux1tW/p7S
 u0Zvbg7SlkYxLgYZMUUWQ692dqbefzVY7tXolIwc1iZQIYwcHEKwEQSQxn+Z6ednzsh4uruzTt/
 bN5tYOBeyme/WSFpgezsc1HqWnob+hgZlhsVzYu8pVLuKHestf+Qqsex074d/4Xm7enivOzrL7G
 CFwA=
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_111320_898244_540A3EC0 
X-CRM114-Status: GOOD (  12.06  )
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
2.51.0


