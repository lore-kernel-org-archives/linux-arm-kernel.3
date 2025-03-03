Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A06C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=088gCiVsmCpfljLz/WNF5os3OZWs6Dr62hIApojY3d8=; b=VNguUFZ8Gdwbi8pmV69lhSGzL3
	iCmIjmWVwHuXdG9L8AqG4vRZklvEcWrjmTpx5LUMnt2neLG2xYY0REi73MSf6PjASrz3iGiz+vLha
	oDhqQC1nSmXznNAZg9z5iMUSgLYrrsHg/BqVe71s+soaPXATeG/6tIjxJVuKSHM4OIeOh/rbrhmx5
	mfkrSExHxTf6vayc8PTHAGSBBptdakciLST3apYLgU2G89Dt8pkweR1krMgQNV3nHGoc++RFHWNy5
	CwtOwHWM4fOfEOUUmmMPrjzum3yBl8+qv+HbXJl3tNk8GDVGCJyDLpdPlTpOjUc91LNbWzSAoALgN
	UzRa7TgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1M0-0000000HZAv-0VaM;
	Mon, 03 Mar 2025 08:40:48 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1J3-0000000HYFp-1G9K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:37:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb37dso1297448a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991063; x=1741595863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=088gCiVsmCpfljLz/WNF5os3OZWs6Dr62hIApojY3d8=;
        b=aPi89AYxceRI6GMHBeOvePrL1LHBSo13yj5f7qw+4ZkiOnlz/j37JCuXtLWIkLtYv7
         6NMvRYH+hWiiIHTPsyDGiCnLVSwzUFA7iH12z6hxQxNaYIloCGlh7jMrrlMcrKwD6kVD
         Ss1S+0BZAlouV8lxoA+0wJKcinF5F60sWOY0AsLHpTpV+LeAzs5d3Aiat7sPv8XA6Pgt
         yy59rYW73YHY3hlI9oGdt6zJ/rLcO/qp/v3klxx/aw0PWC29rPIS1mnDFxQ6CLOkYFam
         lqyNwU1wEhIIqso4Z9DKc91/hQnOJX45lYj+s3d2wKjMdDfXFo6gGQO6OvEiDALDKe+3
         vdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991063; x=1741595863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=088gCiVsmCpfljLz/WNF5os3OZWs6Dr62hIApojY3d8=;
        b=Mq8gHDPjUKXmQy3FJVuZ5xGm2fxMRp+WgVZefqUmZjoGatxNanwsSNqod/wjcCj1Pi
         s26yrrtm6gizrD3V3zy6kjJeQ/+w4s1Jtj1v1wfhVERSO8pAZIL85PaFI905K0TWnR4B
         93sG8dhyerU81w8K+zIuHz5SQu2xxJwzGRiogDu+tyeaaX1iXvOuEEf2IPtJMmTHszaI
         d850ezdlSlx7AtU/NG6cfVglxW2m7PF+ifzOf7ClTKVrsp13AWO66xILbJRpnetVnSot
         gqx4DNJidzJ+1Ou2lOxFZHZ7zcE0Pydxn5jKv0hVAnl3XiIcPV+J2L7lXPCs1rD8iutY
         Apjg==
X-Forwarded-Encrypted: i=1; AJvYcCXCBZLk6P7AgM4WM+KSxtKCDv3hk4L7Vnz50DgYvo3IPz+vZwKuGqUPSDnAYIPjCduuPbFnpLRMLBJU6LrPub+R@lists.infradead.org
X-Gm-Message-State: AOJu0YxhiAT89w1CAHuEQR5YrZjhOCfsDlz+es0lZ2vCyZ/+XAE7LUMk
	DgEhVld4svDqSbdBPagBoSVu6NU866dkYl3SdmHbL+5dNd6sAgWmjCis+UrW5YU=
X-Gm-Gg: ASbGncvPQp/5ykHz90+2vLblamEcTwn4uXzo+91oogefYvXdUiZ71gIPFVICGB4g/RR
	s3vS9pNb7c5vUNuumpwLiu8L0gNiN3szEQJUDOiI4eNAPjBLmGPd/B+o3qt15vYYLUY5Gb4CRRl
	tLu/2Ujc/wmcys7X5MgLgs32Y01OCUG/n/djzc42H8bRxFyanCAX0H06aMbrOKaQuEGZ3i4TC1E
	ffGbir9kzzOf91hfpVx5VINKfmCSV3MTMVQonS777S0zGwNozhdN5BIleTKpxz4IxgLoR/L794x
	+BflgS8+gii6S7z7q7fDWWxggCcahuRjZjkTvA0ERi82SOBV+4BdabrH
X-Google-Smtp-Source: AGHT+IG+mwXTx4eDAQj8AAOugFy3UaMktA3JlzKQWx74RnnVc1/k+KU8S1qfjCYJPEbQsqpxnNFduw==
X-Received: by 2002:a17:906:6a28:b0:abf:749f:f719 with SMTP id a640c23a62f3a-abf749ffc45mr408409866b.7.1740991063333;
        Mon, 03 Mar 2025 00:37:43 -0800 (PST)
Received: from [192.168.50.159] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf19aca8a0sm730375166b.178.2025.03.03.00.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:37:42 -0800 (PST)
Message-ID: <45713e88-57af-43c7-bf0b-4583383b10dc@tuxon.dev>
Date: Mon, 3 Mar 2025 10:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/21] ARM: at91: PM: Add Backup mode for SAMA7D65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <3a1f59af1ac9322b0203694b535d5d13120a31eb.1740671156.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <3a1f59af1ac9322b0203694b535d5d13120a31eb.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_003745_341708_EF87DDC0 
X-CRM114-Status: GOOD (  19.35  )
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



On 2/27/25 17:51, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add config check that enables Backup mode for SAMA7D65 SoC.
> 
> Add SHDWC_SR read to clear the status bits once finished exiting backup
> mode. This is only for SAMA7D65 SoCs. The SHDWC status register
> needs to be cleared after exiting backup mode to clear the wake up pin
> status.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   arch/arm/mach-at91/pm.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 39644703244d..d82a507bc8da 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -647,6 +647,11 @@ static void at91_pm_suspend(suspend_state_t state)
>   		at91_suspend_sram_fn = fncpy(at91_suspend_sram_fn,
>   					     &at91_pm_suspend_in_sram,
>   					     at91_pm_suspend_in_sram_sz);
> +
> +		if (IS_ENABLED(CONFIG_SOC_SAMA7D65))
> +			/* SHDWC.SR */
> +			readl(soc_pm.data.shdwc + 0x08);
> +
>   	} else {
>   		at91_suspend_finish(0);
>   	}
> @@ -707,6 +712,7 @@ static int at91_pm_enter(suspend_state_t state)
>   static void at91_pm_end(void)
>   {
>   	at91_pm_config_ws(soc_pm.data.mode, false);
> +

Not needed. I'll drop it while applying.

>   }
>   
>   
> @@ -1065,7 +1071,8 @@ static int __init at91_pm_backup_init(void)
>   	int ret = -ENODEV, located = 0;
>   
>   	if (!IS_ENABLED(CONFIG_SOC_SAMA5D2) &&
> -	    !IS_ENABLED(CONFIG_SOC_SAMA7G5))
> +	    !IS_ENABLED(CONFIG_SOC_SAMA7G5) &&
> +	    !IS_ENABLED(CONFIG_SOC_SAMA7D65))
>   		return -EPERM;
>   
>   	if (!at91_is_pm_mode_active(AT91_PM_BACKUP))


