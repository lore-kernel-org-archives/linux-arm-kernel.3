Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA08C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXhoVUi0+m1gZCgJKohaV7IW2GiBpameMIg/gICe73c=; b=y2a393vRfgT/ZQgUbugzYylX5m
	tQOb+qJIikgatuTgYSFcayW6oIE6bep2Kid1knoyujr1pPq2cbDITJHhjPHxF04VbilJ3V6gAtK2h
	AwsHucVIrym8qaRg2kJ2y/r5oT6dwb6OFWkdFF+ajwJomm/+UVGqogr6CqsopIqc600xHcLIFyaGw
	rhCASWX3il1JOWsPckxufn7CtqUFvkbxTaNui7K69v/aSmUzGyZRCpnTId7RGWRPVbSlfOF6TXrh4
	AMxXgWcCsobMQ+YnxPd9MwsQ0IkYfTPs4OxPODPSVFsda7Ez8oMo/cgUonZp2r5cLrhEWiK2zzZUg
	3awFZMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKaX-0000000CSeA-2Jgu;
	Tue, 20 May 2025 10:52:49 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKC0-0000000CLF1-1rw6;
	Tue, 20 May 2025 10:27:29 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso54007025e9.0;
        Tue, 20 May 2025 03:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736847; x=1748341647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXhoVUi0+m1gZCgJKohaV7IW2GiBpameMIg/gICe73c=;
        b=ay1DBwg64VlzQLYYR9GtBlB7PZAetF+0e7PrcqM/dRAGGov9EPEn7oHXSsYIgdZLNr
         Gi7XUX0h28qOqP3dcdrqM+2pJWxUtelIamO7Uq9S2Xbf3QmKdxGCo1dADKeq8XLbycww
         TDdLy2f8SvXvWEclSWj7Rr51nXMnzOaZoo2nhF9Vg/b3iPqjzH7FsFreu7/qVfqwC6Pc
         PnENAkVeVnqjdX8PqhQYQ+ABofsUf8dqk2g59r/C+05qEPnAOZZnEMsIPg8cFI+Cl54M
         NCEsApEP3521zTS9YLKt0RLVSHPxVIYhtPmttDoUavpQz53o5wT/VvZaSU17OaGzPjdi
         bpAw==
X-Forwarded-Encrypted: i=1; AJvYcCWcbJOLeoUn6AcWqQwN+YJ/1QlSo6aWlmj0wsRM8IDYP3p0sIAtJ6cb+RjgN1CiqknVVOZ8JdkvntAMKQB634c=@lists.infradead.org, AJvYcCWvfhkiFx64RVKQc2SRKjMoG9UrhfutGaNUyNq8xbjjfMmjNUAsV02E3qqCLihtN8KvOZIpUDwP5e7tupsAncvF@lists.infradead.org
X-Gm-Message-State: AOJu0YzcvDzjo48p6vDka0Cc41eTituGAnTs4y6bwMkUDHzKObq47Xex
	ewCpXjXtOpQu+k30sCK3JNHeTYgIQM/lRHxONlWh2I5JB3uQowfg4DLK
X-Gm-Gg: ASbGncvF+tagcg4kgTolSnvEjYCL3ndngOz3ZE2dBV8n8KTwlYAxJ/4rNvO+AuVkZdC
	ue4e425hyxenp76bHvcymLty5Shre+AL5DXLu7bt18sqfDm1w0pcfjfhg0utdyppIUCWghQmuVr
	hGVMYUZ64Kt0wOawSl+4cQ0w1ozQ9R+RU/eCKE0k7eA2Un07nmYoXoam1XsjGle8thBAk1r5zyy
	HRFSN1Yad73x7bmpP3s288MNcrylUH0SAuUNXOzy1YWfIpeeCYh2YE/TpoyTuPwayoHUM3ejuzO
	jJA2Xsb87ogDO1Dlp5PbUuK0/sRYUtPKEE8px+8AOxuRkLFslNhXSAXz6n5M7Rt3sO0efLHeOhq
	V1qU414zOrw==
X-Google-Smtp-Source: AGHT+IHv94G5hkxtUwn1EnqN1XVOVVJksOTAOYoYtlVyJF0D9UTpIdTOo1WTTeXt5HNCSsUqmuSgjw==
X-Received: by 2002:a05:600c:1d8d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-442fd60a41cmr168843945e9.2.1747736846693;
        Tue, 20 May 2025 03:27:26 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:26 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:26:54 +0200
Subject: [PATCH v5 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-1-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250520_032728_496748_55B4A67C 
X-CRM114-Status: GOOD (  15.13  )
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9eb426367afcbc03c387d43c4b8250cdd1b9ee86
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,147 @@
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


