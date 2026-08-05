Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD6DC55838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 02:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjVtijpmJ/oNZWvDUTBmnWApL7aWLNJ+r5jlKeKXMpI=; b=x2IQ/vxNaIbQZBsUJNiRLDMiMj
	Jy0DnUeZo3jVIrKHw1RBI3b8lkAs+r85gSq2poYgnfKdJqzecQGacsYuxwrSqwIpiK/ktwvwkAH37
	xT9eaqePTudzpo6X7I5jmG8EBQGjc63HXmeIyqS0HrcsHv0rAWQknMIk86OZK4VKHa9+NK/w6obmt
	w0D3KIdCh6N+QoNS5eTKeYR8RptbDcFVm86hGEpbrJuwH9KRd3QPH5k/WcTpZvV0J5pbNq7BNuUft
	kfWpFhDFJbvqXxN6fIGaRltG8VSaUGlzBxMyOpWl9+56ZqufUVCleRqzEZQGgYPlofQ8hBtn13uLs
	+G+uLNuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRN9-000000037eQ-1KOO;
	Wed, 05 Aug 2026 02:28:47 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrRMz-000000037QY-1pkJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 02:28:39 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso611740a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896915; x=1786501715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjVtijpmJ/oNZWvDUTBmnWApL7aWLNJ+r5jlKeKXMpI=;
        b=PWVNs4EZgH7exHOCR0dEj+2GXjW6mWcsuPGnPUEHaUxIEgJ9SdP6Tqbv4/Y0pBP8+y
         1Q4417BomauxhVWwHeVLnRC8shuhKHLEBxLamFs2USrlh56keGDiZ61cVGdDttkozyzq
         /apLW1qM0vyZr66zQT+Ga1ssxOCqzdIZ9KV4Cx5iFm9IzsIvrE/Solxe38x4UItFUFSj
         16G+5TmXiHFQE7tc4vewjSy9aMLZTdG5iQntp6EgWO7hM91cWSSgGaZrhWy6Kq/YJ+Xz
         7J8QfgKK/2QfaAW73bpJlgoxbzOgX+lQDacD1X7qUkUR44UY2k6MMFrq8uggd1dueRFJ
         OPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896915; x=1786501715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjVtijpmJ/oNZWvDUTBmnWApL7aWLNJ+r5jlKeKXMpI=;
        b=tUBS4Ni/+8YfnE5NS5ebQk80Hy1sRDZ93Tfst9dkFw4B3n+lzBv884T2TaqU+ixaar
         dmLTtLWAIQ6GKx0odPS9c7DppU6F4sp6/VuIHg3BOuZBWKWKmU0n25XevR+HIzPn2yMS
         JPyj2b/lkxRgeuvD4BmXftkCXv6P0j4aJuma0bQGr4x0KKhdL8QFH8+/qIfjVOi85nl/
         HmVNAtz1QzMdQAkSEpcaWdIh4lFzbF2/AdRNZ+rP0I4uKDAoricJKJRZJ/hxPRDdl3G7
         Gve5QSeLfRrbGs5xY/0qEvwKZhYNEgkfaYmydyWVzm2ggU/ccsqui3X/XWCxeiE3PwjD
         tstA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+2JQhaLNUKvfTT6szDJXzHdkNQ8ad6Th1ikl4ZAkz30Xa3WyJze/Tx349UqLWa7GvqxHrlBcep0ZcNrik3E85@lists.infradead.org
X-Gm-Message-State: AOJu0YydnoLwMhjvtYC9+EKPb93roBfzeBdip23PHzm3aJAi5g0JbEaZ
	guhLvOQFFPE0lbW0T39SXdr5mS5vl8DgKgpFlO8BaFfrYgbZlpPrMofu
X-Gm-Gg: AR+sD12ZmCgIv/y8xwzxYGpL/crUJAWRsCHmSU1qz71xBuhXCSj+qIEc6xQoa/DwL0H
	gKEQbTzagAguagVrZQ79k5xwjla0oDTMeeLhpLUk/TgyVOGOSJ3Wl1CQAidKtitkk0D7r7yoVdc
	dR2xfC9qFx/G/3yx+Q0L8J8uPVa9zXCbDCk4HB+VDHSZwgkljlm8SLY27aAAEY8Xpo9ZMu+1kKf
	Ot4y+mzvK7umkMFE5CrJhqSEnWzaTwq05RDiFGQ89oUcemZajvpQWHDi/k1F24SzNOEQhbhAjTQ
	Q6FMZ+BHPzmnu3TPm4GLXGo4oqwideBR2T58fhCOZ6+48Ly+ylIqlX33NYarEOi/AFyiZ8zz1Xf
	RQa0cVqS6RwpByL9JnmsTavgSmhxcO/IJbls95H+dH7yTXrBoS5AN1BT8MilRjkAAzypeqD5kmt
	wrUu8DeHY3OKYEd5dJZh8BVjsXkc0HGL5AuBbnr65VxiPvEJge28C75lyXQVsw7HmfxMGlBsm1G
	SgA22fTjv+gh9rPbfDg9N9xfbb+IgSsksv/hmLBtsybjCrCcUu3acJBJ4DGXxj+QQWbMYFsCuJP
	zBTjUU9RMG3uIulkm+CPvof72MbMqilASjhIviyAok9QPBaPi/uvHws2osdgfj7eK9DNUFQwu9L
	EIeZZiiU1p9JZUM8veIGGlJKA1E4=
X-Received: by 2002:a05:6830:3741:b0:7e9:ea28:4c1f with SMTP id 46e09a7af769-7f1e5d893e2mr2408593a34.8.1785896915399;
        Tue, 04 Aug 2026 19:28:35 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:05 -0600
Subject: [PATCH net-next v2 7/8] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-7-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_192837_732823_B9DA1193 
X-CRM114-Status: GOOD (  16.54  )
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

The AC200 and AC300 MDIO link interfaces report the same Clause 22
identifier and use a compatible link-side paged register layout, but need
different package control interfaces before that identifier can be read.

Describe the forced-ID PHY and require exactly one reference to an
enabled AC200 or AC300 control device. The PHY node's reg value is
programmed through the AC200 control interface. For AC300, it must match
the address selected by the package straps and is therefore limited to 0
through 7.

Allow a system to provide its optional two-bit SID configuration field.
Bit 0 identifies the AC200 or AC300 package and must agree with the
described control device. Bit 1 selects the AC300 low-calibration tuning
sequence. Omitting the field skips package validation and selects the
normal calibration sequence.

Also describe the optional xMII receive-clock inversion needed by some
integrations. Requiring an X-Powers control reference distinguishes these
integrations from the Rockchip RK630 PHY, which reports the same
identifier.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,acx00-ephy.yaml          | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
new file mode 100644
index 000000000000..c280bcf8aa25
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 expose Fast Ethernet MDIO link interfaces which report
+  the same PHY ID and use a compatible link-side paged register layout. Each
+  package uses a different control interface to make its MDIO endpoint
+  accessible. A fixed board references its enabled AC200 or AC300 control
+  device. The PHY node's reg value is programmed through the AC200 interface;
+  for AC300 it must match the address selected by the package straps.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-id0044.1400
+  required:
+    - compatible
+  anyOf:
+    - required:
+        - x-powers,ac200-control
+    - required:
+        - x-powers,ac300-control
+
+properties:
+  compatible:
+    const: ethernet-phy-id0044.1400
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional two-bit SoC SID configuration field. Bit 0 selects the package
+      variant, with zero for AC200 and one for AC300, and must agree with the
+      described control device. Bit 1 selects the AC300 vendor low-calibration
+      tuning sequence. Omitting the field selects the normal tuning sequence
+      without validating the package variant.
+
+  nvmem-cell-names:
+    const: configuration
+
+  x-powers,ac200-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC200 Ethernet PHY control function
+
+  x-powers,ac300-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC300 MDIO Ethernet PHY control device
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+required:
+  - compatible
+
+oneOf:
+  - properties:
+      x-powers,ac300-control: false
+    required:
+      - x-powers,ac200-control
+  - properties:
+      x-powers,ac200-control: false
+    required:
+      - x-powers,ac300-control
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+  - if:
+      required:
+        - x-powers,ac300-control
+    then:
+      properties:
+        reg:
+          maximum: 7
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac300-control = <&ac300_ephy_ctl>;
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <1>;
+            x-powers,ac200-control = <&ac200_ephy_ctl>;
+        };
+    };
+...

-- 
2.53.0


