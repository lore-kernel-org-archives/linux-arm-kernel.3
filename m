Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9186CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr3LEhlSfFRZpLIfOzA7XjGagn89G0+3vtw0RCWpTl0=; b=T0PwowKFD9/7P95NY83eed8bhl
	W75IDlu/yVYRYCSnxi7YcVShKMN00CV9oUmXO93MWzJTC851OZV3lT8Ik532TnFNcabOyDIlfWvWr
	NLajTk1dNlj1KUCZLcb7OpuV/LuPVZI8wXH46iOFD/8UqA2G3FHm9NXeci32yBcnihgf79yk4KXGi
	D4FWhyHX6h3/OUvTCc1Bk977FgdLlkka0hUtV1yZayAcE229yEFuPWh5XSZCthEl0fukOkC1xa35c
	U+hj9oYWk3lTzmpwow1yNeq1C/eYlhTkztdjZIPiMz+Bb8iYz7aCXdgQL+ejjIIqkWZUI7Wl6UETX
	ss13Elww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOZ-0000000EvGW-1RcO;
	Sun, 04 Oct 2026 14:40:55 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOW-0000000EvDY-0TI8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:54 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso9654465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124850; x=1791729650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr3LEhlSfFRZpLIfOzA7XjGagn89G0+3vtw0RCWpTl0=;
        b=Zj2I3SylFmPVpqQoNT9uG7/CYgtz2mMDB6kSqljqG3DdfxYuUarzy9oVd5GzB9RnT7
         0s8ebvvHS2ijEoMDQ9b9a3ofnas0vGjMirNApcKFUKHzQkUi8omq0yuz/HmRyq6q43gW
         NeCEhtkblQjckCz6Z2B7FaGQVP7ln/h3SMB7HN51IAmP9EGoTZAr8IYdi705Yf3rqNlg
         0S//5ORWpFnZxt09NFaFZipfDMjrQJxkLgqHHq/5aOPJkwMEXnYld1ocHh4RYyxGZCy1
         iAMjAPzBuKjWHqKnvXwH0JdHqeLKoBXF2O9elkUpIlmklOx+thSWc9Sex18cF0ANpFHi
         Da7w==
X-Forwarded-Encrypted: i=1; AKwUvByyUEbPc7umdN++PE3oIBe6wZPrY3EA3nEa3JUvoNgbEAMfp0ZKXHZTd0r+73OGZe5Hdrj9vPOvt9epFGcDrFte@lists.infradead.org
X-Gm-Message-State: AFuF++nAyQdLqEZVWqDy8TxeMsUhywIjonPx5IEmIz1ToY3X4T4zj4JC
	2p6UroacFtFOWdPh3KLek4+osG696AQh1ZMfzeutccwIWANoehIm27Fy
X-Gm-Gg: AYBFou0omYDlfh1ylVFCpfMMS4svWNzUYnejx424+ZL5Mu7A8He2+FpQav/n0l/o50P
	+0IdsPB8+fV1A36X6FvwYkQg4yQM/2c6z35r94S+wXbks6cIoChZc6bEtzSUBwL5d042LIypXFd
	Ddw3n+fW6p+mESwHEQZ23cGAKrY8r2hMEoU9m3XIaxbYZL6HNUn4swYFC0pwOYzC+m0K+tavjkH
	kXBUwO61gNLyxth96QqwmYGPxWp9FfH27t3T11s7CrftQmQLMJ0MTBx6+hVegNLzx8Y1U2D1Dyw
	Mm9EJ4966bXuUj3vh/SbKKwIxzJCIWzLlDmKTCZKopO4qKyf0xsoM8FlVWoPV680vx5Xivk7V9a
	YsQ0eAZZNI1wEECUIGAdmd2cj0sJt6n6Hv/begnYTRKPuH/WM5ad4JH4sVBKQXhI3m0yTJdGNgi
	V5ggqy8pTMCkj8h/r7LGbm5zYR6vD54Z2/zpMSk60lENQtxWHQ/ET5DjQWMEfdkQvoDs4yfjljq
	q2tk2YSBPITw4nt4CiDmWKGR7BMiLzKSw==
X-Received: by 2002:a05:600c:c091:b0:4a0:1f90:594b with SMTP id 5b1f17b1804b1-4a1680fd78fmr60092225e9.22.1791124850158;
        Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:49 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 2/6] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
Date: Sun,  4 Oct 2026 15:40:42 +0100
Message-ID: <20261004144046.391444-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074052_158927_79700C7C 
X-CRM114-Status: GOOD (  13.30  )
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

The T7 has the same ethernet glue as the G12A, but the controller
reaches DRAM through a pipeline stage that the hardware design inserts
in the bus path. That stage has a gate of its own, which no other member
of the family has. Nothing else in Linux claims the gate, so it is
switched off as unused and the port can then no longer complete a
transfer.

Describing it means a fourth clock, and the fourth clock of the existing
list is the one driving the timing adjustment logic. The T7 applies the
RGMII RX delay through PRG_ETH1 and never enables that logic, so it has
no use for that clock. Give the T7 a list of its own with the pipeline
gate as the fourth entry, under the same name the SD/eMMC controllers of
this SoC already use for the equivalent stage on their own bus path. All
four entries are required, since the port cannot move data without any
of them.

The RX delay range is the one the G12A has, since it is the same
register field.

The compatible pairs the T7 name with the 5.10a Synopsys core the MAC
reports, and with the generic fallback.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 90ef79161ab1..96118b4d1560 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -23,6 +23,7 @@ select:
           - amlogic,meson-gxbb-dwmac
           - amlogic,meson-axg-dwmac
           - amlogic,meson-g12a-dwmac
+          - amlogic,t7-dwmac
   required:
     - compatible
 
@@ -57,6 +58,47 @@ allOf:
             - const: clkin1
             - const: timing-adjustment
 
+  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enables the
+  # timing adjustment logic, so it has no timing-adjustment clock. What it does
+  # need is the gate of the pipeline stage the controller reaches DRAM through.
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,t7-dwmac
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GMAC main clock
+            - description: First parent clock of the internal mux
+            - description: Second parent clock of the internal mux
+            - description:
+                clock of the pipeline stage inserted in the bus path between
+                the controller and the DRAM. Without it, the controller cannot
+                complete DMA transfers.
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: clkin0
+            - const: clkin1
+            - const: pipeline
+
+  # Delay definitions for Meson8b and newer (including T7)
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
+    then:
+      properties:
         amlogic,tx-delay-ns:
           enum: [0, 2, 4, 6]
           default: 2
@@ -106,6 +148,7 @@ allOf:
           contains:
             enum:
               - amlogic,meson-g12a-dwmac
+              - amlogic,t7-dwmac
     then:
       properties:
         rx-internal-delay-ps:
@@ -143,6 +186,10 @@ properties:
               - amlogic,meson6-dwmac
               - amlogic,meson8m2-dwmac
           - const: snps,dwmac
+      - items:
+          - const: amlogic,t7-dwmac
+          - const: snps,dwmac-5.10a
+          - const: snps,dwmac
 
   reg:
     items:
-- 
2.56.0


