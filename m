Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C730C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=kpZt+M/AZE48sWKoXUV7r192bc
	dwuoADrjglOCRavlTXOLuenlHTKy/0Qfjhm2qsmWrJrP+ozDhTVoqn4bQTNnfYVCyZlkg+2HEfDzt
	Xs9Hrr9TIrhTQ6mS6YlmfPNjHj7tUwYioBZpXssc+DamzIN83VCzCL9fe2/3WuaXec1HCUcmYNlE5
	wr75NRbc5mdro8gIVflIfQ2CzNEUjUrz35xd6jtL5jdwBe/W0+kNJSTtkKtuXBY1QVcbttKsfybNW
	Z8mOWN4T0stDhMHCC5r/XAZNgTKncpu3ZRMW7qWMcEnsy0LRTPqAb6QEfdd4+PzArz/kZnLoHaud4
	1XfSbs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDgr-0000000798u-3dil;
	Fri, 07 Aug 2026 06:04:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDgp-0000000797K-1PDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:04:20 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3046124a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 23:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786082658; x=1786687458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=W8vx9C+VKwlD5qe9fQKhQGnuyTJSNqwGBqCtUAi7ZC/D3hx3jqsPUDUsaWUvyTgxJC
         kfAmP1Jpzl30GUQchEfsiPWcNApGzR29b1JpQ0FFP4nZpHvwfu4IiwXCOAxnyyl/ZYun
         8FR3yUKXCABuRkgu81Ln5rEi38nvK6t0bvZGZqHL31SXcZBpGSjrs4+P04EdtiFfFO6E
         tJ4IELku2NLnPMipSI3af4sGyNX/oYnMYtFFU1sGCerD1eXLT2pJ/mOxj2SGnehhjvTL
         /AeXE3NsJ3SyMxJ2JuzR3emmveowFiehQVvLj+CD2/G7utXTh5oalhtNZJaJP8ZM84EV
         KAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082658; x=1786687458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=bY5LmZBl88npsfUEGZ/4tEyc6Rf3Hy3Ww5X6sufQoQivPuGU0Dw0kNiEiK/nAQv0ar
         UidTSFN/Mg+WJYInVHg8vQX66LLOwaih7CZHbFcxNzD4BF4dxrvr/oDGTqabuY1xWrKE
         AgBqZfsB++BFFEFviJ5LuwVUfj6v2v0dOTvvTXLhrZtohTJ/fURuvYRRPM4gqERVEGWe
         ZyWvCMU1O1COGL2dbZBeaMqfqPGdgCCWhoY+sx7jLs4PUjdmGH/BtzRAoa/Tj/NQfpje
         E7Y69IJYCfyxIL8xv8iWerYoh3PBtYJ3QLR/xf6h0f0q2wCDZcUbdIuTd3BEi8hTUt3f
         jEMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpceMHoWgZ4WyaoSk3CymzTAM6kt4QBqQVy1A/sEhXC6kJIDSfL/E7LGkW6JJg2+dI64C3rmQfK9B6S/G6zITPD@lists.infradead.org
X-Gm-Message-State: AOJu0YygXzetaaeO/7XCtUMvzETn8dfprUtE11UDmiNkYMsa6snYgqc1
	C1f1+8HvQNkyflTn8lFlly+tNK63fty3JkAza1SEyuqZ06F/wzaAkG1d
X-Gm-Gg: AR+sD11ytT23ScddgOGJJtlviPuQ2DJnSd3uAEftgbIjsS7a3YDDM0ljjzzSKocR6sd
	SZJw7Bf502zpgM96+ip5WKKNdjNVw2xkMqNVJyh9ARHA99Ckq4/zMWsxdvdGty/W3e2ePajXp5s
	0R9tzUAgojMIfd32g7avMQefOozHADDyAO9fU1BZMAoeENxhdQryPGf5RvqFedHt+p3BVBQHiKF
	O96EcEyBkOlleel67LXjQku7EyJnE8Rru87+jvcSljGK/uWEntJozOe9PSvgLrJut+oCTSgyq55
	miPxyxq+24Gn5uDq26y9GoDMGV8TiTskbWrq30mNIGiIQMJKIQr7OBoqYZPX9Qr4aYtRrPJiJhg
	7J3r0Nh3wFhelaw5b11AZ7KvkziWGvzO9csD+9n9+Gl4Xm+tCBL50UobClRy4IQlDWSjzbYvpmo
	J8jmst7IYBMuoxHZVRpseDqxj50nmzlZOtwQketEriZEgpA+gfzZMGEXBoPHwk6a9L3Sm5KBXS4
	zZrSybEHSuEIWfxx/kcv20w+MiTFDjWi8oLTfNk3Q+0dWo=
X-Received: by 2002:a17:90a:d445:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-3903c66ba04mr21602395a91.20.1786082658367;
        Thu, 06 Aug 2026 23:04:18 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9c0fsm3375588a91.5.2026.08.06.23.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:04:17 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Fri,  7 Aug 2026 14:03:58 +0800
Message-Id: <20260807060400.2047517-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807060400.2047517-1-zychennvt@gmail.com>
References: <20260807060400.2047517-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_230419_375578_BC569448 
X-CRM114-Status: GOOD (  13.56  )
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


