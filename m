Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10999C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=hKl9gK0rGIJX9sOJHXd2/+e506
	l5zFG6dyWCcr7qGYxi5vZW7CnXKMBNOyUjM61Lc1G356PEEcHSF8qF1Bix8Mf2486CxAMFIOZkbom
	qF8aEz7MIWCpNmZLFDxN8gKKcfjwZgZrXpld4x+NdUMXiCIvAwaMMdZxSqUceQnPkE1x8uoFqxkM3
	ZG08XTd5roziFOeBi3MUdHHfRB3vHGX4SAU+Lk3wf/RTfVQnTvDgPKW0Ek67fRmcr2svvlfguExMV
	eY25LAl9j0jED8RXAY5Ge62Tx2HJq0q+5HIIfwQxd2CaGtiKrf7Q69dfqbYBzOoTbQryhafufOTAK
	ye2P/P+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNA9-0000000FePu-3E1w;
	Tue, 30 Jun 2026 01:21:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNA6-0000000FeOv-1ogY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:21:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-846970f0acaso1457930b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782478; x=1783387278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=o88NhwPsnIPi47jaj+L1B4UDL8iFUUYgDR0xMjbmdX50pOlDEU/czL9gNWimP5uKPH
         fJp6czQ+z7ZVstbDzTXE73sUsJTKxTN0fm4cWAKDnRhMc+M7pQRlKxQFwCAta0e1O/fL
         pGaLf6O+xEM9mYRkLVsXiU+TH1jhDHS03C+igHL6va4fhLhAcEcyYdNHtGfzn/J/VRW/
         7Ml9Ngd5XLSYfxEHR8G36VkeIt9oqLmEWk1NRlXOWdqhxh0ylC+qhUIqzM7FJ9rBfWgE
         +PJF0Mb/XCjsT8s6LvAGI+3NKmXrv+VeQvIc0F5/L7BK5JM6AFHDXRdGQ7CB88f1QNAe
         ffnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782478; x=1783387278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=TOS6CFp3QJ2bLcAebfYizhfYYmKGd8dYDYNADAd1fQSkXIaPuVCdEJdVPDipkc+3pR
         /FlnpaSPF9TlFbptc26PDdzlDtBTpGX/yaQ4068Z6aLGM3atPvWR6G2lUovHyBme6wS/
         ZCmxWUlNMWvLfomt5zfxAjkA6jPcjSBbLeNk6c9LEJxOz0Bv0WTrLDe2TaqtWOXcsJHF
         C59tce1PsKQ91eAdwaAvY1kKw53Q6RAngEhyqTOAIFKKP9MMVNZkHCliLW67z9CCluxo
         0oBpnf8FUfvnZ14bEU0u8ptcYJnBpQd+vjDHJ0oZFJG57L9BAptv5M1ZNz4Qtq0r66Lb
         e1Yw==
X-Forwarded-Encrypted: i=1; AHgh+RpG/szgI2HBnH8HWdjEUkeSzCItiVQ/PN61X2j/xn+buszdmzHyoInMQUMhmjoHBgtXg1b0dp8InQCD1Ze9fEvl@lists.infradead.org
X-Gm-Message-State: AOJu0YzCQ1Fzx2N2NAnPyL/it4vqSs804g1znL0R1PWVXXfEnC9+tccv
	HZNfBpyoFQ+HnctYK9IMnU+T2nmcW8/gXcRF4z8CCRVM8S8HERofLlSX
X-Gm-Gg: AfdE7cntyNkziF0Adc93HcskgAY79kxjDvH9KGFn4VWBZqH40uXUmO5KmmEZQJstZLU
	U5IDJGYYWNeksZTfP79UXpqxMvedals6P+GerBdDuNPhLvWtMWo33fwQzrxZOT37As9xDem2U4u
	s97o0QR7hubzckD34j94bVCQTK/K4TXpCDDEui0KvAGVTObCiJiBUfXhUEH21y3E+NLICoa0kqX
	WPwuSBzrNB4p9ja8zHDj2r0lq5ot8WOUK0ihupzK6l1esQ9XWjq69Y4HSkZzJJrc1C+lYKm4UNS
	TPcQVAGzG5d5ixQbcTfxPqxukUzmY+clYtJ3PVJZn9sNewpudLmpPcIVqpk3Yyx7UOb24R4Yq4q
	fWobiZNTx3Hz9uSLXXAV7BBWT/pmw0XrhyCxuIKdxSFXjsJA05RaSvUW8vGMZt5PdTX1gbdd6Qo
	h2enhVo4bU4zQDwu9VLnhTJs+5kVzUhkXAqz4JZkRuQjKdz6/W4hY2FXGWZZXMpaHarXIfH5M=
X-Received: by 2002:a05:6a00:94c9:b0:845:dedd:89b1 with SMTP id d2e1a72fcca58-8479f27ba9cmr1237175b3a.34.1782782477806;
        Mon, 29 Jun 2026 18:21:17 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm654503b3a.49.2026.06.29.18.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:21:17 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Tue, 30 Jun 2026 09:21:04 +0800
Message-Id: <20260630012106.3616821-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630012106.3616821-1-zychennvt@gmail.com>
References: <20260630012106.3616821-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_182118_474660_0E613367 
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

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..0713e1c1ecb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


