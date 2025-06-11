Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C59C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPyCAeDwGaZFGchY0PBly99ut+lLVqj8mqClvHcxWU8=; b=YUfH/ymT6fkCY5FRn/yyffYH8l
	9ZIfKicp0zMTArcnz8TrSawzpjP0V4nJZGJ+ZwpdYuCh8QkpOuejkPK7KRp4/ab/axuJmTerLHmBB
	kYjSlxVgFB1BiqV/p4prI3uLOhXHoHuQnMnjM7HxfPa0+IivhVpHF5sYCqixBrHZl+d1DtpkIyuAB
	GzYPO3dpczNAB929fjeE+SOhmQMZ2vbpTsvAjTKS6xgcxapmxODBDJ3p5dwMfqm+tMpPTIHsumzKb
	wCuGntJd6pJpDebMlKy+OohZv0eMUKV5P90MHb2t/HEUzkMpV78czrRtVnB51liD1fGrrdm4HxZhr
	9F0heBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUuP-0000000BfxD-3jSR;
	Wed, 11 Jun 2025 23:31:05 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9P-0000000BVPy-2bxh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:33 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-408d7e2b040so190011b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681751; x=1750286551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPyCAeDwGaZFGchY0PBly99ut+lLVqj8mqClvHcxWU8=;
        b=bc1ewna9x/sM5roVBra5w5ji7iQQdK0LyblZvso84q0mbJ6lwqFezQMX9ur0GUXJHy
         MiFU26qUpmuOXtN4O/46+ULGXL+Os0pGLaH80YU6h848CTQZ5O1mwSG6XtX0+hc7uo4K
         ZntdT9SlfSy1xaVIoLlLf3GIm9JCUPpntlxjiMPMz5MFJQQqT3EIUv7EMlfNI8I44rY3
         WkH9leLFXqCCsI/Tt1HXANiJgDsTf2ZuCO0xLBnLXP9t/0Z96k1G1oPg/LIx5Bnvo0hs
         aiG4GPTYgqoo2Ikmw+xwzvZ5ESxv5PHFuFVx5JfXJfEPeII4C1dN7lOzUTKG1N1LYIaD
         xmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681751; x=1750286551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPyCAeDwGaZFGchY0PBly99ut+lLVqj8mqClvHcxWU8=;
        b=DqmZQMPs/jLNkjkc/Cb+u9bh8PdCZMmKY0ARlMtu9Z3WS0FDxc/cke5P6azRswM4ep
         zYbHMRubm8q7tpt/JoK1SKoZWQZQnzRHSdo+8ER2b1ZEfj//Qd3j07gY15Ygkb5BHVa5
         Ux7G3CrMTpEuFgdoHGAkce5wcb52Bt91lG9l18Y8PtjEhw7nIRhVKPuqb7ZCozHzYQ8n
         vMTHzQKQsDFJjs0Fezs5WANDuhGQIjIH27fviQllMmC8INOO0qNFdNPbecGJUBH/Z5Rk
         DmHkEPTdHiggWSnkRwFP0JCv5q1bnp5I96gZPMraCeBMpUuOCMYmcXziXszlk44YXPDk
         Rrqg==
X-Forwarded-Encrypted: i=1; AJvYcCVjYWyF+VJERwOe5T8L57UvCR1V0JgXiOo/gj2j/ExTmfpJ3t2ll6l3qiyZM+KDKJdMQL5r+lkGEH7NhphgHlsR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzld5/G/LAJrTJDriqnKRiCZ3aq4jxqM+ge2KYyLVlcmnQ19whD
	4X2EOOe+ADYVE9XIAUFMOb+JHjz0rzf7fgCzBTVa5oPzflWtlimWwn8SFuWc3fdLnmY=
X-Gm-Gg: ASbGncs6D8yLu3IeyGRu7rtKaJQMt9QliElXHl/l7H2P6/8zvibsHxWd5qZwLXSdEwC
	tBwLqrDO5PGpDes9ix4OkHPI4G1EmQEqHtwmap+b/By0JQqQ6kzEQ9GFzmKnFcDml7bQwGaYD2L
	T665S+mQ5tnCJBLf6s2m3O58p+f4Ysl5kXgxPati9etCJqxF+PqiVsiuIemKccmXbCKHV996EDM
	YYnaHFHL/X9n59Zg3d7/hSWL6Vha6l0sS4+wTU674f17MNNxk7H9FyYhvIB+udOEVYnyFefB5c5
	e2z9bfs4tV9t/oNPtA7DTH585B6Q6qVQOWi0Kk2nUV9nGKEJBKIZd2cz+m4uUlk3c2p5
X-Google-Smtp-Source: AGHT+IGnJ7SCSrcoLGGDHLkeFWZl+xwmv56WaGassXNMfNwjd3I20gGItGHx1iX1x1Me2SDAPUpVcQ==
X-Received: by 2002:a05:6808:178d:b0:403:3370:4768 with SMTP id 5614622812f47-40a5d05539amr3930457b6e.5.1749681750679;
        Wed, 11 Jun 2025 15:42:30 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:29 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:38:59 -0500
Subject: [PATCH 07/28] iio: adc: stm32-adc: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-7-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=+7ef0opXHNBN2h0b3NWv84zYFhgTKH377f2j3if5pfQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgWyAR0/NtALS5gQgsb6D+CiSxnqwsX+WEtuq
 AOohtpPO9eJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFsgAKCRDCzCAB/wGP
 wDuGB/sHqLC2qkSS1PGNPlHGddzhPG/h6E+AJRBdBcDq5LES75oaDoNUp8YYjpUZ8xdWx6xXph9
 6s27b8H4wFgEqsmBhgTYtnLCeP9M5musN7+TAkf6nypK2UmTcK9fbVKTFJjTfgqDI2SlJXIgEQF
 9wZZHbHDOUxdLYBXmkPZKrjV+dIg1MvgLe+f0trGAuiVHPzEXT+jESYp6Bg8UvB9t0QQkNYXnP3
 hOfcMmO/eFMS/iKbzKKpfSQde3C42a5c/GPyzIqCLxiEhPIjQobMVq3UgCav5l44eRb1PJ9V2KC
 m6/9HkniYjZKtQ4qPcJc73pexbQoq3dz03m+kTljc/9Bt9Mw
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154231_669778_2B4FBD04 
X-CRM114-Status: GOOD (  13.27  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index e84babf433853977b77aa283025f446353510a21..588c69e175f5129030eef9ebfe0eabb6412b1893 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2470,7 +2470,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
 static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
 {
 	struct stm32_adc *adc = iio_priv(indio_dev);
-	struct dma_slave_config config;
+	struct dma_slave_config config = { };
 	int ret;
 
 	adc->dma_chan = dma_request_chan(dev, "rx");
@@ -2494,7 +2494,6 @@ static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
 	}
 
 	/* Configure DMA channel to read data register */
-	memset(&config, 0, sizeof(config));
 	config.src_addr = (dma_addr_t)adc->common->phys_base;
 	config.src_addr += adc->offset + adc->cfg->regs->dr;
 	config.src_addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;

-- 
2.43.0


