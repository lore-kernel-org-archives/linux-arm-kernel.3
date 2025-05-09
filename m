Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C18AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMuvm3u0FO0tHSMEJjZ+2DIuKHjMVjXj0UsWrbU1Pz0=; b=vUOKITtnHDFMRvOBbvVWYrTYQQ
	PS6uULCgicXWWXqFbVNsdYWqSGZ71BIEiWwNJykCt1/eBaMAsCt1LEsAQ1g1VpPrOzUzyL0oX2LFR
	1sHXhJuDFgQmpKWvzjUqVUUMqGNcHOvhbBWzeZTXZvPyy2Xw/+P0wiVokx7PxyiyWCZ+qz1ztfuJB
	rCCXOV1et9GQfHgl+XgFHfo+s6q0dN5W3P6KrstmRvZvEMvoi+kCS39Kg2DuRFSyv1RpsmuGgTaqf
	nXzsPC0OdoiCkF5tEtRRvdY8tgs+QFk+mklJ3RenfzHP9MwA+7edmFnmxnXCMR8HxR4yQn5YZny+9
	EL8wVfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMfX-00000003YZo-0XIQ;
	Fri, 09 May 2025 12:17:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZS-00000003Ngv-1axZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ede096d73so13867675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788833; x=1747393633; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuvm3u0FO0tHSMEJjZ+2DIuKHjMVjXj0UsWrbU1Pz0=;
        b=Mx4cakW1V4G6hEOPKHsm/9KrbPTU1/wnlF0Pzt15f9PW3zQj27GwUy4tdgPTXmxvQm
         NCF/u3ftE/zKUDttnv36MsSsawE6+aE+RJH7GXgF6134mQRHHmaoWCxn8f8QRugZLUXj
         3s+dYdilUBIrYDyxKYSdHC5G2X+buGEmix33bTfKjMQiXpCbT/yHS2Fvv5XU16s6P56F
         2fBKFnpxiSEPaA9HILo+YdHo8P6CB8PuOgKc8fLyczngh6yNrrgJo252sW1jfg7XXC2B
         UWIL0MC5cyAGx198ArkQwudHha1hC82+wiazyQCwKyDEQsQWw8YDb9WShl8ZZPWl4JgE
         AuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788833; x=1747393633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMuvm3u0FO0tHSMEJjZ+2DIuKHjMVjXj0UsWrbU1Pz0=;
        b=oJxyQPyrYD5X54MTmDAX9jv8Trqat4I/wnFwPVdk7u1xW/rskO25KJMj9yyyYlH+qi
         jEI6EpG2KkAjMPmMeJqq+YRnGe63shfzIJjlvwrBklRFuhonafvPMh90MjF9MxeeK84f
         To3j4ZFf4zJJd8QyU55xKhSQ4tXlKG06OYjmTcqSJtP46wWhfgg2VO3QeGqOaB/JWBux
         rV3O4RhbxquKg61KImgT+iAJVS9jRRZEGbmxd+ur7xRc4YfOb+kE7i1jZ1nOa2bWy9l1
         9iXy8+f1eiByDAkaq4rP4Eo7vn6LvNj7G3cCRRCOuaZRIXTbC4KrMtKr7YHkFOegmUtB
         7UUg==
X-Forwarded-Encrypted: i=1; AJvYcCWMWQjdLoiyz8iHT+dnUQXAhfNnbDscX0fssdwtOhBnx5me85LyFHCiH/TYqRmUE5g8FYua8EGg0GcPLprVut5s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0L/zLQTBRHpNt6uuO5O3UrYktt3fQ1yapKWIPlC82VtH7TsiC
	CNUIEQgKNs1uFR43VALejo9MF1m+F3guPdu1KxKR2Vii8TyLm3xe8wVpaldeViU=
X-Gm-Gg: ASbGncv1YZmBk0nSiL2nqZ+FdIWJvQ5XuYWRvn32Q2FzSPSdrhtcoKjLULpLzEcmLwj
	CvXJijlLSiNWq7aZ7hbZLfOIItqYG/j0Tk1W9FVp5xDxesntzk+1qTmX41YjWc7ouGN+MR5fWG+
	SyXQRZTEGfO8BMI+4Iv/RBI/ll+m8z3yY1lcZmaBhThUhTFXf3UO5F55tw2ik0lxgksRsPA/TYo
	AXIIqwvrS+/BjmAFL9OHUPim3zwB09ANkz/5tqpELaih0CMWvIEXpzR5skh6dWx+GEKvjS71IBU
	gAr8d50hMgmaf0jYYlF5qgAfWljQzXHm9z6Kd4fSXnr8jpYeFnLrsRwBDw==
X-Google-Smtp-Source: AGHT+IEI/21cAkCpKqtXo/RJBX5fMArAhVFuko7+5QHt2vTuixWOjpsB6oyJPSHitDVLWZA2KHt5xA==
X-Received: by 2002:a5d:64ce:0:b0:3a0:b8b0:441a with SMTP id ffacd0b85a97d-3a1f643ba6bmr2415644f8f.25.1746788832870;
        Fri, 09 May 2025 04:07:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:06:00 +0100
Subject: [PATCH 13/14] spi: spi-fsl-dspi: Enable support for S32G platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-13-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040714_419963_50081759 
X-CRM114-Status: GOOD (  15.74  )
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
index db921ee6305f..0982f27a9b2a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1311,6 +1311,9 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
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


