Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49B7CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iIHmjNYzJfMkSB/Eez7mPIwgeGVEwQZjO1Fi3Lcdo4=; b=Vd8V3+b8zU2phyFL/ViUZbPgEh
	4kWOWnDjqM3AVnMf/DWI+MyVNnIVuEhoJRkQf8p1QUUgsg3uwRO15yuJNJOZrTuiTBGz3SOl+33Ec
	VOQgYiIwP81+EJoVeP1tpH2vz/Si0sFKBpI8uLoDOyRkmXoiXV5CJuL6zlOAPhhW96uRzyqXkVI2d
	yjT0ykAX5cVHXNkgii3TMlCp7C+b82mophoai3igJEQNiAd7gYZUfT1u6Mv/Bc38mAobJa3+E9HXm
	bcYiZkR98y1H06eKoni1sAX61hQks48MHOET5FBNZ+OvL6Yoms9R1C7x6iZziMs5l6560Ug4gwF2F
	yoFnV7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsFR-00000004u1Q-2hev;
	Tue, 09 Sep 2025 06:54:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmSo-00000003I1a-0Uaz;
	Tue, 09 Sep 2025 00:44:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45de2b517a3so18432255e9.3;
        Mon, 08 Sep 2025 17:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757378640; x=1757983440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iIHmjNYzJfMkSB/Eez7mPIwgeGVEwQZjO1Fi3Lcdo4=;
        b=HfPgU1NVtLYVTX/FpDZGFgFe/OOLwpPRM/ovzb+55B5GstSncppFgEO7bBRKVkhQ3q
         CC3+VTDZ+Icrbth5vybhvcv+POdwDC0hqtpkSBJmPUH49ZQfBiYczvNx914W6kDJwP46
         Uet+Dk+0WwwNMrBPme7h+CY2yqXVz+ItzL/NM1AfrvuAdquUPZg+Ouu5M/nXc4Smxum6
         BukUABmtPgcI3j8W3GW7VkHEvk9tXfWNl5Tax73+XwUbjHLV7CQVTdCBwPXxKUfw21O1
         uwmqdxXaRIxhs/LKcBwrfmY6zr7Sx1tNHgcX83OR+x0Ul3bvWOt9CHTX51LLtGjwLVZQ
         wiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757378640; x=1757983440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iIHmjNYzJfMkSB/Eez7mPIwgeGVEwQZjO1Fi3Lcdo4=;
        b=NzscUpxICODFXHS+/Su7fuixtKGpWzYRy6StMXOWhaI5fOzlgWWFo2+kkpUzR3YHyh
         YQG1pvIcNsADPxo9tnL1O1+Zk+SfYVOZowkTuZgGjxowRTJnFay8+nMmrTiwVxhdbXFX
         beIgjyrJxNzGF3luQMI7rQdU5VziThJksYzeG00gz1659FogBUSf44CtFWT0SZNGdcyO
         8m7soJ2+O507idfROIGOUSArsj9RTdR2C3Z6gMAEl7fcBTvtSHFVAb2raxsnV0I6Li9S
         4XPYWoS7Ar5gvS2Eulony8fIy3nSIitRmiige36b3mN74VgFqfcIGw7+IpkpyuMmmHyp
         fR7A==
X-Forwarded-Encrypted: i=1; AJvYcCVO2PUKMf5xGKr1yLrczu+b4hl05Fq+a59hfxMOrltCQmKGwmGXR4G2O17txnuW4uUw4tfosHYz25tEX/oZqVIe@lists.infradead.org, AJvYcCVkmIwkAsSbzDYQ15jqoscl0XMgYSP0QL3j2o/qbOmzmuK12d9uGiQNdwauNUCSl+b7obXoGJOiGCg/1fogC98=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDFKeFi/boGHD/iL7k5SLL+wbJj0GTT/ZQFb9P4IVepCKKf8Z1
	CrLJo/zoITkcad4x6opoF/3BnF3t4roHhKJHh1VV0arAqBnCcJ+fXzZ1
X-Gm-Gg: ASbGncu2+1qioaQPc79LdZDtLKbc+S0C7u0vLuZepvutqXS4hCzlVa+DPGoknu/bj22
	TZ6w2XImckfrS2bM2cDRk4xFJ12iT6lm58PYJWIdSChqAfF1pj5cw6DvBgc6ycpOyG3ncuW79dS
	Ou3wzKtVbIvZX4OdjbeIZ8zAqUW4m/9M+OGV3CH2JpKC2UsCWwKpdLraXDfQVS9ZHEfpLxLDSEp
	mAA3Xryeqga5SGIwsH41960BQa4kM9Q0BUCYjoQYvXpEVDyS97VSIC8pJtRVjbpXymkiyJuBlJJ
	yfl+OPAH4Ot4zEKYJaRaqXctXFpdC/D/Wuoa4ogMPTdzLgeSvIGTCc4k83A5BLV+nHUruRiStc6
	XhHEm+Jp0GlcXTbsddxBPUN21R0t/RzJiOmokKJlAZ3PtOEhZt5jvGupbF980wLuMaNLnbPdTzY
	iF9C1EyA==
X-Google-Smtp-Source: AGHT+IGdgGnrLTZnPB86nnYVcBNcEnc5DZLVAd79zsGk79rsxwDjvQnZJ5bvXWT9oXJL5L8j9ucl3w==
X-Received: by 2002:a05:600c:46cf:b0:45b:67e9:121e with SMTP id 5b1f17b1804b1-45de2b4e677mr59264045e9.14.1757378640498;
        Mon, 08 Sep 2025 17:44:00 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45decf8759esm13526385e9.23.2025.09.08.17.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 17:44:00 -0700 (PDT)
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
	Srinivas Kandagatla <srini@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v16 04/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue,  9 Sep 2025 02:43:35 +0200
Message-ID: <20250909004343.18790-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909004343.18790-1-ansuelsmth@gmail.com>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_174402_160732_52B641B5 
X-CRM114-Status: GOOD (  14.47  )
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
 .../bindings/mfd/airoha,an8855.yaml           | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..a683db4f41d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,175 @@
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
+  reset-gpios: true
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
+    $ref: /schemas/net/airoha,an8855-mdio.yaml
+    description: MDIO exposed by the Airoha AN8855 SoC
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
+            reset-gpios = <&pio 39 0>;
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
+                compatible = "airoha,an8855-mdio";
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
2.51.0


