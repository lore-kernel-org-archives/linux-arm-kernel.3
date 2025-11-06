Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16C7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RgHKuGRcojJQByTkzvT+fYL9rE8yH/+/URCufT9VuM=; b=KkCHXc4A9795pXFW4UjiMugZLZ
	cMgDCnDKew0jwhHJXRr9INcAJIZoFJ/Xpc0nvkoIhG1dtmGv95ueGKmdcUvhQo3LtXe/E9db/x4y/
	h07rXQGKkLWTpIPVwHNjfBHf3XHBq4WtNOfX2L3URacu9oBsenwQktRU1fVTKEqCZD15fMjqrbLdU
	FbOdtjHVyDxIFaazGYc/WI02ftivr/WDLo6xj7AsoCC+I2Fqy1SR+rmxWsIdid1pTcaa0nX12/d+c
	+BFI6lgjfn60CHM4KCDUdEA+GHr6WqXl4jrlB5z5mXnerbxQtIA4v3l4Gsk3kkXwMtN/dFKqTKovk
	6HQww8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpfo-0000000ElBm-2RRL;
	Thu, 06 Nov 2025 02:24:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpfm-0000000ElAk-2oUU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:24:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29599f08202so5984705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 18:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762395866; x=1763000666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RgHKuGRcojJQByTkzvT+fYL9rE8yH/+/URCufT9VuM=;
        b=nWOupQIHZHyQtEQXOTMAXWlq41B4mFSzLee0bzl1qrKmw20U5jSZOgagqFKRuoSDUz
         g+5JQT3J4O0g1DDy+uKpqq58zvIdWVeDcmJfxPik1USVCGk11dpFUrRemtlQLcT3dn/3
         pz/v3cQNzyiINtqMe/TfNxsbhj5tZtTlE0/cpaKasZReEkh7YQjInKXRPOumcgb+HQQJ
         JsCMF+shtaYwDFSyPbVVbnVixHBCAHaDBrpAGNjI+ETUJRdLBiBmkG2W2325NDPI+b8n
         vaQeUWTQpxhb0q35HNvhFzw4CUMKgY9P6uk4CQWm9FKgXiyZsxcysaNXwaRdO1RMiz/P
         KmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762395866; x=1763000666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RgHKuGRcojJQByTkzvT+fYL9rE8yH/+/URCufT9VuM=;
        b=F/t/M83bLWeyzx5cHKAJG8Kzow9sonUnzg8O3gFR0H4Vyga2N72JzUGUaZbn6KrhIs
         +T+B3DNc5YUUJFhFCjtv42jxW2XWrtaUg6K+SKFtQftpsUZKnQNw9AL3+hE+Yxne4rHh
         WBZ8+jRk7MgnWgL0nL/Z480Rj7h2Yw40ZVcqWh5HdNp6WMti4ItaoVZpxJBRnQxFco7X
         l1ZNMqsRtIqo3h1gEoJ9qiJzEpJfyTkDz5uyBV+b0k/9cU25VPT6qLX0XeyYHVMEeAcv
         dgNfROTOwlh09u/ljYFwyUAKFtQCKyYGxv0tY3BdAU8CLeLbEPlpyQe3vpI8KQ/UTO7B
         0qWg==
X-Forwarded-Encrypted: i=1; AJvYcCWGrPfxXgIRMSbvAaK84HvVqG2llaOgR9knJYNrJVaLXjeMZWQ9HAIXA+HwhPL6nFid6KMOMzRDGmvCz56ssJ4t@lists.infradead.org
X-Gm-Message-State: AOJu0YxXau5XqGbrDshGMVeI+ZwYlBbEc+nQacMuTGkOAyJxW+aa0FPR
	HKg8+ASJ2E7sc2/zOMD/p+4R0gxMDB7tVE6z1IQ2pqWvnZveOu1BTQdXJoTE1Q==
X-Gm-Gg: ASbGnctE86MsaCzsZ0xNFsPYuCl86TpyVbQb0BibuX2uRpEDGROQ4Q+Y2VQpVcw5ZFi
	WkX0Or+VPdHLBAzLHuLo/LzAeg9b76EL4fQyThNjSF2kAfhG3au4xEK/S3MEqfOBP592TWtRmph
	IjF0jjWguhfoV7ZtEG62oChbcBa7BJPP8Zh9Mwq6MizI6na/wcGpbL2MHQkGriGFZXbmhN/mQXi
	5kQ7oqG8JGUO5yDsKT2uadA765YwnA8VF2W8qQVZhnb7oWtEj2W4mndvXXHtmjH1160u0S83//B
	LkS/UZG8exjQV98zQuoiUDPx18bz612A7ny/OKkSGEgvqVrQKk3MXQ4D7MNhpVvqJYxJtoZTzSV
	SThVZHW9qgTaGWtZMqMaGXt+15i50jaoeOew1NwFLVgjSXHU=
X-Google-Smtp-Source: AGHT+IFlTglLO6YbNUiSxiWM9LuEL1TE1korjNRnwjDSZonG3AWINPzmqjPU+srD6U6HHADF+p+Fdg==
X-Received: by 2002:a17:902:ce90:b0:296:4e0c:8031 with SMTP id d9443c01a7336-2964e0c8139mr28182925ad.17.1762395865886;
        Wed, 05 Nov 2025 18:24:25 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5fdb5sm9399935ad.44.2025.11.05.18.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 18:24:25 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS)
Subject: [PATCH dmaengine 2/2] dmaengine: at_hdmac: add COMPILE_TEST support
Date: Wed,  5 Nov 2025 18:24:05 -0800
Message-ID: <20251106022405.85604-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106022405.85604-1-rosenp@gmail.com>
References: <20251106022405.85604-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_182426_710946_CAE22BA7 
X-CRM114-Status: GOOD (  12.26  )
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

Allows the buildbot to detect potential issues with the code on various
platforms.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 8cb36305be6d..243d3959ba79 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -102,7 +102,7 @@ config ARM_DMA350
 
 config AT_HDMAC
 	tristate "Atmel AHB DMA support"
-	depends on ARCH_AT91
+	depends on ARCH_AT91 || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.51.2


