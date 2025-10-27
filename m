Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A8ECCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehs8czoQPjVKOHqW4ZFLgwuoXf6oH7SJucxSNVSnhpo=; b=Y2kHZSBBy3xky4y+SC8NTdJTtM
	E4TRa+BboWGT88n2y7XNoUmM9FOjDkuWpITBx0dm1Nc7QYQu8Vd/jknJlp6nsQgv25lSFOTTaGd2i
	bwipNlSvBeDhtWayMM7GAmfYckzkymIOSufNt1yQHTtZCBiCnjhphCX2pBGNy3cbhExptYitx8rm9
	h0gH0rVUsQYz0KyrwjTm7iiOrfbAaK6h1RDAa61eHxoucif8XJSjyOq1D+Z4zaQgFbnAW0Eav/fmG
	/Ft/Pedd6M/rVkGGTsOtlPwA9lWFcxdF0quLNHTPgfbL35QuzD7DptcD5BYgzMBub2+BnNLZdtVry
	RIkK8ffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJNH-0000000DVda-041U;
	Mon, 27 Oct 2025 09:18:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJND-0000000DVcr-3src
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:18:45 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so8358279a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761556722; x=1762161522; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehs8czoQPjVKOHqW4ZFLgwuoXf6oH7SJucxSNVSnhpo=;
        b=LpHK0p57EwRnl//tGZqffC9306ygx68Vw5ip1YYzDNH5IDPwcV9RNl3HXTVh0bwaiy
         Hyynt+hLZvBH9lYOgcyL9E3j0OWv8s7EbsK6rV+dHFuNbtjIXceDyS8OP7x2mqEfpyfe
         eUyFZJpeWBU680XMWup6RSEZduRdCGhMQFxB5wwsU1ToQ1cFltcCQqeljryfVGSrkSG7
         ITrzgaCNZzTbOlNizTfLz2kz7KBiP3FbXkPUsZEkXbvETlhzC/4uMQQEKoAMJyeUQgMC
         3EDZFc8IH0cOif2xEKJkDbcK4pAtAt3a8i+Y49aJXt/05IQs1IA8OYFZ6p0d39atUlVR
         oFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556722; x=1762161522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehs8czoQPjVKOHqW4ZFLgwuoXf6oH7SJucxSNVSnhpo=;
        b=GDnD9nGaPLek7YHvdQGBw/HHyx8H0NOmQ6FTPaaqmnqMDt8LqoBXvf8HBwy585hh8T
         Esu1stMBHiHgRN+dN2xz5UD/E+kWNyRpN2zzg9I4UXUqwXwNwOfc3YjdiIvXtLtBFO/J
         dPixok7SdhKmvBNwY/JJLmz/0L2Y7ksKd84TFw63UYHsG+nwyTb4cFWIV1J5FO3rcTTr
         1bCTDXmBpruoaCsOKJiBXyjx7HRqCEqO3qkVX40XTqrZWhaO8wYke9cv2L/l7LFudMo9
         mW9hljFx2BeFCJvcpjOVvuDQkc3DuQ3gf1wTLFCfuEiGmzoirtdFr3Ig7uJqPv2cjTq1
         rWvg==
X-Forwarded-Encrypted: i=1; AJvYcCW+aZM1LdpC2zAiDxC2V5JUfbakMQRkX7FbwRqF501xqB3CwYkg2C9tVamAQaInbW9WgeYsEUtdZfuWAWA4+O0t@lists.infradead.org
X-Gm-Message-State: AOJu0YwIjoPflCS0rzYSlYa1nGwq+sbmAZOUQda54uPN4mKCRkpOH4Hz
	ddYwNRZjR3epU3JdhP1XL3Puf4X6SNkIuF2EQdTnPOhgRZxOZxMbQLkH
X-Gm-Gg: ASbGncsnrWg0URNyXjNES7T0MYLuEgyTT4SYHaWz+cTzhR8RxK4uGJV/eUc1ReVElZh
	K7VC1Eg959kOm3lIC/D7traQ9J27IwIDChCtdwB0GCQksQyTlvyP2Psqz9akKROKXBg96clWbPH
	pHtUs2aSroHIrAw6yfSGfUdmTSjThvjQ8+RqGKbhP1ZD7uwkJsxq5pkUZ0f2Ac7o0ZbhgHaSHEg
	qaiCP01VAlQOP6z2rb3tz2x5CxH4fFJOPdGxHixMJ58LjfRXGd+JX5ywJc5Vk7F7bZy2T7+vT30
	+5Y9QFWljaZsx1I0nw9FcI0ITgJwXiuwliRvu/3BTs6GrtZnhDI1DOC3982yf4tiGtvaGL/PMVq
	76KZaXkNgp4xOQZMkI2aZvDems4gmruakF2fD1Z3CIR+4EnvCM5OfqTSeSNZhbkgI7377yfiP4p
	tbKoRCIzUUlEN5nogk4vNBBoVUvPekVG0Orw12dXDw9J+Kgqh8JaTjNaODvuJyKEfXvQoa
X-Google-Smtp-Source: AGHT+IESiBzo8z/tHlQ7I5VEkOfigXvoHYj6wHPdrwNr6qgyel91D2wbArQpcNK3kTl+H1frH3DoZA==
X-Received: by 2002:a05:6402:34c5:b0:63c:1e15:b9fb with SMTP id 4fb4d7f45d1cf-63c1f6b4d28mr36374925a12.22.1761556721921;
        Mon, 27 Oct 2025 02:18:41 -0700 (PDT)
Received: from [10.0.1.60] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef95e81sm5781449a12.21.2025.10.27.02.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:18:41 -0700 (PDT)
Message-ID: <e60ec752-df05-4ad8-bc18-2ad68a6d745e@gmail.com>
Date: Mon, 27 Oct 2025 10:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <20251027072749.GA7811@pendragon.ideasonboard.com>
 <341f56de-9dde-4c44-9542-b523e1917dcb@gmail.com>
 <aP80y6hQmCnxDoeC@shell.armlinux.org.uk>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <aP80y6hQmCnxDoeC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_021844_005383_C63E2BF3 
X-CRM114-Status: GOOD (  32.79  )
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



On 27/10/2025 10:00, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 09:47:53AM +0100, Emanuele Ghidoli wrote:
>> On 27/10/2025 08:27, Laurent Pinchart wrote:
>>> Hi Andrew,
>>>
>>> Thank you for your quick reply.
>>>
>>> On Mon, Oct 27, 2025 at 04:08:42AM +0100, Andrew Lunn wrote:
>>>> Adding Russell King
>>>>
>>>> On Sun, Oct 26, 2025 at 02:29:04PM +0200, Laurent Pinchart wrote:
>>>>> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
>>>>> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
>>>>> devices produces an interrupts storm. Disable EEE support to fix it.
>>>>>
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> ---
>>>>> The exact reason for the interrupt storm is unknown, and my attempts to
>>>>> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
>>>>> understand, the DWMAC implements EEE support, and so does the RTL8211E
>>>>> PHY according to its datasheet.
>>>>
>>>> I believe for DWMAC it is a synthesis option. However, there is a bit
>>>> indicating if the hardware supports it.
>>>>
>>>> The PHY should not be able to trigger an interrupt storm in the
>>>> MAC. So this is likely to be an DWMAC issue.
>>>>
>>>> Which interrupt bit is causing the storm?
>>>
>>> That's where I hit my first wall :-)
>>>
>>> I've tried to diagnose the issue by adding interrupt counters to
>>> dwmac4_irq_status(), counting interrupts for each bit of GMAC_INT_STATUS
>>> (0x00b0). Bit RGSMIIIS (0) is the only one that seems linked to the
>>> interrupts storm, increasing at around 10k per second. However, the
>>> corresponding bit in GMAC_INT_EN (0x00b4) is *not* set.
>>>
>>> The ENET_EQOS interrupt on the i.MX8MP is an OR'ed signal that combines
>>> four interrupt sources:
>>>
>>> - ENET QOS TSN LPI RX exit Interrupt
>>> - ENET QOS TSN Host System Interrupt
>>> - ENET QOS TSN Host System RX Channel Interrupts
>>> - ENET QOS TSN Host System TX Channel Interrupts
>>>
>>> The last two interrupt sources are themselves local OR of channels[4:0].
>>>
>>> I ould suspect that the LPI RX exit interrupt is the one that fires
>>> constantly given its name, but I'm not sure how to test that.
>>>
>>>>> What each side does exactly is unknown
>>>>> to me. One theory I've heard to explain the issue is that the two
>>>>> implementations conflict. There is no register in the RTL8211E PHY to
>>>>> disable EEE on the PHY side while still advertising its support to the
>>>>> peer and relying on the implementation in the DWMAC (if this even makes
>>>>> sense)
>>>>
>>>> It does not make sense. EEE is split into two major parts. The two
>>>> PHYs communicate with each other to negotiate the feature, if both
>>>> ends support it and both ends want to use it. The result of this
>>>> negotiation is then passed to the MACs.
>>>>
>>>> It is then the MAC who decides when to send a Low Power Indication to
>>>> the PHY to tell the PHY to enter low power mode. The MAC also wakes
>>>> the PHY when it has packets to send.
>>>>
>>>> A quick look at the data sheet for the RTL8211E suggests this is what
>>>> is supports.
>>>>
>>>> There are a few PHYs which implement SmartEEE, or some other similar
>>>> name. They operate differently, the PHY does it all, and the MAC is
>>>> not even aware EEE is happening. Such PHYs should really only be
>>>> paired with MACs which do not support EEE. An EEE capable MAC paired
>>>> with a SmartEEE PHY could have problems, but hopefully the EEE
>>>> abilities and negotiation registers in the PHY would be sufficient to
>>>> dissuade the MAC from doing EEE. But i would not expect a setup like
>>>> this to trigger an interrupt storm.
>>>
>>> Thanks for the explanation, I read documents to try and figure out how
>>> it worked and didn't find such a clear and concise high-level summary.
>>>
>>> I'm not very experienced with ethernet, but I can easily test patches or
>>> even rough ideas on hardware.
>>>
>>
>> Hi Laurent,
>> I had the same problem, interrupt storm plus link instability with dwmac.
> 
> You never said that in your patch description. You said "it causes
> link instability and communication failures." Have you investigated
> what the cause of the interrupt storm is?
> 
>> I found out that 2c81f3357136 ("net: stmmac: convert to phylink PCS support")
>> commit is the one causing the problem to me.
The correct commit is 4218647d4556 (“net: stmmac: convert to phylink managed
EEE support”).>
> You claim this commit enables EEE by default. It does. However, stmmac
> _before_ this commit enables EEE by default as I've already explained,
> quoting the old code which effects this. I've asked you to test
> further. So far, I've heard nothing back.
> 
> What has changed is that we no longer do anything with the RGSMIIS
> status, and in theory keep the mask/enable for this disabled. Howeer,
> that is a subsequent commit.
> 
Hi Russell,

Sorry, I made a copy-and-paste mistake earlier.


I identified it through a bisect, and reverting this commit (or disabling EEE)
resolves the issue I’m seeing.

I’m continuing to investigate further to understand the root cause.

