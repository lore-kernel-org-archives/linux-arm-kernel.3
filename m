Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B49BD10C0E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 11:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozzh+mi9bweZfD8pr6T6m6+DXdjWD5KFCtCDy7FmhFE=; b=y/5y6GtUwxM/bfWRrid/j1HS2u
	n90djnkS4yN2DEnzQI1s8Mada1mgnhWOXoTwQ9v2dOQdZqyEfvB9yXFhNNrMLsswE36Tc7d14cviA
	4WUNFM6lAlTrjRlOCyUTlPe4oiSK2HKt/Kj5w26OgBDVcXwA+XekFpDKVI13miVnrPuLQT+95ucqi
	XQStbdNSpJdz39d0E43OmSoMQjeDAUL8uxOUUi+FZo5n8FZ/EQqwnEJ61Vun9uMntTPeboR0Jtqou
	25N4ugxyAFBSMJTbAHJJqZaRCBl5dBeag756r42tBAnd2Ec/M3jaH1xHjakMfHeGAyjx4dIIj7dWX
	1VfM9lfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7YiG-0000000BL8o-2eLc;
	Sun, 03 Nov 2024 11:24:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Yga-0000000BL2J-48Fi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 11:22:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 221EFA401F9;
	Sun,  3 Nov 2024 11:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68023C4CECD;
	Sun,  3 Nov 2024 11:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730632942;
	bh=rojxZqDQYmo7DcaabxpY+qtg25SoBSbQIlcnA6osyJw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SMuhZ73RSbfxkOVpJ71Fpb2kdzTjWQp4utVDK1cYMBga+Y9ldKNQNO6JdoVCpiUzi
	 ldZxXWejGjuoh/mttBC91vjRPBeD5CaLuxzqUXg5WNZYRg3LGw7WUhZlnEDQ3IOgWp
	 t0YArjF1QmzwZJ9QErSzlQEe9RdJFLi5l30Yp1ikl2yu8lwJe8R+X/2PtfgtGvJiD6
	 47FfeL33TwgYT1D0YZT/jKVQY3rcRqNJZiPV990lXtONr/brsrv90vrnsiFZs3vS4x
	 CXSYmBxelswPO8yaIDyHklTeDtkona74buBXRZyAW6uti9etKk3CWqAZZtdGGhwGqn
	 XKSVTianPzfMQ==
Date: Sun, 3 Nov 2024 11:22:08 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Kaustabh
 Chakraborty <kauschluss@disroot.org>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
 <trabarni@gmail.com>, Ondrej Jirman <megi@xff.cz>, Uwe =?UTF-8?B?S2xlaW5l?=
 =?UTF-8?B?LUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic
 with devm callbacks
Message-ID: <20241103112208.233f7180@jic23-huawei>
In-Reply-To: <20241102195037.3013934-7-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
	<20241102195037.3013934-7-aren@peacevolution.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_032225_126487_600D6BD2 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Aren,

> @@ -624,7 +640,7 @@ static int stk3310_probe(struct i2c_client *client)
>  	device_property_read_u32(&client->dev, "proximity-near-level",
>  				 &data->ps_near_level);
>  
> -	mutex_init(&data->lock);
> +	devm_mutex_init(&client->dev, &data->lock);
ret = devm_mutex_init()
if (ret)
	return ret;

It is very unlikely to fail but technically it can.  Andy has been fixing
this up across the kernel (including IIO) so let's not introduce another
case that doesn't check it!

If nothing else comes up I can probably tidy that up whilst applying.

Jonathan

>  
>  	ret = stk3310_regmap_init(data);
>  	if (ret < 0)
> @@ -650,29 +666,17 @@ static int stk3310_probe(struct i2c_client *client)
>  		if (ret < 0) {
>  			dev_err(&client->dev, "request irq %d failed\n",
>  				client->irq);
> -			goto err_standby;
> +			return ret;
>  		}
>  	}
>  
> -	ret = iio_device_register(indio_dev);
> +	ret = devm_iio_device_register(&client->dev, indio_dev);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "device_register failed\n");
> -		goto err_standby;
> +		return ret;
>  	}
>  
>  	return 0;
> -
> -err_standby:
> -	stk3310_set_state(data, STK3310_STATE_STANDBY);
> -	return ret;
> -}
> -
> -static void stk3310_remove(struct i2c_client *client)
> -{
> -	struct iio_dev *indio_dev = i2c_get_clientdata(client);
> -
> -	iio_device_unregister(indio_dev);
> -	stk3310_set_state(iio_priv(indio_dev), STK3310_STATE_STANDBY);
>  }
>  
>  static int stk3310_suspend(struct device *dev)
> @@ -736,7 +740,6 @@ static struct i2c_driver stk3310_driver = {
>  		.acpi_match_table = stk3310_acpi_id,
>  	},
>  	.probe =        stk3310_probe,
> -	.remove =           stk3310_remove,
>  	.id_table =         stk3310_i2c_id,
>  };
>  


