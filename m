Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE099C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 23:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=; b=2w3pBV1eZb/USXcJxoggbHVkY0
	9T0xjOjS0aOdqVcpB189ItbcLUcWrha2oOXpN5KSPcNYtffRfYmzGBJoF9mLPGJtQku7tplY/GMIv
	l0pWQyS9gHQKpdWCojv2w27mNXLXG6ZfoC3YHFbBr3D/ggl9Roqs1JlG4/LnYw7uWQ4vZD03NyGZ5
	9sBQNH4X/slMNpVOqXuQwHAIhkLnDjAdmfkmP1zaWLED97pYwCWcBbyvPa/9CNhU2xbY8KRGW3MI8
	ANRjB4xFe8erVlJZtI1CXovfQUbnSz4mDY5/adpWh77WAGqj7DvThqINzV+Dz6jmxKCHJ306EookZ
	EgY6l+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubowO-00000006OEi-1zCG;
	Tue, 15 Jul 2025 23:20:04 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboec-00000006MsS-2rYT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 23:01:43 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-41cd87eff4dso202836b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 16:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620501; x=1753225301; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=;
        b=h69pGpsjDXkGGwpDhy6b2LDg4M0XZiYtvO5v4FKq1oWFKC8i3pii81tT3fMVx8XGDi
         XqwHjvqqgG9qxeBt1lA91+Ny+zk7wcKNsOLC2Zo5rwdaw+Cm+1vhpW2Ua+RukfCcUiEx
         2zgmrz6zLYUcNs7o2SQB5zI3vAE81LFSX57BJJ2jCPZXG7SHRuULwcWOeTkbKnEy4LnV
         jZJVsXPhQO3Prs5aROOGxe6Ve1UJRNRY+lylxVMEsEQTgVlFsyb+zb8w7I8U53e8PGpE
         TAGOV8gIBUoDbnM/aNC+1PEzdbSSftmh9la0HUHNTyz0nwhWsHdntjO2bvaABfuI2nNk
         v4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620501; x=1753225301;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=;
        b=Loc/pfzMmreemXLP8zz/oHej9Y0hPimOpN9NzAtveRiwOe8k/cA51xlhpmdjscrtZB
         4El1dPsschLNehkX+K3fBpNU23KcwplNNzHEY32PiJ0kNmtklhokOHi7hBBRsonsqVoP
         e+Y8A2z7ds1HbOKkbcEWMYrseAlQ/AX5WPddxQ2uVXrWZUJLnwUGW6Iwqi6S5DE9+LP9
         FAIxBU3PMLMZJB0NRm4/y0os9lRqIwBhVl5XQkAAU8LO2oz5Sdy9BiOt4h0fKFdklOve
         E3ZURrRJetrknu9IjMIiJCOG+7uU0fxnlErVBoSLnnJCO2sxFTzpaFwcMMMIx+/WWBUD
         ySJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2qejzv+zG8ZkS7T67ir5uTlyvhW/NCGScBaNvMZ40TsYVWoOuhGosu845Lt/oZDwIY4ZNb5S/v30ddQPnMW19@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6RizSSyRNUeZh+juS0MyAzBhtE7nZpvntIP7IQRkChWKi++S7
	0lMZ6BXbNzBQ35N06xty2mRaZWd49kYPJ/8JfhCW88KstadRIbZRBxddbJSEShgUfNw=
X-Gm-Gg: ASbGnct37cFtd9A8DjCTDcEPXZ6ao8nQ+MXcb52Mj/ykPsNqWyQaua1Sq+ia81hasqf
	DXsZcEX0D5jz5pmPcaGMLKjc2qj/h15dvNV0+Fxz5Ak91hz0iGx9Eoq1FAvKjHdDyNkM334KuVL
	rluJt97ulMnRiHNx1E8TPgSNoTTzCZg9vXiDO4NFSHwpmu1a5Gev0i29SSb4a6iXCi68Frzx0QW
	+xwjWb61sTwKavZYe1CCRJl9qN0AsK2U73Askomnkk6tW0mQTPwBjiYW1/9FeBYM3uGqW9IU+et
	C8c53VHE6tiNWXAlLQM/JPeLJSN82jm0RL2G0uOHgtELYVjMPeVBH9HJPj4uNafkSW/MgG5c+CJ
	vKP0b5VkUvjF8Io7tePXEZpQUdiIkq8Wz/kRPdSI=
X-Google-Smtp-Source: AGHT+IFrIo3qo3Xq7DrVRugRg16jg4aCYHopevdB0f55AiC+g1RwMciM6Lgy4L9vDkABRNtjnbIHXQ==
X-Received: by 2002:a05:6808:30a2:b0:409:f8e:7272 with SMTP id 5614622812f47-41cf0cb0f3cmr543563b6e.38.1752620501381;
        Tue, 15 Jul 2025 16:01:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41c73a25f04sm457282b6e.0.2025.07.15.16.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:40 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: Fix NULL vs IS_ERR() bug in
 stm32_ospi_get_resources()
Message-ID: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_160142_718458_68586B17 
X-CRM114-Status: GOOD (  14.71  )
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

This code was changed from using devm_ioremap() which returns NULL to
using devm_ioremap_resource() which returns error pointers.  Update
the error checking to match.

Fixes: defe01abfb7f ("spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 72baa402a2c3..f36fd36da269 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -823,9 +823,9 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (!ret) {
 		ospi->mm_size = resource_size(res);
 		ospi->mm_base = devm_ioremap_resource(dev, res);
-		if (!ospi->mm_base) {
+		if (IS_ERR(ospi->mm_base)) {
 			dev_err(dev, "unable to map memory region: %pR\n", res);
-			ret = -ENOMEM;
+			ret = PTR_ERR(ospi->mm_base);
 			goto err_dma;
 		}
 
-- 
2.47.2


