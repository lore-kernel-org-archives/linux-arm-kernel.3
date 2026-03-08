Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1EDEA8537
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptNfJY13rqncPY9fxaxMY/4N9QDNKhiHCS/yjgnBkUM=; b=y8wi7elFxNioy6ws/a4FCbyRBK
	2ZmofC4WtrXgNN8C1ihTfu8D/4MFZkgEYOjhL+sOte8tqTQFPh+tuEUruHbWnW4GcWK8lQlGVbmV/
	xQfOrqMR+MgyOElpiVUyYkDg2kuqkwyElQ6O5jBBGZde2BaHs8quLPH9NPVD5nUtBxGiv9f7QI67T
	EPv5kXr4OXziZvPnpeTV5OjMSQZiatyCtUfb3Q6B2iTwOMAlSxH2aBER1wiHqMJ0Wzv0X+sKShG2u
	TqIf0/diXieSiLlnDFodLXq8bFPa25RsHikwbq1b9v89Njg2XzFREIBh4GLVYEAuqAacKzWvWmpmf
	MXSFGkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHEO-00000006BTW-292X;
	Sun, 08 Mar 2026 16:43:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzHEM-00000006BSt-0Qp9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 16:43:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439c56e822eso5259516f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772988228; x=1773593028; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptNfJY13rqncPY9fxaxMY/4N9QDNKhiHCS/yjgnBkUM=;
        b=WUpWRLGaryw4KzwlXY92jEc6TNb5Scn43PG+UFij0QxuYSHNVqCxAu10RLpV5vFFM2
         v7qbDFWMwAlsX8Hx2fm0mhJ075fMmIFQBRWIT8JnLYNT8Ax2uZpK6VV1R0fbg3X7P3i4
         2XMLOJII2A2pMgmWSR9fz4ppKT0BwgFR7zjnAhMWUlBc9Dh58h2EcqsnMY5QtoAXpFDv
         zpO3PRUE5qB7lczEm7Y0byIxmtlJlpSTXj21N676DE46zF7ZQJYI7eKeX5zTC0A2bqrw
         zikMb5Erei7JxQneXzGVY86kcaYlisAOZmOM++EzUAZdBttcaj9JpdhpYIwX7SEgKtzX
         vxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988228; x=1773593028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptNfJY13rqncPY9fxaxMY/4N9QDNKhiHCS/yjgnBkUM=;
        b=DJmRLosiJ5QohDJAJnhI+8OhOI/251RvnPEd05sUpFYDmj48LaPYla67BmJSXAYt6r
         WeyxyWUochSbJ/Lti4cmCfgqZhc1G1GflUu5ndlDHwYEXRYTSbjUG2VUY1Nimtb9bVHt
         0rwYC1saH8HhsW56gkj5angjWCzYlJBano7sr56b0nOaUeUYIpdfLuhIucbOgTT7rUs1
         XZurK1893/1QqwYvP8B+UKMGwNi/37vbSPEJPa6q6DqLpl/AY6ebztpIFnJTSopQ8iTo
         uxrBVlq6CeM69oA3XHp6Q6rfhj3HWRQsoToh9mR1btHHSKxjVK2dPvz4J+I/3nuI+Kn0
         0SAg==
X-Forwarded-Encrypted: i=1; AJvYcCXHXl42QEobzYz8w3Z7FVrdiQ6oM9AS7FhywRf2ftYIvEMHqVG5JNd3YaiYsOZC5orMcWSnW/gYn+C9VjzJNpxv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf33bkeQwhBHqX6C1gUxz7vS0QX5WkgbNFNoRZLF8d71J/EtNX
	YHnFEwsa2CEhSj4WUlEp6n3ZV061HIGX9oB2YsvAbTmTXwgTZ5HNaOZhLtZfmKTwiWc=
X-Gm-Gg: ATEYQzx6Opv3Va1IkGQfNNpr2ETq/yTjjgnX7lmb/ysmANgLDfQtfBXvSzomOyUN9DF
	x68QiLVE0y8XkC5vb2YEl0TEuCCWQ9v+HvImM0tPg7IEIq1nmzIURV1PtGUgViPImKiZyV+0sGc
	Wv5+oZWzHl7Cl1f6oEfGnlMGuQq+10HwgJc8RfnL9/EXow7qpBJxeqpiddSkke0tNq6CJ6F+DBn
	de2DpiwJPGkk1ifWAXNC8FWDLiAh5/GzX1ZRjZ9cIF17S1bcTVaK6RWjrCmPpoZyXGW8nFo7udL
	47uU3+b0gf0/I04Fm3cAOpoD4AqU55dKArEIp50+2YuDS+DOgRj3GCgkOwA7UzEs8mrHblWn0zL
	fu8YuYFLgKfi+3CMciNNQGG/hYm72Pa5WnniJ/NHilvhGtbmWwVS6bpivrwrHccGv1dh/UEIsV8
	lKy+vwvXrDept5qF81liwaSu6CSe1iGw==
X-Received: by 2002:a05:6000:2681:b0:439:c38e:66cc with SMTP id ffacd0b85a97d-439da88ffdamr14319927f8f.46.1772988228077;
        Sun, 08 Mar 2026 09:43:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad977f8sm19297489f8f.9.2026.03.08.09.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 09:43:47 -0700 (PDT)
Message-ID: <f9de5355-0eb4-4a1c-82f5-bb7a20566e0d@tuxon.dev>
Date: Sun, 8 Mar 2026 18:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/19] dt-bindings: clock: at91: Allow referencing main
 rc oscillator in DT
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-4-ada@thorsis.com>
 <b932cdfb-9197-462b-abb8-e7b4c7ecab6f@tuxon.dev>
 <20260209-amulet-customize-08ef8dfa1c38@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260209-amulet-customize-08ef8dfa1c38@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_094350_178835_4E59233F 
X-CRM114-Status: GOOD (  29.18  )
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

Hi, Alexander,

Sorry for the late reply.

On 2/9/26 10:08, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Sat, Jan 31, 2026 at 05:44:18PM +0200 schrieb Claudiu Beznea:
>> Hi, Alexander,
>>
>> On 1/20/26 16:37, Alexander Dahl wrote:
>>> The main rc oscillator will be needed for the OTPC to work properly.
>>>
>>> The new index introduced here was not used on the four affected SoC
>>> clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>       v3:
>>>       - adapt to different base changes, added lines are the same
>>>       v2:
>>>       - new patch, not present in v1
>>>
>>>    include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 1 +
>>>    include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 1 +
>>>    include/dt-bindings/clock/microchip,sama7d65-pmc.h | 1 +
>>>    include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 1 +
>>>    4 files changed, 4 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> index 91f8f863ea076..1f6bb51780d09 100644
>>> --- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>> @@ -10,6 +10,7 @@
>>>    #define SAM9X60_PMC_MCK		1
>>>    #define SAM9X60_PMC_UTMI	2
>>>    #define SAM9X60_PMC_MAIN	3
>>> +#define SAM9X60_PMC_MAIN_RC	6
>>
>> Why 6 and not another index? In theory, now, you should be able to define
>> here all the core clocks IDs (as these are known from the manuals) and
>> prepare the driver to allocate memory for all of them such that the driver
>> will have to be able to work with old and new device trees w/o further
>> changes.
> 
> Was the first common free index for these four clocks.  Before split
> up would have been nice to have a common index, because it was all
> together in include/dt-bindings/clock/at91.h in one file.  After
> splitup one could just use the first free index, as Krzysztof already
> suggested.

OK, sounds good.

> 
>  From my reading of the SAM9X60 manual, there's no such thing as core
> clock IDs in the manual.  If there is a section in the manual, please
> point it out.

There is no such section, AFAIK.

> 
>  From my interpretation for SAM9X60 these clocks are provided by the
> clock generator (section 40 in the manual):
> 
> - TD_SLCK
> - MD_SLCK
> - MAINCK
> - UPLLCK
> - PLLACK
> 
> The "main rc oscillator" clock is somewhat internal here, but for OTPC
> we must be able to enable it.
> 
> MCK (not MAINCK) is generated in the Processor Clock Controller block
> of the PMC (section 41 in the manual) from one of the above clocks.
> 
> So it's all mixed up from different blocks from Clock Generator and
> Power Management Controller already.  These indexes are
> arbitrary and just for the driver, right?  Or am I missing something?

If I got your question, some are only internally (currently), some are also used 
by DT (e.g. the PLL ones).

> 
> Besides, if it is renamed now anyway:
> 
> - Why that PMC prefix? (most of these core clocks come from the
>    clock controller, not the pmc)

The control interface for all of them are on PMC. So, they are all considered to 
be part of the PMC. From manual, chapter "Description" of "Clock generator":
The Clock Generator user interface is embedded within the Power Management 
Controller and is described in the

> 
> - Why not rename PMC_UTMI to something like xyz_UPLLCK to match the
>    datasheet/manual (likewise for the other definitions)?

That could be done for the SoCs where this applies.

Thank you,
Claudiu

