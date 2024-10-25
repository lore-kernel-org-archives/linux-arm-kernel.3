Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FEDD0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLKovh7m+yI60Zvb7nhvOgVEU7nNjBthucfKY5rYw+E=; b=VMwmzCYQ0XwoD2YxO/N2yQrUKt
	JYnYG3je4RSabbucsZD0Up1o72YYlbKZH5c4rztH4TUS6xuvELEbScW2qQTdKSWHN4KnZxr5cdJM+
	54MFis7tsvQjACETAlUguI6Q+qsakW/KJviIYQnuh7B34Y1CsWofoMVfEL4XwC1LJY2kzH2GgSQib
	qNygHdLU2DR96Wz8FcqKsaBUr+OZkoDJAD7qtA7AFnD5UpBiGOOtoVGWBBYYPsIFtumG+TXKhe7HK
	wX/eOq8f1jT6gYI9Rb/sf2a2Vhx5xRsYY54L5zM1NbnP6IahADITsOon6YfZTA3Nxql3QCFO0afF7
	ZCqaM7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JtI-00000003k0f-0PJz;
	Fri, 25 Oct 2024 12:58:08 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Jh5-00000003ht1-3yFo;
	Fri, 25 Oct 2024 12:45:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49D771FE0C;
	Fri, 25 Oct 2024 12:45:28 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 392F513B16;
	Fri, 25 Oct 2024 12:45:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0NqAC+eSG2fzOAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 25 Oct 2024 12:45:27 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	kw@linux.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH v4 01/10] dt-bindings: interrupt-controller: Add bcm2712 MSI-X DT bindings
Date: Fri, 25 Oct 2024 15:45:06 +0300
Message-ID: <20241025124515.14066-2-svarbanov@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025124515.14066-1-svarbanov@suse.de>
References: <20241025124515.14066-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Rspamd-Queue-Id: 49D771FE0C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_054532_207425_B8DB69EB 
X-CRM114-Status: GOOD (  12.19  )
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

Adds DT bindings for bcm2712 MSI-X interrupt peripheral controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3 -> v4:
 - Added Reviewed-by.

 .../brcm,bcm2712-msix.yaml                    | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
new file mode 100644
index 000000000000..c84614663b5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2712-msix.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2712-msix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom bcm2712 MSI-X Interrupt Peripheral support
+
+maintainers:
+  - Stanimir Varbanov <svarbanov@suse.de>
+
+description:
+  This interrupt controller is used to provide interrupt vectors to the
+  generic interrupt controller (GIC) on bcm2712. It will be used as
+  external MSI-X controller for PCIe root complex.
+
+allOf:
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm2712-mip
+
+  reg:
+    items:
+      - description: Base register address
+      - description: PCIe message address
+
+  "#msi-cells":
+    const: 0
+
+  brcm,msi-offset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Shift the allocated MSI's.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - msi-controller
+  - msi-ranges
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        msi-controller@1000130000 {
+            compatible = "brcm,bcm2712-mip";
+            reg = <0x10 0x00130000 0x00 0xc0>,
+                  <0xff 0xfffff000 0x00 0x1000>;
+            msi-controller;
+            #msi-cells = <0>;
+            msi-ranges = <&gicv2 GIC_SPI 128 IRQ_TYPE_EDGE_RISING 64>;
+        };
+    };
-- 
2.43.0


