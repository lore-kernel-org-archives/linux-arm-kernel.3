Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250D6EFD211
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GE1UuB5Zf3febGkFeJcabfLeF/rQloilvat6kJRzwk=; b=rSm8JWhpH/Y1YQJgkZtFCRhIae
	yklbNJlmOhO8+V/FFLRvR76hrJE4vCQUXZjLwBvEbaxdKrcJr43cg8k9ufjYRetH39rXk00uckOoA
	W8oL6SpyT6UhsFB/mdX3+ULnRcJQ1NPi2gHAY+ciggz1of5i04P0cPiQ5QGjLOSXNjH1E8tuIgaKj
	eFGHysJEA3Y5WuEJtTxy+D6X3JQI0Mq5Lf6iMiPdFdnOsO88oqeVuJNcuHy5kCzeDOhW8ua4/dttY
	f44wSrQGM7OI81fpZ6MgfKPYvlPwM7LkRb337G32zatERrDNOXF+z3UAYtPlJNVS/+xwahOXRF+oI
	1cnKXB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB8h-00000003g45-0FMr;
	Wed, 25 Feb 2026 09:25:03 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB8e-00000003g0P-0t79
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:25:01 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Feb
 2026 17:19:41 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 25 Feb 2026 17:19:41 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 25 Feb 2026 17:19:39 +0800
Subject: [PATCH v25 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-upstream_i2c-v25-2-9f4bdd954f3f@aspeedtech.com>
References: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
In-Reply-To: <20260225-upstream_i2c-v25-0-9f4bdd954f3f@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772011180; l=2721;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=oX37qsTcUQZ/XyFfLT9VnkE5sPvidHdjowEh6vs+5BE=;
 b=QqlvBQCChB3mqPzpYxnPzXFaa4Be4013ejFg7dEOh7fjspFug+AfMSLos4WUMeDHySrX0r48S
 mrEb9/haromC8gX4n8AtgegaCnyD1KHHhlsUjsaHtaF/bSOUTRPgVcQ
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012500_244543_552CD4EC 
X-CRM114-Status: GOOD (  10.76  )
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

The AST2600 I2C controller supports three transfer modes (byte, buffer,
DMA). Add "aspeed,transfer-mode" so DT can select the preferred transfer
method per controller instance. Also add the "aspeed,global-regs"
phandle to reference the AST2600 global registers syscon/regmap used by
the controller.

These properties apply only to the AST2600 binding and are not part of
the legacy binding, which uses a mixed controller/target register layout
and does not have the split register blocks or these new configuration
registers. Legacy DTs remain unchanged.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 .../bindings/i2c/aspeed,ast2600-i2c.yaml           | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
index 077be85137c9..c45c8ceaf897 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
@@ -37,6 +37,33 @@ properties:
   resets:
     maxItems: 1
 
+  aspeed,transfer-mode:
+    description: |
+      ASPEED ast2600 platform equipped with 16 I2C controllers each i2c controller
+      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buffer mode), and
+      share a DMA engine.
+      Select I2C transfer mode for this controller. Supported values are:
+        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
+        - "buffer": Use buffer (32-byte buffer) for i2c transmit. (default)
+                    Better performance then byte mode.
+        - "dma": Each controller DMA mode is shared DMA engine. The AST2600 SoC
+                 provides a single DMA engine shared for 16 I2C controllers,
+                 so only a limited number of controllers can use DMA simultaneously.
+                 Therefore, the DTS must explicitly assign which controllers are
+                 configured to use DMA.
+      On AST2600, each controller supports all three modes.
+      If not specified, buffer mode is used by default.
+    enum:
+      - byte
+      - buffer
+      - dma
+
+  aspeed,global-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to the i2c global syscon node, containing the
+      SoC-common i2c register set.
+
 required:
   - reg
   - compatible
@@ -59,4 +86,6 @@ examples:
       resets = <&syscon ASPEED_RESET_I2C>;
       clock-frequency = <100000>;
       interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+      aspeed,global-regs = <&i2c_global>;
+      aspeed,transfer-mode = "buffer";
     };

-- 
2.34.1


