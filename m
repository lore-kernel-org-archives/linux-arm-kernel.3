Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5824BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3rqPuNp/XAiHwmx1Pu2LDapqHlVBx3ScWZfxCOYmYA=; b=g0VJsPqHQanvjM1NSdlz0yDu/e
	QQ5WVTUe5sTLXTn/jRfEXHyuyVXIR/Npdrgg5v+fPLxAmu4PF3iiJBGzSGWPqGIBJT5FEIwtKDY9Z
	L9M0gzHbFSijUkuFXuAje72al/Rbgz7UT7TYN1h7Pwjg4W58OJmbl/OFihmxJ9n28xOJoWPv0uhLo
	FDhwElJ6nM//SdltCjvnbleiUuawpAf4yf45BYOF2dYDWPwRcvmFjTaQqshO2i7AvyZKL3BPjQSmr
	NfBsiRojOYH15AJDaj5TmCU10ZlVxhNV7xh/o8WU4NvVbheVwTuSZ8Eu4eV1PlYuxU/rbsL2LIc8m
	mZfU7EDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXecj-00000008B5B-1EeJ;
	Tue, 14 Jan 2025 10:58:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeaI-00000008AZY-0HXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:55:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa6b500a685so76783466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 02:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852144; x=1737456944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3rqPuNp/XAiHwmx1Pu2LDapqHlVBx3ScWZfxCOYmYA=;
        b=j9eyOKDNWziwHTTIh1b2wxkdxeY+n3Bk21zNm++XnwLP8wGeycDZBJjRN5bqRkcq9u
         KOvUUG6HQ6pKQGaz6W3f2dhZ1rvfsdEsUKRaL2nkDIa4nZ/rq5QUm2GoQGSUbNlB7Y9r
         C9XyXgWvAq0BdOd925BeL/dJUW4YvkYjPK+QwsPWHQJ768gFopKMWlMTGXdfdhZIO5ez
         CKWX1kgStPTxLlycI6RD1d5+eE1+rjzG3g6vyFDeCzNf6bvnb4USP4egt+BzEBhEll6L
         ybo3x8qoE4MOEVCz2Ved0+B3HHKqatjjS/BcLrktm23E102xx/hnyaWFqTMixOr9kJ2T
         T9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852144; x=1737456944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3rqPuNp/XAiHwmx1Pu2LDapqHlVBx3ScWZfxCOYmYA=;
        b=WCm0pxhKbCmUcjFxZl+xs6+45ddFANVc0U9QdbJ2dj7jwG3DG1Gd06c1EtNmlzZST4
         7g6PheNGqAW2cQOUOysGi9kspqF+ECMVjd/yGSqllaLl/DMUdZEDAHY5QNumEr4s6acR
         YNGG9hffVFRbuJi1EVXEfDnrMDH295/1HrT6X4Y12TnWceuAQHsoXq8g0CopfBYpLZUX
         Ph0iEhlHRlXOjgyhE+/r9gV/PYCTK3nda7slNQowGh0KlVloSITsDkPNK2W1lD8bcqgy
         8nE/QEHm7M//geSicwr6p1rokoaMOgNDeC86D6VZ4LK400aLWxnZukJSwHvEbdiqicCV
         1FJA==
X-Forwarded-Encrypted: i=1; AJvYcCWVUxPGxzaFiTN7Yp5MYrsDTeJ7Dv/t4AMbo7GuMa6d44+4Xf0n0zkdQneJAxKs8d6x1o0SV5a6Zj7yFgGg0Ioq@lists.infradead.org
X-Gm-Message-State: AOJu0YzVQTQUCly28Qdyi80XnKR4Cok0gLrTZOAV5gv1QQTPRH4gGjtU
	bgfCQf6dIw7M/hmVkH0ceVgPKCnp9wrduxsCK7bwPbugVPUEczjM5H1e1kmnwws=
X-Gm-Gg: ASbGncuNMCKFCzsFpVFlTdqEDwRT8CvwEKOJVzVWh+DHNHQzRRWdTOkNGv1imYcVlp2
	C8SFka7kEI4d0WHxBSZcP71txLHgDwr9yOp3Hsi83YQey5pTJldMl8WvfmYGapYk//aFOpuVbAw
	p20hHjd805cEEJ5xDFYfMflApou+9wrsd8ynN5TTG+zSQRXQ9OO+XEqxhMtzT7UFyZuLUmap2JG
	HvYTD4WaPsA3IqhjJIXiTqS1IQqP0vzGPqlCUBwNJNkZw76hO+1IOa0OdjZjjnM/WmU6Fw=
X-Google-Smtp-Source: AGHT+IGGLNOo3Y6rZ9xm8aucjHmK0akRyTENMu3IpG6BrZjgAqoEyoZP/GxppQhWGAt606k5yDTcpQ==
X-Received: by 2002:a17:907:2d8f:b0:aa6:6386:44de with SMTP id a640c23a62f3a-ab2ab73b693mr726196966b.8.1736852144389;
        Tue, 14 Jan 2025 02:55:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624e8sm611169266b.127.2025.01.14.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:55:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dmaengine: pxa: Enavle compile test
Date: Tue, 14 Jan 2025 11:55:38 +0100
Message-ID: <20250114105538.272963-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114105538.272963-1-krzysztof.kozlowski@linaro.org>
References: <20250114105538.272963-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025546_105271_A6522BBC 
X-CRM114-Status: GOOD (  12.89  )
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
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 8afea2e23360..cd856c990d17 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -546,7 +546,7 @@ config PL330_DMA
 
 config PXA_DMA
 	bool "PXA DMA support"
-	depends on (ARCH_MMP || ARCH_PXA)
+	depends on (ARCH_MMP || ARCH_PXA) || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.43.0


