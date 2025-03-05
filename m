Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE26C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJJRgcYYPlbf9C2o39jHmPlycmS5YzRipQhRr2sM/W4=; b=F60YHumYMA+yOXe9I1aqsU+4YC
	rR8f+hMjrxoQzTPYSc3ZoRMjn4t9L+AXRcRyIdSdVBBMMynKGWNcipd4HkUDhDGByUZutnRgZ5wbQ
	ABrcsM88lZUmKGANG2zmdXl+fJjdIMMuXINP+6O955OUUAdazsYFsu3PbroBNTl/B28Wq7jCmZVvt
	c3YID90c6el2eQe5O5gZ37PpAqFam5l3uG+eimIra/rLdfrkdrpHR8gaEiIgNPWpW4lRUbMVkljb8
	99FlxB149QjnPoFHhByO5WTJmDXWwZttKHryhzUY7FiYkVy9L0DTb29n7n6ln5HVy2hQW+Ie8BGSR
	Y+8g6P6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwqB-00000009Qv3-3lG0;
	Wed, 05 Mar 2025 22:03:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKO-00000009D3d-3CyQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=VJJRgcYYPlbf9C2o39jHmPlycmS5YzRipQhRr2sM/W4=; b=fYXQXru1alsiN6gdTDMG9vfwvP
	CvJ43fUSQEqg6i8ZZj+F/i4g3EiIx/UBPik7Gtokfd1nOvNNtzW3XOoUHn4ieMWR4C4R+s2WQ7taa
	fRmQzX+pRq6KLOjTTDSPwKpw4MxYXf7wAKsj0W+ydpoT4lu+9C4z+T3jX7xeWLpenngul6pDscIWh
	4PASlUcb2SxfqY5FXoCugrFXzN8FJQ90NK99I/oBQqtTMi47xt4RFNHVwK07zpRez2k4gFpiEjnhd
	IgIlQ+C6aEF0zdbnVPTMtjXZpp7e6O934eS8bgTazxpeWRLC4kMgj9Hpr6LEuu5ddk3ve/ShkyYYY
	XjkTsGNA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKL-00000006AOo-2X8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FA5B5C6C8F;
	Wed,  5 Mar 2025 20:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 812D5C4CEE7;
	Wed,  5 Mar 2025 20:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741206405;
	bh=0Ss8o6p9OpxjRooVXnCwtLf8ZlT4HLr0yLlZ/0eVlz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HaFsi8qDt7Nu9vvTolC3BwFEy6Cw604CuOmHSUsiSwWULnMJ1wDKIBXqMMnsxzc7m
	 UhcxXox3TYkpK2iQZ32R0Dfjt1l/V9wvq7LM3TE1PDCRLlyXw7+R7xkLMCArMhE74w
	 DbRXj3kD5TtkAP26zozNViBiSO/Ldq/FJC7COoNVp+CzBHvJ8ndh8ZIGvmUOqinHB5
	 WCeobUFcwybdT0dWF8VFHLkpPz6TRNtvdMpfjONuwNHWWJiWHUA3VLTkrVijUexuWJ
	 WIYFWPy9eqMBW02UVKZHe/ip96/7gkP1j2hJ4bd0D2ZRCF6Rp8rrZ5Uv2gB4f2Vse1
	 z3HLoBfRu65+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695AEC282DE;
	Wed,  5 Mar 2025 20:26:45 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Mar 2025 21:26:39 +0100
Subject: [PATCH 1/3] dt-bindings: spmi: Add Apple SPMI controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-spmi-v1-1-c98f561fa99f@gmail.com>
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
In-Reply-To: <20250305-spmi-v1-0-c98f561fa99f@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741206403; l=2492;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=KNCBkhvO52J1kQqvsaBk59bvzteIeD2Qg+hhwDOkSh8=;
 b=5o0WZ1+c0ucvdM6/lf9SLYn/flQjuj4eWosyV4AxUFxiT4FxuzkMZec1i08klmCfEx8z9wf/4
 ATiUt9Vffn2B0+YTjEQYhTnH48l4lXt5vU448Lw2lGvREW9KrEGKqpR
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202649_875026_75D731F5 
X-CRM114-Status: GOOD (  11.80  )
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

Add bindings for the SPMI controller present on most Apple SoCs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 .../devicetree/bindings/spmi/apple,spmi.yaml       | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6404af8adec52f4631200c48956f4c1695e88a39
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/apple,spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SPMI controller
+
+maintainers:
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: A SPMI controller present on most Apple SoCs
+
+allOf:
+  - $ref: spmi.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-spmi
+          - apple,t6000-spmi
+          - apple,t8112-spmi
+      - const: apple,spmi
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "pmu@[0-9a-f]$":
+    type: object
+
+    description:
+      PMIC properties, which are specific to the used SPMI PMIC device(s).
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@920a1300 {
+        compatible = "apple,t6000-spmi", "apple,spmi";
+        reg = <0x920a1300 0x100>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmu@f {
+            reg = <0xf SPMI_USID>;
+            /* PMIC-specific properties */
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0e33544fa373a4978b7dae18c040c..271ff8110df83c2d4fe7fbbfffc0a72259460bc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2236,6 +2236,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c

-- 
2.48.1



