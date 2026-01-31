Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C44D79769
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvqefg16Rmvo4J9ek0jHyCbWNlZ8G7S12EAE3iMNgmA=; b=ZJ3mpiW0ejDW9jFoQwUgLfBrFZ
	L3zfh+tNQJ/BCypWqJTaRxvoqQ2w93Pp7IAr1RUape/08zJDXYvaJoEdK/ztm1A0WChKBitn3FBgl
	miDnDA2YRi1bIEwkrs4l0w7UpkNd6j9pjjvVFfx2SiC0x7WY3IjdjELbFH+iNANWFm/rOXl6EXipp
	ajGXJer8wcvApS5iAlWobvlSqt55yJejabKs8DaglR4VFtWNXvKdWzEpliaMHDaVe8UBprF2QJIrc
	Ely3oBsr7RnPloPbj48XSohX76D8nAYZUgTVf8Lw0WAf38yJXdtVbNQds7g/Hq7OojUzgF2YNBNqY
	r59eq9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8bG-00000002VQr-18vC;
	Sat, 31 Jan 2026 10:53:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8bD-00000002VQR-1s9Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:53:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4806bf39419so24194425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 02:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769856785; x=1770461585; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvqefg16Rmvo4J9ek0jHyCbWNlZ8G7S12EAE3iMNgmA=;
        b=otki8c5k61wxIllfrHHQpEpSiC4OH2rjNUaeVkiGySgnS4pvlN7Dx1pJ7RW0CMQJIR
         dpXljuY0hSGJgx6ETrRlSaaJ76QJcACxk2GKHskaUpzhdmqvg3rcNr9nj9xFLondFigp
         UIP7lJGr0695k3+2Cho3lq6IHCue72KPniQh7YTtx5MrW3o6vm7zSFHvVYM7sxINRsKH
         wKp4GQ2UhJ9Gf9PcMxlcl9pN4M4e9tAOhl8VFWevzcJp+qPNwfbw4UX6IyqeuJb4WoCk
         XpThHyxAJmCr4ZuSfkIlu+yODRpAemwVbO8mgYzzlncIg40cfaK955A7dQyhAEYiRTmu
         GYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856785; x=1770461585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvqefg16Rmvo4J9ek0jHyCbWNlZ8G7S12EAE3iMNgmA=;
        b=A1Jjpce0exnc8xinTbpvI2FObA5prSBc2OhHp5ly1pUTKVHN65FtQuQUUiJq10D2cG
         wK7x4nTrTa1MzGkSPL/w4gr5hJ0RIIgfYppDI/WqBgclHYeEsuXVisKR+M1/q3vhPBp6
         sEaY19HZNfS5YlbJEj1gsC19a4wrRjUIik9TwYyp1HnMjGU+UAHAojEry6nOXjxdnw2u
         iPbh05OFjjOKNjsvvfvxNK3mfGR8izQ7YpZ4BKt7+cal8nkoQvocuAINrEmy2yD8sCvw
         EvA9jE7cjlGUVElg8g28Mdwme9KLUPRwXbHupm8hiRgC5ILINC9qUTzSzxXoC6tGoq81
         oiOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV8dhiOsB5meF2RLqPEI78VjKSOTs2ac6DKh8iI+pUaEEJJ6EHuUoi3pRUGIWHi97CmXZuNffVUd3oCUnIKz68@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw/BcQ+wXJRrubufuTYOAH6C6Yx7ab7ehB/O7tWCH135D0kyn2
	xb95BJtWcpYYJrVAN/Tz2J/W78oVja3Vclhy7aFZ2euFt5xk1fSoKlGgJcT2AJji1Ik=
X-Gm-Gg: AZuq6aIT2AUH0iQL11DWyO9KTNw/0KwT1DBbe09/I6JeNw4YSzN3i6y+w9PHBy2VKP7
	4Bkrf+DYHdFXnO+JnNeXu+q8W3OizWfP1qioPzFPkpKNLT46lUAKc1m/gWjU3L5OPit5BmsDQHN
	1XL3whIC0yTqcmG+z3oCPx7lmqiS2F6xVXNh+12Dd+J7iPsvguhVBaM6rNy+8pDytsy4MN50AqN
	eXWoTpHzyiybdaI9uO9vyBQrozYkX3zTxO/XIoczLlgcYjmB1rrn1TFK1imiwr0jtEaKHUCi7WC
	zrIPDWyyWrueAUNd+xWaPC7a4mB3+tHbUsN7eA96XwZNwE49znobEpb8EVhEIB9hvy1t3rOwHyf
	1W7Q6PgvPutMZ30zr58+AJHYVGq9iXNpWwacsoGwESxPR9E1hSawG/wFXOB2Xk46h6M0sz4/qD5
	g2yD4DacdDU6PjOOmkWM7E13fX
X-Received: by 2002:a05:600c:3e07:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-482db25935fmr74451525e9.1.1769856785312;
        Sat, 31 Jan 2026 02:53:05 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm482329495e9.5.2026.01.31.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 02:53:04 -0800 (PST)
Message-ID: <a0da0295-f397-4f5f-929e-c95803aa5e5f@tuxon.dev>
Date: Sat, 31 Jan 2026 12:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/31] clk: at91: clk-h32mx: add support for
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <9f6f22bfd5ca47e4d1608282d13eb80a9c01865a.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9f6f22bfd5ca47e4d1608282d13eb80a9c01865a.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_025308_144014_1BE1F72E 
X-CRM114-Status: UNSURE (   9.97  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Add support for parent_data in h32mx clock driver.
> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-h32mx were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

