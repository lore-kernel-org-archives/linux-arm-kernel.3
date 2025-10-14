Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B4ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 04:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JQUsZzfMdSbr2YfhigERer1vfyxYhaVTqb/kc0tYoo=; b=zknEySNoyyEkgqdsGeSLEWHklk
	NEcgfAVzrd2xNaLgLo/mqacsv7a7S+JNa3WwZTfOad/o4cIQsidzTIpfIunHEl7dqBio99lhJfrUG
	PseSVOjDR1ttedRs/JkTyvoU08hqMVaII1mYuyibzRhl6oyMrWkdh9pgFdUPNjSabxJmZn7yv+k09
	6iwdrRBq9ClwABFltFJh9/Lp3mY6dEqo8qWksF55yk49NYMyJQUauaqbUeNUVLznfBZKY1crih4dl
	L47sB9o0XDw1hJbhvmclGe3xRoBXRV7U2k/DMOIuZXQN5fHsY9MVpSK5Fvb+zYeeELBQ5GGFfR5O1
	XTeOhQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8WlI-0000000F7Ki-1KQh;
	Tue, 14 Oct 2025 04:35:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8WlG-0000000F7KM-1sS2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 04:35:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so6919180a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 21:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760416545; x=1761021345; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7JQUsZzfMdSbr2YfhigERer1vfyxYhaVTqb/kc0tYoo=;
        b=GK2Bb5BSsoa+7bzBlbUTsZOBrErTZqTBF5fILng00NKUkav9F+gYwMcOcWEVdZ61DE
         ZgXuDcmFRHZstJUwzHEwREF/ycZCINfyfMya8RMv2DQZ51681OnsjbuN8PVU0q9yn9N6
         dcHV71+j08S8yczrciyEJ2qp+Kfyte8aD6KabkhcZXsC6IF8hwgkbgWtsWQbShH1D4ZK
         mHk+1oDsO7ri872idoUoNbHh4S+zHu0IvLmm8Uz0YwQdlMVeakccj5NYa+c/yPup0m29
         qhRM+g4/NEi3p228yfq6TYnUvs+lgrCxY0NQOOjf6y/7iIEofNyQ+qedp0Jb3ASvUH1w
         tSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416545; x=1761021345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JQUsZzfMdSbr2YfhigERer1vfyxYhaVTqb/kc0tYoo=;
        b=Xtv106AQ78pWfFk/YziLTqtOZJ5Nb8qV4ThlcZePKZ6c9X8cgLtHX4IG2jBeYMrsDH
         +faMFcwa9PNSpClcj0Apd3AtzRK27HgUtySfL1Vby1QQuFtSg3DX+bvN15aP4rKVFsQc
         imtH4IsmL6NRuG4G4qZXRAHVHOZfS0nXLEA+iGi5xHppnn+Rd1QI7De8vBj0JN64283K
         iyJKAmryYkSnCdA1GCNyXTMpnRoAAhsNL4EgP8jovvU5BpeieeR4hQoLIQJL7jLdlAJZ
         CsqNJ8mWTBZA4vmD5GekddzEUfZcJkNjZH0dZCpzVawnH25eSwNZ7Wx7hXs5lzbTRpZ/
         XhZw==
X-Forwarded-Encrypted: i=1; AJvYcCVn7a4kUW+B/KWZePGVRFjwFWdIk3cunWjvZeMF4ZEGmmFmG03X8/UwGfVszjdlUIpA2fiOzEgv7CErkHDlQOgY@lists.infradead.org
X-Gm-Message-State: AOJu0YylnKOHjKt7eYUwVNIytDOj2yFzdwBxa/wUZwUb/ELNskc1+PN5
	TlSkoqWlzfeZszgC6O1UwnX7FkAH3vpucywjsTtF5/HZIcgSzp502i9H
X-Gm-Gg: ASbGncu7iGXY9daZAXghPrkexa5XNSQvZz5osLGEgnoIb92xplEn0w9rY7AFVy9ZJBy
	HD7Nl/xF8StXYXqfL4dckPWB/MwProRlEZJeT1t2ZS5qpZi4QcA43MZVup/WNMcui+iwr7gegJS
	lmCBIjTGCORi4CesxBzC5v7llpv+urVbS6A5ogGChU+51HYlX8q+2SoW1P84xSKaGRf6VB++jlI
	+Jjt8CCZxcw7+uXx+2K3OF3Hb3F+ibTyS7H/xpezdB/KXdin/5N1x9Lqr+/KqXaHWy6/v7CIaNW
	GmkCoEz4tuqjeE2sRsKYaRxrllPEvTPTz8OiesoO2CwhGnw7Ja5t9vMr6ecbpqCUEAbZgrmvBPd
	rEhFJ2AsITVv7S4HreCcoROckl9sAgbcU3mEHSKoU8vzVMm7f/D5u+VGXgIEkig4VNOrhgATw37
	ulA+7n30GwDBHMER6OlKZdxf6f
X-Google-Smtp-Source: AGHT+IGhDHawC3MkQ4YAyLlsEm3b6W7BIxoNI2FhDwZZJHSH2UowbYagb3+VKa1PMADrFu16wiqV9A==
X-Received: by 2002:a17:90b:1d09:b0:330:6f16:c4d8 with SMTP id 98e67ed59e1d1-33b510f9064mr36496258a91.7.1760416545365;
        Mon, 13 Oct 2025 21:35:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09aa20sm13439262b3a.39.2025.10.13.21.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 21:35:44 -0700 (PDT)
Message-ID: <04dbdd20-69c1-48fe-9bc7-7e9ffaedbe9a@roeck-us.net>
Date: Mon, 13 Oct 2025 21:35:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
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
 <054cf209-61af-4d21-9a3b-d0f6dd24ee3b@roeck-us.net> <aO3M90Ycp2DWyFuk@fedora>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aO3M90Ycp2DWyFuk@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_213546_517667_C268C3CF 
X-CRM114-Status: GOOD (  24.05  )
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

On 10/13/25 21:09, Tao Ren wrote:
> Hi Guenter,
> 
> On Mon, Oct 13, 2025 at 08:44:17PM -0700, Guenter Roeck wrote:
>> On 10/13/25 20:20, Guenter Roeck wrote:
>>> On 10/13/25 18:15, Tao Ren wrote:
>>>> Hi Guenter,
>>>>
>>>> On Mon, Oct 13, 2025 at 05:20:57PM -0700, Guenter Roeck wrote:
>>>>> Hi,
>>>>>
>>>>> On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
>>>>>> From: Tao Ren <rentao.bupt@gmail.com>
>>>>>>
>>>>>> Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
>>>>>> duplicated code.
>>>>>>
>>>>>> Fuji-data64 and Fuji are identical except the BMC flash layout.
>>>>>>
>>>>>> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>>>>>
>>>>> With this patch in the mainline kernel, the Ethernet interface I use for
>>>>> testing does not come online when loading fuji-bmc in qemu.
>>>>>
>>>>> Reverting this patch fixes the problem.
>>>>>
>>>>> Looking into this patch,
>>>>>
>>>>>> -
>>>>>> -#include <dt-bindings/leds/common.h>
>>>>>> -#include "ast2600-facebook-netbmc-common.dtsi"
>>>>>> +#include "aspeed-bmc-facebook-fuji-data64.dts"
>>>>> ...
>>>>>> -&mac3 {
>>>>>> -    status = "okay";
>>>>>> -    phy-mode = "rgmii";
>>>>>> -    phy-handle = <&ethphy3>;
>>>>>> -    pinctrl-names = "default";
>>>>>> -    pinctrl-0 = <&pinctrl_rgmii4_default>;
>>>>>> -};
>>>>>
>>>>> I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
>>>>> interface is now disabled. Adding it back in fixes the problem.
>>>>> Also, MAC3 is explicitly enabled for fuji-bmc in qemu.
>>>>>
>>>>> Was the interface disabled on purpose ?
>>>>>
>>>>> Thanks,
>>>>> Guenter
>>>>
>>>> The mac3 interface was removed in the latest patch (v4) per Andrew Lunn's
>>>> feedback, because the rgmii setting is incorrect.
>>>>
>>>> I was planning to add mac3 back as soon as rgmii support is properly
>>>> handled in aspeed mac driver, but kindly let me know if you have other
>>>> suggestions.
>>>>
>>>
>>> All I can say is that it worked just fine with the qemu emulation,
>>> and that it is broken now. Since it was broken on purpose I guess I'll
>>> have to find a workaround or stop testing network interfaces with
>>> that emulation entirely.
>>>
>>
>> Ah, I see that mac3 was the only enabled Ethernet interface on that system,
>> so you effectively disabled networking on it.
>>
>> I don't claim to understand the logic (how can anyone continue to use this bmc
>> without network interface ?) but I guess it is what it is. I'll stop testing it.
>>
>> Guenter
> 
> Sorry for the inconvenience.. I have to take a local patch to enable
> mac3 in my environment, because as you said, it's not useful without
> network interface.
> 
> Meanwhile, I will need to work with ASPEED to enable rgmii delay support
> in the ASPEED MAC driver so I can add mac3 back to the dts. If you are
> looking for a similar platform for testing, you could consider elbert.
> 

AFAICS aspeed-bmc-facebook-elbert.dtb does not work with the fuji-bmc machine.
The console interface or wiring seems to be different.

As I said, I'll stop testing the network interface on fuji-bmc. That reduces
test coverage, but there is nothing I can do about that. I already made the
necessary changes in my testbed, so from my perspective the issue is closed.

Guenter


