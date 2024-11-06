Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F822D59F56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ipymvx1/6bALryF6zoyWfiFzrkoooAVpB7ONDyc7qcc=; b=n0rWfzEHEaqlElmTn2x4bAxiFn
	dkOzU5Ar+GtIp0Zibox+IDInVEHFE7l9jMqTQ7Qx3i9QNYHdhApBG1l1MZuDP0nCR8Rs3hH4Inokn
	bkjsuW+UtRA1Yg6p6+ZuY+IkBJqozt5Yplqe71Uyg9sqWaZmjVAL6/I8wl+W/0p8v2GsvmQU0xlho
	ziiEoTttIDbUZUCXU0ef4x2dUC9OzoNTzPQY5zd12TAi/i+CghNvlfyiHyf/In19WLgH3fPju9lkw
	nMF4ZaUtkeDZhK8OXmcxQZmFG5l5Vtuky6AlmFOu3jw3+/iTfAv7cs9E5Zse4UZFGig7vDUofhNlS
	dYC4BEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kEa-00000004FyY-2sNv;
	Wed, 06 Nov 2024 17:54:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kCk-00000004FSN-0Qy8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:52:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-431695fa98bso591405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 09:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730915548; x=1731520348; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ipymvx1/6bALryF6zoyWfiFzrkoooAVpB7ONDyc7qcc=;
        b=l2cBJ9Z/Yi6N9BGYxrHuBm+NyssZI3qRx5jStCh+kXArLCTwvlWNwBaipVTPxDIFTr
         p1IDhubw3Y2n2PVOxU0/K2/8/6Yi22eS2DyMluxTY+GZu12c4IOwLTdtvk5Br1ViAsmQ
         0LAnSKCk20uCTwvZf7Hu9OqPEeSl8c6ucBx9Ww0BvvfK1T2A5IqlL7Kpe6UcT9avWDQR
         +YEQmEmTYmitf79iAvo78ZTrYX1kK3Kb6pvxrE4UKnxUvGHXabruqaS+TD+nKOhuSgNI
         0JyZ3bfAo6Yh+/iumz7Jv9ROnhcq6twmosAugVm09F3gKimj+ejbppNMNuv6CiKg+EPc
         md0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915548; x=1731520348;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ipymvx1/6bALryF6zoyWfiFzrkoooAVpB7ONDyc7qcc=;
        b=hFyIxCfLAdzkt6cSpLpG5G78M63dUNTLao6Gv3DUeI1jbwXUzUtCDHGAPbiVO8D/JH
         4rfT+8+y9a9F6p7PmL7U7STZpujwuGIfXRaDjc1vYI/p4XeEP237oFN3OFKnOglMriWg
         vXnCG9wRKBJ8FxSSW7TZ7wcfEpdPXDyeJ0GM3IVn8JGVybLaXhyLyxNI4BLB7q4Usied
         i57P/9cNWetQ0muHv4Dt99zEnVFzHKlbGDcqOeJxYzgiAh+zMt2DS9AFJouO3RSPcq6O
         cYsHITzVAEKGX4OhR0K+jHUpeu2C6NWnNjjKAa+JE4++peohUPyTfSz+sP3xXKU8aX2m
         M74Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbycJLP/PAy/47did9SXWfdhLY2UiMbI7VI7kr7cB0LQDnNGk/KFlSI458+mhcmyEkiC+ePb784RP0MGV410jx@lists.infradead.org
X-Gm-Message-State: AOJu0YzZfiOG+thbzWCPO68IYBXWFLhoOoJ0D7MkNPQxIZTq1lvrNiCJ
	P1Ba6/Vsb9AR9O++i3BeZ3MLp0wtABOuJBTqle0AUbMZw0/x2ipPEoNxGqEh7SI=
X-Google-Smtp-Source: AGHT+IFIGPqnuhGsKt9HNzG2CjyeWY7ObH0ZmvhCUaj02z3qP4fB3YkNaT4JK7o3DTcS9aJDv9+AHg==
X-Received: by 2002:a05:600c:4583:b0:430:5760:2fe with SMTP id 5b1f17b1804b1-4319ad04fa0mr375752515e9.22.1730915547682;
        Wed, 06 Nov 2024 09:52:27 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4b82sm19841073f8f.43.2024.11.06.09.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 09:52:27 -0800 (PST)
Message-ID: <b8633534-d0b0-409e-98ce-1cb7966e98e2@tuxon.dev>
Date: Wed, 6 Nov 2024 19:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] Add support for sam9x7 SoC family
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tglx@linutronix.de, sre@kernel.org,
 p.zabel@pengutronix.de, mihai.sain@microchip.com,
 andrei.simion@microchip.com, dharma.b@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240903063913.48307-1-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240903063913.48307-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_095230_177599_76ABF96A 
X-CRM114-Status: UNSURE (   6.33  )
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



On 03.09.2024 09:39, Varshini Rajendran wrote:
> Varshini Rajendran (11):
>   ARM: dts: at91: sam9x7: add device tree for SoC
>   dt-bindings: arm: add sam9x75 curiosity board
>   ARM: dts: microchip: sam9x75_curiosity: add sam9x75 curiosity board

Applied to at91-dt, thanks!

