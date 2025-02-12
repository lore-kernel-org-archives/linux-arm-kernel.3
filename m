Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760FC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4plJ+TLmBGf/WTNjrm+6CqwSfdP84ackQKWHmK37yA=; b=cyvM1PhXqlnJEDqQXePD2ZoHjQ
	9c1Lqo5Uopifjc2gj7rasb6FLgRrrOI2BpFZkXRNYti6CTZz+FZHsV5xlJs6rOJttZOWel2KiTS3i
	ObqGS8Jw2BSUXPl/5/kn6i7cpj4sjaxrqkjRgcEfZ4EtbTkrKB3Sh+ojrSkWVKWBNMIasTr1cAINR
	GnB0OsPPv6k4MkfMi4sOwyzVXYBNDz8StgdhHnUSJZyqpjly9qtUeeDUu74EoROINI8y8ky5810Ze
	k5oGfwlj6QTrIpl13KZimDToPXY2R0DfHiIPrT538IbRI6vmJaRuq4zwjpfNm63ik432GOktPi0zz
	sg5+4a0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti85s-00000006cYM-16WD;
	Wed, 12 Feb 2025 08:27:40 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7zO-00000006bAI-2vfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:20:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5de6069ceb5so965824a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348457; x=1739953257; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4plJ+TLmBGf/WTNjrm+6CqwSfdP84ackQKWHmK37yA=;
        b=XOOiuDZH+1vLdgU1eSvy9AtGKvoZo/E2MXd7Os6P9n/pslCXJwN50T/M+G7Xe0c0t1
         sxVu+HDGwHppQzw45rvIDns6I+Ham82eeIEAYkF0IokawJVbtcZYDSLRjMvnVdrsPTgN
         6Owdam08mTURNvsQ+luMVb9A8YM3aqnHKlZ+sDoSglt+t+EAttiA+R/A+52kSSEeTlbt
         ndavZDMGl9NIbc26wUVPblOJK3yjQEKf1IPpvcWBFCRvRbmBDX4H2KHUIotTnJw2RMmX
         UaPV8QSqtq/1MvnC3eUKLHDDo8pF5ITY206+3yipL9jaU3afQNlpBpYahPyhpGNcvfta
         hSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348457; x=1739953257;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4plJ+TLmBGf/WTNjrm+6CqwSfdP84ackQKWHmK37yA=;
        b=Pfps17KvQMoCIAilfMcjdQ11gUBocBA210nNOWYafp/zObNXUPPH94dW49fZ1zaXE0
         JG5cGfHjpEqK/lsNu8mSMrNojlPYh0M6A8eQsunH/9QdGXriK3O1z+2lCRFFrmA3TSYI
         SnWMkyv+HgoV3MbBxjXGG3k+X77dMQcDFv+Xt+XiiEtSVC7+G5Ia35nL9ZZZjn68WUBQ
         Dxd1NI1hsgBLjTRfFRx5ium+REZ/V/ePWn06TRp/OpJSaw/6eOS8IAhGNoj48Ur9IbYD
         BvhtXwDeGmczWBkZS1U8JaIC/MQGTYdFGewR4hrYK4an9BAHxonsJmbBuDaprIn+Jd8z
         TGfg==
X-Forwarded-Encrypted: i=1; AJvYcCWS+B9l9WGrysDURR4quuKcoo0uc0w4DWwHk8T8hCP60t1eIUj3UxkGQCzk7LX+KjI/O64eFWYdvLDd8I5CPvhD@lists.infradead.org
X-Gm-Message-State: AOJu0YxKITDyUVmtzY0HOkoXz5fk5jYceG6giTxsWFF37wewhBiLgMxh
	DSOyscf7xtgB8OjxDY3hIDCIlgskXaPXpiG5ezX1kOYuQWk2Yz8+09g3WXEntkA=
X-Gm-Gg: ASbGnctJSGK2kMRWzrYy40G90J+61AizrrgKY6aSwRXEjazl2feumCaT9LbjKv3uKfT
	iD0kSkUbrbnGDvH0cnbaGrVpvcUAGpUYjoJTrVlQSHizzCBkdy30wFW0WX8+9KtUUpEMmPKFi52
	aApzypjfnaRyjIFOYKUdpCxqkOq0R8OavOuOJrL1j7UurkRIoG2sqDgG2dk3AdUVhRTDLSV6fRf
	62DD5LiyUtiqFdocCzx23ez9rfUzMvO6sau6m4huCQTFOKDNRESbqItzvzycAPG2l5QVV4vYyPp
	NJbETPx+TqEVid+D1cywnCJq
X-Google-Smtp-Source: AGHT+IGHgQnz97yzWagUt64UI9llWg0kGJkKPM/iEqy5L+liOX9Mj9QGFUHTzEDBGabzYNsN0XqmLg==
X-Received: by 2002:a05:6402:2084:b0:5db:68bd:ab78 with SMTP id 4fb4d7f45d1cf-5deae0ea210mr1791667a12.10.1739348457023;
        Wed, 12 Feb 2025 00:20:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4fe72207sm9052128a12.38.2025.02.12.00.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:20:55 -0800 (PST)
Message-ID: <82b072df-57b2-4668-9439-1a6c89788268@tuxon.dev>
Date: Wed, 12 Feb 2025 10:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] power: reset: at91-sama5d2_shdwc: Add sama7d65
 PMC
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <e3bde200e4b8efe69656f1ecc9e8e7c5c6f631a5.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e3bde200e4b8efe69656f1ecc9e8e7c5c6f631a5.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_002058_741813_755F58D2 
X-CRM114-Status: GOOD (  14.49  )
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



On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add sama7d65-pmc compatible string to the list of valid PMC IDs.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/power/reset/at91-sama5d2_shdwc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/power/reset/at91-sama5d2_shdwc.c b/drivers/power/reset/at91-sama5d2_shdwc.c
> index edb0df86aff45..0cb7fe9f25a07 100644
> --- a/drivers/power/reset/at91-sama5d2_shdwc.c
> +++ b/drivers/power/reset/at91-sama5d2_shdwc.c
> @@ -326,6 +326,7 @@ static const struct of_device_id at91_pmc_ids[] = {
>  	{ .compatible = "atmel,sama5d2-pmc" },
>  	{ .compatible = "microchip,sam9x60-pmc" },
>  	{ .compatible = "microchip,sama7g5-pmc" },
> +	{ .compatible = "microchip,sama7d65-pmc" },

This does not apply cleanly on top of v6.14-rc1. The conflict is on sam9x7
compatible which is missing from this diff.

>  	{ /* Sentinel. */ }
>  };
>  


