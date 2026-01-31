Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF71D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hccb3hGzRfE0pWe/2DvdDWh/oJEG8V4J6kLr70xHuLA=; b=htzdKA6iW+fBB/Fh0cOUqpkZkp
	UVIEFHw83M0mCe1VfCtitzE34LGLhGh3ftM4bmI5QDyxfFDhajmA5cu+GPghvJA5OSEEaCiSHbpDE
	jukD8tNo9xp2Nd7WO7U6d456bp7kkgQycynV270y073YKWmiuRGWsgmCdu/p4jSoGU9bl5iEQmpW+
	jIsSbvOe035Dq5YDXYpPRafOZTxnWRMSRRAIjd36Os2+VjOK9I4D39YE9x+QnwkZU54LiqV0LlD7N
	EJx2qU0woekp3ObJnpPqFWA3AV6uWH4N0s7guSMp/yWcuhahQWByKPBgsj7S2bk/7dDp7/AXF5BX7
	tepdmeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmEV1-00000002pzm-2fxi;
	Sat, 31 Jan 2026 17:11:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmEV0-00000002pzg-2erW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 17:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 724EB60200;
	Sat, 31 Jan 2026 17:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1283EC4CEF1;
	Sat, 31 Jan 2026 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769879463;
	bh=0wbxEMqgrxxmQZZicHWOMx4uuUU4g5CXnAjkLnP92yg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p69zHsumjjhX6NCCrZXmfUhKzux2IDLSktoma1iARLLQr+sIe6JQwlXujRmaXs2rs
	 w6+W0WTgD4FRbwsbJLZKD0qvR0VwJ+s3u+yLes7X3aPjZHa9zaGP++CKAyRTPapqTb
	 II5beglD4YSvSwP4gPY+6zq8EhGkrCyVqitA0uk+ye3x4oy1ZziWX/B9iB2+FNmBoW
	 xA+vR28J16izTgV/WHLvAhly4tzs942Tm1PYlqr3eI3UqOUh82KuOgnjUm8XCuRnSc
	 yTX4rOhI3nJ6kUeAqNmuOWLXc6AZrgKd4YPTq+5BzUqgTxTan0FJxmTIZUJDThdZSt
	 tIlFp9U8A0Gng==
Date: Sat, 31 Jan 2026 17:10:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iio: adc: at91_adc: return proper error code from
 at91_ts_sample()
Message-ID: <20260131171054.2b34e357@jic23-huawei>
In-Reply-To: <20260130135126.136861-1-antoniu.miclaus@analog.com>
References: <20260130135126.136861-1-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 30 Jan 2026 15:51:22 +0200
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> Return -EIO instead of -1 when xscale or yscale read from hardware
> registers is zero. Using -EIO since this indicates unexpected data
> from the hardware rather than an invalid argument.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
This is a little pointless as nothing actually reads the return value.
It might be better to either make that clear by changing the return type
or figure out if it actually is useful for the caller to know this failed.

On it's own this patch gets us very little even though it looks very
sensible in isolation!

Thanks,

Jonathan

> ---
>  drivers/iio/adc/at91_adc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> index 920dd9ffd27a..5e8719d5ac01 100644
> --- a/drivers/iio/adc/at91_adc.c
> +++ b/drivers/iio/adc/at91_adc.c
> @@ -323,7 +323,7 @@ static int at91_ts_sample(struct iio_dev *idev)
>  	xscale = (reg >> 16) & xyz_mask;
>  	if (xscale == 0) {
>  		dev_err(&idev->dev, "Error: xscale == 0!\n");
> -		return -1;
> +		return -EIO;
>  	}
>  	x /= xscale;
>  
> @@ -334,7 +334,7 @@ static int at91_ts_sample(struct iio_dev *idev)
>  	yscale = (reg >> 16) & xyz_mask;
>  	if (yscale == 0) {
>  		dev_err(&idev->dev, "Error: yscale == 0!\n");
> -		return -1;
> +		return -EIO;
>  	}
>  	y /= yscale;
>  


