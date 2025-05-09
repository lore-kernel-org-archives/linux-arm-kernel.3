Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6321C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=; b=wnk/WNXLMxIBXq6gbY/5kk8tDg
	hseGg4tMQ4DjAC12it76T1RA18KzZQbumaOth48vDKmp9p3NVqLDI3XehasU/+4Wp8LjHrm1HjZeW
	BMTeUFCgCkq3cBmAzlBMX7YLOYLpw4+6oXpWJ6c9mEqZZuVc0fxDeUah0oAGE3I1IHSDI0nxkWEO4
	6c0P/QEOpCGt5dhF/wn3VAj2xhve+hpAj227RPBYynjaTRvuZl2caUjikqpu5KrLIxjqm1isJn+Uk
	vSelFzu04vZXAlek538BIcMvq3bc6Qq6++OFnO2puBUi7KOOBKM6orJkeVk2Sg2s0eL45kfA2KjV6
	KwjqBpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMTx-00000003X8O-3PAT;
	Fri, 09 May 2025 12:05:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZK-00000003Nct-09hM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so774518f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788824; x=1747393624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=;
        b=zH7O7aHi9UTIijIRIOlaPdb2p+3MdK02S0Eu1TLKRkKdWJnWmiTJuSU8AxLC7pE/25
         a3imBj52fklHQCWUBu215bAUTGAKmsnsGRMvKNNxUrdxwjeyiNLJp5ilNwYTYqWCo0hY
         2O1MhzsfEOOODyu0GWlwccVOkGCOe3ZWnXQRIyjVMmcrwPL3wfOne60OEvgTcckkKsfr
         lGk3bRhcPYmj5EGxoIiuOog6CVWnELHWxQN+Tow5FZ9Ax4YB/qOnFw7JoGOHALefvue1
         AHAcG7Um54t5YnEyVGqqjMTrMpJqkl3R70u12xv23Y+zY+NM8EcxOCYI8IMEEVnoKCpG
         5g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788824; x=1747393624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=;
        b=T8VWwQXMMTAEc7YVyKTgRFb9YaVRaBXopcz6ysH2uhHKj/OdBVLs1rvrpxhrWsnDts
         RGdmOv+ZP75UoTu9otYi/g8zdR+tj9F/iEQToJugr8zk1kY6simKLu5vT4Sb+yw8++eJ
         nv3ciHKdF8BfRllXX2+b+I2Bdfky+RtGqYmPOgAWAGaLfmQaxazh7GAnSeP65CsPKzfC
         CzYW9BNOLsvnJKDIDtPwyovCLYuZ7U2/viIr4ATcFEINJsCZkYq6N5xUzXifJp+1uh/L
         OOcYJt2RlT7x1+ehJ0Yh2BXiRMvJvL4nUNHTw2I/AA7jdo1AH0ooLJqlUdN2QN5cMX3t
         Gegg==
X-Forwarded-Encrypted: i=1; AJvYcCVUSko1pg7wqYRghi5D+Od7uqt0aFFNJwjJ6WOm2+ZKed7sHb6c+E8JLZ6PcTAFgISvnrwQdT0PGjyspPpEHueJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwLH7aO/HS4sDgzxJ+/RWW5lsxlkbtrWXkuu0zSz6EkwkJfPUDd
	/p6lwk/JDWbyt1UkRR/JUhw64khyyh9jFaXChANNxBIF6LzFrQXZE3yyKSZJfSE=
X-Gm-Gg: ASbGncsXfa7YrYXT6IUy2Wgde842xmz20G93dm0SjtRtAxFJ35swbFbQt1F/LuwzYIf
	bekyxtYiBWU/W71mF58P1f/PzaSO0V/U8Rh7x5tw9pNIq8ZwTwX1G+1mt7kHEYwQ/qMyVdFRfce
	LXmmGBvFAjf3xJ11b67W6vP2L8+H/hHaItA34YK9rSl2jz6Kk7UaKPAoVSpZ5EhdJ3vI7x8T4n3
	COz1zlRo3+/3vhc8s2S9RqMeumNP+Fuv/Bcc2kcYjfEhe3O7KtY/CUCSQEWOtkUUgpCtuO/Zya5
	kvpz5QtwRa1E4Pyd3OZeUhbSiq9S/lXrgWwQJVdfpvcAwVE=
X-Google-Smtp-Source: AGHT+IGt4VaJbNHq9FNQxWvc/835NhTOA2iiwAH7rDv6mlJrY9Iqd6PFdsksfuN5qOW+kOzhHmEEPA==
X-Received: by 2002:a05:6000:2404:b0:39c:c64e:cf58 with SMTP id ffacd0b85a97d-3a1f64ab930mr2978779f8f.55.1746788824315;
        Fri, 09 May 2025 04:07:04 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:54 +0100
Subject: [PATCH 07/14] spi: spi-fsl-dspi: Reset SR flags before sending a
 new message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-7-32bfcd2fea11@linaro.org>
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
X-CRM114-CacheID: sfid-20250509_040706_084376_6C7BE87B 
X-CRM114-Status: GOOD (  12.21  )
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

Take this opportunity to reset all Status Register fields. This is
required for enabling target mode for S32G in a later commit.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 902bf23d276a..b7363cfc649d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1063,6 +1063,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF);
 
+		regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
 		spi_take_timestamp_pre(dspi->ctlr, dspi->cur_transfer,
 				       dspi->progress, !dspi->irq);
 

-- 
2.34.1


