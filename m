Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDE3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nN9qy6kzaYRcTvspSPXcPestPQ9vGh5brGqrf6epwWw=; b=WOjj9WtjvcDMUXF1iEz+Qqznw8
	u7DzAsMKwIX5Ld3pe1IQPb8ieLdqfNcI2/msHVBW6LlmIFqvBPHmDgxEV9FxxhRtNkBWWikVVIbSY
	FId+hE6tp6YnMyjipVJsU246FXZ5dbfdCmGUy4E+c05R2Zz1P079xQeD94sObxepI08fIBtI/zkF7
	lOMvUDUhjQ7Bt5IiLKxbfYMGHo9p5T9jw8GcjQUNcKRYO30rpMp6GHZRWDaBDAM5AjSW+jB+Cip/c
	/cqGMJDGM76BJczgtiXC/zodwX3DQyFGL6o1VEBX1OTsB9bm8TSmZdkJXM56rWs8eKXOJoDkzGviC
	2W/4n8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqT4-00000001ust-0y6D;
	Thu, 12 Dec 2024 21:11:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqQx-00000001uNR-0gPd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 21:09:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so1855991a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 13:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734037757; x=1734642557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nN9qy6kzaYRcTvspSPXcPestPQ9vGh5brGqrf6epwWw=;
        b=lsxmfHIiZNXz4v12sBbH7MLASZVC0YZ6cmRFLhdeR7d1i85Utj/28r/Mc718yNIZRK
         NKpfSTI6gF1gDncuhvBMUCotkb1/Ob3Ty7kSY2ol0X7YRxbl+ZKTik9D3T/s3Un6Q2sT
         li9JRfdhcZmG68Wl5900fvMz82KkZ9Q5hMYGHHB0rJiUaVStPeweVu//DNzdBfR9VaLh
         2mpdFPSO/QGrbKwJha8qAHMibgdRuL1rWXoqRdOQCOrDH2prMV87XJAJwgEF5RGrbSnz
         rlwkzA73KCaDXdTmP+X6WCN5EVEX7IRmIpjmaqgKppuiiGGQRbbdYU+EPUo5u+wSW/rY
         4M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037757; x=1734642557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nN9qy6kzaYRcTvspSPXcPestPQ9vGh5brGqrf6epwWw=;
        b=NamJGnDyvNWNjka3hDgIbnhMCPTBabwQ9MAag+6h2h5I78s8VF1lZLK9mqQRKT9ZTe
         wFW2fPGY68HRuy+5IIsT4Cu7VVWiNTgvxHfU3sIBXfSBCmJ/OfuPkiCyjqC8J4Ndu8Nr
         8P2TJZ3arqgGW7toT7/AO7jxiFd5rJObwphLfAbonJurcf2RNuZfLqXbsMstDAJAg23T
         9TvP3DGhAUCCpASlFQ0UU+yEN60DeSUkqPOFGBEMzK5D9MSTmFZq9sElcHHd2qX9+oQ2
         lbObaIsZpkdEHPXtU/sYn+SfJx0mNSAG2y09Uyanq3c6fLtjNzheCQq2BsGbFjAX0PTf
         wGSg==
X-Forwarded-Encrypted: i=1; AJvYcCU/stNPJhXl4Xpch24nTK9HlKlVwp7HhUzKn1A4P7pEWB8q0wGZBraHovYLr3fbOONKe8rfMjsyyxQzigw++2Wf@lists.infradead.org
X-Gm-Message-State: AOJu0YxH4fdmeRTAz1Vklc+MOZGge5LfIovQDFi1IHjPCm9uWxaI9fMm
	hjSbygaavc/9gql7H8HPky/4oCq6DWc3/tr42AKFx7edLmSovZLo
X-Gm-Gg: ASbGnculKVsBT7gWV/T7flncweaSnAHDr0wQPWeFpRMYCew66ad73viAaarRI9ctA0E
	Ka9SxMxJmpGCnX4T0KiQDsozmlrJCizTzHS9e/XaoMTVIfm0ImBqhAqzl0oSxlrVBCXnK7yOGPQ
	Nv8QYTakdqzB07KjOTasJ92p8S68cg+XuyXQQQseDYkMSPJh3MA9Vovz6teDT0/3P7luh/gvOrR
	ze8rV9ygz8OECh3WzpKp741NWqz/fQ+N9q1kbTQWmBQarg/1JdB7JEcSGZFFOh2Ex9Y
X-Google-Smtp-Source: AGHT+IERTCYWfJYYkVszTsbpSkVPOiDO17vUGSDsrzxOO1nszolFyLdHEMLSrp83Tj/zAKFwqxyp+A==
X-Received: by 2002:a05:6402:35d2:b0:5d0:cfb9:4132 with SMTP id 4fb4d7f45d1cf-5d63239e3f0mr1935496a12.18.1734037757096;
        Thu, 12 Dec 2024 13:09:17 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d0f93d54sm9232348a12.68.2024.12.12.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:09:16 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 12 Dec 2024 23:09:01 +0200
Subject: [PATCH 1/3] dt-bindings: soc: samsung: exynos-speedy: Document
 SPEEDY host controller bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-speedy-v1-1-544ad7bcfb6a@gmail.com>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
In-Reply-To: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734037753; l=2792;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=gUnnizAdulAwxg+3Tnxh6d0BvTK9I11iWmyGXZBMs44=;
 b=ndri8pJVWgLELporVKp1ht8IO8Ncb/897FweJq2tFszKSNCils5GX+Sa2P2ZAR7l8TNZWBDXC
 MdNOBLDJYT1Bjmd0ooTpO1UucpedTECQS4GsRAMFY4QCeCpmxY94DLm
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_130919_243077_691A3B2A 
X-CRM114-Status: GOOD (  13.98  )
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

Add the schema for the Samsung SPEEDY serial bus host controller.
The bus has 4 bit wide addresses for addressing devices
and 8 bit wide register addressing. Each register is also 8
bit long, so the address can be 0-f (hexadecimal), node name
for child device follows the format: node_name@[0-f].

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../bindings/soc/samsung/exynos-speedy.yaml        | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..304b322a74ea70f23d8c072b44b6ca86b7cc807f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-speedy.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/samsung/exynos-speedy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SPEEDY serial bus host controller
+
+maintainers:
+  - Markuss Broks <markuss.broks@gmail.com>
+
+description:
+  Samsung SPEEDY is a proprietary Samsung serial 1-wire bus.
+  It is used on various Samsung Exynos chips. The bus can
+  address at most 4 bit (16) devices. The devices on the bus
+  have 8 bit long register line, and the registers are also
+  8 bit long each. It is typically used for communicating with
+  Samsung PMICs (s2mps17, s2mps18, ...) and other Samsung chips,
+  such as RF parts.
+
+properties:
+  compatible:
+    - items:
+        - enum:
+            - samsung,exynos9810-speedy
+        - const: samsung,exynos-speedy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    - const: pclk
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^[a-z][a-z0-9]*@[0-9a-f]$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    speedy0: speedy@141c0000 {
+      compatible = "samsung,exynos9810-speedy",
+                   "samsung-exynos-speedy";
+      reg = <0x141c0000 0x2000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@0 {
+        compatible = "samsung,s2mps18-pmic";
+        reg = <0x0>;
+      };
+
+      regulator@1 {
+        compatible = "samsung,s2mps18-regulator";
+        reg = <0x1>;
+      };
+    };

-- 
2.47.0


