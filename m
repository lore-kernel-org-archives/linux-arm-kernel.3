Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUWb/CcjSnuu/zRrdol4Fbo696rxkegMYGydXx0/eNo=; b=ykvA4Ab2hasYU0jHjyX6BLzLqw
	BIWPg6xNnFI936/9bAamriZ8BEPmpBbin2TRBkvrVUUHhS0i6ueB9mw6qzguvdv+W1PdjVqVZQ/gZ
	cSBlTnRvosla5sTT3a5wCCJ+CIHCPM3pH7GEUBDur4kbb4Xu1rRcIVRd+iml/7kXaYM8ksDEo4GZv
	+qV75Dp8kq5bhs9Hy4o1oPEIg+kMM3cxbTyhSeuXYXjRGTdZ+gRYCwfzJLo4NnE3bjEtraK4cfGGl
	1Z8LSV1tMMJ1RFsZbJjzLMT22QYstzgTOXT5zUCVpDozRoDfNlR4Rz6wdRAfBo/XJpT1JbP2dl8CR
	R1eL5dhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGBz-00000004PTX-3pim;
	Thu, 02 Jul 2026 12:06:55 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGBv-00000004PQm-2UO7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:06:54 +0000
Received: by chaosmail.tech (Postfix) id E1E821C99A5;
	Thu, 02 Jul 2026 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782994006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUWb/CcjSnuu/zRrdol4Fbo696rxkegMYGydXx0/eNo=;
	b=VnTaLvsXZc2mgE2EesD+PcyFIGgOdjzA4N9AfutsVKw5VIrm3Hb8JqN19r6+67+9qEu1IM
	SnImmgIZoL5F5dEWgmKBjgxIljycXDzATC8XRmfhYmGICD9lEa0cI3CpvrWuEnplj+P8D2
	c+5wohD/hcZjQ/Ix3VoKZYiCNmVoqgg=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Thu, 02 Jul 2026 14:06:26 +0200
Subject: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
In-Reply-To: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782994005; l=2562;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=j5hsB19O/gI7PDghu/Bk2CyHrRFqcTcAEEQaPelKHJU=;
 b=mzWNSVgT0DW64WULlkv9oCBP5q5bXWWfYFP0xYpkwqasNXDDkCs5aXz9Tq/ppm1J/a27ajoDY
 n8A3h/PyQwLAklkWWSjiYD/ljhr5+bY+/LoGtr3lDEFLMcfDnQVhS5O
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_050652_109147_94E7F164 
X-CRM114-Status: GOOD (  11.43  )
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

Certain Apple SoCs include additional PMGR power states that are
controlled via a different "misc" control block. On existing SoCs, this
includes the fabric and memory controller state.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml | 45 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                            |  1 +
 2 files changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
new file mode 100644
index 000000000000..30abedc67fa4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SoC PMGR Misc Power States
+
+maintainers:
+  - Sasha Finkelstein <k@chaosmail.tech>
+
+description: |
+  Certain Apple SoCs include additional PMGR power states that are controlled
+  via a different "misc" control block. On existing SoCs, this includes the
+  fabric and memory controller state.
+
+properties:
+  compatible:
+    enum:
+      - apple,t6000-pmgr-misc
+      - apple,t6020-pmgr-misc
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: fabric-ps
+      - const: dcs-ps
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pmgr_misc: power-management@8e20c000 {
+        compatible = "apple,t6000-pmgr-misc";
+        reg = <0x8e20c000 0x400>,
+              <0x8e20c800 0x400>;
+        reg-names = "fabric-ps", "dcs-ps";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..5a29bb86499f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2607,6 +2607,7 @@ F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
 F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
+F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml

-- 
2.55.0


