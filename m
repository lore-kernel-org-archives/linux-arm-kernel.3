Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A25CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+wNT7KW8FpybzoaA+6FfZ6C32T5hx5xiEfdag3k3wE=; b=CNYuyjbdEt75fDyTwV23xXbPma
	tjWHIeETkIa2CHGBDig0Ey7KQ0kJteTAt5h3yiNIH0Gbn3XRrT3LhRuLkbuGd8QbmzCvkKdms145q
	/CkpeJcLezSZXZ8PF/RDupU2+xYH9gmfbYLELF1U5GZHJHgJBGVwqXGSCwy4waaODJ56oAJH3eSN0
	UwjPapiVhoMwZhYXb+jvABLSjhPcOie/Q08TGYZbDbLvJcpFN/nt7gEIXrGBgUxvQ5OhYV1sAIxn1
	LLKxqv22JgyZNSzviZA2jZDiWTSvtCisHVkuv19SxNNs2xmKYIYpvLXmN8sEc03YLbiUEONluPgHN
	SwrEFCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnuQ-000000063Rm-12kJ;
	Fri, 31 Oct 2025 12:07:10 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEnuN-000000063RN-1sAk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:07:08 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37a17d470dfso17206921fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761912425; x=1762517225; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+wNT7KW8FpybzoaA+6FfZ6C32T5hx5xiEfdag3k3wE=;
        b=EZagSP4oQRlVD8BYUYPoVUm9Se6t4ndHpgTSL8/Vr6BbTxSWyCkJtTyZGQhOE6rZJB
         E43TvQsAkKRi5yWzpkEmKaKOOD2HBC6OFDPoLaPGEwaw3dXsh1EQyFUWufIP+WDM4euV
         U9hdMjVR1UHpvhv5XsrW/IXNaRCE1EEALdufWBbYuK3jnLZfDMsqUf4MTy6GWesIFkqT
         6uZ5R/Sp66aZFmiLfSHEVL6A2JYhaymG5YraZKFlfLcftShgM7VE1sut9BpwBSq+9rTH
         Z/bnn3QcvhXPMJOXYRUxGURhCI/foLVj0OLYRKoo/kzVArFPlRauguBOi+0Js2NX6LjB
         HLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912425; x=1762517225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+wNT7KW8FpybzoaA+6FfZ6C32T5hx5xiEfdag3k3wE=;
        b=MGMS9gfU8MLwUaZaDnVcCRBGJz2rrTXCMD3wtKaVRKepJQKc+1CQiKN0W+N8XhrXvV
         x7jgVujmv84V29IllKoCq31eGbx9rqWsiEF+v7OtnTw1edKSNVfbHdpPtLskpEx1hsGY
         Wphgxq//StfsfEQxtoXA5Qf0qvl1egG0K1fzCKC0xfSDF+pm27f/FVSBLpRDShAZAwWp
         GhX3yOVeTCHNQTYkPrF+AwbblSH/v+NJvNKFgxTIKeS3qRV6LA+Rs1kEHf+lTqK/N1/+
         3lH1Z3VdMQpBK8ckTde3Ya538dvPl12TXPZRjCiH+5JvlSztI+M30nr65Rdalpn60HEa
         ZDSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv3AhS7WCgQvwpwc/mlXGAa4I8D+tDVqxVPzolbW1Pk3GWZg9LUigNbSEweFCnjHdMkC/mpiZ58oEVjLsW7G9A@lists.infradead.org
X-Gm-Message-State: AOJu0YzIMxuqMHt7KwnfGjMl1cO8QcIfvtIy8DYM/cBKnyryKRoUis6k
	8pNsWdNIpjh/JR3MMO849e51yYxS07yAg6hjix7suMLrjhKI4sxY7yKC
X-Gm-Gg: ASbGncvu/135RWy9w7aVPoXwpzrtCi7LG2rcWPqvwUIzhNMkqzVWF9F3nGWu9MYYTFn
	XThUgNvKtXP71v05/JhCdv1t4Yna+UJUmHAlrtBppM5VKC6dEoBB/cdNZSWRZzSgbaDMMYZvdZs
	H5Pa7aWRr11jk5vAkRvKgLRMt8PpYFCBFnkiY0q3HcDxBrbzKAJ9eNrkasl1tUD0fLCQXZVYao2
	ps68xjTYwwYog00Dkk8tnkL3BYQ9tVkEriYHN6n1LY1tNPJyTzz9qjYiimnZbDZHa0LKGRpn/m7
	pd5Q2FF+qRVORNSLq9u0Rz/zj35Vt44NDP/xuveUmORw8NdtaEUYDopFqFtPiPuY0BrXpVF3zSR
	Cco887pfOAf+y0VeZ8vh5LE/ZHUa61dFU9DXWmcHfsinpfDJC2l8Mo4VpWveonx7450qOjCE+MK
	9FEQye4n0wES/YOz9iTSsWuzLCRmZqVflN25wXM+dmFVU2jSXtLGGFI6fJgVVVifpcesqt
X-Google-Smtp-Source: AGHT+IH/ICNj/bMV5RVGbwRdK/Ejd2emYkz7dh/g7c7spskiA/UNWUDs1dQqtabTPzVdNpWwUCQDtw==
X-Received: by 2002:a2e:8689:0:b0:36a:925e:cf3c with SMTP id 38308e7fff4ca-37a18dc7311mr10659721fa.31.1761912424618;
        Fri, 31 Oct 2025 05:07:04 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb3e70sm3216571fa.12.2025.10.31.05.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 05:07:03 -0700 (PDT)
Message-ID: <0beeacba-c484-43c0-80fb-66b2e0293681@gmail.com>
Date: Fri, 31 Oct 2025 14:07:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Maud Spierings <maudspierings@gocontroll.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
 <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
 <65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
 <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
 <20251029081138.2161a92a@karo-electronics.de>
 <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
 <20251029104838.44c5adcf@karo-electronics.de>
 <d05c62c9-7ed7-46e4-aa4d-27172741b5ee@gmail.com>
 <0667e026-99f3-4233-b3f6-e38273961d49@gocontroll.com>
 <20251030095434.1dc06df2@karo-electronics.de>
 <26fc62bb-3484-4812-b576-6640eef72c49@gmail.com>
 <20251030130006.0221957a@karo-electronics.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030130006.0221957a@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_050707_520315_72160ECE 
X-CRM114-Status: GOOD (  24.42  )
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

On 30/10/2025 14:00, Lothar Waßmann wrote:
> Hi,
> 
> On Thu, 30 Oct 2025 13:01:52 +0200 Matti Vaittinen wrote:
>> On 30/10/2025 10:54, Lothar Waßmann wrote:
>>> Hi,
>>>
>>> On Wed, 29 Oct 2025 16:35:25 +0100 Maud Spierings wrote:
>>>> Hi Matti,
>>>>
>>>> On 10/29/25 11:05, Matti Vaittinen wrote:
>>>>> On 29/10/2025 11:48, Lothar Waßmann wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, 29 Oct 2025 10:42:17 +0200 Matti Vaittinen wrote:
>>>>>>> On 29/10/2025 09:11, Lothar Waßmann wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>>>>>>>>> On 10/28/25 13:42, Maud Spierings wrote:
>>>>>>>>>> On 10/28/25 13:15, Matti Vaittinen wrote:
>>>>>>>> [...]
>>>>>>>>>>> Could/Should this be described using the:
>>>>>>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>>>>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>>>>>>>>> correctly, that might allow the driver to be able to use correctly
>>>>>>>>>>> scaled voltages.
>>>>>>>>>>>
>>>>>>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>>>>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>>>>>>>   
>>
>> // snip
>>
>>>>>>>
>>>>>>> If real voltages aren't matching what is calculated by the driver, then
>>>>>>> the voltages requested by regulator consumers will cause wrong voltages
>>>>>>> to be applied. Debug interfaces will also show wrong voltages, and the
>>>>>>> safety limits set in the device-tree will not be really respected.
>>>>>>>
>>>>>>> I think this would be well worth fixing.
>>>>>>>      
>>>>>> Before doing the real-life test I did the same calculation that's done
>>>>>> in the driver to be sure that it will generate the correct values:
>>>>>> bc 1.07.1
>>>>>> Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017
>>>>>> Free Software Foundation, Inc.
>>>>>> This is free software with ABSOLUTELY NO WARRANTY.
>>>>>> For details type `warranty'.
>>>>>> fb_uv=0
>>>>>> r1=2200
>>>>>> r2=499
>>>>>> min=800000
>>>>>> step=10000
>>>>>> # default voltage without divider
>>>>>> min+30*step
>>>>>> 1100000
>>>>>> min=min-(fb_uv-min)*r2/r1
>>>>>> step=step*(r1+r2)/r1
>>>>>> min
>>>>>> 981454
>>>>>> step
>>>>>> 12268
>>>>>> # default voltage with divider
>>>>>> min+30*step
>>>>>> 1349494
>>>>>>
>>>>>> Probably we need to use this value rather than the nominal 135000 as
>>>>>> the target voltage in the DTB.
>>>>>
>>>>> Yes. When the driver calculates the voltages which match the actual
>>>>> voltages, then you should also use the actual voltages in the device-tree.
>>>>>       
>>>>   
>>
>> // snip
>>
>>>>
>>>> Then setting 1349494 as the actual voltage makes it fully work.
>>>> Otherwise it complains:
>>>> buck6: failed to apply 1350000-1350000uV constraint: -EINVAL
>>>>
>>>> Final debug output now:
>>>> [    0.327807] rohm-bd718x7 0-004b: buck6: old range min 800000, step 10000
>>>> [    0.327813] rohm-bd718x7 0-004b: new range min 981454, step 12268
>>>> [    0.327819] rohm-bd718x7 0-004b: regulator 'buck6' has FB pull-up
>>>> configured
>>>>
>>>> I will add this fix to the next version of this patchset and include
>>>> your requested change in the dts.
>>>>   
>>> Does it also work with min/max settings in the DTS that are taken from
>>> the designated value +/- 5% tolerance margin, so that the DTS contains
>>> reasonable values determined by the HW requirements, rather than some
>>> artificial number that is enforced by the SW behaviour?
>>
>> I am unsure what you mean by "artificial number that is enforced by the
>> SW behaviour"?
>>
> The nominal voltage that is required by the consumer is 1.35 V. That's
> the voltage I would expect to set as target for the regulator.
> If that voltage cannot be achieved exactly, I would prefer to have the
> intended voltage listed explicitly rather than listing a value that
> accidentally can be achieved by the regulator but has nothing to do with
> the requirements of the consumer.

Ah. Thanks for the explanation. I get it now - sorry for the noise.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

