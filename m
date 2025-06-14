Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285E6C71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMdR4F0kDjtGSt4t2YdJTUUdFd23vQoJT8ytliq3haA=; b=wSM34Dm8VWiwwgccgGYMw64+Py
	Sy/jagXHJ49atqdN4CCFuvQsToS2mLviPEIhdWshLcoSliyCMYaSJ82v8dYIeBERVIoBaCh9f55ic
	ua4fObzI2kdYESsIa6PYQNOwjYhbLW5Mq1Q3v80QdUo+iKvu3nGoQ/lqVWkMVrGtV73mKNrmLe5gK
	ImdNkd/MYUSU/JqIJntwnEbLk4r9QiSbuVFjgaHaQfswqTstpWCp8WTJrOTk3oqs+CooYAS4ppv/T
	G9USBmzEU29woaxaJP7lNoqAbqseqvXnMYJzBRI794vdDWys3AxCgbSVCs/EKZDDPGGSjlDAjG/Ma
	usJLL1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQPyA-00000001F5Y-3wmo;
	Sat, 14 Jun 2025 12:26:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQPuo-00000001Etm-15D2;
	Sat, 14 Jun 2025 12:23:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1F51A50A79;
	Sat, 14 Jun 2025 12:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2293FC4CEEB;
	Sat, 14 Jun 2025 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749903796;
	bh=avQIQVx7PU9oe/rVrLoBrchrvxBkxtx/0zHOHlcJODc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pgti5zy4ItelGapySex+FZlobPH1ZsV8BcOmcj3kvZ6Snf8tCTF9OmjDGY3m/b9Aj
	 9TOcW6MkYFqsFdxt+Yd8DvskBa347QChTcLoSzKscD/3BPjAM6oDWD4aqEtqGLCFHJ
	 gfWHC6vIp9nCB2k7zjGv6UrQnDbSalAu/DY9Rn7uorWpFfqbpjRt6sqse2u82ZxUuN
	 KFqL9+qjeWTWlaQcSqmx8HfFGcjFxDTQdf5vkViKZkNT+3gXdRlvYPjvJGaSam1uEH
	 jcn/7MjIf2gi+25/9/TexlgWxUj9VGGmJlktRIIxCG1MglzTHDP9SYeq4mFLCL8x9F
	 PsUHqZaN26mdg==
Date: Sat, 14 Jun 2025 13:23:02 +0100
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
Subject: Re: [PATCH 25/28] iio: pressure: mprls0025pa: use = { } instead of
 memset()
Message-ID: <20250614132302.1e134315@jic23-huawei>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-25-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
	<20250611-iio-zero-init-stack-with-instead-of-memset-v1-25-ebb2d0a24302@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_052318_432210_CA5A11DE 
X-CRM114-Status: GOOD (  17.81  )
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

On Wed, 11 Jun 2025 17:39:17 -0500
David Lechner <dlechner@baylibre.com> wrote:

> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.
> 
> The initialize of the cmd value is trivial so it can be moved to the
> array initializer as well.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  drivers/iio/pressure/mprls0025pa_i2c.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/pressure/mprls0025pa_i2c.c b/drivers/iio/pressure/mprls0025pa_i2c.c
> index 1a48f8d43d716b28b8fceb8e1a06d63a73a74a86..79811fd4a02b370b3fde8bd67a5115a3934f8614 100644
> --- a/drivers/iio/pressure/mprls0025pa_i2c.c
> +++ b/drivers/iio/pressure/mprls0025pa_i2c.c
> @@ -44,10 +44,7 @@ static int mpr_i2c_write(struct mpr_data *data, const u8 cmd, const u8 unused)
>  {
>  	int ret;
>  	struct i2c_client *client = to_i2c_client(data->dev);
> -	u8 wdata[MPR_PKT_SYNC_LEN];
> -
> -	memset(wdata, 0, sizeof(wdata));
> -	wdata[0] = cmd;
> +	u8 wdata[MPR_PKT_SYNC_LEN] = { cmd };

Slight preference for trailing comma after cmd,

>  
>  	ret = i2c_master_send(client, wdata, MPR_PKT_SYNC_LEN);
>  	if (ret < 0)
> 


