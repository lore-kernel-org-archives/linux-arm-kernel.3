Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A973BC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtUYvUWC1AkG8jyAiGXYjz4SHzVwMltIbWsY/nE9gH4=; b=WQEytHCJRlrkm6vuR+PDHsIK/y
	f9ApW/o1Z46wQykRXsD2P8bl49OqKSoOZ28lmSU+Ul3mOy7gAOqHdiSfs5FWVi71cwOLiyjmLApeG
	zyxyHF+fqin5dnsC8qZPzA3C94vg17wQH9ipWfbJSK8Yx8EskSE/5bbJH0zWxuGbvDzzo2hm8Pwt/
	MqlvNkf1kU7jW+o3YKrjCi9j+AK/qqSYHv5nCDBBNPadGxq4qYN6qDdgxtKU2XfGMnHvIY42Wzoep
	h/GMLi7mBFPepeg09jXtWapPGQN6ef350Cid3L4s2L2Sz64aGc5DxfPvDgy7QAuJJwsoDIDZL8rAV
	E11t1CHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYdm-00000006atj-3D1F;
	Thu, 27 Feb 2025 07:49:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYay-00000006aWE-1rx9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 07:46:13 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5439a6179a7so781477e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 23:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740642370; x=1741247170; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtUYvUWC1AkG8jyAiGXYjz4SHzVwMltIbWsY/nE9gH4=;
        b=Wx7ZTZM/z8rEpfryOPsiVa2lTeh7zx2f55m1DP/Wmhk73B6nCHM8EmJAAzK9sB45Nh
         J0ieyzx3EMkB35rX5RugrN/hqv1AkYXJOABE7XGlTJCG/6xf4Wo62r90o9lRCBbrBW5/
         kj+GaL4mjZW8G66ZfiHWPEOcI1oEKQ7g3jK00v65Jzu0B7muG0nz4sLnn3PWGdpH9lho
         4ntzveGs1zYjibV6fg9YDmPb85cJev8O8vnDAfwoFQa13uDW8my3teiisS1vS5y3Qv7r
         UBy00BClMJtbcE7guuqRlGqeQhRZ1IpuknJ1bVWkHS0N2rx7mCRHUKmFS/yLKMposuZ4
         /YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642370; x=1741247170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtUYvUWC1AkG8jyAiGXYjz4SHzVwMltIbWsY/nE9gH4=;
        b=jOY2iqkNz0sxfpdI++Z8G/XXiWiD81aa3yMgbkc8mxMdwnjvMWSJIMHd/POQJ6JkAG
         9ZjN0naCmqsI0Rqng2f364SMdocu4L5POg4Ne0Qxuecbf9iZFYKNxOOxiT6UvF6XTZwV
         LVy7FhlYup15mT9sOi2K5X+iM3y7HiTC8lOPAfQi0/ZRBR+H9mPP+Q0bnKk5ZGzgapua
         gCnWcA4M7LpvtVuhg4+xeho2qDWUyAJdmDMM/McTZxbCwUkkEhTFQZH0i4NUTogUPVoU
         PcGMgfqEJxhrne3EK4BVqjVs6PAgU2Ui5mwQV7jQRMijys9O+44uEmFizRgwODWonUY8
         FQHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsyE8nkXYxzIyRHMdMnbXGAViF/Sfc61TLOvDj/pjbdGbWNKezNu6giZO7e2Y+sBYz/Kl6SHTbjXFXLqW5dZEF@lists.infradead.org
X-Gm-Message-State: AOJu0YxZVbrI4iUMJX0aWdkCHnMeaXB5RXApODjxDzIan9QNUF4kdaE5
	0sOQtpAdAGMot+ecsx8UfBmLQ3XDauu9u1nFs5Bt0GzfXmwN72CV
X-Gm-Gg: ASbGncsy2n6IXJdOvOxwQHfS15OnQg+R0A+aQw7sf120gL8mBaSjgGJKjkNqMrhQJCo
	Bv15bOrb50RwDFXf2hHhpoyYaIQy819ul7tskY9Q3EWJXKzV+IEHV1J8I8s98Vab9NFyKkv/3ZA
	LoPtDxoClul6LxjkrkQlg7aohWtef+wS4qyly1nf87uGi/jPA/EqTemOHii+O8xFZ7w7aDm391E
	1wW4vQI8iMScN3q2s/w5LCeQ3OpoNed2rDr332Bueq2N6ytCOm1+ErK4xm//riET0wyYEcTlZs6
	qTej96e0tX7kzIMihsjFnPiDhBZXnMa7u7ODKI/UQ8OxO/Jj5xPUQd1kz1BTPnZ0gocaF+B+MgI
	lfqDU90A=
X-Google-Smtp-Source: AGHT+IFFyAsXsY4HRaIHHuW3BNl5wcOAhXKEwTKsY23Y5b/QvWafl4HHhRh6kgPntviPRCAyMbQxbQ==
X-Received: by 2002:a05:6512:1093:b0:545:2bc5:e27f with SMTP id 2adb3069b0e04-549432de182mr953232e87.12.1740642369865;
        Wed, 26 Feb 2025 23:46:09 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1143sm93497e87.116.2025.02.26.23.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 23:46:09 -0800 (PST)
Message-ID: <9180ff11-888b-453d-9617-4b3a0fb38d91@gmail.com>
Date: Thu, 27 Feb 2025 09:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] iio: adc: add helpers for parsing ADC nodes
To: David Lechner <dlechner@baylibre.com>,
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
 <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_234612_518671_A23B3A7E 
X-CRM114-Status: GOOD (  31.93  )
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

On 26/02/2025 18:10, David Lechner wrote:
> On 2/26/25 12:28 AM, Matti Vaittinen wrote:
>> Hi David,
>>
>> Thanks for taking a look at this :)
>>
>> On 26/02/2025 02:26, David Lechner wrote:
>>> On 2/24/25 12:33 PM, Matti Vaittinen wrote:

...

>>
>>> Similarly, on several drivers we added recently that make use of adc.yaml
>>> (adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
>>> if a channel was wired in the default configuration, then you would just
>>> omit the channel node for that input pin. Therefore, this helper couldn't
>>> be used by these drivers since we always have a fixed number of channels
>>> used in the driver regardless of if there are explicit channel nodes in
>>> the devicetree or not.
>>
>> I think this works with the ICs where channels, indeed, always are there. But this is not the case with _all_ ICs. And in order to keep the consistency I'd actually required that if channels are listed in the DT, then _all_ the channels must be listed. Else it becomes less straightforward for people to understand how many channels there are based on the device tree. I believe this was also proposed by Jonathan during the v1 review:
>>
>>>> Hmm. That'd mean the ADC channels _must_ be defined in DT in order to be
>>>> usable(?) Well, if this is the usual way, then it should be well known
>>>> by users. Thanks.
>>>
>>> Yes. We basically have two types of binding wrt to channels.
>>> 1) Always there - no explicit binding, but also no way to describe
>>>      anything specific about the channels.
>>> 2) Subnode per channel with stuff from adc.yaml and anything device
>>>      specific.  Only channels that that have a node are enabled.
>>>
> 
> Hmm... does that mean we implemented it wrong on ad7380 and ad4695?

I believe this is a question to Jonathan. With my ADC-driver experience 
I am not the person to answer this :)

_If_ I commented something to this, I would say that: "I believe, this 
question is a good example of why providing helpers is so powerful. In 
my experience, when we provide helpers, then there will be a 'de facto' 
way of doing things, which improves consistency". But as I feel I'm on 
the verge of stepping on someones toes (and I am really the novice on 
this area), I won't say that comment out loud.

>>> There are a few drivers that for historical reasons support both
>>> options with 'no channels' meaning 'all channels'.
>>
>> https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/
>>
>>> In my experience, the only time we don't populate all available channels
>>> on an ADC, even if not used, is in cases like differential chips where
>>> any two inputs can be mixed and matched to form a channel. Some of these,
>>> like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
>>> include all possible channels. In those cases, we make an exception and
>>> use a dynamic number of channels based on the devicetree. But for chips
>>> that have less than 20 total possible channels or so we've always
>>> provided all possible channels to userspace. It makes writing userspace
>>> software for a specific chip easier if we can always assume that chip
>>> has the same number of channels.
>>
>> In any exception to this rule of describing all channels in DT should just avoid using these helpers and do things as they're done now. No one is forced to use them. But I am not really sure why would you not describe all the channels in the device-tree for ICs with less than 20 channels? I'd assume that if the channels are unconditionally usable in the hardware, then they should be in DT as well(?)
> 
> I devicetree, I think the tendency is to be less verbose and only add
> properties/nodes when there is something that is not the usual case.
> Default values are chosen to be the most usual case so we don't have
> to write so much in the .dts.

On the other hand, I've received comments from the DTS people to expose 
all HW blocks in the bindings. AFAIR, for example, marking 
power-supplies as 'optional' in bindings is frowned upon, because they 
are in the HW whether the SW needs to control them or not. Hence I think 
marking either all or no channels in dt should be the way to go - but my 
thinking is not done based on the years of experience on ADCs!

>>>> Add couple of helper functions which can be used to retrieve the channel
>>>> information from the device node.
>>>>
>>>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>>>
>>
>> Yours,
>>      -- Matti
> 


