Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8793BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=; b=MRnKTQFBw8wMoBighIOsR5uXa0
	owSA6lKoTFJMvVRGy5C4smz17ZqB2smf+N5Hv5qEI5vRT0DmPpsZ0hqzeUpfgjpb+qzgJuFvsBFZs
	y2lDOOA0ae4l0qP0W5D0BvTR1/eESJ7ZZyuZodhqUV7APIOfEQ8TNvg4Z3XSDXaSXhBxaGEXyYjnZ
	aYdxKykyk6UATc3mfNfYhjVxXWh/YRVyeSQRg4E9/8KfKtyebpOXnIOnH5x61LWXJ6mblGU2XHXKz
	9VbVjFx40kom2JUywhakz4z4W9c5og+S/6nbhvmoYtUuiNETb46HDsCSz3Q+k6Ju4ihvkQJhhP46l
	YFJKtd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMdb-00000003YDZ-1neK;
	Fri, 09 May 2025 12:15:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZR-00000003Ng6-0Cq6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21687445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788831; x=1747393631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=;
        b=PFPzzxXeiSdb6utOe5AIg30hpNU02zkUFqpVHYovvodJ16JTauWUZ9KOibzg/GhD7Z
         kBXn9SEaT/NYcFosv7AWlz8JdyXlzW8Y7x4g6il1crRgkL9yqxsOSWqvylUksPZqHc7o
         I+29a3NC9lhmuvDovXkY7DUkkmAR+2Lu/pn5D/9Bm0YwTzdesDLgYZrSwnHhuMpYoAXJ
         0oedVpLruB/aJUPGbii6zeRrMM9F9AE8LFvXiVe7dI6okm+qp/90mBIvzGgtGwd+3icd
         aTsxlnON0Vvzu5rkbqYn2V5SmtZrXCOWIFhC1dAU3n6qL7F6jCk+U/YpN1oOFzwWpx2m
         Tnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788831; x=1747393631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=;
        b=ag1QSIxRY8T4vmAUJ9GrQhxDx8w4L/nxT7GeOekkHn+1pHQmYKglyEn1Z/fQcazK1c
         mBCxJGcaUSKJm1jkDCMcRFhhcqe74LTbMZ+ykHtnI30D5hMIgExAmUYXKEc5DIwMvtFg
         avXWTNJyZnIzWYDnDmqDTJGYaAMfHKrEUcthAadDs+2+IBtqj2VJYMxp1/eUkagFIb2V
         LGkX4Pi4NiEnjj7NBuTjC9Ac9Zc4ozklI6UgLrwu7VZLwrK0AHKIzz2r9OCPibMGG9iC
         l8wE0y78wlTE4t8kUXga0UNVRY8VUNqUEK67uJiUgTzjTcKAkZvDzwbqOVaR3nFnePwG
         lwpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkFQWDT3L38pzqnlhcRNF/p+2P/y5vForgPLAhh7/8vK1Hxguw96TzUCSGsLpLVfW80VLQfhv57o+KoCRK6aeO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpt8uTxFSz9Yrfv56ANXYOEhizjSVEigG3RmGj3u66uXoEFbcT
	rBEzGcfJ8yFR3FJP6GRRTXM/SDAs8Vq5DE10hc5xfDZvP6owJZUJQfyE5WhW6dM=
X-Gm-Gg: ASbGncuX6FoFSJZEBSqZnlmHlOwyJlev7wEPHXuLN02Ss/Cs15SyGtiKaYoVg/b5pEp
	duqH/gbsRDwfgnuVpX/Mr0wdbU3iCGYkGUaGPOD9br+2xBhOPpeyouMmuJujZdm1CRjmbMlIVho
	HqXtwzMjoRU8QVqEVHzasIg7FVKYFbAdYA/UPquXnOuUD+A2+edMyon74wUqyvM3fM4M4qeKhNd
	Q70/RBSzW2nq8hkQcUL9y34yn/4jR2YLUY8NHOZkdaf1dDHWA+eTWeEXEshXrb+3QF4TrEal81B
	ufVTW1MhHmNiwLjejm/8/pQfxYUlsrbHenCgDkw4rKjztJY=
X-Google-Smtp-Source: AGHT+IGJvDt+LaY1QQLl2SlTRe/DojIZ4tpeJAXa/uWwNzG6xIzfPYcQgejyyHruKfc7448qtaeZfA==
X-Received: by 2002:a05:6000:228a:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a1f6a0fc42mr2727736f8f.4.1746788831370;
        Fri, 09 May 2025 04:07:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:59 +0100
Subject: [PATCH 12/14] dt-bindings: spi: dspi: Add S32G support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-12-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040713_094386_D3F94E80 
X-CRM114-Status: GOOD (  13.56  )
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
driver so 's32g2' must follow 's32g3'.

The SPI controller node in dts can define both host and target pinctrl.
The selection between them will be done based on pinctrl-names. The
default pinctrl will be loaded first and will be used by the host. If
the controller is configured as target (spi-slave property is added in
the dts node), the driver will look for the "slave" pinctrl and apply it
if found.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..b5fac0bb142a 100644
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
+    spi0: spi@401d4000 {
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


