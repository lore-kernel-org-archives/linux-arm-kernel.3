Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AA3C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO1z8xJoHZLlfly0VpQlILvMOLZUDXdV8Nv8wm0Dkis=; b=eQ1vQtQOeKnrJLMGpAzugrfti/
	YSFSh27ZxKkOjGGUsd0BFwbXX60vDCSFxF+tr8IDAoUhUtoF7jXTkDLGfkYgqHLWLfenezaCUBHAR
	SlZH7H3yoKPU/3zKGrhHJ+8VujkzTW85RlJzuCggG5tVQbGAAQ6jTPdpOCvCsEoKKB7PdWsbeVJnN
	Z5hkp1qHtOmvmDokzIWTGh9wStT/JYaKf1cWigID8k5ZzaIV6m9158UfYtgONcVVi+AjqccwdeNFD
	kzyuz13swE1XPXBAbDs13xv2K2+u9845Mjafb24+pH0zzdOSe37VlwAB3vUPIhLB2DxnsPO1VhjGi
	p89ajKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdG4-00000006zqq-1SQ6;
	Fri, 03 Jul 2026 12:44:40 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdFz-00000006zo3-04xF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:44:38 +0000
Received: by chaosmail.tech (Postfix) id 1E1C41CC21F;
	Fri, 03 Jul 2026 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783082669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UO1z8xJoHZLlfly0VpQlILvMOLZUDXdV8Nv8wm0Dkis=;
	b=hwmvX7YLo+Eaeq790/UkvPkwitIXG8Ibu/5kzNAp0h3WKL2V1Bp9oRQtXMrfru6eIIsTUo
	EAZsYfNca0n3XnH6cqrs9cAzsEvAaYeRU/+l5HtqXPHMafv11nc4Zh7XJMqFqZFo50aYaF
	j4tSMDeZKiy3Hh+BpQwLDHsgP3ElWqk=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 03 Jul 2026 14:44:11 +0200
Subject: [PATCH v2 1/3] dt-bindings: soc: apple: Add Apple PMGR misc
 controls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-pmgr-misc-v2-1-4b26ba10c5a4@chaosmail.tech>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
In-Reply-To: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082668; l=2534;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=BJVjcPz/91pDy5lAxC0+QPRWdZ2oZGo0sATIv9YLulc=;
 b=cdXmE8f/Xz3ElHqQOsZwiEfiTKj8buduky9ERZpfPyn9OAz8VBR+OfQUloP3zmEWcEWBohonV
 lpDGSfmuD8mCoBZXBXQMrMIPSohTT40I1i3tEMX7UQU5hAgRvEgFpAr
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_054435_525815_4AF7ECFA 
X-CRM114-Status: GOOD (  11.47  )
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
index 000000000000..588100222f89
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
+  via a different "misc" control block. This includes the fabric and memory
+  controller states.
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
+    power-management@8e20c000 {
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


