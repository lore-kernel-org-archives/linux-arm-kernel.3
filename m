Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25A4D10BF7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DC21zz27zupE1oMo+AsXsCNMjPFcuj91U80TqH3FRyg=; b=RP6R5CIKvrjAOHGEiWt5Kwe5s5
	a/Q/DQsOutSJuXOGUYzslrePc6eiQvjQt3UvQw9EHud+HS1De7sX7CtgX5LzkSNNgMEGXYMG8YLOs
	pcJDY3avFQCikqIm0n9bnXqyXqqqBu6meFxcfxn9N6i4JttY466p18+p1uqct/Fk4XIARoAVD9NBZ
	fyZc9XxWo1PEBNzz9S+K0+DYkOkMC1Fetgg2OCcCN6zpgs/hEx+hegfK3zprjx/FFc41a0TZ3kMlO
	7Zg49fDzrg7b6YCC9eQ/frlVZ6LfyCjriAr7hQ7psWMO6VduuBgw08qr6XATPiiXB6r6T90wgxZhC
	VSk71H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fuB-00000006cLa-1ztU;
	Sat, 26 Oct 2024 12:28:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fsQ-00000006c24-1Sbb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB5E5A402CA;
	Sat, 26 Oct 2024 12:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F06AC4CEC6;
	Sat, 26 Oct 2024 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945600;
	bh=vlTJxPv2hpMGHbCdwNowbs1x9acLLoluxWNNFVabxMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dO2Up6eyFA00wtIu1eKIzr4FHLenroJ+GhPOJGXPB30hjWhR7vkq09eQzcjKqya57
	 rJKnZlBhTu1zfFDjvaIQ18QYeDOL08aiaLP0mV3Dl7Z4wsFv5oFRmxVPCusH9NjiQb
	 C0DaH+jMpUg2gydCUy/T6pXM0eJzudxFtlY/0o6zbZzcspwn1GzZ4bWx01JdC2ffuR
	 TWp95dUb3HYQKeBFB+r1fkwPJ33hwaoJ7wOqEMyIIhl72Mrk2C9W/03cLGl5NUGKj+
	 MeqX6HJSdGAENBbPYmuB9zhw7j/sffaJeQH8Q4JebVodN1/+E5D4I00W4G/11oQSTo
	 2tb+KZcb+F+Yw==
Date: Sat, 26 Oct 2024 13:25:47 +0100
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
Subject: Re: [PATCH 4/7] iio: light: veml6030: simplify code in
 write_event_config callback
Message-ID: <20241026132547.481ca1be@jic23-huawei>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-4-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
	<20241024-iio-fix-write-event-config-signature-v1-4-7d29e5a31b00@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_052642_534956_42734B88 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, 24 Oct 2024 11:11:26 +0200
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied.

After patch 7 this will include a shift of a bool which is a little
unusual but valid C.

> ---
>  drivers/iio/light/veml6030.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
> index d6f3b104b0e6be8e095a1ad9f20acb81ce492630..95751c1015909cd80543a559673f435d1a168f68 100644
> --- a/drivers/iio/light/veml6030.c
> +++ b/drivers/iio/light/veml6030.c
> @@ -826,9 +826,6 @@ static int veml6030_write_interrupt_config(struct iio_dev *indio_dev,
>  	int ret;
>  	struct veml6030_data *data = iio_priv(indio_dev);
>  
> -	if (state < 0 || state > 1)
> -		return -EINVAL;
> -
>  	ret = veml6030_als_shut_down(data);
>  	if (ret < 0) {
>  		dev_err(&data->client->dev,
> 


