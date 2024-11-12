Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50954D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQwoM/nTuzFKhK1k/SOzLnbDeI0RWCoU9qRRxql+gQs=; b=ljAzoY/g3CZV9vrvkhaY0wIX62
	G0etD1bgo1nP0Llfj8hi2pvLu9p+kK/Eov8S0UrJ/ucgBgXackQFG0CtB9rIjVo8vo/9AybuJH6w4
	+iXTaRVR+9Vbx6739ycbNOLAqhy4SAlxQ2tcDnAETaMB8eMQqRZyWkMCcCEUamQrUD2lShSSlLMeu
	n84R9P8EbjUbSQzuCoi3Q0wLBeimblmATjhYfIKV4kzWpiNOOHsGrLIYEkfHMdFzJxssL2TNM+4j0
	jKVutRre/YaI494c70s0oaVGNPAOf03c6f7WRqvCnB5nueVVkfXSy8nAMIFxUvoy5J41l+RfP8M89
	0FX6tRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvwP-00000004byj-3svD;
	Tue, 12 Nov 2024 18:48:41 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvsC-00000004b5z-3QkJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:44:22 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6ea7c26e195so62073947b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437059; x=1732041859; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YQwoM/nTuzFKhK1k/SOzLnbDeI0RWCoU9qRRxql+gQs=;
        b=S7EGJUP+PeAzpATIjqOseqwi2Xf0b3JEOtWlR4CoxIBVCw60Z4UVY9LjDSTka2W/OI
         S9CIN+OHJdyQ6OESNPKgwUzUn034Tit2lPcgjnTigkJMzniM7xMw7HQFNznFRfwN+tVt
         UJK+RmWz2bczbRLlkIYqBR1eF38kwX++atAug9CjlEeFrU8oorLpUUgIb+WDMZVGuxNN
         DfYJBTfIFwAWGVmtTJKWg2HHxb8KsD0HN8Wvtp+f3RKH2DXWmKkNupHEOAUug+ZoGW5H
         3B/AvrDlwVKzuxl24LkbidVy/F0EvBKpKPgdN63LtQtLp7V5VGUBWndrzdIOgcKRv9P0
         IbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437059; x=1732041859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQwoM/nTuzFKhK1k/SOzLnbDeI0RWCoU9qRRxql+gQs=;
        b=D9xTRO8QrWWbAPI3rTdUomNqR6UP5ayQZdXWHDRP/28QzREwn23suQMkYey7fLel7W
         y0mISp6WYH8Toz58vkaWhu7x/bNeGecR1+EluSIeONgX6vTvn7XGnjArYq/WoIxEmJ2c
         SeNDc54HAb35MRva79CbSDPhONFFsB9Xnuwz82i56kddX64gxN+/NyDkthprpc+u4ASy
         wA8l9YYqQAVG3XVJbP02nY5asU4etdf/dn2/amNG6x/ZT7wvXLn5oGCcyYghb3Pp2lV1
         BZ6l87WMRVc9Q+kk7ZpJOg9QgSqNxB/Egm6zGCj5LZEVdCwoI7c6Vn5V806InYt9CgAm
         HbPw==
X-Forwarded-Encrypted: i=1; AJvYcCX59RmZE2bd+PQalkKamJ49oxGWhHdTwTCEW+0mJDD1NbgmBhj4I1vjIK+tBTpfrTId9Z0tlupmxyyc3Zw/Pqx4@lists.infradead.org
X-Gm-Message-State: AOJu0YzeC6GjEh+LeJpOejdMy9V19unXxA3qwW4wOAYSYhaDHhyB4qKz
	7kSkqa7jx1vsq5nZNWkKQfWrQptSny2NizN+YqgcQJEFY0h4rvOJtluwdkVkEFYkCCBrtOKyt2Z
	uY1NhjPzzGc1+SOpdVqhxxfHwYGRZJsI38Z6z0w==
X-Google-Smtp-Source: AGHT+IGaU1lE2PJipy6pOIUqOpY0yqY/1qPuB70C2Kl5meeHsB3avJig4SV+FxxLDBmZG/DPvhBkYkquOGMWKK2QHIU=
X-Received: by 2002:a05:690c:6888:b0:6db:ddea:eab4 with SMTP id
 00721157ae682-6ecb359db6cmr177507b3.37.1731437059301; Tue, 12 Nov 2024
 10:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20241107014240.24669-1-andre.przywara@arm.com>
In-Reply-To: <20241107014240.24669-1-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:43:43 +0100
Message-ID: <CAPDyKFoTyMy9wv+6nfr=-TK_da_t5rojrpTgyiGm7=sK-RK+Bw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	Parthiban <parthiban@linumiz.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104420_877830_4625C534 
X-CRM114-Status: GOOD (  22.36  )
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

On Thu, 7 Nov 2024 at 02:43, Andre Przywara <andre.przywara@arm.com> wrote:
>
> It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> And while this alone would make a trivial fix, the H616 falls back to
> the A100 compatible string, so we have to now match the H616 compatible
> string explicitly against the description advertising 64K DMA blocks.
>
> As the A100 is now compatible with the D1 description, let the A100
> compatible string point to that block instead, and introduce an explicit
> match against the H616 string, pointing to the old description.
> Also remove the redundant setting of clk_delays to NULL on the way.
>
> Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sunxi-mmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index d3bd0ac99ec46..e0ab5fd635e6c 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_emmc_cfg = {
>         .needs_new_timings = true,
>  };
>
> -static const struct sunxi_mmc_cfg sun50i_a100_cfg = {
> +static const struct sunxi_mmc_cfg sun50i_h616_cfg = {
>         .idma_des_size_bits = 16,
>         .idma_des_shift = 2,
> -       .clk_delays = NULL,
>         .can_calibrate = true,
>         .mask_data0 = true,
>         .needs_new_timings = true,
> @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_match[] = {
>         { .compatible = "allwinner,sun20i-d1-mmc", .data = &sun20i_d1_cfg },
>         { .compatible = "allwinner,sun50i-a64-mmc", .data = &sun50i_a64_cfg },
>         { .compatible = "allwinner,sun50i-a64-emmc", .data = &sun50i_a64_emmc_cfg },
> -       { .compatible = "allwinner,sun50i-a100-mmc", .data = &sun50i_a100_cfg },
> +       { .compatible = "allwinner,sun50i-a100-mmc", .data = &sun20i_d1_cfg },
>         { .compatible = "allwinner,sun50i-a100-emmc", .data = &sun50i_a100_emmc_cfg },
> +       { .compatible = "allwinner,sun50i-h616-mmc", .data = &sun50i_h616_cfg },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> --
> 2.46.2
>

