Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3389D10C0E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEP4S13c5DyD5DUmsjutPU+x2vWzwQUJHCKu7VY+P50=; b=Ym/GJ/dlc9qyYEzrcPuzyYA+Db
	1w29Oylvly2FphVIllWVP3vogzs41um/lNvz3etMmTY7fbJpksqOjt6v/Hm/hLINpALzGeUAUHLPT
	B+1xSue0a90n++BbhUiz4bAphs9yoILyIyEQs5Bn1VeiHcs7zovey4fNKM0VHtQqykuwKA1jGpXt3
	5rpdLkvdpVlYbvx7ZL10UzDezKTMcLONq42xLHw/pmALb09r0TD7A6nt6SkYUf7lyhQzBGA3WIXOv
	+GGO7c9L++4FA8v/lWn1z39y4TUz03UE2neO5wJ9oBpetAfZkWJrw24CRglNtDQo3KrDy1BlSxW91
	RYO+99Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Yrl-0000000BLnh-2fAA;
	Sun, 03 Nov 2024 11:33:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Yq3-0000000BLWc-0HQQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 11:32:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C566E5C464B;
	Sun,  3 Nov 2024 11:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD515C4CECD;
	Sun,  3 Nov 2024 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730633483;
	bh=ZvbVHVuun8oeRhQlJajET7qBhOvsWylLAA2B8VkfPFY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WfsI9xbLsIDKjoAK61UpdaKB1MZDf+nzsNT6q0hqXnk+BOWHDvW+ZejPDr83/cTcC
	 5p0njkFXStrBEqtWjGHGB9TDDyanBXuM99CK93l8AEemJBPfXy8vS/PZLK3EiO8XLG
	 3XUKYcaiTZoAJKwbQlZRqIJ1nIw+0U4J4uut0SH5BJwUv1wbA1UxDXkuVbXu1q5mr1
	 v/7jbnVwp9LzEbLO5xuLhuRlX4GFPWG0RwW7rLq8L0B+EUBk9Z8m/Ei9WnH/5ntr6H
	 aYmjPhjfBmQpayBwpDHyvUFpoj7tl3JH+OhSLDKlgC93FHrKqVVWMhk7jbFEgjE6nz
	 hizgVfwY6NINA==
Date: Sun, 3 Nov 2024 11:31:03 +0000
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
Subject: Re: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <20241103112933.60f96f97@jic23-huawei>
In-Reply-To: <20241102195037.3013934-9-aren@peacevolution.org>
References: <20241102195037.3013934-3-aren@peacevolution.org>
	<20241102195037.3013934-9-aren@peacevolution.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_033211_291583_3CDFBD1D 
X-CRM114-Status: GOOD (  34.91  )
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

On Sat,  2 Nov 2024 15:50:39 -0400
Aren Moynihan <aren@peacevolution.org> wrote:

> The vdd and leda supplies must be powered on for the chip to function
> and can be powered off during system suspend.
> 
> This was originally based on a patch by Ondrej Jirman[1], but has been
> rewritten since.
> 
> 1: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82
> 
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> ---
> 
> Notes:
>     Changes in v4:
>      - fix variable declaration order in stk3310_resume to match the rest of
>        the driver

For this Andy was asking for consistency.  Generally we don't insist on a
particular ordering in IIO drivers, but we do prefer them to be the same.
Your new ordering is inconsistent between resume and suspend.  Whilst
existing code may be inconsistent, you can still pick most common ordering
and use that for your new code.

If the existing driver is inconsistent then feel free to tidy that up but
do it in a precursor patch so there is a consistent style for you to then
carry on.

>     
>     Changes in v3:
>      - use bulk regulators instead of two individual ones
>      - handle cleanup using devm callbacks instead of the remove function
>     
>     Changes in v2:
>      - always enable / disable regulators and rely on a dummy regulator if
>        one isn't specified
>      - replace usleep_range with fsleep
>      - reorder includes so iio headers are last
>      - add missing error handling to resume
> 
>  drivers/iio/light/stk3310.c | 76 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index 181b7acb3f96..f93689c61f44 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c
> @@ -13,6 +13,8 @@
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +
>  #include <linux/iio/events.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -130,6 +132,7 @@ struct stk3310_data {
>  	struct regmap_field *reg_int_ps;
>  	struct regmap_field *reg_flag_psint;
>  	struct regmap_field *reg_flag_nf;
> +	struct regulator_bulk_data supplies[2];
>  };
>  
>  static const struct iio_event_spec stk3310_events[] = {
> @@ -621,6 +624,31 @@ static irqreturn_t stk3310_irq_event_handler(int irq, void *private)
>  	return IRQ_HANDLED;
>  }
>  
> +static int stk3310_regulators_enable(struct stk3310_data *data)
> +{
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(data->supplies), data->supplies);
> +	if (ret)
> +		return ret;
> +
> +	/* we need a short delay to allow the chip time to power on */
> +	fsleep(1000);
> +
> +	return 0;
> +}
> +
> +static void stk3310_regulators_disable(void *private)
> +{
> +	int ret;
> +	struct stk3310_data *data = private;
> +	struct device *dev = &data->client->dev;
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(data->supplies), data->supplies);
> +	if (ret)
> +		dev_err(dev, "failed to disable regulators: %d\n", ret);
> +}
> +
>  static int stk3310_probe(struct i2c_client *client)
>  {
>  	int ret;
> @@ -642,6 +670,13 @@ static int stk3310_probe(struct i2c_client *client)
>  
>  	devm_mutex_init(&client->dev, &data->lock);
>  
> +	data->supplies[0].supply = "vdd";
> +	data->supplies[1].supply = "leda";
> +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
> +				      data->supplies);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "get regulators failed\n");
> +
>  	ret = stk3310_regmap_init(data);
>  	if (ret < 0)
>  		return ret;
> @@ -652,6 +687,16 @@ static int stk3310_probe(struct i2c_client *client)
>  	indio_dev->channels = stk3310_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(stk3310_channels);
>  
> +	ret = stk3310_regulators_enable(data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "regulator enable failed\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to register regulator cleanup\n");
> +
>  	ret = stk3310_init(indio_dev);
>  	if (ret < 0)
>  		return ret;
> @@ -682,18 +727,45 @@ static int stk3310_probe(struct i2c_client *client)
>  static int stk3310_suspend(struct device *dev)
>  {
>  	struct stk3310_data *data;
> +	int ret;
>  
>  	data = iio_priv(i2c_get_clientdata(to_i2c_client(dev)));
>  
> -	return stk3310_set_state(data, STK3310_STATE_STANDBY);
> +	ret = stk3310_set_state(data, STK3310_STATE_STANDBY);
> +	if (ret)
> +		return ret;
> +
> +	regcache_mark_dirty(data->regmap);
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(data->supplies), data->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to disable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static int stk3310_resume(struct device *dev)
>  {
> -	u8 state = 0;
> +	int ret;
>  	struct stk3310_data *data;
> +	u8 state = 0;
>  
>  	data = iio_priv(i2c_get_clientdata(to_i2c_client(dev)));
> +
> +	ret = stk3310_regulators_enable(data);
> +	if (ret) {
> +		dev_err(dev, "Failed to re-enable regulators: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = regcache_sync(data->regmap);
> +	if (ret) {
> +		dev_err(dev, "Failed to restore registers: %d\n", ret);
> +		return ret;
> +	}
> +
>  	if (data->ps_enabled)
>  		state |= STK3310_STATE_EN_PS;
>  	if (data->als_enabled)


