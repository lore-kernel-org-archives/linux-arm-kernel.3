Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541DBC54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=; b=QyANCJEnY7gSo7KNGqw+xCog+3
	idEeHJLl6E1g1ETNlGSGrJMjtS/lTjQOgXa2bSckQiYl/JcI/2TjNB4hO/E0NfPKeYtsaSPD7k8iN
	CydgJJ4yfmhKE6FZQ8F70JV5rzhbxeFjRMwbGzhEUunuV9D1rPFOETz8LkcryyYKa74HdarQhR1pt
	8KWw0JAtnSYVKM0G7iEfhAVbX2aho+PNmTEUIILq8bK0iWbv4X0uweQHILNu27a7hShhoZP78tyLm
	lqoAApb4ygHLLET/JAY1aV6qm8Pe7a6h6fEqqaITV8y4WWky1tCNbFL3oAX55k1+OcQu6Ssr7STde
	67cK0y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3c-00000005hoa-2utS;
	Tue, 28 Jul 2026 15:49:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3N-00000005hbH-2oqq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954df200ddso26733185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253752; x=1785858552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=;
        b=YqjLQvYNihZf68eTgKuaolzvc5RLC2YP/6ZmMLxY/Qf4fiD4chKmyOsBW3miZg9zm0
         qLe31nDlKZ0D6ZqZ6gD2tWSCj78jeM0e2D4wk3asUrqqM8U1itkjN76UUa9Bce61UVVG
         HPbgjJJTZNvF3hWD3NWJyxy7P1JDw1AMKHxqOhIDFdgqyp0M7svWTDCgECF/BO+tszvk
         ZfdRcs7PWD2gKiUKkoeBty31judMdUUBHz4HgiQZtAQuHfMcTgcddNz1zOekxHwA2Bd8
         2QOgqud+C9XLuKyDQfa5mbP5Wdtr+sv36pjtSnSzxchFeccl+30L19z79Z1VhxjtHhQq
         9wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253752; x=1785858552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=;
        b=T9pgxpnCA6vmpzKYNyVtF47mR1NllmLdh6xeoI8xHJulJ9RrkzPSvJldbnvkrv6GQl
         T0+hsxAPfInUdfbstqjxsKi9ng0af22GlvCgMYhUqJSzzeo7Qr22lDc5CDPKlU28lLoX
         3pWhZC83+xlJCBsJ8oWCs7jA3UzjQi2KKcBNB1F1V78pvXmrftnUhs2Ru+vjKzCiQmAj
         vFPxOjqVvr2hkkvJNhEUzk2AT4SqSvGfGIl9P7jgnCt7U2cvwMx/AGIUGN7o8MKiJ9kb
         eR3UnhfpCUZk5y9vLEposWMVpmidExW4+OMN1xuAHUgbgaYrrzwRqIMQMoDS824Gm7z8
         FWTA==
X-Forwarded-Encrypted: i=1; AHgh+RpRt8AoWFeFU3DLA5Vl3z9+6ETZMTisw6EDLJqRoVDCg1S0AxxztuJ4iB0m4fJZGx/OTDzNTZ1+6+i0YzhuLlzU@lists.infradead.org
X-Gm-Message-State: AOJu0YyIm/EViPUOGXWKi+hp3REp4eXhbybXP9xxyLsgK3yKtyEJso+e
	Om+Nfa3SfmWTbrRDp5AM7F9OIbzOIeWZI6wU6IR9FYfGqPw8FYul4yeF
X-Gm-Gg: AR+sD1156flvlUKB8f0+tndmP0TnYjThnc8nszL93XAGu1QopfSppLQBWg5ex7+dg5+
	IkCnlQY+j3wfaDGBBLhS1buDqSDGAmBBUGByxJ++8J09kgiSWu20P3YCc1dgdnuBegJkzQ8Zc9T
	46TGYF5zcpVuuQoP3UwGAAuQ4ArJK/rZZkw5Ed0boHrpQRJevQZIV+l+yzopo6S8m65XbqIs8Xy
	q7W07Du1LDSJjmw8iG23zc2UbpQ6Jhi/VIhGGfvL7jOFrAc+8rjTHeJna0CBy110llwyyrZT3zG
	6GZRJ0CqDp7fktPIbObTe7P2FQh1Yug61zl9Em08QGaSp/kAKJKP6xjGztvncKE5zFvDuVR2DzF
	di2VpSxnTRuAsfi5hRI5L7b5iKJvJN3Kvo9Bk3zDcxwcXTCFSs7DNMes9FTW/abuUfJiCxNwlaX
	2TgWi7yQeFQe03ONJU5O41NBotwWbK
X-Received: by 2002:a05:600c:5486:b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-496c6414bddmr31261065e9.6.1785253751459;
        Tue, 28 Jul 2026 08:49:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:10 -0700 (PDT)
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
Subject: [PATCH net-next v19 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 28 Jul 2026 17:48:30 +0200
Message-ID: <20260728154846.1828945-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084913_761862_2B53D251 
X-CRM114-Status: GOOD (  15.13  )
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
 .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..647d6d4c4c6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,173 @@
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
+    $ref: /schemas/net/mdio.yaml#
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


