Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B801EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t59WyUTPd0L7Mi3cChysUXnRM6v1fDvAcY991WF1bQ=; b=Wygj314++V9SA8bEpPcF0SVepJ
	Lf330wurk1iFWXVU6iB55M4CY+Nufzt6aw+JtaabTYlXsYDxlqF4h4k0x2yQ9Ds0Z7tcEae33OCpD
	Ej8v6I75CMyHE6jsVU6mP0BPOdHARxM7R/chIT4Yq1tuhqyk8h6+Oon40iyrhXKMvxBvRHh1RF2kf
	eekKza7HFdCfARbn7na8xw6JHZ4L3HhjtVccIXlDhgWmwrnAXt/LYVLgT4rSeCj28jWM3Z7UDwMfI
	rCl7Nxg1ykNE58Cswyn/nGVRFr2XZSmN9EZWredopMz2y6AKgvzj/Qq5JwAi5aRTdi6QmvJxWobVb
	ExecnN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1P5-0000000HZgW-35Jk;
	Mon, 03 Mar 2025 08:43:59 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1Lk-0000000HZ8c-0ZkX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:40:33 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaeec07b705so666843666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740991230; x=1741596030; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7t59WyUTPd0L7Mi3cChysUXnRM6v1fDvAcY991WF1bQ=;
        b=Ny10ATvsjTzzsV782j9r/G07rEV+ihLggcuQo2yVjSNFuNbFHmMnSzFfihn+hyYo9k
         C1PwaNcSD6wOh0/CkmdkUZoaEVXc/xUwnaW0wZXKH0yhYO8ZpSbxuv07pl3oBVjLaIv3
         eJy+MrOWN2EtgZAFnpKB1arEZzHhB8btP3/A+b7ZQ2+ciX7SUWeE5Y6LnWtwfpqR6QPz
         Jjbo5vHysT2DRCvhi7UIKqXWmhHwLK5FTWxAdKnTjD9Kzh7jL74SkTxhLmvpMqqc8EbB
         VFfGZ4bH7lnu4HhnmAup3g5rCA0AAZmXtnzvArWY3VjlF60Hbk3j6cCS7UWcmq5h4pF+
         Oqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991230; x=1741596030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7t59WyUTPd0L7Mi3cChysUXnRM6v1fDvAcY991WF1bQ=;
        b=DFiupbIWTN/5LAYvAu4iHircgTqmlrqNCBdtrHgOeORtd3Yyt8aLTBfn+fMDHqh9L3
         ZOF1M6kC3Ta9y9mhm7vkHv34cwMvU9fh+w7zTfCYNxrK1gGjGq5WXJZWYWLku7PE8u85
         QyVyAN3LmUEYqdasgjeAkj23vBZy9ioc9jhikcPhkpGzyUJ4qIDsNsoidDTaN4LiQz0i
         YmMvv0dN6WNd4xp0PUD1ZjTAGcySTW5AgblE2ms7ZY71qJebdcR27R/n+hZg7WJOTuJv
         0Ymyl4WMmzicbXZubnPaqkViSItopvri7kL3fevu5kc+p/jvobNnCuzQ1lEW07wlqZRQ
         KAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCLie1ZsMEE61NIjptv5BHOAWS2FwELCeC+iSzGXhHuKjztJenV8XAHWgJp8ydsULkaVBUvZdq2s5CA/+bN+ay@lists.infradead.org
X-Gm-Message-State: AOJu0YwgyuO8MVs4yJsDImE+RQalVVYGI64juPgK3z+7K8JGLJqmxP0Y
	7RWGZhbt2lyFD/H4+XKgYfJBhD5+5h2fpZ64W5VNslpkDfiHPZqQh9E/SzQOHQo=
X-Gm-Gg: ASbGncsJwaTBcsPA5gWs9Wgd1zqm8m+Pe4GqSv+Oi59FUcbUjhgXfwbcmFjOpDCqD+b
	NE5d1GWKlU9Q5UUrnsXu0HhUzcoyYqW+4Ia0qii7uGfRGF+OcoJbbFpiDZ5ggPuCuPHkM2lmmpy
	RakRmS0xw+lc6YxtKem6S/RNy3KYrHjSPe+oADe55eqdY2Ti4vTcAKeXe3R2RrfDo1KxdOhIei5
	6Nm5hj01MpaoTx+SczcvrlygdRKUxoW4VyjMrUO+OKNCncyqwuT6QH+JLqWPmorGKUUVem88Y0x
	y/L6HWQ7N7NLYNGznaaTwR+7o7jMVcICYYy1t/AFWb4YJ08SSazCFA==
X-Google-Smtp-Source: AGHT+IFbnHrYeaaWFN8nqN3k607A73JWI/jQQa94/Cd3rmC/xFunczpany1uHLkd1AybmzRvqJrINA==
X-Received: by 2002:a17:907:7f0f:b0:ac0:b05:f0c0 with SMTP id a640c23a62f3a-ac00b05f592mr254231866b.1.1740991230131;
        Mon, 03 Mar 2025 00:40:30 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b98e1sm764527166b.9.2025.03.03.00.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 00:40:29 -0800 (PST)
Message-ID: <2a18e305-090c-41fe-9b27-97ebe93fd4e4@tuxon.dev>
Date: Mon, 3 Mar 2025 10:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/21] Enable Power Modes Support for SAMA7D65 SoC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_004032_180939_05B062F9 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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



On 27.02.2025 17:51, Ryan.Wanner@microchip.com wrote:
> Ryan Wanner (20):
>   ARM: at91: Add PM support to sama7d65
>   ARM: at91: pm: add DT compatible support for sama7d65
>   ARM: at91: PM: Add Backup mode for SAMA7D65
>   ARM: at91: pm: Enable ULP0/ULP1 for SAMA7D65

Applied to at91-soc with some adjustments, please check!

>   ARM: dts: microchip: sama7d65: Add Reset Controller to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Add Shutdown controller support
>   ARM: dts: microchip: sama7d65: Add RTC support for sama7d65
>   ARM: dts: microchip: sama7d65: Add SFRBU support to sama7d65
>   ARM: dts: microchip: sama7d65: Enable shutdown controller

Applied to at91-dt with some adjustments, please check!

Thank you!

