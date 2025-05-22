Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E31AC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=; b=GtG2xZZC9ZTaY67R6Fe0oms3as
	ExDaGoq+2lHLTChHlvV4rorkHlC8bpGFpFf2SXiTrW+sfUyeNyeDWcFjUU85UQntjKPhnMyb99lq5
	sydfHCjTn7AUaVzLGmn+BcUBEQXa6mYh0b3Y/JhVbO1NLQ3nO+q+FqOqmj6mOyv/GUVZbGYuTRH0d
	wKIlz6g27/qnerrPGLnfCm6d43WojACpLPAGg78qpen1HhndgLO5IKSi/4xZTCNAOXFbHBxHtiEP7
	rTFAw+uTywYIEbusZxwSlFNQNyZ1QEe+nd2xaMBj5KnZsm4M57szm53keyD8DGGWWSoEHMiVVXXZU
	HFtFyvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Zt-00000001OdW-2u03;
	Thu, 22 May 2025 15:11:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Hm-00000001KQz-18ch
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:52:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ede096d73so60189905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 07:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925560; x=1748530360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=;
        b=gTbC5+fXoQoEYjC3bEWsTVwcVQwxzn8RbjKf4Ip9ItY62Od+pORaOEVwagePPgLynQ
         7rlc3fobXzogpsmk+OpJNC76SYmn5jeiCh4QOcro+zOEJ/PEK+OdiSm0vfu1XdJZYtPv
         ktxP+OHHObVXrVowPvpsnb7uZuDspO3/qcmMQ1zQN/EVVL6U7AjkWOOHr5jOr/COFWXT
         meokX3W71jlk6zxs0IRKcg2oo4T3naNbdp/DxvslAj9CHpTh4/9U+rDAw0vvW26HVVso
         fPfP2bf1pF+0TZ0/IWdOMxHVhPQITTGhJotszgKN+ooJPNF13STQVIKfWAGKXJOelWY9
         9vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925561; x=1748530361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX8Np3nsOAVhGpGTczqX2XujPUCRtkdhb7ZQQUV9YcY=;
        b=mnKTxemCP2cAzPQr9qwU9Q1N2eJM9/TZdlar9ML95tQ5Sr5Y2b4SCyQsPsGsuYvgoH
         Yl0hzYk4w2MtVAKWXpBaNyf7dEwRAL6DCYR3J28DXtDlW7ca4ZvDfXM8/TezmhmnriGt
         B5OGWIPgflUHL/pQn68deiBJQE/A+A47SMOQPlzuk4fYBbCOLYu4I1V1I7XmIrxZ0gL1
         NW6c4oxfKM+ij5b3NfzD78fLCtqaFN3iGX/XQuGafmT/YZ6QOSmNBs2hXNJBBGLY0B6u
         8kGV0WJ/UquUTpGLHBaaClnTLd1LG478stgfWEaqje0YqWPeMDJsI/yfbQKVFDZuyrwI
         YOkg==
X-Forwarded-Encrypted: i=1; AJvYcCVjYguLJzXEGra6qycotijhitzHGns9haJBxPL4dK+1vy23WpnPtjhZ1XOHgHK2OR8AV29aJ45bUN0xGoy1/tFk@lists.infradead.org
X-Gm-Message-State: AOJu0YwTr74Z1+66YcqhCXTR9R50jdLeogkNkHgaaEi/wwiMo7tlCWR2
	0K1mH89c88OX6RVU2a3ql1NV2mHMR8wsdcpZo8VAEjvMQ2fdBmNvQe0ubkJPp7Gv7AY=
X-Gm-Gg: ASbGnctr6PDdLqSUFURZk3yMbrCIHBiOTjJOLbgz6A7AnxiLujL+a5VkMZbwoXzl0ok
	oBvMnIrlPA/od6OhAv0kerCc4mEFu77E83MNlPi28qYvUGfZ54lCTyKQ5ax6DB+MxSwRe/OBujY
	Ry8FUJiN1nZmPP4ojp7s2vTVin/yoBDBm6JkrvQtPoQk2MTBTyqVp9vCBiTu3COJHuos4bCalOC
	FJ/+QSIrMCkqFfivHR1ayCv0X3C/LXj/nukgexCwyRWn7KxRY1EP5Jjk5zx/ydK8Y7Il4cPYbNp
	orqTd5Sj0y7I2HU5fdHfWqHRCTxvuL9dm7s9UM4H9Ru0N9KvET0i5aa8sDuy
X-Google-Smtp-Source: AGHT+IHkwaJ6gHJgvWiPzVxDv2dV6i3HHkhWCA1c5/mCAe/0o4MB5fUJzCgJeRD5hGESr2V3uBRYRg==
X-Received: by 2002:a05:600c:4ed2:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-442fd67504emr191953925e9.28.1747925560426;
        Thu, 22 May 2025 07:52:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:30 +0100
Subject: [PATCH v2 01/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-1-bea884630cfb@linaro.org>
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
 Xulin Sun <xulin.sun@windriver.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_075242_315959_E44233BC 
X-CRM114-Status: GOOD (  14.27  )
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

DSPI registers are NOT continuous, some registers are reserved and
accessing them from userspace will trigger external abort, add regmap
register access table to avoid below abort.

  For example on S32G:

  # cat /sys/kernel/debug/regmap/401d8000.spi/registers

  Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
  ...
  Call trace:
  regmap_mmio_read32le+0x24/0x48
  regmap_mmio_read+0x48/0x70
  _regmap_bus_reg_read+0x38/0x48
  _regmap_read+0x68/0x1b0
  regmap_read+0x50/0x78
  regmap_read_debugfs+0x120/0x338

Fixes: 1acbdeb92c87 ("spi/fsl-dspi: Convert to use regmap and add big-endian support")
Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 067c954cb6ea..effb460d436d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
 // Copyright 2013 Freescale Semiconductor, Inc.
-// Copyright 2020 NXP
+// Copyright 2020-2025 NXP
 //
 // Freescale DSPI driver
 // This file contains a driver for the Freescale DSPI
@@ -1167,6 +1167,20 @@ static int dspi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
 
+static const struct regmap_range dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
+	regmap_reg_range(SPI_SR, SPI_TXFR3),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_access_table = {
+	.yes_ranges	= dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
+};
+
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
@@ -1184,6 +1198,8 @@ static const struct regmap_config dspi_regmap_config = {
 	.reg_stride	= 4,
 	.max_register	= 0x88,
 	.volatile_table	= &dspi_volatile_table,
+	.rd_table	= &dspi_access_table,
+	.wr_table	= &dspi_access_table,
 };
 
 static const struct regmap_range dspi_xspi_volatile_ranges[] = {
@@ -1205,6 +1221,8 @@ static const struct regmap_config dspi_xspi_regmap_config[] = {
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
 		.volatile_table	= &dspi_xspi_volatile_table,
+		.rd_table	= &dspi_access_table,
+		.wr_table	= &dspi_access_table,
 	},
 	{
 		.name		= "pushr",

-- 
2.34.1


