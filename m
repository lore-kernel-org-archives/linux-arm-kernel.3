Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA80C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=; b=2aEiGk6nGFq5T7NGbgUUJwbUiQ
	PzVfQwTw6aKj0/JR5sBWyVEGueqNAUe8NoCS1crVnht08RcSFNtYMgRvgBo/A+yvhCSF8XTvWWHJ4
	ENrq9qrToStDOg376xVQI1mYMgmTmE2utri5oJrJk7halz0A1ty+w9xYYC8VqwlrbLnfkmYtFyhxB
	GQgnawVY1qSh/JusdIv/Ol+p2a8OGGLGzPmptoHEZAp3ETS5SzSmzb4IUoybgU4LRvPHRylqJlnxU
	KXcdMJNQsZRSqFcmbWQT5uEVSRIZ0fsBkVnMuIY9Whm0MWurPRQapAHY4hpZO0B0vHDxDBr38JtS3
	rPHiUnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8CZ-0000000Aasa-0L5J;
	Thu, 06 Mar 2025 10:11:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7qN-0000000AXNA-3Ttp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 09:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=; b=edhB0ASgWbeFjPytAP0OvIcOPn
	r/0LXpMiqesiJ2bJBehq69n/tpSv6SB1DGn+VnnTTZIzURvP9jKZsO8zzMztdX80vdDcUivOl3ruK
	SLdE1lo9cRqE1FecCSxUw9DKUJH64wmO79mVxShreFEBUjsKHNPAlcjVVei2Gr8vD36vbzvUj9gho
	GQuBver8LmOWBkATQ+UPek661S9lUwS7Zte143kscHTAKxgc4agUB7bv6SO7xP0S0UvnFlAhj0Wzv
	8rFKznuJPnkhbNlPKIKBbwu4nXyA+Yj3D001gxJP0IHLwz9H5hOszwCZmfvVjFmSvBHbPYcIHoteP
	iQS3P+0A==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7qK-00000007B6g-3OYQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 09:48:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso215904f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254518; x=1741859318; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=;
        b=WBFyK6HRb/vgcZ8q+NCxnp2qOD7J1hL+ELyiCO14OOv9MCZJA+M+iArqFPp7tK9ZSL
         jubwvgwkhJryx3LLK2x5fvIUvASOY2pGiXeReso3E490D8xLCofHssCakKReAYKMDNpQ
         nsu7lbmlqnVdvj2+CKoC2bkZigbToBDJU94vlKDDBa7S98yy8cPCfbP4U0ZXW9UEabOx
         FJNcRfnhxbkIFEBRQ7IaeOSRQPif5GMIMuGJhTzEzvFp30Hbqa6YlS0W9n+a+l2McRb1
         HnTScS5ehNvCErKnQOlWNDmFTlLRYEDdnmCwM+NTYMdFCuSQKd9/aceBw91FA7baW7yJ
         rBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254518; x=1741859318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYb6T/3vLosF9o5q+Y5UiX2/6xC2fpf9CrlM4eItM9w=;
        b=lSkvKrI5hP9Mr+jUeD156Xvk/7fFSF8LThG8XMjeJC4bWmWrEJDV06eYggxCR+AnNX
         IjVVmuufIugBDkOXZARL6b+hxvzOz7KJiBjpp0zhCiucw/F9GHzvFpuji9oeKvYK5zdC
         +jlfAR3caSraGvVb51KefUQZmKT2cyYGvlDUxFhgaAQXbHqpT8kPGxAWMXlUOHzjIVaC
         yFeNuQD1VTAcxt9elOJXkR2OtHfJydeKS9Kcf0+0mQg7TnDVmdf74yG1ZSwagDMfFxm/
         xlRVqDyN1nvcLHvo2DdJzOOPSreVP4sFhJrMHwDvofHn8ei2Nfhf8EyK9HnxwPP7YpI/
         cIxA==
X-Forwarded-Encrypted: i=1; AJvYcCVhyqGXh/F5mW02s6QzaihsT3OYe0KPpkz9bfqOkXkVwy6ymDK9zKVVEQ3TmhywlxnfJcfiKP5MZu28JnEoa/eC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+QMbUy6GjVkeFnqc0TZ6q5R1mwZNFPWbUFItRq6lruHkFG6M
	j69m2j7ApAayeySRUZLImxhuujZplWOwUAgVR/icTNa102pThEl+3JosNr1aWpU=
X-Gm-Gg: ASbGncvhGlARZAPjKpGPcrP5X9rng5+/MNsGg/IiCuUqrvRXWPSXqw4oLEC36uijCMy
	WVBwXT3QP64laevaSsrsmk3slpx6rEi++CnkExQKn2MrTgrGD4bSY7Phu6aYFX2UXRVryveAKC1
	QKsf9Q+MtKS41mHblJ2c9to9eXneOYoK1g2aN8grauQEpKe8zDvtaD8bpFqN9PTh4DUszz6SBBY
	li6+gQoJrE7JbGVU6dBzEwFS/e0vldjUnGhVfyo1+4R9GqMKjaPndZdvOPP96GJqOsxGfKXoWNy
	qzmzmeNTWQChS1fgbnvEzY25zTJY8iyFFiGVAB1WW1EVL+EP+Q==
X-Google-Smtp-Source: AGHT+IFBd/ryvsqo4SuH5AoV+P7wyT4wM81i1izptWSUavGGlpTSK4T7eUmgeLPy3GMlZioDo8QvWA==
X-Received: by 2002:a05:6000:10d:b0:391:225:9521 with SMTP id ffacd0b85a97d-3911f7bd8b2mr4846113f8f.38.1741254518181;
        Thu, 06 Mar 2025 01:48:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfba66esm1527318f8f.18.2025.03.06.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:48:37 -0800 (PST)
Date: Thu, 6 Mar 2025 12:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: Fix an IS_ERR() vs NULL bug in
 stm32_ospi_get_resources()
Message-ID: <bc4c9123-df43-4616-962f-765801d30b4c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_094840_889517_D26D586A 
X-CRM114-Status: GOOD (  12.15  )
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

The devm_ioremap() function returns NULL on error, it doesn't return
error pointers.  Fix the check to match.

Fixes: 79b8a705e26c ("spi: stm32: Add OSPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 8eadcb64f34a..a544d7897edf 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -835,10 +835,10 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (rmem) {
 		ospi->mm_size = rmem->size;
 		ospi->mm_base = devm_ioremap(dev, rmem->base, rmem->size);
-		if (IS_ERR(ospi->mm_base)) {
+		if (!ospi->mm_base) {
 			dev_err(dev, "unable to map memory region: %pa+%pa\n",
 				&rmem->base, &rmem->size);
-			ret = PTR_ERR(ospi->mm_base);
+			ret = -ENOMEM;
 			goto err_dma;
 		}
 
-- 
2.47.2


