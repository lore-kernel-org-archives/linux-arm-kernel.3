Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE92ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSEdxW8vhqoLFw4XnO2RSQdydgt5roCSWClRMQwsv5Y=; b=GcMALfbfPSZBC8XBDwkhbI/8px
	Y3wD5ZYkDZzSsKc7cX0czHOIktmN6s/5adSrGAnQpDPSRZ6VkRVtj3OV16YZ6zETEEIWa/1XHLXY6
	ulsNvqoSTmbnye1inz/SRa8nNTF3YCkDeEZp9SyGMGOHsSE5T0TIwMtomFaR+9MUjVM6zHnbjbU6d
	cN+RTOHBknS8TSJysu0fofrgGwa7MQ48x8AtnRyITRA9r3KMfybsbRrIP6ldODGRucUdWSgyu5QkQ
	O6EEnC7kEaQgFba7npXwU2bSUtAfTcwg604jMuyfNRdB/DVmJsRnLlRzpgtfC/btv92NdZpSeJp2Y
	PG14sw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gL3-0000000GgGc-2zl2;
	Tue, 14 Oct 2025 14:49:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gKz-0000000GgGD-0wzo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 14:49:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-267f0fe72a1so40032985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453356; x=1761058156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WSEdxW8vhqoLFw4XnO2RSQdydgt5roCSWClRMQwsv5Y=;
        b=ObZwB1Z+iHBYIjbI3BNjBo2y3xTbyWvHL+CBzzN9X8PtmY/ATkN4RYXLXqCz1U6RoL
         MdX3piTM1975G1acWpc3DU6iFfplzY2q7Hd/UDqvJzHsITI4wqE06eDnluVZx9tA7SU9
         +v67nEdAThtvN4C2Z3W3gUzX1TeUaFlqWIfIgszhy8Li5EZALATDSsE95vpqXqqWt9jC
         F/N0cHZyqfWb/lKRwqrIRSmZL8fGIHZN5DFMzVYGYIQDt7DoXP6ZfE9v+qnf6xzsIufy
         f2+PVpfyN5NyzhwHJwsmiyY3yrYCdan7Cc9SpXIPIZM/d7hlsFd6WqbvQ+dErAOqlOqT
         WLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453356; x=1761058156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSEdxW8vhqoLFw4XnO2RSQdydgt5roCSWClRMQwsv5Y=;
        b=EHNJZwObmml8lIO2fm1mAViKg4Aohl0G+Q9cnX6GxTxj/FVj4/Ns3fFO00mhzMsKXi
         dwrjNo1y4YvmwUupSb7Zz/Rf8oFS6WipEblAO2HHvfKN4sgchQOe3oWwq0qJPvs3J1mf
         VYl6+PzyjQxUfFTZGIIgHQXc5tbphq8ZjLJSef3S5kf16osDKq1Ww/Esfqnz9BpdnkbF
         VhuesPcoGr2x8uGh1EU4P0tbM6pfrZBQ+D1EUJDLtnL5KgFtRoCVLvysbOK412OI3YSk
         VTTMLaDOv9PvsBalmAsg9f/BQVcEN5xZhbecDQCCXvgARSCuiDbOpccke+QR6nFO6a87
         ia6g==
X-Forwarded-Encrypted: i=1; AJvYcCVV6rGwuEnKs0TsKpL3MWTfJ/pP8BTAsDnt1bn4T1NfIHkKfH8Pdm0uwzB8I2Rjh98GEW/pBujbW2TXO9/pCXqf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtlz9ew7h7yyxmvKrkPFFKOuhWqTHKuGYRiEJwUATYi9puklCq
	8ZdG4fGvWtXeX4VlG0Ycc/uydHyz0lkwZu9+ipXUXvVVOkS/V09YnHFg
X-Gm-Gg: ASbGncuowvy006h30ckrwxLtsckNyIZnMXCfH2nGtevsx1W4nq56V1PZSaJHli2hFY9
	5GjK9fqVZArXGcPTK/1O3YuYmziv7gLUFZ51QfmmtgP3fwjdZhqF09iuN5i4ShvJ4nZ0REq8TDm
	wLItDRhIMxhVErICCFZxSo5TPr9Egqm5IK/qdYHwtO2NaUFlQcUBk/GH/V7f7y0bjZmnrQAE2WP
	bNmapenhz/G7cuoxTlHOdKQy28LjQN+pX49K5SC42/fTJe5xJwiISm7uYDmA9Z8w+5WXu83L8Vo
	9C++XDwGULnr/0jNZ8w1DRpjcpFZbELbF4K2ZIoKmlJmBQWMPpsCUPcVhfHQG3kM2LyY18OThIC
	P90xA8Prt06L/wOrW49ntrnp8OzoDQEQxB8UyumrZFtq95B98naQ/3reF8OfvlVlOpNhYUjlNWA
	iu1+c8a7URQGbebA==
X-Google-Smtp-Source: AGHT+IHRMZjidw1IlMPsFc5xiHiThksQokSbYFWWjCCXkhTX53XdUxvSbAMrz6e0Awv6re5tpQfvqA==
X-Received: by 2002:a17:903:17cb:b0:290:7803:9e8 with SMTP id d9443c01a7336-29078030e8cmr41790895ad.48.1760453356132;
        Tue, 14 Oct 2025 07:49:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f35382sm167317035ad.85.2025.10.14.07.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 07:49:15 -0700 (PDT)
Message-ID: <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
Date: Tue, 14 Oct 2025 07:49:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
To: Andrew Lunn <andrew@lunn.ch>, Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tao Ren <taoren@meta.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net> <aO2kLyxGlGt12sKD@fedora>
 <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_074917_282661_C2E8CD19 
X-CRM114-Status: GOOD (  19.94  )
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

On 10/14/25 05:08, Andrew Lunn wrote:
> On Mon, Oct 13, 2025 at 06:15:27PM -0700, Tao Ren wrote:
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
>>>>   
>>> ...
>>>> -&mac3 {
>>>> -	status = "okay";
>>>> -	phy-mode = "rgmii";
>>>> -	phy-handle = <&ethphy3>;
>>>> -	pinctrl-names = "default";
>>>> -	pinctrl-0 = <&pinctrl_rgmii4_default>;
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
> 
> If it is already in mainline, i don't care too much if it is wrong. We
> don't want to cause regressions.
> 
> I only object when adding new nodes which are wrong. If we keep adding
> broken nodes, there is no incentive to fix the broken driver to do the

This wasn't adding an allegedly (sorry, it worked for me) broken node,
it was removing one that worked for me all along. Obviously I do not know
if it worked (or if it is even used) on real hardware, but it worked for
the fuji-bmc qemu emulation.

Guenter


