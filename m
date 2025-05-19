Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D526C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+H+QjYYirUuZ6VXmZOTL8x+mr2txa8jEni8E06nGxy0=; b=XdUI/NpSDV7HhzAwc2Ch59JaP2
	GyDraJzYGtF40CCwk8B6bEqBvbFYcTykEfgULTpFND6Br6zICFPYVN1WtVQlbNbVxMK3EjmIh2mui
	iw9DsNSHa0DAOBC1O9KHKrYtoqkBR8Csx0iJsla91VCHWEhS5seec2H7yr6LiT5T1w8M32NOsG1by
	IJuuIykKleGD8sQaYzJTne1i4Z9v+8M6ouUuAhGicnkZfg08b0IcCR2Ste+C24R34Gi3df1kfwqgQ
	F5I94yVPJV68SOtOpmX7dygyvyp94moo4E/S54rrnRJtRqSD213CmVVwyLpmcffYcT9ecmQ/U2bQr
	0kK9100w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0qe-00000009Kua-1TyR;
	Mon, 19 May 2025 13:48:08 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0mb-00000009Jfe-22ds;
	Mon, 19 May 2025 13:43:58 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso55555875e9.2;
        Mon, 19 May 2025 06:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662236; x=1748267036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+H+QjYYirUuZ6VXmZOTL8x+mr2txa8jEni8E06nGxy0=;
        b=mZoTp9D/7qaHKCMhH3BjeVbOxj+U+2WPReeJqK/z/J3qP6YIaaA6uwCPkcL2lg+k1H
         IduEWp9JNLNILcN2h4Rz1CW26z2mg/Da0I0KADXoR1xwydbE+oF+7lsKAI3NSu99HDkK
         9KWfu8Kqnx9Yvo8ZmcMbTPJqzP2dXaonKLIe6od7aikUcyF4uNGzbhpECCn1hfDUFu2H
         pxHx1UzQNzt1DVhPPayA2r4hZpb6L1WRwyXzDqDgSBA1+vGWCWZHE+dEo2Y4vTOy7M3U
         9eACW9WiHjFtGq6oOQzh9SLhUWIwH9qyhe9azeXWvGjWAY2FpFp7Tf/hQDWZ5/XU2oNa
         dDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtU208XLK6GGIV9DG3qkdSRsWQ1YK3cleNdr7GhkbuunoUjj9Qv9+DF5OUNT9wMj4Syrx+1VZh+kFaxTbEL6g=@lists.infradead.org, AJvYcCV03DpQusyK5lLnLHM7ZPPGtM2lPXhixUXx7sqiUXWdWeVP2nQ+UuH0YkeOf7MqVPMxk6kI/LjrDtKjtYI35Q/q@lists.infradead.org
X-Gm-Message-State: AOJu0YxDU3B0SDQMMam8tjV1eUwm3RmvYD+elvqbl+UP4pDZ1TPWoNqM
	5iOiYPyEWGJL5PCuA35Qrxs3VY/Oki+HHGqjsIV5WRQoI5hLcOFJZ2LU
X-Gm-Gg: ASbGncvXwmZDevwX1O03LREQwCt5+oxMtyWwiY50Rp8nmVOu3yVPHiO56m0cEaMj5US
	/yX2FBLtGsZA2Xnoyo18EKFR/IXN9Q7LqT/0fcxKaI+hnyXGGH1sHHWsiLjt0dDHcegt5Cyf2BL
	rH8CkydSvPxSiugp77qH4eou3m1XBxxvUoZmj1moBnMg7zhQc06Y1glffLgUcfaINRMZIriHOYq
	+S7GerR96gjf+NahQEgRBhFmsrfabR/tqz0IN88d0yEDO02qounvlCLEdSJMRYgcyk/I9Cb76Ux
	BYEc+UBPOxzyWoIQZtIj6hxLZXCtK7auihLRAd1vcWI5Vt+pa5dmOcBoZhjR87qfinup3lWa3nA
	MLfDQh64C7+l2dDYbw4hc
X-Google-Smtp-Source: AGHT+IGZ5AVAOUUrV/itIQOxyxWaIOPioGnU50ZCLD4atOKReeR9NFCFcmT5D8fhTHzDDxUl/EQ7HQ==
X-Received: by 2002:a05:600c:8597:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-442fd780527mr130353025e9.15.1747662235557;
        Mon, 19 May 2025 06:43:55 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:43:55 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:33 +0200
Subject: [PATCH v4 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-1-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_064357_532190_B5BA6331 
X-CRM114-Status: GOOD (  14.90  )
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

Add the bindings for the Neural Processing Unit IP from Rockchip.

v2:
- Adapt to new node structure (one node per core, each with its own
  IOMMU)
- Several misc. fixes from Sebastian Reichel

v3:
- Split register block in its constituent subblocks, and only require
  the ones that the kernel would ever use (Nicolas Frattaroli)
- Group supplies (Rob Herring)
- Explain the way in which the top core is special (Rob Herring)

v4:
- Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
- Remove unneeded items: (Krzysztof Kozlowski)
- Fix use of minItems/maxItems (Krzysztof Kozlowski)
- Add reg-names to list of required properties (Krzysztof Kozlowski)
- Fix example (Krzysztof Kozlowski)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/npu/rockchip,rknn-core.yaml           | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fafd0b01da215c7396262012988e364ef07ea137
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description:
+  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
+  open source NVDLA IP.
+
+  There is to be a node per each core in the NPU. In Rockchip's design there
+  will be one core that is special and needs to be powered on before any of the
+  other cores can be used. This special core is called the top core and should
+  have the compatible string that corresponds to top cores.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - enum:
+          - rockchip,rk3588-rknn-core-top
+      - enum:
+          - rockchip,rk3588-rknn-core
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: pc
+      - const: cna
+      - const: core
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: npu
+      - const: pclk
+    minItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  npu-supply: true
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: srst_a
+      - const: srst_h
+
+  sram-supply: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - iommus
+  - power-domains
+  - resets
+  - reset-names
+  - npu-supply
+  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rknn-core-top
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          minItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      npu@fdab0000 {
+        compatible = "rockchip,rk3588-rknn-core-top";
+        reg = <0x0 0xfdab0000 0x0 0x1000>,
+              <0x0 0xfdab1000 0x0 0x1000>,
+              <0x0 0xfdab3000 0x0 0x1000>;
+        reg-names = "pc", "cna", "core";
+        assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+        assigned-clock-rates = <200000000>;
+        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+        clock-names = "aclk", "hclk", "npu", "pclk";
+        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_top>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPUTOP>;
+        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+    };
+...

-- 
2.49.0


