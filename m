Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB89EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=; b=40KXZ5GhNjQMtiSj1VGWiUMHXd
	FIMxCfwYDrR2SXPGjXRUA4ZonBFutdeVunxcuxEve9fOgQ/K4hQP9sj+49WpnlXTnw1rEah+ANyQZ
	hbdA10KhxS88gxOLZGq7c6WlKLbSjcCMJaFZX7SEQ26SdJzbklWgt5Z1BfjcNjoysZF4HQ2e1R1Wk
	3bIep3ZU6N6JSEBx31MPmBMVt7pJlcZ0WLehj8lkHumj2nkOqASkUXJdUfxrqBiZaE9GCa8113pBq
	myHoZ/DljzSMOVyhVWoRQ/Na7A7n54DYrOHyRaY8gndhrZl2xvqkLQmIRHbWSXwTj8qewMIQqXCbG
	w14MTZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyuO-0000000B7Xb-03JB;
	Wed, 15 Jan 2025 08:37:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyt7-0000000B7N2-3aDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:36:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso45107915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736930192; x=1737534992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=;
        b=rK5ITrOdXqBKDLHq4/HDJB1NPIr1c2vjRN76MwSXAA+KArTwOQrL6QVETLgNEXpUEh
         rOcfcHOD5+hCeCCjdZcvLWZxP+CPaU3Fk64WudhBoZu1Lvf9soii6jhNq108Kowlelik
         ybWc6VinNdt2nMQp0wXD5Vm+LFKpwNqkszxhdeI09UPQOXipynQDbEEiNn9JO/6VGx+5
         G4tmFUlTZWv3Gn41CN/LfpuEJR1K6UvGUaD9O3wMeyk3JFiwTaJ1hck6L6ae/r0Hpmiu
         ON2fEAhHD/ZNYtdBLAXlqTrwvOALiLwLcEKHO+bTUh9oNLFdd6h+2lwsE0quiH2WOnvm
         UQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930192; x=1737534992;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=;
        b=xTBIvyhquF9J6Mo2KjnVruNtmFMjAiVlmMek/fzaooGAZ/lag2lyDkgUvj2bzKDBkk
         YxGbP2NpZ7lP1xDYeDieS2nskE+1HOABd/aR4EGPP1wO7D/pB55xdqq7Rhi3f0MVJaXH
         GMRthDAQx0Qdxug2I/1/7UrlleLCxrFUdorMDTw6kkYktPiUAoCra6cnzsdGStKh1pf0
         x8/IyO3XQOoSuZWsW2H1VegP871Z+v5Kf3XHLhP8mJmNeh4YAp4HCiLNHCTcF543uhxf
         fkqkZSY+QPm8jEZTHeg1Rh0p0jhTTZpaVaQjivTjIX4J42epANiqQFZhJNQGRzFBABN3
         +o2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0oSeOLNtlBr4qCKeiZBagfCj+95W/ZfS43jb5EfnyB71sEO6JboO9YBioTp8ZWithx7iaeQviaEoeH8jZuR14@lists.infradead.org
X-Gm-Message-State: AOJu0YzKjvFNL9I7wYo8sLxS6GmenpidtK4iiWDRW04c+ujo/LVNSFP8
	FPsbEDNlYGNfEx74C4hvf/LQiOJ9cq9TuCLL0dG2bC5AV/m5IYdORsFycgN7v6k=
X-Gm-Gg: ASbGnctqoVnUiwnKLJ9jyKWwBP7M/s2UnRRPlul5VtUsJhoteosucAN07FFk0fFR3VB
	Z724SnhSwzMqjyut6LfXqfFSWEZ6tx+gLHMkiKRCNmpaT7tExirZtv57d6EtfCtIvVaQw5S3Q9S
	9+WrYCIp6q7K39AifX3/lomJtE32w7GBK/VDXgQJn1oOwaRDjzLb9tZTqT6nOM1ND8D/wmWsZGG
	l/99SMZU0GYdUuUJAO4WDTbrpi+gOuPV5/vpA60YqzK1s1Oyy84J9ND
X-Google-Smtp-Source: AGHT+IGHLV3oniHk2tCYLxFndHHL9KG5RVtJRTDpiO1CMzyqcEywc4SzfBdAV2UjsP92dEf3xkAv9g==
X-Received: by 2002:a05:600c:3554:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-436e26ff1b2mr227264435e9.27.1736930192380;
        Wed, 15 Jan 2025 00:36:32 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e7b8:6186:fc23:f678])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d447sm16644404f8f.4.2025.01.15.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:36:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
In-Reply-To: <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com> (Jiebing
	Chen's message of "Wed, 15 Jan 2025 10:56:17 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
	<e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
	<1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
	<e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 09:36:31 +0100
Message-ID: <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_003633_893920_FBE62AD0 
X-CRM114-Status: GOOD (  32.51  )
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

On Wed 15 Jan 2025 at 10:56, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

> =E5=9C=A8 2025/1/14 22:05, Jerome Brunet =E5=86=99=E9=81=93:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 14 Jan 2025 at 19:20, Jiebing Chen <jiebing.chen@amlogic.com> wro=
te:
>>
>>>>>> +
>>>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>>>> +MODULE_LICENSE("GPL");
>>>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>>>> index
>>>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d728205=
4e03d953586648
>>>>>> 100644
>>>>>> --- a/sound/soc/meson/t9015.c
>>>>>> +++ b/sound/soc/meson/t9015.c
>>>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai =3D {
>>>>>>                 .channels_min =3D 1,
>>>>>>                 .channels_max =3D 2,
>>>>>>                 .rates =3D SNDRV_PCM_RATE_8000_96000,
>>>>>> -             .formats =3D (SNDRV_PCM_FMTBIT_S8 |
>>>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>>>>> +             .formats =3D (SNDRV_PCM_FMTBIT_S16_LE |
>>>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>>>> Again, mixed up changes with zero justification.
>>>>>
>>>>> This drops S8 and S16 format support for the existing SoCs (such as G=
XL)
>>>>> which is known to work and add S32 support on an HW documented as 24b=
its
>>>>> only. Can you explain ?
>>> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,
>> If there are chips difference we did not know about, then you should
>> introduce those difference, without breaking existing support -
>> including for GXL, which is what you did IIUC.
>>
>>> the new ip not support 24 bit,
>> Are sure about that ? that code has been there for a while.
>>
>> If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix up pat=
ch for
>> that, with the proper "Fixes:" tag, how to reproduce the problem and
>> explaining the fix.
>
> maybe there are some gap , we support SNDRV_PCM_FMTBIT_S24, not support t=
he
>
> SNDRV_PCM_FMTBIT_S24_3LE,=C2=A0 for SNDRV_PCM_FMTBIT_S24
>
> it is=C2=A0 Signed, 24-bit (32-bit in memory), little endian , the audio =
dma
> busrt is 64bit

It makes absolutely no sense to discuss memory layout for the codec.

>
> it can get the full data. we send the 32 bit data=C2=A0 mclk =3D 32bit* 4=
8k *4,=C2=A0
> use the clk to send
>
> the=C2=A0 SNDRV_PCM_FMTBIT_S24,=C2=A0=C2=A0 the hadware always send the 3=
2bit data

No it does not. It send 24 bits of data over a 32 bits physical word with
8 bits ignored.

>
> so, i think we only add the SNDRV_PCM_FMTBIT_S32 base on it

That's wrong if the codec does not actually use the full 32bits ... and
I have clear indication that's what the codec is doing, on GXL at least.

>
> we think the 24 bit is the SNDRV_PCM_FMTBIT_S24_3LE, it is 24bit in memro=
y,
>
> due to the dma busrt 64 bit limit, it can't align the sample bit, if it is
> 24 bit

Again, memory layout makes no sense here.

>
> so the clock configure can't 24bit clock,

I disagree and this has been tested. If you have a test case showing
otherwise please share it.

> by the way, We discuss internally for gxl,
>
> it also support the SNDRV_PCM_FMTBIT_S32
>

Does it really ? If it is just to ignore the 8bits LSB, that not a support.

>
>>
>>> usually support 16/32 bit for new audio ip , for SNDRV_PCM_FMTBIT_S24_L=
E,
>>> it width =3D24, phy =3D32
>> Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 bits
>> width would support this S24_LE, unless there is something odd.
>>
>>> it was  treated as 32 bit to send for tdm, so we can only add the S32LE
>>> base on it , right ?
>> You are asking me ? How am I suppose to know ?
>>
>>> but if the gxl not support the 32bit
>> I don't see a problem with a DAC taking input on 32bits physical
>> interface and ignoring some bit on processing.
>>
>> If that's not the case, please send a proper fix change with some explan=
ation
>>
>>> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>>>
>> If I understood correctly format depends on the chip and needs to
>> adjusted including for sm1.
>>
>>>>>>         },
>>>>>>         .ops =3D &t9015_dai_ops,
>>>>>>    };
>>>>> -- Jerome
>> --
>> Jerome

--=20
Jerome

