Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733BBC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IstkuYPp0cvmrCBS1AO74kpqX9/bPmaEIwBW2fMXgJ4=; b=t/RRb/eHdEn5u6jWxGidt71im+
	Lc5khPGVPMi9tBB47IEfKKhVreD2Xv7yFzxW6ZMiK3XMDyS823aWbPvtTJ/aak6YdiJUKbO8ZLlrv
	IU9zswDDVD9gELTv/KoKJAG2H+arsrV9ZVdWs0CrljQyqqAVyKYuGnOSApdlBCIsUlwBXjAEAK9tb
	H2u+3VxGJ3V5LwkoTDMRKUefXiBGutywnYqIxrzP2fZQvFU7gZBWS8Si7j/ZxT7V4wZ8Pjhwpb0vZ
	umXBJEVKDdJjHM+VKIFwMhA59dIcnz9e8a55p5SlRGYQsS5k/lP6SFo8mLcyo3AFHdlcYlA2zSxU6
	9u+QEHNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB6C-00000002ZDa-2a3R;
	Wed, 26 Feb 2025 06:40:52 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnB4e-00000002Yrd-2ae3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:39:17 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30615661f98so61863571fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 22:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740551955; x=1741156755; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IstkuYPp0cvmrCBS1AO74kpqX9/bPmaEIwBW2fMXgJ4=;
        b=X2rrWb6nRAf1T1xpE8x16BiSBCYtlTycbhq0Zj8x/5NBwiYC3I4JyeCTjUZyK2axWk
         DnxqzrAhAcip1+rFPzoz3WhPxNXw5u6eD38tnTmy8H2aYBJHNwnrNhHWfm8ggGZKiO92
         LPKX8hxTW5RVISWaDX6f4681IcDxQ5KfRzUFi19CSwUfiRdBMn48WDQdn6TkVLS0vIQ0
         OhFJld4zIkgCwzHbr5E91z1LpS65EtZPFOqoyBMWb3Biblk5B/kC9UWcgOAUV5iTd4VX
         52O8Ees9p48giRlwYMpV9VJCnm+SXVhqCTyMPy+aYT26Ne1xdJ0vYSJ1QtUWFBLGisl7
         UMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551955; x=1741156755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IstkuYPp0cvmrCBS1AO74kpqX9/bPmaEIwBW2fMXgJ4=;
        b=NcY3VINYDkRXp2WAY5mzrDXQ4Ns0nvb/1am+fwWMzD5XHLXJmpSmCNRQbNVhaDnmzp
         dB4jat5ZgtmZ5oxTLdA9E42W7HJ9ESBgp3CdcuysQmrAArwurmmH9EeJqf6XKp0qARbD
         XI6Mi/wAQDIqm6MR1tTC72HjRXO0vSq4DtQDAlacjcO+yaRNyTaJcdbe9W50wr9nHQvs
         HfiuSOnxBkkOacl+Ju1rmpXraQeBuVlGglUaoQNN3ZbBi308Q49K7dbz6SB19C7TiUOl
         /fnRzYGF/BAtD9rxKTrU7o7nOWod6IiyN8J/FD1tTpGkRURteOIMajyyeTkSO2KbU3HD
         68ug==
X-Forwarded-Encrypted: i=1; AJvYcCW4il/weW4MJi3Qxet9rr0kiu6/FV2WOo1oqNr2IwsUQIVzt+p4N56H7DDfUaA928mT5ATHSzyHiFS/7zBCmamx@lists.infradead.org
X-Gm-Message-State: AOJu0YyulnjOVVDXykW+P2D9/aieKj3I2aACdNbHkqOXpShk0SzBf4Ds
	6HjP3tfTSc45eWe1aMa5u3372bAWs0k9+THCGOa58H3yzqNGk3it
X-Gm-Gg: ASbGnct7zRi+YHmtWdi15lvWBV4vzU7yxbDvAlN2I7T/4bIKcVGqB40Y7p8yFUS1TAn
	95WjUIFjE1G1AahTjAgeUYrEJAUZvb9mibu1bgd6ZY+y6/hT5FFCB3jb/F+NhMpMb7bcP6qoeAO
	8YzwZffQTzgRle2yDmXjBR98hfM4sIKFEICynLX1xNXN++eGo9dvaD1Q7lWAFxe3PsF/C3Iv/zi
	zHREFmFZcIfCJJJqcwy9Hbua/RJkV7TNLXI+oZAbXNW3USnS+3wuEsatU/SZ9gXR7ZVoOf95b7N
	Ktjcotvw+/NvqlWs+vmCIBm1gVcp44Lms8PFpQObuyOdw451aqvofSZZtjCIchSEtQ7QzeW5jU2
	5lZvA3YQ=
X-Google-Smtp-Source: AGHT+IFhddv2BVjLa64XQJMIkv5m8GKYZ1reuiVfZ9tztojl8c9MwGp7Re17nRul5qHTHrRj15T3+g==
X-Received: by 2002:a2e:968c:0:b0:308:eb34:103a with SMTP id 38308e7fff4ca-30a80c97fdfmr38366891fa.28.1740551954311;
        Tue, 25 Feb 2025 22:39:14 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ac4873sm4197931fa.79.2025.02.25.22.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 22:39:13 -0800 (PST)
Message-ID: <d391b012-0a8e-40ca-af56-ca73b3fd853b@gmail.com>
Date: Wed, 26 Feb 2025 08:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree config
To: David Lechner <dlechner@baylibre.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_223916_677619_7A7D1070 
X-CRM114-Status: GOOD (  29.14  )
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

On 26/02/2025 02:09, David Lechner wrote:
> On 2/24/25 12:34 PM, Matti Vaittinen wrote:
>> The ti-ads7924 driver ignores the device-tree ADC channel specification
>> and always exposes all 4 channels to users whether they are present in
>> the device-tree or not. Additionally, the "reg" values in the channel
>> nodes are ignored, although an error is printed if they are out of range.
>>
>> Register only the channels described in the device-tree, and use the reg
>> property as a channel ID.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Revision history:
>> v3 => v4:
>>   - Adapt to 'drop diff-channel support' changes to ADC-helpers
>>   - select ADC helpers in the Kconfig
>> v2 => v3: New patch
>>
>> Please note that this is potentially breaking existing users if they
>> have wrong values in the device-tree. I believe the device-tree should
>> ideally be respected, and if it says device X has only one channel, then
>> we should believe it and not register 4. Well, we don't live in the
>> ideal world, so even though I believe this is TheRightThingToDo - it may
>> cause havoc because correct device-tree has not been required from the
>> day 1. So, please review and test and apply at your own risk :)
> 
> The DT bindings on this one are a little weird. Usually, if we don't
> use any extra properties from adc.yaml, we leave out the channels. In
> this case it does seem kind of like the original intention was to work
> like you are suggesting, but hard to say since the driver wasn't actually
> implemented that way. I would be more inclined to actually not make the
> breaking change here and instead relax the bindings to make channel nodes
> optional and just have the driver ignore the channel nodes by dropping
> the ads7924_get_channels_config() function completely. This would make
> the driver simpler instead of more complex like this patch does.

I have no strong opinion on this. I see this driver says 'Supported' in 
MAINTAINERS. Maybe Hugo is able to provide some insight?

>> As a side note, this might warrant a fixes tag but the adc-helper -stuff
>> is hardly worth to be backported... (And I've already exceeded my time
>> budget with this series - hence I'll leave crafting backportable fix to
>> TI people ;) )
>>
>> This has only been compile tested! All testing is highly appreciated.
>> ---
> 
> ...
> 
>> -static int ads7924_get_channels_config(struct device *dev)
>> +static int ads7924_get_channels_config(struct iio_dev *indio_dev,
>> +				       struct device *dev)
> 
> Could get dev from indio_dev->dev.parent and keep only one parameter
> to this function.
> 
>>   {
>> -	struct fwnode_handle *node;
>> -	int num_channels = 0;
>> +	struct iio_chan_spec *chan_array;
>> +	int num_channels = 0, i;
> 
> Don't need initialization here.
> 
>> +	static const char * const datasheet_names[] = {
>> +		"AIN0", "AIN1", "AIN2", "AIN3"
>> +	};

Thanks for the review David! I do agree with the comments to the code.

Yours,
	-- Matti



