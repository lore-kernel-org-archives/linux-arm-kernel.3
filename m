Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F73DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ohMt/io7GRBQGg3h/Uhn9tyv62eFGqFitM9EWRgvNE=; b=ymJMdbUhGPKMR3GURS6VUyrwGL
	9RMKJMr2u0CaWIH4DvwtlJ42Pe5dAcq0lF+eoWOBf4izdzBlI+m1lckktcLzTBanTlodglPURmHIU
	FwcHs+o6vwLA9D3ckXYLj7h1Vm1krXPwUH2XRPCjguwuztLuqoTxz+RPzSBFEOcBd7KxOm92iSHJ8
	svx7fpN04eQSdkIDl7cICSDDtcfjZx2LGr9T5L5AteVlkr+3wOjgdTny1uoQ6CdZtQVaEuZ3kFRoa
	rDnbcbn3GzyKDEeqSp3iViK1uSL8GPqdPqYqI8y+UMiuEMBIu7GyQGIU2901vSpsqix0gTiIiNFkC
	sejYg4wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pAv-00000004BNG-2AwC;
	Mon, 21 Apr 2025 11:18:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p61-00000004Aty-3OEu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7576E61154;
	Mon, 21 Apr 2025 11:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B71C4CEE4;
	Mon, 21 Apr 2025 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745234033;
	bh=EUhH7aYFac9sc/wyQBo7qu9EZp51eX8uWaVTZ7t44SY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z6iQy0ik2BTl7s407AP+AfzItY2uswsoguchw3FTINiQsSrBLAuEZYES6USY//DtU
	 dbGQXhuT7sZQDUDlNVmOXdb6gqoYTT9zz6aAOyUN+D8qdUwlQV8NSJtS+aqZ8wuzWs
	 LirPseKUdVmMDj9uMZ8GPSw4gcnRaHhmJXfPzvDzGHJPYtkQQgta9fvLZehOmlHbBJ
	 dM/xZ01zxcy7IIso4vPq3WgwbhE8gxiGE6YuQme/B3pC4F1nS+3gpqS9Alq7++1UO4
	 b3pY8j/0zwZGNuG1g2mvbKB1ZezgdUgi6mzX+PToeB5c0LmCJyr41X1GXyTDF0JXJc
	 VAU4B6xPAE1Vg==
Date: Mon, 21 Apr 2025 12:13:41 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 04/10] iio: adc: mxs-lradc-adc: use struct with
 aligned_s64 timestamp
Message-ID: <20250421121341.49e28ddf@jic23-huawei>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
	<20250418-iio-prefer-aligned_s64-timestamp-v1-4-4c6080710516@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
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

On Fri, 18 Apr 2025 14:58:23 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use a struct with aligned s64_timestamp instead of a padded array for
> the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
> to see the correctness of the size and alignment of the buffer.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/adc/mxs-lradc-adc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
> index 92baf3f5f5601b863c694eb03b6d8f287e4fe6ab..73e42f0ebcaeaaa437ba5c64ecdd7759a1191e6c 100644
> --- a/drivers/iio/adc/mxs-lradc-adc.c
> +++ b/drivers/iio/adc/mxs-lradc-adc.c
> @@ -116,7 +116,10 @@ struct mxs_lradc_adc {
>  
>  	void __iomem		*base;
>  	/* Maximum of 8 channels + 8 byte ts */

If we were keeping this (I think the buffer solution is better)
then we could drop that coment as to me this just became self describing code.
That's why I like these structures where we can use them with out confusion!

> -	u32			buffer[10] __aligned(8);
> +	struct {
> +		u32 data[8];
> +		aligned_u64 ts;
aligned_s64 

I've not idea why timestamps are signed, but they always have been!

> +	} buffer;
>  	struct iio_trigger	*trig;
>  	struct completion	completion;
>  	spinlock_t		lock;
> @@ -418,14 +421,14 @@ static irqreturn_t mxs_lradc_adc_trigger_handler(int irq, void *p)
>  	unsigned int i, j = 0;
>  
>  	for_each_set_bit(i, iio->active_scan_mask, LRADC_MAX_TOTAL_CHANS) {
> -		adc->buffer[j] = readl(adc->base + LRADC_CH(j));
> +		adc->buffer.data[j] = readl(adc->base + LRADC_CH(j));
>  		writel(chan_value, adc->base + LRADC_CH(j));
> -		adc->buffer[j] &= LRADC_CH_VALUE_MASK;
> -		adc->buffer[j] /= LRADC_DELAY_TIMER_LOOP;
> +		adc->buffer.data[j] &= LRADC_CH_VALUE_MASK;
> +		adc->buffer.data[j] /= LRADC_DELAY_TIMER_LOOP;
>  		j++;
>  	}
>  
> -	iio_push_to_buffers_with_ts(iio, adc->buffer, sizeof(adc->buffer),
> +	iio_push_to_buffers_with_ts(iio, &adc->buffer, sizeof(adc->buffer),
>  				    pf->timestamp);
>  
>  	iio_trigger_notify_done(iio->trig);
> 


