Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B5E68960
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPySU9GG1bDdptaowyq3VjxeujL5zBs3sjWS8sIYgHw=; b=Jaljypqg4iCoB5t+aBxLg6oN4v
	QTtOvPM9aUqdYckIgfRCfIxsDqJaDMCEyg0sUblbPyjCZUqdg0g6T1HsNdK2RmPIVus6NnbdPUz9t
	kTCeRVcFyeFAftbCqjtn3zHKjQIjiMy6RmPrYNokg+u/ubbthudJcqhWjmFfhbKqeKwOpoh+/tu8w
	wqW+y5n6qqcQLi72n3XgWq+0e+QfWcbcIRh1C/y7uEVN/6QB5N77I/+odPAHWNf+8ORa3V7OerX6k
	tfz0ZxC9ZxsbRhh+Ik+ZnNy3MI3E2e9y2qnGDRe2k7cvdGJraRVC0YqILw8mVDBmzdO3oBN9Dl04U
	9Xa7nmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RTQ-000000034rJ-1qEz;
	Thu, 31 Oct 2024 09:28:12 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RRk-000000034hZ-04s5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:26:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53a007743e7so766850e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730366786; x=1730971586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPySU9GG1bDdptaowyq3VjxeujL5zBs3sjWS8sIYgHw=;
        b=aSrxzbNjrd7qqcPH0kI1zRrb86NMEu5aOz9b3G9df3IP1eVOM3hp8Szkhx5D/3uOED
         ILWABO65qHpJmknjo4sTF3f+g8Ths0SE3NIyX3r932W9th/CEkGlaR6S2uXHdU9XYbEX
         rKXc5ZlQ9NBbnUw/iW1TkluhD8CaZ3dIbiyWRLZ2Z6pdvNIAdnV7CCvx7ZkpkPuAceL3
         IVKFMOxzkJJgjCKtMVZQ7e/uRYjrHvApqO0PRfn6+BN83DWtlpTrArgEYGmGBiVTlmgm
         JniQ1qS4jZnK3IEYSbgCrofMXFBSNNx+RXYbmmc/GxOg5G9DuGitpYKzRN6FxCK8Kh/w
         FyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366786; x=1730971586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPySU9GG1bDdptaowyq3VjxeujL5zBs3sjWS8sIYgHw=;
        b=HONEj7J3HzG5BNfxGJ3omVSOFANqhbejnJAGryuFC0fXIMyLoI7+C2NvZN1VuJCfQn
         wI7eRAKwxTgyxD+i84t4R44pj+5SESHfSF2EPVg0d0dO3/XKkSsRQomI8zSUHhYyAo/q
         /UnmH7MW8TdiMXSIOC2UwzvAPtT+n4/R/pL5igw+OgKlBCsQr3bQJGwwVvR6jY4OrsEG
         rlRCuEHcxPZboF1UtL13BedioQaZbTgr1gEVpE8R3TLUwtzfKk48e9I74qphSXIltkY5
         L2rdEQMQbxRNqbIPRmh5ijXVhlyJSRX1kLLFdtaGTXmlO3FO9V8bSz7xi7XY+BBjeWlP
         Uy4A==
X-Forwarded-Encrypted: i=1; AJvYcCWF1/CNrFtHdjC7iStBbzqPH9TUSFLGqVoybqrzKq1yi7t6NdyxWHMGjk6rKcbl4FePFM/Oy1h2QalK0u/zMQqg@lists.infradead.org
X-Gm-Message-State: AOJu0YyRHtR8r8MGIoPrP8M1v9r48UV6R1JFVb78pWjcj2Uj2NzvpLN4
	Ngl7bb79WGleAL3Mhodofb2mnt27PL8SyjOSSJczgC658pKozutw6n9TJVK6ik8=
X-Google-Smtp-Source: AGHT+IFx8MLTqlbYOXV70FjxcgUiPu/8my35yVrkTf/0/c/FdNoy8F04GpO/K6glzhe+yo4QhhnwIg==
X-Received: by 2002:a05:6512:b94:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53c79e8ec22mr1531829e87.45.1730366785959;
        Thu, 31 Oct 2024 02:26:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917fefsm48372175e9.16.2024.10.31.02.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 02:26:25 -0700 (PDT)
Message-ID: <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
Date: Thu, 31 Oct 2024 11:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
 <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
 <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_022628_212690_773C71A2 
X-CRM114-Status: GOOD (  18.05  )
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

Hi, Geert, Krzysztof,

On 31.10.2024 10:43, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Oct 31, 2024 at 8:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
>>> by the RTC. The input to the VBATTB could be a 32KHz crystal
>>> or an external clock device.
>>>
>>> The HW block diagram for the clock generator is as follows:
>>>
>>>            +----------+ XC   `\
>>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>>            | 32K clock|      |  |----->|gate|----------->
>>>            | osc      | XBYP |  |      +----+
>>> RTXOUT --->|          |----->| /
>>>            +----------+      ,
>>>
>>> After discussions w/ Stephen Boyd the clock tree associated with this
>>> hardware block was exported in Linux as:
>>>
>>> vbattb-xtal
>>>    xbyp
>>>    xc
>>>       mux
>>>          vbattbclk
>>>
>>> where:
>>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>>> - xc, xbyp are mux inputs
>>> - mux is the internal mux
>>> - vbattclk is the gate clock that feeds in the end the RTC
>>>
>>> to allow selecting the input of the MUX though assigned-clock DT
>>> properties, using the already existing clock drivers and avoid adding
>>> other DT properties. If the crystal is connected on RTXIN,
>>> RTXOUT pins the XC will be selected as mux input. If an external clock
>>> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
>>> mux input.
>>>
>>> The load capacitance of the internal crystal can be configured
>>> with renesas,vbattb-load-nanofarads DT property.
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>>> --- a/drivers/clk/renesas/Kconfig
>>> +++ b/drivers/clk/renesas/Kconfig
>>> @@ -237,6 +237,10 @@ config CLK_RZV2H
>>>       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>>>       select RESET_CONTROLLER
>>>
>>> +config CLK_RENESAS_VBATTB
>>> +     bool "Renesas VBATTB clock controller"
>>
>> tristate
> 
> Good point.
> However, does it work as a module, or would that break the RTC?

On RZ/G3S the RTC counter needs the clock provided by VBATTB.

I'll try with this as a module.

> 
> And this is missing
> 
>         depends on ARCH_RENESAS || COMPILE_TEST
> 
> which I can add while applying.

Thank you!

Claudiu

> 
>>
>>> +     select RESET_CONTROLLER
>>> +
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

