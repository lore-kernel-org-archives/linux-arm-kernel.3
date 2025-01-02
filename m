Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376E6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ze9LqpjCGSWa0yPDrI54f/7UaaRjSHcJ6CR6aCivtOE=; b=PvMjMAZnCbf2XBakLBtPWuow3k
	psck/eIj5gGGLKTFVtBnZ0f1wEJ1Jk8CZa8Su9M2Sg+/0p4k+3FrDuglCqTHe772v4uPr4cP89+ft
	TIgSq6D2O9a28W0lY8YA5HZBalilDb2Qedwc2/rrkGKrRKg3oLYGae5MmVm95udogSzBl5ofWeUqO
	XwmW8t1rbb/oo/Sv02mfalcDZxN0rKb9l4w/aAyeJLi98pCKOyoWOCWO8UGTwrJka/2tCnQ4kHG3v
	4ZR/A1qQ1jkNZGVfCn7EAjPy/MQF7vd7s06nfmt/xwuuhk9cssN5Mjo+EsQbt6yZdwXopuaULO7b0
	wp8eYOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIpY-0000000ACsp-1eJE;
	Thu, 02 Jan 2025 10:53:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIoO-0000000ACja-3kzc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 10:52:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so5676600f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 02:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735815139; x=1736419939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ze9LqpjCGSWa0yPDrI54f/7UaaRjSHcJ6CR6aCivtOE=;
        b=TtMCVYHrOl4vMtz/hVUpt5xVqmS/YQa+AAqGADfggI8IxLj49HslpEqFB/uS919oxo
         8tJ7MrrcYspWkihg6mitAuuTMfzAUd73g88op6AWY/O7+0R4FsRGpfQ3nN7v8+2190YQ
         /4tWY0Jt3FZIprDdAcFJ1Y0kw/zgVTW4kkHY5QLTFk38/7eigvgEz4RBtTHQgfbfSO2U
         G+maL+ZonS09CK18r2fqoLO2/3TMXnrmGh4n+1Y62vtwk/l2MbbZObHeHUopTkC/9Pnq
         kV4idj6vWctItURFt2OXL55u+Sea/WD1U3TgHr01DxzmlRK1Kvn2i8jl3ysXeQtDBLWu
         ZR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735815139; x=1736419939;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ze9LqpjCGSWa0yPDrI54f/7UaaRjSHcJ6CR6aCivtOE=;
        b=gFUNdr6MOQy798kHagUgdvPK4KBd4rEJXDvdm2nugzNmA1KChFqJeb/EyouMihzJVY
         ReuB0M8XZ/RGPdNpMs62VJXjmrp5hv/vaaiJ8p8KEDzasELRSSq1vslBcJHNvQAwcNgO
         YQP6reOWoktZrAT645od49QTuISDI+bG3AmIrhruiMa3dgbbJVXHShemXO9/ANH/tptH
         iIV0CfTkaj4/MjeMD2Eq6Rlb8HXZL/DO8fT4XDOEiTPc9IMWr9mFz/Fv8+ZptuXKcx7U
         kWKTiNC0MEpMd6527+gzES2h+b2uG2Du2tABN6J3Ao55rVDBTzm+iEyj/nf+O7s89PCD
         /Ijw==
X-Forwarded-Encrypted: i=1; AJvYcCWCYnaF9tMzunR5WQr7TZKn9LMRNAWusyM6I0fsIBEMoF0T+LVMjm6M56cJsD+aOfJPXOejY3V3KwBsAGsJUuwG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9N5uvJ+kridIbbtudqjBFS7mOgouXSpkaCmmVW1MxjlsT37oE
	pZ/+30RvUDtv8mP031yDkzpczwB381CWAfE84REcVusVbr62Hm+xM9RYwdArJgE=
X-Gm-Gg: ASbGncvz7586WRG9RQZqZtrRqH4Ykom/VxTczdHfCiWvr2FMCjdTddy+m6TjM7R3uRD
	31ZxJ3sno8GaUj3yycy6RNkPAIucA/peLiijKPGqcG3gdyJI8tSuk094w7XROd0Q0L7btHDIqlL
	J23QfvkAq1zpRa9P4zqeeWaf13d4DOyVFU8vgMe06oSdTGgkAonS++4x6UNBONSmp2FZmqav0bB
	RJ3mkbl1Drfa09ppzAylb7DC4U1/SBBTJp1AMfuSbiBrQbReB29Qpp2F7bccRvgFQ==
X-Google-Smtp-Source: AGHT+IEAXmh4Jm/fooPniPUd+cP6NsbK2SR6lviu3UydjCwVbdG5V5GA3GQCHI+v0JTIHRvlmZHUzQ==
X-Received: by 2002:adf:ab0a:0:b0:38a:50fa:d582 with SMTP id ffacd0b85a97d-38a50faf3cemr11500112f8f.59.1735815139109;
        Thu, 02 Jan 2025 02:52:19 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm490098515e9.33.2025.01.02.02.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 02:52:18 -0800 (PST)
Message-ID: <70aab1bc-1427-44ed-b516-843429d0bdfa@tuxon.dev>
Date: Thu, 2 Jan 2025 12:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] ARM: dts: microchip: add sama7d65 SoC DT
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
 <3f63aebc4b31da1b631ce7e6d76aa0046deeda6a.1734723585.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <3f63aebc4b31da1b631ce7e6d76aa0046deeda6a.1734723585.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_025220_951872_8C953E11 
X-CRM114-Status: UNSURE (   7.29  )
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

On 20.12.2024 23:07, Ryan.Wanner@microchip.com wrote:
> +		pioa: pinctrl@e0014000 {
> +			compatible = "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl";

Please also update the documentation with the fallback.

> +			reg = <0xe0014000 0x800>;
> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +


