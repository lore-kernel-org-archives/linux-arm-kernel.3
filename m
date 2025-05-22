Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D0C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJIIfru2scNsoUvLKp5rkkh2CkzNDRkWDJuYnMI9SSw=; b=xINHAy6KfuzgwnheSfiEVrlbfq
	VQGeXW1TtGzfxaN/lw+onDMRkK4Tkodqp2sPpHET+oe4O5Tsi6LWv4J+XxLJ0MPbe9q7HYbZy7DVK
	Kz0xb5uRxg22c6sZWYp/xG8H3I9SyIxpzoK4zMF0/yLUsf65DuS3r+Hp9GQlTlM0UccAhCCk0n7mW
	nrzE6U82N33lwVF2KgO4Ry7l2HBnLFJhaKuOwGRVvEFreN1ZmPavnIbsGMpHW1pzwDv1efQxQ46xq
	l5aiUTqVEpNrTDiHwLvQwcjz1Z8UR6LCIaw5lr5wzs34Y3FZQ4ETGR35uyNbaPbnG0bfy7ZQg6QTU
	Dm5qbnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7xs-00000001SAO-0bJR;
	Thu, 22 May 2025 15:36:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7I6-00000001Kd0-0tjd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:53:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so62420515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925580; x=1748530380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJIIfru2scNsoUvLKp5rkkh2CkzNDRkWDJuYnMI9SSw=;
        b=H2W+we9nRlz/9ck8gqbw5O/K3iLNVG9RN4OYZDv96A5sOIwyP49E1B3e0F9bOJ4xyq
         wLKD7hYL/XxbLgwJUJMlyEhE3QYvCwEmNsPOzOfjaNItTshkfIQE6FChgY4ezvzUKdA6
         1Yk+k3w6Xmr40gjOYQgf0QCF/LEH1EZWOSF18KsbazMBSZYzwjJae9A+u98k3YoUFbtq
         U4lnguuBbz2UpkcchPqVwktnK9NBKX4MjPdhhAq/zSvHxhoRTsirF8pmYY3ea7aGwoW1
         p8Xsg8phvWDn43aO0oJcO4T8K6HJIu06tIiJvxE2HTUkhhzUgfaygCePVnS6inQ5xhgJ
         ksog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925580; x=1748530380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJIIfru2scNsoUvLKp5rkkh2CkzNDRkWDJuYnMI9SSw=;
        b=Iqp9Ml0uL3K8NdxNdsp+O4fWM2jpZD+Y9tmsP5Jp0LYtklqzC6nNr1ITvRN5CLbTF3
         XsV0j59Q6B65ByVjc7Huv4CMNuE/+vLWOK4xePlonStiTh2OnmoMDjUoQIURZc5rAMgr
         qyawPUbaPtUB9XfJUE18vkjV4YYEGDXZE25HEiu16WEsovxoRTcT2mGdUZeQXYvqSEtp
         iwyby7x11yUnzyknu14kkR6x39rER5SorWwHfr1/qay2kB239Z2k9ln3TuSbfprhuf15
         PV13A7DA4wfDJMT2na7htyZb5ZU9npo3KVLaeayVx8dDb5+ZtluoJfYhN71IQFjWT945
         xIHg==
X-Forwarded-Encrypted: i=1; AJvYcCUDb936ftc6F7Qezz8cPuSsRVS5lzIGbsoKwBJ0AxlABZcxvr0PMzdf1g2cNcdxRJuYnfIKJNWFIOrZtYBdtSn8@lists.infradead.org
X-Gm-Message-State: AOJu0YyGBysT+lYyyjHGmPANtSY5WNXaa9zYoB8vVVi3bvaX61/XVhk5
	dHLpE3EoTzLEng/i9s6eA42Xl7sRKoJeobl1Vq5OoeibAqPrujELr7HSU5ytHkHnpMQ=
X-Gm-Gg: ASbGncvEbXiy8RKRez9wtbuhiCKFdZM3pHj/k0wugN2tNqkhWyuumjxFHL6dMH+3Alm
	xHFUAtH3eY17MDOM/+MpTc2Hpc6A4CmW51Al0zJL/WHseBHTf/B7HDAlyKrsTWc8CalTWlSF0M/
	8IFnRt8SxVdTxXMnh50QjYnPjZHMkt897IeGaGcHB156EjbTa3zWQt5m06fQd91RLLpMlIwynFE
	9pn5BJ2iPb/xh2dHpUvMddi/gOtPGs5JT2h1AhmdBMkrdoO8Ui/SX/Ux4z0mn7HxmZnEp9kJgge
	GALVVhHdijulokncNrPRRLFVjLf6Q07MKve4JIP3U7ENUurYNAuBjdx2MCrA
X-Google-Smtp-Source: AGHT+IGKSX/g08qT9uRPihxiVfgN5hqQC7JQm68hkcjFhtYvodzbfGfpy0Z0MOE5bK4aqE+Du9TaVA==
X-Received: by 2002:a05:600c:46c7:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-442fd93d0a1mr262843345e9.3.1747925580466;
        Thu, 22 May 2025 07:53:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:53:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:42 +0100
Subject: [PATCH v2 13/14] spi: spi-fsl-dspi: Enable support for S32G
 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-13-bea884630cfb@linaro.org>
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
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075302_254715_1A5CD743 
X-CRM114-Status: GOOD (  15.60  )
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

Add compatible for S32G platforms, allowing DSPI to be used.

Add a depends for ARCH_NXP which can replace LAYERSCAPE and also
includes the new ARCH_S32 for S32G. Similarly, ARCH_MXC can replace
SOC_VF610 || SOC_LS1021A which should avoid updating this for every new
sub-platform in the future.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>
Signed-off-by: Dan Nica <dan.nica@nxp.com>
Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/Kconfig        | 4 ++--
 drivers/spi/spi-fsl-dspi.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ed38f6d41f47..ff26be07226b 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -647,10 +647,10 @@ config SPI_FSL_SPI
 config SPI_FSL_DSPI
 	tristate "Freescale DSPI controller"
 	select REGMAP_MMIO
-	depends on SOC_VF610 || SOC_LS1021A || ARCH_LAYERSCAPE || M5441x || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_NXP || M54541x || COMPILE_TEST
 	help
 	  This enables support for the Freescale DSPI controller in master
-	  mode. VF610, LS1021A and ColdFire platforms uses the controller.
+	  mode. S32, VF610, LS1021A and ColdFire platforms uses the controller.
 
 config SPI_FSL_ESPI
 	tristate "Freescale eSPI controller"
diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 01af641fa757..04c88d090c4d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1316,6 +1316,9 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 	}, {
 		.compatible = "fsl,lx2160a-dspi",
 		.data = &devtype_data[LX2160A],
+	}, {
+		.compatible = "nxp,s32g2-dspi",
+		.data = &devtype_data[S32G],
 	},
 	{ /* sentinel */ }
 };

-- 
2.34.1


