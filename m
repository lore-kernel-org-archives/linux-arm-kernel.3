Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC5FCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=; b=utwVqK1HB3f32FK59l+cAQW6Ku
	iLtifST70DSrvnPgg7ZlHzCltVNeSp8eXrmsg2Cvm0RoG6fwllaa3YwTDdUzw1/VFuh+QsY99cHB9
	bkDnexNuQ7i3rqsinFXg3xh657cR+HphUJ4jGf5BA6ZnLE5P7Ub9Q3fzH/wEqAcytI1jqMj3GnRQ4
	cQh9bG1BBKTJGp0B8Sw2bfpvCh+TdKJR4Ac7jUJ0IXsxgYmN195QbPApa69KfrSWim5lsxGiqEu4A
	iKWBN5/Lwe62ECvlaTqIEtyUQ7AoTqFYagtnWcfQR3e2GKCgIZRpUlgCLhbntFQJDw0sV4XdOE26P
	NUYndRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBv-00000006cV3-0fMK;
	Fri, 09 Oct 2026 16:11:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBp-00000006cOI-2hGQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 16:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=; b=a4+ns5toDqZ3yR57av0iCIa35A
	cxaA+s3dMXBpRskeoiJRS3kfskqT2kmEAD2i8JzooYacBw0ypaSVBw18OpWaHwhboo7Z9lluTUN9V
	myAx7sHMFRvpFXDMZ/MkhEst4m3RHS/37buZUgEjanFkRG6pwoNOzRP6OGe29EOgTCr99XG9zoZj3
	8lnD9PjWXqmUK2pXPlT454NadCcq8dEpIHMrzE0PLGaJYCccjdqUTmqwnyldgpWvbSxP00jHfun38
	UBHDsUg5PiwIYoaIJ6xHkZLd68j0Mked3OFm1eFBXp3b175458EqCHHTuu5ooJI9uS4q+L/CHJ66C
	M72vwkYQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFDBm-0000000BOkl-2fRs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c4649b35bso6242443f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562277; x=1792167077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=qNVlWT/uZ+mTdS3xq/wePjh9vbO4dkpreygQaPJOqA+reMNNjibBORA/NZNzl2Ifbl
         FV7Ls5AydHc5cREV52haPgIder6DYkqfE6kyteGgHZb7AILIbGyqg6GPgZUZHUKKx9wK
         8mtCFGn9exZTgcq6SC6KnlgxhHmTaQwHemBNUhKeezhiLKD9Hh1QsJ8pBzP7thp68mc2
         D0P/BgifrUC7P6IEPUVmHW1NhMhJV/U3izpEo0G9wGsv/yfBm0SvcXFbzcUsu4dGR2Tl
         2M+0n8sSTx1qMwfy4W/6KHS6JjDIiaezBJTtuKkpICB8ArEAe5vg88y37MsGJe4xIw9t
         tCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562277; x=1792167077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=lO4Urh9uSdoSPyzXsLb6m80lyUSPkFSKeCSbWjT0EGej89lropmz5fBAyj9ptYyuFn
         FHy8dl7S3aVgSiVIYZeceMW0ep5Z9E04bNdGepj8TtQI4O4bljy3N2zxk7W6mNdOB8lo
         V+cOzaLqE8+REIZHCO++qUEFVmxgbYxBzpHZVKe3AUIGnpvzi2JxbA38lf3eHxH6MI27
         6qkTwMLd7V641l4pEHpNOAwIWmYFHXCwEZIlukJOrMQaEgbn7O78+zMqNFQoENVk8Yoy
         2eSSwlXA51nFgp4zN7i5/DUcbiJqZ8xKhqDyElL/A0yESnlQlQKdJouqjPHxKSBYshR7
         1i+w==
X-Forwarded-Encrypted: i=1; AKwUvBwnTozNT7FJoLA4eNLzEgGbNvddJVvUme3Epseqs9R7deXXCa8N7BmGkGxBjqL76ZOKom4QncbDcJiwuextQHbL@lists.infradead.org
X-Gm-Message-State: AFq9FYIJcCzyAFs90cwdtzaRJv2HjwcLY31zsFq/ABqEx4KoTmRyadCE
	bOPKP6AHx7tEW2t4QNe0FFSQgZbrDvQ0jzt7aVRmCLyvtoEKGuIuyMEd
X-Gm-Gg: AYBFou1N0TrqE959Qhg/W3QPhRdBsnWbtLWRrU4kh01qqqthPQpgqfBCKdglmNi1VUn
	Co0loX7bw5NR9DcqbQWNz3Ewmff5zHVsjtmEcCFH7macV7vDvLMbtNxcHBFvgGkzAXZVezljxgX
	q6HeWoY5EWSuMEy8h6cMQlSFIyNga6yDrP5YfZhLggEH+KrPmxMGHJqyWekkswRhkCuuteS1iU+
	+/Jjui2x2SqvTEzTap1u9/zVhaYnrivRkTxXFQMSxT4fbG42p8nTw75ZKgKiB7JmJxXBp9WhphS
	g3PVSc5sOr35POVSOs/VUQAFGdjwVpzLqHyaEQVY55AjAvweRZ60HmIQbS7LfSxUZMnZAs50wbM
	5nI75qUIUPQDut+j5YbdPBec+S2vyC7wzbicmlzxr18AdpUHoMIkDyLcKC5NhK3oxe0U5BTIGm2
	JG7mcnquA141ZFlNgmE6HqNaGcGpJgLTwxFugd0OS8uoLMD975437eeLeQ4plqewpvVwDrlO7Ma
	z/a8cmHvguwZJjvkJk/KdG/S/IeamneWHWBeoVH75ono7kV2kkuBKTCwJXphr7xZ4c0CFQlig/B
	V/EvM35H7s4EJ7MjUA==
X-Received: by 2002:a05:6000:4313:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48dbaaf07d4mr4638604f8f.37.1791562276952;
        Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:16 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Fri,  9 Oct 2026 18:10:48 +0200
Message-ID: <20261009161102.38961-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_171118_817911_B0EEEDF9 
X-CRM114-Status: GOOD (  16.49  )
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


