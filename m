Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04850C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEe2Pk/caZE9tuS2ToysVXZZ+Dp3w9K8dh4ddcOqsJA=; b=KzMVISfGMTq/y/lkBBb41nFNSK
	O0dprPtK4OzFRw30lWIxL6szj6ex47c875ewK4oWPDeEyOCjXBxt1MFecto+BfDqqvOSisKW7z5q+
	f+BM3YASGrGQ/rSrijFVQU1bSAvDU2/xkpG4Li8FL7LxNGjweOftB13VNtMkYUw/g0CNKbN7rTaKU
	moQdV0BJgQo+019eUt9VIks5JVaqGQky3aV+YiSXFLinTz8QnT5pUd/ykro2qyX1MD/LJuK3+WLIj
	/uP35dsnttu7RRqcRCom8EeUWDyTkhMW0MkCQWFpCJD8x0oF0DDfXGdftNlQqi2wzSA7rsnL2M0M3
	dtcGhOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaeu-00000005Q6d-0H0E;
	Sun, 04 May 2025 14:49:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBab6-00000005POu-3tOp;
	Sun, 04 May 2025 14:45:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so1714861a12.1;
        Sun, 04 May 2025 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369939; x=1746974739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEe2Pk/caZE9tuS2ToysVXZZ+Dp3w9K8dh4ddcOqsJA=;
        b=CIxYbLjPoy8mgUUK4Rk/uibYbwQylIBV5sNCdVRpmcin0DkzGLClCdW0BP2S+iY2XP
         joAycsO5IjHR3Ndet6I1Yb3IBNLL+Uav0JyT9lFlafgFuwQFBVVuk190+n0tvzS/yPh1
         neaZk44AMqk+jjZUOUrc1omzivbyO2+fkRQ1hOvUDEebUOPF9FNYxT3jTaet/xEOJhqj
         IWriTnkUzo3LzHDgkNRhe7lCY/BwAKAzP4gqy47/97HEhnZvQvGcrAbA4GPjrupkAZdE
         StDySGXdKB7W+O6VAaFQZgb/8IcXRP2VCBHLjyUTu7/CTDDGO8Nn+/0kUOXLdJKO4pCK
         g9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369939; x=1746974739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEe2Pk/caZE9tuS2ToysVXZZ+Dp3w9K8dh4ddcOqsJA=;
        b=DADKOGItXa9ubyVxq7uDnUHGA9yYBXjFPIgjn45mQTBQ2YjJ28o/C/ydXsTx0MkLFJ
         pdws/rqYZdxtsMm0VlsM/WF/N8EF8T9kqdUJ744qqS3goO1mMmDwmbma0KCmzOYTCz/O
         JsG1uqMxMPZQNoqVukzuLU1p/5S2SGwxbLtE0jkLdlUoHGtaEt9zJAFLYj2vH/RSvDFW
         aTUNIHHuH++zGzYnwYDCuMcYZW4N4ym8bAW5T6Lk0+D0ZfjZbyPRYqI+uUnaw66waMDv
         Agv2jxIFgCeaW1DS1q04GHDUNO+beMCVI4fFrLCnpQk6GZOlSNvU7SaYtnhIJc1pn3at
         yrTA==
X-Forwarded-Encrypted: i=1; AJvYcCWwDpiQsBppxut/U2ygjEBoQFsen4YwdnPgXKZt3+3l5Y8FZgM0pLN4lhhKRYN4mk31XfATKHwW+7NkHHtz7piT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZ47yPB5sepy0xwfG+ZrAPfuXE2ELdXwmbqBM76KaeSrNbEuF
	sbnPewowW7diF5fC4iaz1FP8jMNZeZRtzQHbrB777Xy0uIo7Ab2d
X-Gm-Gg: ASbGnctBFSP0MiEbYy/Z/IyfKv3pCTn7WwvDSBqo22X2BF7WDqmwE8FX4zBvJ107C9P
	xc4vA5lqZfHHOBbu6iBycPY8TH/25+8R1UIkORgJfRQKK6I0jy3jnpEsVPfsNWrR7KfqxcWlOvX
	6NGKY1GOxH5EOguMxCkjeHB6TjRhoWAwgCCGL9KYRwdre6KlvwzxOHIktdXZ2zHsMZ2fiwyrNJ2
	JwrWVRy6C+aL1uyu3pjQN62DVPT4X1f5Hic+C68RI3X8lEU6CqMu6bw2cGGSJzeeJxhcq21A2Sv
	ivNXes6I1tuhNvzQth2vs1CLZY70rbwUHKC+Q5lbInZDQGihtEdpS/fydJp5qOMs2VHVOvqvcPn
	qw99QSGRhe0y7POXN
X-Google-Smtp-Source: AGHT+IHh3dzRLVQA3aqoCJ5MBNUWOlX9P7YffHdktJwcGumENYOkPRjsZ41k9Z0xC0aeBgpqQPMNSg==
X-Received: by 2002:a05:6402:1ecb:b0:5e4:c119:7ff8 with SMTP id 4fb4d7f45d1cf-5faa7f3170bmr4343957a12.4.1746369938837;
        Sun, 04 May 2025 07:45:38 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:38 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/10] dt-bindings: phy: add exynos2200 eusb2 phy support
Date: Sun,  4 May 2025 17:45:18 +0300
Message-ID: <20250504144527.1723980-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074540_966510_1308B928 
X-CRM114-Status: GOOD (  11.86  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../phy/samsung,exynos2200-eusb2-phy.yaml     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml
new file mode 100644
index 000000000..5e7e1bc2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos2200-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos2200 eUSB2 phy controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+
+description:
+  Samsung Exynos2200 eUSB2 phy, based on Synopsys eUSB2 IP block, supports
+  LS/FS/HS usb connectivity.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-eusb2-phy
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
+        compatible = "samsung,exynos2200-eusb2-phy";
+        reg = <0x10ab0000 0x10000>;
+        #phy-cells = <0>;
+
+        clocks = <&cmu_hsi0 7>,
+                 <&cmu_hsi0 5>,
+                 <&cmu_hsi0 8>;
+        clock-names = "ref", "bus", "ctrl";
+
+        vdd-supply = <&vreg_0p88>;
+        vdda12-supply = <&vreg_1p2>;
+    };
-- 
2.43.0


