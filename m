Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FA3C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W3w9MJ2ChcuTvKxi9ZMSSYzvPLc49TB/TDjBvpqAHg=; b=RQbDPZQbfNKRD6Sydi+PoEFvWz
	fv8Rh9fqekx19TzIhwt7UQD3Zq0dyw4q+Be170Gev6pey3GMFHqeameFZZJJyJklGFLq5f6s1zV/B
	KIjDHdqIiGZt0GpOxRYQ/CNTsy3UNuzqyA169msahOnRAAEtkOTEl+utx3MX/iOEPm0PhFxnGpdXn
	OQI7DEBuzUd7UgLIhE2ucZpCBQfmEAD5j2HZdPvJPJ4ggeF/JA7EO13oweZb2YDaGtyd/2GIbAu1i
	I+drJfVAaVL0XWr1SCdD8HRRJvU3Vaglru7Py2g06ycx3lWenij8wbPqOk4DCuMGPg6Bp7JuPGWrF
	pr50qGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKgu-0000000BcYM-0gkF;
	Thu, 03 Jul 2025 14:13:32 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIvJ-0000000BIsA-4Ai6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:20:19 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e898fb745beso764424276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545216; x=1752150016; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1W3w9MJ2ChcuTvKxi9ZMSSYzvPLc49TB/TDjBvpqAHg=;
        b=i8lwvQS1n7qbbYPkjIQPP4bGofyj2OcLKt5BmkbsaSG/5eDlrYUuMq3VoBE5WAgCYD
         RJ9jijOak6k3vPcqYWNOjFiIHdDA5x2aNtgEgnhTuapYK1PJyxvbQUeBxP2C7+2i6ayF
         Sizza9FWpw9C7qeye2RW0DH4f7oymls+o7ewGA18/gc27neqjvlERuHGg1IVGVaiYhOw
         vpUu0USWfL9SgMjzLGdalcU3vyogiTT1Hk0PPBqDWwWxH/ZY6FKp0r5aL3T70LNDw15Y
         xN/SNF+EpaBw1mVdbu2VP87nyZP/231jJRBl8fvavwmqeVpP80Jk4u/AoNQsWbBmydVa
         lVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545216; x=1752150016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1W3w9MJ2ChcuTvKxi9ZMSSYzvPLc49TB/TDjBvpqAHg=;
        b=A00FbNg0mtf+J9OQHlkshb24Z9qNKYFI7EmUxI630CxK8NpQ7Mv+eGeoNXrU4jnynz
         nNwq3jWYaOlIzOEYDoByV4m/1Z5uDrgUOeKWOuWz/GQiZ0j4YV4pWdApbVHK8v0cpRw8
         Hih7b2u5OEP6d/D6Z/L5Rp+StwmI5fV4V45J3D2D9M5HYk9H/7wdaNO11sZM5xH4lifP
         mmGnIgTcHmIUzD6O97PuOX8QXFlBTN9wyznpwtJ66YS+ETsrm+XSpY644WMvD3CPksWR
         oiEmC+MW9hI8W+1ZtZ3Ujxe7bIHXGngljDHBVD3nq/t04MNihzbw0OApNHfLblKn/07u
         9OJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOaYV9SSQfwrG9Ve3v4Bg50CS0v6fZwBp7EbjbGxkSFIwDsUy/6Uwmql3E0CMG3euQBuq1al9ZwIIozMB9IT1z@lists.infradead.org
X-Gm-Message-State: AOJu0YwTyh9cNIQ3bdk8BYLvgOtp+Uq4Ssxgn1CBtkJ3cky4ukkfI9IG
	+AwxBF17l4rUTml31pLQ7qTeuN8U5H8paFvwUzBFBHkcckj1vldIhnX/Txq+dGMgq/eIqLTums6
	WIbWCQ22T2LlQvWhWrmYiScj/woWT+NEqn9bXR/PQ6A==
X-Gm-Gg: ASbGncvCoqVVF7doenUsmu2d+tvFBadV6jyn2s+NEEj0xA6kswo0wXEEfp/RaXUKPmg
	yP9c1SmonEWTjbUB9Ru+jghIY7Z+f1glF/3ZCPL0+LSE0rwzG8ZBVBpTVpc2AkfWX7d0qGqrELn
	iX4lL13tDddztvJYkwja1MyLZs7f5MyksWD3xFJHTwcpN5
X-Google-Smtp-Source: AGHT+IEmhW8Ov0Y9jVrvHOwZj8H8nMIFymTr5BFDKBgbv/so+xhj7BgHcBqsC0qPpeL0TROZTppJMnK5zQ5xBecp9QQ=
X-Received: by 2002:a05:690c:1d:b0:70e:404f:6714 with SMTP id
 00721157ae682-7165cb464b8mr25745387b3.19.1751545215794; Thu, 03 Jul 2025
 05:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250630093510.82871-2-fourier.thomas@gmail.com>
In-Reply-To: <20250630093510.82871-2-fourier.thomas@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:38 +0200
X-Gm-Features: Ac12FXy-fHCOkMVSjWEqOM8yM1ocTCdlPI1Mnhp584Yxu07D6HeH7gPis0rWzRo
Message-ID: <CAPDyKFpJagX2mUNmMrA1k2iogXgq_reXAf1NEeDyC96jMv807w@mail.gmail.com>
Subject: Re: [PATCH] mmc: bcm2835: Fix dma_unmap_sg() nents value
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Yumeng Fang <fang.yumeng@zte.com.cn>, Eric Anholt <eric@anholt.net>, linux-mmc@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_052018_029239_EB5769DA 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, 30 Jun 2025 at 11:35, Thomas Fourier <fourier.thomas@gmail.com> wrote:
>
> The dma_unmap_sg() functions should be called with the same nents as the
> dma_map_sg(), not the value the map function returned.
>
> Fixes: 2f5da678351f ("mmc: bcm2835: Properly handle dmaengine_prep_slave_sg")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Applied for fixes and by adding a stable-tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index def054ddd256..4fced9b36c80 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -503,7 +503,8 @@ void bcm2835_prepare_dma(struct bcm2835_host *host, struct mmc_data *data)
>                                        DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>
>         if (!desc) {
> -               dma_unmap_sg(dma_chan->device->dev, data->sg, sg_len, dir_data);
> +               dma_unmap_sg(dma_chan->device->dev, data->sg, data->sg_len,
> +                            dir_data);
>                 return;
>         }
>
> --
> 2.43.0
>

