Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C06EFCE4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QqrYXjS07WWLu9a4fdG6oSfjRISyxlXE1cioRIfnuGw=; b=UOCkSglct9adTt
	S5hn7o7OlsQimJFbGVlRhSgWP0ct41K1gDpN2Zj2XXW3O27LbsPxZqPTKqR5Oycyh9SKKgYULUAJV
	dnKlJ8Lx83RFI6+F4dWGum+AffGbij6Ek9cZ9kQnQkyva6S+eSpejl3vfwH4Ef6AG7tR+bY4lKclL
	4Rjj3KTJHts8ZCt1hE7hT7S6b4HjXUAUcUU+MJ5xynYxq9cszV/c7s1nbhtU6zJ8YkozA5k16tTSm
	96dJbeeR733vJMFBAU8FraGmuSEVEzLuIsmofnuRVaXTzfUoJAcULN+ikRPkfcYicxLZN296UUfKD
	EK3Wz2uMsStQ9of5TqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtkS-00000000WC8-2B1L;
	Wed, 04 Mar 2026 21:27:16 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxtkQ-00000000WBI-01NJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 21:27:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48378e60742so8073975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 13:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772659632; x=1773264432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqrYXjS07WWLu9a4fdG6oSfjRISyxlXE1cioRIfnuGw=;
        b=Lbqm4Q2K5jCRMAL25KARQHgOBxunliM69yYXyoUI/UgYl22A5ez7Jje0myXzx1e49m
         KZ7Q8NLGU1NV7MrqlPiVKgTOoDXN6uh3pGDqoYqcSfd/2G5tX1OtYLeHHv+axI8q1a3Y
         CHHH/1aY2VpT6aG3O85tbU7KgUQjtIQ90TmbJPXSkQFaVWD7MwGqHmRBRMwsBkK/8nGW
         Zc5nvcR7/RODiPTgljo3vrhYOd4P0xgHYKQqpPYmLz/NaVqzza1eYCos45ffa+f02DKu
         NiI2+OCd0QEz4pWPu21rs3ov4+EQ1r094YA2TRr0eIFPAN7LrALxnUuUQ0/bjpZ0fwfx
         kKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772659632; x=1773264432;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqrYXjS07WWLu9a4fdG6oSfjRISyxlXE1cioRIfnuGw=;
        b=rJc/3nnp2s3Wd9fHq815ETX4zCX7T2ggG4cccKhlxa148FYUx+D/v3zL0bNXTkmUfS
         K9j+3k7bO75fauEkGD5HC28xoA/63/D1RFRXiR7xuB96cmKMp+M+0+WV/kKgqJu7zqjz
         pT7br0Pv+J+5zxXrFCwl8YP2vBAMxanElsivhrG45U8hwQyVhtidhM9Ycd/6QkW/HOO6
         0pBbcM+SyUybrIB3jcmp8FbTA6AA57lP4F1Z6vlxs2cH7A1e5v1ztoEFMPZLaoQqURMm
         MJKoKd+TrTGDjTjUlinJsn2VrukJTkDzeYxeL67UGnMEbppEjY9Cy2NferyzBCzMMlEz
         VbEw==
X-Forwarded-Encrypted: i=1; AJvYcCXvK5Pq0siRAEqQT0h0owVO/95LNTnn7/bqCDEY8gVNYz/YaQC5xSmuhQY0ZD5NucelNH7jY9bZcSxep79uoFKU@lists.infradead.org
X-Gm-Message-State: AOJu0YwkTJyu6heiHoy0zna7qCDBwf8bAwbwlVVcUm2J8eFLU+N6k5+B
	NFI+rUVHrDmv5ds2HJtbmBu2pm96RuyJf8GmHYKtMVRei3oqXa33ZHcn
X-Gm-Gg: ATEYQzyikn80J9zPpJ07TWnKG5EPaD1CkDaJPyevMB7c8xzuaYFixRFV+ipUWNrAshE
	imGOpJexscDzuun2awc2uHV2pWryTDHXT1lR8nqL6NZCuGPTGmHIvqX0vdiiFSR4fHNkmM7K1Ts
	1S/f9zmkxgj0U2FXXhhlDROeBroZvTtjXAOValPp5YgFmE2WQ/g4lP7i2gBHuQnK5DIT5Lp3ktd
	kPm+zVCrxmsBsL28gDydbeuiQ3Q1E8NIruoujXOBs/VcxAbIHawK1/t2AtdQUttfBphmgAQCgZo
	/Ct/RsGQTgIkOI+wyJJ1gmg+I8unuMtiBfc9v5ZRYznn5es4bSWdS4P+N+qhgaUtnAYNyBIcWBN
	xPeB4VGlLSiMKYp9syqX3NvXTL4Zi0b2XHdMImqEbOSazdOHyWn6dXkLo2+wsjWmmdJFID9COl3
	GP8h1abJ4VK6gs46+2vN/kydWu6Q==
X-Received: by 2002:a05:600c:8b32:b0:483:7d93:9f8a with SMTP id 5b1f17b1804b1-4851982c755mr35027765e9.1.1772659631369;
        Wed, 04 Mar 2026 13:27:11 -0800 (PST)
Received: from skbuf ([2a02:2f04:d00e:3600:16aa:c9ad:4288:9dcc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a82dac3sm46980315e9.0.2026.03.04.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:27:10 -0800 (PST)
Date: Wed, 4 Mar 2026 23:27:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Message-ID: <20260304212437.z34yjprrovewmlm5@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
 <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_132714_058466_DFFEF348 
X-CRM114-Status: GOOD (  18.87  )
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

On Wed, Feb 11, 2026 at 03:49:48PM +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '5f1a0000.phy' already exists in 'regmap'
> Fix this by using a dedicated regmap config for each resource, each
> having a dedicated regmap name.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Same as the one sent in December but with an updated CC list.
> 
>  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 279b8ac7822df..4ab45c9f53dff 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] = {"apb_pclk2", "pclk2", "ctl1_crr",
>  static const char * const lan2_sata_clks[] = {"pclk2", "epcs_tx", "epcs_rx",
>  					      "phy1_crr", "misc_crr"};
>  
> -static const struct regmap_config regmap_config = {
> +static const struct regmap_config regmap_phy_config = {
> +	.name = "phy",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_ctrl_config = {
> +	.name = "ctrl",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_misc_config = {
> +	.name = "misc",

Since __regmap_init() doesn't keep a persistent reference to the config,
just performs a deep copy of it (including regmap_set_name() ->
kstrdup_const()), technically you could have gotten away with just a
single on-stack regmap_config whose .name you kept changing for all 3
calls.

But this is perfectly valid as well.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I don't think you need to do anything further, just wait for Vinod to
start going through the backlog.

