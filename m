Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AA7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPukWtw2G3pjbqdi0Ei1Rnuvtpi0YW6Xb0VOKSKt6ek=; b=SH5k9MObII6zPIQu1R2yD+BqDg
	qfHdRUV8cIX4tOGJcqAV0QRHBiDCQrWiB5FcrKG12kxcZKGDW3pydzh/zIfsTz3O4gZXr6JR5/XZf
	zCoojYhi32Wmdm4d5A3QqERDusGslZpoJO1BueSRNMOFcFFkyvDLFplIeac4xQ5XIrd39iJ4o7EeR
	2eS989vaWJTf+K9fKAaf5023ZGsLBtmKiL+182CqmjgfMqpwFcZjZEpX1TwjlQsmxmtkSQAoXP8c1
	DA/oh1cxFI+tjZ9UqcnbS1yEdj8cLEKNKkclTAlumPjg0LCiHGyxE2xq7UUPUJO9DmjsTi3zgW10y
	ZHvKyc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQn6-0000000HDxz-3KtP;
	Fri, 06 Jun 2025 06:43:00 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQZg-0000000HBoE-1nFF;
	Fri, 06 Jun 2025 06:29:09 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so1256850a12.0;
        Thu, 05 Jun 2025 23:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191347; x=1749796147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPukWtw2G3pjbqdi0Ei1Rnuvtpi0YW6Xb0VOKSKt6ek=;
        b=LlxW2x/2t4Oqp6q5/k/bR7QyEjPOwy9s+mN9ZHTnbtngNE0bdKjaZ2Qo51U7YE8Sc7
         RGOiEzljGuv82iiDzePU/Se4oOiosBIP7ztbzg0MaTJhh9jT8MZPMeiL253hmVlRYhzO
         ial+hlbsocICo1+cJamr/GUJ4NiU3nlfsJIGZolXQUVMYfmPbt+Lz6cRftCPZie0u4X3
         TzSkIXanedZTj92eLFNzTIqYVzIY9CKgeA7/1hdkauCRMjRg5WN6LGhirhJDwCWaULLa
         cF52/XuNxeSAO8YkWacdMXcxRjmM2+cRO4/JV5swnrvCHgJ9MHXLbHkk3YrBzdLuMDEs
         xYbA==
X-Forwarded-Encrypted: i=1; AJvYcCWLjSA8ySHE9ao3vtqDFub37nObbJBNt0MgDuRXgDduBM9zf4T8CsdGiOOp8OkEp21K4TTpMCnvofzAGolWXnk+@lists.infradead.org, AJvYcCWRY1TTyQta7hcA4aYedYpdf39J4jwvLyRyAIWQAto2T5GGMPaAyhEHr6ORKY3vOMQXZqxMVYVIVNFeDxzhQek=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7amqBu3Ep8kD4Kc0udlVmUdT4kn8BI3d0ML3bMFLxwlqWZaIT
	RP5nyOzsSHfEapiq5d+ro7ssIv59rs22Lu9hhEVvhXApucIGjAeRVweu
X-Gm-Gg: ASbGncvut8NOZAOQw+ju2rgEZOPCo1WhKd5qyygmSVBmZSSnu7Ck02bYhSN7N3qGQHT
	MideXFuzxkAWTXviGMdLQg53Jgmpv44MU3HIYij76asPZ4fAEjpQHfojYuIoGvyTH24eFB/PnbD
	cFwISVLZJ9hmCujIiKSTHky5C13ii8irF12movYpPR+OWL6JsDBhePR+iCm7moJe6W9KbP5D89g
	2wGaHFoKX2Z6Xdgut0iGrqMU/1GT9Mr/7qFU7cwIfviExhizxX5hFCA4agkY9qHpGIZZueylWpg
	MA6j0jADmQZ08zU0BERlU1A0iHm/bjpzyjkfl2maqGB9PP87P7XP6r8gUzWU255ijAhKGxsDse8
	mmk3TyY7ybA==
X-Google-Smtp-Source: AGHT+IEsag9vw6Nn7OEnilm+FmZVJ6FdiJUajR3eq5nDZMSo0SkP7dbEPJwLxYEQcAnCF8Ld4GIxJg==
X-Received: by 2002:a17:906:6a16:b0:ade:7c3:7e14 with SMTP id a640c23a62f3a-ade1ab8771dmr170871266b.46.1749191346629;
        Thu, 05 Jun 2025 23:29:06 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:06 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:26 +0200
Subject: [PATCH v7 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-6-10-rocket-v7-6-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_232908_473167_AF94966B 
X-CRM114-Status: GOOD (  15.76  )
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0588c085a723a34f4fa30a9680ea948d960b092f
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,118 @@
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
+  There is to be a node per each core in the NPU. In Rockchip's design there
+  will be one core that is special because it is able to redistribute work to
+  the other cores by forwarding register writes and sharing data. This special
+  core is called the top core and should have the compatible string that
+  corresponds to top cores.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - rockchip,rk3588-rknn-core-top
+      - rockchip,rk3588-rknn-core
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


