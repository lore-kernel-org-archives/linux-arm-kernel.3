Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0825C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eO0942WY587PlgQYOqbKcvLrhgs/k5YOSOmJGEVN3qc=; b=tA/17Q/U+MpIpl6/eNCceLCm2E
	vPI2SEyrEnw0eVy5+hrQVqxXOxC+UoxbacAmik47VWSWtzOR+mAkB3NnuHkSMshmq0OFN+p4PbwXP
	JM9ZhLqwzGQ0emw+eQgbmo8aXvm/izOZ/XCmPLwqNBr/CqPXU1SO9PRndCyP/701sdMAbGOo5OXr8
	5yc/6vc0qN3/KXa5XO8cVHXJMl0XdjgyUgwepvANAjGA5dnp1LNbKIQd9AfZ0hMHlUh6GWb5xOWJi
	CegYNnV1CCodYwbWg4mq/xVTu4FV6LN3UcBsklretWTKbd7xP094qa1UziBZkEifSSYR1Jwzg7xc0
	uyfUUzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBls-00000008Xjd-1eGm;
	Mon, 13 Jul 2026 08:12:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBlq-00000008XiP-1p4h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:12:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2652868a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783930329; x=1784535129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eO0942WY587PlgQYOqbKcvLrhgs/k5YOSOmJGEVN3qc=;
        b=b/Hi/XQ2DK4sBwNrSwM75zx9o8wwZ2fHFwmMMPZyktxvJymbza90FRk994WV/DSOqT
         vjBs8mtT35wYZoA7uKFXXdRM84CG/TJN15kDExIjGPXtW+3hJ3pTAP0A0q2yy5+3L+fY
         KZ1Xk/fs1omM9yINFzMNx/ymuZsxRtmcUCLOPPPW+eISr1RmSxqTIjfZ1DZIQgJ45TSQ
         aNoyn37xIEzhhN+g8dFHsnE6YlHc656WGXdq0tsApZvOkn1HXueeR8kis7OLSbxpIpV5
         iyYy+L09lPX895OwUbDIqKVwHCzT03E8uOCHTD28zEaiDS6Vbf7sAU4UVQqdycm6msvb
         sg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930329; x=1784535129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eO0942WY587PlgQYOqbKcvLrhgs/k5YOSOmJGEVN3qc=;
        b=YeZTgP1EGdnqKY8PuGrybOYqLX12enGo2NbbfvXzAKnlbNbQVNDRomLVLfHJARK7kK
         CFSSJnxsF42LbZlbBDiCfzfC4zK7W4RyMEuaSfHUy6IE/MeH1gxb8sCPigppN4/SR1Pp
         9Ifrt/3waM033bPjXlk/i+OtLn8lgj0O1s0rwpl9M49O1c5BKd5ihjGs4Yw+bAEmhOqX
         ue4Zduup02lbWxNbqZ1KMYllK1bza+7IUgq/aOVwFGSCNLTx88DTUc+trljaytvrm+lt
         +gUbXvHtI5RG/n8CRQYr7Lq3UwEL4w1v3G2OgUb2lt0htt0xcioUmLxzZ/26slg9YyBx
         L4bQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr230JdA1ZWDvkwt9eytxGW2aqtGj+4GUpnn0cHKlDXviM0XDYBAD2K7eDoJ7E/0/xIhdsXCwG/hw9g8J7toFpL@lists.infradead.org
X-Gm-Message-State: AOJu0YzQqrZz7GRSwwwlh6TsBtQbSBYA8kFivwC7CczzkF+S0Y/SFiRC
	77YNzFdtXfIkg/HvbLR3m1K6Q7VgPtmVCh7OO69pXleI0Wq8hXQC/i4i
X-Gm-Gg: AfdE7cnm/+5zFbz14XZNDT7QR6e6w54MzDrO5AvD5x9OgVCC3uQBSfg1lzKxlanrwhN
	cTUTfJGTq3jFsC97E0Ee1wZxJHAUIu6rvlB6z31cZFJsSpCvaAyTjBW9qu1uk+rfScmXOWkgEud
	Ut86PYnFG74aod9Cxd2wew3HQwysKPJsrdnfNtqn313a2UOSjABpc9hT9yUBRXZY+ito6y7JO7y
	A8UO5TgpSV9PIUz089pb4zSWQYkxmGZS42hrWrcLrJn3qMWmNKvcvILLFdT7RGxL+Eg6PkaRct0
	bMeZ2/mWoenRKn1EW/quNAWy+2imVZrtX7Bmben8VUrnKkUGNyU2Y/BnwxRCJTAJGY6U3HAUmHr
	N1cB0+Os2+rx9oWNTPKq7iZP1CtUns0VS+jeKmZ0Qn3uGcdb6d4PoXNypg9EUIk0kfPFLrZdfIx
	x8p/Ls2k1iH1WYJ7ALMHH3+6Z5ahAGNSeysUyNCrTA33ChsRtTnYubBeCfwVRPHAhNKvLi73gjV
	8A=
X-Received: by 2002:a17:90b:2f47:b0:389:8f6c:4d70 with SMTP id 98e67ed59e1d1-38dc77f74d5mr7473535a91.28.1783930329361;
        Mon, 13 Jul 2026 01:12:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e0e033de6sm269636a91.13.2026.07.13.01.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:12:08 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Date: Mon, 13 Jul 2026 16:11:26 +0800
Message-Id: <20260713081127.115197-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260713081127.115197-1-cwweng.linux@gmail.com>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_011210_479208_5DCBADCF 
X-CRM114-Status: GOOD (  15.14  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add devicetree binding for the Enhanced ADC controller found on
Nuvoton MA35D1 SoCs.

The controller has one register region, up to four end-of-conversion
interrupts, one functional clock, and an optional reset line. The
binding also describes the optional external reference supply and the
optional DMA request supported by the hardware.

ADC input pins are described using standard channel child nodes. The
external ADC input channels are 0 to 7. Differential inputs are described
with diff-channels and are limited to the fixed hardware pairs.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
new file mode 100644
index 000000000000..1be5470643d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Enhanced Analog to Digital Converter
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+description:
+  The Nuvoton MA35D1 Enhanced Analog to Digital Converter is a 12-bit
+  ADC controller with 8 external input channels, 4 fixed differential
+  input pairs and 1 internal VBAT input. Board wired ADC inputs are
+  described using channel child nodes.
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-eadc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    items:
+      - description: ADINT0 end-of-conversion interrupt
+      - description: ADINT1 end-of-conversion interrupt
+      - description: ADINT2 end-of-conversion interrupt
+      - description: ADINT3 end-of-conversion interrupt
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      External reference voltage supply connected to the VREF pin. If this
+      property is omitted, the internal 1.6 V reference is used.
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^channel@[0-7]$':
+    type: object
+    $ref: adc.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 7
+
+      diff-channels: true
+
+    allOf:
+      - if:
+          properties:
+            reg:
+              const: 0
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 0
+                - const: 4
+      - if:
+          properties:
+            reg:
+              const: 1
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 1
+                - const: 5
+      - if:
+          properties:
+            reg:
+              const: 2
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 2
+                - const: 6
+      - if:
+          properties:
+            reg:
+              const: 3
+        then:
+          properties:
+            diff-channels:
+              items:
+                - const: 3
+                - const: 7
+      - if:
+          properties:
+            reg:
+              enum: [4, 5, 6, 7]
+        then:
+          not:
+            required:
+              - diff-channels
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adc@40430000 {
+            compatible = "nuvoton,ma35d1-eadc";
+            reg = <0x0 0x40430000 0x0 0x10000>;
+            interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk EADC_GATE>;
+            resets = <&reset MA35D1_RESET_EADC0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+            };
+
+            channel@2 {
+                reg = <2>;
+                diff-channels = <2 6>;
+            };
+        };
+    };
+...
-- 
2.25.1


