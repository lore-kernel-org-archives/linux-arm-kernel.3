Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F96C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GAX2Ms3C+1iFEiEooYALMC1zyJP6nScc6k91Dyj8T4=; b=B/EuEbO/kve7NaM/TzdNO2Sjev
	lFH7MFVWD5jA3B5wgwO/4nVCGxud3r+W80/lBKGhs5Ih6lrS89KauYCpljZ9LRJZLqfg0QBGOWQqw
	YNQj4bleWsjaJ7hZ1ftnlcMBubhmde2Yu2bnCqtaWbsLyv4OTDkCXdGxyfdcgSYakQDJzk6BiK0fc
	TBKqOcQ3TJoYlfZkS4oyV+iM/5T5LulbFy96MZQv3qC7y9ftSt0yx9zi2ZbcRlI6Up9XbkkwH6YPB
	CakROZHtNMWmqdop/runOnMhBWGCYCTr6HxGw1HcUYbxM8fzGZ1iE4Vo9dVvLzAooZgLhkM53ZOdl
	NW+fg1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0lb-0000000H6K8-3f6p;
	Thu, 20 Feb 2025 07:14:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0k6-0000000H5sp-1rdc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:13:07 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30a29f4bd43so5520761fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 23:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740035584; x=1740640384; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GAX2Ms3C+1iFEiEooYALMC1zyJP6nScc6k91Dyj8T4=;
        b=aZCBSq4r7nBh0GgShc0vkj7xWjLjz1I2lJrSxJ7tQlLc9Imv/MWxJ0noU42mXBC4Nt
         fd7s/n1ZMp9r9PqxM+7L1sqDaR7VjfRVlUlxFYCsH+obX8NRE8vrV8KqgTEkPocmvlJP
         5zHle+Hk4yeebCT3sAeWMi9Bjxr4Vqp5YZwr1afQxPuyVipW5Jo2qaB7Cwz/8AQEQCUU
         Ws8TPtv+0jTn7KwChAx98xq6iVSJLa0GFntUHlXxf3WLkD/MKTG8Liy19t0X7cOdb+Sy
         gZXo1dJ5uDbWK0lNtL0k/Q3ryXffAb8pmzSyOGjKsL4SXkpK3dAW2TqjEZJxGN5gWxEg
         Ph+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740035584; x=1740640384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GAX2Ms3C+1iFEiEooYALMC1zyJP6nScc6k91Dyj8T4=;
        b=fR2vZUT7XM+KwtZV/BElVFspBveTQ+BsWzGDbQqRpEmFBocoJo3IB1b2mW7X2YThQz
         PEKT0DbsnyV0eIGMgA7s0O76E39Wxb1tAmIqPyY75oqrTxSWcZ91zJQElIxr7vYVhFqV
         EMXlg2rtPuUg939qj14pPUyjtvIev7gQTFxNH1KpomIGd39IlQ/1E5t6xR3Ksaabb1QD
         OHOk5TjB3LgtdwQMdTs+rRPP6tPTvJpm/GPGWe+oS+ML463w7l6SRxvkzMAcdUfHHJ2e
         dl355hG3H42wQx/VXt28/Yz6yHSnd6tVFCSs3rFT0nZzJfGUGuYvU1VVZ/Zq5hl6mur5
         UnSg==
X-Forwarded-Encrypted: i=1; AJvYcCVzBDdJpxIio2AWG7N4LtBlUQgPypfCGX3Vy7fVHWe4CSI9ELPiJ9rAk+mxyYY6NrK9E4ISA639jUbruO5QYzZm@lists.infradead.org
X-Gm-Message-State: AOJu0YyF5fFpdTBoJojoLwwGx70KwR6+he1k9LPos3XkHS6x/lzSoNV1
	qHNqk+ikspQ+freTLVSHxtTSZGccpK+hQmAnWkVSGI8C8vWCMmuA
X-Gm-Gg: ASbGnctqvvADjUPCPe/iuF+xz5NL+OaHUZQcC6nqYj+9+Dc5cLmF7Inrgu5iyYdjNCm
	QngBqdtj2Xebiv8hNZBqvFFoK+Ii1tUa4b2fXREFVe93mu1UaY+ragoJlIrMOkC8N7HP6sJcKJl
	RIwrQl4taz4lAbwYKAqi569uK6+C7lcjYv3gfA1NJr6nOGNvJw6InCyl5B6p8uJyhu1sE5cDR+7
	PkU1+xJyHnlVRewu0HEi2BjnwLjbZRQOzDQXOzenODYOhI4QYz8iYpQb7xMJ2wqsEVGdGnEui7u
	dlM8sGFJILZS3KD+L8ti/RY1LqWjVP1TYh5LCFRkyz1h7GO/NgRm8O9j/N6GWAOE3/KSEGRn
X-Google-Smtp-Source: AGHT+IFKp9trN/cn2Qm66dYQMf1hABQUmyHBmZFJ75NYzdUOuFn45L/HlCdjW3lLCknW0qJmzNb4EQ==
X-Received: by 2002:a2e:8650:0:b0:308:f479:5696 with SMTP id 38308e7fff4ca-30a44dc4ff1mr17598221fa.15.1740035583979;
        Wed, 19 Feb 2025 23:13:03 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30921447bdcsm21379171fa.35.2025.02.19.23.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 23:13:03 -0800 (PST)
Message-ID: <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
Date: Thu, 20 Feb 2025 09:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <6c5b678526e227488592d004c315a967b9809701.1739967040.git.mazziesaccount@gmail.com>
 <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7ZB7RQhyI5Dohrq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_231306_491943_F5F2D725 
X-CRM114-Status: GOOD (  50.62  )
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

Hi Andy,

Long time no hear ;) First of all, thanks for the review!

On 19/02/2025 22:41, Andy Shevchenko wrote:
> On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
> 
> ...
> 
>>   - Rename iio_adc_device_get_channels() as
> 
> as?

Oh, looks like I got interrupted :) Thanks!

> 
> ...
> 
>> obj-$(CONFIG_FSL_MX25_ADC) += fsl-imx25-gcq.o
>>   obj-$(CONFIG_GEHC_PMC_ADC) += gehc-pmc-adc.o
>>   obj-$(CONFIG_HI8435) += hi8435.o
>>   obj-$(CONFIG_HX711) += hx711.o
> 
>> +obj-$(CONFIG_IIO_ADC_HELPER) += industrialio-adc.o
> 
> Shouldn't this be grouped with other IIO core related objects?

I was unsure where to put this. The 'adc' subfolder contained no other 
IIO core files, so there really was no group. I did consider putting it 
on top of the file but then just decided to go with the alphabetical 
order. Not sure what is the right way though.

>>   obj-$(CONFIG_IMX7D_ADC) += imx7d_adc.o
>>   obj-$(CONFIG_IMX8QXP_ADC) += imx8qxp-adc.o
>>   obj-$(CONFIG_IMX93_ADC) += imx93_adc.o
> 
> ...
> 
> 
> + bitops.h
> 
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
> 
> + export.h
> 
> + module.h
> 
>> +#include <linux/property.h>
> 
> + types.h

Thanks!

> ...
> 
>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
> 
> No namespace?

I was considering also this. The IIO core functions don't belong into a 
namespace - so I followed the convention to keep these similar to other 
IIO core stuff.

(Sometimes I have a feeling that the trend today is to try make things 
intentionally difficult in the name of the safety. Like, "more difficult 
I make this, more experience points I gain in the name of the safety".)

Well, I suppose I could add a namespace for these functions - if this 
approach stays - but I'd really prefer having all IIO core stuff in some 
global IIO namespace and not to have dozens of fine-grained namespaces 
for an IIO driver to use...

> ...
> 
>> +	if (!allowed_types || allowed_types & (~IIO_ADC_CHAN_PROP_TYPE_ALL)) {
> 
> Unneeded parentheses around negated value.
> 
>> +		dev_dbg(dev, "Invalid adc allowed prop types 0x%lx\n",
>> +			allowed_types);
>> +
>> +		return -EINVAL;
>> +	}
>> +	if (found_types & (~allowed_types)) {
> 
> Ditto.
> 
>> +		long unknown_types = found_types & (~allowed_types);
> 
> Ditto and so on...
> 
> Where did you get this style from? I think I see it first time in your
> contributions. Is it a new preferences? Why?

Last autumn I found out my house was damaged by water. I had to empty 
half of the rooms and finally move out for 2.5 months. Now I'm finally 
back, but during the moves I lost my printed list of operator 
precedences which I used to have on my desk. I've been writing C for 25 
years or so, and I still don't remember the precedence rules for all 
bitwise operations - and I am fairly convinced I am not the only one.

What I understood is that I don't really have to have a printed list at 
home, or go googling when away from home. I can just make it very, very 
obvious :) Helps me a lot.

> 
>> +		int type;
>> +
>> +		for_each_set_bit(type, &unknown_types,
>> +				 IIO_ADC_CHAN_NUM_PROP_TYPES - 1) {
>> +			dev_err(dev, "Unsupported channel property %s\n",
>> +				iio_adc_type2prop(type));
>> +		}
>> +
>> +		return -EINVAL;
>> +	}
> 
> ...
> 
>> +int iio_adc_device_channels_by_property(struct device *dev, int *channels,
>> +		int max_channels, const struct iio_adc_props *expected_props)
>> +{
>> +	int num_chan = 0, ret;
>> +
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		u32 ch, diff[2], se;
>> +		struct iio_adc_props tmp;
>> +		int chtypes_found = 0;
>> +
>> +		if (!fwnode_name_eq(child, "channel"))
>> +			continue;
>> +
>> +		if (num_chan == max_channels)
>> +			return -EINVAL;
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &ch);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = fwnode_property_read_u32_array(child, "diff-channels",
>> +						     &diff[0], 2);
> 
> 						     diff, ARRAY_SIZE(diff));
> 
> (will require array_size.h)

thanks :) And thanks for being helpful with the header - and there is no 
sarcasm!

>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_DIFF;
>> +
>> +		ret = fwnode_property_read_u32(child, "single-channel", &se);
>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED;
>> +
>> +		tmp = *expected_props;
>> +		/*
>> +		 * We don't bother reading the "common-mode-channel" here as it
>> +		 * doesn't really affect on the primary channel ID. We remove
>> +		 * it from the required properties to allow the sanity check
>> +		 * pass here  also for drivers which require it.
>> +		 */
>> +		tmp.required &= (~BIT(IIO_ADC_CHAN_PROP_COMMON));
> 
> Redundant outer parentheses. What's the point, please?

Zero need to think of precedence.

>> +		ret = iio_adc_prop_type_check_sanity(dev, &tmp, chtypes_found);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_DIFF)
>> +			ch = diff[0];
>> +		else if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED)
>> +			ch = se;
>> +
>> +		/*
>> +		 * We assume the channel IDs start from 0. If it seems this is
>> +		 * not a sane assumption, then we can relax this check or add
>> +		 * 'allowed ID range' parameter.
>> +		 *
>> +		 * Let's just start with this simple assumption.
>> +		 */
>> +		if (ch >= max_channels)
>> +			return -ERANGE;
>> +
>> +		channels[num_chan] = ch;
>> +		num_chan++;
>> +	}
>> +
>> +	return num_chan;
>> +
>> +}
> 
> ...
> 
>> +int devm_iio_adc_device_alloc_chaninfo(struct device *dev,
>> +				const struct iio_chan_spec *template,
>> +				struct iio_chan_spec **cs,
>> +				const struct iio_adc_props *expected_props)
>> +{
>> +	struct iio_chan_spec *chan;
>> +	int num_chan = 0, ret;
>> +
>> +	num_chan = iio_adc_device_num_channels(dev);
>> +	if (num_chan < 1)
>> +		return num_chan;
>> +
>> +	*cs = devm_kcalloc(dev, num_chan, sizeof(**cs), GFP_KERNEL);
>> +	if (!*cs)
>> +		return -ENOMEM;
>> +
>> +	chan = &(*cs)[0];
> 
> This and above and below will be easier to read if you introduce a temporary
> variable which will be used locally and assigned to the output later on.
> Also the current approach breaks the rule that infiltrates the output even in
> the error cases.

Agree. Thanks.

> 
>> +	device_for_each_child_node_scoped(dev, child) {
>> +		u32 ch, diff[2], se, common;
>> +		int chtypes_found = 0;
>> +
>> +		if (!fwnode_name_eq(child, "channel"))
>> +			continue;
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &ch);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = fwnode_property_read_u32_array(child, "diff-channels",
>> +						     &diff[0], 2);
> 
> As per above.
> 
>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_DIFF;
>> +
>> +		ret = fwnode_property_read_u32(child, "single-channel", &se);
>> +		if (!ret)
>> +			chtypes_found |= IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED;
> 
>> +		ret = fwnode_property_read_u32(child, "common-mode-channel",
>> +					       &common);
> 
> I believe this is okay to have on a single line,

I try to keep things under 80 chars. It really truly helps me as I'd 
like to have 3 parallel terminals open when writing code. Furthermore, I 
hate to admit it but during the last two years my near vision has 
deteriorated... :/ 40 is getting more distant and 50 is approaching ;)

> 
>> +		if (!ret)
>> +			chtypes_found |= BIT(IIO_ADC_CHAN_PROP_COMMON);
>> +
>> +		ret = iio_adc_prop_type_check_sanity(dev, expected_props,
>> +						     chtypes_found);
>> +		if (ret)
>> +			return ret;
>> +
>> +		*chan = *template;
>> +		chan->channel = ch;
>> +
>> +		if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_DIFF) {
>> +			chan->differential = 1;
>> +			chan->channel = diff[0];
>> +			chan->channel2 = diff[1];
>> +
>> +		} else if (chtypes_found & IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED) {
>> +			chan->channel = se;
>> +			if (chtypes_found & BIT(IIO_ADC_CHAN_PROP_COMMON))
>> +				chan->channel2 = common;
>> +		}
>> +
>> +		/*
>> +		 * We assume the channel IDs start from 0. If it seems this is
>> +		 * not a sane assumption, then we have to add 'allowed ID ranges'
>> +		 * to the struct iio_adc_props because some of the callers may
>> +		 * rely on the IDs being in this range - and have arrays indexed
>> +		 * by the ID.
>> +		 */
>> +		if (chan->channel >= num_chan)
>> +			return -ERANGE;
>> +
>> +		chan++;
>> +	}
>> +
>> +	return num_chan;
>> +}
> 
> ...
> 
>> +#ifndef _INDUSTRIAL_IO_ADC_HELPERS_H_
>> +#define _INDUSTRIAL_IO_ADC_HELPERS_H_
> 
> + bits.h
> 
>> +#include <linux/iio/iio.h>
> 
> I'm failing to see how this is being used in this header.

I suppose it was the struct iio_chan_spec. Yep, forward declaration 
could do, but I guess there would be no benefit because anyone using 
this header is more than likely to use the iio.h as well.

> 
>> +struct device;
>> +struct fwnode_handle;
>> +
>> +enum {
>> +	IIO_ADC_CHAN_PROP_REG,
>> +	IIO_ADC_CHAN_PROP_SINGLE_ENDED,
>> +	IIO_ADC_CHAN_PROP_DIFF,
>> +	IIO_ADC_CHAN_PROP_COMMON,
>> +	IIO_ADC_CHAN_NUM_PROP_TYPES
>> +};
>> +
>> +/*
>> + * Channel property types to be used with iio_adc_device_get_channels,
>> + * devm_iio_adc_device_alloc_chaninfo, ...
> 
> Looks like unfinished sentence...

Intention was to just give user an example of functions where this gets 
used, and leave room for more functions to be added. Reason is that 
lists like this tend to end up being incomplete anyways. Hence the ...

> 
>> + */
>> +#define IIO_ADC_CHAN_PROP_TYPE_REG BIT(IIO_ADC_CHAN_PROP_REG)
>> +#define IIO_ADC_CHAN_PROP_TYPE_SINGLE_ENDED BIT(IIO_ADC_CHAN_PROP_SINGLE_ENDED)
>> +#define IIO_ADC_CHAN_PROP_TYPE_SINGLE_COMMON					\
>> +	(BIT(IIO_ADC_CHAN_PROP_SINGLE_ENDED) | BIT(IIO_ADC_CHAN_PROP_COMMON))
>> +#define IIO_ADC_CHAN_PROP_TYPE_DIFF BIT(IIO_ADC_CHAN_PROP_DIFF)
>> +#define IIO_ADC_CHAN_PROP_TYPE_ALL GENMASK(IIO_ADC_CHAN_NUM_PROP_TYPES - 1, 0)
> 
>> +int devm_iio_adc_device_alloc_chaninfo(struct device *dev,
>> +				const struct iio_chan_spec *template,
>> +				struct iio_chan_spec **cs,
>> +				const struct iio_adc_props *expected_props);
>> +
>> +int iio_adc_device_channels_by_property(struct device *dev, int *channels,
>> +				int max_channels,
>> +				const struct iio_adc_props *expected_props);
>> +#endif /* _INDUSTRIAL_IO_ADC_HELPERS_H_ */
> 
> 


