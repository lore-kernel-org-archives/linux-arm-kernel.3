Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F50CC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=olgpq9FQghG06+yM+m2zcvII8m
	pptHZtwkmh2RY4OEiQwDjlZIyFFplwzjcoZWYO+y7VNV9MTmnQoLITvTRRMZpH8qWWRkc4NlukvOo
	MqQDs+lJPUtj9xrjlErUpT0yMIFJvvRwWR2VW2k2+73ykvFZE7FmDpKx8fGGCSaA/rFkd6gbauoBn
	rAmlXOEM3hpTggCrZISKezJdhHTq6HGLWYInLIQEs8qGN8dcPw6rq0GJlE32VE3cui3ZK0aUl+Jjq
	T7fTyMwTkqCQxQTvSopolbCqwNvduUNQ2qGnC325v6gd26q87YUQzO3TFs1jPTgzQJo5GKUCTmiKN
	pYS5HVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGZJ-00000002DfS-1ifU;
	Mon, 27 Jul 2026 08:20:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGZC-00000002Dc6-2G9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:20:07 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc891373e0so24008055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140406; x=1785745206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=Gay8WkdAzZ2+uu17o2AbAkfvQ5rNT8nGdpXQl66yZgV6BRg9iSTZmBNWh9pGPsxnyA
         JbU3ENBes2H4uAh7tBIcQ/qv0rNKZ1aiiK52bXSkqPrg8NpO9dhKE7jRwF2wtV7EXjZ6
         A/2WNqbE9x2vaBPYB3/rIaa3PZeuC3/Rr62PEVN1SNw36r5iUz4oZaGlAqxQkJG66f7q
         NddD+2xt2MVxJdxPL5gnyb7x4o7TFyu1vJpD6W1WQr4bFtLnOuENVb+vQ2chvzi8OQoG
         7srm36eBtD+HqyUVIAZPvo1JZ16atsc5CcZuQV4q8W52lBeQvq56gZPvX/DZ94wp53NA
         sYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140406; x=1785745206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=Lz1hOJaPJ+NvRwYcrCZ8qMOhlra1dUrDp6Ab5UpLxcPNkGC4MK2kUtWNzHBsHv1HpC
         +PF0o+AQlhV02usih7lmpEGJK1SNTyBFgwOvKGcuqziWfrKtxc1+LESiMdkF9UYyAo1P
         Kf16gy3SodWp4Z89vk/O4NWAd0AI0tckp54jWiMabxIj9rI9+GjPeCQKed1V8HjvLE8K
         8zkues5Y5vSVlc3iv6hxV7OiizZv+b3y0BrMBnRqd18O66OClkgscAA6qqVTU8T4OLKR
         DwblTDRQoE1vqBWpq/PXT0HvvjdPvBoT6phmP6MOripjwvpMGzDj3owcVJGDO1FY4Our
         l73Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr5W1cbAtOV+zUKHtvBtASlUE/wC6fdJ+B2UW9DCYHr9wDblx1X+el93H5h+KGcddeer4IIZQrRVaURZ5TUVW7D@lists.infradead.org
X-Gm-Message-State: AOJu0YyRzXCkTiK9jghIKjy0QwNdQSJ4GAbeWnmThV84ViydoOiLoqiO
	WozS54QPRPrs4nnfJ9W/nIGaZuzCdpP4r5DeHnyQogRJWhKa3L4qx0Di
X-Gm-Gg: AR+sD11l/O1GGYGnOx/SOYN3w3Y9Lvh4polVheYT3jzOmBeUCIDaxemwRlG5UfpcV1y
	dMS/SBFPTXjcjks2JMYx16Q0c6TTCVFPbIM2u2fy1DqYLm08CGp/lpUmC76sGFchVrX65ge1vo7
	8ypN2ebBcsJjq/gy2i/dVc/LvTHvzoh9pvvR2UDRuWGgYOW+hExi9Wq/g8dkDurMKDAoETCXwpi
	6O9MG+BVAUnxXADc093y90wYPogosnWfQeQOGYfGFyAurN/C02uRusmqmdiH7rxQ5qE10Sh6qzu
	5XKdQ8ypUJUVNlKcc6JJv7qjq0MGPi4g1D5rxvZCfW6pszfuyNZDsv8PWFCBAoD+7DxUuaXUXMo
	njjc1sKNBp93X47pPwYXAlYYqRLcEz2Qz/pWp6WlhCDw/aqiWTf4r2O7VJK0702cQeqrh36z+gV
	OzrL+RYyHi0FVYUgVt3nEtic5dLGUC/E3s7U8H1PgP2EslQh5cnlsT3fIhpFO9
X-Received: by 2002:a17:90b:5586:b0:38e:e9b:ffa7 with SMTP id 98e67ed59e1d1-38f295bd716mr7559866a91.28.1785140405661;
        Mon, 27 Jul 2026 01:20:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292aed12sm2629156a91.4.2026.07.27.01.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:20:05 -0700 (PDT)
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
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon, 27 Jul 2026 16:18:57 +0800
Message-Id: <20260727081859.1737223-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727081859.1737223-1-zychennvt@gmail.com>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_012006_581719_FAA1295F 
X-CRM114-Status: GOOD (  13.94  )
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


