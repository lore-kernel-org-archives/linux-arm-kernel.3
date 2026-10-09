Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D58CCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmZ0yJHie14bIXV5WA5IAqbzSShTvMSKctXnC5rUdh8=; b=b+RaNbwGa4H4X9a3wfSrVhLmER
	xtm3aLY8eHCts9KtZFQRR9ayNUOFe2tcq9zCWwIa0hDt0yhgCZC54fzGAyi6VmF+qkc6KZSBCSRaP
	xjY1SqnV03qzl/Qkh5u1xOstBD7skdl2/kF+bTf4zbQ73PYp38a1cX91PmNapfXvYSl2kHpHBczte
	O/4fQQ+oZ7sSU7tY5TXuROCXQ3vh6hFduBLtRLNV74ZWlpcK/aFGW/5FLA2RQVDHRS1mu57gKpRmy
	jGj60xK10MTAxbI5p+IVHH7r+0lKd9xkGYzcYoNNmI6rX8zkBPU9wWds64Q2CG3ktzuKLpWHUoitC
	pr9NOSuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VJ-00000006Grf-2DOo;
	Fri, 09 Oct 2026 12:15:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9VI-00000006Gr3-1rgi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:15:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C47560DC6;
	Fri,  9 Oct 2026 12:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488C01F000FF;
	Fri,  9 Oct 2026 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791548111;
	bh=YmZ0yJHie14bIXV5WA5IAqbzSShTvMSKctXnC5rUdh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NhVRVeSQhmlACXm6A7ETYx6o2Hi9E2rfzYBIVSi+2mI0zkaYN+2uB3bko1Piuw97E
	 3S+6SkZRC/ucANtjOEkS0Yi48toIkJaerZyulyzI9wJ9SndOcnOvlbnNBlA3N1C4rW
	 w481sgTjhKQBTMsPvawRuMvZ0/lC9waED0nA2jZfhgVrIAZ9uAfn67LRjyhlb/4f3t
	 Sd/L/uzzsAHhSJLpr7qqA2rK/sgQF29duxay8yQT3b9qcGIsoBR1B2FAxHLbFC1a1l
	 uNdJL7inlzzlWb0R8xEaO7XRHMXwnMqlFPfqMVTEuUycJXZuXZlW0mc2LBjtQvBGNl
	 UR3M8UpqA4pHw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 09 Oct 2026 14:15:04 +0200
Subject: [PATCH 1/3] dt-bindings: power: Convert Ux500 PM domains to schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-1-5eb1b90bc35e@kernel.org>
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ------------------
 .../power/stericsson,ux500-pm-domains.yaml         | 41 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 42 insertions(+), 35 deletions(-)

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
index 000000000000..bf83ce332674
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
@@ -0,0 +1,41 @@
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
+  indexes defined in include/dt-bindings/arm/ux500_pm_domains.h.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..560079711469 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3273,6 +3273,7 @@ F:	Documentation/devicetree/bindings/arm/ux500.yaml
 F:	Documentation/devicetree/bindings/arm/ux500/
 F:	Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/st,nomadik-i2c.yaml
+F:	Documentation/devicetree/bindings/power/stericsson,ux500-pm-domains.yaml
 F:	arch/arm/boot/dts/st/ste-*
 F:	arch/arm/mach-nomadik/
 F:	arch/arm/mach-ux500/

-- 
2.55.0


