Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD88C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbtPn6g2ba6LqMlbQ/ymd85CrpL3SBE6bf/tvrNqLXQ=; b=IWvrB4Eu6fWdNVmE7fgbn71My9
	vWQcmxDHYIKm6/Hiwy6CbVQEVN09Hp/XEwMz/pRGGHgfvf5xIAf7kMDIDbxMHFfTX2TOZxbC4d7pZ
	TtUZe6XIbriKpIDgt/xbhyFqurUMI3IFCoVZFXKH3kRPSwgKvo6W+S/5iyqrrSkwRSQJ5J45o6THg
	1R4SXeTbuBOA5vuPBs0zYPKjhNZ1AlzD0E48MUSFX1Y9Hfb6aoB95gwL3WjNtnygZTSbIM+TRipV1
	CfwVGPs1uV6Sy7HZfzt0MsqkgYvbq/Y6sasPUFxiqJxO9i6FkOCAKLq7vwbje1QyilHiqu2Q8k6Vj
	qA5k6tAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B9k-00000004gLj-1Aoh;
	Tue, 08 Apr 2025 15:46:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6E-00000004flv-2EAC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:42:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so27323545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126973; x=1744731773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbtPn6g2ba6LqMlbQ/ymd85CrpL3SBE6bf/tvrNqLXQ=;
        b=AhSkOh17cwHLvj3M2UpMq3r1XsJ8b3Ph6uOmnfNgJJp/pBaoM7CDJtwkMQWywIdkfE
         GyJ7tat7wPcI1NO8Q6G6MqE1Objj5Ir+DFHrf0y9+U5bMALxdLuvGsGmdc5Xasfj+1C3
         +7BcV9m485dLCx1Tcni3lsiL0xKfBiQnckB40EvNn5Iw7QY7eWWDVfPpgCvwlxPA1co1
         teq2M6Hz/10dG1UF3qPvOs3heS7c8EbIr0OVmOf7AOX2fb8X1eD/bN/Gpmw6B9XSDisY
         +4RlFIMK6TFmQCA3YwS+qlRBZ6lmZbvIBdrQv7OKK4e0WmrC/rh/4GmVuRACsEMKBW+Q
         L2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126973; x=1744731773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbtPn6g2ba6LqMlbQ/ymd85CrpL3SBE6bf/tvrNqLXQ=;
        b=YGkY2iLyDlwgpsE9Vyo9+VBPXYlEnKju2TALDog/dj9XwU1HAKRPtYRNskEol+n9qY
         3hQx8wYB/+nMOhWz2pLEKsqAR0H5MJFymzjHSrWccXmXc9m8Y5LVh0nKh6/qC8VzNGdT
         5VE1u3yxSsLpjWpiF19+WNpUz/mQbhC2Z5lZQgfxRyTUpyvkfmxBnWfs1bXeXBj14G96
         XvJOGPZBtlewyhq3RE45FIqwhg1YIRc8NLHakR+JEInkhVQYwSWrKS36kw5YzndRhZsi
         Q6AK9C0M/ASaVBDZxDBz1dtva6xO24wwtmRtr0J7rf8NS2Fm5U9q/ElixsqAlcXBcMda
         utGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUnmoca0cr9CtDUywiPwK0ErWZ+vq+ZDXyGj9hMa89Vxxj77Z27pYThqbsttWmw/e7jTLXg/nUKudmBZSG2lgE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4dnB1YsZ8+YXD9NZEeUvCkcIfQYN7P2e4fnytGRbbysus9Wo0
	R63BT0S9ctqJrAVDgoBIqQWBe9AE5fHqtF9D2W36TwL+8kzGSpJJ
X-Gm-Gg: ASbGncsOlk4ROPI752+tzJAvPwLUjDWRyz12WumzdKKtlqmjr6EI9C4g7zS/HDgkhKd
	2Jk8EWhH3EAWhyR59zSqqLPEpwlXvtxvjZTsxPckYaR2IkbeKZrQkuKgHka/hpIC8aWm2OlI2nL
	UIPIn9hjWPagpt+Rr2XZIMt9/tzAKY/tbhbtVutxz4vWTxtmB6yYJ/eDojp7f1wh1hcPCsxW2jo
	HDhaFOIOYmyEg5D6mppXFkQchBQlAjOh5s1wNAljiT8lrfZGfUl23D10k2wZ4rj2KuJSjLdQo17
	dYpcbXv+RbTxB5r9D7MF9qOMCIcjGFLMvAEKWNF1pR+FKFqO9T3jJQng8yiCfhthbtyQbVvhwuA
	bzRSvqSo=
X-Google-Smtp-Source: AGHT+IFk7cvDwgAw3nFZfm84dQ1FS2LuGuxYv+hFlv1TribSda71cj+K9r2JkQI9n5O3/VthOjyvmw==
X-Received: by 2002:a05:600c:6986:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43ecf822cf4mr136552845e9.6.1744126972777;
        Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:31 -0400
Message-Id: <20250408154236.49421-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084254_570178_CDC6E014 
X-CRM114-Status: GOOD (  14.16  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..3e2ada7fcdf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
+  transactions to IP Slave peripherals. Additionally, this module offers access
+  control configurations meant to restrict which peripherals a master can
+  access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 3
+    description:
+      First cell - consumer type (master or peripheral)
+      Second cell - consumer ID
+      Third cell - configuration value
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30df0000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30df0000 0x10000>;
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
-- 
2.34.1


