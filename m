Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1FE10F9972
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOJEsvDTW4Ey/lUSDp0kL7esO3ZCACa219SbXwsk7Js=; b=ZPAoB/bcrkDDAtH2wLhyt0URwt
	cE7r6vfiK3phY6itrXlw+d6Oy+5ABeKBgQxaWhwcwUbDRCAegUj/f241pBZCHaEISoIIRhvZAObn8
	3yf4ANHzHP4aLbC5A2m6MGK2zT7Bg9z1xmiQ4vG0it3KcYPwYU7bEA+S2qTJSVQqfKLBvtQpxgxu2
	5B/m8xvuAt39xT766jzx+AIlaRm+1Yl9bPVWZwqmmisLXc8lZCV3gD7P3Ah0P6Z15/RWwQ2si5nhO
	x4sHUwuuvlqyd3bu8rrsBOi2fUrTZi+FyA9hp2cNCWeAlCDm4byaAxCqv855xEqO8lP4f1+1Owuv5
	7Z4L/u/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYn1-00000009KKd-15gC;
	Wed, 08 Apr 2026 19:42:15 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAYmw-00000009KI6-3UxH;
	Wed, 08 Apr 2026 19:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775677331; x=1807213331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JswzvqIUM/Y0snFlKb+yBLx2iydNCgWMkhaiYqyvcrU=;
  b=jUhKwJ1W7gov/JYBLSaNT0h3O10vyWoQ945eo7O8Z+W4ON5fM+o3lZM2
   3ZK5pterbLXBKbKTKt+HVNITokkdZ/eOc1x4momVDn9E/F6UBGRxGuStz
   61LcVdddLIuT2YkjmVrko9hPOrSthY8vcnpKiJEg5jJgFbQfexsGxvcC2
   cp2iu14/Zt0IA/hRVrkzgTftsV1tp41sEK279hfDAO67835xq4lf8jQ9p
   gXniqtD06AJYICxN7FGKlWgq0XdfgX6raFanfBY/Ir0XK4oCugSDfTDvE
   +TXESbYC6tm0ONDXvEaMQDdfZqHbsK8y8dYGFiYJr1ec+j2j0v6Hx3Jbu
   A==;
X-CSE-ConnectionGUID: e5Kx79BtQru8vH2ILFaDeg==
X-CSE-MsgGUID: OOPZwBbZQz6juImHROO4cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88056920"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="88056920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:42:11 -0700
X-CSE-ConnectionGUID: fU2drvZHTDqcQFHupFc6zg==
X-CSE-MsgGUID: ecX8swQCSCSeREGdg7ZbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="222053381"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 12:42:07 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>,
	Dawid Glazik <dawid.glazik@linux.intel.com>,
	Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
Date: Wed,  8 Apr 2026 22:34:35 +0200
Message-ID: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775679285.git.dawid.glazik@linux.intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_124211_827676_DD8A0A17 
X-CRM114-Status: GOOD (  12.95  )
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

Introduce the device-tree bindings for I3C global registers found on
AST2600 SoCs.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
I wasn't sure if I should add newline at the end of the
file or not so I took
https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
as an example.
---
 .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml

diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
new file mode 100644
index 000000000000..edecc18796a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c-global.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2600 I3C Global Registers
+
+description: |
+  The AST2600 SoC provides a shared I3C global register block used by all
+  I3C controller instances. This block contains per-instance global
+  configuration fields, including controller instance ID and SDA pull-up
+  configuration.
+  Each I3C controller references this syscon node through the
+  aspeed,global-regs property.
+
+maintainers:
+  - Dawid Glazik <dawid.glazik@linux.intel.com>
+
+allOf:
+  - $ref: /schemas/mfd/syscon-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: aspeed,ast2600-i3c-global
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus@1e7a0000 {
+        compatible = "simple-bus";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x1e7a0000 0x8000>;
+
+        i3c-global@0 {
+            compatible = "aspeed,ast2600-i3c-global", "syscon";
+            reg = <0x0 0x1000>;
+            resets = <&syscon ASPEED_RESET_I3C_DMA>;
+        };
+    };
+...
\ No newline at end of file
-- 
2.43.0


