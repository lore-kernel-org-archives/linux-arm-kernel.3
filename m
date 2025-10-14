Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA7BCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 03:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2hE9dVU4dDBKSr5RQ6ulWC8RhSPxx36Nra/5fv0QXM=; b=q10VJRxyH5u5P+rsxEFkn9FI0s
	zGciIQyVXt93OpFUKIk4IVUvC/W71FxgPwncl3+BhE0wPYZZ+jeuEEYeXiXa8yRvds6LF+PQDGWA2
	TCBqoUarR09V6431UWcdnP5LIM28GnODDvsoIeKkU7F1YFj6xyU+Dg64KnF3cHPoSsYr7WCamV11D
	mj1xKlfkabWrAZdjAT4dQ5RC+lMfVXh8HxEv4Sfa/pJDUPTcrNYUDi6/RntzfbWj4iCBSmGmdh1d3
	VYRuIQWQe3LbMdRnIlRPG481/t6W/8i/fyBa1t86InzRHVajIQjUTchxSFfNLt1LytH+qFIJxsyPl
	bAQnhxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Vxu-0000000F4Xn-1Blj;
	Tue, 14 Oct 2025 03:44:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Vxs-0000000F4X7-1iAA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Oct 2025 03:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h2hE9dVU4dDBKSr5RQ6ulWC8RhSPxx36Nra/5fv0QXM=; b=ju2YdJQbgIuJMyytoYdB3vJYQo
	p9CeaIpiTLkB2z3wxQ0xf1Ign2iXi52ym1pBFizQNxw8MtpO/hkkLnxvSKL2X8sUozWGId9rjYwYY
	NJyxhzacAoTqEBlN7UpBb464q7yFaKrXdtXikyAked3VSOGodG6GVXR6YTFmgNW6pNtx+WJ0yGGvU
	3BEbY1yn+qs2CoHjO7apvAV8/9pes9kTBXy5JjCA2S5b88J1ZvRjbsFw4lHiM+zVWAZRDhEjx1EQ9
	Qi/IVBX5PJuYhOdPMTyhGPd/YUKvdTFLtXbsS8ac++8qKIrGTtelFdUH8/oc4bhC3zyiK7ZyKqa5H
	7Wpr2DDg==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Vxb-00000004uJS-19r9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 03:44:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so2874941a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760413459; x=1761018259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=h2hE9dVU4dDBKSr5RQ6ulWC8RhSPxx36Nra/5fv0QXM=;
        b=W9IvDDfjYYpoGUUAdqpL8BfcZFvi21CD4RHEtarJRxkK0nKhvy33JhBwis0Is0TIVL
         sOPcfZVu7M6hOHJID50r4xei1O6IC0QEiH4u4fEdSc4+dIs7flS1FCeSW1M5OfdjgEdL
         WZRacyguI3LpSjdxwMaITrVdoJaDT9O5Ig3phUE1C9q6Yr9XBCHvTmjpdPIHwEs21rQL
         PBXxBwbYJYU15ufIdKJli4WHnkIuMk+O7+dUR6dB455s5ThfqBxfh9ObDuKhaL+7So81
         KbK4QRN0nkp6ufkv2bjcDktiLyEK9X+OBfmQMU7lpPdpx/In0r8tNOkuFp0gGZBXajK5
         0QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760413459; x=1761018259;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2hE9dVU4dDBKSr5RQ6ulWC8RhSPxx36Nra/5fv0QXM=;
        b=rSWl1OD8nIGC0lGMJJeKWOOAoWYAsBb0m1DMuiAXYLIpsnh6H9qhoKFv+nZV5RqhVq
         0MLoQHSIp2NOoccLk72I5zxU2KO5EgIW6zU9f5dJ3US5rpIQ1Q024PGNdnkCMC8eByIs
         8TvuA6z3gq69xF7i4Rcmqdgij5cGrf+vW9l7itIbAE2ce6fYC7vmx8wpt7HW7ahXaHRu
         wEyOmYUsITmpayX8ZVggA0oqvikvCk4J6jFkq0GXippSK9nK1mrtT2m5Ns9kXTVkDLgc
         3a8A0SuxEpDP5ldgWS5gP8JFTLSfiii9vQGfBxhatSp7z/EbWtZK2EuZJd2nZ8fVNW2a
         Q4KA==
X-Forwarded-Encrypted: i=1; AJvYcCWrTU6WzykRV0palei4b8QlDtg2jiXDbacfkyTkqVhYb1XK6TKuu7m0yoW16E3yyZSWI0PMhXY3Z3OEDT5S121h@lists.infradead.org
X-Gm-Message-State: AOJu0YxjVUAEdD024DIoNYqwFCzWcDYrvM96E6DS/j5Tvkxk5R50bvkF
	1/fv9J0/Y0mNFFM2J4N4X9tiTbqhZPUUWMmZI86UP9w6mqBzAqSBKpCw
X-Gm-Gg: ASbGnctnPKl/Bd7eEjKI1VFLsSORpWfkKrl0vptqDFz2DLKENZO/LutLETxAsJZcqxc
	YH+czg5B7/zlxgfGRFtbPNmEgTBMhFn0sBVPuFYMfQ2kttF3gWIVH9mpwLOQS1gjgn2/QuD0ijy
	PX4Sfy/bT4x8o5QEvIpdMJQTp3dnlVoHLtc3leFgtYwC00zKNDPv1QkHmcmaeq6REiSsjbzRxL9
	47nf/ApVYJQMBtcFs9ghVN1BB59MYzXFoYFuI6hGNYj4k5xEiEib6OjL5IJOGKcCa1w1Dlxe5+8
	GkUAyGkPSeBIFAoRs3MnqDx8qU2InWLZCrIThGxeJX3ayUPZui1bNiUnlYvqZzN82JjFGdMIgms
	8jVwXJJ0/wrFdtlVJw5zo7J0ebS8FdByYnMJ9PcOtyKIELNbzGzobYwo8iEKOPl7Mw29jZ6sfG4
	f2r2uBsMK3PeUokw==
X-Google-Smtp-Source: AGHT+IEZhWXWpwus8ChUcDCamrlYbdhxVRgqmS7EMLMZ6ANGP8vAcpE08Mz2FQZlW0+Zvn5ycGBKFg==
X-Received: by 2002:a17:903:19e8:b0:28e:ccd7:dd61 with SMTP id d9443c01a7336-29027305380mr282716995ad.57.1760413458712;
        Mon, 13 Oct 2025 20:44:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f961c5sm148224085ad.129.2025.10.13.20.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:44:18 -0700 (PDT)
Message-ID: <054cf209-61af-4d21-9a3b-d0f6dd24ee3b@roeck-us.net>
Date: Mon, 13 Oct 2025 20:44:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
From: Guenter Roeck <linux@roeck-us.net>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Tao Ren <taoren@meta.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net> <aO2kLyxGlGt12sKD@fedora>
 <e3dc7aee-c8af-4276-84e5-0f0c7926be05@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <e3dc7aee-c8af-4276-84e5-0f0c7926be05@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_044429_092801_BA5C4E90 
X-CRM114-Status: GOOD (  19.63  )
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

On 10/13/25 20:20, Guenter Roeck wrote:
> On 10/13/25 18:15, Tao Ren wrote:
>> Hi Guenter,
>>
>> On Mon, Oct 13, 2025 at 05:20:57PM -0700, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
>>>> From: Tao Ren <rentao.bupt@gmail.com>
>>>>
>>>> Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
>>>> duplicated code.
>>>>
>>>> Fuji-data64 and Fuji are identical except the BMC flash layout.
>>>>
>>>> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>>>
>>> With this patch in the mainline kernel, the Ethernet interface I use for
>>> testing does not come online when loading fuji-bmc in qemu.
>>>
>>> Reverting this patch fixes the problem.
>>>
>>> Looking into this patch,
>>>
>>>> -
>>>> -#include <dt-bindings/leds/common.h>
>>>> -#include "ast2600-facebook-netbmc-common.dtsi"
>>>> +#include "aspeed-bmc-facebook-fuji-data64.dts"
>>> ...
>>>> -&mac3 {
>>>> -    status = "okay";
>>>> -    phy-mode = "rgmii";
>>>> -    phy-handle = <&ethphy3>;
>>>> -    pinctrl-names = "default";
>>>> -    pinctrl-0 = <&pinctrl_rgmii4_default>;
>>>> -};
>>>
>>> I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
>>> interface is now disabled. Adding it back in fixes the problem.
>>> Also, MAC3 is explicitly enabled for fuji-bmc in qemu.
>>>
>>> Was the interface disabled on purpose ?
>>>
>>> Thanks,
>>> Guenter
>>
>> The mac3 interface was removed in the latest patch (v4) per Andrew Lunn's
>> feedback, because the rgmii setting is incorrect.
>>
>> I was planning to add mac3 back as soon as rgmii support is properly
>> handled in aspeed mac driver, but kindly let me know if you have other
>> suggestions.
>>
> 
> All I can say is that it worked just fine with the qemu emulation,
> and that it is broken now. Since it was broken on purpose I guess I'll
> have to find a workaround or stop testing network interfaces with
> that emulation entirely.
> 

Ah, I see that mac3 was the only enabled Ethernet interface on that system,
so you effectively disabled networking on it.

I don't claim to understand the logic (how can anyone continue to use this bmc
without network interface ?) but I guess it is what it is. I'll stop testing it.

Guenter


