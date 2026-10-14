Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACE7CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mjdo2hNwdnJXsJ4gHg2a0k4FrTqX21XKUgFm8PXlXeg=; b=MX/VVVsvHnYJpEj6e3oFps8jqV
	aLdHT+ZZWXlXufxu0qEnKYiV7xVOW1byVb/wx09fxNs8we/J6jYWnxIqv4maW65fHhUKrEIsjejIP
	zSJH5Zw/7n7vMCkVvzvak8cegTy+vKKHaSZNBtmICM0yPXJuJxaCea7y1AZfUuhXcese9aO6IhFYm
	7C4RsvW9VqZZpz2vE5oiaGznEyMYe91jRUROcsR+847vfPn8z819YPA03BCeJ8m4h/h0q5ZFxV9h0
	8J0smkgGyN1jRmnf3YXJyT8Oc59/xM4MwNlINLpPWxuQb77PhLgjzcpJyPxXAU3jfxZsxjv7jJTp1
	etWdtrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKe-0000000EjWW-2Fr2;
	Wed, 14 Oct 2026 07:23:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKN-0000000EjHz-1A2h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48afe75f055so89078f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962586; x=1792567386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjdo2hNwdnJXsJ4gHg2a0k4FrTqX21XKUgFm8PXlXeg=;
        b=QCNrbX3YgdC3iKXUIfB0tMyOD9vIVpMHrOYZFPXi1qLNF2vOx5kf+34VV8Bbjx21Ow
         M1x8aLgFXkVMyc9BkGmqgHwsvca+tSYkbdWMDQehymQxSC0ejZs27x7WZ+RpzLxXfxTO
         gllu73WcipJzHp48xv6sc7DqYSAPVfuBNFn1F5tWI+zfCh2SLh196nnTDtylUL9L96C9
         tE4cucYg2h0vnOkKBztUrlCYAXrt4WIcdEry9IN7C3rlCOaSXGqHME2oDCtScIQcXsRE
         g7HSRswgvXcyuR9wobGC7AQ+WXiv/mx98ranQxKpYZ1dzIxpG0R08twMWD9Voqxsbk3c
         0ugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962586; x=1792567386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mjdo2hNwdnJXsJ4gHg2a0k4FrTqX21XKUgFm8PXlXeg=;
        b=NudAvxKAGM7kWacSWgd4cduKv2M9vu4UGlemDMn40n1OxsT1Mb3fENBQlXXXJVg4+U
         d8eS0hSx15qt9JkDSQYgCzd5fmt8SKh8OtAvndenA04oBM8gWK61lnaZ3lK8Haxpv72j
         N7/+n6wflQO1HEkDNkRzQ6CVgrDTRmMdVAJPz/Qj+S/aKg6/fJuuf3jbNx9pwW9EX7y5
         /lSXVY8HFGqiJlRLPJNU/EJZ5tKqMO3EVXsm+R9FKHBkyI1R3TmJt5S/ujjVTM3vTRuO
         zOFj6bmc2/WmZOlDRKqhKvcJeDkZgkSSwqzCkOcKZC+4EdA8bd6FB0ufc6tN2LsRTjl1
         WD4g==
X-Gm-Message-State: AFq9FYIHr9xw8+vspzap4YFw6rNztDaaFx4aNz6ssylH1mJEnofN+/mN
	dgtQs24aiOHv46xPRUAU+zvIT3b+/IHfo1t+jEemVUy6uGWuB2F0UuDdVti9BxlF/kCBug==
X-Gm-Gg: AYBFou3Og7joU6V6cczpBLumjr7UuyEmU9twxCEzbIobtwm31WGSMRu7Nuh/Oq423MZ
	6siBElWN5bU9CuHrFyZwbxQAQHHXRLnMKr7mkI5DK5GofcdbJbwl/1iqMxPhj1qdJ3bIg9DntMF
	X5ncxdgUBNnjf5to+6h6rPbKbWeph0s+dsahfa4Jldhqpsiui8+PTHEbBYb+1nNjTH30quYS4NI
	RRwx94XtfszE2airqRTwKy1P6Ywhl5qX9hNg/6d1fKXEKW2n0mUAdBfadpDe1Sd/100dguBIWrA
	vvctpAOy1l8CXj8L0Vrj2hV7ehttu+MGMURysRqrKO9nw7noBwKDW1LaDZmmVsVKvu5AxMy8ZmN
	Jb9xQIW8lnb+EzAr3hYMePfKnkNyQ06Vq53zzZ/IRPl9I4N19txjeDCh73QRVjjkoL59Nov9kWH
	iOgtNSam2cFs7j1KP2Kpq0YE8FjJ+aK2YlRPBprca8ZCztVdZT4DfyP2MyorrCHDRI8kcRP1LZX
	/FVjYzb9V6dPXIN9reRNTksGbud4uKuEIZwAPTDK1H4qPFgDnouNM95fL0towVZ/xPvONqSugUa
	EjR5XnMidYiUSO7H6xhtPGOzr+DqxQu5Ue7V1xe1CIZhYBbLy6r5KCY73bvJ7Ek=
X-Received: by 2002:a5d:588e:0:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-48dc186dd62mr23991885f8f.57.1791962585507;
        Wed, 14 Oct 2026 00:23:05 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:05 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Wed, 14 Oct 2026 08:20:52 +0100
Message-ID: <20261014072109.1759502-13-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002307_902308_DF178391 
X-CRM114-Status: GOOD (  13.82  )
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

Add Device Tree binding for the DesignWare PCIe host controller on the
ZTE ZX279128S SoC, using standard clocks, resets, and phys properties.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/pci/zte,zx279128s-pcie.yaml      | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
new file mode 100644
index 0000000000..dc0214511f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/zte,zx279128s-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s PCIe host controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has two PCIe host controllers based on the Synopsys
+  DesignWare PCIe IP, each with one lane. Their clocks, resets and PHYs are
+  controlled through the SoC's Top CRM blocks.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: Controller wrapper registers
+      - description: PCIe configuration space region
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PCIe controller clock
+
+  clock-names:
+    items:
+      - const: pcie
+
+  resets:
+    items:
+      - description: PCIe controller reset
+
+  reset-names:
+    items:
+      - const: core
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: pcie
+
+  reset-gpios:
+    maxItems: 1
+    description: Optional board GPIO reset line for downstream endpoints.
+
+  enable-gpios:
+    maxItems: 1
+    description: Optional second board GPIO enable line driven together with reset-gpios.
+
+required:
+  - reg
+  - reg-names
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-map
+  - interrupt-map-mask
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - phys
+  - phy-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/zte,zx279128s-reset.h>
+
+    pcie@f000000 {
+        compatible = "zte,zx279128s-pcie";
+        reg = <0x0f000000 0x4000>,
+              <0x09500000 0x1000>,
+              <0x1c000000 0x200000>;
+        reg-names = "dbi", "ctrl", "config";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        bus-range = <0x00 0xff>;
+        ranges = <0x82000000 0 0x10000000 0x10000000 0 0x08000000>;
+        interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 2 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 3 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 4 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        linux,pci-domain = <0>;
+        clocks = <&crm2 ZX279128S_CRM2_PCIE0_CLK>;
+        clock-names = "pcie";
+        resets = <&crm2 ZX279128S_CRM2_RESET_PCIE0>;
+        reset-names = "core";
+        phys = <&pcie0_phy>;
+        phy-names = "pcie";
+        reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+        enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.55.0


