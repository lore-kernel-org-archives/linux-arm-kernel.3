Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478FAD10BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0plPXDnOJyhdLZ4QAS0L6bxoR/JVZWmlkOGmQwv1gU=; b=3POJd3Ga8ocXOOhXzQayRD+uss
	WuwPTT8Q/cTyXd63M71FGvTegKEQZ9de/o3T76QYNSZMdJEmYpfThnXm5Jy1Ixy59xzax23bg8ZHf
	CLHbBp3Hu1bIE7vMfkpdDAYcXvgXgAyB3c7IJ2+F0nHBATiTZts+DWayLdX/EXurKmybSACjY4YyS
	uofMFIZ0o85d+rnUIIXUb0aStHP67RG1Uc/uE0JIdYLEOmxsTj55Dtg6DEimqw4t7Ngu8MsuBTJsD
	2pKHJHTPcV4aNWZBhbqNjrixHj6RQT/r0+2LG3cidBMrqgXCUnYpfJfsVWCYf6EHqjvViO076iwVn
	RgJJy7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fyV-00000006cvM-0Bwb;
	Sat, 26 Oct 2024 12:32:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fwu-00000006cfH-09ja
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 12:31:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 303D95C0440;
	Sat, 26 Oct 2024 12:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964B1C4CEC6;
	Sat, 26 Oct 2024 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945879;
	bh=R/H1PsXY01GRskZLD70K/F7ZGE40dFF0NFTDLydVC68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lUJk+S/MQmFzr4RKHIxhUiy2zUnLAqzIEuKoF4/RJ1b6grii7PG0WGE0zSq56hwXz
	 bWZO93/MhN9t4cymKBLENf365sT7y+crOFNauUI5/RvZ3zaOv7kt5bcPrMwphM1Pw8
	 amChXnPLlCREf8Gn5pnVGKp7lsB5xQZr6JDdOJQ2fEdjoocIN92Gqff0Bwznd49FIY
	 69LG+TEsmW4gnqlk6xBMe+DvUZapZFvbil1wxVhwR7RrGECOGpNnnqj3SuXEakYgDB
	 bZvuR5tsKw6XrN+EsFA0ekPrkTsn+jMQMjRU+7inIPiCc4odTMEFBnRjomwwpsRkF6
	 NsgwNdAKhGcug==
Date: Sat, 26 Oct 2024 13:30:39 +0100
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
Subject: Re: [PATCH 6/7] iio: light: stk3310: simplify code in
 write_event_config callback
Message-ID: <20241026133039.10742c75@jic23-huawei>
In-Reply-To: <20241024-iio-fix-write-event-config-signature-v1-6-7d29e5a31b00@baylibre.com>
References: <20241024-iio-fix-write-event-config-signature-v1-0-7d29e5a31b00@baylibre.com>
	<20241024-iio-fix-write-event-config-signature-v1-6-7d29e5a31b00@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_053120_158212_C6EDB4D0 
X-CRM114-Status: GOOD (  17.70  )
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

On Thu, 24 Oct 2024 11:11:28 +0200
Julien Stephan <jstephan@baylibre.com> wrote:

> iio_ev_state_store is actually using kstrtobool to check user
> input, then gives the converted boolean value to the write_event_config
> callback.
> 
> Remove useless code in write_event_config callback.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
This one is odd.  The field is 1 bit so I've no idea why checking against 7
would ever have made sense.

Applied, but if anyone is familiar with this part I would like more
eyes on that code to see if there is a bug hiding there.

Jonathan

> ---
>  drivers/iio/light/stk3310.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index ed20b67145463d253a0dff28a4c1c3e02e710319..c6f950af5afa0f77a617bd2baf0a08eef5ec26f0 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c
> @@ -330,9 +330,6 @@ static int stk3310_write_event_config(struct iio_dev *indio_dev,
>  	struct stk3310_data *data = iio_priv(indio_dev);
>  	struct i2c_client *client = data->client;
>  
> -	if (state < 0 || state > 7)
> -		return -EINVAL;
> -
>  	/* Set INT_PS value */
>  	mutex_lock(&data->lock);
>  	ret = regmap_field_write(data->reg_int_ps, state);
> 


