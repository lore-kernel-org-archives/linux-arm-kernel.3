Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EDBC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hc/ZqEmmixzSD5Bu7Z0mbu3TO+Ae4GIVwW02q/UqdSc=; b=shiN1tcIareHfeaUuMGCfRkhkF
	2iJNBq/4NIaKc+7NQIZ6CLrDPYCMyeqK66w3N7Wdy36ArdX+kdFTu8e9WTkkNtWp6vLsRjG3f6zsr
	HZt1bmdRVmf1wGWNGygmtMMEqp5LojDbeRUFmB0A5etQdYXn/OJPjmHQY7XLnWaxeUrOQ20votjfm
	IAnNwiEEFhlCXQO34yk1XyvgiGO026z8eBAqcisCHYpM05PEOxAFWqdzMA8ffB1BFsfvpUgp5/tiA
	nSea1vyn5gEEmLy3DItm6QhGztpw2MTFuEGna0Y11viuTqHuD4mYEjH/hPQaJE0HGIFnDylX26e5p
	uQ2AyH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuoP-000000061Dt-18Xl;
	Mon, 20 Jan 2025 16:39:41 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuj9-000000060Lh-1DBP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 16:34:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216401de828so78417875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737390854; x=1737995654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hc/ZqEmmixzSD5Bu7Z0mbu3TO+Ae4GIVwW02q/UqdSc=;
        b=FAwG8zgsezCxDbEBkmgyFpW4MKCI6jRSiZyUeTMfZWwHDd1AzfF8GAHt/uQF2iYD54
         4YhxJ569lO8RjtbaxCmPXnVrze8BEqhJL+yRPvJVAmIHZnNQ728axj66RiHr5WIBIr3S
         I7LxGJDaYpzHSAkYGnPFOxlIxdc1l8lUIg4WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390854; x=1737995654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc/ZqEmmixzSD5Bu7Z0mbu3TO+Ae4GIVwW02q/UqdSc=;
        b=ZmXicswSqFShXrU8FRdWgwaVBk+PN8FKDGJz4DlAwj6eE2SwW3UUzS+GnUKxZ09MNv
         41Zz+RIXPPtRL9WELkl0R/9skexYeXhjp49o/tZ6WiWZB6Un21fpO4ebHO3+lo0xkTL2
         t6iQ27Th0pNyT5bPgNjyZIPTXYxfyayeL4nmYwExwv43Q2SMvlPpLH/SWsPGW2bp5x+H
         waPsBJrHORnJon9FGVwLL3nzZpp/ZnBloMvHHLkOFZqGX5+hlr3GaWZ36N0YnWtlsCA/
         7MGcpvf6euPvD2S2MzG6148ySTkbUPysuxKXYA/4MiSypc8fOR9QPWFjBF/uIo/qHwI1
         HSsg==
X-Forwarded-Encrypted: i=1; AJvYcCWmOYRHTgofy/aPyZq0p8UE1GemkcYHt6XQPLPsdpp5VXM51IjXxyIGkaDXUUCzpUoUJEOf+fgtCESkbruGthY3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ITdbm+dfibsPs5UnawfHtE+ChndWhf+04TX2MUlO2p5MqUNN
	zjce4IfbKVMXjTQdTG52ylsvX02SIyRsHXTW0aDn5/MZ09cxgN5Id5r6hDQzBA==
X-Gm-Gg: ASbGnctzbjd9Zb80eK8Kz+XMz7+snzc87pcwoFW1jdkdAECsSmhHhothpwPBKG5fPNx
	YMPWFEBjl8DeM6WeP0Gq5H/GBxLJX7GnzFohqh9Ybfge3xMoQz3r8/Esu02lEzw+zZVd8IFYfSU
	R+YzBHSboHpLocxydL85CUsugsFGjXA7kjxtHpirec3iciCQw7TqQUststiOgECnJjUVv6dhW06
	AO/DBOs5lXwyysSyLj26YZ64KirxsJ9u0yY4B5eFLeAZTYsxKMeOsyI0eJgzO124Qqd1S9W783I
	Add8OJAuNqNZAq1njI0tr0OHhMrJMLhqecjH3hfenkhs
X-Google-Smtp-Source: AGHT+IGFknju+kWVSBOp9BPZgBBPSVkuNeYiYnQdiNz8F7xrFuFxwOdpgjSGtaYldVORL1NpfOAfKg==
X-Received: by 2002:a17:902:c411:b0:216:84e9:d334 with SMTP id d9443c01a7336-21c35577e88mr191930655ad.33.1737390854386;
        Mon, 20 Jan 2025 08:34:14 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea2014sm62571685ad.41.2025.01.20.08.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 08:34:13 -0800 (PST)
Message-ID: <5221f64e-fda4-4daa-add7-1d0b26765113@broadcom.com>
Date: Mon, 20 Jan 2025 08:34:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use
 firmware clocks for display"
To: "H. Nikolaus Schaller" <hns@goldelico.com>, wahrenst@gmx.net
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
References: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
 <808a325f-81bc-4f5d-8c07-fa255ef2d25a@gmx.net>
 <8F33BB1D-2210-421B-A788-8484C23DF4C6@goldelico.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <8F33BB1D-2210-421B-A788-8484C23DF4C6@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_083415_334490_4866E246 
X-CRM114-Status: GOOD (  18.96  )
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



On 1/19/2025 7:04 AM, 'H. Nikolaus Schaller' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Hi Stefan,
> 
>> Am 19.01.2025 um 01:36 schrieb Stefan Wahren <wahrenst@gmx.net>:
>>
>> Hi,
>>
>> Am 18.01.25 um 17:27 schrieb H. Nikolaus Schaller:
>>> This reverts commit 27ab05e1b7e5c5ec9b4f658e1b2464c0908298a6.
>>>
>>> I tried to upgrade a RasPi 3B+ with Waveshare 7inch HDMI LCD
>>> from 6.1.y to 6.6.y but found that the display is broken with
>>> this log message:
>>>
>>> [   17.776315] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_drm_unregister [vc4])
>>> [   17.784034] platform 3f806000.vec: deferred probe pending
>>>
>>> Some tests revealed that while 6.1.y works, 6.2-rc1 is already broken but all
>>> newer kernels as well. And a bisect did lead me to this patch.
>> I successfully tested every Kernel release until Linux 6.13-rc with the
>> Raspberry Pi 3B+, so i prefer to step back and analyze this issue further.
> 
> Yes, I would be happy with any solution.
> 
>> What kernel config do you use ?
> 
> a private one which enables application specific drivers.
> 
>> What is the value of CONFIG_CLK_RASPBERRYPI ?
> 
> CONFIG_CLK_RASPBERRYPI is not set
> 
> I checked where this is defined and it is in bcm2835_defconfig and
> multi_v7_defconfig by
> 
> 4c6f5d4038af2c ("ARM: defconfig: enable cpufreq driver for RPi")
> 
> which hides this requirement quite well and got therefore unnoticed...
> 
> Setting CONFIG_CLK_RASPBERRYPI=y makes HDMI work without my proposed revert.
> Tested with v6.2.16, v6.6.72, v6.12.10 and v6.13-rc7.

I have been burned before by something similar and came up with this 
patch series that I should resubmit after addressing Conor's comment:

https://lore.kernel.org/all/20240513235234.1474619-1-florian.fainelli@broadcom.com/

Essentially, it removes the guess work, all you have to do is enable 
CONFIG_ARCH_BCM2835 and it just works, which is how it should be IMHO.
-- 
Florian


