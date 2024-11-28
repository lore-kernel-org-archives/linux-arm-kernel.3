Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35930D69114
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzpFYlwmRDjUdywRFCwk3EMOwG1W4Bvy7VRMs6AVjzU=; b=YtyDGbsSQ7ko9IXo+MB6ULMt3K
	XTeSGbQiYcCgwUQlqYxr8JXQsOQpu7k9y6mJCvKusQlNB/VLsA43ss+HHZgdlEelDNO0uAls25ymt
	O4VQP6Vsl0/oQZp/1HQULIfmEsiSItF6GPZofJr+i/oFv/ZET7SvhLcMA/IcScAujMQtqPW2Th6xe
	tHFY62hiCZjq+QSecMKKmhZMjxMN3eN1esu8i5XFTyUYShDbKHxzUuQPLrUHbSRXYBblfXBSAYGZ1
	yoxAyp8zxAR2mIG95t4H0IpFdVcNhdlX8eCZLpY93IBIKArSlSqB1vjs+trXvGAdHh8TdjHj25DWp
	OiYOuGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgNB-0000000FsWa-3N42;
	Thu, 28 Nov 2024 15:24:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgGD-0000000Fr6u-2jqi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434aabd688fso5875775e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807012; x=1733411812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzpFYlwmRDjUdywRFCwk3EMOwG1W4Bvy7VRMs6AVjzU=;
        b=sd9c1B/Eucb5xLKs1LnltS+cFqWnPdbZ+xNsS+K14ql8uQCMjV/WjJL+kCiIXxViAH
         T3JGeqfTsJD2BqoVfaECSWyFEG2oDc+0Aq2kF0w/y+v6clO/II6BPhjXxoR0S4SK28Jc
         OHGaycYOgdOwz+WoWakNnWS/NUU/wFXCiipZh+qpv4AcqhsXpfyRIeN4s8eEu94qXGjI
         148Mt2M20slgdT6QYKyhoqwRdx68UZrjtuWGw2hiKsiiCwLsqAD9bYPV/6XDGCk4U8eF
         W3xkFhgVhUCtJq78rjDu2t9DBZJFKqEZm4IjeWhfYLtVUZ242ZsdxsTJLMM3XAVqFxQl
         oRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807012; x=1733411812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzpFYlwmRDjUdywRFCwk3EMOwG1W4Bvy7VRMs6AVjzU=;
        b=N1UYmKl9zSXEgEgy1siIF45ZdJgqm5JTn9H+Dks9Vvjsru4nDh6CccjswcSthyI1ys
         gfv0EwGZBQdCtbRRGlSN1a6f23tuMEJ0MB5+DKa7Aj1i8rwb8hLioujz27TT/jzNw+fe
         T6w2w331xycbAm+6N3nnw3nY1QdY7KuNTVloENXz2OgDJeXc4q9EqyiFTLVj1FNbz1L2
         o4drC32IMS3ie382XKmJSrNtgmNueph7lI6JRnQqhMJf1zvm1+goE73FlUCfutVFHmQg
         1VInPWUQinHAAJET8s2+iRfAJC/k5k3/RNTOKMb5xVtF420Bp35iWrTUI14mlpGyj0ep
         sOFg==
X-Forwarded-Encrypted: i=1; AJvYcCUlf7svChuCMMTFdT4TQ9Kilwp/8Q3M6eQKjF/QXNSFFrCcMQvjP+DNJgpCxPuPataBqt56Vh2y2bZ6GZtGz5o/@lists.infradead.org
X-Gm-Message-State: AOJu0YzQVhA1x6M3707OnUC//EKqAUrBFJ4a8xY5jONTybe79iX3UnHy
	Ax7uqGHN0SMbm24jME3DDLouQ7gQ0JCFScHX0lMnuWzrkG6xLPPywx+ZfPSUCLc=
X-Gm-Gg: ASbGncuJgcVVGl3vScnnPtVLOgwGpYd/GkF7UP4bHw/JNkH+TdFkx0jYii3SUndB9SI
	3DX2bLnucC3l8u8qxt/ozA6Znjd3gYnIxtWG0U91uSrKkUDrtR3y/qq2j8kEE4PhzXkvVr4DV+g
	g+WKOnpB4OZjUGLwvIy/oOAdzkL7xRwrRtxoVc+ZqjWuavydQET5Zp4xFgNVefnwcL8z+qNjRsy
	yCJdRRtCA+L4dbUAcF1HGEUgn9Sdj921VV0O9fJhEELLHCpa8/EKaX23dulJ86/g5sgsTA=
X-Google-Smtp-Source: AGHT+IH4AIKDNQTGuzrRL5OCcaR5+oCwqwuiQGkqb+Yio/Cxxa2N2THu7Mb64eFoUBklqJHWFxGrjw==
X-Received: by 2002:a05:6000:1846:b0:382:4d6e:9f3f with SMTP id ffacd0b85a97d-385c6ec0b9dmr6474374f8f.34.1732807011807;
        Thu, 28 Nov 2024 07:16:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:45 +0100
Subject: [PATCH v4 5/5] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt
 to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-5-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5272;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EyHdKYQSzhp6Q5IckerUZg/bcUhVWP1QC3wdvMtdE4Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIldLzAfDGWjxNDmzJ2/2WMIp1sGGnOvNvp6JCAp
 myNjCKKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJXQAKCRB33NvayMhJ0azxEA
 C0McuYqWQAYwfk2xajPs3bcX+BmlzuLuas2bMzBD/me9jZu2mkdUG1VEwoolEX0gCO6JlqxaxQJ4WM
 wL5TOWyl98rq7QvpGteUK8etgNs2ID4qhKX5hsWLrDH4oFKHIg776KlZ16WwFxrM9zotbWNMva+AMr
 PN2wCcOX42276Z2sU+fwg0/lzdd9L6FPWHRy5eEpK0aQHmiDQj+xWmpVF02Rpy5PZfZLrrFk0JKfYn
 kMwv8pGldajb1UUUNMVjgVjW3nCPo6TR2mKVgq07cyTxpi/BpzMzsx7mKZyQRV1wIhs/0vaSqGGoR8
 PtPicnej6Zrj/gBQ0Rx41nTgYe1ymgeHaeu7hTpaGuswR1U4Yst4g4st1a9VRP+Z3+aHaE9G68NBGW
 EFEGhsTm7hiRiOpOm/e4mIwZNv8BHi2KP+D8nWhyGQaMZQNCOoFsYII+g1gTq+O57co/vJIJGoPCS7
 HiFh3roegB3Z1kHpgZfMy+n26Nq6UgphQZK9vM8DIcEtNg+hpAvS+D2SArm9nd7UVMq3GLHcRwABCo
 znU/pLdQSIlPfCbgFBobDgij0o20asawXWTryI8DjRMq5MWYv1IFkyqg1upLB3lmE/KKIGgVc+oyRs
 rKG7qfGo4UICqZfJVFM5ejB7HSDuzO9FBcPhkyYtfPmmG3r90+p5BpLOl+yw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071653_699546_5ECA66A1 
X-CRM114-Status: GOOD (  17.81  )
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

Convert the Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
bindings to dt-schema.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/mmc/amlogic,meson-mx-sdio.txt         | 54 -------------
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 94 ++++++++++++++++++++++
 2 files changed, 94 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
deleted file mode 100644
index 8765c605e6bc761db2923ad748b5bb70d40ea830..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-* Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
-
-The highspeed MMC host controller on Amlogic SoCs provides an interface
-for MMC, SD, SDIO and SDHC types of memory cards.
-
-Supported maximum speeds are the ones of the eMMC standard 4.41 as well
-as the speed of SD standard 2.0.
-
-The hardware provides an internal "mux" which allows up to three slots
-to be controlled. Only one slot can be accessed at a time.
-
-Required properties:
- - compatible : must be one of
-	- "amlogic,meson8-sdio"
-	- "amlogic,meson8b-sdio"
-	along with the generic "amlogic,meson-mx-sdio"
- - reg : mmc controller base registers
- - interrupts : mmc controller interrupt
- - #address-cells : must be 1
- - size-cells : must be 0
- - clocks : phandle to clock providers
- - clock-names : must contain "core" and "clkin"
-
-Required child nodes:
-A node for each slot provided by the MMC controller is required.
-NOTE: due to a driver limitation currently only one slot (= child node)
-      is supported!
-
-Required properties on each child node (= slot):
- - compatible : must be "mmc-slot" (see mmc.txt within this directory)
- - reg : the slot (or "port") ID
-
-Optional properties on each child node (= slot):
- - bus-width : must be 1 or 4 (8-bit bus is not supported)
- - for cd and all other additional generic mmc parameters
-   please refer to mmc.txt within this directory
-
-Examples:
-	mmc@c1108c20 {
-		compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
-		reg = <0xc1108c20 0x20>;
-		interrupts = <0 28 1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
-		clock-names = "core", "clkin";
-
-		slot@1 {
-			compatible = "mmc-slot";
-			reg = <1>;
-
-			bus-width = <4>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..022682a977c6d347c36279f958dcd6f53d385b71
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
+
+description: |
+  The highspeed MMC host controller on Amlogic SoCs provides an interface
+  for MMC, SD, SDIO and SDHC types of memory cards.
+
+  Supported maximum speeds are the ones of the eMMC standard 4.41 as well
+  as the speed of SD standard 2.0.
+
+  The hardware provides an internal "mux" which allows up to three slots
+  to be controlled. Only one slot can be accessed at a time.
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson8-sdio
+          - amlogic,meson8b-sdio
+      - const: amlogic,meson-mx-sdio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: clkin
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "slot@[0-2]$":
+    $ref: mmc-slot.yaml#
+    description:
+      A node for each slot provided by the MMC controller
+
+    properties:
+      reg:
+        enum: [0, 1, 2]
+
+      bus-width:
+        enum: [1, 4]
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mmc@c1108c20 {
+        compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
+        reg = <0xc1108c20 0x20>;
+        interrupts = <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clk_core>, <&clk_in>;
+        clock-names = "core", "clkin";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        slot@1 {
+            compatible = "mmc-slot";
+            reg = <1>;
+            bus-width = <4>;
+        };
+    };

-- 
2.34.1


