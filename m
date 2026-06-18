Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B151CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 05:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hm6YG6cYRXnPPLN3x33sVrstf55brzszsJigeyAotVY=; b=buf+zWXboZujpNb0D5aOfzs8VI
	QnhD/RxMW+WMEZG81dxvEQXKKWltTcwOzT/CCVAHNbf00KCfrCklRBF16c/dHhKqbhDxOk7NzReqC
	bJvI22V0AHcVaf2WXKS4sVQETuXHGcODG/B6Bo6Hln/iQ/drkAXVLfd/SW7VoDpHFt8CxCAGJHX7P
	OTOo9VMXroJ91XlGXid/ieTw6H3XhNqZ3pqd5IPVt/BRWNIr28QgGAJwlwvZkyGI89s/nbHY2xdip
	O3sf+V+oVObxuIG5QNk74pJSpc8Ddz0nPcwYMs8KcRsqXvoNsX9VjwHv0a50rsK/EDZJoy3isKhMr
	X8WU/8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4s6-00000000dFG-3i7R;
	Thu, 18 Jun 2026 05:00:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa4s5-00000000dEe-3KkL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 05:00:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EEDC40971;
	Thu, 18 Jun 2026 05:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8F11F00A3A;
	Thu, 18 Jun 2026 05:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781758857;
	bh=Hm6YG6cYRXnPPLN3x33sVrstf55brzszsJigeyAotVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Q1Jk18erW5MUhnnmM8SvL5vMRUAx/8jsJ9R6O43fYyJSnBdfIspiNFHzACeB8rOKW
	 HNSCQyN1chfEB5LnwJbEV1KeO4TTw4mCgbVdiLbb2Y+agJLmB0GMx6ndUrGqrdjbqw
	 zHOhuEHbLDIzCgftXYEPTGyiFKTWGwDh3TxzVIYt2cVcDQqe9jH2x76sy9Rf3DdQ6z
	 +bEoM9MJFeSjjNLPOVYDNiP5MFj+sreRwLC7JjBLyn43q0scMZhLAUcgIV4WTSy7TN
	 axcLoRQzVHQWhv3Z1gxaK8kssNLPkGjT5tF6NxtZcM95DEdq2HDD9R/j7h6qJ0Vv3v
	 hH3g1C8G3gVfQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 07:00:47 +0200
Subject: [PATCH 01/11] dt-bindings: power: Convert Ux500 PM domains to
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-ux500-power-domains-v7-1-v1-1-eb5e50b1a588@kernel.org>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Convert the legacy Ux500 power domain text binding to YAML.

Move it under bindings/power.

Reference the generic power-domain schema.

Update MAINTAINERS for the new path.

Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ----------------
 .../power/stericsson,ux500-pm-domains.yaml         | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 47 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/ux500/power_domain.txt b/Documentation/devicetree/bindings/arm/ux500/power_domain.txt
deleted file mode 100644
index 5679d1742d3e..000000000000
--- a/Documentation/devicetree/bindings/arm/ux500/power_domain.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* ST-Ericsson UX500 PM Domains
-
-UX500 supports multiple PM domains which are used to gate power to one or
-more peripherals on the SOC.
-
-The implementation of PM domains for UX500 are based upon the generic PM domain
-and use the corresponding DT bindings.
-
-==PM domain providers==
-
-Required properties:
- - compatible: Must be "stericsson,ux500-pm-domains".
- - #power-domain-cells : Number of cells in a power domain specifier, must be 1.
-
-Example:
-	pm_domains: pm_domains0 {
-		compatible = "stericsson,ux500-pm-domains";
-		#power-domain-cells = <1>;
-	};
-
-==PM domain consumers==
-
-Required properties:
- - power-domains: A phandle and PM domain specifier. Below are the list of
-		valid specifiers:
-
-		Index	Specifier
-		-----	---------
-		0	DOMAIN_VAPE
-
-Example:
-	sdi0_per1@80126000 {
-		compatible = "arm,pl18x", "arm,primecell";
-		power-domains = <&pm_domains DOMAIN_VAPE>
-	};
diff --git a/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml b/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
new file mode 100644
index 000000000000..72c39c083efb
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/stericsson,ux500-pm-domains.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson UX500 power domains
+
+maintainers:
+  - Linus Walleij <linusw@kernel.org>
+  - Ulf Hansson <ulfh@kernel.org>
+
+description:
+  The UX500 power domain controller gates power to one or more peripherals on
+  the SoC. Domain specifiers use one cell containing one of the DOMAIN_*
+  indexes defined in dt-bindings/arm/ux500_pm_domains.h.
+
+allOf:
+  - $ref: power-domain.yaml#
+
+properties:
+  compatible:
+    const: stericsson,ux500-pm-domains
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#power-domain-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/arm/ux500_pm_domains.h>
+
+    pm_domains: power-controller {
+        compatible = "stericsson,ux500-pm-domains";
+        #power-domain-cells = <1>;
+    };
+
+    sdi0_per1@80126000 {
+        compatible = "arm,pl18x", "arm,primecell";
+        power-domains = <&pm_domains DOMAIN_VAPE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c8d4b913f26c..a984c4647cc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3167,6 +3167,7 @@ F:	Documentation/devicetree/bindings/arm/ux500.yaml
 F:	Documentation/devicetree/bindings/arm/ux500/
 F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+F:	Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
 F:	arch/arm/boot/dts/st/ste-*
 F:	arch/arm/mach-nomadik/
 F:	arch/arm/mach-ux500/

-- 
2.54.0


