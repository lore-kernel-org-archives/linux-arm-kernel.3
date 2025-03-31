Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C6BC36013
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 05:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AaMaaA3HgI5ZgkbFyIrsVuNy6uPjPTFn+suKBrfMsc=; b=qWLXycrkyriAFB7sRPf9kfcsdn
	UlGCYKq411dN+ei6nrlQvgZN8h7vBDIulHKo+lkZBQ9QTrw57cHKIDvGk5F3A20M/gjd9zkgKQWA2
	iU0GkU7f6DaKw524JX88MBY9aaH0O4YnR5tRxhodTIqcuUbi1hQQznfK0Z4XszRs8k8aR5okfybBT
	tUPgLUSyBuMmADozesws/Mpa+azKCQ8X17jWoiAp0NjIoH6ewL7+FqQoIv/E4AgI0zYh7uLvmtSpx
	aPCEMILEoWv6ksBt2vD0J4GcrGCejtPq+279DIGuGNzGfoPRsqt6mXLC+DT6acWadIFo4DDFFUfa0
	Qc3vOULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz7tp-0000000H3zV-0w4d;
	Mon, 31 Mar 2025 05:41:29 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz7s6-0000000H3u8-23nH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 05:39:44 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso40923221fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Mar 2025 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743399580; x=1744004380; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AaMaaA3HgI5ZgkbFyIrsVuNy6uPjPTFn+suKBrfMsc=;
        b=f1zNLZxk5O0kQPmo6mhIMPzwfEE1pt5oMtz/wPc5rN2ADb681shivlvrqaKjJTe9dj
         ZTuLWnmFYe0n/hOBPCycnnYqePqCTxwvOySv91ZP7gKVqwsmR3qgeV7SBR7fLI8TYQBi
         GVt9e7HC8gYroa143b+CwiCUL4xS1slYzitODrxO91S8ChkgDCFX2/ytPqleWEXHh/g0
         Qc0pTO0m74s3TK3ZXL3I8EsS96lacepwNJ/hP3UC5g5MkV24J04JpNy/IazizBkIuiAA
         xN6tZR5tUFloYkNc9N0brndeqyYEf3Tl5A6Ul4SMxmpftHj6/vhv2dYpL79n84Cp/Pyu
         rFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743399580; x=1744004380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AaMaaA3HgI5ZgkbFyIrsVuNy6uPjPTFn+suKBrfMsc=;
        b=eRbhHaf/0mWN0LDN4bViFcqU7+pn1ZoCTRDKGMFjtHTHLUoIyT+NVVtEdIx3EHjJmB
         5AN+nvXjVZBhuhMjXdEc0Ar/LiUnQwUOYGq9YoMdtFmaOr/bc7TUM8PiQjzzPJ/BzXIl
         VdVeDao5OC9hc805khfwEObzJbHDYd1NVR3HhAHLhuEvN423QcADSRDXVw5RufiVJmdK
         w/lrkvZddsZEqTjuqiHeW24ipqM1OZ1w7kPQM8leAgr9CsY+Xh9rw7TlkUuyE61k4vR8
         COm61+uBE5VzbI8dw3Q6vAqBzRVYuKK+6d59rYxQnCRrn4J4kMpAKDBKq5m3/IrQj5tI
         yAxA==
X-Forwarded-Encrypted: i=1; AJvYcCVvsVKovocrH8VW+cBqli7qKB/By8fk4+pERht8lF3DJgdZJe9tvePMdjrLKhFII7uuWCkX25Z6e4imR6lonvsJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyJaoDvynxRuYuq+9+AK7xRyL18Qkc83yY2f8sebNYgMxu38mkP
	VT9qOHvjr1/obCza5vGdhga1muehbCQ/OieX5baOg5ZvKeT26U/Z
X-Gm-Gg: ASbGncuRf9CkurIGVRHan81X5m66z9Isj4O3bw/rXlti6bQsnITvFGrpd2s5Tg1rRFU
	hwjjrVyuf8YAFejV+P2IdH0YRkgg+zozM7DLZIDznp6LPDzA5BXMv+fjylq5AgtkR8cTOhuSPv1
	/Qam8tQMx6Frbh5rhzqLWMfPfWo8aw/jvrmdYIbctM64ghyrWvQtA3kn0XrfdNXbDSbrQq9QfER
	UyhzszvNxaEvI7p/qewzUB2s6OQEU5nqfIYMhPfdI1G9FzsIOR7f6bKy/EpLU7TCK6byb9UwzXE
	LRnM5X+R1QpO3jxdXDkElKfu0NZjbhPhQL/dT6yfS02KCZxXUgKxFewddr0+87eTuz9Qi3LZT7D
	TEvx3PQRJveoXFBmvMbSuaDsiums/QuP7RS5a
X-Google-Smtp-Source: AGHT+IEax/bYtDNpsnoS8lp2/Xv0SOwDw+X/Qx+Fp6+LfV4yGOljFnL11rqq5UXPyHcC3DYhadI4bQ==
X-Received: by 2002:a05:651c:1590:b0:30b:b132:43e5 with SMTP id 38308e7fff4ca-30de0278988mr32677431fa.19.1743399579629;
        Sun, 30 Mar 2025 22:39:39 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4ccdesm12941591fa.67.2025.03.30.22.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 22:39:37 -0700 (PDT)
Message-ID: <4d66b3b5-bfcb-42f0-9096-7c448c863dfc@gmail.com>
Date: Mon, 31 Mar 2025 08:39:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1742560649.git.mazziesaccount@gmail.com>
 <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
 <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_223942_561064_8BFCC84B 
X-CRM114-Status: GOOD (  31.68  )
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

Hi Marcelo,

Thanks for the review!

On 30/03/2025 23:19, Marcelo Schmitt wrote:
> Hi Matti,
> 
> The new helpers for ADC drivers look good to me.
> I am now very late to complain about anything but am leaving some minor comments
> below that can be completely ignored.
> 
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> 
> Thanks,
> Marcelo
> 
> On 03/24, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
> Not sure it's preferred to have ADC channels always declared in dt. That
> question was somewhat also raised during ADC doc review [1].

I had missed that doc and the review. Interesting read, thanks for 
pointing it :)

We did also do a bit discussion about this during the review of the 
earlier versions. I am not sure if we found an ultimate common consensus 
though :)

A recap as seen through my eyes:

- It is preferred to have either _all_ or _none_ of the channels 
described in the device tree.
https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/

- This, however, is not _always_ required to be followed, and it may be 
impractical in some cases:
https://lore.kernel.org/linux-iio/6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com/#t

- We do have bunch of existing drivers which we need to support. With 
some very different approaches to bindings.
https://lore.kernel.org/linux-iio/20250302032054.1fb8a011@jic23-huawei/


My _personal_ thinking is that:

This means that we can't hide the binding parsing in the IIO-core. We 
can't go and change the channels in existing drivers.

But, we can provide helpers (like this one) for drivers to use. I also 
believe we should still try to have common (and preferred!) approach for 
the _new_ drivers. Eventually, the new ones will be majority. Some of 
the old ones die, and if we keep same practices for new ones, the old 
ones will become rare exceptions while majority follows same principles ;)

> In short, ADC
> channel may and may not be declared under ADC dt node. ADC bindings often don't
> enforce channels to be declared. On IIO side of things, many ADC drivers just
> populate channels even if they are not declared in dt.
> The ADCs you are supporting in the other patches of this series seem to require
> dt declared channels though.
> 
> [1]: https://lore.kernel.org/linux-iio/20250118155153.2574dbe5@jic23-huawei/
> 
> Would something like
> 
> A common way of marking pins that can be used as ADC inputs is to add
> corresponding channel@N nodes in the device tree as described in the ADC
> binding yaml.
> 
> be a good rephrasing of the above paragraph?

Yes, if we don't want to guide new drivers to either have all usable 
channels, or no channels in the device tree.

I think Jonathan said he'll be rebasing this to rc1. I am a newcomer and 
I should not enforce my view over more experienced ones ;) So, feel free 
to reword the description as Marcelo suggests if you don't think we 
should prefer one direction or the other.

>>
>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
> ...
>> +static inline int iio_adc_device_num_channels(struct device *dev)
>> +{
>> +	return device_get_named_child_node_count(dev, "channel");
>> +}
> I wonder if this function name can eventually become misleading.
> 
> In Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml we have
> temperature sensor with channel nodes named after external hardware connected to
> the sensor, leading to channels having different node names. Can anything like
> that ever be accepted for ADC bindings?

My initial thinking is that the hardware which is connected to the ADC 
should have it's own node - and there should be only a reference from 
the ADC to the other hardware's description. I think the connected 
hardware should not be a property of the ADC channel.

Anyways, the current ADC binding (bindings/iio/adc/adc.yaml) says the 
node name must be channel[@xxx] (which, I believe makes sense as it 
makes it easier to understand device-trees for ICs which may provide 
other nodes but ADC channels too).

properties:
   $nodename:
     pattern: "^channel(@[0-9a-f]+)?$"
     description:
       A channel index should match reg.

Yours,
	-- Matti

