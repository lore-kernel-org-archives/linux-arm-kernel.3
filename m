Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ED5C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 21:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4S19kvQPTgsV4nv+XvYaG+Ak9HdIxhdbirqQIiEN6Y=; b=MId2CSHnBxIe/JdIG3ubhftM6M
	kE3MRNsZLk6fjm9e7718jMExIZFZot8g87RoegOLeQMLg+xJCIQYg26Y+ItqdC5IN4J0fyNFEB7ks
	O8HImpK6pSokz0LNXZXVB45vR3yYv2EP2yVM89IhWmgUXhBIJ25tZGnL4RUe1s261pdNYviwDtnYW
	lznWvwFDbVeOQCqnH5jQXfEEU7PCVvlCodOhcaVMAygbYe3I4WQLk2el6YNXOut/5EoMxwQYMcl09
	EcYl8rIyqofy68E111WbaBrIKy98TRG8Hx5fSdrQxWCWQmMa18wuPpCk/4CmIJoThoY5hIhZF0SII
	tq+Sel7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNHyS-0000000GgIk-2cbS;
	Thu, 05 Jun 2025 21:18:08 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNHwE-0000000Gg62-1nF1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 21:15:52 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-b2f11866376so1017680a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 14:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749158149; x=1749762949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n4S19kvQPTgsV4nv+XvYaG+Ak9HdIxhdbirqQIiEN6Y=;
        b=SpQtJnewZAHLoPXvBJTnn90FrMF6ohl83hTuhwaI8NwCQPpjH4ux1zmIwW6r5pIjzg
         y8NE6Spj+Vy+yxTBxWfLWxuIKdXZWjjLR9bg8vCrYyqY+FwQ33rce+1bCFZiLNn3+XDq
         6TFk8TJ7uDFjbZI49o8dyJvCdxT5nXjlgvOpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749158149; x=1749762949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4S19kvQPTgsV4nv+XvYaG+Ak9HdIxhdbirqQIiEN6Y=;
        b=OLVNxoLVUOLPFlRVF0rnQj9kz84YNvzcjd6c2ZraB0EyWJ8ewLc/RQX+ju+jyBisfi
         yGlhEqwTcvEWefDp3x9aWgsfCdfUs4IIHAZ5GObsHg75yZtAdJ4md1D0xdpOZ3hNjicK
         cRnYZTkHK9MHW5jm6mRN9MMF5tjw4WAkX5M8YzsRRlsPnhMSNq8vbdkkf4x7TndPHT3Z
         vELcQKA3lPi0FWLmity2D/l9KJQ6Eeo7ZlSEPbsVCTql4LGZN4NFSEjopmGqSlv1+IrU
         tHM+852F+/NYo9+czQkQWBzHSQHXN6OltxEz8Hvd7fMUcRoThXEXMWEzjEyyOft8/fYZ
         0OCg==
X-Forwarded-Encrypted: i=1; AJvYcCUZkCZKvs+nwyK8OR6y3K71ipzn6m4hi8qXLtLaUkXJmk7LUQ5bjpDqLjBsU6i5FRo1Npfhsxc1BB3cQe5OvNG+@lists.infradead.org
X-Gm-Message-State: AOJu0YyaOt4GuzQ1u1Z3CPh//LBE47jhReBKBwWz1NVg2tQ5C4nqURa6
	IYkKT8C296gcTdMgR9v7BDQG/mtt0VEXhkRjfwxzRaa883XBctaN/Zpy+Nf+oK/mqQ==
X-Gm-Gg: ASbGnctzTi1j+WNA93NhmTZpRHKFJlpy5mVLv0OQZZZXC8c0rmqHLC1z5XOpvViK+bm
	Jp43PhAorvkWMy+708af45F8AUGagKul28K4IO7FkuP0BnXAfHRMzWEHKNUVZTEXCg8IpYo9zp2
	xm9rhK50wcd2fOoyHCSiEMBeedMN9vo8E4ZdlN4nzUmr4Y1gTWH1kcembEweUeDLIYSl1Uy3ebe
	7omvsqSO/dcWfcnbWY2Raak/a852RqIVxDGpsU6MWhTHzitx5/jZCq2ZWIAARQK+MEOPmr82Rv4
	gtQC6eJqUuNVAql8kK7zDVuc9iYdC4jbCAz2iHA2jue9JYJsgo7HlnrFX5V+qKdc08rJu8hIIFi
	+f3OUB1gB4NheeFt1XuWcmNIOgA==
X-Google-Smtp-Source: AGHT+IFvheyXX9YWNnObK37zZQL3qKzOZ4htPgE+mvHDHQudg3DGxXMZG4UMivdjw61rVrUdSmiMZg==
X-Received: by 2002:a17:90a:d64e:b0:313:2754:5910 with SMTP id 98e67ed59e1d1-31346b46defmr1808720a91.15.1749158149085;
        Thu, 05 Jun 2025 14:15:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fdf554sm188351a91.35.2025.06.05.14.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 14:15:48 -0700 (PDT)
Message-ID: <52fb02f0-eef5-4bce-822e-140eb8769cd0@broadcom.com>
Date: Thu, 5 Jun 2025 14:15:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] memory: brcmstb_memc: Simplify compatible matching
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, justin.chen@broadcom.com,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
 <20250523184354.1249577-3-florian.fainelli@broadcom.com>
 <20250605185557.GA3023589-robh@kernel.org>
 <ac57663b-3bcc-42ae-898e-06592d417715@broadcom.com>
 <86b6c9a8-5ecf-4aa5-a6cf-afee64d28efa@kernel.org>
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
In-Reply-To: <86b6c9a8-5ecf-4aa5-a6cf-afee64d28efa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_141550_518210_45258E55 
X-CRM114-Status: GOOD (  20.67  )
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

On 6/5/25 13:30, Krzysztof Kozlowski wrote:
> On 05/06/2025 21:10, Florian Fainelli wrote:
>> On 6/5/25 11:55, Rob Herring wrote:
>>> On Fri, May 23, 2025 at 11:43:54AM -0700, Florian Fainelli wrote:
>>>> Now that a "brcm,brcmstb-memc-ddr-rev-b.2.x" fallback compatible string
>>>> has been defined, we can greatly simplify the matching within the driver
>>>> to only look for that compatible string and nothing else.
>>>>
>>>> The fallback "brcm,brcmstb-memc-ddr" is also updated to assume the V21
>>>> register layout since that is the most common nowadays.
>>>>
>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>> ---
>>>>    drivers/memory/brcmstb_memc.c | 58 ++---------------------------------
>>>>    1 file changed, 3 insertions(+), 55 deletions(-)
>>>>
>>>> diff --git a/drivers/memory/brcmstb_memc.c b/drivers/memory/brcmstb_memc.c
>>>> index c87b37e2c1f0..ec4c198ddc49 100644
>>>> --- a/drivers/memory/brcmstb_memc.c
>>>> +++ b/drivers/memory/brcmstb_memc.c
>>>> @@ -181,65 +181,13 @@ static const struct of_device_id brcmstb_memc_of_match[] = {
>>>>    		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V20]
>>>>    	},
>>>>    	{
>>>> -		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.1",
>>>> +		.compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x",
>>>>    		.data = &brcmstb_memc_versions[BRCMSTB_MEMC_V21]
>>>
>>> This entry is pointless because the default will get V21.
>>>
>>> In fact, I don't think you need the new compatible string at all. It
>>> doesn't work to add fallbacks after the fact.
>>
>> I agree and would prefer to keep adding new compatible strings which is
> 
> So you agree that adding such entries is pointless?

I don't think it is pointless, it's overly descriptive and we don't key 
off of it for now.

> 
>> what I initially did here:
>>
>> https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
>>
>> but the feedback was that this should not be done, and hence this
>> attempt at defining a compatible string that would avoid needless churn.
>>
>> So which way should I go now?
> 
> And the advice was to use v2.1 fallback, not replace v2.1 with something
> else or keep adding pointless entries:
> https://lore.kernel.org/all/2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi/

Fair enough then, I will re-spin accordingly. Thank you both.
-- 
Florian

