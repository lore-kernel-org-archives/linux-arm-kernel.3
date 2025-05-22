Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA304C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=; b=iHUfblu+H2b5NgHATTwhh+oGf+
	BmVz32QNPnCCf8kh+ReXK8I3MUDtK/8Pe5Uf+O8uQ6pJHy/U5GVMVMe7wN/sAQK2n7SJ9BcIFnHI9
	/1ob2QQJerc5u6jwrTUOfsw0DTqMb+ParIqQTwMPkNSH5EH51Sl430HuiCmryTTprCrFFc52hPZm8
	cfcN9Z7hu2Fa1bAce+Jggs++txJdazsl/ZsHwfVavNYX8rP9p9Nh60irPnRq5mjEnzHgVKWDFDwVo
	8NJ7aiQstdgFBwbbjvGJNruFcDP7zT1plW8GvM+47JAxVB0TnVJpANlQbCm0rAgH7ne9csdFT9SiW
	v31Df1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7lt-00000001Qtr-2poK;
	Thu, 22 May 2025 15:23:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hw-00000001KWo-2ELQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so89821995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925571; x=1748530371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=;
        b=u9hCIozalquJM53cpv/zuD/izU910qZ9evjc7rPgjHUe3TziIt7t44sghRacBpH7pQ
         /WeqZt6Ai7XMhxJoi/xYGLhR19qFBNPPz4qQAtWmghs3Qc6x7LHrlm1ZKtJXp6einmHK
         hkI5s3lqeeiSX6btHiWx0a4Gec+XGtbopqBp/y2efjAs8JW489vApt0I3ps4gE/I7zrq
         2t7Uy7p1qrjxzSiZN4Inh65m3LTi9haw5owPKsjYfT/f5rmCRaO/HR8Njncn7JH0phZr
         UUgxMOZOPguiZ7lYcRf2DJowbKTlwJfG8/yhTTiOlqGcuihRk7gAXCUeWHNT7Hke8pHL
         xYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925571; x=1748530371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4sEJM+871Hq7BueZc9qSjjVinOO/X+0tYY6aaq4Jkg=;
        b=AtQmKQokn3Cb9ZNARgBX1kOm5Kwb7coaUCsLUi6F++inyRE3byzroM1seT60jugk/k
         ACw+VCkyzBVmQ88gtpRnqtQ0ICov0/oeqLfVeSaPH7KTcV4Pyq6Ksp7Y0WFQbqPIsBoW
         kWBTcwPGLKv7OIfYg/X+nGEm94UVeee7K7I33PEraR13XzHH59pAQ9DlpuvlYxFfCoQ7
         sk0ADstq0wNMNsPnROi6UI0DIdPHrmeZd7Wq1DWKKJRJMF0lNGueHBma06R7UYvtGG8D
         Hp+jFShbehduWmtDDYrGQigrtYzQGyOFVZ7lDuTYnKFIeiz1vXqv7RJRqqUUQ3rgi8kb
         7q1g==
X-Forwarded-Encrypted: i=1; AJvYcCVVeQtjbrAfdBgXM+zifhtCX83tTKDM1OFJ5PVMg8HrmupK+i/voOcy2CnxQn2K+Khl9eLErYHF9qtOievFsXnC@lists.infradead.org
X-Gm-Message-State: AOJu0YyOhY2sQ5bATDsOR6foq9U0qWym0iC7tU8n7vCFnvXkRngn1EXV
	grFqiW6yMUxMGHfSHdoECmcngWUSPDEGviT/rjGqCOeQk+l4tkcXig5voIZjq4hhCgk=
X-Gm-Gg: ASbGnctEywh+bJu01lRml8NZzlonrOEFPlKZ0y/kca7XnUtRk5hkEZNRlWXPJtgJ2Nz
	hC3iyoaBWWBkrTyTbUTTNhbeEkSToxJRIdFrB8KuSKJ4qwKhMTBenEOlZOz3A4YKEWNLG0uzcx8
	aylBu/ofOJqXdmbwL0NuabPVGnacm+hFTRy2a0xi2D550aAMTV73ZFYwtaASG6aQNy4mEEcFNnn
	Y+lQJu+xuMoFnGgSoW40CgPerUSozAvJcNsiVOz9lqHp4jsyLrMT3N2kpbnks7acUkXYQX+JUCY
	dzjG9ZXGQRmcA+AIjwhGTp0SKW+CbiCoFq53hyS9onPMKWas2FRL3SJZWRn8
X-Google-Smtp-Source: AGHT+IF7HwvFx4mEXB3EyW4Q7v2VjPs8dvE+4oPy+CvCTPqUtNiIogBefTp2+DWncfUrub+h4prcpg==
X-Received: by 2002:a05:600c:3d8e:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442ff031845mr220598755e9.21.1747925570681;
        Thu, 22 May 2025 07:52:50 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:36 +0100
Subject: [PATCH v2 07/14] spi: spi-fsl-dspi: Use spi_alloc_target for
 target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-7-bea884630cfb@linaro.org>
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
 Marius Trifu <marius.trifu@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075252_575542_68A567F7 
X-CRM114-Status: GOOD (  12.41  )
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

From: Marius Trifu <marius.trifu@nxp.com>

spi_alloc_target should be used for target devices. This also sets
ctlr->target automatically so delete that line.

Signed-off-by: Marius Trifu <marius.trifu@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 10e511ba1cd8..814a92b8064e 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1366,7 +1366,10 @@ static int dspi_probe(struct platform_device *pdev)
 	if (!dspi)
 		return -ENOMEM;
 
-	ctlr = spi_alloc_host(&pdev->dev, 0);
+	if (of_property_read_bool(np, "spi-slave"))
+		ctlr = spi_alloc_target(&pdev->dev, 0);
+	else
+		ctlr = spi_alloc_host(&pdev->dev, 0);
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -1405,9 +1408,6 @@ static int dspi_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "bus-num", &bus_num);
 		ctlr->bus_num = bus_num;
 
-		if (of_property_read_bool(np, "spi-slave"))
-			ctlr->target = true;
-
 		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
 		if (!dspi->devtype_data) {
 			dev_err(&pdev->dev, "can't get devtype_data\n");

-- 
2.34.1


