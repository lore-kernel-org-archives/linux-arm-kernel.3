Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E509C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=; b=rv1lRBbnVaYTHBt4n57wGb9Lg9
	6H+s8dRUunEyaNaFWt0JDXmmHFFSN0IoENsDPkekdH2egI7viWcNGSNXNttWDCvU8m1fD7uXb0IGl
	t3P+90vO9JNPQrWbuJKRfK/IP/+1waRE7mSEVqORt1QMMgUS2fqCTtlO7fYuhzDWTA6rOByNjMP+V
	yg6PwKLzu0slT0ErX8rDPV6d/jO3HYiBYGiEDb7LKwCZXJO6MLdrWO86YGB8MXTrdJHbFxJUL7206
	U65Vhe1i6PhK4ftvZwKxfUjan4DE6WTowJFnvJHpQm4vlr6MZ0n3G9QTwhLekeO0x+QVjMWJton8w
	DucRQJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7rt-00000001RYs-0BSz;
	Thu, 22 May 2025 15:30:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7I0-00000001Ka0-3jYL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so60230175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925575; x=1748530375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=;
        b=k+cfOfQOLmbBn1cDNMGIRBBu6ZUJJp3dd/OMrcIvao6uK88QoPpfgUqEsV4uJOcx2R
         a6mIjy4p432thtSJzRmWMogPSSA8J6erQfHNWiF2DK66xDKENSxfkam35B5/uO8/J91Q
         sLH1DdDdZJB3oRUrsThX2uXQo8xM+HhF0xPXnD+6CVLmOKXQl8ufV9ISdRU9jgb9Q2lG
         SOyfdx4230NZvKIdxoNxizMfRYPAaPQmfPtfTJ7sJL3r2BaxVkmxdStObUM+1iKolCNb
         Ts3h235LMW4OMCHDsXyAqnPfQL1QDwQ7NM+hA5EfmmLfVAzh8GGIP2gJyRKW2B2VJwru
         Z/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925575; x=1748530375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=;
        b=IjrvnnRcq3/s+yAiVbxbEiydrmgnpmWLEKOuweZIA1aWFeMHbx0fadADamJs9QfFu+
         Rqk1IAVuLwdJ1FKx0mXhZhrmNSulNPrp+kAbK20WAAwYJmgbp8/VAnGNhRzP+1YO6TcV
         fVplT0/Qr0eqaXpAUmnWZituYeOxaaDlaTNbwwgne8Xm3fwRdJm74ghleLA5DCqPMDQv
         RZAD6S9QeSP3uH0/TI0MP1bRthq3wzLOY+ux8xxEykluGRkjEnL0sbo2MtHxQ9bicoMV
         +5eQiJXLAfoJC/qrXkf42NjlkUV8XAnABl/sf4KxuaMaMahSBOTJjSYzwBUPFc3dS/Ft
         tGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0S9qa6hTvMsxg2PNqPVx/rf5kfijfncOt4cVET79GSC21U9D1nRe/5ReWRa60BD3eHtIc3fi5Wyxkmb6YtZy4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6aLuFek303Xnch8508M5AD6QqQBSvFxNcIH1hgUtns2I41IKP
	Gv3kgiNNBMTA0ARfVXc40KwvGdikSXrXBWzxYW/haEUGlQafQyJGruuQ01ysJn6u2Zo=
X-Gm-Gg: ASbGnct3s4ROGYU5BjDjZdY2kGdtIwImtUjYyF+pdl9YkRWTB4SyEb5ux9jWA1RRiQV
	/Vb+wUy3PmajGsGJfINSoRZow3hfur9j3YY6CtNKotDzpKLoZ9Oc13KJIUpcB4/Wlm1PNdx1467
	4Ec2yULXT3VIb67gI7HP/hhfKAksedBvDYnTyb72SpM3IAzn80ZqGCIPbrhbXMNJ5unPY8WBa9c
	auOd8pakCuN7bi1ePtcnp15/3LpH3GiLEPzyZoTgtsbrFKs5KNpgptAdJ5MsPcglPPvg9NLvKCz
	TEKnovkYl9nWbMr4mPMIN8T/S9V5OFYKulOnbL0mnR0QSlubszKys/pzpZqB
X-Google-Smtp-Source: AGHT+IHpujM/0/34jM6P3ZaQZmGH/9lm4oq4PRVyuyvqdp8HN5RGOmpnF0//KC96gVkhdqXMaCEYdg==
X-Received: by 2002:a05:6000:1889:b0:3a3:7e01:d2fa with SMTP id ffacd0b85a97d-3a37e01d307mr9061150f8f.28.1747925575135;
        Thu, 22 May 2025 07:52:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:39 +0100
Subject: [PATCH v2 10/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after
 resuming for S32G
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-10-bea884630cfb@linaro.org>
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
X-CRM114-CacheID: sfid-20250522_075256_934238_C7B95B81 
X-CRM114-Status: GOOD (  13.83  )
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

After resuming, DSPI registers (MCR and SR) need to be reinitialized for
S32G platforms.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 77 +++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index db5a2ed66f68..a3efe1bd3b37 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1284,41 +1284,6 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_dspi_dt_ids);
 
-#ifdef CONFIG_PM_SLEEP
-static int dspi_suspend(struct device *dev)
-{
-	struct fsl_dspi *dspi = dev_get_drvdata(dev);
-
-	if (dspi->irq)
-		disable_irq(dspi->irq);
-	spi_controller_suspend(dspi->ctlr);
-	clk_disable_unprepare(dspi->clk);
-
-	pinctrl_pm_select_sleep_state(dev);
-
-	return 0;
-}
-
-static int dspi_resume(struct device *dev)
-{
-	struct fsl_dspi *dspi = dev_get_drvdata(dev);
-	int ret;
-
-	pinctrl_pm_select_default_state(dev);
-
-	ret = clk_prepare_enable(dspi->clk);
-	if (ret)
-		return ret;
-	spi_controller_resume(dspi->ctlr);
-	if (dspi->irq)
-		enable_irq(dspi->irq);
-
-	return 0;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
-
 static int dspi_init(struct fsl_dspi *dspi)
 {
 	unsigned int mcr;
@@ -1354,6 +1319,48 @@ static int dspi_init(struct fsl_dspi *dspi)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int dspi_suspend(struct device *dev)
+{
+	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+
+	if (dspi->irq)
+		disable_irq(dspi->irq);
+	spi_controller_suspend(dspi->ctlr);
+	clk_disable_unprepare(dspi->clk);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dspi_resume(struct device *dev)
+{
+	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+	int ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	ret = clk_prepare_enable(dspi->clk);
+	if (ret)
+		return ret;
+	spi_controller_resume(dspi->ctlr);
+
+	ret = dspi_init(dspi);
+	if (ret) {
+		dev_err(dev, "failed to initialize dspi during resume\n");
+		return ret;
+	}
+
+	if (dspi->irq)
+		enable_irq(dspi->irq);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
+
 static int dspi_target_abort(struct spi_controller *host)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(host);

-- 
2.34.1


