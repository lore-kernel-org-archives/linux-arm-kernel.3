Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D502DCCF2C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=; b=uqLLmpauGNmi24imujG7AOazBy
	VZ11bd+l6Yugpse8qswVnHdkAH8rzB1JcqtqqxHCEas2GRPZHDhDpEcRv73VaSXNLm1hykHir3+el
	QgMKm8IPX8S7vwMwiIslpBRQa19EEFxJOzysAdMDQL90p/TQYjfQ6ycO0W6bMtxa/qCse4uurJ7zu
	9Gxf3srRTS75LYGFXmRolMWRNWoGqkU7YFT3altKZQ643LRUrDEVN4YIj4LiFd37nON3kQ8DcrnZJ
	uql2A9ynXnZreat93J6UtoZ7E1gpYcQNOWTUUj/fxhPikqZ8tFlK2xgBCBKREJuwDfxqa+ceAzV1t
	zrKd9HSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHor3-000000041rr-3r5C;
	Fri, 16 Oct 2026 20:48:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHor3-000000041rf-0usn
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 20:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=; b=OIEBgGSb9MCZRnROEECeSVE3GX
	yxGFqgOXmzYbwzLszyiU+wqyJTPvavD4/LX+XsCudbYPlvmjog6iPcHuOOD3JfhrGuDOAdcA2xvbU
	o/MgUfG+3cZcRXvnvmOvhg+uHiEqUCZTOwqti+lDkLFQmaUbkHChRoGd9C4eZ0JVsK/2M8wrx/FY3
	IYudDDyFjZ7Jg6DmQYS3Gr47zx99VxnLnldxD2FbQ7Q7yFT8Zcrbt/L+ekTjcrbVpedu5MNyNOvy2
	WlvAY2ddPWppDsfOy+yTvizrBD1OEgZfBXsfyDg+AHxO56aQs4x5IDolH2+3osc8h+8lwLpxnQqgJ
	etUVMv7Q==;
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHor0-00000001wfv-2Hiq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 20:48:40 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so199363e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792183716; x=1792788516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=;
        b=rgRyyUsaz6xYFNQTLnA1lbiiLS0/kqwS/Q4NgnEmQrmRLYI2nm2ogkkFVq9m0ZjLvq
         YtL1a4EXI5/B15JIuXcwqiVziHbjKG7yyOldlL9aigcHx2rxoIzFPfLP00N7cPgRNP+d
         07Q163Ds7mRTiLQRMR9Z+P/ejKIdK/YiCR2oxltYS2sqox6WMEPgBISWPGJqNzDHTniG
         nNv68ZjB2Gh7uoHsF0IYHb95DXDZanbE59mKYYklQb3Wx6tdVHsMOMvNgzsGQPH9jPzC
         ngM3XuFe1cRHgAJ80jxwFNGYq0tlnCM8d2tYGMX/h2UR9h4qOXAnDGlSTlkX6GKkNmWz
         TgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183716; x=1792788516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbKdCffk3oF5JNe4bLXvDyGBPerJKYVxL0w+jpUvxD4=;
        b=VNaTPgN5yReVJyjdtXfyEleDF2A6t++Q2z+5PgOwYMPIXtloQxo9Xmi5rztw2gYfiM
         o9W3YXPPHHoBeKrvyBZpLLMp3AeEASEeLHsAG/KgxYX9bDyfsHxpxAwEVq79Aj8T81MH
         ZnWKjW4ixK4zNnfNjpjo3J8JGoUxH+cst9x7q73oq9qU+xyk1Pi1TwZwhhxsHLwVdVtQ
         gwPwc7YorAepUhTczx/wNHK/PuLAQcuPi3iC5ymqRJVGFPdTpvOskrSqHDj/U8GNUMZe
         5B5h4vbFQpj9BeN7lEzHFhlzJNG1al7LsBBgGwLcg0IPbe4MVRcp5G3kwZxRvteqN8o7
         KeSA==
X-Forwarded-Encrypted: i=1; AKwUvBzUYNRWiWqEzwVuoUPMQ2g+8SLBfeoVSz6b4V0pa2pSAgiZMhxp4yQBC+FOHuDZU0SAn4X4JgtxtZmKUvUJylAh@lists.infradead.org
X-Gm-Message-State: AFq9FYKUCiHW2hvVdu/Q4XSfDhEth0zncAVsg20vMkFmjCHkDgsWHfvN
	6okae09Fi6aW1BIFqfEbYrMBScZcv3n44K1MuLQVr9oTtLuNFwXAqGLA
X-Gm-Gg: AYBFou0xAB9WXmQ4YZdXqAUx4VK/Wg/kuDIiCf1Yf+G9ZPXOgLjKyh/wZubmeeenr15
	YxyL4a0I6w2d2tQrFkt/aw7MZ0VSc/feyRiwxEu2QcBD5cELEtgY6BECBu0FB0sFwvKsO52FFHW
	fZ0fVhO+V8BAp8cQE3qCCJ7m9xnbWAtQlJZm6pO04xAIn478s3zspHEmWBDitpdllSxIyi7fyyi
	xPj5yaZCO/Cjsf9tRJlp1dKymdB6pvWAToGyG1nbTTIyA0hvney+xifFGbBYFTIZj4lpD8Lqalj
	7PU2E3VpmooqkyQRQCexTVWarHMV4rnmRXk25cjVDHpGs1jNph6d7p/3KBvyOZ0tLq2PpkCSVtE
	RYJ4EH+m6+HrhD69dtfXnAZDjDNWLH9opZuu1kIjBwav8MJEXVFmFbt8ntuKb6J6vUApZDiyzks
	ET5rWZlrJqYKsdZVnqSiSn8QZ37vWUM326O2y3qSc3W5sq04r7BaWKyy9V4PNp10FZf+66J2l2S
	RbQvYHF8k/F6TmvfOQPRjuwL5C/VSpaSejiKaQo2nHEXLY=
X-Received: by 2002:a05:6122:4889:b0:5ea:9f1d:c842 with SMTP id 71dfb90a1353d-5eaaa6647cbmr588454e0c.15.1792183715924;
        Fri, 16 Oct 2026 13:48:35 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:42fc:16d8:d66b:d6c1:caeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b55cc65sm2463872e0c.17.2026.10.16.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:48:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Frank.Li@nxp.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] ARM: dts: imx27-eukrea: Remove invalid spi-cpol
Date: Fri, 16 Oct 2026 17:48:17 -0300
Message-ID: <20261016204817.463567-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_214838_633104_9AAE3100 
X-CRM114-Status: GOOD (  13.55  )
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

The ADS7846 timing diagrams show DCLK low when inactive, and its pin
descriptions specify that DIN is latched on the rising edge of DCLK
while DOUT is shifted on the falling edge. This corresponds to SPI mode
0, with CPOL=0 and CPHA=0.

The spi-cpol property without spi-cpha instead selects SPI mode 2,
which uses the opposite clock edges and does not match the ADS7846
serial interface. Remove the invalid property.

This also matches the driver behavior: ads7846_probe() clears
SPI_MODE_X_MASK and selects SPI_MODE_0 before calling spi_setup().

This fixes the following dtbs_check warning:

  imx27-eukrea-mbimxsd27-baseboard.dtb: ads7846@0 (ti,ads7846):
    Unevaluated properties are not allowed (spi-cpol was unexpected)

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:

- Remove spi-cpol from the dts instead of adding it to the binding. (Sashiko)

 arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index 26833ed3339e..cf5603ec6826 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -77,7 +77,6 @@ ads7846@0 {
 		pinctrl-0 = <&pinctrl_touch>;
 		reg = <0>;
 		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
-		spi-cpol;
 		spi-max-frequency = <1500000>;
 		ti,keep-vref-on;
 	};
-- 
2.43.0


