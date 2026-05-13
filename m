Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2415ACD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTE5jwj84//K1pAyGBUeYf26qQJOExTPwfLhKEBrfZ8=; b=mmnRZbIVa2jiivFkDgqIpEeDn9
	xwgo/GhPaN13RjSChQATnnaYndMKrcqD0r/NJGPn5slP0YqRbD7i2uQh/VLFxOFn2RiaFkyhzTBYl
	D0l7u62LI5zapCjdTMO9+/Bbk/S5+QmRd7KSZ4vJwAA28NPXA4fNGtlfJoNnUx4kkgTI1N5NYO4Ky
	0NWmJVZfAbqYXEmEp8BG8hNCXSYmW40gEXXQJ91BmD6xN/liUvB7ikBqT/scHaL5+DfcJeFo8lXfh
	YbJbeT9UNABpAX0ErVkcio1xiSJ1K4jbC4FChhd30Hbsw+nv4b9bcVG7f9milnBk3aGouBL5qJ4z2
	ArDl3YYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAIl-00000002swe-3jri;
	Wed, 13 May 2026 14:11:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAIk-00000002swN-0CHp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 422EE60126;
	Wed, 13 May 2026 14:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44266C19425;
	Wed, 13 May 2026 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778681465;
	bh=CyAVAcpNGtqCn5j4tWF3NsURVjA1tr9YOJkujq5Zx78=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j/iJOxt3cYeX3hOvNzEVISeWagUQHLRpF9lVYVKc4PgTOLOqL1KC1zPS1lkRSFhXA
	 +GrnmnJO/g6ulxMghuOE1FzXX1D9bQgX4+MEH1eRx0rEw2kzUSqKJ7H96vYDQnc63L
	 kgza8isEDJcmnUPRgLqCy5hinDesW3ebEeGpxe3+mRaQDCgXDY1ryazlUMS43nQvVa
	 lZaVizE9Znncc4w1jZ8vW8/4+xuhlCD7jy5yzV+pa0IIIzI+zb1z17t0sc8j3nuCJT
	 0RL8E/hhTzVzItt2wkHpnrwEeVSLFSok4H04YvrzRUw51g5bojLyz3BXcXcD2lA9n2
	 c+TVLjExVibfg==
Date: Wed, 13 May 2026 15:10:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: sun20i-gpadc: support non-contiguous channel
 lookups
Message-ID: <20260513151055.471cb719@jic23-huawei>
In-Reply-To: <20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl>
References: <20260513-fix-sunxi-gpadc-sparse-channels-v1-1-6c21e290bcee@mmpsystems.pl>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Wed, 13 May 2026 11:51:31 +0200
Michal Piekos <michal.piekos@mmpsystems.pl> wrote:

> Using consumer driver like iio-hwmon which resolve channels thorugh
> io-channels phandles will fail for sparse channels because IIO core

Can we say the "IIO core by default" does this. Otherwise implication
is we don't provide an alternative - whereas the fwnode_xlate() callback
is there to cover this sort of thing.  Otherwise this sounds like we should
be modifying the IIO core rather than the driver.

Otherwise nothing from me to add to what Andy's already covered.

> threats phandle argument as index into channel array.
>         eg. <&gpadc 1> will fail if there is only channel@1 specified
> 
> Add fwnode_xlate which maps DT phandle to the registered channel whose
> chan->channel matches the hardware channel number. It allows sparse
> channel maps to be consumed by drivers like iio-hwmon.
> 
> Tested on Radxa Cubie A5E.
> 
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> ---
>  drivers/iio/adc/sun20i-gpadc-iio.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iio/adc/sun20i-gpadc-iio.c b/drivers/iio/adc/sun20i-gpadc-iio.c
> index 861c14da75ad..95f34a352158 100644
> --- a/drivers/iio/adc/sun20i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun20i-gpadc-iio.c
> @@ -139,8 +139,21 @@ static irqreturn_t sun20i_gpadc_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int sun20i_gpadc_fwnode_xlate(struct iio_dev *indio_dev,
> +		const struct fwnode_reference_args *iiospec)
> +{
> +	int i;
> +
> +	for (i = 0; i < indio_dev->num_channels; i++)
> +		if (indio_dev->channels[i].channel == iiospec->args[0])
> +			return i;
> +
> +	return -EINVAL;
> +}
> +
>  static const struct iio_info sun20i_gpadc_iio_info = {
>  	.read_raw = sun20i_gpadc_read_raw,
> +	.fwnode_xlate = sun20i_gpadc_fwnode_xlate,
>  };
>  
>  static void sun20i_gpadc_reset_assert(void *data)
> 
> ---
> base-commit: 1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
> change-id: 20260513-fix-sunxi-gpadc-sparse-channels-2b6b2063bd49
> 
> Best regards,
> --  
> Michal Piekos <michal.piekos@mmpsystems.pl>
> 


