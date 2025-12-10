Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06392D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 05:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=; b=2IyZUpnlKyvVYczCN8hSTky4EU
	8WTHCtL/SzIij0m8AbWLinf8LB5bJnbW/RFKAY2mEEuVFZjR0blt/BU5e76Q+w0Y7W2XRKTx1OFTk
	O9CASD089AAu4BCxYmNQ619KOvu0j8vYed7V0DBsR/2J2z6tMxo2oBB6QzU4snlmiMonHQRvu7Ifh
	6XWTxF3bW363keUOnWfWeh3fO50jwtil0xQLW15EkkROU3FF6MjgUk9RdWOLfXcUBOOtxq8N/HOT+
	etr5C6WOAdRTWsfgYanijfudxb1RrUaS/6/IT+SkZpgrQ9Ik+rG7ZIJ+66yqWDPZ55T6IwOVlsaFr
	x+JA4rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTChY-0000000F88n-4A8w;
	Wed, 10 Dec 2025 05:25:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTChW-0000000F87d-386y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 05:25:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4651255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 21:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765344320; x=1765949120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
        b=dFBt8/hJmR75fRHYvoKJdn6FEgbgLE13iBgTeX+O6ItmnAXRe2WsIh+kILxWnP1mfh
         bX9+6kuZdRxh6A2/5JSrZjs4uWjNnRJ/uLnKGi8pyUBGZ7JC6ahb+Y3SlNMSQvBuWXr5
         f8OE84KseEjDPssC9l731Kj7ogUtXTEcpdpsTzp8t4RGJJPlLa+y3tyCuwXEv+o6anxO
         L2Ov6yqS0k4h7pE4U2X8BphbRA7IhKzDL9LD4xz7PavtlXKUhyCVyEbf0C/VUC3DcZGl
         OYBTjrkGLY62tCbv3KDZDNIP+g277/V1BF7lAQoOk+y15bJ6z0oQ+kM5Auu3ge8ROS9o
         qu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344320; x=1765949120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cI6o8go+UXL/S5TqQXusywCs+KEzzJC/G+A907W08g=;
        b=Z+9hG2tPw80zqze2W+pKKjUpddQ/yIm7MBkswvwcne+PZZk/tX3T89YYuQfmCBs1q9
         2xkSrhJM5BvXuO29CxpF0Lq4E3avh6vdK1n8y/SKz/ZajaBqs7oZcK6fd1cdA08LvX+9
         kscEo85W5Z/uroRgAsLRbe3BubDYT8bwpcCzladgCGSX3iFLYLUAiyySpUlGppNd+3lP
         hWx/YJXA4mA1w2phWuLq3nyniCVtpC3icentZIGro5EGSBWxY0SSRFK8Qil3qmcsXHA5
         ZRbpEmofqBjJS/dD4u3jo8iUrrz34ZXfs95YvXtA2z0k3q7UjcVBkE+CQRIx/7JJygwX
         Fsmw==
X-Forwarded-Encrypted: i=1; AJvYcCXF25tGUe/Lk+3PcQzaBMc9KhV53PIwmyoILIC0yYpySb6m/NkxzBsQ9rIqtu/yXojQfzjD/jaUV5wSHUpOXIFI@lists.infradead.org
X-Gm-Message-State: AOJu0YzRPO7Edm70y88KQaWLh1Pyw3BT+Ga2FzONYsSIyZB6EDRQiDWc
	KyEQqzFA+w5dyDt6m2SXOT1QZ1ZT8yxdYvwF7XKqRqg+F7RWVZgQtO1XNmgvA1UBZOk=
X-Gm-Gg: ASbGncsv6sTYtSgoF3Yw52jrDva+uV1GWyd9PcEwe+I/zIDnRoM5isUqHZVXqY1BzQ8
	wdL0Ow61QCVHLao9VE4dmm0whtxuckcdxefXT2idfexZl/QQSDGJY9VJ8fLZZa0Sl+rbAWPetfX
	Ui7eE6BMB0qpMs7suAGg04q4/3iBG0aQmHMYMcQKr9e9q0+FkARF/2Io8JzXbL7hHP5mC52YDwv
	Znf8eD2W237mgrwy/RVaLJgb5rO2JtGSJl0B376eKVEhXwdRKpQkJ3LhLREj/aUGDM4whXY7RSc
	lGxawa+MKKdoL+dkr1rilANikEBRb7pj4gKKADS57IjhBcpx5gc0L+oFqdyucgzNOyXIebrTt2s
	Qb1Sct9F4ExagfpJJ2irEaGonoJPrA4/gFCBCgOewcFS22B3W1BDi0Phjhgm4DGZCivfZ1hIeck
	uVTwy74XAFzQyo2mOKZ4D8kQh0oRGdJG8=
X-Google-Smtp-Source: AGHT+IFm2uRrTxNeE4MWzwAU4VluA6mvY1no+6jYZZ3xTzIhUq0RwCW0mb7k9rZckuaKaPuIe8SKTw==
X-Received: by 2002:a05:600c:4e92:b0:479:2a78:4a2e with SMTP id 5b1f17b1804b1-47a838d1688mr9398385e9.7.1765344320173;
        Tue, 09 Dec 2025 21:25:20 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4fde:b93c:87db:86e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d3a75a3sm33485695e9.6.2025.12.09.21.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:25:19 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wbg@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org
Cc: s32@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v2 2/3] dt-bindings: counter: Add NXP System Timer Module Counter
Date: Wed, 10 Dec 2025 06:24:46 +0100
Message-ID: <20251210052449.4154283-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210052449.4154283-1-daniel.lezcano@linaro.org>
References: <20251210052449.4154283-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_212522_820062_5DF8A219 
X-CRM114-Status: GOOD (  13.29  )
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

Add the System Timer Module description found on the NXP s32 platform
when it is used as a counter and the compatible for the s32g2 variant.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/counter/nxp,s32g2-stm-cnt.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml

diff --git a/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
new file mode 100644
index 000000000000..4d42996f5ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/nxp,s32g2-stm-cnt.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/nxp,s32g2-stm-cnt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The counter is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nxp,s32g2-stm-cnt
+      - items:
+          - const: nxp,s32g3-stm-cnt
+          - const: nxp,s32g2-stm-cnt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Counter clock
+      - description: Module clock
+      - description: Register clock
+
+  clock-names:
+    items:
+      - const: counter
+      - const: module
+      - const: register
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g2-stm-cnt";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+        clock-names = "counter", "module", "register";
+    };
-- 
2.43.0


