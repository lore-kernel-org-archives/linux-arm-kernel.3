Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B347C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=; b=r9H8axdvLbrCG06usLUW94q72r
	ifR1uj6GrCfVKiLR2tQQdVyrQacbIn3f60rAKn+H+tDSd56QpxFLvmvGsNzx43CmNXT0hWKpJrM1y
	J0LJVI+6rWxi7P1pcsGXiAYbDjv+t6C/l3GRU3VfVaaHMrPvgT/b2GXOFJi9KhbbVwGUU/Ggy3BBD
	aEVWhyZ1xYsA5EdiU6sRAS2ahkjx2/B0XFT+At0QzWQ5U9nk6p6vVCB2o0hW8zOScpBFz1j9O7SLH
	zXQ+pqYIC2BLxcadCoOhLIM2JDXHRk8Xl2r3ufdT6i50dqtXG69g+WsJZH5RMWr/4QFZhqdZfn9xA
	Zmuod7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMKH-00000003VH5-0zDX;
	Fri, 09 May 2025 11:55:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZC-00000003NaQ-3Aum
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso18348835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788817; x=1747393617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=;
        b=zsQhPIRGkkM5sQ/7txI5D3g8nc/0g6VEtNgjDToMPSLmsYBBq2goB+qUr5XQ66OVim
         2ToIFFWGQ9XKDe+cSUsKH5scXk/YG4HxM5pbEuvRtjwNvfCHQjNwMcA/C46MBJccWKAa
         F5jVg/pz8WUcOCL+v2oSI/obLq3TFGZCsoJPunTAT2QQQDXVj+JFulCRpBff/Gtx0IoO
         lGvGxW7Y+h4vs0487ZI1983Bjxyt3ArFFR60WqWjakJFBkiB6Lt+jfrbdxGmYF/orf19
         U5LcivpeEBNCVW/GxbgkauCN3Rylx5Oq+1B98B27aZ0IQ7Ht+vDjUN0vPXH/lyq+ukZ1
         j4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788817; x=1747393617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=;
        b=wpa+hsvekHhBd4AqK9HaaQ07fdWqanj6wM+shDE2gp7i00vFzu9aV2+XmutHj4v46E
         nHPVnazxWAhOI6dJoCrEOEt0Bt3CJiMfv4W8sbp48YLfs0IvteRXV/grUr2aQfdXFrKv
         zXDhnq8vHu/lkEjR75FguK5exV94P/qX4HSdn/Jyr6BPB3DGJ/cuBivpE/rxED69vvOg
         UBTQdcAJ8h21WjnBOoJsL46NUTB/DPpkX73rotD2SpK75lwiOFViHuZBjXaD9UECUHrI
         Hj670Qz30essaLoNMZyMTfHA70PU5i6QSxCddKx7hpIWYyb2lIdIfoWYAnnkKTyNha+k
         UJUw==
X-Forwarded-Encrypted: i=1; AJvYcCVvgSrDlLGszvT1IE0sPs0uWsDuonBhCR5dvab77OI/+mTAIi5ZIb4hmhzH5Igl2N8H0QJ92Cnax2R2dwAid5jO@lists.infradead.org
X-Gm-Message-State: AOJu0YzWCaOaJ65aIxL416tvKFqS47TFoA37M+Lti3YH9Qy4+J5AZ7SK
	USYNfanv/O3hnV8Fe2IUz1YCdZkv53WPwiGsLlN3oCZFuKFOuDN2QHwdZPFk/0M=
X-Gm-Gg: ASbGncvtNB8id4WoU8fy65581gT9ytxyUlScucYkolIfDElI5+BWjFhHEQZUamr56rK
	IRKWNpdjM0ityq0QYEg/fMqXnCaQOqBO1saACU57cTMl2ibRXYqCgcJtkYTGtEUA0tQ4kaUtuSK
	wyyUf8Q/TCx0lOhVCAYCRMyoZREXAa2ICNv917XJPe427+7tJjcIGk06gEDiHI8oX43IV231hqz
	m+DIJJspTAfybjkgrIgFUXb/x6xCSWx74Z+u63cynVpsm1zgmOQ6sXtcc42F7AgRpCcu3zakgLE
	lZLBcTecvfqXKpBcJCmVFf+Cj8ln/NrBGGnsAUZojY9tq4psZQkXhGmemg==
X-Google-Smtp-Source: AGHT+IFC6m07o95wlBL8z66ZHFQZFey0yAwlkLMNz025uhOiNU0gJ9upByEMU9FvrvfyyVzrnKIsgw==
X-Received: by 2002:a05:6000:4287:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a1f6457726mr2691256f8f.20.1746788817253;
        Fri, 09 May 2025 04:06:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:49 +0100
Subject: [PATCH 02/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040658_798225_311640AD 
X-CRM114-Status: GOOD (  11.84  )
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

max_register overrides anything in the volatile ranges, so we can get
away with sharing the same one for both types. In a later commit we'll
add more devices and also read/write ranges which also override volatile
ranges so this avoids adding even more duplication.

No functional changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 31ea8ce81e98..cb0e55a49eea 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -141,6 +141,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
 	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX)
 };
 
 static const struct regmap_access_table dspi_volatile_table = {
@@ -148,18 +149,6 @@ static const struct regmap_access_table dspi_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
 };
 
-static const struct regmap_range dspi_xspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_xspi_volatile_table = {
-	.yes_ranges	= dspi_xspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
-};
-
 enum {
 	DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
@@ -179,7 +168,7 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table
+		.volatile_table	= &dspi_volatile_table
 	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",

-- 
2.34.1


