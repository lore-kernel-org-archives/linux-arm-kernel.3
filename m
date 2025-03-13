Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88719C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtjPSYCYextd8p+081cZMv9XSGQU1Zsd9DWrufPXUHg=; b=4T0WcGfAwoTiTjmoylUfu5H190
	ZXUwH/i7ZXucDkfPNc3b2U5VLSWXRkAlpdtJrx72yaOrA7JKexkXlledJAgbfLEYqIgDkFFnH27b5
	yvRfrL7V1ZObuNS7crXAwCn7mjmELNwMPC6uL1Jln4BcMkAyBk6kjvNomYGMWgGpOFm2G+PtkAwQu
	eBWGrRQ5d831nT4drMFW8R7KGfZd9BsmIbVkf8m3EJv82g1BTEFqeiFUmIriml1uiT/e8nJUO7yGX
	yUusSasGoXXlnOkXE8Z8/zwZiBzzqJnmpzVVsaI3enfgouHA7HIS2/H4ymwGxkdfXwQoA9Bg+zslq
	tUO6k7UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskHM-0000000Bcj0-48N9;
	Thu, 13 Mar 2025 15:15:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskFh-0000000BcZQ-46Eo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 15:13:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-224191d92e4so23069485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 08:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741878821; x=1742483621; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LtjPSYCYextd8p+081cZMv9XSGQU1Zsd9DWrufPXUHg=;
        b=RGEKajCPG9rghO/bb0rCMjsA/lF0vCPCxIO3cOFo2lHcz8vD5wAiHoRRRxiSnkg8g2
         3TibIcRAmH9QgmScD9kZoSO5KK9vbmAg3a5tzBbmmo/nRXTgNy89MqzjagrNZTXtDx+E
         Gucn1oYSFDkYFPNGSjWFykknzMKjJYeyOm/FM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878821; x=1742483621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtjPSYCYextd8p+081cZMv9XSGQU1Zsd9DWrufPXUHg=;
        b=AG3yOU99nRJZgb9ev/7q4d3IlkfN4uPTFryGzS/gkWBWcmGNoP375DtkE3yTVTnQhO
         E4up7o5Ta3sPxz1OYyy2R/+3Pwv+M4y6Mp2DVifWcLNHNDeUSww1soFSI9Tr3dxGPnuh
         85dUE+1EqeP72zVu65qz9WW8dYhDMkYJMLprtseJJ3ZVyjzvsZuGK0/CxFAXC1P1cpOC
         u3wkCnclaR65FiPQG9MBFH+5libHsx3yzPnj9/Hn/VrJq/JxMfPCW8QhiaxIK5eCJqWa
         v+eCcSs3AszV3cX/bgK2tGASY3y5RkThWcMjjkwpM12alotJkjIWviAYfIbPR342Y6iG
         62sg==
X-Forwarded-Encrypted: i=1; AJvYcCUVFxFQT76gd/tB+ettzRg542AgthCEB2xqCZFfCMwgJlo5NO/1DlH+V7EOp3psvAFtRuylKHXaAkGACJFRtC4o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6r5waKIGh8bvlh7H+YgaBgROhHxkPpdOqLehLHFRXSm2+4qNn
	rpIfaHOdEpFU6t0kBwyK8nLSxD0gyIOu8wFCrpZ9N7A72gt4KUS8JgtuPOCPbg==
X-Gm-Gg: ASbGncu0TpsiHWEI4jKXcwqhKm3rfSw72pOV7K5bA+K/K/KD6FSRwW3kpnkYX/5cokF
	s6AdamfLSZfKUBAK1MK2VLa+JTqoAhJ1CfHnFfUf2g/5zvpp928Nhq954IfMFGXUzENx1O6Deew
	RK49yY0UAlR4uuHjK88toleJnWdkbUSCsjjMJ3vRojvBLFscI605OTDh7QGE39D8N0axHiUu8ye
	rJHtuqyERPO0bYY1j8p7aW424AaSoGcK2QCskIZN+a00nGZAmT3t4t9Osbov57aRhmHxnEcOsu0
	xC3TNSuyC+k2lSB+mfMn+DkvGTDGwiv9g9ad+ggx5JBKsLHmNEnWEqg2acOSNxryLnPzWJmv6zT
	Vx+u/1FPUuDMV9mdBmfw=
X-Google-Smtp-Source: AGHT+IH6rVvz6wUlxxNUwr/JAWpyXdb7amienre/dUzOfRJnNc3NkCdr7ltThD0dYTVCfDPZwdv9wQ==
X-Received: by 2002:a17:902:ef4e:b0:223:628c:199 with SMTP id d9443c01a7336-22428c1cca9mr373944625ad.52.1741878821152;
        Thu, 13 Mar 2025 08:13:41 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbebebsm14416825ad.201.2025.03.13.08.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 08:13:39 -0700 (PDT)
Message-ID: <06ee4b30-e4c8-4670-9054-b30827ca8931@broadcom.com>
Date: Thu, 13 Mar 2025 08:13:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
To: Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250311165946.28190-1-kamal.dasu@broadcom.com>
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
In-Reply-To: <20250311165946.28190-1-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_081342_056096_68A004B6 
X-CRM114-Status: GOOD (  14.59  )
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



On 3/11/2025 9:59 AM, Kamal Dasu wrote:
> cqhci timeouts observed on brcmstb platforms during suspend:
>    ...
>    [  164.832853] mmc0: cqhci: timeout for tag 18
>    ...
> 
> Adding cqhci_suspend()/resume() calls to disable cqe
> in sdhci_brcmstb_suspend()/resume() respectively to fix
> CQE timeouts seen on PM suspend.
> 
> Fixes: d46ba2d17f90 ("mmc: sdhci-brcmstb: Add support for Command Queuing (CQE)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>   drivers/mmc/host/sdhci-brcmstb.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
> index 0ef4d578ade8..48cdcba0f39c 100644
> --- a/drivers/mmc/host/sdhci-brcmstb.c
> +++ b/drivers/mmc/host/sdhci-brcmstb.c
> @@ -503,8 +503,15 @@ static int sdhci_brcmstb_suspend(struct device *dev)
>   	struct sdhci_host *host = dev_get_drvdata(dev);
>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>   	struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
> +	int ret;

Hopefully this won't be causing a possibly uninitialized warning.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


