Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07F8C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=TqKiwoUqlDDfPIPp9jsmqqD1rE
	aVB0GnioNMqI93O9dWvPVmqU4c4+gIxjBFw2v/T7kEke0YSUlLeqTx2fCm4sqzeHuby0hCbvQaVMK
	eD/eAbjYLs42Rf2QlF4b6RjmlgnGeVZp+ZpV1G7FX+rI8iQMPticnoPsUhJV+MLn4toU9bQi+CEu7
	7Lc0YCT7nI+FvvKBjp7dQXN3WqtbwC5uTGEPPjQsJpnPMbyzZkuPtXt1ju03oQ8eTVEAwPhhSvx+N
	oeIGFleaOh6furRPrD3k/rIHyRSDNvVSKhpX48IyQLL/Wgn0Gnd/WWag9oSRMGxC1pV7MCGXzydUZ
	1W9DfLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAt6-00000001O88-0TBj;
	Tue, 04 Aug 2026 08:52:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAt1-00000001O6D-36FZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 08:52:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so4109897a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833555; x=1786438355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=NH1yZV0mO2DvdD/4zKikO3Ng9LuIs4Dn+KfwxN0KE1rLVKYHp7BZyy2qqgoNNQExEC
         QxeWc+qC0+/nl3UF98xl91ApEDQcTJNAsV445QGAgvtyl3nyctr3RLPprMn64iC4L+qK
         x2fhM5kbX87KKZ5PmNw/0gFrAPyQGqh4Dp/xz9bHQcn5bWr8ocsHjK6fvnwK6RlLs9SN
         SWjVt9X73IBH17bS4CK7YAkcwusQH9TIV8q5GpoXxgkiWuqd3Ly5tMXegGB0SRl9BSnK
         s/5kJOUN1miwOVZo5nGJT6+PMUvTjO0pjC3ebOTOKbgYf4/oCDSSZX6bRKcZAuh72N2t
         D6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833555; x=1786438355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=U4Ate4tx4eRczeC+Fksrs0RxG9y6CqNyyu7otjcg50eJgbB9rHOhaJ064bfpOCZYEM
         ToELNbfIHs1jvzA9hkKYagIlWKJHPSbzLtJn1kIjIo6453igyKWDfBneSCpt6OOD2VXw
         JfkrGQt2jf93WlS4orQPvxjWOK/ULNiXvCdVwYosSUVWgsBvBTF/QyRIDoqHxkQWVq0S
         toSF8DSTjnQlaYPEJ5PcWR3eKOAFt4+rk+riZi/37fyyYEHNRbQtPzwHrxMIDI/HZYk1
         aWEtYSzVpURbldR47CTvcjcYFD/BUqQxHA0/gIgOB1pfa6WfaV4jaLEmWR1WTu/Qm5C0
         9CAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7nzk3zq6Y1+nuFo5CahM9KuVGjvo4iscLUcLwTlcma7Lmn39bjymWxfQrmAdGCdbvO+51J/iVE+pU35Q1YVBi@lists.infradead.org
X-Gm-Message-State: AOJu0YylPsHREGw59+FE7Zf3UDiG5jVzrTTsirTLCf2IJYiZXMkNMXoC
	8f8WCxQrW0A6wx/Tyz3rTXAMf/MKnYhhM303ARoiUVayf3mZFK0nQJvS
X-Gm-Gg: AR+sD10/L1GS9/5OShuE74KqtJ96ZjaZYfqXJYj628lfAQQV9Trx96+ukD2GVGef93t
	gXf6K1tYoLKFNEC+4cBYqNuvjXHG/jXFMC295ZVIup9kDT071Z289+VbeDa4ytSEJ2Dpkf+h/jW
	w14i1XcMLHrDGeE4P6V8rEoLs53W/AM05L2u2hdxi9BlGEhYmXcwsWsSfpA0Zw2EtRYsSb/gG9N
	pDIdknxVDMi9FVpPEj8e7Rp/EOWAHTkBAk/vH1X4f2dOriCnNAuO9AMwIyBUn537qQntEige1Lw
	SoDqsUT4mqsQOe/cE+YK7sJGKbHPuqOo81qZ73eoxR4q1RyMbRJ6p0tiyXcPDjD6/yyGYrHgsAq
	jcBJ8Kh8h3uMPD0i5qAya9vSmMGorpaXt8XPzQTO1QLmeeAHaSaZTW4pMT39GINklFXA63sFvdx
	yOE0hc3dsbDBUXaToXZlhFaQffKYcEgG1pMISk5wDwSw3PiFYftCLfGDKLjTUsUINhmw/7V9cAm
	gBIC1Eh1eLkNQRCFQDTgCipGoqc41psV3LpnATqkblQXuU=
X-Received: by 2002:a17:90b:2dc4:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-38fbc3ff292mr12609070a91.1.1785833554854;
        Tue, 04 Aug 2026 01:52:34 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febffb36dsm1012000a91.7.2026.08.04.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:52:34 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Tue,  4 Aug 2026 16:48:04 +0800
Message-Id: <20260804084806.1846570-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804084806.1846570-1-zychennvt@gmail.com>
References: <20260804084806.1846570-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_015235_777863_4C461FEA 
X-CRM114-Status: GOOD (  14.31  )
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


