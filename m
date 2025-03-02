Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9D7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+axkLd7tQFz7zR9h7JCTxpVngu93rFLR93Lw7kqAh8=; b=ayV01kDmtzwFLyO+eDnIv7Corv
	ARhGOicftNAI8s4H0FQou38zDrf8t2apkC3D58MfguaXmXNeMe2rDuQ9dvXeuScWpAU4U9CsvrcO+
	3qTqK/dyjJ07fUp+N48VETAt1A3/hb9UlbOYEaLfU7OsY4ibb2YAPtG2TNQaq2TeOJUZTIoSEqftV
	BoQYoPDdHpXBiY2uI0j+guzSIjJZWOoxMyShSOHNs6biXT1FpUs+pnlAl7mNvTsr/SXPzfUowcXd/
	WGcokNZrkfm6eSiNn1uvLIeERF18bKcax+RXBWi9sk5DjqmiaVTxpTX/MSFcV+JKWGbx5RGwV8M9Q
	uU+7qY0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toj3U-0000000G2A7-15S0;
	Sun, 02 Mar 2025 13:08:28 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toj1w-0000000G1mZ-2QNh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 13:06:53 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-307bc125e2eso38991731fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 05:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740920810; x=1741525610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+axkLd7tQFz7zR9h7JCTxpVngu93rFLR93Lw7kqAh8=;
        b=ZQPj9b2bNKsbtG9HKKrBicnsIJxl6ht9bnoPOnwUmsi6gDaZEHc38pc8XP7irIC4bK
         /9N9xfzQcBLO5Z5NFmRt8OmPDacaZNC2gbDvXN75NTnmUZ/o5illSmGY1NSCYrnd3tCy
         BYmaqk18U1nDAleH6G6n0AijV97p+J8Sb2dKquRNj72/54iZeQGKh6se9Tidok9lZJUp
         xiF2gwiST2exG6cV7UCPsDJiIZh0XDTZtNW7wJJ1pzDiY7eCJDMUpkpOzm/Ft/aj9nNC
         1/rdolMEuP50vh4qcHwh6DOUb3uSBrkG+zV/LV6Tny3yb4p4qC6N5gqtK/ABIaf19w8V
         9OnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740920810; x=1741525610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+axkLd7tQFz7zR9h7JCTxpVngu93rFLR93Lw7kqAh8=;
        b=ou1R67TuGEaoqaEMpcXZF2Fy1Sq5hU0OTobjRkMnrx54LzTcLjktZLT03+S26tE0hM
         lVnP3I6JipXvxrMyD/WijyEgB2ESlUDFDHUq/+lcqKgDjGXjOiZOFnVGP9dkOhqIMfzz
         QmzNxtwh6Pn6vkOhVLkIqorSNKFFYyPHIMbtNFbQjVq7tTvJLGd+uu9DtneCMwbG20Q6
         rvm2ub8L1KTdy1ripN1qw2nxXyTzdnvZc+LscK3iWvoLod9n7vQgLsr/oVgDrAmYz6PG
         BB7odMzvlAddDlJ2EsJZF7YWQy8DHZRAMm5ph+qWe3s+U8mqhKycpapDo0I9ycmBlHXx
         0mAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1iVNXm2Xplu2/24VqyuKK4kNe6LK2gteM8xHBflU9xQ6yWdVA5Pv0lNf/KIfKaR/jZy2noJ6NtRxMLQxK09in@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/tTQCApHUa8zRr5u1mgV0Gs4w7qzxLc0xVxzleDufJUQg1IPJ
	7kX1YSbiTweqHbJQM3x4fZ7rx6HWOsVCtXfbzYusirpQIeLCo2vl
X-Gm-Gg: ASbGncvjl6L5vkzqv8F39+f7UEbJiKsc/DBq/VEOqIF6+SrTearkuh541s/HM/nctBb
	f2qaeA67nwWdcWNmGYR7TDdZ5FCBLnyqGk0gNXWEtB4uCmUIhSc1NlmtfVtsQbOdNpVUgGC3Bo7
	joJwSKcTY7HMxBphz6n3mvhfzeTqgeChGe7GgwlqOA99ZdsJdli4yf1tGeNVBy3UIxvtboux4/E
	3Nj0JgbDt2FFGmo9WZxs/LLYyF08lH8nucjaTptuIRUhm+4R6i9FTma6tEre54Gnli/Tqu6NP0v
	CTcv2mcqAGrbfmjykDhJT9mtIss0CjOOGDhd3ZW5tQ4tZdyvsaYcSyA90YPQjuMHdoDinHwDOhd
	f6dLLr+QckX7oM1qMEUDoslH6og==
X-Google-Smtp-Source: AGHT+IEucaK4C0/jG/28ToSGCMqDTpO1LwC3UB+LxRq0hxN98edyDZiBux7h98Elv5EsCRuxmORCqg==
X-Received: by 2002:a05:651c:1545:b0:30b:8faa:9544 with SMTP id 38308e7fff4ca-30b9320c44amr33012291fa.7.1740920810359;
        Sun, 02 Mar 2025 05:06:50 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8dbd1ad9sm9547021fa.76.2025.03.02.05.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 05:06:48 -0800 (PST)
Message-ID: <45c0bf5a-f821-498e-8a9c-99e53bba5307@gmail.com>
Date: Sun, 2 Mar 2025 15:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] iio: adc: rzg2l_adc: Use adc-helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
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
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
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
 <5658fbdd886cc7ada278a42c63a140bc14d1277d.1740421248.git.mazziesaccount@gmail.com>
 <20250302034042.59d83f53@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250302034042.59d83f53@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_050652_628100_0AE3AADA 
X-CRM114-Status: GOOD (  17.33  )
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

On 02/03/2025 05:40, Jonathan Cameron wrote:
> On Mon, 24 Feb 2025 20:33:29 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
>> drivers avoid open-coding the for_each_node -loop for getting the
>> channel IDs. The helper provides standard way to detect the ADC channel
>> nodes (by the node name), and a standard way to convert the "reg",
>> "diff-channels", "single-channel" and the "common-mode-channel" to
>> channel identification numbers used in the struct iio_chan_spec.
> 
> Needs an update to reflecting naming and functionality simplifications.

Thanks! I should've noticed this. I'll re-read and alter all the commits 
for the v5.

> 
>> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
>>
>> The original driver treated all found child nodes as channel nodes. The
>> new helper requires channel nodes to be named channel[@N]. This should
>> help avoid problems with devices which may contain also other but ADC
>> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
>> string didn't reveal any in-tree .dts with channel nodes named
>> othervice. Also, same grep shows all the .dts seem to have channel IDs
> otherwise
> 
> (othervice does sound cool though ;)

Thanks :D For some reason I always have difficulties spelling it!

...

>> I picked the rzg2l_adc in this series because it has a straightforward
>> approach for populating the struct iio_chan_spec. Only other member
>> in the stuct besides the .channel, which can't use a 'template' -data,
>> is the .datasheet_name. This makes the rzg2l_adc well suited for example
>> user of this new helper. I hope this patch helps to evaluate whether these
>> helpers are worth the hassle.
> This doesn't seem to match driver. It is messing with channel type.

Ah. Yes. It was simple until I rebased to never version. I'll change 
this. Thanks!

Yours,
	-- Matti

