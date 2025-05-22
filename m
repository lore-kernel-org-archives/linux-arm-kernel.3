Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0E6C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHewhTi8oRcJIXvkVA+zw1liGRuM2d0KooB3K/vBm40=; b=p2fu8rBq6Lx+Vbb85qTIzZJsx/
	IMehRIs2/QQHy2M6wIMmJc5GfvQeVEJUURcun91T7PUc6gA6DkfdcReEPTG+OQjKLhEJD1WKis095
	L8wbbzBLr2InlRvrG836wDbdZTScBOq3h9kFpyfZBWaBMtyC8W4hihC2Swi+Vw2FAqNeaDxaKf7D5
	qBiIph4iOLytw8hjLfyM4KAZtPOyiiFUhO2HJcY1RddRc98/Nq5v52CuJrd60Nxn0XBvIHKGe/93h
	v1bzQ6RTjgak1GF4fgjA2lxSTIVmz2+P63b8w3Uq/sSaUThXgyHMPngPrjeM3y+w9gD2vQL2VR82N
	XUuHngng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7dv-00000001PWv-0plp;
	Thu, 22 May 2025 15:15:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hp-00000001KSj-2WWb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-44a57d08bbfso7702255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925564; x=1748530364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHewhTi8oRcJIXvkVA+zw1liGRuM2d0KooB3K/vBm40=;
        b=QPbhhY1cyMLxcoJW+ytNy6Xw58mwh9nySEd0FI1Qcz+N7zqqJY2tfoAsodAMSOYdQ+
         DhapTPYk12m+RqHLiCkNySJHRzfiXpfSgT+q62i17gyTElt8/gwN3vUckjCp9Vv7eFf8
         HN43amUqh0lc7eSmqcDgm+DmR6pAeYlOjrFwWN0dXqiFHZ7F3rhk1+403mIGFHtGznVn
         vunSIjtDD6Qixr/zqB4W/ugHXHwb0yj2WTr6+vFx3G26galrw2aE5fGbkrgNJuBV4GQt
         uUiydOT88cs93lyuYEVA5DShL+H5BBBCvZfemf9FZ1GpBrsirh/n8W7bAr2CgzSDFoGb
         ClRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925564; x=1748530364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHewhTi8oRcJIXvkVA+zw1liGRuM2d0KooB3K/vBm40=;
        b=WKHQCCb/QdNgIO0cDcmBlEAqwfMA6bVH+209VQiHq+vgfhIOxgYB3ksdvVm0aYg1R8
         otOo4M6qxH6dfq+UZ+OawN+REEgiWhLJbTfeL+9qLHJGb8Cgx/fa7HWXCmOPDAncAxyo
         cowKEEGH9HoYDs2NQftq0Tjb5zcYA9GbiYF6b+UlQw6P5GHmeWS/u1Lf/A/w7FIKTl8z
         w+w56s0tWjHbpmt4bYEHSf/fG8kj99VFDtTlO8WU/9ftZyEJOb/2OrpI1oxVoA7XtR/y
         wu2Zgt1zmLW4cY4gM4So3eQHlW5I4eEmnu63Gt4pXlniSNyxjspQZJjspjfDu5Wo6mwK
         sJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGYcTFIb4cmZUT7Fowkb6+uW8zAdSHJ7A6CzxdLv58zFA1uA8lSEtv/bSuN7355N/8tGoA1sBO9I+bJmBO+LFN@lists.infradead.org
X-Gm-Message-State: AOJu0YyGZt3Cx9BWfJuzmCoqgyf/pxw24nT+eYWl4jkwV8MtQpS00JqG
	lJT3OnfN9EoPAUQbgs70EsY6wOchKSkockEnik1sdAhBtyqiBdX3KeNhvwd31RHA2SI=
X-Gm-Gg: ASbGncs0BYT1PeDfxvROIqtcBVm+owwT/LRST+U+oxWybEbas46RL4PNwLG0REQ8vHz
	cVQNIY1FUwllVRFtlFoC4jAcjt5XsMhNpdiH0i97wJ9BIzmT7cC3xEVislZEiaJg0UnHYS1kI2x
	zVsTQWGXDwTa02lwQB3gbFoNax0zg44ldY4Sek35d61gjPxCu7ZsEBf7vd4IDqBnkHqjJpeu+P+
	g1wDRltezNtkKqgdgvxggq84hM1HOoJCn778ns1AQRBh1w3E50oAU7mxSqndncnoP1DaSCNFasu
	rMdVyh0Ta0br1wxZGW1iOdhp8tYIkylzuAPRr4C1nEQnIv3SguWUVmd3EyVe
X-Google-Smtp-Source: AGHT+IGiCydEoZVMLu1W3WpDgmtDjO4iw8qiIAhfOUPDYq6buhqSWh3dCUK+1dZ+ss9slz1KiN0zOw==
X-Received: by 2002:a5d:5888:0:b0:3a3:760c:81b7 with SMTP id ffacd0b85a97d-3a3760c82c6mr14137962f8f.57.1747925564162;
        Thu, 22 May 2025 07:52:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:32 +0100
Subject: [PATCH v2 03/14] spi: spi-fsl-dspi: Reset SR flags before sending
 a new message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-3-bea884630cfb@linaro.org>
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
X-CRM114-CacheID: sfid-20250522_075245_643780_E882EAF5 
X-CRM114-Status: GOOD (  11.76  )
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

If, in a previous transfer, the controller sends more data than expected
by the DSPI target, SR.RFDF (RX FIFO is not empty) will remain asserted.
When flushing the FIFOs at the beginning of a new transfer (writing 1
into MCR.CLR_TXF and MCR.CLR_RXF), SR.RFDF should also be cleared.
Otherwise, when running in target mode with DMA, if SR.RFDF remains
asserted, the DMA callback will be fired before the controller sends any
data.

Take this opportunity to reset all Status Register fields.

Fixes: 5ce3cc567471 ("spi: spi-fsl-dspi: Provide support for DSPI slave mode operation (Vybryd vf610)")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 1fa96e8189cf..863781ba6c16 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -975,6 +975,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF);
 
+		regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
 		spi_take_timestamp_pre(dspi->ctlr, dspi->cur_transfer,
 				       dspi->progress, !dspi->irq);
 

-- 
2.34.1


