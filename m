Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB80C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 18:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=; b=Z+LmW/OQt+jA7soqcKk2t8YJge
	DVjTsjg993TraZ63wbEzHwG8QKR6w+wIJXfwf43ocMVYjww1R4ROvFuU/3CgJ7dushnww5H4hKW6S
	ur4eK0tCAvb3PGaOsctPrS78lA3sNk3ixb650ptVYpU1IaMycydL9mJG03J05Z5JwNkFTuZKWDgb+
	iQ1Pvr56BOsWACafOUtpYwVukONavrxh8vKXV1L9gZKbWFCT9zOAptT9wIvL0WWLFw4yS7H3fnWO9
	ldhzarjp3VG/Gkp9xy0fKfynPXuzWlog9o+PHegndX5LHBRRNTVdi+d7o0Kci+cfiCOsT+B/RDziJ
	jI1pWsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbp-0000000E8NL-3fn6;
	Fri, 25 Sep 2026 18:25:21 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAAbU-0000000E86v-1AIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 18:25:02 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so7345795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 11:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790360699; x=1790965499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=ewjoLgKyXpMRWka3xquLfvNSUUd1X6BbZGPA5cNsVTptNVxZhypgtgIVQEPHmGq4fB
         2OhXbMBIsGAePOzMS4YY75zlcGSIKkR9a25plz2c89SYXC2Uylfeo3dwJYk2hcNtLZyi
         OQ+HWp6Njcf0Rzd0pkNArJWCerYMujGa7diCMIL35TIRIyL6WQkT1wTDAzra6NVKc7Hk
         UXvIgNfpKOFCNmfy7TnGwubInyB+kkYyiSwAY68KxvyeGfHbPXAd04rTDRIwhSTC0fa1
         emSK7jxVHVeLvGeS6bz0exAx8rc8ouCtx/XFSm/iWm6p4GTrYy0lCeUw58L5KrX5GF0V
         6+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360699; x=1790965499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=onNncnZk/Y1j8aqbkdENa6NOCuMEhCyjrD1XmMLK+1TybpxfbzDToi+bMN5hVcnSFE
         I3z09rLy4x6UBa5lYf6qdQdtFh7gPzPOCfKmMHJJ45LM2Db8z+vv/V4pwNFbzPPFRJqi
         SgeTJpstjI8tTZJanhlVSQ8Xhud4vVB5TyXOWHQg1YBmkNpDSWetrxq2Zw9bjPQcKhs1
         y/R+HyS8q8kK9cRd0/eZNtv1kyCCx+Ct8i63OD8C7m2xQZxWYUP2EdNsbIM5HjyeJS9r
         lHTXEXrFIrfm8qTpdVa3qF4/4JyHyM+tFLsS+Q/G/0BLdTfh0SEjAfYjAmq3Ls8AvUYu
         BTDw==
X-Forwarded-Encrypted: i=1; AKwUvBwkcKEGTSnKSHwhJr2mkHgNvfc3irPRLOL+U8cVmurte9iPkDO7pJVsPJs02QA+9RkMlrYI49yONdy/pI8U4t+N@lists.infradead.org
X-Gm-Message-State: AFuF++nZiTMb2fH8LzBGxi9RLo+9PVvgoO9YteLGxZ6w1Fuk3JGASeyM
	PAoqUKDbjXF8P5dzVkh0C1qkvZIC3sEK3LqT1ShkvNpuFtQC4++IGjGA
X-Gm-Gg: AYBFou3qBZc4e1U0JlLdbPmcelgbfGNJeifwgtOBiq5TgfFFnWsD/u06IVc6AjZ9xTh
	arAtCnhnRqG81YqlZqwaXislew+Z9WY2OuGKcy3bng13H0h/4V0fytN3QgH9x+Ji86SMsV55xQJ
	qdIM/zTzB57Jm0N9w19lf0RPEpZJHfATYtkqm8iVh2CUMBVo6T3IUyOPLbpgq3OoRO0TiOF5KbP
	Fwy0F0/2yjVolFgrNiUtjozr/pL2408VzqfjVHTuQ1sBr/8SIUdjife+nSWjE9vTXDnXBGLF1xP
	H9rwx0Rs1tyZ9l5ZXAwy/bKFi7izyXFBRvdObXfZoHW/Ok85SCOagvg1UOmNncYzniOE2pn3YGT
	JNvuQiEhIVTqDAeD2ssVXrMbm68QRigFH8Jj9ZRiOetpirY1DJuFxFz+Ov5rqnOVG2Dj9osNXUe
	lQq36FIYl8ASGoJzKa24YvO9KPl0yXpp6QRe/EffgJXhNDzCPpBGbE0QWHNJOGFD/6AjHb0uX6Q
	IgyXSGz+t9cgddUscU3OTgrP7R6DwkHbu4GCod69m+b5Aw5akERrhZzF3JYsXP4XmKVf3gG54k=
X-Received: by 2002:a05:600c:3494:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49fe66d0768mr111652235e9.12.1790360698492;
        Fri, 25 Sep 2026 11:24:58 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm266231245e9.12.2026.09.25.11.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:24:57 -0700 (PDT)
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
Subject: [PATCH net-next v23 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Fri, 25 Sep 2026 20:24:25 +0200
Message-ID: <20260925182435.21207-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925182435.21207-1-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_112500_367677_BF557E53 
X-CRM114-Status: GOOD (  14.91  )
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.55.0


