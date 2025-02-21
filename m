Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05719C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG0BbpFoyNoqsk135c328imcMJ0+Nr3ev0Mcwuo/rmM=; b=skx3oXwC0/sPHlHT89vdFddyLs
	ZQ4BncGWuE6NTrvZH2Zu3o+FcVKuXGGcuse0k33LhP4jg6JmF/PTFaH3je+Nq5m6tQolkZE7qTPF8
	2N/XsT9PBVlYeLNWw8UT5CFM2lNDm1Bf5yO+bapPvZvjvFdIURi0T0xxiZxMkFegw06S2kX3BASzc
	y0DaPMsJP0WsSh8loNNwvC0pSo3up1AMVjB26ECRTDMFIooYy3soAN7ZAXoYURNaJT3XOGu93BzuZ
	W6kWbHJIQuPAbKlh6Sz1OOIbNCNNPxG5oXLGO65p97S+hHh0VfkVV+4qi8zOTPky15oJ/u1wZsUsd
	BSNb6tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQAa-00000005A2x-15vL;
	Fri, 21 Feb 2025 10:22:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPzK-000000057LK-0y3k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 10:10:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54838cd334cso720341e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 02:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740132628; x=1740737428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bG0BbpFoyNoqsk135c328imcMJ0+Nr3ev0Mcwuo/rmM=;
        b=lQfO77rsJNwLIf2Sm8DFo6R6TRHsBjJ0H3ON83asx51giglKY02ZaLHWiWLY1LJ5ep
         Gh5LMQvBWeT1XnpOyStXD2NwnF+U2tVBL03Tha4RVq1BW+QaSLhyE96oyWdndrSiHNsK
         J855lfJsQoRQfqstJ80ckSwqE7ocrvSMRKzZt+m8bbgCr4QGS0ySBbOi3OmC6lBfARYh
         iA376fCqIj7NZd301QxxcbUz7vH8b7JgrbxtQdZDabbsALZb3CKHqNa+PsTMcNdGQa9R
         Q2HjFCtk1GefDp/xG2BdXFC/zZkMYk/wdC4HDoRZ7WLf8bg4Rfk42pL19eWJHaRoLjU1
         Fc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740132628; x=1740737428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bG0BbpFoyNoqsk135c328imcMJ0+Nr3ev0Mcwuo/rmM=;
        b=dJRGW3a2rYGVKDevy4MtzoSEA79rNBdTirPKtrUMLbsn15rutspsVRZa2NgwAvZDas
         SXX2dlz1yAi9h7/BwFpZkJnP3wzex/EJoqiXiELx0bMRFNAPEbgbTaT2AT9Yn+VrKMKp
         7LdywNmLCqP+UgIdvchtE20Id4ob3//sUDsWD2ZNte7dXh/GCGoKjLQJ+8wQWKVVt1jV
         +6e3H84VZYYwX3QNBQgZYUkjo5WCfn2HhNdKBTNqSmdsKgjmexRNuzU+B4ztdHYNrkWn
         JCg6CpnKrzG3kN9x0P2oFjdGeYXbV69etUq+/naDxDzHF+Wit7ef6B400JON5dIIrgSF
         u0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVb1LOlrH52qpGKZfnwmlDAcaAsb/lEN0Vb+FMyriTMwrHAmNsn28Z/RPwLeIeYue0pSlA7aIUO0+HN8QU9ShZS@lists.infradead.org
X-Gm-Message-State: AOJu0YyK4g0xs8PKieU1qnnMqW9hCWtAGc7u16zjVLVcrh1e6JC2auXm
	38V4dhxSqnH2DRjDBYVf1QXwsT9yQCRiDvE5dTfpa4ICbueLc4mL29eSQw==
X-Gm-Gg: ASbGncuX6vpSZy/1CstxmQ1mT1jquPTuuIF/9RB9QjbVb7volpvJfsHAoD3jc9L/dRf
	Jy1iI9T7M0ENGa9L1K4cwPiQqIGhF9kCto1zT31mtjhkPUj333m0AYrETamPrWuAP49K/lx2kYf
	qHcQ4A0Jx6Kw29cLF0Sa3hVMR472UT2PTm4MNRDN/5zAPq9MNsnCDkmgcNUjMGLUjZe5wIYxRG6
	CvZsMvjg7XHTcgoNhKo056aAfZYYibvOGnqBtuckEEB34Y6FI6Fk572mXapxBi1hOA++kpieJnG
	CxwtcpJH8ZzW/+qmLjZ6uNB1SIvwNzioMWlbwd9FTxPxVz2vf3qJLAnKpWJzMWQSxsFSUXBRjNR
	N1o9oUFg=
X-Google-Smtp-Source: AGHT+IEF7HCPBupTpoTIufUdFzsU1NW7CnwkRmSqsaZ2XXJ41DlnitRvGydjhmN16iRmcwFrBfhXBA==
X-Received: by 2002:a05:6512:3f05:b0:542:2e09:639a with SMTP id 2adb3069b0e04-54838edddd1mr724643e87.10.1740132627920;
        Fri, 21 Feb 2025 02:10:27 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105c2fsm2638305e87.117.2025.02.21.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 02:10:26 -0800 (PST)
Message-ID: <cb27d8b1-c978-4443-9ad2-96e930701976@gmail.com>
Date: Fri, 21 Feb 2025 12:10:23 +0200
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
 <9018e23c-da28-41b0-b774-1598b946a2a1@gmail.com>
 <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z7dCnRzuQTaJXzmb@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_021030_279070_3142C71E 
X-CRM114-Status: GOOD (  33.01  )
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

On 20/02/2025 16:56, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 04:21:37PM +0200, Matti Vaittinen wrote:
>> On 20/02/2025 16:04, Andy Shevchenko wrote:
>>> On Thu, Feb 20, 2025 at 03:40:30PM +0200, Matti Vaittinen wrote:
>>>> On 20/02/2025 14:41, Andy Shevchenko wrote:
>>>>> On Thu, Feb 20, 2025 at 09:13:00AM +0200, Matti Vaittinen wrote:
>>>>>> On 19/02/2025 22:41, Andy Shevchenko wrote:
>>>>>>> On Wed, Feb 19, 2025 at 02:30:27PM +0200, Matti Vaittinen wrote:
> 
> ...
> 
>>>>>>>> +EXPORT_SYMBOL_GPL(iio_adc_device_num_channels);
>>>>>>>
>>>>>>> No namespace?
>>>>>>
>>>>>> I was considering also this. The IIO core functions don't belong into a
>>>>>> namespace - so I followed the convention to keep these similar to other IIO
>>>>>> core stuff.
>>>>>
>>>>> But it's historically. We have already started using namespaces
>>>>> in the parts of IIO, haven't we?
>>>>
>>>> Yes. But as I wrote, I don't think adding new namespaces for every helper
>>>> file with a function or two exported will scale. We either need something
>>>> common for IIO (or IIO "subsystems" like "adc", "accel", "light", ... ), or
>>>> then we just keep these small helpers same as most of the IIO core.
>>>
>>> It can be still pushed to IIO_CORE namespace. Do you see an issue with that?
>>
>> No. I've missed the fact we have IIO_CORE O_o. Thanks for pointing it out!
>>
>>> Or a new opaque namespace for the mentioned cases, something like IIO_HELPERS.
>>
>> I am unsure if it really benefits to split this out of the IIO_CORE. I've a
>> feeling it falls into the category of making things harder for user with no
>> apparent reason. But yes, the IIO_CORE makes sense.
> 
> Probably I was not clear, I mean to put this under a given namespace. There is
> no a such, we have currently:
> 
> IIO_BACKEND
> IIO_DMA_BUFFER
> IIO_DMAENGINE_BUFFER
> IIO_GTS_HELPER
> IIO_RESCALE

Ah. So, the IIO core stuff is still not in a namespace. Those listed 
above are all too specific (I believe, in general, and definitely to 
carry ADC helpers).

Adding 'ADC_HELPERS' would just add yet another way too specific one. 
So, currently there is no suitable namespace for these helpers, and I 
still believe they fit best to where the rest of the IIO-core stuff is.

If we want really play the namespace game, then the existing IIO stuff 
should be put in a IIO_CORE-namespace instead of creating more new small 
ones. I am afraid that adding all existing IIO core to a IIO_CORE 
namespace and converting all existing users to use the IIO_CORE is not a 
reasonable request for a person trying to:

1. Write a driver
2. Add a small helper to aid others (instead of just melding it all in 
the given new driver - which does not benefit anyone else and just leads 
to code duplication in the long run...)

>>>>>> (Sometimes I have a feeling that the trend today is to try make things
>>>>>> intentionally difficult in the name of the safety. Like, "more difficult I
>>>>>> make this, more experience points I gain in the name of the safety".)
>>>>>>
>>>>>> Well, I suppose I could add a namespace for these functions - if this
>>>>>> approach stays - but I'd really prefer having all IIO core stuff in some
>>>>>> global IIO namespace and not to have dozens of fine-grained namespaces for
>>>>>> an IIO driver to use...
> 
> ...
> 
>>>> foo &= (~bar);
>>>>
>>>> is _much_ faster than seeing:
>>>
>>> Strongly disagree. One need to parse an additional pair of parentheses,
>>> and especially when it's a big statement inside with nested ones along
>>> with understanding what the heck is going on that you need them in the
>>> first place.
>>>
>>> On top of that, we have a common practices in the LK project and
>>> with our history of communication it seems you are trying to do differently
>>> from time to time. Sounds like a rebellion to me :-)
>>
>> I only rebel when I (in my opinion) have a solid reason :)
>>
>>>> foo &= ~bar;
>>>>
>>>> and having to google the priorities.
>>>
>>> Again, this is something a (regular) kernel developer keeps refreshed.
>>> Or even wider, C-language developer.
>>
>> Ha. As I mentioned, I've been writing C on a daily bases for almost 25
>> years. I wonder if you intent to say I am not a kernel/C-language developer?
>> Bold claim.
> 
> I'm just surprised by seeing that style from a 25y experienced C developer,
> that's all.

I am not. If something, these 25 years have taught me to understand that 
even if something is simple and obvious to me, it may not be simple and 
obvious to someone else. Similarly, something obvious to someone else, 
is not obvious to me. Hence, I am very careful when telling people that:

 >>> Again, this is something a (regular) kernel developer keeps refreshed.
 >>> Or even wider, C-language developer.

I may however say that "this is something _I_ keep refreshed (as a 
kernel/C-developer)".

As an example,

 >>>> foo &= (~bar);

This is something _I_ find very clear and exact, with zero doubt if 
negation is applied before &=. For _me_ the parenthesis there _help_, 
and for _me_ the parenthesis cause no confusion when reading the code.

I won't go and tell that I'd expect any C or kernel developer to be able 
to fluently parse "foo &= (~bar)". (Whether I think they should is 
another matter).

Oh well, let's wait and see what Jonathan thinks of these helpers in 
general. We can continue the parenthesis discussion when we know whether 
the code is going to stay.

Yours,
	-- Matti


