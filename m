Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C78C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 12:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVd7AMali/jsi6H1hzbMRMOEHFNbKvjmSzlnGm24Ac0=; b=fMlOQBd+e556UZLsxX4ZfAKy8E
	NSf/rdzsnzn9PgpHIaRQB9H33ZEznLhtoAJhTP5a0cLHkULc27CVon/bG5gGeKGS/hTBu/cSLbpbV
	8AXyGSOjSFtPGal8P6xwD+KleYroYS31VBuBSp6y4iV4s5bl3CW4un2QpHHs+FYMq8s30bLZbpOUC
	SOinCoUSw/UOQIbGLvRqrhIZ8/gBYeWcaED/hg7eBDuZ2Rd/FyIL/NitRa4jSC2Cx8CcW9GufcHFb
	3T8lDnIctnvCvNtZCAKoR0Nrd++N82cwPP8lYDzsoAnX+WaDLx7dVAOCiTGwoyiA8laiBgIKl2oYP
	vG9mq2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufeUL-0000000BT0s-2mkv;
	Sat, 26 Jul 2025 12:58:57 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufeRt-0000000BSrT-3H1b
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 12:56:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3b77a4ad84cso285010f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Jul 2025 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1753534583; x=1754139383; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oVd7AMali/jsi6H1hzbMRMOEHFNbKvjmSzlnGm24Ac0=;
        b=TjRju261boMClhWHBM42NTcIOl5/cHMWEBSE8pZMJjQWIViMUUgKGnZemmYLG/lwEn
         glbg1HsGG1XUItmUM4TJDd72DsKvNGiA7PqIMXCpf7rwCBAYgZYzlSe7WCmB5mIM1iZo
         gL8EO/TkBxlgjqBkS3VyZmtNNRa7H0Irn1uki705xGH3burrymPm/RjWQoT5DGFZ4Hdn
         zGM/zzF21BmF1Kdh1MNSia3dFw8CHGOWp4w5n+0AvudUtI6I9ERQPiJYre55ALGwcQCV
         0cex3JYK5yUblrL5Fs4oGtf7Q0Nz4EQZAuenmRnBTXgVMZrd5SUybvSaN9gJcsLIg0Bt
         wa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753534583; x=1754139383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVd7AMali/jsi6H1hzbMRMOEHFNbKvjmSzlnGm24Ac0=;
        b=C6NJmEPWWeKoojDTCzqnfdUaWbdbWEQKB8V4myW1aaLWnrPOt2Dyg/+MMrEtZTvQDc
         CYHATjApKV571x4Qohzl+B8wCnxwINKbJ2YtjplyH5DIySSiNlCn9FmJlQ36JifP+bYV
         UStjZQdlquCPtV+X1mmSCz8WEeGtm3HaZIYRo9HQTM9g7ey9jaqOCi9J8332xdHyBted
         D4ueanCNB7A28MbxUEK3VUo9ZIAlgkQo99j+DGIsZ345jRylgMlG1oyiuuzFwEKdE0W/
         K4D9fkc3rT0LItV2BhTxhFZXm6eue6fNtU7NuCbnUjsQsHHwsY0KtrgbN3ZJjRuySCBu
         6Cbg==
X-Forwarded-Encrypted: i=1; AJvYcCUqnXjZ8rPxI2JWre4iTGNe7HLIB+vcKcUBXlXkOItRNuYBtbrNKnmcCwPT45OZhb8s10ncPlPwSv6WX3iJQDGI@lists.infradead.org
X-Gm-Message-State: AOJu0YxC3P9nxUqpFni+0sqo75ZYgAeApR7pGSZo7EY7O+I1BVNp4giJ
	0jPhF06HCE1G2pmPnyYqELS3L5An6hZ9gj3SwA6EgHJXd2mWv4T9mFiIuUhs8DR9ZkU=
X-Gm-Gg: ASbGncuzFcLUFUnl9jQb+SV1/XC8MsQfUcgLbFXWIecxDT3OyHC/dbjayuUymdXbQR9
	FX51QfhPJsFjaUTnv9C93GbWhqVNLUbuwAYUMOL/Nqz9iQpbRQDHe6a3Y6kHa/WMyJjTlKw3FWw
	GAq8AKT+5EGLp6YMCBoMTfqHUYytaCaPVXfxjVTwoWw99A7iV0gPvEJvPyed+6E+ujCgfSOC2lO
	/nAs4ocw6zquP60fAKRzJPLTRnFRrMXVIzlNqMCYNp1cFiKHA+yrtWijbAl6a8JlRt1HTMt+qXr
	btCM0kQBzbKM3KicHtT8mzrwqAgKekrJ+7b8vLNd2SCmaOZ6WZrZuUabIOT4l2YFqr4jOIXhyEg
	SnlDrFauYxNo4uVo3khwPZr4aX+DgZEQs7lqIg0tdKB7mpz8RRp8GnZUyCzX+7AsO3Aziyl7XmF
	N6hMcOs8i5rg==
X-Google-Smtp-Source: AGHT+IHcdmZgE50L6D5Uo+PeD640vgCbTir0gSC0WUCoG2jj5zd6WbBnoWPwULzq1pOtJHDErCHGfw==
X-Received: by 2002:a05:6000:1445:b0:3b7:7ceb:1428 with SMTP id ffacd0b85a97d-3b77ceb1730mr1042661f8f.8.1753534583420;
        Sat, 26 Jul 2025 05:56:23 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6206:d100:13e7:7f4:965e:e5b8? ([2a02:2f04:6206:d100:13e7:7f4:965e:e5b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb27besm2791649f8f.9.2025.07.26.05.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 05:56:22 -0700 (PDT)
Message-ID: <681b063c-6eab-459b-a714-1967a735c37d@tuxon.dev>
Date: Sat, 26 Jul 2025 15:56:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] net: cadence: macb: sama7g5_emac: Remove USARIO
 CLKEN flag
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
 <1e7a8c324526f631f279925aa8a6aa937d55c796.1752510727.git.Ryan.Wanner@microchip.com>
 <fe20bc48-8532-441d-bc40-e80dd6d30ee0@tuxon.dev>
 <848529cc-0d01-4012-ae87-8a98b1307cbe@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <848529cc-0d01-4012-ae87-8a98b1307cbe@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_055625_827955_273FC983 
X-CRM114-Status: GOOD (  16.55  )
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

Hi, Ryan,

On 7/21/25 18:39, Ryan.Wanner@microchip.com wrote:
> On 7/18/25 04:00, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 14.07.2025 19:37, Ryan.Wanner@microchip.com wrote:
>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>
>>> Remove USARIO_CLKEN flag since this is now a device tree argument and
>>
>> s/USARIO_CLKEN/USRIO_HAS_CLKEN here and in title as well.
>>
>>> not fixed to the SoC.
>>>
>>> This will instead be selected by the "cdns,refclk-ext"
>>> device tree property.
>>>
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>   drivers/net/ethernet/cadence/macb_main.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
>>> index 51667263c01d..cd54e4065690 100644
>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>> @@ -5113,8 +5113,7 @@ static const struct macb_config sama7g5_gem_config = {
>>>
>>>   static const struct macb_config sama7g5_emac_config = {
>>>        .caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
>>> -             MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
>>
>> Will old DTBs still work with new kernels with this change?
> 
> That was my assumption, but it seems it would be safer to keep this
> property for this IP and implement this dt flag property on IPs that do
> not already have  MACB_CAPS_USRIO_HAS_CLKEN property.

So, this patch should be reverted, right?

Thank you,
Claudiu

> 
> Ryan
>>
>> Thank you,
>> Claudiu
>>
>>> -             MACB_CAPS_GEM_HAS_PTP,
>>> +             MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
>>>        .dma_burst_length = 16,
>>>        .clk_init = macb_clk_init,
>>>        .init = macb_init,
>>
> 


