Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CAFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBlQSSiEamv+oYM2If/aD+aYUWLw42K0i3enm5+zupw=; b=YB7IwFOFeJK0FPjprgH+vvlu4+
	jRNeji2j6rERN9aObOlTrjNQhDZTJtlhHOelFP+Zg6hwFORumvYQcMThhi6vtDKpfue+ARsxvG0yq
	TpE2XFEV1XTdCeOjo64Uo+mwmybVB26kw27OxNg7aYXp94BhrTTyQtirHp1p7+DGCXLXeCknKEYmU
	RlojqxDzSRqwdPFjwpTI4gvlWxVn0+YQxPOQGQAFpi9UD0iYiwQDguWFRlol1h2hwH9EZ4mNynQtw
	qJOvqbFqggLFFRTkjvwa/N/qJNGTIwmWM0aMmd37/7Fuva7tfx3Eak492MTxoCabLBW81KxIIqaTj
	yKDKXozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PN8-00000003QsL-2vEC;
	Wed, 08 Oct 2025 08:18:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PN6-00000003Qqt-1tDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 08:18:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-421b93ee372so3322137f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 01:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911483; x=1760516283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBlQSSiEamv+oYM2If/aD+aYUWLw42K0i3enm5+zupw=;
        b=gy+enBJlFENybmOXV+uSUtSh+nBE9iXzEzRyEbx6CG/MmQ2CDnVnc+oDZBKU8Tky+M
         wE3BZkkPC8EogjYH/8SyUTRpJGpA3YxjYtQ3qG8Fbz7IJvceinddQqz1BYGsdyc3iSui
         pp+ytrfwBFT/S5opM/N7VYgpTbFxjqZLkO9Yuoqg/aZXHPq3nVKwd2VIQ9lMrLVpJ6P8
         mEex58A/LpmNXGnC1MOVom/vVxpRGIuJVWw3EhEEEEvZFS3R7RaaQemrPn8Map12niKw
         /WZwniwmT6VzuPNRvYolQ+QxpHroSRBA1eyMIO/i4lXKh35WeKARoqH7GpweaXoMTWo4
         PrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759911483; x=1760516283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBlQSSiEamv+oYM2If/aD+aYUWLw42K0i3enm5+zupw=;
        b=QdLC+LaLacu02ggxwVnOBZhoWAmOHwKObDKtybri/8wtwpJykrztFAdnklwGAXBbl/
         ahm8lzqNMhZa62fbkSolwj2dFumz8Tf5llQJaY9Qg+B9HYoWk5Oi97eyXb34+E0oeKMk
         ENvkxXeEa66qTBtb61AmB5rMTtIKcYlk04RN6WASAGJEe0ZNkUp7xlYfENKCnUsegmIR
         HRBjzuBCSdYus41HGq0EyAsoUgyhKmVUbFarat/u+Q2IU9cf3jbufAd0xA0Y19EXcUtP
         DjZ6sICLWOXpJcw5OwYU4fuNzhoytyN4l+TgDX1cOApnTgdMfofsssFXhoFArL5MYDFB
         /ehg==
X-Forwarded-Encrypted: i=1; AJvYcCXvFkTik4kV7LHWcz5kn2r7UMzMgctzpq8VGjXjob3qx49F1w3S241FYwuhpauyn/4mcoC1q1MdxnkCjZjLhxPr@lists.infradead.org
X-Gm-Message-State: AOJu0YzJiMMtKaw9EkoLcT+4FEWSR94e70XtAFVuBpJmejKnDiR9wVm0
	+DLj9x9k+fVYVZn59hAHCpJR+L13ffMF1Dghll281WJodJvJTxZQSAMqR/3Jw2vidCI=
X-Gm-Gg: ASbGncvmhsSLISDNXnhn+cEaOFG0n+ji6X9hz2SzC4dr0Y6wFtxXhgaaf+LV9n30hti
	s3FTjpcG/OkzcUeq/ByOTG64lUx/m0nvJZ4xbkZpVsE75xY4uC+wX35xCQYFkf1948Mu6mB8kb1
	5rrovKgE73jKJTu2cMk/ZPCbtx1OxilXzS3d1lwYSWrg5OfNGGnqKUkfF+UErXOxegcWKwFRRTM
	qAstUzmwHWcUsJTYcaqlSNQ1TOBRNjoKy0bfMlWl3z0k70D01ra+FnZobhuQrQCztg5BoK39SNH
	D6nqXtJ1ZmWasnpUckFuRnIo9mvMKtZbZ1EPo0pOma5DZrGqvDCAZVVOZsI2cg+Nh99dBhe6o22
	7C+0fodw04emIQWX5h3GZoKGh8J8T5Z0ahNfoLmcW0B2XeEOdlJoc
X-Google-Smtp-Source: AGHT+IHFjiAXaEAX/qwdcuEj85ehmkltNO/B2fGV2gAeQQvqe2timCfHbDTdR4nqHfSt59VV8hUwRg==
X-Received: by 2002:a5d:5c8a:0:b0:415:7a6c:6a38 with SMTP id ffacd0b85a97d-4266e8e6ebemr1270056f8f.59.1759911482606;
        Wed, 08 Oct 2025 01:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:18:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:48 +0200
Subject: [PATCH v2 1/8] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4930;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jt98/fKCMiWsJRKIBoUPImv7pfYjdVSMRpukpIdLRi0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h41r2ZAFmiwUn7PgIvcsf9/Ki1be/TmFs6ex
 u9nsqOD39GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 cmLzEADDqXLdT+V7DmBbV2ZHe6RevBtvs/WskQguIekDpkpNMLSZUe9utgX4MAErix3Em600Fzb
 Tkj9Kqh+36Bc1FRGcZdRxZe73pOJpCGuCmG/KRJF5tLYIJyahyZC1508jX2v7hNmyGf6mo9E82N
 6/NDjG6ER2cU5IYtRDXLCbZHCxLJ55/QETUEBaEDppvVeYw2fuHPkXI72YN/rEZXDH/H/53yqlE
 2S1DabEok5qR3ZriVTUgPrb1A5F/Mwl/cSXsC0Z08RNG1kLKgKnOEkyJiGDQGXMI2KaBS0hKwCY
 cU9b7DMtbM0N9iWaFSPSjx0dTPcnmYvibwW7lvnhzDdeIEt3KHnD7PBgr2dOxUIJ1HGKarNYk01
 /70LZu4CmKqAZCP7cmP1mOA3lQWM9bMoQRQfcHyRrCIwb9NapxwyzZhqFtFnljzzrfoIUkLVR/b
 buL4wdvPvzHXXcsESe+jKltN0EA5k9iEWoeyMoeh5G+6BulF9UXbnw0k0s+8nFI6SeaEHCTdswK
 fP+l7j4Y1xw8Eg8ytjO4p30MMZso6krN7sHCC3JpUbVn83uAbqc+l53bbiyaEe0q1D2ZT/FxloU
 qX0NuHdAFujSg0cBE4rrb8p4H9I8Jbb7r8FKuj0nL1/bRE1uZkC3ZDexsMgQ1McQhE+YUNpAjUA
 n39CRzJaFaAqWnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011804_536142_3B433E96 
X-CRM114-Status: GOOD (  15.79  )
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
index 0000000000000000000000000000000000000000..0a9cc789085e8bc94d44adc9da982b66071d1e79
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
+      - const: power_core
+      - const: power_mdio
+      - const: perf_serdes
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
+        power-domain-names = "power_core", "power_mdio","perf_serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 658c004e6a5c836bcc1dca109a251e27af6e23ca..5ef5c28d0337050268e76cdd787b4cd6de7fb0e2 100644
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
@@ -176,7 +177,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -639,6 +641,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index 3773c74b31d6d9d4c2f9ba53c4b3ecf3e4e2dd79..cb097a1369d08e708152a3a41b610b35273cebea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21096,6 +21096,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 

-- 
2.48.1


