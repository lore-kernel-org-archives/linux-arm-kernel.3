Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE869C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 12:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzYzmOCo4fFSsMnHLG0uGWwDmDhfeREZf5yKIYvoD6Q=; b=iiVRDARsmunFJafPvzgefV4tAz
	otI1muHROyDot+FPH/sSQdDePcRAK8z+OZzT5Swm05DAJWRre5IYD8sLkubsLkmAjYSmR+wFpYoyP
	WUZfEofeFATUYAwfTn9QU8FUUFu/H5j233QJhZ4fRoDPb/eILFtvt5p7/iIfNSfqpZpnFuDYTbSSS
	nrB+/2M/bGdU2rPxRYzSmyPom4g985k4FJjXI7TKGFeCg1YZLUFs4Dj2ze7ERfeF8qpOfddDAGMSd
	kphA8IdtBeDBXyHGum3SY4OINuOP4wbmmvRfS64Mf7oCv723ysS++kPq5eZ7PMEI6MQRTZe0FsG1s
	5O8fVxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQPvv-00000001Ewy-0skB;
	Sat, 14 Jun 2025 12:24:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQPte-00000001EpN-0CBL;
	Sat, 14 Jun 2025 12:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCD5CA46DDC;
	Sat, 14 Jun 2025 12:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CA6C4CEEB;
	Sat, 14 Jun 2025 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749903724;
	bh=rGBMrxAgX1GCHG976Dof9q8HsYSXp+4s7rfg/Gplu5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ObgiNchWi3Q5QDAhQdCv9+9wM+/Y73M6FLFMuT1AL13DUqXoevDQbIE7FPcMWErzF
	 C2sHbXf/5OPnZzoSPF5TfoXuedHe7TK1j/6FNcRGc7mvzemEn8Zavwu6S6xSSz/Sft
	 zw8KfrwO0JhiVw0cUCtqDIV/gAx5fme+3fzaCgzOYmS2oykxN33M7pl5WD0F4AzNrn
	 xwKZrlAiL+KvXJpMKO++Tx4aCFA496wFKbZXAnqntqbP6QdHCsBFXVaL0dNk6es71L
	 mo+Z48ZH+07MZORsjap81CJg82mJ8dVtw+HbLZE+WZAE8XphIYu25AKi45mXs+EgXn
	 XX+d9+LHp5hBw==
Date: Sat, 14 Jun 2025 13:21:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko
 Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Francesco Dolcini
 <francesco@dolcini.it>, =?UTF-8?B?Sm/Do28=?= Paulo =?UTF-8?B?R29uw6dhbHZl?=
 =?UTF-8?B?cw==?= <jpaulo.silvagoncalves@gmail.com>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, kernel@pengutronix.de,
 Oleksij Rempel <o.rempel@pengutronix.de>, Roan van Dijk <roan@protonic.nl>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Mudit Sharma
 <muditsharma.info@gmail.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, =?UTF-8?B?T25kxZllag==?= Jirman
 <megi@xff.cz>, Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 16/28] iio: imu: inv_icm42600: use = { } instead of
 memset()
Message-ID: <20250614132150.6f4a29a3@jic23-huawei>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-16-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
	<20250611-iio-zero-init-stack-with-instead-of-memset-v1-16-ebb2d0a24302@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_052206_228533_0D94AC8E 
X-CRM114-Status: GOOD (  17.95  )
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

On Wed, 11 Jun 2025 17:39:08 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.

This one isn't as obvious as many as the zeroing was in a loop
and now it's at declaration.

It's fine because we always copy over the same elements.

I'll leave this whole series a little longer in case we are missing
subtle cases like this. (but ones where it actually does make a difference!)

Jonathan


> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c | 5 ++---
>  drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
> index e6cd9dcb0687d19554e63a69dc60f065c58d70ee..dbd315ad3c4d2bd5085f7cd3cdc6de4391b1c896 100644
> --- a/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
> +++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_accel.c
> @@ -902,7 +902,8 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
>  	const int8_t *temp;
>  	unsigned int odr;
>  	int64_t ts_val;
> -	struct inv_icm42600_accel_buffer buffer;
> +	/* buffer is copied to userspace, zeroing it to avoid any data leak */
> +	struct inv_icm42600_accel_buffer buffer = { };
>  
>  	/* parse all fifo packets */
>  	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
> @@ -921,8 +922,6 @@ int inv_icm42600_accel_parse_fifo(struct iio_dev *indio_dev)
>  			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
>  							st->fifo.nb.total, no);
>  
> -		/* buffer is copied to userspace, zeroing it to avoid any data leak */
> -		memset(&buffer, 0, sizeof(buffer));
>  		memcpy(&buffer.accel, accel, sizeof(buffer.accel));
>  		/* convert 8 bits FIFO temperature in high resolution format */
>  		buffer.temp = temp ? (*temp * 64) : 0;
> diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
> index b4d7ce1432a4f4d096599877040a89ede0625e0b..4058eca076d8b03a2290535eedffa0a74098d739 100644
> --- a/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
> +++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_gyro.c
> @@ -806,7 +806,8 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
>  	const int8_t *temp;
>  	unsigned int odr;
>  	int64_t ts_val;
> -	struct inv_icm42600_gyro_buffer buffer;
> +	/* buffer is copied to userspace, zeroing it to avoid any data leak */
> +	struct inv_icm42600_gyro_buffer buffer = { };
>  
>  	/* parse all fifo packets */
>  	for (i = 0, no = 0; i < st->fifo.count; i += size, ++no) {
> @@ -825,8 +826,6 @@ int inv_icm42600_gyro_parse_fifo(struct iio_dev *indio_dev)
>  			inv_sensors_timestamp_apply_odr(ts, st->fifo.period,
>  							st->fifo.nb.total, no);
>  
> -		/* buffer is copied to userspace, zeroing it to avoid any data leak */
> -		memset(&buffer, 0, sizeof(buffer));
>  		memcpy(&buffer.gyro, gyro, sizeof(buffer.gyro));
>  		/* convert 8 bits FIFO temperature in high resolution format */
>  		buffer.temp = temp ? (*temp * 64) : 0;
> 


