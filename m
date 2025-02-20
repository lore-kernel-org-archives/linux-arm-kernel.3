Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C68FC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzmoiLCG8SAcHQOd7ewiQtwf2LHT2fH6DKF15WTZxJc=; b=dkI+Nkwh7CBEKUK42zju5InzHB
	itBkBW9kg0qTp+dK1G6Sb0PVWmC+jPy8qPBaYFYp7R5K28BDImnIc6Nzvj5h072VACrwf3A5P4elb
	2Aelz5AiAqeFg5rNTboDRhdZcwd5ERZd2p0sv4wkYsAe38YHFQPSi5SImX2IF7alBd4f1KHcJe1uG
	MdrK2wvkIkiz5xg5FCriLLCJrVtpW2s5aAMVdiOG2QY6yFmaAl2p0AQ/wCqyqpRDqSAgxVmJBZOTX
	wEexZNj+iEm98JjMTHuoaG1k5qEcN3wHzg+7tOJJQGs++msdHpa8I8jpybfKotQVXl25Qp5B3AFVz
	3crq+Uwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7du-00000001LFz-2tJZ;
	Thu, 20 Feb 2025 14:35:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Qu-00000001HUC-1nZa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:21:45 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54529e15643so1891122e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061303; x=1740666103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzmoiLCG8SAcHQOd7ewiQtwf2LHT2fH6DKF15WTZxJc=;
        b=bmRRrq+Fj+ImigP8izyYVIPdm8Z0wC7BIHs8HEP/3GJfNk0vsM+Bq205UGjHIKfA+f
         XAyp5ZIoEB+aLymPn3sdwZx5bE6k/3V/b1kIZbxNXoNJlWHzJ1lvGg/nZOPjPoXRloyA
         2eww0H2Qi+cO7p1lp1tfuFyJMVQpbRWGm03EiDzic4Lx17OWq1dK+m0M0N+oU1ZOy4/d
         D1wnMOK0oZPTWrYHmmklmdfFGLPdN5As2NlYyu6Jo4bTCA/Xwec6+k4HV3h54jFO6VVM
         NgPvsm5JkS359jGP4UP3VSmU7iGodGXoHdw9MJVM+AyDGhRHJMwke1cjKvT1t8R7Mr4K
         19Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061303; x=1740666103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzmoiLCG8SAcHQOd7ewiQtwf2LHT2fH6DKF15WTZxJc=;
        b=eLHlQhr5wk86SjwazDQVr9RuUNsi/wPBmuwUTwMTjvMYZwdYqJXm7VP/tSytrmp74P
         2YW9wEL3KdYFS2S+ZTZM/HxpTNB6pgk5By7u6rLjZkRHMFwQzlesXx6Bdasz7Gmr+HV0
         eU98H3F/zeHCGBK9/ofRyNN++C1P0938UyYiH/XZNnWeG1PSjy3uV6+hiCn8YQnqZeXc
         EK27ziForDqT2R1yUv67qYj1n42nrVuYy1yeyeF8WKbFNHAXPyKZwHcT56MSiFPnjXV9
         coDX2vGNpw17vZ6STc1ah6ghMUqGp9q8TPXnCHN14PkL837OIfYcIgWTUIIOgy878ifd
         +bRw==
X-Forwarded-Encrypted: i=1; AJvYcCWU+hg96LfKwQJOch5M8vyle4ktWS/wT43CMsd2u/tbJTZ7V41XixWQRF9AIsIY9SdcKzWZ3sSvNujPh8c5ZdZk@lists.infradead.org
X-Gm-Message-State: AOJu0YwkTVSSOCuA9RN/930Xb/7XGZzLjZN3AdwdewHS2/xlxSI1iKw9
	VZ7bziD86DvYzAj9EGDukg1afSrLMHEsdDcJ/C6qbXb+7xDNPVF+
X-Gm-Gg: ASbGnctTZP+NQOQQNB9IGeEfqTRoCd7aulmqjhROdE3sSuICi1481sJVmClOWkjhqtb
	y16zwk1VcGz/cuMFJSHtjubaQw2fWAeqH2zrJh4Yb9DdTqGJPtSWTNyVBgG04DVN3ADLuXJRuth
	41WrPuH9Mcvp5yTpc78jEM+8hg5jCnPSIFsiYyGynUDPvut7SilxtibvQIJERMbEac8g4zhMbtX
	0tjzfPf9J+Xi2JwmJpy4JQABppgNVwZGl5XxseJkPkRbDYA8nbYdB9rSeCAnzU62r1thxh2ucd3
	zDeoh57M2sAf0kHlmQ2mnoP5EmEvo3L2ydNOnQFBkUdcat7HRpOaY9N8I+EY82HYGVP5gF2v
X-Google-Smtp-Source: AGHT+IEnorexehar0T56dUSxxROrZLAf2XndxCCWnC99AsuPb3902B0+uwY/QTJ7hoY8ePb04Bn4Lg==
X-Received: by 2002:a05:6512:4010:b0:545:16a8:6a5d with SMTP id 2adb3069b0e04-546e3c9c9e0mr1209013e87.2.1740061302295;
        Thu, 20 Feb 2025 06:21:42 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452fcf6487sm1893226e87.137.2025.02.20.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:21:40 -0800 (PST)
Message-ID: <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
Date: Thu, 20 Feb 2025 16:21:37 +0200
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
 <b1c1ed68-2f4d-447c-9957-5a1bbc63ef6e@gmail.com>
 <Z7ci7tUlRQqZEZSN@smile.fi.intel.com>
 <ec76334b-bb13-4076-811d-9174170dd677@gmail.com>
 <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7c2cBQpjoc9-Vyu@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_062144_476396_EB615197 
X-CRM114-Status: GOOD (  54.26  )
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

On 20/02/2025 16:04, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 03:40:30PM +0200, Matti Vaittinen wrote:
>> On 20/02/2025 14:41, Andy Shevchenko wrote:
>>> On Thu, Feb 20, 2025 at 09:13:00AM +0200, Matti Vaittinen wrote:
>>>> On 19/02/2025 22:41, Andy Shevchenko wrote:
>>>>> On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:
> 
> ...
> 
>>>>>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
>>>>>
>>>>> No namespace?
>>>>
>>>> I was considering also this. The IIO core functions don't belong into a
>>>> namespace - so I followed the convention to keep these similar to other IIO
>>>> core stuff.
>>>
>>> But it's historically. We have already started using namespaces
>>> in the parts of IIO, haven't we?
>>
>> Yes. But as I wrote, I don't think adding new namespaces for every helper
>> file with a function or two exported will scale. We either need something
>> common for IIO (or IIO "subsystems" like "adc", "accel", "light", ... ), or
>> then we just keep these small helpers same as most of the IIO core.
> 
> It can be still pushed to IIO_CORE namespace. Do you see an issue with that?

No. I've missed the fact we have IIO_CORE O_o. Thanks for pointing it out!

> Or a new opaque namespace for the mentioned cases, something like IIO_HELPERS.

I am unsure if it really benefits to split this out of the IIO_CORE. 
I've a feeling it falls into the category of making things harder for 
user with no apparent reason. But yes, the IIO_CORE makes sense.

>>>> (Sometimes I have a feeling that the trend today is to try make things
>>>> intentionally difficult in the name of the safety. Like, "more difficult I
>>>> make this, more experience points I gain in the name of the safety".)
>>>>
>>>> Well, I suppose I could add a namespace for these functions - if this
>>>> approach stays - but I'd really prefer having all IIO core stuff in some
>>>> global IIO namespace and not to have dozens of fine-grained namespaces for
>>>> an IIO driver to use...
> 
> ...
> 
>>>>>> +	if (!allowed_types || allowed_types & (~IIO_ADC_CHAN_PROP_TYPE_ALL)) {
>>>>>
>>>>> Unneeded parentheses around negated value.
>>>>>
>>>>>> +	if (found_types & (~allowed_types)) {
>>>>>
>>>>> Ditto.
>>>>>
>>>>>> +		long unknown_types = found_types & (~allowed_types);
>>>>>
>>>>> Ditto and so on...
>>>>>

...

>>>> during the moves I lost my printed list of operator precedences which I used
>>>> to have on my desk. I've been writing C for 25 years or so, and I still
>>>> don't remember the precedence rules for all bitwise operations - and I am
>>>> fairly convinced I am not the only one.
>>>
>>> ~ (a.k.a. negation) is higher priority in bitops and it's idiomatic
>>> (at least in LK project).
>>
>> I know there are well established, accurate rules. Problem is that I never
>> remember these without looking.
> 
> There are very obvious cases like below.

I think we just disagree on if this is obvious.

>>>> What I understood is that I don't really have to have a printed list at
>>>> home, or go googling when away from home. I can just make it very, very
>>>> obvious :) Helps me a lot.
>>>
>>> Makes code harder to read, especially in the undoubtful cases like
>>>
>>> 	foo &= (~...);
>>
>> This is not undoubtful case for me :) And believe me, reading and
>> deciphering the
>>
>> foo &= (~bar);
>>
>> is _much_ faster than seeing:
> 
> Strongly disagree. One need to parse an additional pair of parentheses,
> and especially when it's a big statement inside with nested ones along
> with understanding what the heck is going on that you need them in the
> first place.
> 
> On top of that, we have a common practices in the LK project and
> with our history of communication it seems you are trying to do differently
> from time to time. Sounds like a rebellion to me :-)

I only rebel when I (in my opinion) have a solid reason :)

>> foo &= ~bar;
>>
>> and having to google the priorities.
> 
> Again, this is something a (regular) kernel developer keeps refreshed.
> Or even wider, C-language developer.

Ha. As I mentioned, I've been writing C on a daily bases for almost 25 
years. I wonder if you intent to say I am not a kernel/C-language 
developer? Bold claim.

>>>>>> +		int type;
>>>>>> +
>>>>>> +		for_each_set_bit(type, &unknown_types,
>>>>>> +				 IIO_ADC_CHAN_NUM_PROP_TYPES - 1) {
>>>>>> +			dev_err(dev, "Unsupported channel property %s\n",
>>>>>> +				iio_adc_type2prop(type));
>>>>>> +		}
>>>>>> +
>>>>>> +		return -EINVAL;
>>>>>> +	}
> 
> ...
> 
>>>>>> +		tmp.required &= (~BIT(IIO_ADC_CHAN_PROP_COMMON));
>>>>>
>>>>> Redundant outer parentheses. What's the point, please?
>>>>
>>>> Zero need to think of precedence.
>>>
>>> Huh? See above.
>>> Everything with equal sign is less precedence than normal ops.
>>
>> Sure. It's obvious if you remember that "Everything with equal sign is less
>> precedence than normal ops". But as I said, I truly have hard time
>> remembering these rules. When I try "going by memory" I end up having odd
>> errors and suggestions to add parenthesis from the compiler...
> 
> The hardest to remember probably the
> 
> 	foo && bar | baz
> 
> case and alike. These are the only ones that I totally agree on with you.
> But negation.
> 
>> By the way, do you know why anyone has bothered to add these
>> warnings/suggestions about adding the parenthesis to the compiler? My guess
>> is that I am not only one who needs the precedence charts ;)
> 
> Maybe someone programmed too much in LISP?.. (it's a rhetorical one)
> 
> ...
> 
>>>>>> +		ret = fwnode_property_read_u32(child, "common-mode-channel",
>>>>>> +					       &common);
>>>>>
>>>>> I believe this is okay to have on a single line,
>>>>
>>>> I try to keep things under 80 chars. It really truly helps me as I'd like to
>>>> have 3 parallel terminals open when writing code. Furthermore, I hate to
>>>> admit it but during the last two years my near vision has deteriorated... :/
>>>> 40 is getting more distant and 50 is approaching ;)
>>>
>>> It's only 86 altogether with better readability.
>>> We are in the second quarter of 21st century,
>>> the 80 should be left in 80s...
>>>
>>> (and yes, I deliberately put the above too short).
>>
>> I didn't even notice you had squeezed the lines :)
>>
>> But yeah, I truly have problems fitting even 3 80 column terminals on screen
>> with my current monitor. And when working on laptop screen it becomes
>> impossible. Hence I strongly prefer keeping the 80 chars limit.
> 
> Maybe you need a bigger monitor after all? (lurking now :-)

Wouldn't fit my table :)

> ...
> 
>>>>>> +#include <linux/iio/iio.h>
>>>>>
>>>>> I'm failing to see how this is being used in this header.
>>>>
>>>> I suppose it was the struct iio_chan_spec. Yep, forward declaration could
>>>> do, but I guess there would be no benefit because anyone using this header
>>>> is more than likely to use the iio.h as well.
>>>
>>> Still, it will be a beast to motivate people not thinking about what they are
>>> doing. I strongly prefer avoiding the use of the "proxy" or dangling headers.
>>
>> Ehh. There will be no IIO user who does not include the iio.h.
> 
> It's not your concern. That's the idea of making C units as much independent
> and modular as possible (with common sense in mind). And in this case I see
> no point of including this header. Again, the main problem is this will call
> people to use the new header as a "proxy" and that's what I fully against to.
> 
>> And, I need the iio_chan_spec here.
> 
> Do you really need it or is it just a pointer?

Just a pointer. Forward declaration could do it. Hmm. I didn't think of 
people using this header as a proxy. I guess you have a point here :)

> 
> ...
> 
>> And as I said, I suggest saving some of the energy for reviewing the next
>> version. I doubt the "property type" -flags and bitwise operations stay, and
>> it may be all of this will be just meld in the bd79124 code - depending on
>> what Jonathan & others think of it.
> 
> Whenever this code will be trying to land, the review comments still apply.

Sure! But chances are plenty of this code gets erased :) I just wanted 
to warn you that some of the effort on this version is likely to get 
wasted. I did consider reverting this back to a RFC - but going back'n 
forth with the RFC status felt odd...

Yours,
	-- Matti


