Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FCDCD4F47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLuPzKvrSzHkaCJJGeMDqoTA3l2mSjliAhV8bnUhOhA=; b=bQjpaiZtRDM7SUaQpIwTrAJ9VE
	vgYuElGL5wzKBiD50B2FR77srHnSjZQVfDGMJ1pVbSSGQ2PSL9CT0eydYwruzyelpW7kWVUHYJZ8t
	JC3tx1REC0DGT/hNEmjVBs9IU21L97wYqnFq+KJYZGqMfTETifM0ANh3w7gL5CwkxzUZtltjkIoLR
	pBbA3myaLlCMZFtl/5O+IkAYsTsXPlf0qKMKAQiMocjGwTiB0dxOGJyRXHDyKPSjxuA57llL1WTu0
	IYmKvr4CHfSCTkfSkw0GU9jlmuTEpRnUB5efqNw5XmvhxW/unS5PvG4hmXMmggHtqC8Y53meqJqlw
	d0F1yCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwDU-00000008yLf-3FvC;
	Fri, 15 May 2026 17:20:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwDS-00000008yKL-3Ne0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:20:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so743225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778865650; x=1779470450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLuPzKvrSzHkaCJJGeMDqoTA3l2mSjliAhV8bnUhOhA=;
        b=juMHRVfSSQxOaime0Oa761rDysBjwZtH8VsgYh8B33EYX/uGabNNqdHiW39EyhgRdm
         dFSF8SRu3ND/Y5KQe1Urj8WdbFi2hROrCxEGz+gWiCWdbGw6UzdJiJKKxlyabut34bMI
         Wjv1+j7TLXxg8QZD7XLbcaPJkafn6NYxIV06M3PGx2M6ARyP5QsXARLZGVcsP+alE9lG
         bqbZtdHeQXtlUdxv1pOIll/qYNanzJjw32vtPIYwi+n27k7XKS/GzgpQ7C4THLmeXa8W
         UwMthM/XjJbtlm7fF5YN2VnENvbmNPoKGNdbZ/mQx2K2Ogi7ASeiAt+a0RyZXe5vk6Im
         0vyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865650; x=1779470450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLuPzKvrSzHkaCJJGeMDqoTA3l2mSjliAhV8bnUhOhA=;
        b=reLAN2qMT3+8/4/VHIlRhASwQHvEo4xK+vy07KK+kVrUERsT3LSQoVnHqm6MfKzLsL
         giI0C+bCQAoFWt4T2BQJi9XTVL1aWwStQZEYJgMnxTQFi3VfhWTjuL+E/+6fPUG/khSw
         yh9k1wke0zrNBBl9BcrzCG+Yp5sIfHp5FNoOH37+t+qJ8ccRJTyXQRHGSOIauvdOm2X5
         efZFB5kjy3vyOaEykBiQmBM43BPgs6Ys9nvuIE2mhCfUaGfEM2K24iFIAbm2qJvNXGK+
         iSOCvalpAYLEHgm/B968Kybpif+tR32ny8iy6P2s5m1ykWXaT2L9dvbjX8YfyJINgJZH
         ljgA==
X-Forwarded-Encrypted: i=1; AFNElJ9feh0nYDXjVrgm+/eaOdT3JR9gNm9OwD+g5ATOFzrqxBo+Cew3JjnXMeJqgXUS3r25lLn9Uzkl1JKsUlT95jiO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6tCDRGdhnYDU9x4LdJn9eYiTaoVL8jBxjM2PKDJ+tFASa/iUa
	/drgXmGCYqXWxvyDHSwzP3946+uUg7dbS49ohJJ8uzJCGzBJz5Q8DVYh
X-Gm-Gg: Acq92OEmpSTjggcHdcWCU7L93qpFmUa48d0tIPU0Pt1HPwAKRWDq2zIEFYpsc1T5t3S
	9F1SduIWemsWmg+djpkKesRt3SbYmkI9tHeEd6gyxBf3VTojKicF2imaziDtEMRmPpmqxg6507/
	+DFGNHTDNCplXdDd1KKDAGM/g/447s/j3Yn2L7NUT0TDJJtz940RtLegEzjVdHUuJ7MgxvOanTu
	3gca7Ue2e0BjOA0NA4XuUcU+tJlIPtZXKamke87ofyVrN5MtZo/Ake42Fo/5sbmyVnGJkXdnk1G
	ycPZDcDpl0duLzi+OkEHc0qC+C1uZw+wkVmxEsmUrMc6nTLubUAglCo+vzXYkzPPMRVzOnJyZTZ
	hFu9g9pJ9c1eKSBlNQsw1waB+0WU0tlV9FR+bqQpuRaDF+qZEwxjbJtPByDxOBAdnBYMnuHB0Bs
	vKR3bWfDMdJoM0U1me2DAudkEEKMTrOFJMYNJo8nMQnrjjGlk1TFqzrkCN4HwKMBLAV3hHPlUsQ
	mdTRFFXF5vVcoVodpQ=
X-Received: by 2002:a17:902:7688:b0:2ba:22db:e1e0 with SMTP id d9443c01a7336-2bd7e8aad48mr43607435ad.10.1778865649587;
        Fri, 15 May 2026 10:20:49 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600c3sm63151085ad.29.2026.05.15.10.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 10:20:49 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 16 May 2026 01:20:35 +0800
Subject: [PATCH 2/2] spi: atmel: fix DMA resource leak on probe error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-atmel-v1-2-674fb4707af6@gmail.com>
References: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
In-Reply-To: <20260516-atmel-v1-0-674fb4707af6@gmail.com>
To: Ryan Wanner <ryan.wanner@microchip.com>, 
 Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Radu Pirea <radu.pirea@microchip.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Wenyou Yang <wenyou.yang@atmel.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@opensource.wolfsonmicro.com>, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778865636; l=2147;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Y4G8qeOAlLyitSmwDgedqstgSrqLdlv00S5ry4Dhr3o=;
 b=vYNHvbuBkLq8xy1hzqJDfrUoFwFc/yX8ohsH1Ku1L/igMJWL76sCYmv8fpBw6zA8qxw6a1iTU
 C9wu8+ztKqzCZWaWMXRx17ntiRkxLkkTHsfeLpeTZ0bF0iyuliCoVIx
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_102050_858933_D98372D4 
X-CRM114-Status: GOOD (  13.10  )
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

The DMA resources allocated by atmel_spi_configure_dma() were not
released when devm_request_irq() or clk_prepare_enable() failed.
Route these two error paths through out_free_dma so that
atmel_spi_release_dma() releases the channels.

The same issue existed in the gclk_prepare_enable() failure path,
which jumped to out_disable_clk and returned without DMA cleanup.
The new fall-through from out_disable_clk into out_free_dma now
handles it as well.

Fixes: 1ccc404a7fc4 ("spi/spi-atmel: add dmaengine support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-atmel.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index e519a86a2b45..893f7c7ce358 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -1625,12 +1625,12 @@ static int atmel_spi_probe(struct platform_device *pdev)
 					0, dev_name(&pdev->dev), host);
 	}
 	if (ret)
-		return ret;
+		goto out_free_dma;
 
 	/* Initialize the hardware */
 	ret = clk_prepare_enable(clk);
 	if (ret)
-		return ret;
+		goto out_free_dma;
 
 	/*
 	 * In cases where the peripheral clock is higher,the FLEX_SPI_CSRx.SCBR
@@ -1661,7 +1661,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 
 	ret = spi_register_controller(host);
 	if (ret)
-		goto out_free_dma;
+		goto out_disable_rpm;
 
 	/* go! */
 	dev_info(&pdev->dev, "Atmel SPI Controller version 0x%x at 0x%08lx (irq %d)\n",
@@ -1670,18 +1670,18 @@ static int atmel_spi_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_free_dma:
+out_disable_rpm:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	if (as->use_dma)
-		atmel_spi_release_dma(host, as);
-
 	spi_writel(as, CR, SPI_BIT(SWRST));
 	spi_writel(as, CR, SPI_BIT(SWRST)); /* AT91SAM9263 Rev B workaround */
-	clk_disable_unprepare(as->gclk);
+	if (as->gclk)
+		clk_disable_unprepare(as->gclk);
 out_disable_clk:
 	clk_disable_unprepare(clk);
+out_free_dma:
+	if (as->use_dma)
+		atmel_spi_release_dma(host, as);
 
 	return ret;
 }

-- 
2.43.0


