Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BD2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B98WlgviCORS8xNE8tp9wUkQXa0yNmModNYUMBxdlg=; b=hw6fSKcc7RUNaBrr8UGXBQAcEV
	i3BJ8WusTCTBKbCvjy2xkktRg0DAGAA11jBHFQPZhXVwcPEDmqB9wHlTs/8kxN8NdTeLaeSh0X7Hl
	nrecaWIQx7XtPS4D05aHEv4c756yaAtYr2p/2NOGbCIuo7kff+4IrZrGBNCKrYmDyNcPVQ3+jU3pm
	6cUTZir/BVQ6EanHVYttXmliBuuc4G2h6Feg15AmTmbLVaDFEiRBzOGwDB/V1ph4X9j6pXZfpsREf
	mmmX3EHIC62r28YtBpx43PDITpPMRQbaJ5axfZRzxKcDWzdIyCE/sKj4BBCfqZo96CHJ6r4Fxs9S4
	//Xd7AUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnK1o-00000004UKj-2eFO;
	Wed, 26 Feb 2025 16:12:56 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJz6-00000004Tpj-2UZ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:10:11 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2bcdf5ea8faso8006fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740586207; x=1741191007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8B98WlgviCORS8xNE8tp9wUkQXa0yNmModNYUMBxdlg=;
        b=v+UQwdKaqQeUtmpS1oTImumlzD4fFvSPwZO4gVBsuHOl92WNHCE5/k+arrnF+/DHGS
         RHzFdnl4HewocuiJP0JXXuQ2/YA5jVQCaTmqE94OTuC4fezcPKaYJj51oJOTvBwobHL2
         MrTQk01J9uwyGII2SBIxBes1csmF905BvnyMG9VX+eygW5LTPBcmCAOQ5mzWjEXBNDSy
         YlbW0Awryg3owO2yJ7xlFshSQ08n1DpPIWmxY8oFlaFKXBBzJLSG1eaAJ0todIU72QHd
         6bGMM7V4ec4XOnQILAtLS6iRmEQDhKmPd7A2nu/ClCVHfnpmIBv+ji8Ul1e9MJNp7Pd8
         1tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586207; x=1741191007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8B98WlgviCORS8xNE8tp9wUkQXa0yNmModNYUMBxdlg=;
        b=i5Art/CSLlf/7dK+AhuhDigF1RaXIfk1lIvIc1HO80wLQiV+LvtaFWrGzDUqkozrgp
         tR9VIS5hH0c9HqjxvgVyEpmIQXYAuyQpjQ6YauYqolNEW3QB49rVGMiYGKUkAETnIZ1f
         kytx5W7O7vSc26CBvueG/OLbKEmhD6PaLfgjDricqWjMFpyciIrlTHmwzg2LgK58Bkd8
         jdxVQ5tDAAvGaT7jQvYBd/sxRY0rlflkqJREvUHQeGN6+vY+XGyxZOyeDfdHD0bfV3BC
         kOVYzrY6ZN2O6+lRywUBIxGfOa5vAF5oDW2O6KQhsmxJpey5M4FwLGsifb3NNQnwx/hT
         Ctqw==
X-Forwarded-Encrypted: i=1; AJvYcCV+SY6c0GPXGHSDW68r5W9TePsn0j34hqien9x+QQkyB2a8xK+dWNPL19FvIr9LEzi474jvCn+mbWo73ArZSCUu@lists.infradead.org
X-Gm-Message-State: AOJu0YyIK/B9ATHnhwrkQXwuLoBZhWBAQkwRSvcUKaihZJkXYVH1k2+H
	dMC2uQKZEyW847Al/cB5y2I9cwmBVpFtLkcwZ9S1BkPmir6XZvIOrxjbAxRrQC4=
X-Gm-Gg: ASbGncvtFcCbEMPIPVcnkipp74YM2nNDuzKo7qJYxCYlhm/VkGTWUuv2WydgfcLzw8i
	5IKHVayageX7GYMQ0fbE43OKaG9hvLQ5YeM1Ede7u+opLGwozFUjxtAJo8P5YOHhr1scFedMZIV
	5mnQb38QDh7niTEUaJ6Fo8F8KacHBI2ZgWq0jogL90S4lNqCF+hwlkqyoDRpc7yGyFH+0gUPDo9
	kPIAMf1CsVOaDAt4F6nlE8ep6G0Kc3Fl7RXbC/tVlk65W3z5L/a4whsbwRX9NB99SMFMiG/aFRq
	wBqXJUCwTtzQo97g3fP7sRn93Y5Qw+9CbBQ4Oh2F7mspUSq4/lo9n0zQCry2yD0=
X-Google-Smtp-Source: AGHT+IEOYib871oGajJ0tAwCyUvFn0Ok9l/YPouvQLougV8cmfpAu3KKTSDRFWXcP1FZvlfxqquzJA==
X-Received: by 2002:a05:6871:7c02:b0:29e:3c8d:61a0 with SMTP id 586e51a60fabf-2bd514ef349mr14836245fac.8.1740586207211;
        Wed, 26 Feb 2025 08:10:07 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289df559edsm745510a34.62.2025.02.26.08.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:10:06 -0800 (PST)
Message-ID: <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
Date: Wed, 26 Feb 2025 10:10:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
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
 <23f5ee3e3bf7179930d66c720d5c4c33cdbe8366.1740421248.git.mazziesaccount@gmail.com>
 <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
 <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_081008_887074_F3ED9FEE 
X-CRM114-Status: GOOD (  36.16  )
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

On 2/26/25 12:28 AM, Matti Vaittinen wrote:
> Hi David,
> 
> Thanks for taking a look at this :)
> 
> On 26/02/2025 02:26, David Lechner wrote:
>> On 2/24/25 12:33 PM, Matti Vaittinen wrote:
>>> There are ADC ICs which may have some of the AIN pins usable for other
>>> functions. These ICs may have some of the AIN pins wired so that they
>>> should not be used for ADC.
>>>
>>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>>> add corresponding channels@N nodes in the device tree as described in
>>> the ADC binding yaml.
>>
>> I think "preferred?" is the key question here. Currently, it is assumed
>> that basically all IIO bindings have channels implicitly even if the
>> binding doesn't call them out. It just means that there is nothing
>> special about the channel that needs to be documented, but the channel
>> is still there.
> 
> I think this works well with the ADCs which have no other purpose for the pins but the ADC. The BD79124 (and some others) do allow muxing the ADC input pins for other purposes. There the DT bindings with nothing but the "reg" are relevant, and channels can't be trusted to just be there without those..

Makes sense.

> 
>> Similarly, on several drivers we added recently that make use of adc.yaml
>> (adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
>> if a channel was wired in the default configuration, then you would just
>> omit the channel node for that input pin. Therefore, this helper couldn't
>> be used by these drivers since we always have a fixed number of channels
>> used in the driver regardless of if there are explicit channel nodes in
>> the devicetree or not.
> 
> I think this works with the ICs where channels, indeed, always are there. But this is not the case with _all_ ICs. And in order to keep the consistency I'd actually required that if channels are listed in the DT, then _all_ the channels must be listed. Else it becomes less straightforward for people to understand how many channels there are based on the device tree. I believe this was also proposed by Jonathan during the v1 review:
> 
>> > Hmm. That'd mean the ADC channels _must_ be defined in DT in order to be
>> > usable(?) Well, if this is the usual way, then it should be well known
>> > by users. Thanks.
>>
>> Yes. We basically have two types of binding wrt to channels.
>> 1) Always there - no explicit binding, but also no way to describe
>>    anything specific about the channels.
>> 2) Subnode per channel with stuff from adc.yaml and anything device
>>    specific.  Only channels that that have a node are enabled.
>>

Hmm... does that mean we implemented it wrong on ad7380 and ad4695?

>> There are a few drivers that for historical reasons support both
>> options with 'no channels' meaning 'all channels'.
> 
> https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/
> 
>> In my experience, the only time we don't populate all available channels
>> on an ADC, even if not used, is in cases like differential chips where
>> any two inputs can be mixed and matched to form a channel. Some of these,
>> like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
>> include all possible channels. In those cases, we make an exception and
>> use a dynamic number of channels based on the devicetree. But for chips
>> that have less than 20 total possible channels or so we've always
>> provided all possible channels to userspace. It makes writing userspace
>> software for a specific chip easier if we can always assume that chip
>> has the same number of channels.
> 
> In any exception to this rule of describing all channels in DT should just avoid using these helpers and do things as they're done now. No one is forced to use them. But I am not really sure why would you not describe all the channels in the device-tree for ICs with less than 20 channels? I'd assume that if the channels are unconditionally usable in the hardware, then they should be in DT as well(?)

I devicetree, I think the tendency is to be less verbose and only add
properties/nodes when there is something that is not the usual case.
Default values are chosen to be the most usual case so we don't have
to write so much in the .dts.

> 
>>> Add couple of helper functions which can be used to retrieve the channel
>>> information from the device node.
>>>
>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>
> 
> Yours,
>     -- Matti


