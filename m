Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD38C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUWX2C7v/npw1BHngSXdIYBv3kYifI6qQFt5lUSdhNY=; b=Y0MMBOXF4eHV8hlNCnRcv5oYye
	jiRnVtnfRVroN+lE4WoIGVYe0MChQqf9ER4WVlpxwqyF1Qc2X94TbSX1zRg1nAh0AIAM/AfbQwmjq
	Cff5fvdy1WmrQ9Libkc36aJblW8nG0d+CXCk2uJKILl5FdN0ZuU62Op5znzMt4Atcyakp8EO/Y/Q9
	E4hyfLRq8oEAqdoSAq3JIDLzaBQDWowoh8Cx3gc1YVY0VKX0j1xbuc4TBP7e7Mir3PpxRnVott6/c
	NI3Bp+iMn7zyr4YL/iH59MihNmxg46rGG6cn3ltJoZ2ToGQD2r/J5qjBCIyu6pjOgw2hqx5+z+tI/
	nybvqhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7yw-00000006b2y-1OwO;
	Wed, 12 Feb 2025 08:20:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7wt-00000006akU-143i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:18:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so2203993a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348301; x=1739953101; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DUWX2C7v/npw1BHngSXdIYBv3kYifI6qQFt5lUSdhNY=;
        b=Pk93MDdELvd4pJO28eyTFE2xjZKNvQjZ5V0HnNUDQj3VjASnR2H9K7NTUDLUVfn6mb
         iscd/qAcL1zuU6vG5qmf8Dwv74d7gqLZSuAbjcxUWin4NelC8IIYClQexRG1FxEooO+v
         rurzZtJ2swzrdepSnDpBuInI1H+nJkGkTDY4LvSJra8zE+SJBx/JOth4SrM00xYcAKPn
         HmK5efLKr75YaI42F9B4Ar+s9s9kCEjZkLAB3A8udY8OL4kV1Iy6TQwl1eUmc2h2RYGu
         8Hfimi0VJ/V+C/xRoo1hKsUsFYVV0wBz5buHoGr6MXdBybvN6nGyYHOGCJAkhmzDK7St
         4oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348301; x=1739953101;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUWX2C7v/npw1BHngSXdIYBv3kYifI6qQFt5lUSdhNY=;
        b=lnsEnZK/Ge2D3knKp19K5qeMi15Kt4KkRJuKjHy9P8CSSLFz7KokoUrGfr9A4cbzt5
         /n1uvEb70JOewnfUUKgchKlUPCBzcmJahAXwkX2xAxrmYff+EbRCG5LWc/M8zQi/dIkO
         qrwYuIk1TbQR8FDBaroRV3y1p/FB/j9x880cOW95ltFRikgtgoaShVmQUY+p14wbO8KZ
         G7TpNqM1TB5D/wy1Nf2mqV2tTSc+f1jU8DocdVFZHpLUifE/yhWu1+JfGjxPp+TVuhu6
         myPU1LZtabcPgc43Xsyj53mJKWUz+9RH1oxcwoxIXHHhe5gxe8iSr73ZmoE6X4WypCmi
         UAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlwyL54SOqg9DbD30VZ70r9ax140XwxyTqiFNYV9exVXjvbOdHMditHEXinU6e1r+958G1MkD5cSEDVPso7yZd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4fBZpMzcXGozegXfsnHiUt7SuY/0gOjScAQbpA3cPCKMwNYok
	gJaEtzWBQNgczTAWeZt6M77uqnTtn89awGeYKLJBxYvRAzodrMFIVQ9FafQFcTk=
X-Gm-Gg: ASbGnctF5hxOizv+qLZwumATmpRmtpEhKmA9m1wZt7mloSBFq0OTh+UvIeNpoO1hZoK
	qAxxYJ9Fuf4zzd92a1AOpjceIU5LwPRS7Ui8K/rptqSLP4Ko7AvbzjH3LpNpPWsi51imLpw0wl3
	3AfQT/0cOS1aeLUxz9PsCaiZcqkKz1LuMWK+RBLu6czcV+QFhab1C769y+IHk2/wWqL7mgFDWWt
	wZ/RryHlIx1T/MomelGRicj61YZPOUV860cn9TE3UuYlKfNK2egyWkz8dDA9Z4Nnu15RuTdAW8K
	NsNwY7+7EDKVDnnfPlK+/pi9
X-Google-Smtp-Source: AGHT+IEwjSS+zOVDgDiChTpc71avmO2oV3vQhPuCatbzyoXLnyMKNa1d3LFoa9iHYB9Jc1QHZRsUnw==
X-Received: by 2002:a05:6402:1ed6:b0:5dc:8fcb:b224 with SMTP id 4fb4d7f45d1cf-5deadd829cbmr1660137a12.8.1739348301352;
        Wed, 12 Feb 2025 00:18:21 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5a2fc79esm8071036a12.10.2025.02.12.00.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:18:20 -0800 (PST)
Message-ID: <9baea17b-fb8e-48a5-b12f-7eebee406ee6@tuxon.dev>
Date: Wed, 12 Feb 2025 10:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] dt-bindings: at91rm9260-rtt: add
 microchip,sama7d65-rtt
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <b437898b518910a2f94f7d827608db35e82c5828.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <b437898b518910a2f94f7d827608db35e82c5828.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_001823_297276_6676619C 
X-CRM114-Status: GOOD (  12.17  )
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
> Add SAMA7D65 RTT compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> index a7f6c1d1a08ab..48a2e013a6b24 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
> @@ -23,6 +23,9 @@ properties:
>                - microchip,sam9x60-rtt
>                - microchip,sam9x7-rtt
>            - const: atmel,at91sam9260-rtt
> +      - items:
> +          - const: microchip,sama7d65-rtt

Can't this be added in the above enum?

> +          - const: atmel,at91sam9260-rtt
>        - items:
>            - const: microchip,sama7g5-rtt
>            - const: microchip,sam9x60-rtt


