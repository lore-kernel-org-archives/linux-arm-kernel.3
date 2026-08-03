Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6AEC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 05:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=; b=FzZ6ZcYdB7BPz6wF+fmbbEcK2H
	vu/n2S0F4coX8nx871w9eY2EPNYFkjmNapALKEvOPNDUQIjcAXamF8VaAUriJAUqVwqNe1PnNDRg1
	9Emn0LnCEwAsDv6xRfMkDSNNqcB5gHuI6HFMaYrL89zG4cfZQT4HRReSDkpkIdrQD/x32ltethd2X
	VoE2aqpogOYpAnY9TP1BN79xXM/7lQPPa2VmjJB7kAcdZqvSnjrcFh2bA1rros4HZP1abLTEDCKmw
	OOCQBnyfzDXBPiroZ5eJI2MxNsbW2QsgJnTe0RcZu0SOMCvLKwdRo/X5ZJ5UjrdWuXx6f4s8Yv2kw
	W72wnTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1a-0000000GKul-01W6;
	Mon, 03 Aug 2026 05:15:42 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wql1W-0000000GKnC-2psC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 05:15:40 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7ee37dc91f5so1801395a34.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 22:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734138; x=1786338938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=;
        b=D3FDM/oQoBL1Ym0rnOG+JNPO5KJdT2B3zb2dyC6ifPLcDFysd/qjlB5Q/Rx+Zzs1II
         nsinKM9gSRKWp1zKfiTvdVDgoPZc4/iPjlc3Z8pSjr+QQo/rRZJMTA55uy83AMlmycQt
         18fqre5PivKJNC72pGz5aI5XPn45beakYNqOycWpzLCnxo28Utrjtb+lodC2kxci19wK
         3KOTGSRL60MJ0Eh9N69wnPG9rWLmyny0mgSnLuy3QPDLUt/ibeL+ou6NOya4xeBowNG4
         f4UtUjUvlpRdC/CVkEGxt5EERx9VCK8ycMAe93roxRKqNdE24f+a2gaiQTUUr6umJI/b
         T3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734138; x=1786338938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTwjTV5MzEj5mt/lgWMCGvinpE29xZysk84NZ5krcS8=;
        b=aDvqTDbuAfhn8tJ+eMylxOYRhRPXy89VrSpyNc74Uke06PSUBVc8iIvhi0o3d0Q3Ml
         btztHMVk6aoglX9D1PPkYBYBBs2oC6yoOKmWJoFIONk5laH0urT9R4s8FD/V8knxkwvl
         Q19dt+ziYMoKLeqTm91KGIA+Y250cu+oOQbEUNMldDXW+gnjjy3oVCX6FShB3jt0rG5H
         oc6Pf1OjCsyY7to/XvKi0XO++vXzOf857SlEbaEUTPVMB2npoLaHpz7zEtFOy33dfEWG
         0W5k+IwpdF4sr89Q2J9B60HROvuFrHK98GSMuerNiomEbSPhY/x2DPdffaUgcLcphitX
         FzDA==
X-Forwarded-Encrypted: i=1; AHgh+RoJJn+zU3Gf4ouv/qch20zKdP7XKdk1VnxFlQsY88Gye+CSYCAoM3lyNAsI9u7Zw3btBnNxGKIG0fJYI5V/gRMk@lists.infradead.org
X-Gm-Message-State: AOJu0YwsySSTE9TygxF4JFqzAQlZFtg+qSMnQrTk+O2jDj756Fiv7YWZ
	eoF+RMjMGEJC3W1vSa22iHhL+SxWmZjkw4iqQ8b3p7CPsMs5dWdzqkyRFgPPfDp4
X-Gm-Gg: AR+sD11HLIsqM92iXXZci7MgOOCCWRXsiXo9WXIfbqHgeB3+j4oK7/LyHernciz4tjb
	Ux19/mY6yHyx4/BWAqw2AwaldcWcSqAE4jhHWumx5znAkoZG/XsystQTjfj/+m6vP7rl+XFUFkq
	NURP7qC56jDS0mxSEZKmQZqhSwAw+WP0wzeOAF5WogcrDLHevdtg1OdFEyqPdqVi8umHS1C3aUv
	HUb33H7KzsPgx84DrEI1yOiMHu82rcGqMTfgsXcnitQ+A79N2U9hJTxcaK//Z5BYcXo06RRfZAz
	MjNv5fZD+clT/DALhyyFsmMyE5xoaka0EZAuyhQlrKe0FNpH7T24LCh5Rkc66pLRM1z1wQ7t23U
	gAdUSGpHFrYDCjTJM38uNYSZUtC22kAaYLncLJ0NQMt1YnZvSIEpFKcwOLKh7KWeORLUT7m8Zx1
	7egcfAfljtjcq79/9wY8qXXHFu7a7iwlzEE9bd/OZ2caSo7jFqU8R8d2XC3jA1PoR9CecqrJIEc
	a43lJo1C2G5QN7/CdY5aV5SgYKGWvA3DQ1Zt9AJ/hQ/1esn19KOYfxZjaYw7WfNfCwNOA7FAhtA
	RHx3sTIieYXtSPhvN0X7TGop0QHd54DLt7pAEazxt5pkEjjAElYJi+GOh4hFUyG2NTcwY9fVrW3
	UbH277g9hmiMZ+Wb0
X-Received: by 2002:a05:6830:4489:b0:7e9:cddb:142a with SMTP id 46e09a7af769-7f196bd63a9mr15354948a34.7.1785734137863;
        Sun, 02 Aug 2026 22:15:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:21 -0600
Subject: [PATCH 11/21] dt-bindings: net: x-powers: add AC300 EPHY control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-11-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_221538_775184_B96EF0F6 
X-CRM114-Status: GOOD (  14.33  )
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

The AC300 companion IC exposes the Fast Ethernet PHY control registers
through a separate non-PHY Clause 22 address. The manual defines the
control address as the link-PHY address plus 16, giving address ranges
of 16-23 and 0-7 respectively.

Describe the control endpoint, its required VCC1 supply, its 24, 25 or
27 MHz input clock, interface mode and calibration cell.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
new file mode 100644
index 000000000000..a6634fcfafd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac300-ephy-ctl.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac300-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC300 Ethernet PHY control interface
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC300 Fast Ethernet PHY has a separate control interface accessed as a
+  non-PHY Clause 22 device. Its address is 16 plus the address of the link PHY.
+
+properties:
+  compatible:
+    const: x-powers,ac300-ephy-ctl
+
+  reg:
+    minimum: 16
+    maximum: 23
+
+  clocks:
+    maxItems: 1
+    description:
+      AC300 input clock. Its configured rate must be 24, 25, or 27 MHz and
+      determines the corresponding EPHY_CLK_SEL value.
+
+  vcc1-supply:
+    description:
+      3.3 V supply for the AC300 I/O, bandgap, Ethernet PHY analog front end,
+      and internal digital LDO
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      SoC SID cell containing the Ethernet PHY calibration value written to
+      the AC300 BGS_EFFUSE field after adding 3 modulo 16, as prescribed by
+      the vendor initialization sequence.
+
+  nvmem-cell-names:
+    const: calibration
+
+  phy-mode:
+    enum:
+      - mii
+      - rmii
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vcc1-supply
+  - nvmem-cells
+  - nvmem-cell-names
+  - phy-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-control@10 {
+            compatible = "x-powers,ac300-ephy-ctl";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            vcc1-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_calibration>;
+            nvmem-cell-names = "calibration";
+            phy-mode = "rmii";
+        };
+    };
+...

-- 
2.53.0


