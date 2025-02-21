Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4A4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4b85i48aqXbvqxKxPLY68Yu1QiHGt3S7QqZhpoTlOs=; b=jXYxpUp0c8c/dq+yQ7wOwXTj8s
	PXiI20fZv4CMCwAF+qGYiWJd/eZHSNq1g6ulUQzzWgvw0fppFTMvZ8zTTtbfJsCIowXzYfPS71zAA
	jscKm/Ont6f5xclijQ1qMkEF15JG/UIDH9bygBu+Fj+4ier6HjzQItX7u7DF3xkzBbG5mir8qjG2B
	XGSb/TjhcJ41dH/IW/PXcMx2shwLruZ4U6YNU0NuFG1JwRzzlo5uwUq7kTzh5q95xCObBjfQySQbW
	8uHYP34GT07Pc4ikWuoq+jKtlKMU9rt9JV5k8uBMhsY3liNJFIymu7MVXYqqaBwyI2gXXjhyLwfuT
	tQ1yO2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYbq-00000006dhL-3XN8;
	Fri, 21 Feb 2025 19:22:50 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYYx-00000006d8J-1bNm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:19:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abb79af88afso459814366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165590; x=1740770390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4b85i48aqXbvqxKxPLY68Yu1QiHGt3S7QqZhpoTlOs=;
        b=jLEuoXsILow4oReXx4l9rqeJizvhArKGLZGEuSR/JRoFbUnVevQnLr2h1k6TqZ0bBt
         H5XweQ1Snan8WT0Pj2vrHmDx5t2I1Cz6n0Hhv+Zb1Ux6yQuDx8+unkhgAw7IDhipaWKS
         vAchFQjj9l8nQNMgLHi4TpCtWjBuy/yw/uw6SNbaUGMSP0hy+0w5SAKJ7ohKDv6TqitX
         rBDyMnUYJOhGeDro2Vk2PZtpqo5Xn9Rq1bR/SDOkDhIUcucHudaY4GCsGbfklymFSxj4
         Njdt12E/H4ULLOk1KG3y0EUvJAQKMyO5bXtCF5hJPB4zIqHjdCIewdi6ucCUn/UEhSho
         tArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165590; x=1740770390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4b85i48aqXbvqxKxPLY68Yu1QiHGt3S7QqZhpoTlOs=;
        b=F0uy7lZjAoAybV6HNvo7mYZ9SVXKz/UYCxqRb1QWmx/XXa+QDTHYCIETzDfSMQkop8
         WKrkaZtMzQxfVDkSdv9OoEix7mRj/A/0yM9jxcvuCb/YgUFS3L1t6fleELLV4swCKC2D
         4ayJc/AO6toNhHapzRfwXpVVIc6LRXMrim3HU6ZDyJskRz0AGpI7q4Q8CHwz7ImN487Z
         Rhlutf9hkxklMHd09PxiiAImjaMO72K7JfTfn2kGV2R55C1rdOH/vHO5s9w5jDII7B2H
         BcLemfC8QJHsiJNm68pESP+iAXbAotkeeLzZ35u8a/p+enlqIDciBvw4ANzd8RQnfa+q
         eBVg==
X-Forwarded-Encrypted: i=1; AJvYcCWzj7BNsriNBTrNAXQZz0t7HSi6UhTdwf0n/mLJ8pkeX95JK3FuIRHihS4PmfyomruEw62BuQezuJKWPbGC6jzb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtr/L018dLvotV3+nC8Oshnm76nnWtb8lvScnIDCCIfcJTChZQ
	4tV/kX/vsSX/jxRDx+TGKUvNeiW60NR7Z0M63EyPMoKd0hF7WfSO
X-Gm-Gg: ASbGncv9opBHxfp65TIe2t4A+29ddnadZEYWwfCu56indMrxDE5ozOhAhGvwLxyhbP3
	MUzF9teh1aWbHC2koDFQM6f20k9CzvPXd46M0gJvlpKpliyTJn3ndCb30LZQua5MoGg6/HG5aAR
	XuIojdGIFc4Ri+FMyrYvxfM6Ru7UumO+6yDLhSEprrwuO7ixGGzKPMOzf8tvVvSWL4PYxxa/ENi
	HCXcNQeYUGfTrr4Fh0/Y5zM141Nxo20VnVPYEn7XDyY/HYim8Uejf+dOmnNNFbleh1zQF3LQ8NC
	YQL2Rv2vXR14wB15CSxarb9ebPzrc2U1B/sdG64Yn+ZGKMsuzWWV1nExndA=
X-Google-Smtp-Source: AGHT+IG6R3La5hbh10fjcxDEk/iLRZQGIPtHw2SJ1aLWwKOtPA+wUEWP+H+spREkJWuxHbG0Va+SVQ==
X-Received: by 2002:a17:907:96a0:b0:ab7:f0fb:3110 with SMTP id a640c23a62f3a-abc099b380emr486410266b.5.1740165589933;
        Fri, 21 Feb 2025 11:19:49 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:49 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
Date: Fri, 21 Feb 2025 14:19:05 -0500
Message-Id: <20250221191909.31874-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111951_422430_5C3A4238 
X-CRM114-Status: GOOD (  14.80  )
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
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..b0d6eaf70a84
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,62 @@
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
+select:
+  properties:
+    compatible:
+      contains:
+        const: fsl,imx8mp-aipstz
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: fsl,imx8mp-aipstz
+      - const: simple-bus
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#access-controller-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#access-controller-cells"
+
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus@30df0000 {
+      compatible = "fsl,imx8mp-aipstz", "simple-bus";
+      reg = <0x30df0000 0x10000>;
+      power-domains = <&pgc_audio>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <0>;
+      ranges;
+    };
-- 
2.34.1


