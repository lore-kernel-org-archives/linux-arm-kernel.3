Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DEFCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spNd66xUF/MHH3XfU8KuIautX8tRrHIWRjBPGEFbZH0=; b=yc7NbmPTqeOQFIgxzv6PuFD4EM
	2tDkUWXGxIrBh6NATYWurXohJ2CSUQdmjHGboyzJC+/fRNsuIVTwWPK94iSJxktyxix/b8nLi4QdR
	x5b/Dpxs7QOO0LShLdWOinhRnOvr6zHHawJDclMJu5G9mv7QRXCP8W7nhm9+259f0Nk0UTUsl2Pwu
	BVjgMy2W+0YjO0k5/DJEKdRJKWZAFgHFhD8WDOa6baDLxl8CpOYr219Nic4t2ykWdu2yxokRn26ZQ
	T2/ZmZCnaRcUQ4C2qgBSmp/nTLs3n+CSM7gb1cGZ+4xl+DZxzGQQORn6Vn3smOVTMwzth0dANLJTI
	i2k5Elfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriXu-000000034CR-301Y;
	Thu, 28 Aug 2025 19:44:30 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgHr-00000002OmE-3ZWA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:19:49 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-246aef91e57so16270515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 10:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756401586; x=1757006386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=spNd66xUF/MHH3XfU8KuIautX8tRrHIWRjBPGEFbZH0=;
        b=ULoRDQi/natTe6FA3L+tJNbepTf6w/QgTqAblzGogws54lfXvfPHVJWe/PQ+U7X7fM
         ASHE2IfPmKFPMR/b4JHh6gWaGvw15k6uWtmSP3KKDuSsbjEytK7NCsSGxPIUV2qzvall
         IO7OXsT/S9O54cL86qP6YcC3oNVWSYNOjykMv9yjJJ2UGikZjufDNLp99Ch2w3qt4nSk
         gxHbuQVJomT8WeL0y73M71Pt1u+NifzxN1rbh5adgLMSIrYBva3/51AV/CdMcodMi8eW
         JsYZ8uRl00QSTEHAQM7euHri3dK46Mzq+lftSC5MKTOD79/02PP8bi4p3xOij3URWKjC
         W+nw==
X-Forwarded-Encrypted: i=1; AJvYcCU10cTuWMrguv0aY9Mz8n5K18VJSTCfB1v7Sj8KnJk1dp09nvIV828eBA8MpJuqYfOPUQTiJR55zNQcwVNsdvfn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf4B5Hu2AD3MaBlU7sWTc0Yk+kFTKlygdhEH+7De8QyP+Gyl/R
	aySN2HAXfmqMKB0d8Tkqn3lH9pyOMNWb+M0jeKFi7qUojpXP062xPKMgIOCRIPDZkwIqC8D22hA
	vx4yU5aFhPcVNxY/cKGjtP3Pps9i8vPQau5PxR103fKhwEiuXb5bvq26Sl1FNOrD33shg8NnUoT
	fxGvsV/1VXy8NdDKao7qYjAwC6Ax8jfBxgVj+uPi3vaUvALsckgG1XRmk9Vu/UmupcBs5c9D5Ab
	yRWhtKFHj3BnFb2YRxX1X8X8Guy4kLCXgM=
X-Gm-Gg: ASbGnctuvZ+QI3WJGVvb6+VAWXH9tfp5Ls4pEZ+9DmsKisYrpbCnn53NjK2jd6iV3sV
	CxVPXk+KGlStA0wTJPvTLninsOD39hw6sUVxVlE/UIQfwLdvyTGQWyb8wLKilUXCwl/yxthvm1W
	M9WfTKRyQx4QmZrG40Y5AKfeMabchGgPLFKjUDSrM1+Gtldg9L1eQ5aIJS7VAQxkTKvhs+YeqFy
	WhQkU6mv47NnTD6KJRVo3To4QXw1bzpSmKCfW2vCID6xaAHCVYwqISH8ZicT4bcpFYrHY0UOPbL
	5jcCV8riZzM17dhZJcDq5S/k3f/zYNagBiphi2/VBYY9zYdyL563N/UQMplGAG0Q+XaWLo6o6K1
	tWCm2ndKnXBxHbHHQ4bHYyD37soBZXH9F602gy6DSHFvNOMq520+uiyesDf44C7l1iInaUUdojX
	5cTNMJoqU=
X-Google-Smtp-Source: AGHT+IECwZ6uqJyACbaM+y84yIg57WHuRQ8I6wTsAUdjC5JQKq0Av1uZCtNCB/t8wYNY7A9ulWFRdI0LD36H
X-Received: by 2002:a17:903:1c3:b0:246:5c65:4c40 with SMTP id d9443c01a7336-2465c654e9bmr307037635ad.36.1756401586267;
        Thu, 28 Aug 2025 10:19:46 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2490658702csm71525ad.68.2025.08.28.10.19.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Aug 2025 10:19:46 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2ecb8e64bso16438901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756401585; x=1757006385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=spNd66xUF/MHH3XfU8KuIautX8tRrHIWRjBPGEFbZH0=;
        b=F7k/baifPYiA5VBBzGe+QyVGamGFqXJBULlbbZ/aO2C8JYhZwAECGTaWkBGRyzP/cz
         2gCH0WPNZDzJ12eQMl06AD5V0JWdjTDbEVBErZH71tfS1IWYQLL9D0nkJHMvAWy7fzqM
         mbYe6n8ZXsIbPtGzCLv44N4jS2x41dh0+nxsQ=
X-Forwarded-Encrypted: i=1; AJvYcCXFeoAC7wR9LGnsx1TErTRmEK65FTHMOpTGa9Efkoz7OMi0YWBaYOOeDz7dKuobN0uOEQok1vATT11pBkqbXYj1@lists.infradead.org
X-Received: by 2002:a05:622a:40c4:b0:4b2:f469:28b0 with SMTP id d75a77b69052e-4b2f4692bc2mr69991481cf.48.1756401585195;
        Thu, 28 Aug 2025 10:19:45 -0700 (PDT)
X-Received: by 2002:a05:622a:40c4:b0:4b2:f469:28b0 with SMTP id d75a77b69052e-4b2f4692bc2mr69991061cf.48.1756401584649;
        Thu, 28 Aug 2025 10:19:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14754ee8sm16100285a.32.2025.08.28.10.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 10:19:43 -0700 (PDT)
Message-ID: <fac53dd3-9774-4a14-9557-19c2a2532a0d@broadcom.com>
Date: Thu, 28 Aug 2025 10:19:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wahrenst@gmx.net,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
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
In-Reply-To: <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_101947_951605_D642DA3E 
X-CRM114-Status: GOOD (  14.76  )
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

On 8/28/25 05:47, Andrea della Porta wrote:
> Select the on-chip pin controller driver for BCM2712 SoC.
> 
> On RapsberryPi 5 devices it is primarily needed to operate the
> bluetooth and WiFi devices, to configure the uSD interface
> and the power button.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 58f87d09366c..d4c3853d885d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -592,6 +592,8 @@ CONFIG_SPI_TEGRA114=m
>   CONFIG_SPI_SPIDEV=m
>   CONFIG_SPMI=y
>   CONFIG_SPMI_MTK_PMIF=m
> +CONFIG_PINCTRL_BRCMSTB=y
> +CONFIG_PINCTRL_BCM2712=y

Do those need to be built-in or does it work good enough if you have 
them as loadable modules?
-- 
Florian

