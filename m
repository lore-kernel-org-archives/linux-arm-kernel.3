Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50131FC9EF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jw0BSHmnce+T9m/nuiRmjnv6Vq6GQqbCLhHiTRnUepc=; b=C3hM9++/f4wlK1o5qAn70WCUyW
	2bBqG+7O3r29r6jWfTpEn9qk7A6oqPL8b5OuUFGXTfONHcSC6Otkcim+PXoZgk3pjiIoUXta2a4Au
	ROjhS/Ti7BVxADeqAKpXoHaD6NdNonYgV5H1M4plNG1SsqxnaJ5lqg6dn0KKorS8peXUk93lzTlhe
	yq2vp/iFBDZcm7sayTxL05twjPLwyPZl54DrL90NpPpV1q3xJQRDYBNSScYp+WsbiNHTJkvLOYRPX
	7QbXU132ytQNjDYUAqNau65qwKDMIcrTRQ/PV1F31c4R7jngNoY2YJZDypgje/+ejlhkXOeJhOxc1
	SQbKlPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyqyI-00000005CNB-01yp;
	Sat, 07 Mar 2026 12:41:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyqyG-00000005CN3-2C7K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 12:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FAF260018;
	Sat,  7 Mar 2026 12:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA09C19422;
	Sat,  7 Mar 2026 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772887286;
	bh=cohMBJH2d1BVbpUwzitQc8rDzCnYSvKbs9OXEa4sgqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AGDkphF9NBOJWhRSQ2if2XUnZ9H5dw6ibncSjdIWFCmQqIFUcQdAqqk+5gg+66H0R
	 eF0GvvNF9VAD4S1bGO5JtnSDydZzkBbtlqgvbvIfPJq7LgCF0mI/iYZZTIn/SDMzBv
	 n3cqoW+M22vs+xJsuTcYpeuhXf5IHBUK2eupsbVyXonLPkqpgZDTJzaSgHW4E1dZ6R
	 wKUoX0RKn8Fmh/yr1eOZxvOPySV9+H2/574N7+h7/olIrK5bZF4hOPonQhTt1R6LbA
	 aBsnZHXNXRExAvuubWBOT6SjDS6EpCio/pP3ojkDSwVCfexIvGmEVdarS9w8P+wthE
	 05yvlaWcrD+UQ==
Date: Sat, 7 Mar 2026 12:41:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Christofer Jonason <christofer.jonason@guidelinegeo.com>
Cc: lars@metafoo.de, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, michal.simek@amd.com, victor.jonsson@guidelinegeo.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
Message-ID: <20260307124118.1d527749@jic23-huawei>
In-Reply-To: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
References: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
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

On Wed,  4 Mar 2026 10:07:27 +0100
Christofer Jonason <christofer.jonason@guidelinegeo.com> wrote:

> xadc_postdisable() unconditionally sets the sequencer to continuous
> mode. For dual external multiplexer configurations this is incorrect:
> simultaneous sampling mode is required so that ADC-A samples through
> the mux on VAUX[0-7] while ADC-B simultaneously samples through the
> mux on VAUX[8-15]. In continuous mode only ADC-A is active, so
> VAUX[8-15] channels return incorrect data.
> 
> Since postdisable is also called from xadc_probe() to set the initial
> idle state, the wrong sequencer mode is active from the moment the
> driver loads.
> 
> The preenable path already uses xadc_get_seq_mode() which returns
> SIMULTANEOUS for dual mux. Fix postdisable to do the same.
> 
> Fixes: bdc8cda1d010 ("iio:adc: Add Xilinx XADC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christofer Jonason <christofer.jonason@guidelinegeo.com>

I'll leave this on list for a little longer as I'd really like a confirmation
of this one from the AMD Xilinx folk.

Thanks,

Jonathan

> ---
> Changes in v2:
>   - Align continuation line to opening parenthesis (Andy)
>  drivers/iio/adc/xilinx-xadc-core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/xilinx-xadc-core.c b/drivers/iio/adc/xilinx-xadc-core.c
> index e257c1b94..3980dfacb 100644
> --- a/drivers/iio/adc/xilinx-xadc-core.c
> +++ b/drivers/iio/adc/xilinx-xadc-core.c
> @@ -817,6 +817,7 @@ static int xadc_postdisable(struct iio_dev *indio_dev)
>  {
>  	struct xadc *xadc = iio_priv(indio_dev);
>  	unsigned long scan_mask;
> +	int seq_mode;
>  	int ret;
>  	int i;
>  
> @@ -824,6 +825,12 @@ static int xadc_postdisable(struct iio_dev *indio_dev)
>  	for (i = 0; i < indio_dev->num_channels; i++)
>  		scan_mask |= BIT(indio_dev->channels[i].scan_index);
>  
> +	/*
> +	 * Use the correct sequencer mode for the idle state: simultaneous
> +	 * mode for dual external mux configurations, continuous otherwise.
> +	 */
> +	seq_mode = xadc_get_seq_mode(xadc, scan_mask);
> +
>  	/* Enable all channels and calibration */
>  	ret = xadc_write_adc_reg(xadc, XADC_REG_SEQ(0), scan_mask & 0xffff);
>  	if (ret)
> @@ -834,11 +841,11 @@ static int xadc_postdisable(struct iio_dev *indio_dev)
>  		return ret;
>  
>  	ret = xadc_update_adc_reg(xadc, XADC_REG_CONF1, XADC_CONF1_SEQ_MASK,
> -		XADC_CONF1_SEQ_CONTINUOUS);
> +				  seq_mode);
>  	if (ret)
>  		return ret;
>  
> -	return xadc_power_adc_b(xadc, XADC_CONF1_SEQ_CONTINUOUS);
> +	return xadc_power_adc_b(xadc, seq_mode);
>  }
>  
>  static int xadc_preenable(struct iio_dev *indio_dev)


