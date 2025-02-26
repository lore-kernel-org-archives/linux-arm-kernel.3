Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF77BC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuMNXFiz3GQQsxpeqmzCHgRVoLvWr6tPdor7ZIiVrdE=; b=CwlaxcBtWv5AgAgpoh6up7o2MD
	6K69xMfd6MNveoe5ssaqhXs/b8Jn5UyvtebN8Fb2OF9EQXm479jhqDC6sm6dus9qq41hv2I9AHpy3
	p3LEsj5FKPSxx4+SCNpMG7vVoU53Gw+czYbqBcerGfMwKByp1vfV0pIal9KzFmmqSL/mCwNX+3o92
	yI2CEBvC9kA/FsKcC7l21bXPBknqdRgna/jINPC43dZaR0DWQYf2jNzr3c45fXaCtqFOtGHd2Op1Z
	Yxny2cckvy6gtXGt5sEbu97Tk5LMXQJ0d0bi6KOuEhTvVS59UFKs/MLSDsA8ONDI3gUpMI/59Occ6
	J+elm+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKp4-00000004d9Q-36N4;
	Wed, 26 Feb 2025 17:03:50 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKfw-00000004bHn-3sj3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:54:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43690d4605dso372795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588863; x=1741193663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuMNXFiz3GQQsxpeqmzCHgRVoLvWr6tPdor7ZIiVrdE=;
        b=F+jthk/fFtCzPRktnQziBmWJ2p8vY7asriw+9YO5IlCQa/1EI6955GIyPcqPh75bX5
         W7cnGoHurcsW5+/Enu9p0gm+zn9+SG+H4puA7caI9VMIzyNK4I3gEvIpTXVR9UhHVtYn
         NKrNPU+HkJAPIA8T+ug2QbvdTF/1YCFdobIneq6A02UDFXoF6wsALds/8I741RulUv8W
         ncp2qjjjCWD0AXI6VtdpUDEDF+EdkIvPI56dkA0sB0gTRniwNRIi5qFsm/U7PbJXwc5u
         Nxs4eXOVJ8Zh6X40Ra9hPAxvC2/b0uC85DTqdXaRqdOfnX1WpA9wZHDBzJMpoQFzCIyv
         N7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588863; x=1741193663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuMNXFiz3GQQsxpeqmzCHgRVoLvWr6tPdor7ZIiVrdE=;
        b=WzcvaJW7MFfTon+jqWzgqWRX5f426JaXmuDmPBzzqEeXe2oI28t+j4COf4iugcpuzx
         JphrtsQQ8EftcUI5Zpf2/381u164Ez1AfeWAFedvc3EpSPQbPMhhYVd+TPw9+APzp+cB
         xjQfvSvGAZSiTp6ikKLiDHOQIIYwDkfsJTvy3vs727fcOzZ9R+bFKfQ63uLYUv+H5otU
         hNbtzT1N2/lDIt2AezEPSi8fC78XRpZ2/FjkUad6CXUkW4k7gTfuCVfiKu4ZdyRIKzfZ
         FWrFdg8vTszTCeqMQccSMOmJk98lEGqBnbk3Asv28zesGenXEohc3aqqiBH54qcsi2uK
         WTkg==
X-Forwarded-Encrypted: i=1; AJvYcCV2KmMrJSwRZGaqLJyqyosIVUVt37NyrYHsq2aIAaFHhKn5hnS13jtJtSb0SfttPTl/iZeRSOCSBO44/2l+res9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywit6h3/P1dadAZh+K5OLBE6U7/tS8Uoo56hTdlwwI2fqyY55xk
	/546Lz9DqNti0BTeNwxnRigoyQ7yUtijvaudTrcrVQr3fngY8rLH
X-Gm-Gg: ASbGncuqeS0JUREHoSg09b9p7VlIKj9pewfG3nroD4DRgdgoqJcMFeaZv6MH/SD+vvU
	1byir3hNrlc3UMJLbRhmr5L3hYuuL/8plcfD1IyWfreUxJ+PjGdzsN/6gOpJJRPTYQsQLvLg+wq
	1DhHFtNvu4Rlf1zeHTvAshVsSQNTMEyc8IA2HIHWeFZWy4qlUSD11FMWQwW0SuSx9PYSe9EvbsT
	Ya9Q2xHV3+oD1GDetzYvLcPkEh27QFUNG4U3h1fROAr0CCdnmxkeoUqu0p4uJdt4ZVz3OYJHr0U
	ODAy21RypuUhFLIQk13gr5zDFR4AiH17N3EPTG0xKKpmxpMEBSuRMBEPazxyvXoi
X-Google-Smtp-Source: AGHT+IGzw1JxAgCRr2hkHehSx21ZaK94xm+T4qbqC1Q9fKPlmg9xMtjNJBFuBwKL4xp8lj7A86l4rQ==
X-Received: by 2002:a05:600c:1ca7:b0:439:9898:f18c with SMTP id 5b1f17b1804b1-43ab0f72a40mr64043405e9.26.1740588862923;
        Wed, 26 Feb 2025 08:54:22 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:22 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Wed, 26 Feb 2025 11:53:10 -0500
Message-Id: <20250226165314.34205-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085424_964273_EFE01E43 
X-CRM114-Status: GOOD (  14.87  )
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
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..dfcfe4a8ae74
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
+  issuing transactions to IP Slave peripherals. Additionally, this module
+  offers access control configurations meant to restrict which peripherals
+  a master can access.
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
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  "#access-controller-cells":
+    const: 0
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
+    bus@30df0000 {
+      compatible = "fsl,imx8mp-aipstz";
+      reg = <0x30df0000 0x10000>;
+      power-domains = <&pgc_audio>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <0>;
+      ranges;
+    };
-- 
2.34.1


