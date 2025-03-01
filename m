Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C58C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 03:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MB/uZznmVz2MGUPrZKER+yDG0UNcI7IMiphW4KcyJc=; b=Vw3RmknTOqYKbUswXiWJwrIide
	Fs5yOYgNCEOaeTLflcnwZsNEsDT9K504ktny8Bgu7Ye5HWRflKeoRqK3/ACHudQbM/nvN4H5MHf6s
	Mmj18DtGBdwImKTf2B4/5iFzL6yauw3qV4bjF64mmjlQvFLIq414M3ZRHpTuc0Lz/q8cnt5UoXRcV
	W96Ncq9ApjSkKmEm0rwqqspw2X3+1Fi0d7/hKgOWbMrGM3z1JQgV9Z8LOjktgQ+vK/U0fIsI90+Yg
	WTY6+r4g3Paa9lZT0iO+IPHpbnGWL0/oD4dUn7W3lXykh4cPdoq+3IINUxbTC0i9oN6NcPfnd9tWG
	03YkAW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toDD9-0000000DJ2k-1HHr;
	Sat, 01 Mar 2025 03:08:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toDBb-0000000DIy6-3H9c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 03:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4EE85C5419;
	Sat,  1 Mar 2025 03:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E61DC4CED6;
	Sat,  1 Mar 2025 03:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740798401;
	bh=d4fr13w6NqBDZnKtfIoJruFH/zIQdAD23l+WW0qbwcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n6RrAPlQON/vV+L9tp2VbGXYcXIrNNCs66VcFCEEr1iHS8Ul3fWnWzaRWy8nvj4ob
	 /H5LDlStxLwK+YnGedk3KJzjRFbf8xhuUOYMlndIbHPOwzaIOYcof9b3c4StlsW1U/
	 4Upw7BNKycO3dbDKFOS19fnnqBfww2PYKGdOBpSlwvqiVKIUuTtBg4g5ZbJaDcquSH
	 11W/0gUkW7IGOTAVQjLnrc1H/uS0cdsMrbjAL05U9BzoFdA5AeP0CCZbsPNjtY32D6
	 03Kv7fkQXto2cMQjhqr1Ea54Kcs9rU0LiBuISJs31gvXly51ZTd7ICXocJyMAnNlln
	 Utj4osVN4V5wA==
Date: Sat, 1 Mar 2025 03:06:25 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 9/9] iio: adc: ti-ads7924: Respect device tree config
Message-ID: <20250301030625.54c43d37@jic23-huawei>
In-Reply-To: <3279aa9348e7149bfbd433daaa201f2eb5873e1f.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
	<3279aa9348e7149bfbd433daaa201f2eb5873e1f.1739967040.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_190643_943742_BD8D8297 
X-CRM114-Status: GOOD (  34.11  )
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

On Wed, 19 Feb 2025 14:32:23 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The ti-ads7924 driver ignores the device-tree ADC channel specification
> and always exposes all 4 channels to users whether they are present in
> the device-tree or not. Additionally, the "reg" values in the channel
> nodes are ignored, although an error is printed if they are out of range.
> 
> Register only the channels described in the device-tree, and use the reg
> property as a channel ID.

No to this one in it's current form.  The nodes are just there to provide
the labels.  Maybe it is fine if we fallback to registering them all if
none are provided.

> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v2 => v3: New patch
> 
> Please note that this is potentially breaking existing users if they
> have wrong values in the device-tree. I believe the device-tree should
> ideally be respected, and if it says device X has only one channel, then
> we should believe it and not register 4. Well, we don't live in the
> ideal world, so even though I believe this is TheRightThingToDo - it may
> cause havoc because correct device-tree has not been required from the
> day 1. So, please review and test and apply at your own risk :)
> 
> As a side note, this might warrant a fixes tag but the adc-helper -stuff
> is hardly worth to be backported... (And I've already exceeded my time
> budget with this series - hence I'll leave crafting backportable fix to
> TI people ;) )
> 
> This has only been compile tested! All testing is highly appreciated.
> ---
>  drivers/iio/adc/ti-ads7924.c | 80 +++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
> index b1f745f75dbe..a5b8f7c81b8a 100644
> --- a/drivers/iio/adc/ti-ads7924.c
> +++ b/drivers/iio/adc/ti-ads7924.c
> @@ -22,6 +22,7 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  
> +#include <linux/iio/adc-helpers.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/types.h>
>  
> @@ -119,15 +120,12 @@
>  #define ADS7924_TOTAL_CONVTIME_US (ADS7924_PWRUPTIME_US + ADS7924_ACQTIME_US + \
>  				   ADS7924_CONVTIME_US)
>  
> -#define ADS7924_V_CHAN(_chan, _addr) {				\
> -	.type = IIO_VOLTAGE,					\
> -	.indexed = 1,						\
> -	.channel = _chan,					\
> -	.address = _addr,					\
> -	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), 		\
> -	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> -	.datasheet_name = "AIN"#_chan,				\
> -}
> +static const struct iio_chan_spec ads7924_chan_template = {
> +	.type = IIO_VOLTAGE,
> +	.indexed = 1,
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
> +};
>  
>  struct ads7924_data {
>  	struct device *dev;
> @@ -182,13 +180,6 @@ static const struct regmap_config ads7924_regmap_config = {
>  	.writeable_reg = ads7924_is_writeable_reg,
>  };
>  
> -static const struct iio_chan_spec ads7924_channels[] = {
> -	ADS7924_V_CHAN(0, ADS7924_DATA0_U_REG),
> -	ADS7924_V_CHAN(1, ADS7924_DATA1_U_REG),
> -	ADS7924_V_CHAN(2, ADS7924_DATA2_U_REG),
> -	ADS7924_V_CHAN(3, ADS7924_DATA3_U_REG),
> -};
> -
>  static int ads7924_get_adc_result(struct ads7924_data *data,
>  				  struct iio_chan_spec const *chan, int *val)
>  {
> @@ -251,32 +242,38 @@ static const struct iio_info ads7924_info = {
>  	.read_raw = ads7924_read_raw,
>  };
>  
> -static int ads7924_get_channels_config(struct device *dev)
> +static const struct iio_adc_props ads7924_chan_props = {
> +	.required = IIO_ADC_CHAN_PROP_TYPE_REG,
> +};
> +
> +static int ads7924_get_channels_config(struct iio_dev *indio_dev,
> +				       struct device *dev)
>  {
> -	struct fwnode_handle *node;
> -	int num_channels = 0;
> +	struct iio_chan_spec *chan_array;
> +	int num_channels = 0, i;
>  
> -	device_for_each_child_node(dev, node) {
> -		u32 pval;
> -		unsigned int channel;
> +	num_channels = devm_iio_adc_device_alloc_chaninfo(dev,
> +					&ads7924_chan_template, &chan_array,
> +					&ads7924_chan_props);
>  
> -		if (fwnode_property_read_u32(node, "reg", &pval)) {
> -			dev_err(dev, "invalid reg on %pfw\n", node);
> -			continue;
> -		}
> +	if (num_channels < 0)
> +		return num_channels;
>  
> -		channel = pval;
> -		if (channel >= ADS7924_CHANNELS) {
> -			dev_err(dev, "invalid channel index %d on %pfw\n",
> -				channel, node);
> -			continue;
> -		}
> +	if (!num_channels)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num_channels; i++) {
> +		static const char * const datasheet_names[] = {
> +			"AIN0", "AIN1", "AIN2", "AIN3"
> +		};
> +		int ch_id = chan_array[i].channel;
>  
> -		num_channels++;
> +		chan_array[i].address = ADS7924_DATA0_U_REG + ch_id;
> +		chan_array[i].datasheet_name = datasheet_names[ch_id];
>  	}
>  
> -	if (!num_channels)
> -		return -EINVAL;
> +	indio_dev->channels = chan_array;
> +	indio_dev->num_channels = num_channels;
>  
>  	return 0;
>  }
> @@ -370,18 +367,15 @@ static int ads7924_probe(struct i2c_client *client)
>  
>  	mutex_init(&data->lock);
>  
> -	indio_dev->name = "ads7924";
> -	indio_dev->modes = INDIO_DIRECT_MODE;
> -
> -	indio_dev->channels = ads7924_channels;
> -	indio_dev->num_channels = ARRAY_SIZE(ads7924_channels);
> -	indio_dev->info = &ads7924_info;
> -
> -	ret = ads7924_get_channels_config(dev);
> +	ret = ads7924_get_channels_config(indio_dev, dev);
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret,
>  				     "failed to get channels configuration\n");
>  
> +	indio_dev->name = "ads7924";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &ads7924_info;
> +
>  	data->regmap = devm_regmap_init_i2c(client, &ads7924_regmap_config);
>  	if (IS_ERR(data->regmap))
>  		return dev_err_probe(dev, PTR_ERR(data->regmap),


