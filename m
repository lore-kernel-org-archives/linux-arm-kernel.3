Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA25C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HalaitR3wNqHBLiZ26kGsVTmgpsmEjHSTSSRfu+eT1s=; b=ririj4/taEvlTEOgeDb1YGUX9v
	GvwWkARHq860VXKs/4ewMljMcL1rsF8+bjNw9kfxxOA6LrCc08HBAQtqe6W6lhUVWiSAug1osWKiY
	taoHwd18LIPA3akwWfn25daZ1pYEonE6Yd0iy/1r6pL9gYTR7VvR0V5FiWD6/g6hadz3eywgJiuai
	MKxFH8m3ZFk9SFIPj9ATSsXtmLXavUVB9Gz+5o5r/sPoNacPGV1aTptWuTLpsXt0OfgfESVDIBMNS
	PuKzxCzcpg7dg9Fo/hIfHHDeb/U+HMINa9GyDTc9gprSK0U/D05L6W+zytQLR6yG+YzyX0223NoZf
	jvkzvGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4ei-00000001WHW-0IcN;
	Mon, 17 Mar 2025 07:13:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu4cz-00000001Vv8-3yKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:11:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4574723e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742195471; x=1742800271; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HalaitR3wNqHBLiZ26kGsVTmgpsmEjHSTSSRfu+eT1s=;
        b=mDelOi28FKfG+fQwa0g9yrOW6fezXAJZpS2MIlCwio0bdK7bgffjfSN7lZs+z97Dgy
         GcrUEjHEM/JT2fGEO+1YX920Fz5RWHoBDiOqy/QplrczgcV0wMYeUkrTBooIpsLTBvec
         wJHb7los8tj6mVOvouoy9kUdimjUpOc/37fSH+7lsLc+b9PXpXKYvY7ddh5YHlD1JJqo
         BqZnfZ6b2VrMRUDmBhGwhoBrBPrBbAQGMHQlXV7u/5GSUYZTZsWJ/IOjqyAVpOKqwzOE
         w7mLeIrmw98R3whpPwhVFEppL8XCBoBNEBXk+K1a+RaBQI/sbtOyIta4WtZqBvqerqal
         Rjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742195471; x=1742800271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HalaitR3wNqHBLiZ26kGsVTmgpsmEjHSTSSRfu+eT1s=;
        b=EnDtjRGzCYG8qjMSA1SvEHkwjrFBZ+HwYm+kBiKXjmt2QxuLvIkBzg8kxXyRp5Cb+i
         UoWfoHRHJBeZcLApI78d9OzIj6aCZ8xa0MdBZb+SSJctzCvEwA0JXGe+u3H8ya8pCUP1
         j7MiQjP8c8E/Lc5TMY2Mt1D/PpeFlfbQMZCcW679RCO11wBSBn4l3hKWrcCyBFKS4r3f
         l1LOHXN6aGCTf+bvEUwgYIAMX2m2vhoVIhGTLGPy3VqY81WIktplHj3ndWmUZzsqL51u
         L69pN1Bh8m7djswLrxB4Q+FiZpvgRLfEreTuCuZwwvspaUysta/1qTbvz0GcbXGWIsbV
         0w2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyi3U0Srjj702S1VHTmlr7eIkFlq2dzpLWQvSVwIoGdiE89S61vS3kUJ0Z8rcJ21SKQKWvgZutYslx1K11sjys@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc+/rThTOwkisVTCSn65c78sLn1mXJAXpCoT8ttDr1A/EjJZKg
	zcxuVfDzkyiWG99V5Q8W8u+7HyQY70AN4/LYhCLBaIHihhXytp9k
X-Gm-Gg: ASbGncsPFmGUpRWmmVIuP5mnTU594Hzm9Fm/mby/N8VSdy9naxWKuv4FCUd+pYzeoen
	quzA44gXFB42Je6gz9OBlUU8hI2PVaRjJC+2wJDZHLTHBJtS8fDzH/ZkdL53YVCPCZxbSMwHB+G
	A7cJrHm0s2k6hcFqb/a6wkjq43wh2xzwjaGpq9mH/43lnhFjPvMR/JKDh5fNINnpd/2Ti/Nv8KP
	G38uGU3AgmURvh01FgDr7kkUYBxg+OG/5Lx2W+pTxDpF8wBP8RfBt6C3jCKJVoRiOAATIXGGQgL
	EtYhUN+4rD1AKbO3kqsnwLgQOA1rE3oPU1ttbtsrnhr4GNU/UeknrzmmIn83RROsZxWAHrUOVUT
	AKx6TIazK/3pwsq0LttbZN+AhUQ==
X-Google-Smtp-Source: AGHT+IGYn0VINpzgzh6MdKG0thylUkI/oz83FeKBKYjY8VACZiA9L37BUf8dAo+M8/olFMTjah+v2A==
X-Received: by 2002:a05:6512:118a:b0:549:8f14:a839 with SMTP id 2adb3069b0e04-549c3f23817mr5553692e87.11.1742195471393;
        Mon, 17 Mar 2025 00:11:11 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a761asm1220851e87.229.2025.03.17.00.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 00:11:09 -0700 (PDT)
Message-ID: <50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
Date: Mon, 17 Mar 2025 09:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
To: Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQ0O34EUM8WZku@smile.fi.intel.com> <20250316094112.6731bd01@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250316094112.6731bd01@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_001114_027387_66DE9F60 
X-CRM114-Status: GOOD (  19.63  )
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

On 16/03/2025 11:41, Jonathan Cameron wrote:
> On Thu, 13 Mar 2025 14:34:24 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
>> On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:
>>> The new devm_iio_adc_device_alloc_chaninfo_se() -helper is intended to
>>> help drivers avoid open-coding the for_each_node -loop for getting the
>>> channel IDs. The helper provides standard way to detect the ADC channel
>>> nodes (by the node name), and a standard way to convert the "reg"
>>> -properties to channel identification numbers, used in the struct
>>> iio_chan_spec. Furthermore, the helper can optionally check the found
>>> channel IDs are smaller than given maximum. This is useful for callers
>>> which later use the IDs for example for indexing a channel data array.
>>>
>>> The original driver treated all found child nodes as channel nodes. The
>>> new helper requires channel nodes to be named channel[@N]. This should
>>> help avoid problems with devices which may contain also other but ADC
>>> child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
>>> string didn't reveal any in-tree .dts with channel nodes named
>>> otherwise. Also, same grep shows all the in-tree .dts seem to have
>>> channel IDs between 0..num of channels.
>>>
>>> Use the new helper.
>>
>> ...
>>
>>> +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
>>> +				&sun20i_gpadc_chan_template, -1, &channels);
>>> +	if (num_channels < 0)
>>> +		return num_channels;
>>> +
>>>   	if (num_channels == 0)
>>>   		return dev_err_probe(dev, -ENODEV, "no channel children\n");
>>
>> Note, this what I would expected in your helper to see, i.e. separated cases
>> for < 0 (error code) and == 0, no channels.
>>
>> Also, are all users going to have this check? Usually in other similar APIs
>> we return -ENOENT. And user won't need to have an additional check in case of
>> 0 being considered as an error case too.
> In a few cases we'll need to do the dance the other way in the caller.
> So specifically check for -ENOENT and not treat it as an error.
> 
> That stems from channel nodes being optionally added to drivers after
> they have been around a while (usually to add more specific configuration)
> and needing to maintain old behaviour of presenting all channels with default
> settings.
> 
> I agree that returning -ENOENT is a reasonable way to handle this.

I agree - but I'm going to use -ENODEV instead of -ENOENT because that's 
what the current callers return if they find no channels. That way the 
drivers can return the value directly without converting -ENOENT to -ENODEV.

Yours,
	-- Matti

