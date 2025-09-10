Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65972CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY7tyXoLmxoMYiQ/WAWTMF4JkPWNBAVamog1AGlGOlk=; b=KC+zkYnFa+oqf8SA9aNptMFpt7
	UTfxpyfO4TbSJxUTpxPtREvWM7YAIcPJWgP2hdyjfWfqpg33kQX+5Qh8LAKQz0Ro1fCgX4X0Dj9+o
	KpB1uAS3+CwvtBCcGOElgiwu77qutlW4S5msnJSf3BJjFUx+W37h4USZ9LULXdPEssKvqrRaEuj6H
	vFdQJo5fv0lB/s5ueydId8ONmFZFz9uyeAUBKSm8RpJj6XBtex8Gm7lk0achsDqlLHEVAnh5Xfig4
	TXZemsUEDPrZDgg6CrJ/BndO+IxyUZu1JdTN4ia0rn9KKIasRQu91qQaWJcQNYwWIuY6TuNA6bO1e
	yd7mDzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFru-0000000Cn5c-1Vb5;
	Wed, 10 Sep 2025 08:07:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrq-0000000Cn2i-2vb4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:07:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb5e5e71eso33369965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491669; x=1758096469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uY7tyXoLmxoMYiQ/WAWTMF4JkPWNBAVamog1AGlGOlk=;
        b=OMWuwGO/P+31E043b06V9P77z2oKODriaqDGwF8EXsMa607WtBdwLWRRBg6+o4tc9q
         M/ehpDGsyOVkZ5VKxXjcjUAYkblYzBZB/b0u1l0YN2z3EyuJbCUKhwJePugsXMWng4cE
         c/4YoE/oJ+s3nzT8maeadQ3PRKkdTO0Xa+lOqFfuW7ZqG5WT44/oQeYDRGbOmp/oHuNj
         t2WZkFJY01o27fzlkHXj7BnsDovB35bLVEmkiDcFe+BuAHxUhIRCR7LUNKhlAadAU3Jd
         Ej3tA6y4zMMdVravYtgsVvrsEy5aik+f62aKdzzo90aGmvY8gH8XJ1ixGDskF0bvyEW4
         bTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491669; x=1758096469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uY7tyXoLmxoMYiQ/WAWTMF4JkPWNBAVamog1AGlGOlk=;
        b=auJaD55WEdW3ZjzbfbO3NpK4TLuAzsFzALB3CAwIHRh84UiMZU4FmfsLkzHrsx0Upl
         xQeMRR8AGuXuJnKPjc0+vOsJxxpOpZpbq+YVmNhsc4BtPXa7b+myHylWq2JKJZijnX5X
         ZC3HrkWLci7kY37BUVJcvNWf0fMTOtR0N975O9q41krHZutMFjN71+8AKZzAjkoZuGhW
         rS7Unmr4i01lSixnlmsBL1eTdFzbfeugMjQZDiGLqxQVB8KF1J1xABDMSuBXE9E2LyXr
         bIBo4+gFJCcBgS+n4BFTiezcGN6vbW5IB46pvkbMgnVsMq9CCNRO4YYiU65PEPkJ0A3k
         Ot3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrMN55VB7uLkRQCwAlXNZTq3M3ke/jzDqE+AAm56gVeypyPOGBg1/TXLDKQgRQaXAAo3UuNreVzoNBV4P0qzzL@lists.infradead.org
X-Gm-Message-State: AOJu0YwkSxbtVu4oRgl3DDE8TpZtN8DJJVyYe2Em8jHBPOMnNlaZlNEy
	jneRShnbfSXqR+YJZmqII+hrn9KXQMBQ8bINtrUEfxmaH80KQmbqN6kI3fkm5IbPgbk=
X-Gm-Gg: ASbGnctfQftYpUx3v2yfyehOgXbMmTdPGR/72BEYp0CYsMfTGdGH+KltjS5RLeKm+AJ
	80Nsc27LitD05D3FPFq9UqUOkefWB16VdUk5tXoH2RGvtABnVOLBiwnlL/GxN7UJQBGAiYTfjel
	vVX9UzMgfpN3bmmSvBlyNbxVJpv/t+938vlvl2y6doviGyAkly7zG4E+nRvnVzBx+qXtcOlVqC3
	RoaPlG407moACp/GVix4i/K4g45Yc6vRlo1D6EBWu6bED1KJCH/LHZXHhyw5YzywZ6I/Fcuz1kM
	s9olNkUzw6k/XVqQk1b/lm/K5QDy5t21aag5s7tnSiYgYFPFXwaksd9uXCbWPL19vFXVurcakKe
	/FNionmEcfBJYxHPE0C1b4g+KPBnh+NpIR+F8v9I=
X-Google-Smtp-Source: AGHT+IFnNZEgNDzwo9ApEnobHwV8aAoxFw0Jkpaf4P9Rpvk6aHXizs1NLoPb9xG6C0xsESVPAcwBNQ==
X-Received: by 2002:a05:600c:3b23:b0:45d:d3f4:a640 with SMTP id 5b1f17b1804b1-45ddde82751mr137637395e9.15.1757491668832;
        Wed, 10 Sep 2025 01:07:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:39 +0200
Subject: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device for
 SCMI-based systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YiaOUOOI0GWV9ljzY4gBLMGGn2gS4PsTZMpw74epeYo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHM5rrhVBB6aGbLx1+QUka9GEHLBn1Bh6zAk
 6upsGPRnFWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzAAKCRARpy6gFHHX
 clb7EACr8mgXcJhgQAtdioBd+rpPreLM1NgdsdbVw1eRYaLBKd8D6Gvowzq+W+SOWk6p5nt42LT
 yHphk380KW+A8RxjYCIPTDF0aIgEqXkvdtxViXF4WMU5rXPnG7YAgYGkZmV7XkaOBfXvkt8jr+f
 JIRuGuyNcLxrBDfdE+3aHT30Z5ImO3a8GAd+d1TlQT5QQr+IH+RWSddXjYXVRHbnZpNDw6A58xc
 1rKH5ZhUrllwrmvfZ2tL2ySQJ2tr7t9lCwdOxEMLp7x8ceU7gyDZSMEbYHCCqhKT1CUrbX3cEQ7
 seg3SC2afuBtDvkQh32Jf6v3Re9tHnMjpyzZJJGoWKnKTZlFkBWphcwA2GozI+ebZE8kGRRMM47
 u6/gFnm3+i2pePRz2BGlXiErGT4soU0D/Cxykz7AN1/zIyYJrJhKqUkty4KDQdmhD1a8dU0BQTA
 5Z1htu1KKk31ys72gNFQV+RrBNke/CJDTVmAqI1iuBusokeSjFbI9TLna6rROjPIGQiCIoc60VC
 mV701Kemnb8TglYfSTSZIc9hFX5TCfNFi4mRxn9lma7RRwmQqIo6eCuNx3kSRcTiGo5hnqnIFYQ
 CLS6xFvNuIDwVOKEau13A1WLlFvA6s5WHJuXCP42XtIpc6DPAghOU8OtItJIo+kk4eQtt0/u7DA
 QWzLqY6L+dkuFdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010750_786050_0BB085FA 
X-CRM114-Status: GOOD (  15.87  )
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
 .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
 MAINTAINERS                                        |   1 +
 3 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d7d6c013311c2643d5ac0e2a75e0180911487d96
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
+  power-domains: true
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
+        phy-handle = <&sgmii_phy1>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+        snps,ps-speed = <1000>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "power_core", "power_mdio","perf_serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa062290a6e8e5e60d0d01b0b39485c5478..07264c9c62778e9e8e2768999c5c377fce6811a1 100644
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
@@ -175,7 +176,7 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -638,6 +639,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d321752ac44c91d2d7e74de28e08960..ab453e599a174e5414fc0c1baab5a64e0d88dd78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20745,6 +20745,7 @@ M:	Vinod Koul <vkoul@kernel.org>
 L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 

-- 
2.48.1


