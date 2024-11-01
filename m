Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7975E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HSZ0auosaznmQu7HOWA8W9pe9rL1Czf8Jn4U+l3h/I=; b=ORzxNsGZwNw2h2eFlw0wCdie57
	Her480jhXpwi/FUc34Bb59wypPcD69u3iwEVfdJYd0Oc0ZveAHNlUcKzO69aQPFCQUjXW38wBiB3K
	KYu72Pxm86XdyEDEsSvczcwIlZNs4wm56vUwLt7RIHx5mP8LtBiJsaSJZqc3/9wowJ0hkj1UnlpM1
	AIzaGnp9DPYUUThEtAh/Wzw7HSETuWU6EvskvPALjcZBVJl4wfoTngPh4wLhiJA+fxquI5KBFWKv0
	8BuMjODWDT3lY8y7UFazgXhUChYI4+psaC2bMtTU8zQkqyrW8f5ERUZebGwleHp+VKQkwcdt4mZ67
	VmkAFhtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tfq-00000007We6-00uy;
	Fri, 01 Nov 2024 15:34:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdu-00000007W0n-0dcP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 732EBA443D7;
	Fri,  1 Nov 2024 15:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB1BC4CECD;
	Fri,  1 Nov 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475172;
	bh=eA6sS7IrYwjajIXFNQUoLe6SENHwun0qV7uEqwc+0NQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=a1uOO8A9pfM8WLPoRG18XrKF5+1d2xT6jefKmyNwGStSAA0rRVPyClCMwQDVlfo6b
	 CDjhRIsoP4G+xNsWGL3JHgccSZszyX1hnFFvEAN1FO8gaQ42f/eGb8j25LmNcvvLyO
	 kB85rKqEj/WKRrEOb4YhPSluUMA3GsCXeKRiXZXuQ+4psGlZoYwIHHtYahkQXmEm7p
	 z5MTPLZFt0GdZM/I2VvZmUSqfNkidvpUKYIe+iyV0xmk7RR0BfLpo73LO+UecHnuuq
	 +yrG59A8512fb+Tdxz9+RmU245U+91mCbX3NzCWd8VsdjI3gc+911PQWC5NpzRcyDe
	 bKPCA6CZb8l8Q==
Date: Fri, 1 Nov 2024 15:32:40 +0000
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
Subject: Re: [PATCH v2 01/15] iio: light: ltr390: simplify code in
 write_event_config callback
Message-ID: <20241101153240.26c6c5ea@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-1-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-1-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_083254_620193_E78A8680 
X-CRM114-Status: GOOD (  17.36  )
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

On Thu, 31 Oct 2024 16:26:56 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Given these are good cleanup even without the final patches I'm going to
pick them up as I go. Maybe I'll end up taking the lot though!

Applied this one.

Thanks

Jonathan

> ---
>  drivers/iio/light/ltr390.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/light/ltr390.c b/drivers/iio/light/ltr390.c
> index 8e0a3fc3d923a6f65d2a629c87e7bfd35d82a507..3bdffb6360bcbaab4df1a2d39c8ea3813b5d6bd3 100644
> --- a/drivers/iio/light/ltr390.c
> +++ b/drivers/iio/light/ltr390.c
> @@ -558,10 +558,7 @@ static int ltr390_write_event_config(struct iio_dev *indio_dev,
>  	struct ltr390_data *data = iio_priv(indio_dev);
>  	int ret;
>  
> -	if (state != 1  && state != 0)
> -		return -EINVAL;
> -
> -	if (state == 0)
> +	if (!state)
>  		return regmap_clear_bits(data->regmap, LTR390_INT_CFG, LTR390_LS_INT_EN);
>  
>  	guard(mutex)(&data->lock);
> 


