Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212A1C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMtd4Ct3saMXFXwwgDnBOHF0+oIR6E5UNtteZil5UN4=; b=uobvkTc1rVYh98ty5E9ZobiZ/2
	Ij/mgvBANBo++38iE0NL6kKztXVIaATJyVXdF3Ui0dnjcX/eUiczyjuMOo2s49xErBohbDJ9rC/4w
	Plmb3n/W/h51LFd79KN189uXpQB50YtHrj29Tqhwkmb8c4bYEhrQLVJUCxIXboW0jRO8qnjSglQiX
	So5B84VEL3xUMj9SNrelHtgfTu4VNp8dLL3hh+FrSjt3P26m81gJL5xbAFWa8KB+FMbJF2FBFNy3p
	eeYyw5sHxpy5ouidBqxdkcvh8GiBSmveT5MOpxxF1O3KIdUY2ItMwRxjTnG2DU1xthyGRR8w/MqYN
	+wTDRo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiSy-0000000BMoA-0eFQ;
	Thu, 13 Mar 2025 13:19:16 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiRJ-0000000BMbo-16CZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:17:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30bf8632052so9268991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871851; x=1742476651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMtd4Ct3saMXFXwwgDnBOHF0+oIR6E5UNtteZil5UN4=;
        b=JqerG8q5mVmSJPsG1YYXGDJ5qE8BpPkrAELU8rTzGVn+MBVxQaB2GmJJWpdOMPwA0X
         4/g6PltzWAIqLavsSn1mlQ3NaX57SN5doRyMRoof0n+3y6dzyBJvRLKc0xUyAMVmy6XR
         bCnkdcDv0jLufcTcaH3nYuZbkgk2FLBdWdYTO2crs/7u0lMgHnyxEQQhuJlrA7F046VX
         2irgRc/KYS9Ki6k8106exVG3XtGeod7zkZ6pr6f65c7+/psdBBYPDUllyrsvoWpWywv+
         fiOROOEIRLvZOIUPmVEnILLkzw2cpSeFaEZVoigKhbR2s4Py9ijUoElqWq0BeZ3NCQm6
         WNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871851; x=1742476651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMtd4Ct3saMXFXwwgDnBOHF0+oIR6E5UNtteZil5UN4=;
        b=LAYcDapZ+M3uu2mFpfFag3crIJY0NvoBnSCmMYYBCJ4Ku5yoh1vsM+ZabvjTJXYiPb
         2r0kV5wJZuBlyJxKk6cztHOb4tNFF/v0sSdi91nBNOSkiUscfVzHUEcRvA0TbSAz1+0s
         yEQwKM/itcCoDqoRz0KElCgYvVCfser2zeA2EAdLluwPBUx1n4A82BTmBN9SIKH675qX
         y9N6vTXl3jkSIaA6rKtv4en7IncVXFSNzttdM3fLZ71/gUcWNUbzsWW9YbtxY6ExrEQi
         0yBcheFiNSfmI08tnqSYW36NDI4Odpgkfs5Nq+TbA6m2z8s8ihFWgzrDm3yJAhq7JCNa
         AyrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr8loQ3C2WhtnRpuHRZ634kiszd2VMhctiugEKnIQEY2nJOp62ysK7N4Fb521V4eT3PQGk4NBNB/+kGyEp9Ip3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhxh9eU7qa9wi0raPwm6C3QSjoGtFxygEWeVgvBlUoOwKIVkS9
	7I31E+5BAEq1ZiicM/qHP48pB2W59m5V9ZyExTrRHXSTn89lOp+h
X-Gm-Gg: ASbGncuOxiEYhLQ6gT77HRcYoItiV6xiokJ156oFpXp16f+tKCCmrGMuxBlQ0CVh5pT
	UxTIB5ZLnCMlSxbccPjAnb0kC5ggjMxOO4pd/DAkfnWs/f0YY0P2/ciUK280ptykUHZA+dc/OQw
	BQbj8ftA24WgvWOob6DAxDG9ue9coEQX1nJMInwVUK44JumOa9K+101Drls+npG7pyQBSwBwy9y
	S71VTG1nT6FbWtfY8bPCt/nB1IWLpRLXfl73QRlwBvZjIcBpI3+vponGAxIKkRQ2h/5+Ln7G+sL
	vVp9Nagz6mz3Idx2MAIpAvmh22CkbYaXSZn9LNfesKFU8ZE8lwh8PDRfmjGXUHveCt47YtSpZJf
	UAfrwTjmKcnRFHFhklqLfe57i6A==
X-Google-Smtp-Source: AGHT+IGUUl0LVmN96xFU94Q8pBwvgPJWhTup+0iU4QVNU/cc+uuXO+92xsYm0ESUYd6MtzARCUk8Xg==
X-Received: by 2002:a05:651c:2106:b0:30b:b204:6b80 with SMTP id 38308e7fff4ca-30bf44eda0cmr93616221fa.8.1741871850985;
        Thu, 13 Mar 2025 06:17:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da3d2sm2136881fa.92.2025.03.13.06.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 06:17:30 -0700 (PDT)
Message-ID: <bca95d63-fb6e-4d6c-8ab6-df67f0e697e6@gmail.com>
Date: Thu, 13 Mar 2025 15:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] iio: adc: add helpers for parsing ADC nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
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
References: <cover.1741849323.git.mazziesaccount@gmail.com>
 <c8899e8c535a1d93cd7588b7c160eb0fae5d26d2.1741849323.git.mazziesaccount@gmail.com>
 <Z9LQFqSweiV-zT3b@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z9LQFqSweiV-zT3b@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061733_307494_4B08809F 
X-CRM114-Status: GOOD (  31.40  )
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

On 13/03/2025 14:31, Andy Shevchenko wrote:
> On Thu, Mar 13, 2025 at 09:18:18AM +0200, Matti Vaittinen wrote:
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
>> +int devm_iio_adc_device_alloc_chaninfo_se(struct device *dev,
>> +					  const struct iio_chan_spec *template,
>> +					  int max_chan_id,
>> +					  struct iio_chan_spec **cs)
>> +{
>> +	struct iio_chan_spec *chan_array, *chan;
>> +	int num_chan = 0, ret;
> 
> Unneeded assignment.

Hmm. I have a deja-vu. Thanks for the reminder.

> 
>> +	num_chan = iio_adc_device_num_channels(dev);
>> +	if (num_chan < 1)
>> +		return num_chan;
> 
> This is really interesting code. So, if the above returns negative error code,
> we return it, if it returns 0, we return success (but 0 channels)?

Yes. I don't think it's that interesting though. Checking the devicetree 
succeeded while no channels were found. I think returning 0 is very much 
aligned with this.

> Shouldn't we do *cs = NULL; at the case of 0 channels if it's a success?

I suppose you're right.

But, as you pointed out in review of the 05/10:
 > Usually in other similar APIs we return -ENOENT. And user won't need
 > to have an additional check in case of 0 being considered as an error
 > case too.

I don't know whether to agree with you here. For majority of the ADC 
drivers, having no channels in devicetree is indeed just another error, 
which I think is not in any ways special.

However, for 33,3333% of the users added in this patch, the "no channels 
found" is not really an error condition ;) The BD79124 could have all 
channels used for GPO - although this would probably be very very 
unusual. (Why buying an ADC chip if you need just a GPO?). Still, this 
wouldn't be an error. (And I need to handle this better in BD79124 probe 
- so thanks).

> (Under success I assume that returned values are okay to go with, and cs in
> your case will be left uninitialised or contain something we don't control.

I see your point although I wouldn't be concerned with cs not being NULL 
for as long as number of channels is zero.

Anyway, I think it makes sense to simplify ~67% of callers by returning 
-ENODEV if there is no channels. The remaining ~33% can then check for 
the -ENODEV and handle it separately from other returned errors. So, thanks.

>> +	chan_array = devm_kcalloc(dev, num_chan, sizeof(*chan_array),
>> +				  GFP_KERNEL);
>> +	if (!chan_array)
>> +		return -ENOMEM;
>> +
>> +	chan = &chan_array[0];
>> +
>> +	device_for_each_named_child_node_scoped(dev, child, "channel") {
>> +		u32 ch;
>> +
>> +		ret = fwnode_property_read_u32(child, "reg", &ch);
>> +		if (ret)
>> +			return ret;
> 
>> +		if (max_chan_id != -1 && ch > max_chan_id)
>> +			return -ERANGE;
> 
> Hmm... What if max_chan_id is equal to an error code?
> Or in other words, why -1 is special and not all negative numbers?

-1 was just picked to represent a 'don't care' value. Old habit. In the 
old days I handled lots of code where -1 was defined as 'invalid' for 
APIs with unsigned ints as well. It works nicely on systems where it 
turns out to be maximum positive value - leaving most of the number 
space for valid values.

I suppose saying any negative means "don't care" works well here. And, 
dropping all negatives here will also make the check below just work 
with unsigned comparison.

> Also note, you used unsigned type and compare it to int which,
> in case of being negative will give promotion.

Right. I didn't thin negative IDs would make sense and trusted users to 
pass only positive ones. Treating all negatives as "don't care" is 
indeed better than trusting this.

Thanks.

> The ch will not be
> big enough in most cases (unless it's great than (INT_MAX + 1).
> 
> TL;DR: you have a potential integer overflow here.
> 
>> +		*chan = *template;
>> +		chan->channel = ch;
>> +		chan++;
>> +	}
>> +
>> +	*cs = chan_array;
>> +
>> +	return num_chan;
>> +}
> 


