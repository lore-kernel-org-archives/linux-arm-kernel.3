Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79066C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=; b=VQqAtGLFge644PXRb6hKHJfGHX
	lcEo7yuPx4VF4PpqQRWtwHmCyTzZ0iNwdR0gtrY6EjJZCv706/MN2SdFuX02UZxWaM+DBNrsI6pdm
	i8JrLNe91RXSxWleKf0dKum9R1+Z7t9T0/C3Fe/JYr1WB5bQ9OPANi0RBijAKSqOOGlM3jvEG3CDH
	Rn7KGZ/ndNNgY48QdqLSzTtgOAL2KPDzzavwHoTtjDHy8+apm/J6VzGp9/DaVqVtvNeflHNA1nTos
	NbRd+b3Lu7hA89xY873a/sIAWC/fftKrk4uz5hWsA45dps/a/2rsA5CkBJJgzKm7nipxsI6t1PmMf
	dhIBKc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SR4-00000006Wx7-3mCZ;
	Tue, 15 Sep 2026 12:38:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQj-00000006WfF-3wzF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=; b=mSpIhQOhVqSePjG/iQjNK/6pci
	sBBAgV+55Vdo3FstSI9TNu9PhXf/CBEZ23TBuKufOBXRSTZyPLe5Zkeuf5T0R7FR3UHXY9WTav3XX
	cXC8KpN1wA7R7fYrSdUpbj0fZjv5AcukRjgZWLaQvMh61svlqQeLnrPA6VifoTIudcOILGt3uU5Dr
	HxEoPpYuvl/tb4lUNPxnZX/1GKrq5zQofzzXASUmUZ5caSAIwCFnZd5thPZC1C94IIMxCvLhpZplw
	BOtj24QYGPlslTq301YGMnP/Z7ciP+/enMfuQQrOW5wgIQBvBhLPQJNfuAq+HUCLmgMU3gg+4ihiM
	UFbvVzOA==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SQg-00000006kDz-4BaK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:32 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so1670815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475910; x=1790080710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=etiQfcbdnEITDIPR2j8wv5mzHFYd4ymQzzQXEWRx39nmTBYwal8OFfhEdpAwuBYscY
         ybWBUwD/c0WKbvlKYM3z4vH3kpBWW4TanQxJgsBx0XrAHp097E3uDSUi8/YmM1UoZjnj
         o2erdm/EGJ3cZsg2kXVJ/0LynGlRg5hpMSDGCfd4JXzExeBfJDdI5wM+IFP16UA5LNaV
         bsVmeLCPm1w1tFN9/DJbapZ/XnEm7jzvsoeA4prEUYxyIo6e8k6AWNxqSeceRCCblwve
         nvNyWcrEdK2cDTJx0ez+Fxgqmvs3mRJkWVSOf6hjzL8uMaJGQLyDuRSt6yUbNbnn8avz
         qePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475910; x=1790080710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=AgdIBicmNTl7zLCka02Xsg6z0caEI/y47geUWELxGtZ+tNuIVUSm1nLVe8E82Mu+h8
         DXgb9pJp3S6MbusLsOIZqMuPQuXRXLKZTJdBR5ea8bZenkK6DxGlxlzpb894VDy9H70E
         lZzW0cJ2mMXXcDRlZh/UQlJgDub+gGv7aXaUVrQSPN9Pg5rFZU+naPoF8ANx7TsVvbFu
         +/HYTKcqizcbX/rsogQ4rLLBtWZyXEIoqfVUhlZN4ldhdWuGwBo6cKd5u5dSN/IzZiu5
         BjS4ae1jYCXnhffnAGHowJhLcTXDWtRAjBNTwEmfNM4XmX0N6MfzJTdKpfmvUjz7IO5d
         b6CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZBcqrZyOz4by3V8zPNtHjxj4kCWlL57ogwaRFbEg2VBVaayfivIOmMfsN5fhzIDXMFBJkdiHQ7drlS1DadgqE@lists.infradead.org
X-Gm-Message-State: AFuF++lpBVKQv0ppmNkCbuBRmiVJz0AJWj+SbXri+z81PEkWzSKJgf+F
	qwo4bLen8PxFi46n5fNSeBblrAGpwHH9bzDSQtDkM+mDYDN1rZVd+BKJ
X-Gm-Gg: AYBFou2ERXewWh4MdA1yCS5n5m4/Jc4rv2WODn//CxrI3igMPBkoyWDdzAFxF7+ACu3
	TPRhud5MqWH8ZN0THhNi02b5/knhKfyTYQbvCzX7vI0empv+JrgfiGWUtzwjArIwY+FjZUhI0UH
	iu7nqHZtmgpKsVoOac6KUOayHDMA4smSjc2oJ8KKMCehHPG+xlFf/0+m9J6JOlhUjc6xInfdhtD
	haTgwVZVvGhYIC6Dg9znkqX1ho9yK/utUuIPWUcmRZ0IAgwIo3qdmCThcyz8ny99Bo1SWVI5xzE
	pCdtSa8FWwCqOSJw9L0CmQl1Vj/BU6EHvqV2NLgb27ZsezjktDnyxunTGokPkP309nXn/Y7bHfV
	Bn7KrxIUoES1zAVO6R97B26/lUHJqp9W+10hKSLImt6BV3xSV+acODU53FjdWBEsWGbitYcL6Od
	uJfk803Q3+TrFAtXfe1vkHy1hY9Z8XDQFf9o8gsWDvQ/78xhvzvWtieo4N4DwdKMHY+LeReoXV2
	o1wzsogr4GjClxVaxlpNz0asqPxxLGhq9OSVy5R3btgguWyQ8OmqZeNaHT0OLbu
X-Received: by 2002:a05:600c:46d1:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49e82213fffmr15058835e9.3.1789475909648;
        Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 15 Sep 2026 14:38:00 +0200
Message-ID: <20260915123812.14747-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133831_156594_BFBD803F 
X-CRM114-Status: GOOD (  15.54  )
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.53.0


