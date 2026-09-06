Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77BBC79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=; b=WV/gh0efWxJBIVyQbFC/zdEb1C
	xSDrcfqnOQPFfMzQsmla+XjWDQCv0Uc9Qqof/sYKOuoOGrs558SR1oQnfBKkjBmiGXmvtIpUsyekf
	d2Q2H9tpbU81A1SFIE7BiZie+wUQCO5hFcy/ZimqGgAUj2NzcD+Na7/ailLHdLqB4vuBhY2gjzNMV
	H1ZIaoNxSINtpb3B54O6rwAS+y+luLlXREb8NoRgW7xIRYIW1S9j1+iZ08HdPxuP9alNLZd+MqAVh
	zYNyEGSpq3at50k4Mcq6kf3GWeJ5TrOy/uOPq+0DRC3Eptuz161134LPDnKRF15ra269NMQ4p5Uln
	nxpSKLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FGa-000000059su-462p;
	Sun, 06 Sep 2026 15:58:48 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FGY-000000059sE-2FHk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 15:58:47 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1941605a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788710326; x=1789315126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=;
        b=LclB3aS0tDLM6UJx8XYV/TNCn8jCrkynzGL3aJX9cg6M6/Vxwtbdjvbh0DxkaTYxCL
         1HyHwynWD7gYzO+GR/ELsGjA2ARhVnVO+MPQjgHEmD+lwJFMegNmxfP5eYbcC+/dZ6ad
         vraIaELw39FE+mAmgc+/+57NnZcwy5Aup+WFKP9RuBLVCI1N0JdqoZtsOIchxNAg5sBY
         MtXK8tF3HY3IeGPznNSXbsY9KOwdOjkHVR+jKPIGbq86B0+Ddra57vGsYpwktaodPWup
         u5t4oxh2WgFWSmn3KB7VFlDtn9fZNV/4UdpDVOyfupSwz/EMDv0C4wHmwia6DR0hawtQ
         SxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788710326; x=1789315126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViofCTK8v1s13H6Q1s8S3TeyG55pxUNWw4j4G5OCidI=;
        b=rcbfVm+9eXK/EAOO+/8+/Gntd9/cos6XaQLoWzeFU9/OFR9wCmmtwtUMB7Z71Fdk8A
         iGb7NgT+cB6RI1hgBxaMTvxz82i9WNgACPUQ0bsO/d6IKdW2esK20wS0ecBYQanVWgkF
         BVNqxJttuAdv1tSUw68Jkjs74Vn1UVVVsAn7OUuf5/bW5xKZ6fdGYWSed4yQRuJXQJWE
         r8uplgs/zeaMTezEBYld27uSvrRU5P7EayAeMA4C9N4+3T8ZAI/+z5kBmGtR47DmM/w+
         aPebLYzMw7qe8q95pySWNsC+5YplSFgFQaCAyh53S0Ba7xdSGvVAxWVC7yDXPxiFqp3W
         uoEg==
X-Forwarded-Encrypted: i=1; AKwUvByzE+XrbNPCSFbezUP3yFR16cYrrjaNLg7AeEwdq82vOzL59M/US2FFlgmjFk5Y7KqI4AbCUUCXZT5BZLkvrbJd@lists.infradead.org
X-Gm-Message-State: AFuF++nsvcKGfNWm9q3p5x145HUxXJpVMYt9NuqZbW4fZt7Rdw6Vbu8Y
	RDXDX2aV+TaDRggucSesiEF4Uc1wRodrE8Bdzq+TyqvT70ibWsUCXWMX
X-Gm-Gg: AYBFou2gdsEfCOWpm81lx/8PnxmPwhcStF5HayerUEpySIQ95a+hAyku8xDTk5fWl5q
	i39rUTXsckRllFRoHMtjs0H7U/AUZw1om8bRDNOEbLaCOEOKZ83n0Upj59o3vGgo3cURBEIUIaC
	cOL6VJtCwPR8UIotjQW9bwgeF/7RhWXFcxf84dqV6MrowqnPDf+11U16nqJpUEFr223qhmoiYHi
	e8S9cluCSpchQTBQ7ew+Pr0X6OXEUewQM8KPNhU7xaeeenfiL96hIJwk2nMD57RAqSQ3FL2tgi0
	AJ4Mfp/TTmWbnKYsfYsgRwvZeGX7u9AUhllfSFOmj10tD8arPkmeDUfpcMnHrb/HIl4CBhyYmd4
	+A3HyPipP0lxuAZH8DtSdz4i0dpCmxsaQsaQBSapvNKrMrTL6BYgDjVc8moQ1hGHjuNBETOlUXx
	I77311POU/Q5TELN+cPlEDVkuhLia9SLf3BmSPfxtMm6RiD0lcTUZWOquAKpft6XXxSpWA64SWX
	q+EJiyZPN4yfpC69gLm41nEvo5CZA0CiUlPoPe4f8jhCgxbOPUTNvalUHd/FjoXrXM=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr27665796a91.16.1788710325448;
        Sun, 06 Sep 2026 08:58:45 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm15941401a91.8.2026.09.06.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:58:45 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 06 Sep 2026 23:58:34 +0800
Subject: [PATCH 1/2] iio: adc: sun4i-gpadc-iio: drop underflowing
 pm_runtime_put() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-gpadc-v1-1-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
In-Reply-To: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Quentin Schulz <quentin.schulz@free-electrons.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710316; l=1267;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=c57ka5j8TQHkpX5FZRHB8vFerQ2Ws0Z0sbVGbrtSoUw=;
 b=RK5suJBjW/7xSEGUZXgfUBlPW2TReDkIU+aOrloVKr3mhcpiAxpWmhUE7ZU8jgfIYEVZ2MO7Z
 ioAF8OyoqLhARn7gFPEsWticTsfzL14FepGKSvjltcW7wOLyhMyhCXH
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_085846_702266_BEAA1304 
X-CRM114-Status: GOOD (  11.38  )
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

Neither the error path in sun4i_gpadc_probe() nor sun4i_gpadc_remove()
ever holds a runtime PM usage count. So the pm_runtime_put() in both
places always triggers the "Runtime PM usage count underflow!" warning
on every failed probe and every unbind.

Drop both calls.

Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 203459ca9907..85382e435f2a 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -657,7 +657,6 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 	if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
 		iio_map_array_unregister(indio_dev);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	return ret;
@@ -668,7 +667,6 @@ static void sun4i_gpadc_remove(struct platform_device *pdev)
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct sun4i_gpadc_iio *info = iio_priv(indio_dev);
 
-	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	if (!IS_ENABLED(CONFIG_THERMAL_OF))

-- 
2.53.0


