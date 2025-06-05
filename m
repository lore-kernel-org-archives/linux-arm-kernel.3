Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A9C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8Q01zwWnDH2jcws9vUi105eGLMi3lYwKgILJyKyZOU=; b=yFv3u9KidKzWf81HSh7GOazAId
	6jPVgESyP1Dmw90x6biK1P9MGDmdokEW22tZwliN1eV1LevjjS7BQmnNTZdiynPbjfXpMsZsp8caM
	1h0YaqU247aFCJv9IIyIJrq4tsE1j1PwEWSmsHUjjoHSV4wwScqQcVRrMKAjHZDOrnQS5zD/2Nf9e
	W7p72LnSxRrO2nubDOO+GuqO/Zao4ozGe9RZRQQ6RGznK4IuKLa4mcyCqV+5z02k/cDP3JxJEQrLF
	+8qdfrV1fqgOMmfgf8CB2R5Oczeh8bAqWHUJBhkIW1y8uVrJ0znmjsBRjLlgIWFQCsxkFmEL7+wlv
	Hf6+FA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNG11-0000000GSEz-0qZn;
	Thu, 05 Jun 2025 19:12:39 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFyt-0000000GS5f-1q50
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 19:10:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-235ef62066eso18545655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749150626; x=1749755426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S8Q01zwWnDH2jcws9vUi105eGLMi3lYwKgILJyKyZOU=;
        b=B1BIouUWFn4U3RBZVe48rz0unP0sWMgbMetpEQ0gXzFvGghx2wkhdqncifbpaUTQCq
         duRtXqbjtXUBN4nvVDR/OHHMEvjka/FxK9kUMIrcMgIZU+1YcLfial2q1QX78y7DTxQy
         GAlaCh5ZZARnefDu+LCeAN+jHFNd/3y9oGdEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749150626; x=1749755426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8Q01zwWnDH2jcws9vUi105eGLMi3lYwKgILJyKyZOU=;
        b=Or8p02N16C0D74ChQt4Qc3TAuowrwDPQ0TiYr+rVNHUk2cNwmQ5cqMQc7T/dJ/tFtk
         /TE+dxGMt5AgPwxyyphVTfRtUDLuklmmfg/XJceJ7N305OoVwEA4Zzga4ScC0b++Lj1m
         iU7mQUKKmpMZ8Zrq0gM8d+Vc/IXfOcAZekDvohwKCV4xOo4M+7EDzr8ANV/nMAGgljlH
         GCDsLJghf2xhhJzqRy3DzKprMKzH6zND1oXB53fTswhhjeG8BjIkxaoh4KuUncIz4vPn
         H7qn0NtSwJZhyGRk13NOX+PCFaDCXCZe0B28Afih8136tCgsd0q7l+YnDskCM6aclrPx
         6awA==
X-Forwarded-Encrypted: i=1; AJvYcCW/58qSQnMHVpUu2EGLt81JmEQW7AyyCil24Vo2M1a31pYqM5JPrdq0SmDrlhF+XAwimTEtugAKrf5WmnSd1vO0@lists.infradead.org
X-Gm-Message-State: AOJu0YyRxGq4JwtCRG9swmAytrx6xhiBKSwUBqu7LtbAXa1UQptvUo3X
	1jFR9ofOT/rBgjxYAdoNNVzgBjPeHQbjd8YI67UoiadxKlqkQNXqKfr43k7Sob1P5g==
X-Gm-Gg: ASbGncuxE9deMZJZZBWVFalCAMoKwcN4YNgZIa/2gAEP/iDnwZYXBVjaEBFOFG708NV
	ugDD5rjnm772OX2LkFvsG4T/fgdS6wCxvuGGlEoIA18E1YEQ/kuqlJZZ0RTJafnKo8O00bS59L8
	vgt3YtqRtVWeAmcMbeQnnIUnweuZxwTj/HNTf3aT67Js1SPPnyUjC8N5BnASR8WOAm38/DMu7bL
	AaL4vFRwolGORlv25TpUx7oZaY+zZn25M47R0a+UpDTBHoEN/ZwaXEK58uiVV24N49HixW8rhbP
	htCq+Z1ZXQ3AVmJ8zBe2qoIp5xjfZpNGi/AeHaAV236MyvE24oUFdKuknFw2/FqPkAQ8PxswUEb
	o3MxaFPbWNx8R7s4=
X-Google-Smtp-Source: AGHT+IH8uMPfDU2hWPBfSee1riTDDvC6J/TIxbPRoKG9On+pgfWIdYZeF7y84NvovZbhYEH2dSNdRA==
X-Received: by 2002:a17:902:b205:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23601d1993cmr5856905ad.31.1749150626567;
        Thu, 05 Jun 2025 12:10:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f66a87fsm37744a12.39.2025.06.05.12.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 12:10:25 -0700 (PDT)
Message-ID: <ac57663b-3bcc-42ae-898e-06592d417715@broadcom.com>
Date: Thu, 5 Jun 2025 12:10:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, justin.chen@broadcom.com,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
 <20250523184354.1249577-3-florian.fainelli@broadcom.com>
 <20250605185557.GA3023589-robh@kernel.org>
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
In-Reply-To: <20250605185557.GA3023589-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_121027_511957_E923688A 
X-CRM114-Status: GOOD (  19.84  )
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

On 6/5/25 11:55, Rob Herring wrote:
> On Fri, May 23, 2025 at 11:43:54AM -0700, Florian Fainelli wrote:
>> Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
>> has been defined, we can greatly simplify the matching within the driver
>> to only look for that compatible string and nothing else.
>>
>> The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
>> register layout since that is the most common nowadays.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> ---
>>   drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
>>   1 file changed, 3 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
>> index c87b37e2c1f0..ec4c198ddc49 100644
>> --- a/drivers/memory/brcmstb_memc.c
>> +++ b/drivers/memory/brcmstb_memc.c
>> @@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
>>   		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
>>   	},
>>   	{
>> -		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
>> +		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
>>   		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
> 
> This entry is pointless because the default will get V21.
> 
> In fact, I don't think you need the new compatible string at all. It
> doesn't work to add fallbacks after the fact.

I agree and would prefer to keep adding new compatible strings which is 
what I initially did here:

https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/

but the feedback was that this should not be done, and hence this 
attempt at defining a compatible string that would avoid needless churn.

So which way should I go now?
-- 
Florian

