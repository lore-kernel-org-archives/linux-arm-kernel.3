Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CDCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=; b=UM/ih8eNO9M4nMiSQ82CwUsYJL
	XjpT+wYBBiaUEgvpJLsxCW2hm4DhInpQZtzSxYG7pqSZ4pLn9Y7rNKonO90fPGhn4R4pDN4MnNulH
	SFSachMoZO03AoHoRJGCFF3/igKH38s/LooeCUjy1CSLQSOvhGL1e3K+6Izo6v7LfkWcGvjv8NxSO
	XdvFXEI+km0LC3kbFc0MwL8FtNhXii7nPYLk57ejkiJg+893NPPupj4GL3sZ5AfMVBvhX+VAg18o4
	3v0elLg9gTBBE+Yc0Gf8Qsa27RyiytVxWNKVv21W40BsI0TUYd3kJnPHRzfG5ElmiLI/2YRR9pJFO
	IAslpy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPPC-0000000EF70-335l;
	Mon, 27 Oct 2025 15:45:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPP7-0000000EF5V-3asT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:45:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso15108275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579904; x=1762184704; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=;
        b=xFs0VFieErj/X0yrlAZoOuhghJh+58WpsBXKjq1ZvKeUvNqngLLrdRqpRd/vOpB4W8
         BFKqdVOkT2XZbeZ87miYkl1TBqQyFCe4s4NYAMinNNTEK4dJ36PWdU4kQN+ognMKR1bz
         IeSkD4Umwupb401y5T3C2AF1o2yoZXhL3v5v5D2jbdsRL+AMyGz50fLRyN6UovkrCTnx
         VQvkzkuP04uKONKLi6+mXG04crrgPoFIRtb+a6wIgXhm3Y3MaIsB4tkjJ5u5R9GpxGFv
         6QHZSKVyLxUt/7G/HJtGvqu7LMeICxI61Foa7+2T4nRYKk1jsQGYe/rD8t1tZWhgi3x3
         B9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579904; x=1762184704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OlAwR0Ez2lmPLsYc3tLDTQTUPw8dFRTu8oJtM9uyYA=;
        b=K4XikeDuZJOQlJoR5AiaYwGs/NgeliBS48iJK8yrltnT51zABhX/5LD3blfaTpgWxC
         irb3YBNk2MbOMjHM0Zhs702NPNecX+Qga20o19sDF4qPncgxzDEWndWqMtbF5MRLGHJW
         OFLzBuxm4wkfxOGU0vgqwHzU2uO9SLnfftELYzWYcFmo0s0FVr6lX9qdE+j+FtqMwEL7
         ic+/VwIxceCjyLMpz4KCcNtoPc1ue47gh+pT2zG9bG1lMhm4aQTWM9NszVIiDJAI0bF9
         JR4aGedG8pNWwAWgxjW1bcouUZgyETo7NQp36wn8hcFvLVOKVCGIqKLkFHMUDLq9iuPF
         2cPA==
X-Forwarded-Encrypted: i=1; AJvYcCXFFNQmlkqadEAYrvNEBkG9SUMFGyxyUVf2ZF0VjTvwXsNOELEZh604OZabi4z4/ZNoe6j/7Z+REUZhHlx+dXfw@lists.infradead.org
X-Gm-Message-State: AOJu0YznrJ1R+FHh7PIr62n9DLKaldNC3OAyDNWGMCE/SuulOckUe5/f
	a06dZtZrruAdrjlLLhd0e/vbw9Q7/dfqd9jFHj7+E/zAZhvGiIz0Hi6ZrKCjYoWzYdU=
X-Gm-Gg: ASbGncsk6n5Xgg4V8/SlXdhGbzYRwEpQA9ud0UfhzJSZclJactTmGyJaO4yeVpeI3A3
	6//qLbtotZxCeV+i2pIl4jltKF7ejfQ2J/CDn/WINzIKSFm72HUaVG9UyhpZdOgb1zZWwlpC45d
	Z76SPCvDhpaZOFdlmipNG/6p6NNbf8BHb19QyN99HVjEb9b8I6FQnaejSG3Q0inkSi8NbSsaVL3
	eQiLmEVvw31Dvc+wT0nIcAclU5nOhag5R9mWKyVnv6WMWN+IzNh3hUlhDaq6L9qLHy6JdzA9mvZ
	osHXtmIrI+updA9Jt6I7IRDpGt9v1HHw4YsnRVnz5OJ05X/SCf7QghHMfnnQjaBR/3UQwjEpYo+
	pQIuW34+pqcTvK1GutnwFqyqQ0+x3uHfE9Lm4x95e4CCUGR/7j5JNbL5OLZd5UOsG30qj+Lw4Yf
	nSoPXkJUWeSQ6/cJbS
X-Google-Smtp-Source: AGHT+IF3LUL3bfxhtdpuEv0pHPdlEkBGo06ytgVfCVUCGuaC1FOwUetTffXhS0o9uNVApIit+32qLA==
X-Received: by 2002:a05:600d:416d:b0:475:dcbb:76b0 with SMTP id 5b1f17b1804b1-47717dfaa40mr966635e9.12.1761579903932;
        Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:49 +0100
Subject: [PATCH v3 1/8] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-1-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OSzCwUgDD3l4L0pYJMm0DD9DnJ/KFBo24c29rgi8yQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N6lhNlND4rsq376wqaZULe50mt5NDwwtTRC
 AFI8PIWioaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TegAKCRARpy6gFHHX
 cruND/9HOgu2X1rNis9f+h3vpeLQ56ytu76P+bQW61H4CEezr3VWwQLx8BRjR1WXEoMT+5TlQRs
 ipD2fBeg8mJEbLux1Ltn6ag6107Soa/wvshuCQLxGVql/6xlYoDxSEEptIPhKa87T5+cb9tkCFJ
 xnw7Y4Wmsi9CKCy0YmRXURj0Gp+5llGqF6v0GYFf47t0PMRU6EQaxv5WFe7nw1V2ZA3ObckRqO2
 /e6dA0pR8x+mdWoIX9kdjlHcXEtlIseWvd+t3xM1UhGQM6atPn6tzQTh3JYd0uYChSqoqqxEO7x
 HjKBGc8YG1yjalOGpowa/eVeCjdVXw5KoUwZIREYEGEEnj5n4UssoDUABQC/LnKNGkoFRnF+0Bm
 Gg+7o9dasJAxuLr1Me2URwCXqUmxY6MQaN7/FqJm32LzdDs4z25W8siYaIc6hgl+/He8Nc1NAqP
 54GzTigkE5CjoL26SEhe+fRWClFSMDXUQQaFEfPDzvo5ZqPXkxZ/i4Jzac7IElpTQ6ItiKflDXL
 uqL6938plMXE7AQDbQ6IiZG20RV8dFgp6lHN3fN6Ktz4SLWi1jNkPMeFP9MzpATft99M2HDcAII
 NJVxIgZOSCbNz6zOqA9UlgkJ1Xo4f018d/ZhkyJ2hY4Sd1Sdc+Vt13hMV3uJCsJCuSJOd8luOwo
 i45uTVSxobapSnQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_084505_942986_F2EBF2C0 
X-CRM114-Status: GOOD (  15.61  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b821299d7b30cdb802d9ee5d9fa17542b8334bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 3
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  phys: true
+
+  phy-names:
+    const: serdes
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@7a80000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "core", "mdio","serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e70d101ed2702e2ea3235ee38e2a0..312d1bbc2ad1051520355039f5587381cbd1e01c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -71,6 +71,7 @@ properties:
         - loongson,ls7a-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -180,7 +181,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -643,6 +645,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index 252b06d4240cc2b67405b8a967055bd53dec7c8e..14c80fbad8b97cc5562555d2422c81724d42111d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21218,6 +21218,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 

-- 
2.48.1


