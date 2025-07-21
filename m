Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3E0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0shnpD272LCTIcktSbOwec73NOpSSL15XOo8LgFeXc=; b=0EWa1uGc0REqVIKid83Z99GWIZ
	l3rI5SJ6alE6DkzMgc9YdKEpO1mLBaBxp2bm7rj417tT+0L8KsTDsIUr4Gx7i2ioBMzpfMPVZgdt8
	ND4pydsT6FQ/8rCIM1B+BBkdtmljqkVcMcjHLdQsXkvtgIZXh+l8PeCl0HRkf50pu+a9JcbKf6M3p
	91ztzxgBipAk+Ef9zQjCmzRX613KrhKEh4bkKbY8lqoEIMOr9rqxyFN/NYP5zmNpCFxIN9m7wup3X
	poKI1UYiVGMIc9KNoP+g2nzjVYEOTam8E1Gfya1MUv73XINewbuMNXONRsIg+lW30wJOzdtHNzyop
	xJkSUzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnLj-0000000GuDc-42Dv;
	Mon, 21 Jul 2025 10:02:23 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmf5-0000000GmLI-0nC6;
	Mon, 21 Jul 2025 09:18:20 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so609765766b.2;
        Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089498; x=1753694298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0shnpD272LCTIcktSbOwec73NOpSSL15XOo8LgFeXc=;
        b=bk33tfL5qOk/mgMxBhl+RIhTaLUYX28bYvHk867pPYfXH1uaFal0n6NwX+DEBX/3JO
         HWgPv8Nw+F6AXVQ4JjDxfHmGmQa3oRwe1ZnBq/u072XlntbNdqbwVmvLLzZqckgIb4Y6
         /KPFjXs32ZFp5t5jK1Zw0/h6Q3zWmT4A8sVVSVKK6ggmAKFrFso5dFhiu6A0+ZZoX0oK
         SIfaoWpJ+qX0T9RW9358/1zoHT/gLs6SWj9pFT+Ifi8eSy4PWMjmNKERHZaywZFs0eGU
         V2dvsJPubiW7ogzTnsLsINVmE/SZ/f68sh2Bx+To2xayfbX6rRUNOCnggDfESZwBa0x0
         fJKw==
X-Forwarded-Encrypted: i=1; AJvYcCVBo115RaW95orP4hTFYWr2YjmjQ53vr3U31GeBGrNf6S1OyZXwS9mzcVYnls4AJv29HY+sW9ALBBA/f8zFmz8v@lists.infradead.org, AJvYcCVpoRrU+LlS1p+LL5h5tJcrcF2vNtN9lrAmWOZWFtM1tBBWtSgwVScbuZXeuSKVE/cqNoFDD7idZnNxGT6kug8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnwpTQwVo6DLbodEySnI3hUy0UG9rNDskoMuplXa1v7O+NK/sW
	BE5ZqDLdNaCfu+NEU1EcchNSq+g51ELW72PuoziwF0YEf7JEhO1Zh18Q
X-Gm-Gg: ASbGncv2gQJsVuY/NJCOKnGRQ2eziUHpNoS+NLI+ONfxouRPgu/wrBzoj/kqdpRkGIo
	Hxkk9h/KghIqOIP5Dp95nK0iqayKOwTEdgwJPbY0pzL/GWLW5NcFZotH/D62CG7qgkEMV56Qjol
	6BjEe/FBPzQSnCU1B3Cv26+d34Q7Riy1FomLEesC0V/ZKwWEm0bc9jE2muxqaRWriEpqngecurb
	SRjC7woNYVcqhtUX84J0CU3qg478RaPySFstHndMJ8xFRkqybPw9BjNn4SRO5/Xa/ELFXBpHU9s
	LEXGMpZ65rj3xrSToCdI8nf6bqQyY5s67qURXT11emqgCrDHmhgHU8igNtDuxVsZF+zA8uyVsmc
	9OAsRidnE6GpiB2iJijivr/KmFBto6DTmsBMYlupDavvW3ComUp+TA1Et
X-Google-Smtp-Source: AGHT+IE++yQ6J3zklxF4MKp/EF/leIEps5+hFjKqjdF7o1BmnbGKHkCjf3wy7jm1GMw4qcEy+y+sJw==
X-Received: by 2002:a17:906:d263:b0:ad8:9a3b:b26e with SMTP id a640c23a62f3a-ae9c9b5ddd4mr1870923966b.56.1753089497441;
        Mon, 21 Jul 2025 02:18:17 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:16 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:33 +0200
Subject: [PATCH v9 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_021819_226308_E2F2F7A0 
X-CRM114-Status: GOOD (  15.10  )
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

v5:
- Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
- Streamline compatible property (Krzysztof Kozlowski)

v6:
- Remove mention to NVDLA, as the hardware is only incidentally related
  (Kever Yang)
- Mark pclk and npu clocks as required by all clocks (Rob Herring)

v7:
- Remove allOf section, not needed now that all nodes require 4 clocks
  (Heiko Stübner)

v8:
- Remove notion of top core (Robin Murphy)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..caca2a4903cd1556226fd2bff6ea9a63dbd375c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description:
+  Rockchip IP for accelerating inference of neural networks.
+
+  There is to be a node per each NPU core in the SoC, and each core should reference all the
+  resources that it needs to function, such as clocks, power domains, and resets.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - rockchip,rk3588-rknn-core
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: pc # Program Control-related registers
+      - const: cna # Convolution Neural Network Accelerator registers
+      - const: core # Main NPU core processing unit registers
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: npu
+      - const: pclk
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
+        compatible = "rockchip,rk3588-rknn-core";
+        reg = <0x0 0xfdab0000 0x0 0x1000>,
+              <0x0 0xfdab1000 0x0 0x1000>,
+              <0x0 0xfdab3000 0x0 0x1000>;
+        reg-names = "pc", "cna", "core";
+        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+        clock-names = "aclk", "hclk", "npu", "pclk";
+        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_0>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPUTOP>;
+        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+    };
+...

-- 
2.50.0


