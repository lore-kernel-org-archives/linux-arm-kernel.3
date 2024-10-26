Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC83BD10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kpjdr2kRgpUw0bQeftTA1pAfUKhXD/L2hFZ3x8J9yG0=; b=mFIAsdf/LLvRUc4VXNaMvALLUu
	HuXQNE4idgubMpqYCXmT6idhReyX4JxYjJCethXvLNWnji6CIQtoliagO9ANBmKEGxZoWY5olxkZC
	GDzY7Zwdh/s7a0rDQjKRPTJt+B6JYLyYY0u6iPswl5eoRyxE+33XkmJ+F9bw0UnfB+jX2aJSN3EPr
	qywS+HuIqOMwZdtZdSK8SY7ClBlFb66VlfUNWVvNy5c3Zq9Ovawb/cvQ9fXll7EG0j+/U2UkRS90C
	Jb9HlaTS1pXg8dh+w3pBZgk/gQQLf270pqwGXW7ZxGrTqwUl+eYkFsWTQVfoNY8Q4dfKh8kNNYYm3
	yanSKeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fp1-00000006bdz-0wT5;
	Sat, 26 Oct 2024 12:23:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fnR-00000006bTS-3Pe0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0CA1AA404FF;
	Sat, 26 Oct 2024 12:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58460C4CEE4;
	Sat, 26 Oct 2024 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945292;
	bh=Ju/lj4vABPXWpilJsZn2ZHii6DTE7FTc99SBlTaAD3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JSvc8r+Uw1DWrTEM5C7W1k7Ks8GEApnqCgs/61ldeB40ISoLzMVAyDjyavK3RZ5oa
	 6b36O30X6KyTXnxMKTnyGyZgaP3ZcTTZBnKw/yBkICpmeNjoOJFCML2FAqcP1ChqP4
	 +GE7WXP+yWqklYIW5YELuuJBm4oVaRqazifC6bNRUtHfvuS/6VIh767cO6KhvjA90k
	 9jF+9jz2RVd9cZP2zYz53XjA94eP6TI/SQ9qjthPG7LTH5bl1slSr5QGiuqH+RZafh
	 8ls170l7gssruKdgFhzEMNE87r26b31zL3ufQILnEDhwmY0/Cy6Q2iKsn5J+RVSeB2
	 85vA/1KemdKvQ==
Date: Sat, 26 Oct 2024 13:20:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Mudit Sharma <muditsharma.info@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Dan Robertson <dan@dlrobertson.com>, Marcelo
 Schmitt <marcelo.schmitt@analog.com>, Matteo Martelli
 <matteomartelli3@gmail.com>, Anand Ashok Dumbre
 <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J
 <jagathjog1996@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Subhajit
 Ghosh <subhajit.ghosh@tweaklogic.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 1/7] iio: light: bh1745: simplify code in
 write_event_config callback
Message-ID: <20241026132025.1d7a700c@jic23-huawei>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-1-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
	<20241024-iio-fix-write-event-config-signature-v1-1-7d29e5a31b00@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_052134_020682_92F0FA1F 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, 24 Oct 2024 11:11:23 +0200
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
There are a few additions needed to the final patch. 
I'll pick up the earlier ones now though.

Applied this one.

> ---
>  drivers/iio/light/bh1745.c | 48 +++++++++++++++++++++-------------------------
>  1 file changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
> index 2e458e9d5d85308fb6a13d9dbd845fa03b56a40e..fc6bf062d4f510886f909509d8115f0cf892f3c4 100644
> --- a/drivers/iio/light/bh1745.c
> +++ b/drivers/iio/light/bh1745.c
> @@ -643,41 +643,37 @@ static int bh1745_write_event_config(struct iio_dev *indio_dev,
>  	struct bh1745_data *data = iio_priv(indio_dev);
>  	int value;
>  
> -	if (state == 0)
> +	if (!state)
>  		return regmap_clear_bits(data->regmap,
>  					 BH1745_INTR, BH1745_INTR_ENABLE);
>  
> -	if (state == 1) {
> -		/* Latch is always enabled when enabling interrupt */
> -		value = BH1745_INTR_ENABLE;
> +	/* Latch is always enabled when enabling interrupt */
> +	value = BH1745_INTR_ENABLE;
>  
> -		switch (chan->channel2) {
> -		case IIO_MOD_LIGHT_RED:
> -			return regmap_write(data->regmap, BH1745_INTR,
> -					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> -							       BH1745_INTR_SOURCE_RED));
> +	switch (chan->channel2) {
> +	case IIO_MOD_LIGHT_RED:
> +		return regmap_write(data->regmap, BH1745_INTR,
> +				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> +						       BH1745_INTR_SOURCE_RED));
>  
> -		case IIO_MOD_LIGHT_GREEN:
> -			return regmap_write(data->regmap, BH1745_INTR,
> -					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> -							       BH1745_INTR_SOURCE_GREEN));
> +	case IIO_MOD_LIGHT_GREEN:
> +		return regmap_write(data->regmap, BH1745_INTR,
> +				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> +						       BH1745_INTR_SOURCE_GREEN));
>  
> -		case IIO_MOD_LIGHT_BLUE:
> -			return regmap_write(data->regmap, BH1745_INTR,
> -					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> -							       BH1745_INTR_SOURCE_BLUE));
> +	case IIO_MOD_LIGHT_BLUE:
> +		return regmap_write(data->regmap, BH1745_INTR,
> +				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> +						       BH1745_INTR_SOURCE_BLUE));
>  
> -		case IIO_MOD_LIGHT_CLEAR:
> -			return regmap_write(data->regmap, BH1745_INTR,
> -					    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> -							       BH1745_INTR_SOURCE_CLEAR));
> +	case IIO_MOD_LIGHT_CLEAR:
> +		return regmap_write(data->regmap, BH1745_INTR,
> +				    value | FIELD_PREP(BH1745_INTR_SOURCE_MASK,
> +						       BH1745_INTR_SOURCE_CLEAR));
>  
> -		default:
> -			return -EINVAL;
> -		}
> +	default:
> +		return -EINVAL;
>  	}
> -
> -	return -EINVAL;
>  }
>  
>  static int bh1745_read_avail(struct iio_dev *indio_dev,
> 


