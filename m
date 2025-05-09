Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D39C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z83P5zYL5aiqJ4xhC2aD1SNehmR83/wjYJwbnC4UTJU=; b=j8fduritEJgMcr2C35mHFggsQe
	CMEbWMdWqTRMZkr+HkKyHPW0/lI58i/KCWWca7Pfiso3VErpPbbGqNpVCCDX+7Q4xbSp/1/RvL35M
	/O76WP9RQOU3fQ1b2oMM0NPGdUcaD4D5yLipb8Gqm53xsntCigJ9GqLYlGO6O2RGz3CdbYI2yrJgS
	kNlvfACLEDbt7CsTuiwU3/yH2EqFZzsDJL37x+5LdGKpj40EjvPv0MCUiyK8vhUS6RQReeBtGHpJ4
	qaLEfoj4czcxYEIzMKVS2oCt8eSl9+LqK25SdPdw1aJyEEVb4icGsu/jMavA5TFmdVf89X+O9Xe/j
	o/KkNQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMS2-00000003WjV-0OnG;
	Fri, 09 May 2025 12:03:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZI-00000003NcM-21OV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a1c85e77d7so799026f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788823; x=1747393623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z83P5zYL5aiqJ4xhC2aD1SNehmR83/wjYJwbnC4UTJU=;
        b=EcSHP8vvAPgFtVMbEe+Sj6BX8WvcGCq6cPZWTBsDX18di9JIBL3KWww5gvEvJap/zj
         4VerXj9nfvDaV8TTt/LySh50/3gC7sdNkK3f1MwF3wt6VHZJGG5UY6koDDII49jOZ14s
         K4ljLcvWkRDly/d9lJsebZtSJ+0nzHA5DUX7Yw33Fk8V4QfkYrC5T+clCrxrX5cL6Wqn
         A10iPRWAWnh9UHZW5JIm3KRZVPs6rTvQoUx2Gf8DBY6a83XWKKSALj6MhVg2SQX0QCJF
         l+o59lQqwdsYDUxG2qwxDRxSlCtR+GlV8+sfik1hnxo1HHt4wUdWbgaPy1kC7PGhHg4O
         wsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788823; x=1747393623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z83P5zYL5aiqJ4xhC2aD1SNehmR83/wjYJwbnC4UTJU=;
        b=Qhjut6PVNcnt+B969pgnynESuWpzXTKhwuyy1vW22AFmVyOQBx/5AzHs4knz2th4+b
         ZVyDZutb3xGRKt49gJ/FeIEVOJUwhss0c+baMfle4YkuIrmGFxPrKfRdYnWTHjSxfkyY
         sqiU4cZfxkYZWodNQxj/2XjHj2AYjtcWjweF0RwH1pZ3VQfuaK5GInHEWbgzsilw9sKm
         2bCXuevJ5QIC7NI2fpWfM6bYeJ9fIgpzKbHd7k6P90jbsi2iX/1kkcL6gpLXxFo8ic2d
         5xw7OeN4BMTWBcJmV8bopgIjp+biy4yhOEn8LnI9PaaHkt+mcjnXQQrcNhjDgoN1tDVX
         7sTg==
X-Forwarded-Encrypted: i=1; AJvYcCUNdzGx2uia6rMKyu7npW4v1E76lEy8zc4po/DCv3VT8EZHyBK/EGFUIlfJm52xIYrBCRrYev2UJvO3zPV0dOY4@lists.infradead.org
X-Gm-Message-State: AOJu0YxckS+Cn3c/O51tHv1yjBez5VixDzY14lmtS8gDSYh7ir6UVYlz
	KZqmbflmbPWOn+s0rHhzirHzmbSZqkU3KwaKMfZyaa/ZHr0CiQov1mVrwNcQf6Y=
X-Gm-Gg: ASbGncstERZF7GC30fIJzhI+/r4R1MnXLx7lUKjfk99fjmYC2FmxIitmPybgWQ5XteU
	BEeqFJMnItPofpF8yjmILXH6haZ0l9VZP8FM0rBR4STvCUN6CyUJc6vfEGBgUjd4yDxm8QgqfB8
	xwGzncTXlwxZuWKmmwJPpTSpHlR9Hs4AifdKxa4PqvwrTrp5smSy/9Z/3NXin1fCqfbVbWDzz0y
	drpG/CiLaPnoDBB7RIMlxh55Ba98hXTWiI1kq7Y9Nh9kmhk52C/7po388AHP604XTexC4/5xVEd
	2oa63xsFBUPJsCiqp17nUnM8QXKK2BhnayX6TtphdmWao6g=
X-Google-Smtp-Source: AGHT+IEzZyvVmE0isCL1qd+GE70rpX9DLtjU5jOZ0ngvIzyhV3E/BibSqbyphaSiycReT9JsLKLk1g==
X-Received: by 2002:a05:6000:2cb:b0:3a0:b8b9:6b2e with SMTP id ffacd0b85a97d-3a1f64a430cmr2498885f8f.34.1746788822979;
        Fri, 09 May 2025 04:07:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:53 +0100
Subject: [PATCH 06/14] spi: spi-fsl-dspi: Avoid setup_accel logic for DMA
 transfers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-6-32bfcd2fea11@linaro.org>
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
X-CRM114-CacheID: sfid-20250509_040704_524255_8C31FC08 
X-CRM114-Status: GOOD (  14.96  )
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

From: Larisa Grigore <larisa.grigore@nxp.com>

DMA can't repack the buffer like the CPU can, so skip the accel path
which may change the word size and break DMA assumptions.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index f7f9425a19e1..902bf23d276a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -849,8 +849,8 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 	struct spi_transfer *xfer = dspi->cur_transfer;
 	bool odd = !!(dspi->len & 1);
 
-	/* No accel for frames not multiple of 8 bits at the moment */
-	if (xfer->bits_per_word % 8)
+	/* No accel for DMA transfers or frames not multiples of 8 bits at the moment */
+	if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE || xfer->bits_per_word % 8)
 		goto no_accel;
 
 	if (!odd && dspi->len <= dspi->devtype_data->fifo_size * 2) {
@@ -859,10 +859,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 		dspi->oper_bits_per_word = 8;
 	} else {
 		/* Start off with maximum supported by hardware */
-		if (dspi->devtype_data->trans_mode == DSPI_XSPI_MODE)
-			dspi->oper_bits_per_word = 32;
-		else
-			dspi->oper_bits_per_word = 16;
+		dspi->oper_bits_per_word = 32;
 
 		/*
 		 * And go down only if the buffer can't be sent with

-- 
2.34.1


