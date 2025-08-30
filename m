Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43072CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us4cNYtwID9TjD04hpr8jvahpWc5vnsHqsFH+7B5S9o=; b=aVRINMMOH49xjIkXg+9TAgWkVL
	IPWXLNDecJQbFwRaftOscDhY2K5BD0vHmERGX5Pl29d0h06Kwl7nj10S5dBFgBMqLaQ9kxzvckgg+
	TTZHYbMiuNUwu64SswFnPEPKWL1uHihRsy8XnusRHrA2COK0ydFSULUq8WtWpgvo+D0WrgmNHc5oc
	NtE5JBrFFE4y67eI1nSMv4kDwKLJUJbmz66lz8ZAU0/Cs5Dj6MFmjqjLaHVV9BmEbNjvBWnkHluPN
	kxC7Pz5Nx0Fbj0DFOqIm8NgQ7/3ldu6Gmk1ERhcbnhojdg3RWzSLCilecAbktQmc8LxHI0+rArl45
	rK7I+Icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP9Y-00000008DEK-18RM;
	Sat, 30 Aug 2025 17:14:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx6-00000008Bb4-3qjW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afe72d68b88so28703466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573279; x=1757178079; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=us4cNYtwID9TjD04hpr8jvahpWc5vnsHqsFH+7B5S9o=;
        b=PAjtMkw/Qh7hKGQLoGcpVLw97eeLz/JWOkQ8EIOulJJk00Hl338jsJOYq7fr+Vxg9V
         LDc89ndN7gue7SxkSyHHAAAhP4URNKIioCKslcPDkVI0VCkazAgFioHX24P9h96FoObo
         7/SL5lo9VzoJAIhx0PvazGTBK5rGx8qxzbIlwJkJwPYH0oJpejGMF1k1MgwUmzvB/QjP
         PsOoYlDU4GSvKiQDDMJWA35yJLBEx2ml+QzvoJ0UhssFmNGqbStT7DDJj/jjoVo5DN2C
         mChq0TDMogSb8pSC0mXyZQbdkHwJpr2hX3IPX1FTKUSgjhkT69Nw/CL3tZkUYhtGQDRk
         gf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573279; x=1757178079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us4cNYtwID9TjD04hpr8jvahpWc5vnsHqsFH+7B5S9o=;
        b=t2u3Y8xfEKA4NWBrjAuNgyC4OOCnM8aV7MZgccHJsB1NFBjL/BMyW/x0elO8gyoHhj
         kyLyAZuxxgJn4zGi+8BmeUCgWQnBGOu9W6HfZcFL/SEJjI6mX9xih0EaIoBPXOam0bek
         p8m74GeOekZtBKdzBdUs5NN5d6L+ST5/CqWeMuHheeNvKIcru6ZgWnfh2YnRFAEu1Ns2
         YBklxkPGgH3XVprVMwHEv19q6y1Wugl+iLMQSQ/GwC9kYdr1q45tYY/edXV5U33MUr9H
         azGqvsBe1jsqi5tUwHRIPgkjcFOqa/I06h0V3pNFvNkG1H3Nacc50C6iRrlU7RL3AD3x
         r34A==
X-Forwarded-Encrypted: i=1; AJvYcCXEUPHZ2nkGCL8T2drLgxzBX0+07V8zfRN9V3L8vfikWE4+dMFSMwd3D008e2vMcC9vqxgrfy+eXP9YgyuxCApA@lists.infradead.org
X-Gm-Message-State: AOJu0YzFWqAllAI9ElhiaEn35ObNAWwpZlH4rIOZ1oegIkCrGVOeQZnp
	391evG+AskwJ6BLwN1Qvw/+srI+ZMMC5XaRbR36NlYrNW1kL1LxWmhQZscZSqCoMfvQ=
X-Gm-Gg: ASbGnctEjlvERy6Lyh9t9Xd5jLV1/aDEeA69eu9Dmn0qmjf0E+Sr+P3/hPD856eLo6g
	dCcziw+K7qenH3czYtvOnOWRQjmkWg6KW54TPhrYIlSrW0EcLsX/ybh7v/6Los202TAbCiGp9iX
	Ik6NIpAJOv9tyAIoUmV7wfk/X3HEOsZcNZ0fsPqB1UHGpOj+Hj2+xBLq7FSt5jdrwOe4M+lJXQj
	JwksrKgSaOi/M9qRF+0HlRxj7qwUivxVzMJQaJ7Yb/r7BhwytE5TluQpMwRJwaEI2wITrWIteKA
	auykFuUr/mey/NHx8rI4YdBG/+arw6U5lyQQ6/nmzt1CmZu3ryZw+P9yeklmMhaVIbwsQcQc2FG
	v0Z/vtadWTtrXcukElAvlacGcWRCx6eR3se+nGlK9mRdX0Hfy9A==
X-Google-Smtp-Source: AGHT+IEa1VI1o8sCudVEZfhZ3gaC0zyMofPPT2ZBfSOCrdhwJHioZOMNxGzq3r24F58nX/VQxYQy5w==
X-Received: by 2002:a17:907:7e99:b0:afe:af91:2e54 with SMTP id a640c23a62f3a-aff0f15c2c2mr290241666b.9.1756573279207;
        Sat, 30 Aug 2025 10:01:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Aug 2025 19:01:10 +0200
Subject: [PATCH 2/4] dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-s3c-cleanup-nand-v1-2-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QqWeYHPVLq//RwXvGMYa4TqqaGs9IG7D/NPVlveQnRw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5Yy3SpNOt0HGF2AczXJ3AfabDf8t8/xXbJl
 wARVHKMzUqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuWAAKCRDBN2bmhouD
 179DD/9+2t3OdNYd4i3brhoOrz4Kyz/N483Dm/aOqEzp3IwdOT6Jo+xN65Iw6AYjfqprAWKoy8Q
 4Wb0iynxRE7k+s0vA4+B+Oz7PB88lqEIrVPQyv8qRuRrUXV2tMUMB3Lyl93ky8xPOVoI36Dg8W8
 ATsAenaLvUrsH6Dt6xn1Ivx0Au5J3cnA420wk5GAK/Wtapt1rj+o0WjKL/15V9nIehpsY9qO5Hr
 ZG9w8rv/vZuNdlqrvv9JKvpqWniEcdj88JcjyzuxFkKSlTPrSUU/M4lLJpc0BY2nTJWpaXHh1XI
 GVxWW12/Mqeru3op0jgKXZW1ffB/36DS5koHwuQOkIx8vQ8FA7jc5e76pL8R7vFU2f29iqtyDsc
 2BmKuq/m391sk3V/C6GCUeP1LaFgiaFLsi5hJZ3ml49u4lnyXcBH5c+ZhjjlTJ6KNiD1XBStNcI
 exXQrh9LaigQgHWkI6kFbAwoU8tuDjcUzZAWrlSbV3JP/wGvDk5O4n4pTTNmrQxrQv3/hauBQ13
 PLdI7t355zMZna0djeTokra2SWNBuqEMRAx4fO8vYHNEogO9yyXMQ43u/Ax1nwFOqFPEnydUV8Z
 RDhoecH3Oc+LKFPgdCbAJZV8a3O7P1lFx8hFBUdvgwKAzhoyzdFv0SU4VdhyConflzyjHdFozOy
 hSPZD7UNMnmIdPw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100120_966462_09E2E9DA 
X-CRM114-Status: GOOD (  12.20  )
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

Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of its compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
deleted file mode 100644
index 6354553506602d452acd02dbac48c854b8b59cbe..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Samsung S3C2410 and compatible NAND flash controller
-
-Required properties:
-- compatible : The possible values are:
-	"samsung,s3c2410-nand"
-	"samsung,s3c2412-nand"
-	"samsung,s3c2440-nand"
-- reg : register's location and length.
-- #address-cells, #size-cells : see nand-controller.yaml
-- clocks : phandle to the nand controller clock
-- clock-names : must contain "nand"
-
-Optional child nodes:
-Child nodes representing the available nand chips.
-
-Optional child properties:
-- nand-ecc-mode : see nand-controller.yaml
-- nand-on-flash-bbt : see nand-controller.yaml
-
-Each child device node may optionally contain a 'partitions' sub-node,
-which further contains sub-nodes describing the flash partition mapping.
-See mtd.yaml for more detail.
-
-Example:
-
-nand-controller@4e000000 {
-	compatible = "samsung,s3c2440-nand";
-	reg = <0x4e000000 0x40>;
-
-	#address-cells = <1>;
-        #size-cells = <0>;
-
-	clocks = <&clocks HCLK_NAND>;
-	clock-names = "nand";
-
-	nand {
-		nand-ecc-mode = "soft";
-		nand-on-flash-bbt;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "u-boot";
-				reg = <0 0x040000>;
-			};
-
-			partition@40000 {
-				label = "kernel";
-				reg = <0x040000 0x500000>;
-			};
-		};
-	};
-};

-- 
2.48.1


