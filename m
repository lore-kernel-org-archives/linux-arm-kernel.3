Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5425EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJuTW2/wmv0Cni895FL84+N2QJ2H1fwMgsWcI7DGnW4=; b=383e31u49/YZ0lzG8cQRpmOguX
	ttwZfOB0Hrr0ul0YVkb4xMQDPrSwppNB7aL5+NZJ70ruRc6uyLIESmvdVvCfQIQwqdinsTWlDifK7
	zVOXdJTN4WbAtZdLDaqVleXdQNssHEFXeEtfselMjbiwhhI/thsH3e68DK89RtMNO0+tlaJgLmwUI
	zjcLd3kXiRgrDAEJupq8aSrZXOZd8oeNK4pISrTQjC7I4xLpfRBDa7y0QoYvCEU0BWHzZNYEtR7tr
	Nc8BTc3sEkGLoJi8Q8flJQFepZQewZXnizx0a8F1rXLkwDPKpQLt7NgOnS+KK+wqK9wlaNtwCYty7
	IlNs/y0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJUV-0000000AGor-3AuE;
	Thu, 02 Jan 2025 11:35:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJTH-0000000AGiO-3nnV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:34:37 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa68b513abcso2095839766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 03:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735817674; x=1736422474; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJuTW2/wmv0Cni895FL84+N2QJ2H1fwMgsWcI7DGnW4=;
        b=Qzizs81if8BNVNLzGlTxiHhBzCBHXGPE+9OyglS9w/x2p/3wBxjyI1hfcIxdBzBvCd
         RWwjXxw2UQpOBGOzKJOFFIsLenyPliolVPHRI4xSOaeJB0hYr4E/Lj5PTiiP5mcuSECJ
         XiAnzJSZQFOfMKWEGFF9WgQ1CYruqx+Nqihv8CLJOr8o7BidNDbSv9Oi1k5x2QUBQTp7
         2Md9BqE9Pr4kMzsClw8RN4qLhRenHTVPsB7M2Rp9OVaCxpL8l3W6a3SjiScnHmN7E2Di
         1CO2sZycbVdih6pvKNHoBZLr0uEPr8dZ1TB7hr68WO0VV66x06BMKMuSFUD9+Gb0pbXV
         ulHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735817674; x=1736422474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJuTW2/wmv0Cni895FL84+N2QJ2H1fwMgsWcI7DGnW4=;
        b=QgLXjrph1ymm2KquAOvaQ98VUix+qgIWlOw1si4yL5Sg1Wa3EBB5ZT2VQ1UVpxzrzJ
         q4Ag70me5xvxKxtp979XhOo2SYUQ7b0fG6uL8tKt4cbOb9EaX5cFlgMm8g47XSzRILoZ
         Rxmw6UWazu+4NxyEuB1edAa6Kh50Yg9VsZMrVDZvD3SfJ/Q11OrN/PH9GebUuHonC0DX
         k1YxQNVDysYgb4FsXefogRnLF1VbN94g1n4ZZTlJbAXFxT08F7eyQj41RMp/Kc7F7UIw
         H4cvHIT9yEJpNdWjx0MNP0j4I0EdhYNdvpsqZe6+RHf6576i+EkD5uDZ5Mpo0ijexiPC
         iqEA==
X-Forwarded-Encrypted: i=1; AJvYcCXLHI7jjxurU3jBlfhW0aScURnbUIPn1HSICrUBEJ87EmtTF2jityzzNvnJDDcJN5MCYYdr1fkm/vXWjQORcqto@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2M1JhHfJQFkMoisT4BJyGEZXM1/LIF6ZFZPd0CApcr8zGbjuL
	nm6o2yvsiTZmdYMMmM09QqXFLF0pc1yDfmsdiWIdMpU5LQ75RBf75k28AIWNYgE=
X-Gm-Gg: ASbGncu5WuMwZIME6Gk/KuFzJa3GPjgxecDdl3xWNuuDKNZ05eIog0BV4OEAK/apXX3
	r3QNmmQLRnpnJKWxBVSl1AlwhefztsFBnf7AsGFV6FJpRi2Qxs1IL+HGGDyiy3Q2S8gzDQSMMpD
	OrT34gfbTzoyBS+HpNS5tQ1Zbu2raTzKt2PV8nxVZpkXc851mToaWoiu6AiJN5lCQK7IqvcMnyi
	y/AWkToT3N1rP8n7x9WUNO9T2Px/vAkuFWHD5zMENoIDIFtckWm0YTjmGJcalPNFA==
X-Google-Smtp-Source: AGHT+IGIlULUY5OVKXjFZRKGpQ2k3iKZcvVspZWtEdWr47v7SWAFqOFAYEk9fc6/cC6JF/XKlQkXSw==
X-Received: by 2002:a17:907:97c5:b0:aac:431:4ee7 with SMTP id a640c23a62f3a-aac2883fe8fmr4247597966b.5.1735817674243;
        Thu, 02 Jan 2025 03:34:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830daasm1761964966b.13.2025.01.02.03.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 03:34:33 -0800 (PST)
Message-ID: <9f2025e3-5ec6-4a7d-8a4f-d04b343da912@tuxon.dev>
Date: Thu, 2 Jan 2025 13:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Add support for SAMA7D65
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <cover.1734723585.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1734723585.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_033436_039676_8F74E291 
X-CRM114-Status: UNSURE (   7.14  )
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



On 20.12.2024 23:07, Ryan.Wanner@microchip.com wrote:

[ ... ]

>   dt-bindings: atmel-sysreg: add sama7d65 RAM and PIT

Was already applied from v3

>   dt-bindings: clocks: atmel,at91sam9x5-sckc: add sama7d65
>   dt-bindings: clock: Add SAMA7D65 PMC compatible string

Was already applied from v3

>   dt-bindings: ARM: at91: Document Microchip SAMA7D65 Curiosity

Was already applied from v3

>   clk: at91: sama7d65: add sama7d65 pmc driver

Applied to clk-microchip

>   ARM: dts: at91: Add sama7d65 pinmux

Was already applied from v3

>   ARM: configs: at91: sama7: add new SoC config

Was apready applied from v3

>   ARM: at91: add new SoC sama7d65

Applied to at91-soc, thanks!

