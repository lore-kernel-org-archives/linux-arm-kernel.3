Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1559BEA7943
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAE9WGXDfmoSI3ZNijWIUKfoPmAabbEHCfwa7YwtEU0=; b=OJ+IGE6M2ZSA+BdvbwdjYsHND5
	Y22VyAclxl6TKaNIpsEMqWQtiIo3k4cTAOWcGf4V166DgnQ5y+4n2fn6G+8vhBumbJt72bO5URoP+
	Xeq4iLq1zIsw9H4oYDqNVDbjh8estK91V0nNf323HM+L6USwCA1qUQty2vX5OYLmYmmf2uGeg1Rvh
	KO1IGBFM0WoaTUOFU45HY5wUs6h6DiQIwT8UnkuXbFveafJfyVD21/iL842J5Su5kFGiEJTCzcawx
	CQOHG11NfJYYPEAWCwpPGO3vj65RZcw+r6k6F4lvGcXX1IR7INErbMqcTd58SI1+DpydoNd4JaU1Z
	gcKsRNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkJv-000000095sB-39l2;
	Wed, 04 Feb 2026 21:21:55 +0000
Received: from mail-dl1-x1262.google.com ([2607:f8b0:4864:20::1262])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkJs-000000095rp-2Lwz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 21:21:53 +0000
Received: by mail-dl1-x1262.google.com with SMTP id a92af1059eb24-1233b953bebso826742c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 13:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770240111; x=1770844911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAE9WGXDfmoSI3ZNijWIUKfoPmAabbEHCfwa7YwtEU0=;
        b=v7AlTAunbMqtob/HSPNvReI2SBcXl50Lcj55sJzdB2Z0f5J6qONUWFiHn/jjRJWXSh
         WJGsEyzH3QqDMTkDveCFf+3pUREP9dEco4oxHGdGMtMBA/U+ZB9rbyvsK+KBUQJ9JtbV
         cfejjkhXhbSMk+5w7owgzsi/t6/m55UociGexGWKg526C0NlfM+KRDvbv63G4gXb/bEe
         xGxBTQXW4zXaAkVf5jOO+cWdlzM9I+ohIav/OibFYKElAmVQ+YiBI4aT4cssIXw1wIgT
         AwHlSUEAJ0oVrFI4ukq9TgZH/E6MvZqkEGmoCqwKuyzpe00Za2Y6NW0BSruBaAxDv6Ih
         33mw==
X-Forwarded-Encrypted: i=1; AJvYcCXOvA1pReNMDB1pWQ/LWn9CqTMaO526fpuko4NmvA2BfQR+OtRw4O1U6NfM/WArytUB8M0Esb+98Mew+jb2lPus@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Cq6WaLRgUi1ln3EmI6WkwKMJInk+GRb5s4egz29j8EfR/n+F
	srVGsqVH3QHXU9NJ7OlOKZPab9wdZAxXq2zxWnp/3N0xKZ2iPRtUlLmuCxCDAuvARXMcdQoK6Bx
	FosJnGC+IpUmnqHH1/kuP591vVvWMvl0a/hDoIcPErxgoKxyguNFU5O2eMAHJ70oANigwl5AW6j
	AOBkXNRf8vTgjlwXpBtI5bS9HAhkXgg3fRWO64ysglrLjkPqAkP+eooLj3SV8UHZocpZRqYndlD
	U+r51gMbStbacAxPi4p4VJKxCDKYxqGvRA=
X-Gm-Gg: AZuq6aInr4TlflU+bq1SuUzZv/JqAeNvYQt5bjSIVdAISaUPBXBtijJUEa3JgkB6Zks
	0NG4lXdIcwVmx1PuSp9gz2LnBB4rMwt1440vDDGh6giyw0L2AyPTnPKS1h6pOiGRBvqcGvVd+ui
	OsAxZSgSeoGV8Ffd6cyEqvQcc3Fd18fW77iMs/bjYtLawgJD/rWGrUYJiIRhIUSIQ+7yYWUFnN7
	cTl2cJl59Sck6VIJMJaAauGryNne3LBEwWzGnXMIrpzeOD7PBCdAgnjfblHqwOrB+sIftIdikQ1
	nXXF7qjhlAmdonIZB59se/FgJZaybGBwgT5z0R4eODh1q5CGilPAmEtATakQP0NyO3RpVh7Ff8b
	wpCg5g8MQVFWhGUe0EpguY5bUGPGaQPLYyGthoKARha3rcjD/Th4IpHKjHdcGeaLASfiPi4zlBt
	/kNGPVsLo+SOc3UJTyTiqcPhXT92xj+iWuuOpN6kOY7vocEHg=
X-Received: by 2002:a05:7022:6b83:b0:119:e56b:c758 with SMTP id a92af1059eb24-126f47bd008mr1713494c88.29.1770240111041;
        Wed, 04 Feb 2026 13:21:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-126f502b5e6sm650047c88.5.2026.02.04.13.21.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 13:21:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d18e95c658so1246741a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 13:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1770240109; x=1770844909; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TAE9WGXDfmoSI3ZNijWIUKfoPmAabbEHCfwa7YwtEU0=;
        b=ROoW1mTmHuQu6/DTCXLGLw8dAFaHdYaKAffzhd4MsRN+zJSbWGLjlvsGq6u5hZQnIT
         PV3eY0Bcd7KMCL/zCXFB6aCnp5EBAG5C630WEwRjPL5nOuOMrkx8rcj0PMCGebjNS9eC
         BsH4+wT3erP1GlwWY5hAFi4bN0q0c1Eruchhg=
X-Forwarded-Encrypted: i=1; AJvYcCV1eICel3qbFBirhBrOlJzWGXT0wSY/zROuFcoJswe4RuBkqbHWpfrkVOHlHlo1D8Q9psascrwkZ71V9g2GnFRn@lists.infradead.org
X-Received: by 2002:a05:6830:4412:b0:7cf:d14e:e452 with SMTP id 46e09a7af769-7d448985d3cmr2143193a34.4.1770240109584;
        Wed, 04 Feb 2026 13:21:49 -0800 (PST)
X-Received: by 2002:a05:6830:4412:b0:7cf:d14e:e452 with SMTP id 46e09a7af769-7d448985d3cmr2143174a34.4.1770240109195;
        Wed, 04 Feb 2026 13:21:49 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d44b4fbfc0sm1935008a34.20.2026.02.04.13.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 13:21:48 -0800 (PST)
Message-ID: <8ee13309-537e-4a63-a402-289fd119118f@broadcom.com>
Date: Wed, 4 Feb 2026 13:21:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] ARM: dts: BCM5301X: Drop extra NAND controller
 compatible
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 William Zhang <william.zhang@broadcom.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260204091530.624230-1-miquel.raynal@bootlin.com>
 <CAHi4H7EVLsgVL5KCERTX5XBNTMvZDNxePzo48Zp5dsfDdoCV1Q@mail.gmail.com>
 <87ldh8fdqm.fsf@bootlin.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <87ldh8fdqm.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_132152_668044_2D6A51C8 
X-CRM114-Status: GOOD (  11.02  )
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

On 2/4/26 12:36, Miquel Raynal wrote:
> Hello William,
> 
>>> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>>> index d0d5f7e52a91..46b650abdb90 100644
>>> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>>> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
>>> @@ -479,7 +479,7 @@ thermal: thermal@2c0 {
>>>          };
>>>
>>>          nand_controller: nand-controller@18028000 {
>>> -               compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
>>> +               compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
>>>                  reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
>>>                  reg-names = "nand", "iproc-idm", "iproc-ext";
>>>                  interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>>
>> Acked-by: William Zhang <william.zhang@broadcom.com>
> 
> Do you mind if I take it on top of the commit it fixes?

I already applied this change to the Broadcom ARM SoC tree. I don't 
expect conflicts so if you prefer to take it, I can drop it.
-- 
Florian

