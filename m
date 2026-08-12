Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DCAC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93jM+J+lP3mtxvwi0EkvYqkk7JnNKj4lbENkiARVaow=; b=U6K9kp0Bf8qLQlIqdClhQiLUvT
	KPwy+BiSt3rsr6+25I2VlMwAtQnUAfh9vPIONmWqnafJ4d+KjxGaCpVrIZF8T3ilWZFaY7RA4V3nw
	3g+S8gj8gBGB+St3BaRtlW//jZJMLTzADHlu2A0wTg4KL+aobaJaDA6PoPspbzTwNOM1PVV5bN6Sl
	tKBSQM98jHneBF7VESNPYXpdaz4EvSj6T8qZisX1dG3ICvwv4uOy3dNEF1n1d1jrSmXQF2HefPf+o
	GsVT6CS4ZLq2lGmbQZAw+a9uYCj9nhIhT/3BmSlVyWU/oYFLvkqMQfGHdgKR3W/fycKHA0CAQTTB1
	A9msvvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Xq-0000000Fwsk-3PK1;
	Wed, 12 Aug 2026 10:50:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Xg-0000000FwnI-1ywu;
	Wed, 12 Aug 2026 10:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786531840; x=1818067840;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9sspgSaYTLzPxx3ClMpy7dqKoUQ+jVKhLBbkq1ajX5A=;
  b=PLytDoqopcDwgWHsQucyUaphrhHKkKZjFmjHgG4xKdiNiZfkLH/dKUw2
   JI63Tre670YdaWADb1PnXF2VO1x65mkiW7zYV5Tyz3jC25y3E6dy/4ZIV
   dutRMP5+uwKs8kkQdk037pKUI5Qkv3pFaNuzWyq4sIuNFtDBnB5H+ZRIw
   aa4Te1RB0vSUtY+TDKCbA14iKNsRZ3cYK/TB0jwG6UWwxpsU564eE0ET7
   NG94maVErEXLtCsNSHFlSy8PHWlKIX7F6/y3DwfCxug+zoW4KXclyUckw
   ilhuQKeG6qXl/yGrGRLz66huD/UyE5ki6kuj0V/dO0WEEfEaaS2S15toM
   A==;
X-CSE-ConnectionGUID: ePqpB5wjRsW4N7O3Nx2f3w==
X-CSE-MsgGUID: Tyu2GW8+RnWs/xB7debw+w==
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="62324112"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Aug 2026 03:50:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 12 Aug 2026 03:50:39 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 12 Aug 2026 03:50:28 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 2/7] dt-bindings: nvmem: layouts: add Microchip/SST SFDP EUI layout
Date: Wed, 12 Aug 2026 16:19:50 +0530
Message-ID: <20260812104955.485667-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812104955.485667-1-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_035040_599689_5BC37C41 
X-CRM114-Status: GOOD (  17.14  )
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

Add a binding for the NVMEM layout that exposes the factory-programmed
EUI-48 identifier from the Microchip/SST vendor-specific SFDP parameter
table (e.g. SST26VF064BEUI) as a "mac-address" NVMEM cell, and reference
it from nvmem-layout.yaml.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../layouts/microchip,sst26vf-sfdp-eui.yaml   | 60 +++++++++++++++++++
 .../bindings/nvmem/layouts/nvmem-layout.yaml  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml b/Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
new file mode 100644
index 000000000000..37357efb7840
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM layout of the Microchip/SST SFDP EUI-48 identifier
+
+maintainers:
+  - Manikandan Muralidharan <manikandan.m@microchip.com>
+
+description:
+  Some Microchip/SST serial flashes (for example the SST26VF064BEUI) are
+  factory programmed with a globally unique EUI-48 identifier stored in a
+  vendor-specific SFDP parameter table and permanently write-protected. This
+  layout locates that table and exposes the EUI-48 as an NVMEM cell so that,
+  for example, a network driver can use it as a MAC address. The location of
+  the data is discovered at runtime from the SFDP; no offset is encoded in the
+  device tree.
+
+select: false
+
+properties:
+  compatible:
+    const: microchip,sst26vf-sfdp-eui
+
+  mac-address:
+    type: object
+    description:
+      The factory-programmed EUI-48 identifier, usable as a MAC address.
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+
+            sfdp {
+                compatible = "jedec,sfdp";
+
+                nvmem-layout {
+                    compatible = "microchip,sst26vf-sfdp-eui";
+
+                    mac-address {
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
index 382507060651..e63b93083821 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
@@ -20,6 +20,7 @@ description: |
 oneOf:
   - $ref: fixed-layout.yaml
   - $ref: kontron,sl28-vpd.yaml
+  - $ref: microchip,sst26vf-sfdp-eui.yaml
   - $ref: onie,tlv-layout.yaml
   - $ref: u-boot,env.yaml
 
-- 
2.43.0


