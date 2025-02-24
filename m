Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D36C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 05:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pki/JYWmmXNym2xztTz0HjhIt5MhQfFEcSVfA7kjWRY=; b=GKGtZwrvVRCDhZAar0hdTKNr6J
	Dp15rWeOUGRqMwcdRykAKHMruGrOlyXF0Utjol4sfxupY9+ELWSnpDzoQSxKZfjV2dkexCeRaXbb4
	+4fz1W1NbB1yKVTjIWOpWZ4DCJuD3u9kbdduq2PRy8MuAN67S8afmonYSGF44Vqp+gHF628ldFEF3
	apOGT0uYIwzqY+VstmgsWPbQr+eVJgOJhetSi0nVlUlZ+Zlk0NAMgcGy53/wDkMpUAdrDhHKyemwa
	hxHGmWNn5YLvU21ttkni6CgVROaV52XEMXkBbzrCRg2DZL6E2PpKW5qyehbc5w3oqNLSOMnOXEGtq
	PsPPnqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRDs-0000000CNgK-48aJ;
	Mon, 24 Feb 2025 05:41:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRCL-0000000CNZE-1AH3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 05:40:10 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30613802a6bso41356721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 21:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740375607; x=1740980407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pki/JYWmmXNym2xztTz0HjhIt5MhQfFEcSVfA7kjWRY=;
        b=UFL3zr5fDEYH/onUGg/ZBafP4LcJX+bNaDriKljufbMpaoNVCaDBrIJ7w2HhKvaVWc
         9nmmFolTaDRK3blo96OKiBU55cfEZrb2Lc5XOncYuf77GRRq3bxJN0mjqnQh/U8rNAU5
         1oKBqi/LoIhaH8meNn9CNGHd5VZVOMmSCKnuO4MVzBAiJBcI0WixyXXJfGY0pi8otwQh
         XfnAyIj6AKzh6ZsKQ0G5nJkEAivTQa03Oc9Z51IvbLHIZ1dboFxCTxkRUFw1C7wo1d0d
         VvDelMRxOP2o67Kv1tahvCaJzoSqQ7MixhanumYLvh9gHWCDjcI0P7HGN+QtK4cVRVGR
         Ve+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375607; x=1740980407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pki/JYWmmXNym2xztTz0HjhIt5MhQfFEcSVfA7kjWRY=;
        b=ibN2pGchGguqbo/EYSgvx35+R31qFrSiouGcHZUHkuVdWI3AJ9qaJRnzkdzeMmgAU0
         1w9SaqFlwCB5Lv3XZ0tZ6hk2fkwpREyUhlZ0WbCJG6BWtrKAbSnz/H0UHD8Fjxi8IBsU
         Q1F82ruRzhf8w/fWw4UM2FAbIOax/v5NsPYkeIav/jZs9MUm0CCUxcrfnDp9po9flTNI
         Yd49QfoR/4VJJ1Rw3qSqV57msP9lAWbRIqqGuIQi2SpQW+Pg0Ib/C8xrlISCqo9XljS1
         LZfmLN+4+kz9znoqvfgMw9DzMJGwRZnXCPvIYUcA5yrOYYAzRhPveyRT8plQ/xaIz8qD
         d4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8dWqzyJWiR62jPmnthcOp1Vgf1s7gKR0zVYwzG/JUfBYuDkkrjPVZKVRsO6Da+uo4+iNXKq8LwIeLK/hfWfZQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9kDeg610BKNp3Wg6ctSx59EFNwV3LnYqa4uFkD9Be/Rhx4+sp
	kqlwSMA9WcKyvFel9joRLG2lTlrosi5XljcTFjsKurhewvhHtF0E946fzQ==
X-Gm-Gg: ASbGnct6hHbAxEGdtsyeiJ/8CKr0Pu0V8inaRnV0fOSGwmRBMPIZZhpeRS/DoR5UUvX
	Ztuzl6BLJul/LEtbUi34K/LYvdJ5deDiH1QDnTviH977LQzyJo4A+jTcZ5XWmebCnfBzSk191Yo
	LSsvX1A0n4ZPvyEtl7hWpWWLghCGFVNP3zOeDIHrcuyE96WVrvM/zBPt3EYYZRutnithTVHhNZW
	AjSvov29dqpb7BnDub5Wob91a+vCHKzo3g7XvPpOw2v4YPFSNglWnHcwPSldESmM9UoakaM06uc
	fSB9JrObcijp9OWuEfqi5Nd4fQpmse/Xy3QZ9Sne0i2UhLyA6PTV5LMbIZoNVBBdj6Vj9CvBQrq
	q+rTUnKU=
X-Google-Smtp-Source: AGHT+IFYZsWHIGkUkgzUKAjiHsIv/QlXdd4k8rwaFgyu16UEoKiHj3ay571mZ+VYAfS3uE3xpBBTaw==
X-Received: by 2002:a2e:8ed6:0:b0:309:2012:cc59 with SMTP id 38308e7fff4ca-30a599a6943mr41956421fa.26.1740375606698;
        Sun, 23 Feb 2025 21:40:06 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30917da0e64sm34665291fa.88.2025.02.23.21.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 21:40:04 -0800 (PST)
Message-ID: <24609799-636d-4e8f-8406-f83b5db08f90@gmail.com>
Date: Mon, 24 Feb 2025 07:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] iio: adc: rzg2l_adc: Use adc-helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <cover.1739967040.git.mazziesaccount@gmail.com>
 <25c5d22f6f0cbd1355eee2e9d9103c3ee71cebdc.1739967040.git.mazziesaccount@gmail.com>
 <20250223163018.2c0290e8@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250223163018.2c0290e8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_214009_384608_071BFB12 
X-CRM114-Status: GOOD (  13.75  )
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

On 23/02/2025 18:30, Jonathan Cameron wrote:
> On Wed, 19 Feb 2025 14:31:38 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
>> drivers avoid open-coding the for_each_node -loop for getting the
>> channel IDs. The helper provides standard way to detect the ADC channel
>> nodes (by the node name), and a standard way to convert the "reg",
>> "diff-channels", "single-channel" and the "common-mode-channel" to
>> channel identification numbers used in the struct iio_chan_spec.
>> Furthermore, the helper checks the ID is in range of 0 ... num-channels.
>>
>> The original driver treated all found child nodes as channel nodes. The
>> new helper requires channel nodes to be named channel[@N]. This should
>> help avoid problems with devices which may contain also other but ADC
>> child nodes. Quick grep from arch/* with the rzg2l_adc's compatible
>> string didn't reveal any in-tree .dts with channel nodes named
>> othervice. Also, same grep shows all the .dts seem to have channel IDs
>> between 0..num of channels.
>>
>> Use the new helper.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> I should have read on.  Definitely more convincing with these usecases.
> however drag them to start of series.  Better to add infrastructure
> so some use and then on to your new driver.

Ok. I'll reorder the series.

I'll drop the differential channels support in v4 - and thus also the 
expected property types parameters - which will simplify this and other 
callers.

Thanks for taking a look at this!

Yours,
	-- Matti

