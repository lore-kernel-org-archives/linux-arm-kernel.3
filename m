Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7A7C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fk8IPoQziwfYwbuUI7UFNnBkSt01Uwd7OzuOBIvOZw=; b=h7ivy2g8JsK1wpeD5z8TxEyZfe
	GrQK07Grk4kzQ3tAtAj/eza+C+aoMw0X0Jv48hlgwTUcXP9IFWa9cLKDWZ28ePrenhHEKmK0upOAo
	UpbzlrYkS9+U6AHwRaHeaJlxvBqkMUy83VXfk9gNwXioGBLU+9UO5nUpDif1mNBok2veX9goiA2WH
	Z5QojO6ONBU50BN+rlvpAd8bWJhNwZNGF2cmkWRKKrQG4GujkuIbH/iTbKcp14NKeDJ9+IDvKq0AH
	fcd8rHhk22EUIx9U2vLr6mNalAqRtr4b21aUF813r/nvxvfh5sN8rLcDMeyPd04lCP+oMSpniDzMe
	OLTYd2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7vs-00000001S38-1gId;
	Thu, 22 May 2025 15:34:08 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7I4-00000001Kbz-2UeR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:53:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-442f9043f56so47679425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925579; x=1748530379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fk8IPoQziwfYwbuUI7UFNnBkSt01Uwd7OzuOBIvOZw=;
        b=Ew0yS/jIc716b4eO3vuijsuBt6eD2yz8PO5TS1rjLgg0N1z483/t2MYl86bV5TgNMf
         fD+7q3h9HM3lLL5ncqz+TUyYI8WzXz0ZjO+AgaKIRd7/nsNovaZxZ11UeWPWFq9nN5Gp
         YeSxxlw4NGE8SyNqMUcWFzxjX2IZ3EatZq9JzH0SOYgv28JpVTgyEzLWzafpl8saehgu
         D3VH9zd2DGEoLU10z6uiTCk4Jqelvzbyot6aPBq6tVi1g669SH3bo97teFdiBthcMELS
         OeDRalxMwQDCcWroC7Xdo7L/mWeBSWuiyzO2AtCDRLUMCtesCU7T2RJ6THYjliCFDMdC
         Bj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925579; x=1748530379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fk8IPoQziwfYwbuUI7UFNnBkSt01Uwd7OzuOBIvOZw=;
        b=k40FyUr4fvmZGi+TgfbVkv4vFf65ybZS1S//TZ5Zp5mSFKme+42WCFZAe1Oyh/hsQ7
         MN+7Kf7m2uQC+W9v9vRwCRP+0q5/JyIfKpHbLkKRbIUO94WhdoiajlrmMAWRj/tCcPCe
         WwqqtueUacpDW2DGCCeBDkt2+jiXB1t6C7/ggiaZCkxhhXuaysVMUkaicWSYz0Xpksua
         dhE+1Rv0npDRAOXOAhDdVjfgrodMlN2A2pIewVWY9rs37fpPJH7jt8I4WuAt0Ahg3mPF
         PdI6KHbpyORUU7fhXcE9TqfshNzqh1D5nzf5HA34Gpz51UFIlMwSPcL64ooISe7oY/Ef
         C//g==
X-Forwarded-Encrypted: i=1; AJvYcCW5imxRP9Ty/FnAZoCjKeoSFA1ZarSOzs9RD12fTo87r8ITCJlWCoxOP6KeFSkwLHAz0/fUg9bg95AfqwnfcSuM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+3oWVqnfxJ52us10toIXj5Iq0dUVRx0uGXYjV0WxxuqOQJ0Ev
	W1sZOz85o6yq40+G4NOPW1OPVJftGFCLvLzAm/e2TSRsCREekn560oXJhY4z6j8e3yk=
X-Gm-Gg: ASbGncuboapYgH+wM08hwDPGCKa5Yt/wVrdDXdYAK5HHtd6/fl2YlN1O669tuS6BhWP
	UXZVr7Hsfx/bHcJxOrvGYxzgf/2/dns1wNXuR5trgazwMrLkiLNVMmzbgeNnkdTMv5Gt9Bk0gUb
	VOdkysPbmEOgqI/rpLgCUJeuGBcmKQG8pXxO99xxbe28k/3IXgALaLMszCDJG3n5XNTxoR7WDk8
	xMYrNgigwymZBYcqBTDdg3ZWAs5mVzIypydCy+ptaemfAhJvcNqhITU4UVO21HyDBHHglQfz6I+
	CvLWQbzWgvRbyQLbXVwDG3SL+Gv46FVDDz7oDGe3ZUAZ2f4oDmfflwZ5aKDa
X-Google-Smtp-Source: AGHT+IGFpmPzY89cA+sps7xchhXwbvS4hLuhbFCBxUqce+aMcHX4nBXLpUwuU9xg1nYZbcfMggR6Bw==
X-Received: by 2002:a05:600c:530c:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-442fd6272f8mr316774415e9.10.1747925578910;
        Thu, 22 May 2025 07:52:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:41 +0100
Subject: [PATCH v2 12/14] dt-bindings: spi: dspi: Add S32G support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-12-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075300_637871_DE6EC521 
X-CRM114-Status: GOOD (  11.48  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>

Document S32G compatible strings. 's32g2' and 's32g3' use the same
driver so 's32g2' must follow 's32g3'. The SPI controller supports
target mode when the "spi-slave" flag is used so add an example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..63f4b779a255 100644
--- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
@@ -23,6 +23,7 @@ properties:
           - fsl,ls2080a-dspi
           - fsl,ls2085a-dspi
           - fsl,lx2160a-dspi
+          - nxp,s32g2-dspi
       - items:
           - enum:
               - fsl,ls1012a-dspi
@@ -37,6 +38,9 @@ properties:
       - items:
           - const: fsl,lx2160a-dspi
           - const: fsl,ls2085a-dspi
+      - items:
+          - const: nxp,s32g3-dspi
+          - const: nxp,s32g2-dspi
 
   reg:
     maxItems: 1
@@ -114,3 +118,17 @@ examples:
                 spi-cs-hold-delay-ns = <50>;
         };
     };
+  # S32G3 in target mode
+  - |
+    spi@401d4000 {
+        compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+        reg = <0x401d4000 0x1000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 26>;
+        clock-names = "dspi";
+        spi-num-chipselects = <8>;
+        bus-num = <0>;
+        dmas = <&edma0 0 7>, <&edma0 0 8>;
+        dma-names = "tx", "rx";
+        spi-slave;
+    };

-- 
2.34.1


