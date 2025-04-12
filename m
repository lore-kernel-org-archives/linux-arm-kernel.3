Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F4EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsQ/Xff2+RA/VYwRRvqpIoChOLpkXdtKapMvgQDbuBs=; b=4ocNPGHd4Xmmr/NZQgsw7FIi5G
	1As9KeKvo63XDl+Z+s5/tTRxL40Upfp0epEjAfjWLzEITgkYlAU+Pbhj5ud6ejUSVgP69Fa3Qi2Gk
	mAz3C4EwHXVSVE+mMjE6EgbfLkcZu/bZEJ0DvdmdpxhmhWCxjlyjS7re/z+IrCoN0VAkeuxWYOHt8
	oWN27wIAFKWhO2g8gYUPlHiW/gjarkcnOIQhH/Rdabs2xw3SHNAaE6HsQ8ZcwA8ABZ964yWN0/p+b
	JtdcNpYxP1DGTv8hYmxCCjD6O88f1H5XMrlKhlFQGeZr0hvXzlxiNnpyV/lsFTjxs5a8EaOe209Nr
	SUU6/8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hUx-0000000GPfR-2fWW;
	Sat, 12 Apr 2025 20:30:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRK-0000000GOyy-32ea;
	Sat, 12 Apr 2025 20:27:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso23566305e9.3;
        Sat, 12 Apr 2025 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489617; x=1745094417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsQ/Xff2+RA/VYwRRvqpIoChOLpkXdtKapMvgQDbuBs=;
        b=Yp+BuBdXuZNeD+8N0gH11Qw6Q/aTvxJ92Acdjw8byyIi9T3prNXMzVtVdJSACAiaXQ
         QEqrrB89IEQ7I8LimwckV3KZcnfBAufH1TOC0tMikRRVPzg2PDlKbDEZ9XAFk59Ky5EJ
         hjyUOPUwxYkh6eO7ISDbMudn704D0C8GLwif2+wUwet1NRprZVQmqChT/Js7Z7/w2HWb
         p4nnpJLlQTVEwQmmbus7TfpTUkOMqmimAk4yj2SH+2ml851IiUK1cgZ5EjgqXxctSNB7
         chy9ilHv0UN6nm5dc5WsxQVZt+J1J7/TMn2FtRWRs1dwYoitkJqiDf6TL+aeExRpC5xp
         bq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489617; x=1745094417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsQ/Xff2+RA/VYwRRvqpIoChOLpkXdtKapMvgQDbuBs=;
        b=P0iX9gYFxcuht7AJDvHyoPvKbL+AynA9qE6cd8hkqEf58xJNyAzBfDyf5WT6uM+oaW
         v8gDFvGYxhU4nOQaP6itNUBaA2QvlY3wnRFKzhAKXXuRAuhDBb/NAT9U7X1FZFptSi6y
         uXOFqHyjwrKOLym9uGNtpyX8Ml2Szuwfv1rRhDwnJfgn1hchCzVPHzv03hLr1mqXjppv
         1ocsv0bqEA8fdPzaA7kYBpfFxAF8aIcx8wiWnCu6decPFEeErGskB9YFN0ud+kr7d5ns
         voTu4D9s/CZHnYWIj4gC6YJAf0+FZx092p2bkealDWElxQ+5nRcrrZWNbMeYIZsqw5+f
         AXWg==
X-Forwarded-Encrypted: i=1; AJvYcCUyZjA6JgHLRzW4GAhIx2+I4gvcjD8raIoVZPBQEqHcn2FPMTTJSmqcsSAaw9349xamxTYSwr+SlYN7@lists.infradead.org, AJvYcCVgj4TbpCwOAVg8PnfHsf6jVPDv9OhfubAUnTbJFPDcPcvrJm/7YYpIINqCPpxTjsWc3X/Sa2Ri9iSPQNBqWYTK@lists.infradead.org
X-Gm-Message-State: AOJu0YygtFlMZ41KbkPe6XEIb89iu+k3OsZhnezwVHbgxI0takZhZnYs
	xOCXmILy6zsdzqbUfbOfxy8UYRDNdRRmAYtA0tGm1yGqqFtlLDHxhupXeA==
X-Gm-Gg: ASbGncsRKxt0M12TkQ5kZcDJ/MmqHzdWRw0pONRIgNBIOKXCZ1g5pM+IOGt1DW3vImS
	WpQOtsUnFvdGLIfIUNPnWhAHwM8Gs/z9Gjtxf7N0GPAlYav84uY0eV9UaQGKYa8cde8G0JjrfGc
	WGZ3B3siWmunsocrEEPea6rvu5glGKAQ390L3Fq8a8wsAMaSUX5ztagbL3tocczyAb7HrrQwZfH
	xWLIYp6M7VQPB4k8CnK1x735vcIji272M9R+zFExcAFSiiDv0QiZAnX9PsVlDH2GE7PJtl5yt1C
	5doiOcECTI3i/92CYIGlDodRLtsm3Dl5eyfvsIsAoQhuLTmnUaHVBpaYl/t6KfvQjDMedJwfvkx
	ITLFLE+qh4w7tfjtl
X-Google-Smtp-Source: AGHT+IFP+XkFysoPsINc3NpIKIT4Gtr8job/cOX6Be9DaYeNjIosjEEY2429amZfVdkYJ3ZD3XRl9A==
X-Received: by 2002:a05:600c:b90:b0:43d:fa58:8377 with SMTP id 5b1f17b1804b1-43f3a9afb11mr62712575e9.32.1744489616759;
        Sat, 12 Apr 2025 13:26:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
Date: Sat, 12 Apr 2025 23:26:11 +0300
Message-ID: <20250412202620.738150-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132658_762472_A3D7050F 
X-CRM114-Status: GOOD (  12.62  )
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

Document the exynos2200 eUSB2 compatible. Unlike the currently documented
Qualcomm SoCs, the driver doesn't make use of reset lines for reset
control and uses more clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,snps-eusb2-phy.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
new file mode 100644
index 000000000..09d3fdd4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,snps-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SNPS eUSB2 phy controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos2200.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-snps-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: Reference clock
+      - description: Bus (APB) clock
+      - description: Control clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
+      - const: ctrl
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 to USB 2.0 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_hsphy: phy@10ab0000 {
+        compatible = "samsung,exynos2200-snps-eusb2-phy";
+        reg = <0x10ab0000 0x10000>;
+        #phy-cells = <0>;
+
+        clocks = <&cmu_hsi0 7>,
+            <&cmu_hsi0 5>,
+            <&cmu_hsi0 8>;
+        clock-names = "ref", "bus", "ctrl";
+
+        vdd-supply = <&vreg_0p88>;
+        vdda12-supply = <&vreg_1p2>;
+    };
-- 
2.43.0


