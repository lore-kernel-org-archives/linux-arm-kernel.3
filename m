Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36249C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Wl7tKpwKeYK8cvnyb6x9sT/UwWoYgOB2ZsNSDFKMQA=; b=SBVqwsFHAXm2mDAj3QLpbCVxQW
	vtO7zKT5Q9kcEPJ483PBVbwYarcywK+dRAhMBydmOSGMJdgQmGb80/pg7RIdY3b/bnzCQCz1SsM4h
	GjAhRI+acibDm9dSck3X8KBH6q3nVe8tCO8DJOJpR9PTbaHCZriHlYD236F+eGVrKALW9prOjBr9S
	LsIoFtGe7pIliTgZEhoPhCOpfuJG7km/umdb9yCGBj1ZldInoY75dy7uhh2irXm7i+U8mS//kLuGa
	XxYOFyuaHbERhJW7s2erO9kUeZjkWqiiEVLfQlMGY/5cNB4oltcHlzIlDBWOGF+x8EfJFdc/mZwxO
	hIL7i7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmNA-00000009VOX-15Ja;
	Tue, 14 Jan 2025 19:14:44 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmLs-00000009VE8-38Dl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:13:25 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385dc85496dso290316f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882003; x=1737486803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Wl7tKpwKeYK8cvnyb6x9sT/UwWoYgOB2ZsNSDFKMQA=;
        b=JEJFEY99XeS0/P9Lc6hu3XIko54+sY8gB1p8FE6jKvp65GIgIT/QSIMpAxHGX+2tpL
         tjmEUVxoXprJ9IzSg2otHEo2Qph+U/dVVKmwzY4RyETK2knrzNjD9vlZaVmKbYKKJ8rc
         p04jc5wocvqp+dZLerSicEZR3LIVUw/k8535mHS+ZnW5ZO1vnFXgVB2DEWbikTcSdOPa
         a8Gb0q6RPhiZMSLXMOIsFdDsgJUKFyIVxFMs5SmPqy6Cg6DAOhAd+9sd/RVqSnP8ssnz
         ODCiyqj4To1M3ICx21HneDueTmZbRPEUr97HF1FqbUEEg8RGqllEXh/U9MPnZ59kdoCu
         2zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882003; x=1737486803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wl7tKpwKeYK8cvnyb6x9sT/UwWoYgOB2ZsNSDFKMQA=;
        b=QUFd3UJIlzoRp81EzeznkOuOylktg2YvR4TOiJbnxYv5jsmsf4B4uUtaWFCaI42DKU
         SVQgcc49oX+tys6YqslTwZgcoypOBvchMFfkroVdUceu4isVu2yfA/q6ydlRdZuCy5IR
         0MBKkvNy4ePIlTQ6NEzs7Zk8a0UJIUXW0NEMP6caPZ3Wh572teCt7SwdBbP5T7/bN6dN
         UaRho0idbZ3dIX/rlBXOtVTfwSvm4PfBUpRNwdgY9ktAvkJYlO51HxTk2ja6Jr/Ls2vz
         6/6urzF/qgLOsHYMXG8qZpu7GLWhrrLNmbZpqCQXwDgb+8lZLiWrYFGsZ2o6SL9V+MzR
         Y3aw==
X-Forwarded-Encrypted: i=1; AJvYcCWGGxUgfvL5dYFafB+5B9sJijr1rGLOS4DFqDwkQJ7XezVU18KIfCZSrBWyCQOEF2AZ4X8WikF7soZrz9FQr9So@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3oQIPUaHPKF0zPQc56sZcgf+yvmZaIegxyvZp1PzV+oq8+RTA
	tJwjN3ZZLfFV9yTSnuRxZpGs7rEPuLqOVVbRtKpscP9NN3Vr7DSCfLw65edOYMI=
X-Gm-Gg: ASbGncsFoaQ0vfGNHTTz5bzsT+1hyp/IFYNgVUZNQ1E+rDfwxiScxNdMTbMzNLqAYB/
	DGRQnWO+x7xIf5SxlxWZzvqf53k56MoJ9ylZQcMUeDK67Rly2UrLn2T0KEZSecbysNY2PXHZEKk
	ddRiwmRc1op6XkENXKFml9l+6gS7fxnorYuPxc6nliKQYoAYhkO1J061+GdnpmEuwDjN5rK/FdQ
	CPa75wUTnQxsfKQ5uboMegPEhZoFNGW5esID510ou/aspl0cCjLmD+JPdL980rySDuVvrQ=
X-Google-Smtp-Source: AGHT+IHcdisH2w41GtL10pQD5dU9j+js5oAERihWoWX2WfAm4V/01RG4LlY7+mTlTx/wiFlkIv9Wmg==
X-Received: by 2002:a05:6000:2aa:b0:385:e10a:4d9f with SMTP id ffacd0b85a97d-38a87088249mr8578870f8f.0.1736882002698;
        Tue, 14 Jan 2025 11:13:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3834a6sm15508266f8f.28.2025.01.14.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:13:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
Date: Tue, 14 Jan 2025 20:13:16 +0100
Message-ID: <20250114191316.857154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
References: <20250114191021.854080-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_111324_788490_56CF52D3 
X-CRM114-Status: GOOD (  13.65  )
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

The PXA_DMA driver does not include any asm/mach headers, so it can be
compile tested for build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix subject typo
2. Drop () in Kconfig
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 8afea2e23360..df2d2dc00a05 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -546,7 +546,7 @@ config PL330_DMA
 
 config PXA_DMA
 	bool "PXA DMA support"
-	depends on (ARCH_MMP || ARCH_PXA)
+	depends on ARCH_MMP || ARCH_PXA || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.43.0


