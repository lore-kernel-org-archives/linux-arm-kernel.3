Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F5BC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGBJfvaNnxtRD6hIkqEgxjYX8qkJ7qsN5lK/+BN2aO0=; b=YpXhBMPe5fA60c/Q0gbMjFz//s
	Y3FDBpvs7ScR/UOlcdmfiGlL/ajYzlkvj+zK6SII6omVLd2Lk54ScJI1kvSORnMFgBGTo0OzVnkgM
	dr5RDABWMQIzn0jrzJBz5d+oolPo/OdFZLtmmlksyzeosFluIufV3YCICxqpPSr4ZxDiXbB9AZznV
	2LyA3St1oSgPOk1ujy8jY0FrU1vAOZ8trGUTjOpOeGImZbEUxMcFDSfLbpCjDX9CN8xHCVTdj3gLw
	bEovPG50ov3KvPdLE1MOwc13WSb4RjvoExtK/615estn2Qk68EWr3q37muNUOWIzzl/x83ijo12WT
	LhoUEcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0O-000000000B7-3aW4;
	Mon, 31 Mar 2025 10:04:32 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBu4-0000000HaFd-0p7W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:58:01 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54954fa61c9so2391108e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743415078; x=1744019878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGBJfvaNnxtRD6hIkqEgxjYX8qkJ7qsN5lK/+BN2aO0=;
        b=Mf8bEMAueoY8kfpSvefw72ZbgzPNhqE6mofgFf8ekNB0L5j0e3mL7B2+fYPn9AZQZX
         W3LsfWnTSLgIbgWMGCgDOzaowJvlye0b6GUERvXuOBMgO70cCLbVFNwcI/ts5TkiuDA+
         fck1s/4N0Y+4pgPhawzTWFszATTbL5gZJqVwxLWGpyBJ7vJsMZpcVrSqpKm5JSJkWsJL
         +PaL57wnTkRjEzOqHRj/4oEaMvSm28o8Ujj8nPWNLcIRmxRNMAu9bnLLh2I9Bh6lufzg
         jYoDGyuyDtbuuLr7+iAeJ7xlB6CDfe2siRLNgKm3mDJHRlL/IGzcmNX95rBfltNjdZs7
         YM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743415078; x=1744019878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGBJfvaNnxtRD6hIkqEgxjYX8qkJ7qsN5lK/+BN2aO0=;
        b=mcy5o0OSFgt/CQNZQbC34QUHS8MsjeBHZCs79wn5Er+ApnGs0W+60dpqrU0gnDZhZO
         MRsfNgb7sKifEP7vB3hLB1xFmXeIWSO968o9zOtCeci1ikf4X8vFOJLvTZUwy4nGf3eJ
         HU9NcotfmrNAT3Ebu3iLTZLw7hbPapLrwnJNOUWvMpfNNov7/c8S8B3+BjAEaUOyho/X
         ANegoRix0Q/HgsoShC0lpBkDxNC3wuL76BO+BZZKyPdwOo1+GmhewSaAQMPQap0X7pv3
         0AyhTrI+kD1LtzolXI7Yo1K7PAAUv/nwLUkc+ZadhuhdHXzJf7Zevw9I6bjM3eAwxY9Y
         PzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe7ZAFs5BY/ktJ/DiE8h0v0P+exVHhwEJ7SHIbal2GVVF2qLSQXiFMRDv5sTS/Hdh7EktbWLVbm2wwpWjqrzw1@lists.infradead.org
X-Gm-Message-State: AOJu0YyJeQhpnrxI5qBvcCeHZTQ9Cp47nuNxgyFIlf9ahXcd+htjehM5
	4TZXcBJ4F7Ih910p/9H406LDtD47uQD0fF3ODG7NpQ60/uOQKvxVLbpwLA==
X-Gm-Gg: ASbGncsH2bkA+X2LgIcblXmT91cTMQXTp4hfbb9drQZHYT/wLfTUZ/HclOPIyFMaL1U
	qtO1FqkLqwr7ObuHYeCifoPZbqXUc1v2RU5l1U/p5Y9vI+SOYQRaW9i4S/BALRshLsYlLBobe2I
	P8sRmeMmNEySLpDJKANF5tdROt+VbeMZRA1+TF5kkvrcHjriLCOp70rtVbGsdVh5UcrM6blqr93
	hHPI9V6CmXCVzXs2I5t1F55uSUiAYexPyjHhUqt7tQxPd9mgV8sz68mnzqKcsyF7Bzju/CfUt3/
	Bd648hiTXXMfwa4bMhdF5u1RryBh+pEhg6qdeXtKNU3iW0ThOqjTN9UgkxJ6O/ppbKyUYNoZn4g
	mcjIPw+Co6apZB1BomWvmYPdVPA==
X-Google-Smtp-Source: AGHT+IGqeY06WugE+f6xFNsS8xeFCBQw/6TOQOGCtpw4PCZBd5XxHX4TAt+/prfgf/QFIXCNENTg8Q==
X-Received: by 2002:a05:6512:a95:b0:549:8cbb:5441 with SMTP id 2adb3069b0e04-54b10dc7c04mr2303336e87.15.1743415078069;
        Mon, 31 Mar 2025 02:57:58 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b103721f6sm786241e87.108.2025.03.31.02.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:57:57 -0700 (PDT)
Message-ID: <2f977814-bd9b-4b54-aa77-a36edb56e194@gmail.com>
Date: Mon, 31 Mar 2025 12:57:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] iio: adc: add helpers for parsing ADC nodes
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
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
References: <cover.1742560649.git.mazziesaccount@gmail.com>
 <f1d8b3e15237947738912c0d297b3e1e21d8b03e.1742560649.git.mazziesaccount@gmail.com>
 <Z-mnNtYLkwsTYjMh@debian-BULLSEYE-live-builder-AMD64>
 <4d66b3b5-bfcb-42f0-9096-7c448c863dfc@gmail.com>
 <20250331104849.3eb748a8@jic23-huawei>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250331104849.3eb748a8@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_025800_238555_CBE3733B 
X-CRM114-Status: GOOD (  25.68  )
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

On 31/03/2025 12:48, Jonathan Cameron wrote:
> On Mon, 31 Mar 2025 08:39:35 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Hi Marcelo,
>>
>> Thanks for the review!
>>
>> On 30/03/2025 23:19, Marcelo Schmitt wrote:
>>> Hi Matti,
>>>
>>> The new helpers for ADC drivers look good to me.
>>> I am now very late to complain about anything but am leaving some minor comments
>>> below that can be completely ignored.
>>>
>>> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
>>>
>>> Thanks,
>>> Marcelo
>>>
>>> On 03/24, Matti Vaittinen wrote:
>>>> There are ADC ICs which may have some of the AIN pins usable for other
>>>> functions. These ICs may have some of the AIN pins wired so that they
>>>> should not be used for ADC.
>>>>
>>>> (Preferred?) way for marking pins which can be used as ADC inputs is to
>>>> add corresponding channels@N nodes in the device tree as described in
>>>> the ADC binding yaml.
>>> Not sure it's preferred to have ADC channels always declared in dt. That
>>> question was somewhat also raised during ADC doc review [1].
>>
>> I had missed that doc and the review. Interesting read, thanks for
>> pointing it :)
>>
>> We did also do a bit discussion about this during the review of the
>> earlier versions. I am not sure if we found an ultimate common consensus
>> though :)
>>
>> A recap as seen through my eyes:
>>
>> - It is preferred to have either _all_ or _none_ of the channels
>> described in the device tree.
>> https://lore.kernel.org/all/20250201162631.2eab9a9a@jic23-huawei/
>>
>> - This, however, is not _always_ required to be followed, and it may be
>> impractical in some cases:
>> https://lore.kernel.org/linux-iio/6f6e6550-5246-476f-9168-5e24151ab165@baylibre.com/#t
>>
>> - We do have bunch of existing drivers which we need to support. With
>> some very different approaches to bindings.
>> https://lore.kernel.org/linux-iio/20250302032054.1fb8a011@jic23-huawei/
>>
>>
>> My _personal_ thinking is that:
>>
>> This means that we can't hide the binding parsing in the IIO-core. We
>> can't go and change the channels in existing drivers.
>>
>> But, we can provide helpers (like this one) for drivers to use. I also
>> believe we should still try to have common (and preferred!) approach for
>> the _new_ drivers. Eventually, the new ones will be majority. Some of
>> the old ones die, and if we keep same practices for new ones, the old
>> ones will become rare exceptions while majority follows same principles ;)
>>
>>> In short, ADC
>>> channel may and may not be declared under ADC dt node. ADC bindings often don't
>>> enforce channels to be declared. On IIO side of things, many ADC drivers just
>>> populate channels even if they are not declared in dt.
>>> The ADCs you are supporting in the other patches of this series seem to require
>>> dt declared channels though.
>>>
>>> [1]: https://lore.kernel.org/linux-iio/20250118155153.2574dbe5@jic23-huawei/
>>>
>>> Would something like
>>>
>>> A common way of marking pins that can be used as ADC inputs is to add
>>> corresponding channel@N nodes in the device tree as described in the ADC
>>> binding yaml.
>>>
>>> be a good rephrasing of the above paragraph?
>>
>> Yes, if we don't want to guide new drivers to either have all usable
>> channels, or no channels in the device tree.
>>
>> I think Jonathan said he'll be rebasing this to rc1. I am a newcomer and
>> I should not enforce my view over more experienced ones ;) So, feel free
>> to reword the description as Marcelo suggests if you don't think we
>> should prefer one direction or the other.
> 
> I've gone with Marcelo's suggestion because I don't want to be too specific
> here given the complex history.   We can absolutely encourage the all or
> nothing description going forwards though as it is logical in the vast
> majority of cases.

Thanks for taking care of it :)

Yours,
	-- Matti


