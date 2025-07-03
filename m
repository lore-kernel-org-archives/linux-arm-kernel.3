Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=; b=4F3gOL7BHDjx4ofhJnnlwz69ms
	rfjS0zu2jP9sSy2Pnuaf4Oj8AvvQinMj37wJcOXAlvr+Y7frnkWAKxZedm1TBc9L8Ts78OvEoCCEe
	+KVY+fk7KGM+h9Xfn4LiAhC2FLfNaUq2og1n0k6mGTcn2sfsM86xYHuo2WXz0Y0n9GdOSipTJ/bIV
	9OanMl1NAwsr96/hZ8JqvywCPnHqrKLPfZR+O/rRc9boaGOoEhsV26xls2rgB2AoTXWHQVpT+ytId
	coiLJPtxfQukuI6ULRl9p9mXxTRnczHX433pdlOSPq4D3LNIeDZwIMQPK7fa6g/HRteBhrwL6po6m
	gj7yA48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNcm-0000000C7LX-2PwH;
	Thu, 03 Jul 2025 17:21:28 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLDD-0000000BiVv-1Bv4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:46:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso10743964a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751554013; x=1752158813; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=;
        b=TmGhs9zEwErCcCwpYPHm7hk1VfgKEGsmjIfWG5mIkwkriFr7ynsocWYlVH1SzaubzS
         tTlngkq4zQBpXhXuntZx5CfOVgRnClcm4gadKedo0n3njWrqsEodJyjXw54bimES4vBJ
         neHsxcD/aXrBz7lW5MlhUCxdPpYz3nSnvt6fWNSA6cqM7X1bj6ZQTzlvt+qu1gCs+j9B
         QcmxHfnEbebuS6LIn5/GBz6sAEb7KGnodK7GjY+YmbcOWBXCvXUjBEfWPzFT0GWsTfzh
         jgpyNEXl6wJhvmqO3lhC6VzkC/0k02s12dmJj+R8ejEb9HJVnLziiF1XYzUAtqs1x++4
         bM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554013; x=1752158813;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1vG5loofJoHI/2oT8MQ0obd1zMTsI6DHFF+BLI2gKVY=;
        b=ZflDoCmUNqN+7/KGfoq3GyWwBoRo8sSagZprvJtW8ks6iuihDnmqX+1lpLqdODzKql
         AdtYAjdst3HFnns8a7BwN/inMqV0b2ZO17JwKI/cLHZN9Jd6f2GtWtyQ8GTnAqWl/KAL
         HGIw3UPh9P9d8i4uPSpTKGVijIRdJ7xgOtgJsyM3n/PwDF145A+mInwZa0dVQjip+Zi7
         6SgELOvoZazeKQS/H/ruFKn1NFGWHazCO7EHS6NYNGr+5ZMwOtJb4VsBcDfcH35HI7V/
         Z+ruyyn9LGuAL1ZDczlG9Ovu+yZ8wxK9ktjsJqezgkN4TDeN+0XP92IlHJgmK2lAaZWh
         iCrw==
X-Forwarded-Encrypted: i=1; AJvYcCXhylOV/vaj+Z4JniCBBwkJoQHN4W2Q7EMcBSzpIHLPjjUHhSK7HNFlM9N77hGglzW9UCmiUJF5TwWyLWf43qA4@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTPGSkejzc+2cYBpbWI+yoI6vrRFtsWUGOMzx38sKTjSDZ1Az
	fxBPQM2N7lnm+tAuRUhvL0jBlYIRlLzwjUOLNTgD9t9S1yraM6bnIlIM
X-Gm-Gg: ASbGncv7gRf0TonLsT5HMEbrfhBd2JrQYEeimT4E4CHlMNp8udsbVZzG17OZYD/Xb10
	emGkyTEoMHcq01N4SAQa+u0sFHUxoYYoeqSPYVbhnsbqn10dP4s6DZd8JKPNYdeFDq2LPv+JoNj
	ulbcr9EmGuwd+un8SDnlBvf6/+5H1GSEO9AfliWdcbtNwBYFdOe21ZKXJ/Np/aMj27qCyz+CKM9
	QSq7IesAx09vEUpTg+BTzNYI1VxSNhid7a5AWAznCxNEBVo9tO6l20xnxBD+nO0ph4aoqcAeN7b
	yPCSyzb0tyQeodP6R2Td+Cr0Dm6sPFaELDovwsSSiX5Qq5BpcKKKO3CA+c1yqgM7BrhUJS6eT0i
	goCc=
X-Google-Smtp-Source: AGHT+IG3d3NfRg9+cPD1+4PBfyGx8gRVD7/AozdqjiToYMztJLCFly4TfxgJoNGqYews3daJwQLNLg==
X-Received: by 2002:a05:6402:35d3:b0:608:155c:bf81 with SMTP id 4fb4d7f45d1cf-60e6ce24caemr3706836a12.31.1751554012933;
        Thu, 03 Jul 2025 07:46:52 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb5b2sm10745485a12.4.2025.07.03.07.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:46:52 -0700 (PDT)
Message-ID: <cbf8d7bd-24a4-4dc1-8d9f-bbc4bee45d8d@gmail.com>
Date: Thu, 3 Jul 2025 17:46:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Julien Massot <julien.massot@collabora.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20250702132104.1537926-1-demonsingur@gmail.com>
 <5e1b26637706f6eac92acbbb3d5a7dafa0c2c232.camel@collabora.com>
 <d4052ab3-9cd1-45e8-81b0-b6512822e646@gmail.com>
 <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <c661e7f3faec269f73d6240fbe7b84e3bc97157a.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_074655_324435_3ED1A27F 
X-CRM114-Status: GOOD (  34.02  )
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



On 7/3/25 4:54 PM, Julien Massot wrote:
> On Thu, 2025-07-03 at 15:17 +0300, Cosmin Tanislav wrote:
>>
>>
>> On 7/3/25 3:07 PM, Julien Massot wrote:
>>> Hi Cosmin,
>>>
>>> On Wed, 2025-07-02 at 16:20 +0300, Cosmin Tanislav wrote:
>>>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>>>> replacing the few GMSL2 drivers already in upstream, and introducing a
>>>> common framework that can be used to implement such GMSL chips, which
>>>> avoids code duplication while also adding support for previously
>>>> unsupported features.
>>>>
>>>> While the normally acceptable and polite way would be to extend the
>>>> current mainline drivers, the choice was made here to add a totally new
>>>> set of drivers. The current drivers support only a small subset of the
>>>> possible features, and only a few devices, so the end result after
>>>> extending them would in any case be essentially fully rewritten, new
>>>> drivers.
>>>>
>>> Thanks for your work,
>>> The common framework will help a lot to drive new GMSL chips, and most of the
>>> features are covered.
>>>
>>>> This series depends on support for internal pads, for which a patch has
>>>> been added.
>>>>
>>>> The previous version is at:
>>>> https://lore.kernel.org/lkml/20250618095858.2145209-1-demonsingur@gmail.com
>>>>
>>>> The following deserializers are supported:
>>>>    * MAX96712 (already exists in staging)
>>>>    * MAX96714 (already exists)
>>>>    * MAX96714F (already exists)
>>>>    * MAX96714R (GMSL2)
>>>>    * MAX96716 (GMSL2)
>>>>    * MAX96724 (already exists as part of existing MAX96712 driver)
>>>>    * MAX96724F (GMSL2)
>>>>    * MAX96724R (GMSL2)
>>>>    * MAX9296A (GMSL2)
>>>>    * MAX96792A (GMSL3)
>>>>
>>>> The following serializers are supported:
>>>>    * MAX96717 (already exists)
>>>>    * MAX9295A (GMSL2)
>>>>    * MAX96793 (GMSL3)
>>>>
>>>> Known backward compatibility breakages:
>>>>    * No default routing. Default routing has been intentionally ommitted
>>>>      as the devices support quite complex routing and it would be
>>>>      unfeasible to provide sane defaults for multi-link deserialziers.
>>>>      It is expected that userspace programs would set appropritate
>>>>      routing.
>>>>
>>> This part is the most annoying one: at the moment, there is no way to set the routing except by
>>> manually enabling a boolean within the kernel source.
>>> You can't guess what routing the user really wants, but please at least provide a default
>>> routing
>>> table that allows using your drivers — for example, the device's default routing.
>>>
>>
>> It's a very delicate issue... I'll try to see if I can do that.
>> It would be great if we could enable the streams API globally since it's
>> been merged since Jan 15 2023. It's been over two years.
>>
>>
>> Thanks,
>>
>>>
>>>
>>>> The following list enumerates new features that are supported by the
>>>> common framework and their respective chip-specific drivers:
>>>>    * Full Streams API support. Most deserializers have support for more
>>>>      than one link, and more than one PHY. Streams support allows
>>>>      configuration of routing between these links and PHYs.
>>>>
>>>>    * .get_frame_desc() support. Both the serializers and deserializers
>>>>      implement this to query and provide frame descriptor data. This is
>>>>      used in features explained in-depth below.
>>>
>>> So are almost all the sensor drivers incompatible?
>>>
>>
>> Yes, sensor drivers need to have .get_frame_desc() implemented... It's
>> not a huge feat and it's the only way this type of bridge could work
>> properly.
>>
>> Alternatively, we could add a fallback that bases its decision on the
>> stream format, but I'd prefer if we didn't and we would just implement
>> .get_frame_desc(). After this series is merged I can submit my patches
>> for imx219.
> There is already one pending on the mailing list
> "media: i2c: imx219: Report streams using frame descriptors"
> I guess it's fine if we require the sensor to implement this function.
> 
> But I had to do it for vgxy61.
> 
> Btw I tested:
> TI AM62x + max96716 + 1 x max96717f + stvg5661 (tunnel mode)
> With special lanes mapping and polarities.
> 
> And I had to:
> 
> - Apply pending patches for j721e to support the enable_stream API instead of s_stream
> - Enable the experimental v4l2_subdev_enable_streams_api
> - Add get_frame_desc to the sensor driver

Did it work without issues with those changes?

If that's the case then I think all I can do to make it is easier is to
add default routing. I'm not a fan of each driver having its own
get_frame_desc() fallback, especially when it's a very small change to
do to the sensor drivers.


