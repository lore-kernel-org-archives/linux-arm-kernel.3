Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BD1C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG5tOje/zlA/EkhYa4q9r5CoNV0SFPoKRvJ7r+JyzFY=; b=VP3bvPutP94HviXUXVB2seUoM1
	0oCgFR9pOeiObXssuI+A4At3VSyzeXc8W35BDYaJ6LyvgQiBUYTfscytUBM+GaLuMhq4hshTsl54E
	1jmXn5fY/NBtVNCdUb5qqKmu98lBN5bujavv7af0CmMhchNUi8DrunuKI2YhGnPFjuZlOfv0ZwjBq
	Xev4lsNM9hkF0d16PxR3VEyeFUSu2ZjyqWUQWIkN+4V7PuZzzPmsyBTtGsARC1RfXQ3Kw3vdjJioe
	KQTL7XVFF4DhVX/BxC7wjQdgu6aJs+6bk4bPEZacyuKJcDRPb697bBl+Z+rBtFogyKN6P8JwsdeIC
	1zjqkO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toj6m-0000000G2Ud-0PPf;
	Sun, 02 Mar 2025 13:11:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toj5E-0000000G2MN-1tmU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:10:17 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-549681574e0so167493e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740921014; x=1741525814; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jG5tOje/zlA/EkhYa4q9r5CoNV0SFPoKRvJ7r+JyzFY=;
        b=QFClEcy6AeeRLLBqPQPvUkGxOgY/j9Mz3yEf6Vy9NBconuW3dsNtl9Bmd5Qsp8YmbV
         UPdVNt/s48UEJs80OW2BY+tLf1RbyqiErXHt4tFCzDUI4fqFBXlf+Hg+IDuqGvRo3c97
         8ohOVIsS/PfPtOzhaecrhZS3ebjyW7/nMwssRjtykb6kjWy8pE9jPxqPgP6636avtU8L
         F5hjzEL8FKs6XXlIZug+I6TNgciqpmFzRK+DLD/RGmVTiKFsWFLPwoF+czgonrQ45WMa
         0iOIjYkNZmKK9/SErTXQ5ApyAxlbloIPb8lGQyn4dXuDb902e7Ztb+GBh63mUmb0qY2B
         lqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740921015; x=1741525815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jG5tOje/zlA/EkhYa4q9r5CoNV0SFPoKRvJ7r+JyzFY=;
        b=tVqPb9nJTOHQtftjboC4tgNGOLCPik2jDiWVCO9FUsPJkCNdcNTLzVVI0g8i0mxfGu
         adh56z57ebTtZt4RK0Nz5K06SefnEUuX45nlGDPLxXfvxDLCCTYy+musJYaiR++e6ves
         aZbcEK+v96hioIgz9MTQJafy+zHqgvMUw3dHNhX2cgcnCLvaqCQb0lWNEjigrWNLkJYz
         7Gkc/zQI8FEi5dZyoil0OtpD28Mpqb3nHe5tIP0DYPtjtKhklT/0xZkHGFLcc393M/8b
         /8/7hZ+j74PtC9yDZKb2vQj7lJc02cQoUAZwP5NC+tr6sfTzZYsgQDGqzu4J3C0TnGVr
         VzmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg934s9jx9egs5FrtnJOVz4P1V86dfF5eurL9N1cPMdknUxPZ20CjpUqVbTZp+1I1s4AopvPxIjENq3ihWUPzG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt7LSZ4OYzy41tpPI/lXmx+yjkFBYaMeV9Q6xQZSCRUyPJXLdG
	v4EejAunjU8ewgkpN4+hTyh2Au38JTU+ZMyL1E85crKOEyrRW+J9
X-Gm-Gg: ASbGncuV5LYW5YkWx3U8zYTKJyRMdj5qy33lxj0RAsU5CxIelSBES2ZqkCxWKfFnqfu
	uyVSYp8EmfPwHlJ4GFYuYjLm3QnMOuxmsXi3O/b7rWvCdJQmytJZbaz/IYw5mtxKRyhi9O9CRFg
	SNHMhR1lmVW+MIlOUES68atAfUm2us+qltFx2qUauq5h3JCT2qnhczA+pkkp0XtG5teBKzWQDz6
	1AxZc/Z5feOqIXN9iCdBRM0Da10CnLk9PVlBtV5+zh8e/RArEvNjKsHrZnrGSyYIODlu/8HZnW+
	ivpthaBTod2fUaaJ6NsBaObaa8HxrjXio6QscwCsc4sj4oTBKBifma8y8FhU2LIRletWg+a27If
	ijY+xS2CdPj8Od8DjX1jLt3Xdlg==
X-Google-Smtp-Source: AGHT+IEGL2GOx+6uK3ORwgW8vnlHYwV9+sg7r6kI4MAFfSmBYTvXGphMqMVaTf+mMGOgpFgDCZ0DhQ==
X-Received: by 2002:a05:6512:3b83:b0:545:ae6:d740 with SMTP id 2adb3069b0e04-5494c350911mr3777634e87.41.1740921014388;
        Sun, 02 Mar 2025 05:10:14 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495fbe4daesm229117e87.100.2025.03.02.05.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:10:13 -0800 (PST)
Message-ID: <7c79ce3a-0dc4-4aa4-941a-e05be9a34fb8@gmail.com>
Date: Sun, 2 Mar 2025 15:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree config
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
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
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
 <f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
 <d391b012-0a8e-40ca-af56-ca73b3fd853b@gmail.com>
 <20250302032713.1c834448@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302032713.1c834448@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_051016_517595_6C99B0AF 
X-CRM114-Status: GOOD (  19.92  )
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

On 02/03/2025 05:27, Jonathan Cameron wrote:
> On Wed, 26 Feb 2025 08:39:11 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> On 26/02/2025 02:09, David Lechner wrote:
>>> On 2/24/25 12:34 PM, Matti Vaittinen wrote:
>>>> The ti-ads7924 driver ignores the device-tree ADC channel specification
>>>> and always exposes all 4 channels to users whether they are present in
>>>> the device-tree or not. Additionally, the "reg" values in the channel
>>>> nodes are ignored, although an error is printed if they are out of range.
>>>>
>>>> Register only the channels described in the device-tree, and use the reg
>>>> property as a channel ID.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>>
>>>> ---
>>>> Revision history:
>>>> v3 => v4:
>>>>    - Adapt to 'drop diff-channel support' changes to ADC-helpers
>>>>    - select ADC helpers in the Kconfig
>>>> v2 => v3: New patch
>>>>
>>>> Please note that this is potentially breaking existing users if they
>>>> have wrong values in the device-tree. I believe the device-tree should
>>>> ideally be respected, and if it says device X has only one channel, then
>>>> we should believe it and not register 4. Well, we don't live in the
>>>> ideal world, so even though I believe this is TheRightThingToDo - it may
>>>> cause havoc because correct device-tree has not been required from the
>>>> day 1. So, please review and test and apply at your own risk :)
>>>
>>> The DT bindings on this one are a little weird. Usually, if we don't
>>> use any extra properties from adc.yaml, we leave out the channels. In
>>> this case it does seem kind of like the original intention was to work
>>> like you are suggesting, but hard to say since the driver wasn't actually
>>> implemented that way. I would be more inclined to actually not make the
>>> breaking change here and instead relax the bindings to make channel nodes
>>> optional and just have the driver ignore the channel nodes by dropping
>>> the ads7924_get_channels_config() function completely. This would make
>>> the driver simpler instead of more complex like this patch does.
>>
>> I have no strong opinion on this. I see this driver says 'Supported' in
>> MAINTAINERS. Maybe Hugo is able to provide some insight?
>>
> This seems to be ABI breakage.  Never something we can take if there is
> a significant chance of anyone noticing.  Here it looks like risk
> is too high.

Ok. I'll just drop this patch then. Thanks David & Jonathan :)

Yours,
	-- Matti

