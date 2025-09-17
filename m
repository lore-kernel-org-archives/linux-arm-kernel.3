Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C26DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZNcucLNP4mR46I0TWwPFtv0PUd9VAWxLOjNJ+Jrcyo=; b=nKBqZoEDbTn5jN5vgorTCMjHuv
	D4lhSIDvLRy4DYh6G/43oWc1Ld6HNobsXd5E/Smn4v9+lJo2QxbvnLJeuwjh2mZmwCzcp4V4gA47J
	JlaDpHn1EWHW4RPh/qnBt2WjeUoE3erwrC5yghxCnBsacNJjQVJa6uMS0PC58RYYhiu6tHMGBCsFv
	gmVnKqyyUOrZscr78XcilhImyd5o2Zr4wnp7zzQV4BoPIYQadsdvTJkBZOBAY9lpiQxyZ2cLf/T4d
	YIJkTYuHuvEBiKrUrd9y3pM8bDNmyim2vJfM/4q3JXHG9/1aaT3Fz+6RtkRf4FQqmlrV2lj4xxbXQ
	RbxqyaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvNA-0000000DKD5-2PvK;
	Wed, 17 Sep 2025 16:51:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvN8-0000000DKBL-16Vv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:51:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so19855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 09:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758127868; x=1758732668; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZNcucLNP4mR46I0TWwPFtv0PUd9VAWxLOjNJ+Jrcyo=;
        b=g3KXd1erZoMlOjZXdZf3vx6B4/fzykB9yUGk1n68aRNxgtUoD6o736mOxyvEPt7kfS
         6P6jfrDJjTkGakOe0iLGDaalcImoApFPOrAmzfoT3dLpDol3xShD+Sr7/QCCYrvKbme1
         d9O5orHKoByCw8pD5b8SdtynBKZ+6K0kKktlAnfIvIVBBDf4yy4FL1Ntr51pejDo4HcN
         GIEPTEeBdlwd3fcjG88RrRhDV0WVAoG4QFoPK7NSct9Up1pqppOcC4n5hm+n7uoElZUG
         ShiP3WO5TZhglT8qt0KQqEa4xUIgkk6ITyKnyrd1vraGBMWz+DNc6QRDZUe1kwWcrMPi
         lWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758127868; x=1758732668;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZNcucLNP4mR46I0TWwPFtv0PUd9VAWxLOjNJ+Jrcyo=;
        b=Uean8k082wbNIQJijhKjsH3qSOopKfI1rGQnCGP0WMi7o5eiqWVjQY9e/G+5I8oIcY
         Izf6MFFvMCmSvilEl0QnbLsMLwVUhgx39EhVob5EqZPmFA3IP3dWOUMUuUBZDWX1s3Qi
         ipSGcquB5rnkknUj3tFTGKJ/ZrHLuAO0l9hqA3jLJT0OBv8CPaVZAnieyYZx1Ptm2wdA
         0QtcdIpNQJadHQYX3OlLBfQiath3dfgqelXPu27zaIGpkal4jmG7rXGTzhb82+LrCbhf
         iFvvQko1wt/iv9qs7UvZGSgH7ZUwHp17SYGzmfpkNbdTsO2Id/gkmCI3YmYoFYHkrtgD
         WzNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq7KkzgXsFSAjyCY25qxMygiMwcbsq1Ew60HcZWlgtammxyvKdCILreVN4QotDaHqvcyWl/ib5XlGS3Am6wsXq@lists.infradead.org
X-Gm-Message-State: AOJu0YxUSV3swXlETq0xVY6B70CvcJueWAr8khI1vi6t0IHQa5dbQ/et
	gypKGKBf+KK34RppZxM1wWFK3Kg89ySQdNGhTzI9EIKsTIAINox8BpbwIds7jy7ma7s=
X-Gm-Gg: ASbGncvD0YYr+Y5nZ5awc1iPl7Ie0SizBpe2ImnpdID9Sd1usAqfE0n9pcZrtYPDq5T
	qmaahYiyJHl/RbECOjBiHI8xdt0VpHeWy76It1tmi15mWVzYUiJjokW39mPNZZO7TZWI9Pd7fw0
	F74UanmHfpd9JjjmohAiXtKO1D31ALl9F4JzaZTLUYM9MUXUQ9TFN1P18+JvkOvFfJzy4uoGvy9
	D8KxcmN1tyzkr8Phpkd6BiVAWuweFYDWSpxgbU2KLGYqbihnY1hu+B/eO3qiyHw2F7MYidX9CB4
	DqUxnghEHf42KBrwH6z/tDaQsm0RQ4Gf5dLcmLOFHejxsZeq8zSr3QWxughPoQDjEWbBNeyWvSt
	X58k59/r7aRWlM4VUnblkXnw5WDqeuFI=
X-Google-Smtp-Source: AGHT+IF1nrUouqCOeE6wDOtkdHMD2AWyWimjxHxsQ94F2pzaPGFfHQDSxdsvbeXDPczFHDXsujKBhw==
X-Received: by 2002:a05:600c:3587:b0:45d:e285:c4c6 with SMTP id 5b1f17b1804b1-46207a83da5mr28634175e9.37.1758127868023;
        Wed, 17 Sep 2025 09:51:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07411f4dsm64874f8f.26.2025.09.17.09.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:51:07 -0700 (PDT)
Message-ID: <a59d7be5-f767-4ce5-9a88-5a9b340c6643@tuxon.dev>
Date: Wed, 17 Sep 2025 19:51:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: at91: PM: implement selection of LPM
To: Ryan.Wanner@microchip.com, sre@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux@armlinux.org.uk
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
References: <cover.1758051358.git.Ryan.Wanner@microchip.com>
 <98b7e9347fd15e45e2606d0e89f09095887079fc.1758051358.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <98b7e9347fd15e45e2606d0e89f09095887079fc.1758051358.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_095110_465559_C8A2459E 
X-CRM114-Status: GOOD (  12.07  )
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



On 9/16/25 22:50, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> The LPM shutdown controller output could signal the transition to PM
> state for different devices connected on board. On different boards
> LPM could be connected to different devices (e.g. on SAMA7G5-EK REV4
> the LPM is connected to on main crystal oscillator, KSZ8081 PHY and
> to MCP16502 PMIC). Toggling LPM on BSR PM mode is done unconditionally
> and it helps PMIC to transition to a power saving mode. Toggling LPM
> on ULP0 and ULP1 should be done conditionally based on user defined
> wakeup sources, available wakeup source for PM mode and connections to
> SHDWC's LPM pin. On ULP0 any device could act as wakeup sources. On ULP1
> only some of the on SoC controllers could act as wakeup sources. For this
> the architecture specific PM code parses board specific LPM devices,
> check them against possible wakeup source (in case of ULP1) and tells
> assembly code to act properly on SHDWC's LPM pin.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [ryan.wanner@microchip.com: Fixed conflicts when applying.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

