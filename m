Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83565C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=901214bbFIDMlHQ0CsRkyLv/Y3+WM7W7nqphYYL1+FQ=; b=fi7FeVzD9JMOJK6H04px323SxL
	aKP+SEDsGDd4O+6aqihx+/JU3tPi1gtsTVat7bFOQDa6S+TTK6hdxre9ahl4nGIZ+B+HbbzDj611A
	EPcgfsnIGClVlm1pIF1Pp6eIee7M4SMeeO23s1hY1ZeGXxm56JkcvbOflngRG5nw5mlJIncDGmDvJ
	QS1V4Bm35lHbbW5fqFXgcsClVpwlx+dix4y4aaNVCePst7YNBy/jXOs5d5nsCIM7CmY2xDEgWTMJ0
	DtPFO/z4VYfhbiMtLlwOL35k76Mo5zUyziLmeNxkK4PyJoE3FlHs5VVuuC1nAUJRdSMHOvtb9ZX4P
	uYy9K6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdIh-0000000Eq2S-3dFT;
	Mon, 24 Feb 2025 18:35:31 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdAs-0000000EnzL-2i3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:27:28 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5fe87fd0a47so243917eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 10:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740421644; x=1741026444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=901214bbFIDMlHQ0CsRkyLv/Y3+WM7W7nqphYYL1+FQ=;
        b=QH00YBKmDRgHdX20vt+5Q28O/cpBhPyVvJLw1QSfrN6ovk+dppkpl84AzB4kMb5AD5
         MY3x8DxuIhx2TARtVz5jw6KOztEhkOdbQ7MLuNXIvbL0IveHmssJvlje/ID+xacEmrRC
         P8ltmEcOcxqCjZUfK3UHd9g7wvQwU5wuw6ls0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421644; x=1741026444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=901214bbFIDMlHQ0CsRkyLv/Y3+WM7W7nqphYYL1+FQ=;
        b=vlqFd3OXYaMq0QdvuvxHqcaML4n5uvjwx9cTR9WxrVbabyNtY7IWlU7AiLDChA8Hxh
         ISUa9pWYHLo0vK9+88ISoM1Z8IXdz5c4QFyKPZEbyj0EHpPfMPFiXlDn5NKJpXKqVZAN
         d8FajGCR0utu8xZQL5qfQsh3nL7MsfQQyR2kV/nD9PHMnuPqSzic9UfyWWZ5KTgQK7Wy
         K8HPxYFaogbQllVOgda8sGMYruNqql/gN9iW96e0P/De5pJrbJ43yJgycHPhSr42oAOL
         GNK25gdYFBDmE+zB2unwzcrTfQgQ46xNf4PqFlGvqStU52h/5sXo5BPgYZhd1vwODoqO
         E6gw==
X-Forwarded-Encrypted: i=1; AJvYcCURyt90Z9+4BF/ADDUaCcll57ejr6NQ6L3zssohm32QcuKPnLP15Pfswy1TcppYyny/MOwCzCsumSJGCg6Ld833@lists.infradead.org
X-Gm-Message-State: AOJu0YyRsqHV/YLGQIxM99P6quQQJoTJaLk8j7Tzk6d4rysSvObHswYJ
	GO3n1IiU2CpfAVU4jwfQInBeteRygbWxdY86UHldsU0XTrFEItdE0Q1xjfMCyA==
X-Gm-Gg: ASbGncu7aS2W7L+NLXwvf6/vyUH3JHuIc+Ju3X9zuOX3KEbxP6E5cd1bHBKNEbzDjdm
	gIUhsq1O4qj8BJllVWVChKTkcaV/H2nZoK3dn5eqeyhK+WphC3vf90B6VQWLxyFhL+Qn5zUCTW/
	iVtMxo3FpSkyTbdwTv+2uNMWKsqCmXZtQLD7EuXfEZm2dTEpS2v9LIiQF5QUG6R/dqfA/0tNrLc
	tDX5DYnFZBeyjgImgE+FcYKdS33YSCGnpS//dtPWa2FKYr5C1k2W0+YifQLF1qCOE3mnUKAncEH
	Tkcq+YrVifQTFX4+EuHhdQCFZuWFANwIFAS5ZRSo2S/Rw3qtAqOU7A==
X-Google-Smtp-Source: AGHT+IG+dPB2VlTmr9uc+ewiu/LggnV41sFrCV6tv0+9TMUGG271b6bw+MyTgU/h2yxKq1XzGx8OLg==
X-Received: by 2002:a05:6808:1a27:b0:3f4:9e6:fc4 with SMTP id 5614622812f47-3f540ec21e5mr150728b6e.10.1740421644423;
        Mon, 24 Feb 2025 10:27:24 -0800 (PST)
Received: from [192.168.99.86] ([216.14.52.203])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f40b027906sm2952567b6e.42.2025.02.24.10.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 10:27:23 -0800 (PST)
Message-ID: <cb368f1e-4292-4738-a5d8-b716859b4beb@broadcom.com>
Date: Mon, 24 Feb 2025 10:27:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: bcm2711: PL011 UARTs are actually r1p5
To: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli
 <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Andrea della Porta <andrea.porta@suse.com>
References: <20250223125614.3592-1-wahrenst@gmx.net>
 <20250223125614.3592-2-wahrenst@gmx.net>
 <fb23aeaf-4e24-484c-a0ee-56781892fdda@gmail.com>
 <1706e1e2-f7fc-4dfc-8189-732ed6c72a2a@gmx.net>
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
In-Reply-To: <1706e1e2-f7fc-4dfc-8189-732ed6c72a2a@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_102726_736408_08417783 
X-CRM114-Status: GOOD (  12.34  )
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



On 2/23/2025 1:17 PM, Stefan Wahren wrote:
> Am 23.02.25 um 17:58 schrieb Florian Fainelli:
>>
>>
>> On 23/02/2025 04:56, Stefan Wahren wrote:
>>> From: Phil Elwell <phil@raspberrypi.com>
>>>
>>> The ARM PL011 UART instances in BCM2711 are r1p5 spec, which means they
>>> have 32-entry FIFOs. The correct periphid value for this is 0x00341011.
>>> Thanks to N Buchwitz for pointing this out.
>>
>> Should not that require warrant a Reported-by here?
> I tried to find the original discussion, but i couldn't find it. Also I
> don't know if this person wants their mail address published.

That seems fair enough.

>>
>>>
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>
>> Some people might consider this to be a bug fix, mind adding a Fixes tag?
> tbh, i'm not aware of any (real) negative impact, but yes i'm fine to
> add it.

The negative impact would that you would be more prone to see RX FIFO 
overflows under workloads where interrupts get disabled for too long. We 
have seen some of those happen in our test rack so the larger FIFOs the 
better usually:

https://lore.kernel.org/r/1692643978-16570-1-git-send-email-justin.chen@broadcom.com

I don't mind adding the fixes tag while applying, no need to re-submit. 
Thanks Stefan!
-- 
Florian


