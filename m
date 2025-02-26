Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F74C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpCHqbGuoQ5BJqZTNRzllttmReMvT/yiMaLd2lRv7bo=; b=niIC58Nw2uS+TZJzTv7MKX48CN
	L1lFox0XFZUtmEoW+Yrzv3SWRU8yJLYWeeBxX8nR8+DzJ727S31WMYDw3AVYUpm+j2NPS3fguKUbB
	MxYvvFiUXdp/cFtqot8DDF6LEyMatvU5B9NQCNHm3P6U7HVxSz9bVo25eHX4k74Hqhhsh8Txu+EmE
	j9y+e4JLTlZWYsaSZWDseAClZj6ptWFQdlEUkvJqNuEXBH49A5/dIWK0HqhjtMzx2U+q+dGMPD6dE
	ioKhzmwoDEOFF8f1CYGV/VMMjRab3C0jZEdQnHtkaYGCGcgQllkes6bZYIqxvkh4DtzLmJFCNpmGu
	ARO7YqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAvv-00000002WxP-2znn;
	Wed, 26 Feb 2025 06:30:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAuO-00000002WpY-0Vup
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:28:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5485646441cso1549741e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740551318; x=1741156118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpCHqbGuoQ5BJqZTNRzllttmReMvT/yiMaLd2lRv7bo=;
        b=S1Sp1kSdr09Xrj4BRQv7MZRGf9Mpi94asuqQ8uQGUdn6xNVti53on8ahba931yHfpc
         8sOCItCsY7m+PU3+OCFfUPy4XJDo/nFtAhdtBRaoAm5p/spVRcz1iNzVM8Rh39qh9dnL
         ByiMZszvADkjwzAgKBjxgfIS6Ov/n7595wQ/YaC54WPDU1zxC2YzFQhZVuIWjQvg8Vta
         wBm9fv9hrP+XrEu3XzY1pFOfnqEPXnfYWA8wuFKcoQH6EJplw+/sO6KNq2hNNwENIVAN
         6dZtRHlEBIiMe7ht/5N1zuW7nP6/DZvqbo5XK9pgAVufmqQU+bzDn+sT7v46EaIM1CPD
         Iwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551318; x=1741156118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpCHqbGuoQ5BJqZTNRzllttmReMvT/yiMaLd2lRv7bo=;
        b=HMOyslyP9iYJFzp0M/m8QZstM1bM/WnAyt8948olaYgOPCernkq911lzOaQjOc+wtB
         XRiUIhO2rxkYinUkbD3J3jFtElW1C1KMGDXx9lHYuXIU/wVTEHjmMUDLiBjVJPOuAiJR
         cXGSgr5OgKuYGbAcRMhvJBpUFZp0+qWPUyiU/E/pJL7wbZpw6Mhg+QS4VW3XyXMEDZ/0
         H13uQ3+RetajKJeK92gBpuH20trVHKLZ+W4eq+cXjZooYcC7vH5cXgyG9VEnVocasKvK
         oDhLFmA5AS2yYn7kC+4Hv1zB3VhXscVs/iOU/dTF7nm0jR/KQEk4yTfiU/mkjA6/eXkB
         1PUg==
X-Forwarded-Encrypted: i=1; AJvYcCVFw93nT2mVh4WUAq5zquLVg38uLUXu3AHTlwaM6jHK+zKiIJFln05PNpbK2UchDKNe6yRUUdWgnhnjer+iYebB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7EZa/KdOq0eDRTyicZjtl8UzIXzP++cSKOvjVxZDiLm2FY/Vp
	pXdP6CVjQqoOJYJeK0Gu4WnaHMOSKSBCS6QGdhqEra8PoInO9Kaub/LkFQ==
X-Gm-Gg: ASbGncusgSAZM1cDqM26D7Xky2O/3heudVazI3FQZmURDNgqw2kNgV871/XjF2fjg7L
	GXv0NJkThxSRy1YhLFPGrI8S1kLyx+4iktQ3OXxIEcUTEuBGeI9E0pGMqIwPqrXmjXy2+wJ6HCc
	TqYyJtvXtLmaCIbMccscPxshY5TUdjmqyJ3xi2+UD20epYSjaXGSkDpGhJ+3COyaX7N/WzxLUTG
	vihZHkmJSmRJhGHZKpg4ffgwprk1K8qr5PLFcvbC9ZCixNo+V+ZQoFHyBlyzn9rlS3v5dV5pYlR
	rxv+RqmZtscqM17iDtNgnyuRMl0JaHy6Rzb6Qo25bLerBSHTECjuhmaS4r6qw8s+tlUUyZpiG0+
	cCLd+6mI=
X-Google-Smtp-Source: AGHT+IFZty/ud0vv7fnUaxvQy7Ed1PaMJjnJwRZzX9uN4JbCQgsINREjjhWVQBBguASQBVPYxKCBhw==
X-Received: by 2002:a05:6512:104e:b0:545:e2e:8425 with SMTP id 2adb3069b0e04-548510ecfa1mr4349214e87.39.1740551317973;
        Tue, 25 Feb 2025 22:28:37 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efaccsm356242e87.155.2025.02.25.22.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 22:28:37 -0800 (PST)
Message-ID: <1b308a10-9622-47f9-b489-bd969fbdfc34@gmail.com>
Date: Wed, 26 Feb 2025 08:28:34 +0200
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
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <0de7b0ac-eca5-49ba-b1b3-f249655f3646@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_222840_169656_45AAFBF8 
X-CRM114-Status: GOOD (  38.05  )
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

Hi David,

Thanks for taking a look at this :)

On 26/02/2025 02:26, David Lechner wrote:
> On 2/24/25 12:33 PM, Matti Vaittinen wrote:
>> There are ADC ICs which may have some of the AIN pins usable for other
>> functions. These ICs may have some of the AIN pins wired so that they
>> should not be used for ADC.
>>
>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>> add corresponding channels@N nodes in the device tree as described in
>> the ADC binding yaml.
> 
> I think "preferred?" is the key question here. Currently, it is assumed
> that basically all IIO bindings have channels implicitly even if the
> binding doesn't call them out. It just means that there is nothing
> special about the channel that needs to be documented, but the channel
> is still there.

I think this works well with the ADCs which have no other purpose for 
the pins but the ADC. The BD79124 (and some others) do allow muxing the 
ADC input pins for other purposes. There the DT bindings with nothing 
but the "reg" are relevant, and channels can't be trusted to just be 
there without those..

> Similarly, on several drivers we added recently that make use of adc.yaml
> (adi,ad7380, adi,ad4695) we wrote the bindings with the intention that
> if a channel was wired in the default configuration, then you would just
> omit the channel node for that input pin. Therefore, this helper couldn't
> be used by these drivers since we always have a fixed number of channels
> used in the driver regardless of if there are explicit channel nodes in
> the devicetree or not.

I think this works with the ICs where channels, indeed, always are 
there. But this is not the case with _all_ ICs. And in order to keep the 
consistency I'd actually required that if channels are listed in the DT, 
then _all_ the channels must be listed. Else it becomes less 
straightforward for people to understand how many channels there are 
based on the device tree. I believe this was also proposed by Jonathan 
during the v1 review:

 > > Hmm. That'd mean the ADC channels _must_ be defined in DT in order 
to be
 > > usable(?) Well, if this is the usual way, then it should be well known
 > > by users. Thanks.
 >
 > Yes. We basically have two types of binding wrt to channels.
 > 1) Always there - no explicit binding, but also no way to describe
 >    anything specific about the channels.
 > 2) Subnode per channel with stuff from adc.yaml and anything device
 >    specific.  Only channels that that have a node are enabled.
 >
 > There are a few drivers that for historical reasons support both
 > options with 'no channels' meaning 'all channels'.

https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/

> In my experience, the only time we don't populate all available channels
> on an ADC, even if not used, is in cases like differential chips where
> any two inputs can be mixed and matched to form a channel. Some of these,
> like adi,ad7173-8 would have 100s or 1000s of channels if we tried to
> include all possible channels. In those cases, we make an exception and
> use a dynamic number of channels based on the devicetree. But for chips
> that have less than 20 total possible channels or so we've always
> provided all possible channels to userspace. It makes writing userspace
> software for a specific chip easier if we can always assume that chip
> has the same number of channels.

In any exception to this rule of describing all channels in DT should 
just avoid using these helpers and do things as they're done now. No one 
is forced to use them. But I am not really sure why would you not 
describe all the channels in the device-tree for ICs with less than 20 
channels? I'd assume that if the channels are unconditionally usable in 
the hardware, then they should be in DT as well(?)

>> Add couple of helper functions which can be used to retrieve the channel
>> information from the device node.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>

Yours,
	-- Matti

