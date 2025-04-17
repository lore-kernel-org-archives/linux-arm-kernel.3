Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33C0C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqfxeWiL5mg3eLlMpj6Ixu2GTI5vaS9FIG9KJTJ9PHM=; b=PZWzY+vWlmim1uplTBwmm24HP2
	dxQU2zFBp/XH9YKnGM58tV7c1Y/ny8FbDrsU1Me/Tinm17EjrC6RPBGdz9JpkodnSCU+qdQRJ5/vD
	6QYIl7lNm8DvImKwVuA+eLqPBB1sSvpzpTrRoyh+mM7zbc3YWkhspAupTQsyhNEqLg9g5z4z77Ols
	tMM882fYfD4lSjGbyOtBiMiYlUohbzlyPJdcz0b3eqaEAqtQ4vyHuJRl5RPZ01z+0LVH+T+q1MogQ
	Lp4AShuzsSxfTqGJt1q/9X3QaWsIDctuWELtn/KAZWrTFYZrLDSZdrUsBipnL5+X9lvcjfltIdj7e
	oNXomRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5VfG-0000000EG4y-1edS;
	Thu, 17 Apr 2025 20:16:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5VdO-0000000EFoO-3udy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 20:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC0EC68472;
	Thu, 17 Apr 2025 20:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D49EC4CEEA;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744920893;
	bh=aMdEh0YzLhR0ClRxPLS5MigjInPEcB5sd9INEKNsS88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EIx9DsuhfuFuwmHju7KgUg3LgdojFfQ6201BXFB78CUJ3NVL1Mw0QxfQMq3tMPgUC
	 aJXjFcGZhU5GQI71AcIVlJaEvCjX8Y87c/OkjrOfnvcy3DJ+EwlWuf/mSKeYPFuNzI
	 q0jVrTPWG0K+GHHNKoiCqpSD0jMbK+uh3nVCFbmgDo14JzpIqM66U3nkFWpxxjYlGx
	 tQcsDZs+8DTQo0d29sg41oterajbSFdplWu4KDStMoIn6XmR0Xg8HM80Q9PC+Qf8VG
	 W4zj8MSlQgBQmhGdpCR2z4Gp3fBo0OcTTOElM8Q3LlI64Kg8Ypzw8LVf5bYnnAYVJ2
	 7DcT2DdwNqL9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CFCC369CA;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 17 Apr 2025 22:14:49 +0200
Subject: [PATCH v2 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-spmi-nvmem-v2-1-b88851e34afb@gmail.com>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
In-Reply-To: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744920892; l=2493;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=qFT9kwFfU2f7bD/dtTWCsGgokdHWxW+ICVtDXhupydE=;
 b=7IzgqtLCTQW165We2ILZabYySsAbC1WMcO6dkhnI7toHak+Agj/KAjWbRRLLMVuRpw6guwkRE
 oiqh8S7uXCKAe+ZjaHXP/rZjUDEKFY1nnujyaguKlLQa72zBDU45qgE
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add bindings for exposing SPMI registers as NVMEM cells

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 54 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d16b27128f97b5d38fb6ddb5109c70cda5e2ee15
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic SPMI NVMEM
+
+description: Exports a series of SPMI registers as NVMEM cells
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,maverick-pmic
+          - apple,sera-pmic
+          - apple,stowe-pmic
+      - const: spmi-nvmem
+
+  reg:
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
+    #include <dt-bindings/spmi/spmi.h>
+
+    pmic@f {
+        compatible = "apple,maverick-pmic", "spmi-nvmem";
+        reg = <0xf SPMI_USID>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            boot_stage: boot-stage@6001 {
+                reg = <0x6001 0x1>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
 F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
 F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
 F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*

-- 
2.49.0



