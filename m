Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DE3E6F06F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQCjREs1+6w6Vuj3FaDrzLFl1KEdrXp1vw4dVAgU0UM=; b=ir7/ITaFFmd4K3DndLOpAF3gcq
	w4b8SLGb7TuHWlCREiNvWCt+N0tqn7Br5op3Ff6sjUrd0mGcwg5dtYzfrcXEP6Sq/UCddLqyaw9xw
	DtemQ13zTDG0rtzROfTqkLnDwiOuMxtddnkUrR6KhzsrYoSWxI8OYdxHDwQpfyIL9MPGxJUSdehnd
	wSksrIFfX1HvPkrsBmoaJkGDn7LniWAXOtbTn6UkpT6dM9rBVm7yrUW05wm/YpS7+qb/V1Lw1YY2L
	rqie0WeOcT2w2d+Y4Hp+hheZr+EZ8aFF3FaPZD7WNxGKuFw2JeaDz13DU6YugyoYMZkkd2gmhUgtL
	RVBG71AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vj0-00000007saF-2pMy;
	Fri, 01 Nov 2024 17:46:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ub5-00000007hAs-0zUp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A27DF5C4BEC;
	Fri,  1 Nov 2024 16:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C779C4CECD;
	Fri,  1 Nov 2024 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730478842;
	bh=mV4filxoSKBiK71CYZhpWrrl9CqzhvPDqtVuqoioWyI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ku5wNbzgaB7PBFzp01OX7dN3Qoocj0oms6qDky3kymDhlxzCHfVXQhlhs8tl17TVg
	 u5WqRUhWJYWicQ1JqAXejS0of8h6nH2RHHvzmXtKZenX6byI10t0qxgDeRH/dHoyzO
	 QddUeSVQoH2vSOThk/YmXBMZF+MsXZ5bh+7/QWKDIbWBaPGawUnwVv3C5ZAtKTGhFf
	 ilTtMm1/MdrZi39812ZCmE9r1958q6x50Z94xSpvsurovX907vwQFdxo6sQtA83H7N
	 vUBitiqwDTldBfSg5zHPTjTcFZtDo9ZUYO1yVvyGqU46PnLZRtocjnIhh7Ej8oiPl5
	 eFA743SovKREQ==
Date: Fri, 1 Nov 2024 16:33:49 +0000
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
Subject: Re: [PATCH v2 08/15] iio: accel: mma9551: use bool for event state
Message-ID: <20241101163349.6b827eaa@jic23-huawei>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-8-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
	<20241031-iio-fix-write-event-config-signature-v2-8-2bcacbb517a2@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_093403_399581_BD20B2C8 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, 31 Oct 2024 16:27:03 +0100
Julien Stephan <jstephan@baylibre.com> wrote:

> Since the write_event_config callback now uses a bool for the state
> parameter, update the signature of the function it calls accordingly,
> and use a bool array for event_enabled.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Applied.
> ---
>  drivers/iio/accel/mma9551.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
> index 605022f5239a6412827f4ba059aa18d490908720..6d73eec951263956f314f82542becbbae933de91 100644
> --- a/drivers/iio/accel/mma9551.c
> +++ b/drivers/iio/accel/mma9551.c
> @@ -45,7 +45,7 @@ enum mma9551_tilt_axis {
>  struct mma9551_data {
>  	struct i2c_client *client;
>  	struct mutex mutex;
> -	int event_enabled[3];
> +	bool event_enabled[3];
>  	int irqs[MMA9551_GPIO_COUNT];
>  };
>  
> @@ -162,7 +162,7 @@ static int mma9551_read_event_config(struct iio_dev *indio_dev,
>  
>  static int mma9551_config_incli_event(struct iio_dev *indio_dev,
>  				      enum iio_modifier axis,
> -				      int state)
> +				      bool state)
>  {
>  	struct mma9551_data *data = iio_priv(indio_dev);
>  	enum mma9551_tilt_axis mma_axis;
> @@ -174,7 +174,7 @@ static int mma9551_config_incli_event(struct iio_dev *indio_dev,
>  	if (data->event_enabled[mma_axis] == state)
>  		return 0;
>  
> -	if (state == 0) {
> +	if (!state) {
>  		ret = mma9551_gpio_config(data->client,
>  					  (enum mma9551_gpio_pin)mma_axis,
>  					  MMA9551_APPID_NONE, 0, 0);
> 


