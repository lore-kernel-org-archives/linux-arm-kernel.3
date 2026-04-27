Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5FBFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMm38LseJ/can2WyJa7lzG7mmzbgcoVsifOmEpljgeg=; b=ERQOhjTkPiOAYp5m4ka3PSNyx1
	j8HD7t02h++slxlcXeH/t7GPk2XgzTHGgb5S9IvSM7fAES6TjWF5cLpUBS+szO/soqDUL2Zl4oV58
	w57IIeoxMZmYPWy6yRntVQI1aPyqpxstuOS9XYCPIyoXiDsBfZ8lLS89tP6JYkzuJIGXLjUFwBDVZ
	jLDC7dCeqX/doX+im8cyu61vtRigF7bZ8I0/Cn3fRnZKUkoJnQQa9MvJsAFO83FBpSIo3x/G0ZeXw
	3i8qJcdX0TihulrB8cw1zo6pE15WN0Rq5jbg9ZLswfRiAbRGWnh16kCfn0LVbMRW62EfN9d6lFatc
	EihAhteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMsf-0000000H5bS-21HK;
	Mon, 27 Apr 2026 14:24:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMsd-0000000H5aQ-2Bbv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 14:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE6DD40437;
	Mon, 27 Apr 2026 14:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF564C2BCB4;
	Mon, 27 Apr 2026 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299850;
	bh=7Y8vgQ5oaQQ1eADmt9RQJb/9/dRh7wzS0n00a5vfL4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsQWO2DWlqlAEh6KEPtkJCtTRC/t+Pot7fdDQCo6CjBn3k0liWl7zwSAyFTyjSufR
	 vMX/O8Cizu1pCgc0PjuC2MqwFl4P2BCz1+bhdHxTowdpX9A/P9jdl7RmFfUrEp4r80
	 eod90/FmuICu9XxZ1azHPR8HhC8iCKSjF8/+x5rKjr+/UvJ98b8nuCT6X9yWPU7Qq5
	 h4FeuIMedSH7F1tcBBZc+tB3pZrxZBMOLHP+nDPzsnyupWrgdbKvRTsaXfXfS3l43v
	 r8G+vYX8akZ/0zhVWz4XM2L9tfavLipRgNn78I6KqW79r8dmkdM2yQHnwWQEuuGrlk
	 lmRcPIvKDGdEA==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Andreas Kemnade" <andreas@kemnade.info>,
	"Bartosz Golaszewski" <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Kevin Hilman" <khilman@baylibre.com>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Linus Walleij" <linusw@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	"Roger Quadros" <rogerq@kernel.org>,
	"Tony Lindgren" <tony@atomide.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: net: add st,stlc45xx/p54spi binding
Date: Mon, 27 Apr 2026 16:23:53 +0200
Message-Id: <20260427142355.2532714-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260427142355.2532714-1-arnd@kernel.org>
References: <20260427142355.2532714-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072411_603746_834316D4 
X-CRM114-Status: GOOD (  16.55  )
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
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/net/wireless/st,stlc45xx.yaml    | 58 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

diff --git a/Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml b/Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
new file mode 100644
index 000000000000..12d907720ec4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/wireless/st,stlc45xx.yaml#
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
+  ST Microelectronics STLC5460.
+
+allOf:
+  - $ref: ieee80211.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - cnxt,3110x
+      - isil,p54spi
+      - st,stlc4550
+      - st,stlc4560
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
index 84afd29c9b1b..deacfc4e244d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20098,6 +20098,7 @@ M:	Christian Lamparter <chunkeey@googlemail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
+F:	Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
 F:	drivers/net/wireless/intersil/
 
 PACKET SOCKETS
-- 
2.39.5


