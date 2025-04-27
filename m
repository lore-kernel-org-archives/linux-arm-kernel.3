Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACBFC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwcfEJKJXKQ5UF4yDTp+oj9WuQfkbNaZErmbidvOOm4=; b=BhXdy+sjfH/eA/gmBUunBDhFQz
	UWUQ0K+BhEVEL2/chigpWijiFW2gtAafw/2OPuOBlyQxwk6MVQwH07pVgyQHdTA6rECqtv4U7TLPT
	NRfwok0nlkZpSXHKej0VaDB4WXAqwXAz7Wf4rcjjhAs8HDI5wr95jZkxngZdRLQEwUMhzq0p+0hxZ
	cvjWs5TGPci87otWO8+7vFA69xpaIDRxjiYY27vXxpUA6T4lULE3rbGjsW9LwH+uMqONdwSJVTIEZ
	Q3vbcsecSEaIwhJrPiZpRfYGBWH3wHPP2EiCh42fusKdD55gTut0ZY2yHh8nvi0HmyIsRUGIw2kkF
	QIxPbANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u930M-00000003fHq-0j2E;
	Sun, 27 Apr 2025 14:29:14 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92wa-00000003eig-3s6c;
	Sun, 27 Apr 2025 14:25:22 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso38683601fa.0;
        Sun, 27 Apr 2025 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763919; x=1746368719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwcfEJKJXKQ5UF4yDTp+oj9WuQfkbNaZErmbidvOOm4=;
        b=CHYB9kdShs2+wxlsMsoF5BvIFNDH5WCVkILEmbfkbcjc5juPcpN2Jg7oiK08BPGX0O
         EPFfmuikLIspzQ4Z1BxhoTIiwifT04rAqfm+eh7kew9Ar7l+a/7P/UnhNktqgiRlTchE
         5DsFv5nQ2UxNEyIbTMl+hEpM7ooxjdNOc+TIY7xEjKKKnhR1ciUDrlHsHxJIxr/2T6gW
         howshMMy2ezh5TBIWc+qUCLGO9w6gjC+EgiXLVpwQEOstkafw5hF5AuYE0DemEw/nby0
         nJ7yTKMfJ//FZEMoImFQT5SjDrz1ijdAgAOcjJc+QsLooHT6iac4cUhTfLNOPcYvZP73
         IEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763919; x=1746368719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwcfEJKJXKQ5UF4yDTp+oj9WuQfkbNaZErmbidvOOm4=;
        b=c5OLDJTTP0GaTUTGyFcDQ2ZcBDXr9wGwuPWO+JC9cjmdXPAuLe6zuu0CtFSmm2fyjC
         9LIf6lgJr3b9sMZIqHaRfcX2+dBGk57RC051mrAKx5Tfm71WKZ/w3oUk8yvV5gVhHBcq
         mZMJVZc948j140QvfkExpjvbXxT+PBuY4zErKu/g1DygXD+D0Vpdv1Z8jFx64f5eQoXt
         cvE7Cvu7vrG4xJA3YKeac+A3AYC4T+MR9YpvkuwLw5YTuDWbZgYUdjZnG0bpZVwXs7FJ
         PxwCMY0CMtQuCn8FZXPiPIul+U7kMWXJm4zSZinLfG4i1NiDV7LNtyuJhmXCRYLGpW3A
         DeGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0/ioUxHDoPHImGkjQfIZJC95OzWEuun6meid1Zg66l8UmerzPcEb7df0G9wOBuVfxOZJU+5iwqXVufYjjNzzB@lists.infradead.org, AJvYcCWbsLJLTfvMlvb3YhvKyckvgJKYO9+A2f9yw0+CNs8U/9I5hMfPPcjuW+YjZxdj/YrPCs0+UgnHXfLaVHw=@lists.infradead.org
X-Gm-Message-State: AOJu0YztoZZ5b3RvnwJ89xqWcQ5Vey+62cHqrM8IoarOvaNr43vwQHqB
	hvvVdosTPlcaNNHUJCdI9x8859X4e70MJxhEwoY5u3u7N+8MJGwIM6QMF9qw3yx9
X-Gm-Gg: ASbGncu3yGHxRkYEG1C1JSD0E1ZyPiuiYGDrm25SpZ/G7IAlvQIwFYZ5vb+afgg5Ofe
	8GsDb2XxkAtnH7OEgUr+ubqAvVdYKR4ZmXbL/5OeC9HXoNIE4EXlo9D2IRyqlMXpj4av1nvDz8c
	kuqNpr9cnpN6oMApPdS83/e0KJfZUPIucttLEVTgQ9XkUaMRo8bU3j5RRmmy58vXeSv5JmEOGxA
	wxoIKq9pphSI/MfJRo4Nc/ES3hkzKvAbPc7CeLfa1QP1dIshiSZtc/XvH59yWfOT/dYV+hEVNQ2
	zpJPz5g0VOAkWLKM8BbF+nyGEGC/UHZ9CuJYG2ziiP6ln1cE96koe4xT
X-Google-Smtp-Source: AGHT+IH40FyLml70Ii4+KAHoqq8gBUgCUu7aKtYSu3EIPb7DPGagejX7iuNwaI0UDK2ngyYpGXmoyg==
X-Received: by 2002:a2e:bc94:0:b0:30b:f42b:72f6 with SMTP id 38308e7fff4ca-319dd1c2407mr17109731fa.32.1745763918681;
        Sun, 27 Apr 2025 07:25:18 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:18 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Sun, 27 Apr 2025 17:24:53 +0300
Message-Id: <20250427142500.151925-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427142500.151925-1-privatesub2@gmail.com>
References: <20250427142500.151925-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_072520_962629_4D4E6D3B 
X-CRM114-Status: GOOD (  15.06  )
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

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..4b25e94a8e46
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  allwinner,npwms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    enum: [6, 8, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-r329-pwm
+
+    then:
+      required:
+        - allwinner,npwms
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1


