Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C768C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=; b=FmuDsWqm7JPh7pQQZFAfvyeLGv
	891tvhcF89uEz1ndQKxfMOIexCThcwyDwbdm5Ndr00+9GtZvxtiS4EABu9SUAE6pe5QA59QBkHhr8
	4wIocHRBeLoHT21ElEQPZj2M1RGx2WZfVp5m06yshSIwUA7i02+FszdmhtbKolftkSE7zm5g9TBED
	Qc9vF6RMsNKJ08r0+tU6840z1lXQu2LukyfLmRMnkU2BhOZEDmaCr8O0q/Ts6nLILDl2ttCmHnYuY
	FjnC2/hYXo+QMC6Qi3qumjOwbI396rd/G53t6tYpe/OhdPMuM+eE0SpssqzQapJQTK1YUqZp8gkAC
	2uFYi3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SvO-0000000DpKB-1ytR;
	Thu, 17 Apr 2025 17:21:18 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SiE-0000000DmMP-0EiQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:07:43 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-605ff280d1fso35306eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744909661; x=1745514461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=;
        b=TMtlaQwFXTcfP8+ZqdcGGAN0q+8L1MrHDibYGk7fdrHWGaPkVdGJv/dx8qi6CakeM2
         28c8tGCieel/bVW+P60nNzeTXbINx1YGT+dDNe7wKh/Ru96yuPh9IjMYayLbhueKaZ3w
         OLiM55uRaXARpa9yAdRoLBx/5ibWRDvUrCcljKFBzPtwlPy+RLkF3MCcs3t39qLW30Vr
         quRVuYd6eLpjk75dOAAsNPkB6gSdCjf3G4wSTV7VHl4TnQQP96Vv+vtIjkhSo5Qg7Xn0
         jROIla6Ho1WsezzlSqRQQzyJXrIbgbjprfcK4EbG9/wrr+UZ84Wcgs/tlB8O5UsJztF5
         OSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744909661; x=1745514461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJO4GXL7dOZjeP6V87YS4vJmfeGtcMABTZh3kn2uUsg=;
        b=FcIxjSLt1JOiQM2Mdw0LORc5KH0LAqjbID4cbIIKtg7w+wZBX1sAOkiH1u/dHbPsk6
         1ccbioLdcXXpFWE/ppbTPeYpRglvmN0P0x47lzVM83F/DvSbiPbCOUmrqHAzDWjh/4iX
         2fupNm/TZeWDQuH4nX7Yr5TdC1sy3b+7WMLJi1o01eAYSStnMJLAYqJIVTcQkP34bsqR
         ohUKEspemJf0yKLbTaSUO0MQ6rrfyDsCFLmuVrZXz/5Czd0xMnj9nWJBSZ/+sceDHSQO
         KjsLYtu6pvdZMM7gtYL3XmIgw4l+Vfs6uomx5OH7jF32F76Pkrq2lgrc7aeZIYkeats+
         krNw==
X-Forwarded-Encrypted: i=1; AJvYcCX/6JgGfXCwASM6Mel5PyBBKpvTXZiftIB2t6pRcfplqvMUkmy59tcgOmqif/bsGPhZ8YAKcCWhMgi261Nk+8c/@lists.infradead.org
X-Gm-Message-State: AOJu0YzeGSvpllOIeAt8iaOLbD87HHxUfwuUWgj8QXkB6TYqQQHTzPGy
	EQfeQXcTZbnWvg6wC5G/pvfGdNXsrM8NJjKwrZH3/0qXnZ+ao5QjTPri8e+T0ZQ=
X-Gm-Gg: ASbGncvw+tVS/McRrQZ7NPAAvjSKlnBpeOGJ4cGIzqaDbGsoyDLoPi5IQhrgAEu9ki7
	/os37OPxrU9/GWxbejOlwslhrK3Qf+7M8KKpw+LfoQanqCq7J1dpaafczEq12Flh6BC8EPPdB8v
	WuztCMTCEapzQeWcll5413Dn3F4oZ36EwMOIX7oPRnHWoT3RW6oU274+j536LtWu5ku2/yhWXBu
	TQC6eeWVwOXm0uJO0bnRymzf9jmN6/039CgDKIXIgU9FTrPbq7w2eOgUBy7QcdKutz3kXcUa+vo
	u7vWYTW/3WBWVaYsPdKWYRBhtTE1SMT9qvJomrompOYWL45fVoMQ/4Pafa85UB4qGv+MQAm2oLa
	Xc5ysxwJ/TZygjhrdrg==
X-Google-Smtp-Source: AGHT+IHbLABiWinLwjfZ0DTmEnAkfAixBYu8A7EcycIAgYoLkSVTlOq/Pw+F15KcRSPJ7k1qWk67rg==
X-Received: by 2002:a05:6820:180c:b0:603:fada:ac47 with SMTP id 006d021491bc7-604a91e814cmr3847196eaf.1.1744909661228;
        Thu, 17 Apr 2025 10:07:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5d8c40sm33099eaf.3.2025.04.17.10.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 10:07:39 -0700 (PDT)
Message-ID: <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
Date: Thu, 17 Apr 2025 12:07:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
To: Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
 <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100742_099479_8AEA2537 
X-CRM114-Status: GOOD (  13.02  )
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

On 4/17/25 11:59 AM, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:
>> Align the buffers used with iio_push_to_buffers_with_timestamp() to
>> ensure the s64 timestamp is aligned to 8 bytes.
>>
>>  drivers/iio/accel/bmc150-accel.h | 2 +-
>>  drivers/iio/imu/adis16550.c      | 2 +-
> 
> Looks like a stray squash of the two independent commits.

Oops, sure enough.

> 
> ...
> 
>>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
>>  	struct mutex mutex;
>>  	u8 fifo_mode, watermark;
>> -	s16 buffer[8];
>> +	s16 buffer[8] __aligned(8);
> 
> As for the code, would it be possible to convert to actually use a sturcture
> rather than an array?

I do personally prefer the struct pattern, but there are very many other drivers
using this buffer pattern that I was not tempted to try to start converting them.

> 
> ...
> 
>>  	struct iio_poll_func *pf = p;
>> -	__be32 data[ADIS16550_MAX_SCAN_DATA];
>> +	__be32 data[ADIS16550_MAX_SCAN_DATA] __aligned(8);
>>  	struct iio_dev *indio_dev = pf->indio_dev;
>>  	struct adis16550 *st = iio_priv(indio_dev);
> 
> Ditto.
> 


