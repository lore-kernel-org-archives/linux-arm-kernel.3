Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D153ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=; b=uDbfAyC8wM7ehBTuiMr+NzWvJp
	TldVZPfJdvKwgHSo4DrclmuUTyuP5TEBhdPrUiqdTNi2mDEOaF8vz7TRPRC4PhPRQUgqQQ3B40FQk
	PhBwd5QygTi5a/BT7x8oHYBxF/MPKESWc767bfPLkoFqdleyf2n3mUoTYnCE+VDwQ6LKt79GFSQMh
	1ha5J1cej3mt3sJly7SHdePoS4fK3NqlGWUffp898iuCgW/rLK2k3x9f86ZM2VOStnnPeAVLRd4gt
	6L66EmUljUJQFzS5ClxbtY+KruBXh3kRm8tz6Sv6xV4QweUSUqiG51h2tel+s0ETGLZWpmTmy0fno
	F109VGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYG-00000004vUi-2AuG;
	Wed, 20 May 2026 15:09:40 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiYA-00000004vP2-20nR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:09:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so116361f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289773; x=1779894573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=dCpkSEu/9JaQzQm6HexSwO9XEQMW3d0Hc7vjKIlDDcgL0X+0K3sF70/sYZ9LoMJEm8
         /88NVmz/exKi0NMOdF+RdUV4McSj35p8pjR7EtI9XDsgaEBABfK+hr8cCDf3xn1GYLEy
         z9LhHtA3o8Sylt7Q5KaqTwQBo6NCen6VqGXeixOFPhN7liRJ/Y0LqRsp1A+c7Bzd31yJ
         xTWxSDhrYHqk5ki8Q5LC7zvtmSW+aW0olmRtXlAxqJJvW/91tfw9mJ1nxrcMeYJ+AP3c
         Cs7W+PUus4Fo9bN2eVV3+CLPuTCTvs+jY5UEC28MRBs7EM6FRR1XMl4E6YS6vveHw6lt
         2teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289773; x=1779894573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=LObkTyD5Epy+t31vpLT+bfzTrF9wOanwcnj4iZTtifidoBKF0JvMfi6lh1mBZ5t3O6
         up3g9XCojN9pXr3S3qiAZd5lfbypvOe7+c+oCYXmD9bc0L6JZgzvOGp/XOIlDJyHw5Ou
         bfJWdUkyGVjqBpVUZhrh6VoO1oEuZ9pVng1Re+PjY2MiixyC1Yd0XTUwpUboHIhFQERi
         eeKO2Qm9yiG79Qxn1QrMYpSZAS++XiHGwhdx/sFzcVUrKlECDXmhMIsQpzK2M6+ikTgT
         nXYiaHJZoBUE03LTPUoZ/pkS91/8dgIM8ynMgOlo0RrsigByGC9ZVE2HVwysmzf3E7PA
         3fVg==
X-Forwarded-Encrypted: i=1; AFNElJ9H7Z6k7UKlsYTYhnlUkvGceI6CYFvusLHuCu+vIns3rHEzktjc4KNWNYvt8Isl1/l0/qciQBfP3bJdjbqQJzQY@lists.infradead.org
X-Gm-Message-State: AOJu0YxzDKHrVWGNK0nYAjLq8szZArtwxcHphfpG4DAFbJK1IB59q99e
	10Cud1TE88Qvu4Sv0sTOok86oord1PMqLTLSqXpEjo/I7FwuNs92KZJ1
X-Gm-Gg: Acq92OGSbE2+SVXPvqseTwp95RDKsuXcl7Vx6fSlw8r+jRobI52b2fnyI699JCgI3Fs
	2Pr3ee/bxdi00y3JVfsFBWI7VlpHmgVpjnRXSbQYjH2p5OAUbIfFaK+ULae5wcNwzOmndX+Hqgx
	8ruQkDXhiKQwq9l/AA8AaomwiGfxtcmIYeuQ6IcmiI2cuTa/0HiF4ZaH0lC+xzsSe2bt2Cg3M1N
	RQ4+arcXmToUVqvT9PwGy9pjPkT+f5d2V01vb5VPUVhME2XtCkjeJX6aGf03TP5R0Okj/1pkLoR
	UUXYx9IKY43ME4nT9yiGRivYKuNs2nlU7GBoUT2WfNnRK/IJaiNJqKhCGn3/aOXC75fhrjyYl/2
	m604+O7rKqkFA8Bd0xlmOKzzBKJjE9ia/oYFhlzIwQMgfe3SOWiIxbh0Z9X0aCJY/BUI8rUOfBu
	ee6Ipx9hG62wVVgw0DTB5oYoog35DhYAshzS7zWsq/kVYoISIUhb+Jf7YjscDg9TF8mSpKYx6SY
	Q==
X-Received: by 2002:a05:6000:25c1:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-45e5c5af3c9mr45932958f8f.13.1779289772363;
        Wed, 20 May 2026 08:09:32 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed, 20 May 2026 17:09:07 +0200
Message-ID: <20260520150912.11614-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_080934_542111_9856DFD4 
X-CRM114-Status: GOOD (  20.18  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f561cf2a8103
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..932044785a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -771,6 +771,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.53.0


