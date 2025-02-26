Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B60C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 01:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juVLmpm4UqW3CDyHjhGjXXzInD2jAOQrY9jRma953QM=; b=cHTXPRNOkq8d5+Ybq7MVLQN03g
	s89LAPuB+KzgKThpoeX/MOQGyWajNHrJsoz3gqvSECWMqpK3uuZXBiIkCcbVbpb5sQQVowPCH80kF
	CuXqkaSdCn6s9DLUrxrTT9Or3BXKgImG0SHQcPs54hr8CglwXG2m275yOzJHpooco3ZHFRVH9ivVm
	P4JL7YdWLZJnNMBIiPuKs+ngK6iUT/Qj5UprYZzx0dXUbvktJNPmU4kshA/ktoC3JCjB+//cFX5x5
	11oxX2lzhuYwHKo9dDaykJ3UiWMQ7AyR65KbmisJRrWtabpGN4L096E6cnM6eiX5NrxcXH6mbdWqg
	rDqjSwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn68a-000000020DB-2n3h;
	Wed, 26 Feb 2025 01:23:00 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn4z6-00000001qfk-0r0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 00:09:10 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7271cc3d73eso3328670a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 16:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740528547; x=1741133347; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juVLmpm4UqW3CDyHjhGjXXzInD2jAOQrY9jRma953QM=;
        b=i60vf7YvnuA9cS7zD2QPD9I6M/LNFiqRcVwKWnGRr9KtBuLdT82zse4arYSNCJZ32d
         cbOq8rn/B/3DQXSFlYFu7+XkN+UlJzvKUskAl1ksAr+T4K5FelwljErvIyUcqom8+1i0
         17qk07S9sl1ojSIhaFYGkkKJ/EAySKJiYf53lClw7o79V7NXsaN3Ngq92N2AYu/VO3T7
         BGKaXc/Kql+NpO3fEcHThRaoDWiZfubuMmgPxb28OBF3XC03loc1mBHosxioHwethrq4
         ZX5gmkkpXd9W6EEmuksE34YoXF4Ge7VTEcPtBIAS8VfY91rhCwK9/Ii4j1o7+fqcQk3J
         y11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740528547; x=1741133347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juVLmpm4UqW3CDyHjhGjXXzInD2jAOQrY9jRma953QM=;
        b=CnaZ9yJvnhu3TzPaxg9XgET02Tli/bnKQroknoVfbN6de0bG1uoq9CD72uU9SCVnxW
         zbq8IFqCVMcrHpF7GQBlMgHgKG8aM/AHOOscxulkkiug0DK6+8IdnzldqsTE0mc1Ri81
         QB/yZtl/DRtGekythyDNtloxLDHrRZm9RGFN26P5by3s5Z9FPolhQiN1S12ARk4NhODr
         c9ovVasGxahM5UnRL6FiwUvaVJv+FOwn7DAEOSRnVHz9kUIWCw9Fs3RjWG3aAZYr7WCr
         Saf41G9QxLLbCHe/aj6aGrr4TSNck3ISbGLo5D6VairkClPCqegpEdd/v/4dRBn9PyFs
         ZPew==
X-Forwarded-Encrypted: i=1; AJvYcCVbhF0JOoO2NuaDBeB90q709uOKy8pqMKTjEsMPHURDr1pKVKTECbGQjhP1cFjTMBFqgdN5p109/uCVM1UKDafO@lists.infradead.org
X-Gm-Message-State: AOJu0YzjWge1G7D8rSB1OK8KGBrNNFQhhN6K+vbZ1qdzkXimhP3D3YCX
	o4inCXMUxj7CNJwbnjXYZiGlq7aG6qaH7Eho/3mxjYDWkTHi19M62T/OMyN9u/w=
X-Gm-Gg: ASbGncv96kKxPiVkJlXerngebwUP8RzykjHFShh/s9PMzpnxiSe1tL9xYaeFkFANfYD
	U7Kd7cqGc02FTEOojst4UQax624u5NqhCyHCmm+SmvQvzX2IKsXJEWk+0MdikGHEKfveR2lGbrS
	FIzQumXxqOKvYqElO1Amof79624XL+CremeMbc5xkdhNzG3JrheVtjdQwhtGQ5nSgkXqxWkhKB3
	5y7qIS2PH1Iyl5cpZprDB/qqALoLdrcz0/uXf4umqzgFEH3UbW26TPhJY5BOhzU8DX2Gq5KbXRg
	dW6bB+Rp+SJMmTGRcLDViXhxVIdbboVSd7kWt+JhfGSRq0ozsJ278V84aEWE4YU=
X-Google-Smtp-Source: AGHT+IFcLe07eLzlySwjtDU+XuKdCvG3TGM5yw/uZ3tgI0c9sfN55oU4icGBmCi8OdnlyMQtoSSFWg==
X-Received: by 2002:a05:6830:dc3:b0:727:24ab:3e4 with SMTP id 46e09a7af769-7274c1ac6f4mr15683376a34.9.1740528546779;
        Tue, 25 Feb 2025 16:09:06 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289dee9d50sm497552a34.34.2025.02.25.16.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 16:09:06 -0800 (PST)
Message-ID: <f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
Date: Tue, 25 Feb 2025 18:09:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree config
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
 <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_160908_498098_FE799359 
X-CRM114-Status: GOOD (  27.95  )
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

On 2/24/25 12:34 PM, Matti Vaittinen wrote:
> The ti-ads7924 driver ignores the device-tree ADC channel specification
> and always exposes all 4 channels to users whether they are present in
> the device-tree or not. Additionally, the "reg" values in the channel
> nodes are ignored, although an error is printed if they are out of range.
> 
> Register only the channels described in the device-tree, and use the reg
> property as a channel ID.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v3 => v4:
>  - Adapt to 'drop diff-channel support' changes to ADC-helpers
>  - select ADC helpers in the Kconfig
> v2 => v3: New patch
> 
> Please note that this is potentially breaking existing users if they
> have wrong values in the device-tree. I believe the device-tree should
> ideally be respected, and if it says device X has only one channel, then
> we should believe it and not register 4. Well, we don't live in the
> ideal world, so even though I believe this is TheRightThingToDo - it may
> cause havoc because correct device-tree has not been required from the
> day 1. So, please review and test and apply at your own risk :)

The DT bindings on this one are a little weird. Usually, if we don't
use any extra properties from adc.yaml, we leave out the channels. In
this case it does seem kind of like the original intention was to work
like you are suggesting, but hard to say since the driver wasn't actually
implemented that way. I would be more inclined to actually not make the
breaking change here and instead relax the bindings to make channel nodes
optional and just have the driver ignore the channel nodes by dropping
the ads7924_get_channels_config() function completely. This would make
the driver simpler instead of more complex like this patch does.

> 
> As a side note, this might warrant a fixes tag but the adc-helper -stuff
> is hardly worth to be backported... (And I've already exceeded my time
> budget with this series - hence I'll leave crafting backportable fix to
> TI people ;) )
> 
> This has only been compile tested! All testing is highly appreciated.
> ---

...

> -static int ads7924_get_channels_config(struct device *dev)
> +static int ads7924_get_channels_config(struct iio_dev *indio_dev,
> +				       struct device *dev)

Could get dev from indio_dev->dev.parent and keep only one parameter
to this function.

>  {
> -	struct fwnode_handle *node;
> -	int num_channels = 0;
> +	struct iio_chan_spec *chan_array;
> +	int num_channels = 0, i;

Don't need initialization here.

> +	static const char * const datasheet_names[] = {
> +		"AIN0", "AIN1", "AIN2", "AIN3"
> +	};
>  

