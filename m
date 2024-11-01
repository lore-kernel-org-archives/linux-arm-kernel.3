Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9263EE674BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=; b=FBX9TSZiN/wRJJH71qOfqFvZxh
	GVrbFfnebZ8eM+iSmXLGg2BraFPvWDybZl7ceLtzFa4lOynHAIQDpcv3/0EvwiTM2PH49txu83xIV
	B9AYMQiui+RMCgeFQkoUK0MXRGd1frIjhGnmHQeB8C1DuiUkqDTH8Jd0h9AHSWq0fTkdIbMHASs1s
	O3Z187ykKVFE7OYMmUkq3YdNKQlf1tBu9N0aNbQP5msfPkAhFPiwpftlHHtAfpcYNxVNV66x9FCdV
	KG2O+ljddi8yw59XOMY2Tu2tkow6hcI7J8leFOV2NZF7F9mlJHNDxYw/H56WDqVTkc3ku9Twn1DaE
	sNJ2a8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nQr-00000006KeH-2KTn;
	Fri, 01 Nov 2024 08:55:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nPB-00000006KV4-3frU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:53:19 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso236096566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730451195; x=1731055995; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=;
        b=d1w0QVSqXN0WrSMrniWR9tBW2WtcTS4vxm5TgMDyU5vdZ8kUXpUlTuzeVlT2a4LXl0
         Vx7Xa5A0Dotsl9+2LKaP3z7EEk0ObggnRFgsde3xcQeesz4SJYgQhlBP1j+i/25eTlWE
         Ez1RfJBTkTWW7tA/fyuOq3swaJETt8RiQd1nHoe1uapm1j5v4ImSoZTlUzULithesdet
         grk4/oxuu7Ow7IhyRcD6t2s6cokBceL7ExhJSeRh4mcJIFI2fTbeyBQaGIrijDPebS+d
         x9AUuDNKC5mtkPCj/w1ZSGDmdZWGuowuIKIundgohMdI7NBkXR7Hedg2kIej22HPYLm9
         QsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730451195; x=1731055995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=;
        b=k5D4AB4rD3Q6p5Knk79ldBbC9HQ94Ow0ZvjHPqWZbjbS5frTmv+mkqr/WAOi79R/6u
         yVXoB24w+wv/uFht0WMyV9fvlqKNJDIyXiikMp5lct9YSb+PmnNxcjJ7gioy3NWgZxxP
         V8V4IeMjlSr0XCX3iQVEwbU+JIkoS9WcO1UnAnwl2DW9YfzuxCIaakHeYHgtVzfmZ5h+
         Javr5VL3whIlFSVsPCplKBoJeEwHnjljhHpO2HnPL8g4qEKgGwkoWFc+y/Uqwufp/on3
         CvKgEQcVwy4sS5xJO9Vjengk3J328qL2/viYwKc+spszpu7cExTihPSiw4X01TYQ9JUS
         sqFA==
X-Forwarded-Encrypted: i=1; AJvYcCXNtoPEhaD8STvuFG6492/6zLarnp3D6DsdN9w+1TGGP5urA0pEqmeJ+V5HyIE5iPqWhsAufnfe7zeFfQShDpNo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy81YyEQ/ZtlCPUoChkOCiQIcwUysfBNfaK0jSI90hdwWoEUzYP
	YH5P8XEX1FP+MjIu+lUtaxAgQYF/WxT5VaCyQm1igWkaJfjE39qzJL7qBSr9ZZ8=
X-Google-Smtp-Source: AGHT+IEj3KxbXi2bqvHFQc5tuBqv3rzxtxnuw/COMIJuYYxNFOMzNrLwH0maLO3jY5NZdwEHAAxYkw==
X-Received: by 2002:a17:906:c113:b0:a9a:533b:56e3 with SMTP id a640c23a62f3a-a9e5092a4b5mr640607366b.26.1730451195054;
        Fri, 01 Nov 2024 01:53:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e96a9sm156826066b.97.2024.11.01.01.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 01:53:14 -0700 (PDT)
Message-ID: <fa63898a-33f2-44ad-88ae-bd125e48b71e@tuxon.dev>
Date: Fri, 1 Nov 2024 10:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
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
 <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
 <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_015318_098675_1911A33E 
X-CRM114-Status: GOOD (  19.03  )
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



On 31.10.2024 11:46, Krzysztof Kozlowski wrote:
> On 31/10/2024 10:26, Claudiu Beznea wrote:
>> Hi, Geert, Krzysztof,
>>
>> On 31.10.2024 10:43, Geert Uytterhoeven wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, Oct 31, 2024 at 8:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
>>>>> by the RTC. The input to the VBATTB could be a 32KHz crystal
>>>>> or an external clock device.
>>>>>
>>>>> The HW block diagram for the clock generator is as follows:
>>>>>
>>>>>            +----------+ XC   `\
>>>>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>>>>            | 32K clock|      |  |----->|gate|----------->
>>>>>            | osc      | XBYP |  |      +----+
>>>>> RTXOUT --->|          |----->| /
>>>>>            +----------+      ,
>>>>>
>>>>> After discussions w/ Stephen Boyd the clock tree associated with this
>>>>> hardware block was exported in Linux as:
>>>>>
>>>>> vbattb-xtal
>>>>>    xbyp
>>>>>    xc
>>>>>       mux
>>>>>          vbattbclk
>>>>>
>>>>> where:
>>>>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>>>>> - xc, xbyp are mux inputs
>>>>> - mux is the internal mux
>>>>> - vbattclk is the gate clock that feeds in the end the RTC
>>>>>
>>>>> to allow selecting the input of the MUX though assigned-clock DT
>>>>> properties, using the already existing clock drivers and avoid adding
>>>>> other DT properties. If the crystal is connected on RTXIN,
>>>>> RTXOUT pins the XC will be selected as mux input. If an external clock
>>>>> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
>>>>> mux input.
>>>>>
>>>>> The load capacitance of the internal crystal can be configured
>>>>> with renesas,vbattb-load-nanofarads DT property.
>>>>>
>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>>>> --- a/drivers/clk/renesas/Kconfig
>>>>> +++ b/drivers/clk/renesas/Kconfig
>>>>> @@ -237,6 +237,10 @@ config CLK_RZV2H
>>>>>       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>>>>>       select RESET_CONTROLLER
>>>>>
>>>>> +config CLK_RENESAS_VBATTB
>>>>> +     bool "Renesas VBATTB clock controller"
>>>>
>>>> tristate
>>>
>>> Good point.
>>> However, does it work as a module, or would that break the RTC?
>>
>> On RZ/G3S the RTC counter needs the clock provided by VBATTB.
>>
>> I'll try with this as a module.
> 
> So it will defer, why would this be a problem? This does not look like

No problems with it. I wrongly phrased it. That being said, I'll set
CLK_RENESAS_VBATTB as module along with RTC and do the proper adjustments
in drivers/clk/renesas/Kconfig.

Thank you,
Claudiu


> critical core component, which would halt the system probe (and even
> then systems like Android put everything as modules).
> 
> Best regards,
> Krzysztof
> 

