Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1C5CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxE83ZJ+7hJfHYgSuMACiK8dKmmxlhUw/dWCdgLit6c=; b=bVm5k4/2uwED6r2E6Fvxu6gcrg
	QyPbyjwnlpVJvPbiwLB1azFaA35m/ImkMn7IEcuesZ33TuWLYcGwshdSFgVrFvqOWHm9XivFC1zPa
	8m0aqv+jiV3rG8zi/+6y3xNa2a3oWQTOefWrrzd/Ctb9T0/bWEGsn/74Bw/JQL86PRzPb/rg9+oRD
	9Urq9XL92E50IuPhft0Kqe9Gr68ay/aGHWcf26CJ5xIUqDSOcs+eFTRujjzOu2dCLMgrZKNoNeSwA
	BF/nUZo4nzNn3IdiJTBdMXH6U92uTdRzmoM1T68ZMNZznIHSHGeI/L5lSkyCUjnvyD2s7IlI6se+j
	KXs4F+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vp-0000000DHdM-1a8N;
	Mon, 01 Sep 2025 16:36:09 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zX-0000000Caks-36Az
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:36 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso1059653e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731034; x=1757335834; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxE83ZJ+7hJfHYgSuMACiK8dKmmxlhUw/dWCdgLit6c=;
        b=pILBdJOOI61PDstf8uLn84umiGaQ0JEHk2TvvwjoFUwxcoFO52emy93zrcTMH7hSD3
         3FtWc+qRnuLuXonmeASOCAmpliAvJTPUuGln2SmVFgN+bbqf+2MvLP4ing9pVk0oeWjR
         yvbMn05M+b/2BCOj+FYYBgCVT+GGOaxq9B3cuME3ae5G5DOk4Ag7zJYqXGngl+X6m9r8
         E7tc9W+7p5XlwcKMzSVkXJyoha2HsTJVLpU8MawEOEotzvGKEO/ZAWJfN5PICTEMaT6Z
         +LzDXywKN43Y3EtJExH6YhiX6YUbyucSagN90GvqHjdiViCsCY1or/4Rn6vHTLkUgGlH
         Bw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731034; x=1757335834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxE83ZJ+7hJfHYgSuMACiK8dKmmxlhUw/dWCdgLit6c=;
        b=HleOO82KuPJHqSwRTOb2dgllfMheNaaQTWUb3/JNZxQx9ZZgqeBTZYqfCXwAQZ+k20
         jpEnbU1AQ+UWSW5q3nfjtgwXmdsfhygWp7QziytkWu4gPv+yxJGKHc8n5bPwI/MIlQPZ
         Sk6ZuBRrGbLH4AxEXb1w/UbTuqQYp+Sfjw0Imzn8nVL1tYFG4Mem7t2fIM3GaZVL3yYu
         MeXgd/XVxAEqOkEzNUmlNSWLiyOcHB1sq9qc7DjpHZEZFAsQeegN26iPbzRHdGVOG5Wt
         Ss956z97V4fluoi5tPlec93Dpqg1j8FmRhicqB5O/RbYVNCu72mLkQFxAH9t41ea8alk
         uXUg==
X-Gm-Message-State: AOJu0YwYdfAXYqtD30R5byAmf787kQNA6Md3JSci2P7Td71seKr08OY0
	yyFUXwgfUcDSMtlxsIwPolulf2n6FbZN7Ojxn6yza4EKEJfS5QZn3c4qs3CJXmEI7fM=
X-Gm-Gg: ASbGncvIRsVlXMFqgulRgt3nMXfamBd2XEm0tF+1K34d3zNBH84bWEQb4RxqkXWJKVh
	aYsgwJEvOmxUx3PvJI3fb3EyJjQizBeQTjnxOX5pWOykBS187KbLnhznjI7zf6CzvkuFq9i15Pl
	IegPaaMcsSeRIfAhKBQmK0yzs0UswPsvY9JUrbOT/rruS2dR6UD8o68HneVBe7r7/iqAA8VR+w+
	nvTh7LRd5GTe04IwngkJnupFp981UheSOCz5EKv4bBN+NbT8IwtgdUOMNbfIoPoqYfHmPwHPrLC
	vemOODd+cENJrip3oQVNndLLk7ieke7BNrcxktXGO+Cqr+nLoeGPsNivbkwaDlWJ4yBxxCQxZF4
	y444Due600ErePGqjBjoQLcGclvzMk3Bt
X-Google-Smtp-Source: AGHT+IE83oglwdaFwFGjveVw6hBCFQ3PtLnL1coREQ+sWY/gGSvePVTg75KBlCSz7KQliGV2F7SOeA==
X-Received: by 2002:a05:6512:6512:b0:55f:4a0d:3f4a with SMTP id 2adb3069b0e04-55f70954dddmr1662205e87.47.1756731034158;
        Mon, 01 Sep 2025 05:50:34 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Sep 2025 14:50:31 +0200
Subject: [PATCH 6/8] ARM: dts: bcm6878: Add I2C bus block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-bcmbca-i2c-dts-v1-6-ad81f60d4276@linaro.org>
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055035_780581_4C9C15E9 
X-CRM114-Status: GOOD (  10.66  )
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

The BCM6878 has an STB I2C block.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 5a37bfd7f53f16fa07cc93b570a585ec34f5f443..c08f532618493b166b10dbdbd45194ad843baf18 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -239,6 +239,15 @@ nandcs: nand@0 {
 			};
 		};
 
+		i2c0: i2c@2100 {
+			compatible = "brcm,brcmstb-i2c";
+			reg = <0x2100 0x60>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pl081_dma: dma-controller@11000 {
 			compatible = "arm,pl081", "arm,primecell";
 			// The magic B105F00D info is missing

-- 
2.50.1


