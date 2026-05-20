Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7415CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 18:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kx7bWM1kJr6AOGlca9EF/UDaya3vcfDIi8gsI0tM7xo=; b=tU8fZLU/YqsYt7H1eTEM+w5rWa
	NVeElieEzY1tqjKz0uy8lI+Zr/t8Cv1luS8aE1bulNrDNYfDgt82CfZWixHraQhAo7n0Ks/6rt8Bl
	/hrOdzuAHkRLsgbliQlEK9OxzJszmJD2VzhbzGERzdLDr5HP28tWXlQJ+tvDgQnqDw6O7LebmeG1V
	HozfGKiNNFr2XFiAusB76igGvT3yhB9esThHZHSVIcVdw+fdcpo19sBJ9Xp/gpreDchiLLfsaXf9J
	GPULFdfpeo683vK96qBJavhSDYMQVQN/3Qf+lwoMoeVtHxZnzjoFMWNQtnOVw/NQLolS02Ae4X92C
	fIYUV37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlps-00000005VM3-1jKf;
	Wed, 20 May 2026 18:40:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpW-00000005UhB-1932
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 18:39:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBB9940841;
	Wed, 20 May 2026 18:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC9F1F00897;
	Wed, 20 May 2026 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779302381;
	bh=Kx7bWM1kJr6AOGlca9EF/UDaya3vcfDIi8gsI0tM7xo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nj4jdjHyclmkGQphNLKvljHh2Oh2mJxYSFwUYxk8N4A0juSC3p4zrdZpAPwmwED7O
	 XNvE3oLYFJqleRrk3PSuNs9F/+FEieEzGuJ4abKxgNQ7KZofHNo33I9+e4ddCwocbQ
	 x3I+o46EultDco4KSYYQ0w7dRLVfrr9n8XmrLqTu4cOXhRdfRt0ccSS/0kq4in+3Yp
	 GywhzsoRU74CftCcgAA1LsEUDjPBejWNSDXZa3t+tk+agf6MR7ileZJ/V3tETZEwIR
	 y1sisiWPqk3zz9juYnIctU7rYebD9DyJ+XBcLeX5utyxkwMHQqsFdSzNGQWrHFbyCL
	 T/r7hTlGIBNXA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	Christian Lamparter <chunkeey@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 07/10] [v6 net-next] dt-bindings: net: add st,stlc4560/p54spi binding
Date: Wed, 20 May 2026 20:38:12 +0200
Message-Id: <20260520183815.2510387-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520183815.2510387-1-arnd@kernel.org>
References: <20260520183815.2510387-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113942_422313_264A34AA 
X-CRM114-Status: GOOD (  18.84  )
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

From: Arnd Bergmann <arnd@arndb.de>

The SPI version of Prism54 was sold under a couple of different
names and supported by the Linux p54spi driver, but there was
never a DT binding for it.

Document the four known names of this device and the properties
that are sufficient for its use on the Nokia N8x0 tablet.

As I don't have this hardware or documentation for it, this is
purely based on existing usage in the driver.

Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
Acked-by: Christian Lamparter <chunkeey@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v6: no changes
v5: fix name in MAINTAINERS file
v4: renamed file to st,stlc4560, matching the primary compatible string
    require st,stlc4560 string
---
 .../bindings/net/wireless/st,stlc4560.yaml    | 61 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
new file mode 100644
index 000000000000..a32265c07350
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/st,stlc4560.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST/Intersil/Conexant stlc45xx/p54spi/cx3110x SPI wireless device
+
+maintainers:
+  - Christian Lamparter <chunkeey@gmail.com>
+
+description:
+  The SPI variant of the Intersil Prism54 wireless device was sold
+  under a variety of names, including Conexant CX3110x and
+  ST Microelectronics STLC4560.
+
+allOf:
+  - $ref: ieee80211.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: st,stlc4560
+      - items:
+          - enum:
+              - cnxt,3110x
+              - isil,p54spi
+              - st,stlc4550
+          - const: st,stlc4560
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wifi@0 {
+            compatible = "st,stlc4560";
+            reg = <0>;
+            spi-max-frequency = <48000000>;
+            interrupts-extended = <&gpio 23>;
+            powerdown-gpios = <&gpio 1>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8063cb56feef..93cf1fb72357 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20306,6 +20306,7 @@ M:	Christian Lamparter <chunkeey@googlemail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
+F:	Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
 F:	drivers/net/wireless/intersil/
 
 PACKET SOCKETS
-- 
2.39.5


