Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BDFCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkqcfK5g5kwyolRjxk9xPF6Gs0633C5dadI10Wc7gbM=; b=rw2PZhWRdFcq7qPey7xrV9mzRm
	cr4YOEyUCrUMd0cAPlhWOg8kUsvMgikvmRo0B+owIzSrnhUVVzTNpImg3ZGxhUPY3lHscV/ougJ52
	gN5IXOv3APKDWBC16/fR/SHhNwNRDc5I7C3u9NzNkRiEpGS07CmbpVfy+YicSlESg3sOo1jd8Hnys
	XGmm9LD6cnL593AjGTt3RNM7K0sMlf/3LKNGm4xjhgqWN/9OPZREuBIKfmBZHOURmD3CaP7Sw6+34
	UzxEG6XxKnfQbrTFcV8TKLvUmqR/Eqw4TrPblg5rFfZq75WkEooBoqDapiJMt4kQRFESOY3hheA6b
	panlwZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhX5-00000003Hh9-0Gw6;
	Thu, 11 Sep 2025 13:40:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhX2-00000003Hdq-1ZaC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:40:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45df7cb7f6bso3618085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598010; x=1758202810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkqcfK5g5kwyolRjxk9xPF6Gs0633C5dadI10Wc7gbM=;
        b=XYiHsaVi7PxSzLbVo7ID43um1fkobfuMGhe3Q4U6SXeoE3yzg69eehBBUcS0I2+vIR
         Mt8gHQtANj7NUdGpTtR0A2nEc13r2F489uApnhHYDldTkyVqRzW8UyJU/pmNz89eTD/T
         esH49ENPVu4dkK2pCaAc1t/I1o8VKTcolE9zVPggb4c95Z+zX9q04Pi/DCTvvwdcUSRD
         zXNZM1vi1wpc3WNRnbMbOypE9JaEm8jncsBrR1iF27LZlfhwel+I4VMzuNmh6NzJ5jrM
         3OamMJUdPHpZw0CVDZgDci7+WWV6zfL3eROgMsWbvdeMweppp+pF64PF96k867TlH0fQ
         ppEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598010; x=1758202810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkqcfK5g5kwyolRjxk9xPF6Gs0633C5dadI10Wc7gbM=;
        b=u47FDCdNPrZwJ9s8S5RAf9QfUmmDzR8ntiO5gLpeg43AFwSCfz8Ld4eeXyk3DjXprs
         ACbfGMOpFjxZGcunQCQoh9EtHtb3kOWhfzr35xotgCzoVVoo+JmnRSzR0XarP5kprtav
         KA2sMLidAP2rKaWcABrsuWUiq7n7+dgMp1zQniflmXCtLtsjP8KWK8VcQ3kKdWr9pa1B
         kreLqMLBQ9Ynky+TsqkwNTfYzIAwalGFBjUz46LaOJI9fen5rpRVaDuvOimmUlJMay6Y
         zImrBKTs1olUhfLcF4B/Ea4Z+lNWTeZJf2DuNUQWYuyoBt/Pd1fB+5SDIhVbpnK9MHT6
         oHFg==
X-Forwarded-Encrypted: i=1; AJvYcCXo3S8rSFSHCQZURTrSSuBd4FM4l8rb1g5m3FC8Poal+oAFOPIJIhxVL9Yd5/op/Wh9H4bDTiprJOKAaT1qk6u+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxghh2UkJeedjz7bAYSzXbjD3+EMS9AkPUe48XGW1MrH1ihDU2K
	4yZaNSoEu2JCY0trjzP90M13NAcPbsFq3WEhU2xTyB5LgDzIBwVADezV
X-Gm-Gg: ASbGncuxczNHcC/JDURPJNe6kPK7h1JI3sY1qD0CddtrgFsbS2jD5YC5z+5PkFPY6hr
	40MJCZlvMa0DPYoGh2VvMtbGsYJjbNRLJb+MWgNgpRNzIyKs9m14qNNyLDe6fmRww2t0fgozaBd
	Y4oLhzKPmTLGvfh0kZf5vqZKnl8MRvoaZCwiHcbqbDqe2VIlCTfHrVEYlrfNndzRNX8KEZJiy+t
	l8amTcJ3/1ErkvS2TrlqD6I8zYl/jiXejI5EGwNYfxkFE5/GwVnUxUjyyGbixi3k1XhFOv/cE0N
	ylIUqLy5PnAqv5SLu6Z1kJLwBgREGvvHmyA28+K4ReT4JO3WJzqBuhWv5S5/9KpK+zC1xqhJ1kT
	Gvw/vyusCkHxUBci2k+d3RFnrqYKEFtaiDboJjaUp8XMSInkmHiWTBl+24DubuifNmEvaF8k=
X-Google-Smtp-Source: AGHT+IEurhbsxyz+hG1AOEJ6v7+ZpKbOZsA3ll2VFQ+7hS7XM1WK7VBJbXT7MuYmuykPNpdXEUZ/yw==
X-Received: by 2002:a05:600c:5249:b0:45d:e285:c4c6 with SMTP id 5b1f17b1804b1-45de3c551f3mr150961565e9.37.1757598009703;
        Thu, 11 Sep 2025 06:40:09 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:40:09 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v17 3/8] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Thu, 11 Sep 2025 15:39:18 +0200
Message-ID: <20250911133929.30874-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064012_445145_5B7F1E07 
X-CRM114-Status: GOOD (  15.08  )
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
2.51.0

base-commit: 04b74f665961599e807b24af28099a29d691b18c


