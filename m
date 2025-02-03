Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE79C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=; b=v/L57fp1y/N+Mc86XjuK9U05Uj
	ifDoEA5fin+EMmWImdtycFrMwPhMxypCOUALyc4TI+pSwbx69akxcQnXkA/UY9gpZv6JRW8270/Fi
	zi4BgPnUPKlce1D8IEVtwHKtw55Q/MRRfvufwt8NeyM7qim/JuyP7Z/dHebrbSlNuk7BeHDGTLn/Z
	XXW4bPFGq6gF1Sn4/l/mdsc0xTFU9ZL6XQjhMeM+pzP3dC32Eiqc0ZrwmLC0AVsI+5efEEOaR3xld
	ktQ5dWUtq0DKAzV4w+wTNogQj9ipxBn1QOYrS+cZUzOLa9eRaDkVXMqCa6GPQi0IX3Vo2mrQe4S2+
	lXobSIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepI4-0000000EbZj-2VG8;
	Mon, 03 Feb 2025 05:46:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepFN-0000000Eb9P-13sQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:43:50 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso6958608a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 21:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561428; x=1739166228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=lMtnJ6G544PMP8yecPQT9aw145ldKz0NHnDvj+YSb2y2wBzbjcqn4Td/bdLadselP0
         dZ6Wh5AsZs/W6cjG5bhiIGkcSc/59Nm/347+2xi1uNWN9H74arpJwyYfgC6r121+SP05
         TAi7HmrfxxbmukoMTophCSK4dg1BNvyS7UaBKl9W5A691vJLgpCAo00K11uEvNSjqe2p
         0FJs/58aJeNIsgFt0pnbSde9y06vWc4ZMuRbh2IPQVEh0zM6Zdt3G2v+RP2nX9YlKMRN
         dNZKTdeWE9B1iFgLEnvngi9vga6jkfDbe9yDzKd65aW9hxnYN6uemLnNwGeMTUqDTzj+
         JrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561428; x=1739166228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ruy9T8+YCMNFZIu2fnBUkNd/IXv0Vs9qPj53hJ7nck=;
        b=l8alzuhWWXu7GAYyKFp7aUYWKR/KEUYT3HWQs8MKu81JKGlqYiezxJLGjV62oEL2Jl
         LVxwb8oYfF7QNeeJEBLRoPflweSqyr3zOrFVN9IG1AIslmH5K1dLPwUjSoPnNV01uXMC
         8WKyHdsr/vLcjSWkT5jRInqn19uLOLhluds5GnRpSMjqXvnj0X0pJTd1UkclEPtjIgK+
         0qo0H9Nsv0iVRbK2SjIQn2AwYYKudeFHMFeeo70imGB/DQD6Omq/eecHtq3TXVqnWsfc
         G70TPiAGLeUXEQlsUIrOgZdeMCAQj8QQf8HVQnRqn8eu+oXjYOReBXjInn5ZsKPBcU3d
         c+ag==
X-Forwarded-Encrypted: i=1; AJvYcCVfv/RTI1ySgZx8qx3RS2ODhm4xRJQlqlOqxDaRB27mbZgZBdD1IeTuxO/2KrkWShPFk77i6S4Qu0f3lbAZuXqD@lists.infradead.org
X-Gm-Message-State: AOJu0YzwZ+K4MnUih3Oelq7DRREMMDFpDDxYU1VcSuO0okrKwx7i929U
	Eio9hEOlLT+aV8H9qUIQmJsyMLzQikotUoAvdyLr3frDLjNujQm+
X-Gm-Gg: ASbGncsm4rWERVFVAjUGZ9Y8PTVEVNM4XpYCP4e6nkk/Z/gg+a+eHv9ru2L8qnVWh+a
	C4bk/iFhzLMAMfaWcXcfvfw5LgcnJZB4gd8STwLVHgKeDw1AAgUsqOxYN9RTBgb+Gew7UmzEB/u
	+kvSMfTlCnI4EZQ2xqM6+aOgwWi5wDaATYfWjhn30CwA9s7hiD5VU+r0df6gOVrK1QI0RenCXkz
	hwyb4cTrv3hjNTwxQyaMC0GR9a5LfghfPt8KoAlJLgF+UYbHlESASH2HP7A+uSEWcl04Mc3Albo
	R7q+coP5GlvR5nUCcyHbj3VKUWRuNz3JaOvJqjrhsukFq3zqKRuR8aWo
X-Google-Smtp-Source: AGHT+IFgxTohM+aTPsUswT4Bo8XmTsTW2WTDB9DTwTUXt0vxuR95dvrKJqCuVM8BYlZj72Q46ZHtyw==
X-Received: by 2002:a17:90a:c888:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-2f83abdf0f2mr32127614a91.11.1738561428296;
        Sun, 02 Feb 2025 21:43:48 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:48 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
Date: Mon,  3 Feb 2025 13:41:58 +0800
Message-Id: <20250203054200.21977-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214349_294485_6F939720 
X-CRM114-Status: GOOD (  15.10  )
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

Create initial schema for Nuvoton MA35 family Gigabit MAC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
new file mode 100644
index 000000000000..c3f2ad423cc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton DWMAC glue layer controller
+
+maintainers:
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
+  Synopsys DesignWare MAC (version 3.73a).
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,ma35d1-dwmac
+
+  reg:
+    maxItems: 1
+    description:
+      Register range should be one of the GMAC interface.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MAC clock
+      - description: PTP clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+
+  nuvoton,sys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to access syscon registers.
+          - description: GMAC interface ID.
+            enum:
+              - 0
+              - 1
+    description:
+      A phandle to the syscon with one argument that configures system registers
+      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: stmmaceth
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-txid
+      - rgmii-rxid
+
+  tx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII TX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+  rx-internal-delay-ps:
+    default: 0
+    minimum: 0
+    maximum: 2000
+    description:
+      RGMII RX path delay used only when PHY operates in RGMII mode with
+      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
+      Allowed values are from 0 to 2000.
+
+required:
+  - clocks
+  - clock-names
+  - nuvoton,sys
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+    ethernet@40120000 {
+        compatible = "nuvoton,ma35d1-dwmac";
+        reg = <0x40120000 0x10000>;
+        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+        clock-names = "stmmaceth", "ptp_ref";
+
+        nuvoton,sys = <&sys 0>;
+        resets = <&sys MA35D1_RESET_GMAC0>;
+        reset-names = "stmmaceth";
+
+        phy-mode = "rgmii-id";
+        phy-handle = <&eth_phy0>;
+        mdio {
+            compatible = "snps,dwmac-mdio";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 91e75eb3f329..c43dcae74495 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - ingenic,x2000-mac
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
+        - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
-- 
2.34.1


