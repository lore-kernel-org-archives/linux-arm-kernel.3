Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F5E668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDgXaUWWMXn90x1MGvmiPRPBz637uFXJlZfJg+bhsYo=; b=OALsVu+H2ObqCGI2zhhX+ixw8W
	iu0Q8FyDNXMAc/l6PuLrrCq6B3MNYUwB9w41BaBgV+fxQ81FG1P9g22OaD1XbCOAQy2+nWBdu/xBY
	/WSeyQyQ1NZRF6vcJE1z5VinKDpcveAxN5q4e0rrmrxo8fl6IgW9Urz9F0Z//hKWe/1udh8yOYRQ9
	6Ouj9wa7nR3nguWXrYocMbg1rr1W8apABLprEex5mHO4SatlgorHTbtUsoj1DrJfGJQ1Zww03PYCq
	KrCNvnlTvnn9b/1r+ugWB10ZUAQcW/PJg9rKmUTIx238JeTvygpTQPPWaxu/Qz/KotWJcIShAJ5AQ
	DP0ZNbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCOL-00000005rZX-1Z7o;
	Sun, 24 Nov 2024 13:11:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFCJS-00000005qR1-3DkR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 13:06:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so32109925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732453565; x=1733058365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDgXaUWWMXn90x1MGvmiPRPBz637uFXJlZfJg+bhsYo=;
        b=e8mrRz0/BT6PKuV5NtAUQSYn/ZNf1/9AjJtgST7+I6CC0nlMUEOkXGfc/UDD1VSlMd
         71tZQyvyJKmXbOR0eqsly59hYOP20SODaUEV1/4Uc93+HB0SfoKeha3Lauo8nLv1HaK7
         ZS5Dgfdx9a5/0btkeGSKE8+8r6TjXi/r6GyuStZrtvr9pOh2ebAvviJqm261Rkple9oe
         jKraKQYVPGLGXfbMK4+FUzf7l5nzrbgOjDoEKBHAw5WeAPCdR705tjtwEm6dbtX778pG
         UGZbOxAQD92RsR/JwJdLX5W6GveJ+RcJWQsHp4sIpCf5D5WVXd+64Sbz99Rs8/QZwSJ7
         Kn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732453565; x=1733058365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDgXaUWWMXn90x1MGvmiPRPBz637uFXJlZfJg+bhsYo=;
        b=RHtPBvr7DOL5F7cxvZk0MQvImNOMFJ2N5MdDzPwZbjp8ONpUCO2KQ9kX7shX6is28p
         OphqBybY+R/wAHBxVZTwbQFmR7ZIzD2Kia12LSwWbj7+cu/zAvWDLUYbQjVXzfQokkhy
         c6b6vBcACd01Ye+Rkr/uV8UICijwalhHLXyjs9r3On6wYNWXkUhE7AtixE2+YwZx1AaN
         wBxpVGMJjVtTMoL0Y13znQiMDBNWCn35HjNMZK4lUxzUdgdxYM1Md1ny2bycP06dVko1
         CDVXJziZHsbG6/EkRuHXsIdtZWZuVXtkn36ywb0odxSuoYjV4YF4GlzLR7xYCn2U2n+Y
         29jg==
X-Forwarded-Encrypted: i=1; AJvYcCV5p8uzVAReghOqmEwdCZsJ+QmO4/p8H831O7y4s2+7cEYz6o5jXbh9saEbN/fGWfUBId8kHtv7QYp83ssGRhlv@lists.infradead.org
X-Gm-Message-State: AOJu0YwMwFz+VF/HQj5pw3DZRf8N18pWqKTnryVT3eX10tJww0ab9GAA
	l70aal7JyulMQvy6mlql3XNhBViftCnmqPoeFxLycOqtK0ttLTPcbZqLbVLEzUg=
X-Gm-Gg: ASbGncsPq6eqQcWgOx0/GA22a6vzQICF8RkqpL/oWhp63sdVJGSPHgxWBw3zSwUobce
	3Dg67kboBUQlZASSAYYcz4KRlHuMINIZD5NdXStFFmfVeOE6iCDUGb7JwXX/fe1YFk35OVZbsyH
	h4oyGkH8R395/ahiCnJBDWSxdqV+3XXkjLEp85bJVvqLSeqpb/r0m52eCVVkC1yyWI6D85nGhHm
	p/AVUp4jK9C4SSrNUvPaS3nkejitYyqind5lqsgm0dDZhpkj99SC4AHqA==
X-Google-Smtp-Source: AGHT+IE/ekA4n5NRsUPfRrSQ4WEQs+2aEfMt8e8Vr2hUc52ItH2CCdtUMuUey9X354G87nt1GQ6+6g==
X-Received: by 2002:a5d:64cc:0:b0:382:4503:728a with SMTP id ffacd0b85a97d-38260be41c0mr7533295f8f.53.1732453564522;
        Sun, 24 Nov 2024 05:06:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5f59sm7682760f8f.10.2024.11.24.05.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 05:06:03 -0800 (PST)
Message-ID: <55685905-7a28-4796-b386-1212bc1abed1@tuxon.dev>
Date: Sun, 24 Nov 2024 15:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] ARM: configs: at91: sama7: add new SoC config
Content-Language: en-US
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
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <4c7750b6f29b4ac0e2858ac279af7548e19934bc.1732030972.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <4c7750b6f29b4ac0e2858ac279af7548e19934bc.1732030972.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_050606_975456_B1F6289C 
X-CRM114-Status: UNSURE (   7.15  )
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

Hi, Ryan,

On 19.11.2024 18:40, Ryan.Wanner@microchip.com wrote:
> +config SOC_SAMA7D65
> +	bool "SAMA7D65 family"
> +	depends on ARCH_MULTI_V7
> +	select HAVE_AT91_GENERATED_CLK
> +	select HAVE_AT91_SAM9X60_PLL

These starting here:

> +	select HAVE_AT91_USB_CLK
> +	select HAVE_AT91_UTMI
> +	select PM_OPP

ending here are not needed for this phase, AFAICT.

> +	select SOC_SAMA7
> +	help
> +	 Select this if you are using one of Microchip's SAMA7D65 family SoC.
> +

The Kconfig changes should be a separate patch.

