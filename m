Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92144C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwPC3/sUg5alnk+vPawV+VRfKcVYwDAJB/XEbxtpgV8=; b=Oo7rwkUipPn5EcBkPxbjq2LcqI
	TF+CEoq/iXT+0LDMfpa7daz9HTU32+3224ewZ/plK90ZWumfOX8yoMOMStYOeFtjra/yGWgbwMEEc
	G20G6mU5o6Hh5qZAUFb6gmYuva+woOvtcDJ/gOvU18xBdFoaO0eTA4Y5x86NQW27M2ktJDKKknz8M
	FwL1htSBpn60fZeQLj9nKqftPpwKyIex6HYczITB5AFacKeMi2TPAabIUSdzM6V/PWvgTH5GgiZdT
	R/os85wUUSuXpYOXplKDzuApr9OORsLuId10Chx0ohw+ErYTsyGHOaCZDQ6gI6c1VVN8xsyAnwb0i
	WJIfltkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzqW-00000009Bps-1x9Y;
	Mon, 19 May 2025 12:43:56 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzfF-000000099zh-0F1K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:32:18 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e7b7dd0ec01so1822676276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747657936; x=1748262736; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rwPC3/sUg5alnk+vPawV+VRfKcVYwDAJB/XEbxtpgV8=;
        b=j4iUeZlNqNWThEnInLpg87DRFWDrDXtDE09JaE1yHzBbm4se75TdUG/Kpfx8jx/0MJ
         2aQv7YgX6qAyWwDo6wDYJFJxmnuDU/TbzMbhLuxqn8RjbB70mwSCrrmKVyNtj0O2+CF5
         bnLYMp5N6gHlc6YjZNDxtI/OlS9ax6dgz21S/IPAJl2EMnbuTs0p/toFPEbiehAgqVPo
         1LgHPtUttkKYDYCE2n/46DFu8teeAp3YyhpeusmZIHNBT0aGL947jIPjauKZsfBqM6Lf
         iDDrRBos6LA6Na6fj3jK8BFn4fJqpgzNcve+qjepCDpj0u3sj7PjCiHlQmV40dFu56Pa
         C+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747657936; x=1748262736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwPC3/sUg5alnk+vPawV+VRfKcVYwDAJB/XEbxtpgV8=;
        b=MWyKuwchmWjeycA5kRPTDgIQ2x54+WRbpuaGhB/RkRv1nQCg7DHpfro8b1yYRK6dLH
         KK8aZk4mPHYsU9K/asmzGjbtjWxy279UHa4ZHWLRY7ah8ooGo28w9qGf4KdbtVU+vb8G
         DHGIIBJu/B1E2Gi4dHebOcG/ywKvudhglv3n0KITadHb66p5g+41vBXjyo6d9kvCe9GT
         z938Utwix22oizlhNyR/gwFoLZZsQJ6UE1+nt3MEXK+6JsNrQh7QacdmCTjf3hOB5M/v
         2qnf7JGFuCHAsVdfSk7kz1QlsHjd8GyTch9ouHAQu3uXvUHbMOQzo99zUqNXz0r3yliH
         /UrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0wM8V+Ix3jmNi/dljj8gjyUHV3o8ok5UctbniCWFfDxU6MfI28+KRcABnRWz5v+YUI62VpulI+PKBMKRFXEzu@lists.infradead.org
X-Gm-Message-State: AOJu0YyDVvmMGQCFTTIlXeSKt1El4CYebi70gYqo4u8bWk676PwqYG3I
	j5aUHYIIrUfUTpEw068nR3/4eEf0bPdRPG8A0zAH0NHBwoswXMMV15137uvvGdgeiTnJU/XPyu7
	mqHssCa2VFKR4j1HsKXWIAgFL5Mo9x9J1r1JFwEh44NveXMyrwAyOW8E=
X-Gm-Gg: ASbGnct/F2bPSp1LiGJkHFb3OLkX3fyz7xrhVtLwe0K8MJnqUphPc28WhRKV3bd0H3u
	zeuwjxhZWBsBIt3O03rT+dMH1sVSjIei4iBqRcRo03ClHFG89n0UtxjjPIGCguh9TnvO4iRYqIZ
	yndDg4w1nkeKwhWmgNqE0XRJf7gN1D1tRcZA==
X-Google-Smtp-Source: AGHT+IH+k05RenNE75G05lCkPIFd12fSQl1b4MXO59HUeKq46kiZr+jpNbTHEmQSsew+3IME0NcG8hlXcQsODDtf+tw=
X-Received: by 2002:a05:6902:110f:b0:e7b:94da:55dc with SMTP id
 3f1490d57ef6-e7b94da571amr8538048276.13.1747657935953; Mon, 19 May 2025
 05:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250515204201502Kzmj4I6k5Fv2FjqyEjF6n@zte.com.cn>
In-Reply-To: <20250515204201502Kzmj4I6k5Fv2FjqyEjF6n@zte.com.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 14:31:40 +0200
X-Gm-Features: AX0GCFtXdhUci2gSte12YEy9YP5JWc22zhs6HMihigJb0b76jaF6NMhMse_Mf_o
Message-ID: <CAPDyKFrheefitHyBMz11pcUMi=cz_-nLzG9zY9cbYyZfjsQAKg@mail.gmail.com>
Subject: Re: [PATCH] mmc: bcm2835: Use str_read_write() helper
To: long.yunjian@zte.com.cn
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	rjui@broadcom.com, sbranden@broadcom.com, wahrenst@gmx.net, 
	u.kleine-koenig@baylibre.com, fang.yumeng@zte.com.cn, 
	linux-mmc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ouyang.maochun@zte.com.cn, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053217_115989_0DA35A50 
X-CRM114-Status: GOOD (  15.52  )
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

On Thu, 15 May 2025 at 14:42, <long.yunjian@zte.com.cn> wrote:
>
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>
> Remove hard-coded strings by using the str_read_write() helper.
>
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index e5f151d092cd..def054ddd256 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -44,6 +44,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/time.h>
>  #include <linux/workqueue.h>
> +#include <linux/string_choices.h>
>
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/mmc.h>
> @@ -391,8 +392,7 @@ static void bcm2835_transfer_block_pio(struct bcm2835_host *host, bool is_read)
>
>                                 if (time_after(jiffies, wait_max)) {
>                                         dev_err(dev, "PIO %s timeout - EDM %08x\n",
> -                                               is_read ? "read" : "write",
> -                                               edm);
> +                                               str_read_write(is_read), edm);
>                                         hsts = SDHSTS_REW_TIME_OUT;
>                                         break;
>                                 }
> @@ -435,12 +435,12 @@ static void bcm2835_transfer_pio(struct bcm2835_host *host)
>                       SDHSTS_CRC7_ERROR |
>                       SDHSTS_FIFO_ERROR)) {
>                 dev_err(dev, "%s transfer error - HSTS %08x\n",
> -                       is_read ? "read" : "write", sdhsts);
> +                       str_read_write(is_read), sdhsts);
>                 host->data->error = -EILSEQ;
>         } else if ((sdhsts & (SDHSTS_CMD_TIME_OUT |
>                               SDHSTS_REW_TIME_OUT))) {
>                 dev_err(dev, "%s timeout error - HSTS %08x\n",
> -                       is_read ? "read" : "write", sdhsts);
> +                       str_read_write(is_read), sdhsts);
>                 host->data->error = -ETIMEDOUT;
>         }
>  }
> --
> 2.25.1

