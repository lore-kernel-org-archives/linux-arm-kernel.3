Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A922C9EC76
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vbVaccjXTiSZv/bz/B330dGgKa3JfQ2/noGNEvAIDg=; b=Ejmh16YVCYRwSz9TdgG+zfNDW7
	HzbKuHzKLdooJ6iiJ5bOhR5VPNtvB9Jws5DdfqHQcV0cIVOPBQM56+HA/fD8zSp2C79GbGot4zbuJ
	JegiH6lkMim66SJrFjk5D+weUymRp4dsdT7AF040IFgKdjXaWBEndcR3IloUVxaROTybN/E+bjwKs
	WjaynZWtdUkZOveNSPMAhSggmatYkxFPu0gkgJiI/RtdW0AlZNQF+NGUblA19RKCmralEbfSuwM4j
	IWhqyHtDNwKHrgftYwoewBhkVEENqw1yALGDMvj3inRL6df8xX3D3i+H1OgZn3Q0w92P1FCjkr2un
	/6FWO5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFy6-00000005Es6-2Bnm;
	Mon, 12 Jan 2026 11:20:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFy2-00000005Eor-1FP9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768216814; x=1799752814;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=/EDpiv+xt9RiRNe7Z3N4mA4E34lVS7KV2XC1qtYwZSY=;
  b=YFr7kZfuEmwMSXwlLxbg+ocWVZCe4NajnZqR71u2THv6Anx+CTLUGt7O
   fc+TkFlUVy3vXT2fi0J2UbHxTLUEvv7fqrD7qXJ8EJJVbN/tHtC2Kfl7N
   7sxUIpj/NmnrmTpzX6y/b3cnezooIdDT+ZL811H6kRqqzMy94Jeql1D68
   pd8iD9o5+8xqCBuBT1fBmodxMtOVQbtJuZghlyEdUY/Kj+mOe0hKlvgR9
   61csi1rbW4MZinWKKc3PEcYl1VukJpeh3OxznNg7ozB/oTxCkxgRGdcM7
   Zffoe0gYKJUVZI03rAcru9GetwdPFUhPOp9ReEZD2vXvPxn0RNSdNpUAF
   g==;
X-CSE-ConnectionGUID: qXHm4p2ATUmsKhhoHT7QVw==
X-CSE-MsgGUID: Zw89udPMSemI3v3P3nhQSw==
X-IronPort-AV: E=Sophos;i="6.21,219,1763449200"; 
   d="scan'208";a="50991527"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jan 2026 04:20:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 12 Jan 2026 04:19:02 -0700
Received: from ROU-LL-M19942.mpu32.int (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 12 Jan 2026 04:18:59 -0700
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Date: Mon, 12 Jan 2026 12:17:56 +0100
Subject: [PATCH v4 1/5] dt-bindings: gpu: add bindings for the Microchip
 GFX2D GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260112-cpitchen-mainline_gfx2d-v4-1-f210041ad343@microchip.com>
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
	Cyrille Pitchen <cyrille.pitchen@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771;
 i=cyrille.pitchen@microchip.com; h=from:subject:message-id;
 bh=/EDpiv+xt9RiRNe7Z3N4mA4E34lVS7KV2XC1qtYwZSY=;
 b=owGbwMvMwCXmf6yzKqEsVIbxtFoSQ2bKjbnR2gtvn/9hdcK8dWNhIcP1iT2BOiz8u6Qe8dtOM
 gmI5J/TUcrCIMbFICumyHLozdbezOOvHtu9EpWCmcPKBDKEgYtTACbyJY/hn3HSYbNLa3Rc2Lef
 dXu74eTkqR+ULqp6NrKoeIr7H5tld5GRoeUAb4ec6VvTTlX5ba+nvMqcbXneeI2s6e2T29c0BU6
 vYQIA
X-Developer-Key: i=cyrille.pitchen@microchip.com; a=openpgp;
 fpr=7A21115D7D6026585D0E183E0EF12AA1BFAC073D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_032014_412070_6A469884 
X-CRM114-Status: GOOD (  12.22  )
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


