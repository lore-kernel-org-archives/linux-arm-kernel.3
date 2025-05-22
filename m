Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1447C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kblZ/H5EWoCAOqhxMxQVEOgjozeVyetn7b4EPGEonA=; b=Fw12X6VJfCm+D3ojq3BZudHvOu
	GoFWmmhUBuJNY+eypVsYj+ejLBLzSNw1y5enu30jp9m49HjDMVaK62VMbTzAW/wSTo1cNv4mo2Y/i
	Cj9HUDOkwcLF1+0KWyWGlx+zAaqvyy3TOvOZNLvQnoOGFREWhZOzoh3yuhCHUog7Q5j1lioUGIsM8
	q+HcD+017s1C7FuIljg4ZYGsEJGzj5y9gmFtSViMsxEYc6gXauA69jjgc9R+jsVzQSl10HY91rDI2
	QT7/QJuInW7Nrz3OZiLlMRKmysjNXm8I8p8l7yo96EJoXUKFSDQqSFz9I1reeW15YnwpxvfaHK+za
	aDA9vKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7nt-00000001R5O-1r4G;
	Thu, 22 May 2025 15:25:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hx-00000001KXc-25OW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-442fda876a6so58331315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925572; x=1748530372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kblZ/H5EWoCAOqhxMxQVEOgjozeVyetn7b4EPGEonA=;
        b=C4Mtaa7fclGjAO/TpImakWbjyEmMTn4QKQ1XgfiXtZUHwH8Zlq2PvNWrO8xlidKVYP
         FsvQqt/dq6xh4nFUdumaWwd0HQ/2YU7Ou4rVXRiWgDebhU2UJn/QkMQN6rI+bGAMqgl6
         lxecZBg/GSTW+6BzCXNysjmPPnPzATMGaXOx/gIjxrwz9Ov5U6ADkq6vzU7UuuDqU12G
         SBiAXp4H9NNl5T8kzjFk2zo8rMl1/k9NLydBnjtstByeWkH5QCdw9YkyK/0zsBagpHpx
         CUxq7TozHYim7NcBQxC01o1oV0qYKQ790xy0j1Qza9U0/d9TqOI3S6bPMYG9oGm3KUOk
         7kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925572; x=1748530372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kblZ/H5EWoCAOqhxMxQVEOgjozeVyetn7b4EPGEonA=;
        b=Y5svCNsjTYyei9NO55wzfHltlkhVoI0qs8AOD+tIMLLK5mhgKf9EbPxxuaBbtDu9hP
         mAGQu09ZcmvtKr945Fjam1oHKE3OvqayWTF6nHXXfrt76wiO4qYsMZwqlH6/OnmbOYxf
         8OvvHzHzvX2po+DTSJFa733V5IZFRMyjezZPrHtlZn2jAXY/2Ts8A9yC28oYdc88xQUD
         j0mElHh3HA1u7lh529c57fBMRZ/8GmFsCA1w1o8NjQ3eNAzTux34k0fZkm5ikZlQmHOP
         YzbtTkmP8dv5a1lNTmfFRCeOGhCYfnd3ZTNRwwJ9eHuWEtY59l+RB1pSnbThqdiDhC0K
         A/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXwaZcdGWYDmHlS3lHP7V5Dide3XvtP0BvmZZFghllkmxGIrSPN1eUMyfjdZ1hyoraK+indkabfhwO5VICwt+HB@lists.infradead.org
X-Gm-Message-State: AOJu0YyGo0PmQRTWQSiLeraasghSBkuYKWTu6sM1LJMRceyE6m1rOnvJ
	7arJAvJpCJ/rAmHuEAa1m6o7jWXxH0xIFypz8pLQ3BC/6xx0gQRZuNKI8xMkN1JmOeM=
X-Gm-Gg: ASbGncumDaeadbF4xdkUeEUqUHKRAA9DxkCGNBeyUN2q1WW6fcZ0Wj3i1U3y0MSNSPH
	LqS6+J96KDsgn4E/pX+abs4Mf9puaMKiegf7SUv16sOCfMFi/laIsN4o+txZfXKVDpq3W59pyzl
	chvo90HZddESDis1VzfWUbeBowMTkyLurU4bwh7YX0L9E3ZFpcmiNwKYt1Fi4MQDtKGHG7rI2h4
	80V++hjahr4b5oGWwfPpbgD9eoAqbWC47d0FRLOvgU4m+m+yza2n//vyiA3Xi4W92+8PlVAJSpf
	eHUjCHxO72wkghyz77yyONGY+ODADmzzSe8jfI/qjGNEp44fTmf1jAUYfT7T
X-Google-Smtp-Source: AGHT+IFXkX4C/vZh8avS6z8fsiCozz6p4hPupyXcDJ2YtFvJ/AEXd7sGhYG628mq6mJY77AcpW4q9A==
X-Received: by 2002:a05:600c:1e1c:b0:442:c98f:d8cf with SMTP id 5b1f17b1804b1-44302934f7bmr251165455e9.16.1747925572152;
        Thu, 22 May 2025 07:52:52 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:51 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:37 +0100
Subject: [PATCH v2 08/14] spi: spi-fsl-dspi: Avoid setup_accel logic for
 DMA transfers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-8-bea884630cfb@linaro.org>
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
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075253_538757_84C7C32A 
X-CRM114-Status: GOOD (  15.19  )
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

Repacking multiple smaller words into larger ones to make use of the
full FIFO doesn't save anything in DMA mode, so don't bother doing it.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 814a92b8064e..24a51267cb4d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -850,8 +850,12 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
 	struct spi_transfer *xfer = dspi->cur_transfer;
 	bool odd = !!(dspi->len & 1);
 
-	/* No accel for frames not multiple of 8 bits at the moment */
-	if (xfer->bits_per_word % 8)
+	/*
+	 * No accel for DMA transfers or frames not multiples of 8 bits at the
+	 * moment.
+	 */
+	if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE ||
+	    xfer->bits_per_word % 8)
 		goto no_accel;
 
 	if (!odd && dspi->len <= dspi->devtype_data->fifo_size * 2) {
@@ -860,10 +864,7 @@ static void dspi_setup_accel(struct fsl_dspi *dspi)
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


