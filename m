Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D417DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=; b=aIY8SdssO0Mj0FK7LW9WC7GMIE
	2WqqhzBhb3+eUaJiazwEBIVV77BcFysZ/KWWRY/qb2NtGkA7fKMqUBOMW1OGBGvhGSYAzfu7sYOen
	pVQC/1GAhQxPdK+YzqeocKGKWCCoH4etfDYfPSUQKpysGIBcSMhGF/v3YxrYDql5K8IW/iYH+7UHt
	UzOnKST5pFoamHxDXXVCsVd/jFoWRAptjfO86X7HmxbMO/8yklM71V9cyN7YEWwuhDHmUMKzS7sRs
	5FOLcpq0LRTdL7ykkPjfr56P1S+hk6oka9nfM3IxW3rqqDFqOcVKfGXuf0ilP5a2TjpU9+boF0xqh
	0Pu/7Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKz-00000001udM-358B;
	Sun, 14 Sep 2025 17:16:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKt-00000001uZ5-0ABL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 17:16:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b0e7bc49263so59074066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870181; x=1758474981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=;
        b=mGe7bBBKrsCQ1QIX79hqtejaT1T5JsnjwLlHWrF54ymCevmwJetQJDoQA1gt6lA8I0
         aB9vNM0h+9U9hzazHCbokaSRE67S51CtTS9uHqsvc0kBP9P9kL3F4veNq4cxXWwNCIhH
         4M60yq2prvm6IXy+sdv67OuKJ5Zhvobw9r23Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870181; x=1758474981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMdgI0iZ2TvocV4JZ7DyZgorR1pQL3heQi0CeqfMARw=;
        b=kNcWg9QNV7jTUZ2Omnm8fOykC4c5RIgWS1E7tdJpjWYzr8RiViJpPmVTNKRr80z1jS
         brRVOLLWf/tHIuQY7uI4khK0SCZAqSF+5+j6UxBuAoIBBP7DiyVo+liLC6VeFLL4aJVI
         ZyIz3X4nblzZaPIYa7Aa+nxubX4GqpK/3kw+M60hOoKey9p3O0fhLX+vQIM3nkI8OI8C
         lot5pZc73w02K+vMvat6hefyFdDSRPaG9vt8XTyXexeU3D327Zhto4Bm0P5vnAndip7m
         /indAQhPzGltw7QBxocQF50qWH1LsRvYbv3PhS0Ghgnj2JZAYNd8kQDO64iIn0kLvvTl
         qLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRqdZPA2Qz4dz2VLpwHWCixytyYMK1ZA+KbdQ/UC2qhUR0F66n4gzm//pM2kwHePlcpT1azjukf4T+iMsr8hSY@lists.infradead.org
X-Gm-Message-State: AOJu0YyLGz+fufN+XnOlAOkybXIbBF4nUs4bZjYlaUz2oCAZMfR8krGv
	f+ww1oV+8g7JZnhaoT6MdxT3G/8kVZVpJANhV4DyXWFYh5aWqrzxi9T3XD+mfjmHkJg=
X-Gm-Gg: ASbGncvazi9Cm/NLz1lsVOicadIsoYceG3YP4x/cgwiuOatLicCOm6QjdtYlgLChYq8
	67MhlBCXtEOFCDRitx2HZ6nVqEry6W9huSSoUBoHh/TXDLz8T58ZvSREU6OsW6YC6o0jI5qusR9
	rAjyj+iwzOGEviFeJRQdnKrfSwQm24AAPC+b6Dz9IFO7VY5R1y8VAIReCYT/jAIWI/j4Jb9WxjE
	WpSY7ndsy55Hpyh7D6ce90yXHI8SLPGwFjco7dW1a0dppqOA0m6gVmAvGYyCObXaq7hV7KZN3xo
	v6pbRUsPWukoWdjccuDMnOKJFzfzcWAOGPicNaH4y34adWtKsYG/3HtzpenFdjs3IxO7FtV0AGA
	IKBIesOJv9vCazbiqVY3ufYJSKDJiRuUSHmV1ld6PRd6I8h+/X2teXn/DgG+rTkGglWNQtWU0Nw
	TTVx8yXwLmSw4Fq8JQgQ8d19gyYS3e3nhYq5tMktV47eDDkz/QJ3jqxJ9lkuru2pXE
X-Google-Smtp-Source: AGHT+IHfjFWKG/mF8+Rc9t6eyI85z35rKOGB32yV2tBXoq5uOjqdENe0BpELyw7Da4eiS0RVUPNPpw==
X-Received: by 2002:a17:907:c08:b0:b04:3a46:c4f2 with SMTP id a640c23a62f3a-b07c383f1bemr990265066b.48.1757870181371;
        Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
Date: Sun, 14 Sep 2025 19:16:01 +0200
Message-ID: <20250914171608.1050401-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_101623_107326_0CBA30FC 
X-CRM114-Status: GOOD (  12.71  )
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

Support the touchscreen-glitch-threshold-ns property. Unlike the
generic description in touchscreen.yaml, this controller maps the
provided value to one of four discrete thresholds internally.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../input/touchscreen/fsl,imx6ul-tsc.yaml         | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..310af56a0be6 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,21 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  touchscreen-glitch-threshold-ns:
+    description: |
+      Unlike the generic property defined in touchscreen.yaml, this
+      controller does not allow arbitrary values. Internally the value is
+      converted to IPG clock cycles and mapped to one of four discrete
+      thresholds exposed by the TSC_DEBUG_MODE2 register:
+
+        0: 8191 IPG cycles
+        1: 4095 IPG cycles
+        2: 2047 IPG cycles
+        3: 1023 IPG cycles
+
+      Any value provided in device tree is converted to cycles and rounded
+      up to the next supported threshold, or to 8191 if above 4095.
+
 required:
   - compatible
   - reg
-- 
2.43.0


