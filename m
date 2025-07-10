Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E8CC83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+oHkXFsQKm+K3CLYzLMU5QyZ7WKR1z3LIfoPESoqL4=; b=LrUezWIkMgSLaUaxyLE95avKfK
	QH3UWJ0LkFNIfL579PEdFqkVFtKY7nK3rVcbIBIBr21DxwbAWktelVtxbptWutK96ZMxSnttLcEDU
	O77fIiEaxRI4X1nO82rJ37oyp2h7nnHNu25icSfHJcTUuC3BiX/L0TL+7puf8Hi3pFnPsdaHjDfvl
	rmc2Eiql6RbyQhO4GaJPwabY0VIFFuRc0x1tdR2RyUcygtmLvDoHg7Wpzqk+Uuk9NGU4P0Wr0X/62
	hhSA0X4NRun9ADjdACjgrhSs8phYD1ITsIONv2nu5SKUNQelEaJ9a5DEZP6+Idir1vr/eXHtLKPpX
	3mNANNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnUA-0000000BKZO-2Uz4;
	Thu, 10 Jul 2025 09:22:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmUI-0000000B9A0-1QEi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:18:40 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so1235211a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752135516; x=1752740316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+oHkXFsQKm+K3CLYzLMU5QyZ7WKR1z3LIfoPESoqL4=;
        b=dsFiwwJKiAckgJV3is+HBtXqhkhuJUd4nLm1BW11xsv6TOIEbbPse/mCFOHKKu8cIf
         Ijzvp3tJuEWkJvMFuuFFy4hFZjTwlRfQUf4XI0WnwzsBEHCTX/YQkwBQfHpPLwyZpwHo
         m5stveGk2BgpWH9wwqHoCTmiWG3ApyoWLVWcHF5jxWa/ANZ0CzHW8KWz8lbGPXGoVgKa
         QXoDc9UTuy00mw3LuPeyCTx3HXGMS+vbpTAJ7ALow6+KVTrwJk2pzuru84M/qmEFbmpw
         Hs9Pc8kSry1Hs9zsx+mIYbtMdPWH6bqPWtr+SD+Kv9xWg7VIoWP8cCuxc1dfzpZk/T5u
         fgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752135516; x=1752740316;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+oHkXFsQKm+K3CLYzLMU5QyZ7WKR1z3LIfoPESoqL4=;
        b=mKEHEVoZTxe+jhR5DAoEgxzMEc1S2/x+zEXmLfLybivgWIN8/GMGKJ1z5pVnbP3ep0
         3PctL7RqQj0YLmdQTkYPrncgG2yXh0RoVUNaDE0Bypv5zqKEZJ98zWa6YISBd8WR1JJX
         sRyITfuhAFUOOdiZpfxjuCYBJ+Y2VBkvLlvVtFvupte5z5LylZv2U+G09xGCF9yVoWpB
         RZ45NS899IABHx8w+Wa34zrrGywJWvS4m3HiNV2eBv7k2GELUIQH/gYCcUq99jXDlD7N
         rEWuY2mzwApdwHrMZuYgQ8LAh8KPM8+TTM7SxyTT2vOsqhRml7sBMnSRg0zRXFbg7/vD
         Z7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjjut4CyJcSpXC8zKLFcJ4Jqq8dj9ciG838Lz6+HXbtaleZklrvucxd+2yaiTUGzQIM7E2FOuWiFw1YQ466Nr7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5HxlpmcyKvupmPKGtV6WEfozpT/BPLY5MvzyyaiaA27BcsChB
	AzfmIHvWKSO1nV3Jmw8dvABkpQ2rFcz2Zu6May8K+Ua66hNpMihyRtmaLwrJQyp7u0A=
X-Gm-Gg: ASbGncsQtLTfNtBL2p4h6w1Kf5sLjF5+fbGt7fgxLtgW/ZoLut31XK9p4rKfMLZxzQm
	kwMBK9CgDqGI52yJoIjsWBpOHOlGtENpRuecNlVR4XKVNiE2Uob45yn8ZukBU6uEMARGrgLpIlm
	evAaFesI1ZXKZirr1pcpewbjIeHXDqGBqTjL3dGwjP1amaHXwPJ2YeHDrFCXXRh2fDCHYheUVWx
	eviS2ApPLw96CUS/HYu0L5qQArV8sjJXJaX1LQbJEbtAdkKI9OtZRK762nVXMb8QWumJqyZELg5
	wyZG1eobtEbo/eWx2HsWFlwaRRM1S9VXzIOUd7Kq9+OVDb0yqx+XWDeDBkKiv9KyCHZSxQ==
X-Google-Smtp-Source: AGHT+IH9+Y6zBGxlZWXtPGIuD+2CIc9sCQ4CgPX4kZA/Pa+VR6uPN5Br/i9pvGmZ/oOvowIV9udbPQ==
X-Received: by 2002:a17:907:7288:b0:ae3:5da3:1a23 with SMTP id a640c23a62f3a-ae6cf5c7dbemr583384266b.21.1752135516414;
        Thu, 10 Jul 2025 01:18:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82e3a8csm88075366b.154.2025.07.10.01.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 01:18:35 -0700 (PDT)
Message-ID: <d1a16315-8e17-446e-87f2-57f18046288c@tuxon.dev>
Date: Thu, 10 Jul 2025 11:18:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sam9x7: update pll clk ranges
To: Varshini.Rajendran@microchip.com, mturquette@baylibre.com,
 sboyd@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice.Vilchez@microchip.com
References: <20250610084503.69749-1-varshini.rajendran@microchip.com>
 <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
 <0652df01-13e8-4fb8-a2e0-35820d83ac3d@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <0652df01-13e8-4fb8-a2e0-35820d83ac3d@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_011838_381653_5A540661 
X-CRM114-Status: GOOD (  19.61  )
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

Hi, Varshini,

On 24.06.2025 12:09, Varshini.Rajendran@microchip.com wrote:
> Hi Claudiu,
> 
> On 24/06/25 12:34 pm, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Varshini,
>>
>> On 10.06.2025 11:45, Varshini Rajendran wrote:
>>> Update the min, max ranges of the PLL clocks according to the latest
>>> datasheet to be coherent in the driver. This patch apparently solves
>>> issues in obtaining the right sdio frequency.
>>>
>>> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
>>> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
>>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>>> ---
>>>   drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
>>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
>>> index cbb8b220f16b..ffab32b047a0 100644
>>> --- a/drivers/clk/at91/sam9x7.c
>>> +++ b/drivers/clk/at91/sam9x7.c
>>> @@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
>>>
>>>   /* Fractional PLL core output range. */
>>>   static const struct clk_range plla_core_outputs[] = {
>>> -     { .min = 375000000, .max = 1600000000 },
>>> +     { .min = 800000000, .max = 1600000000 },
>>>   };
>>>
>>>   static const struct clk_range upll_core_outputs[] = {
>>> -     { .min = 600000000, .max = 1200000000 },
>>> +     { .min = 600000000, .max = 960000000 },
>>>   };
>>>
>>>   static const struct clk_range lvdspll_core_outputs[] = {
>>> -     { .min = 400000000, .max = 800000000 },
>>> +     { .min = 600000000, .max = 1200000000 },
>>>   };
>>>
>>>   static const struct clk_range audiopll_core_outputs[] = {
>>> -     { .min = 400000000, .max = 800000000 },
>>> +     { .min = 600000000, .max = 1200000000 },
>>>   };
>>>
>>>   static const struct clk_range plladiv2_core_outputs[] = {
>>> -     { .min = 375000000, .max = 1600000000 },
>>> +     { .min = 800000000, .max = 1600000000 },
>>>   };
>>>
>>>   /* Fractional PLL output range. */
>>>   static const struct clk_range plla_outputs[] = {
>>> -     { .min = 732421, .max = 800000000 },
>>> +     { .min = 400000000, .max = 800000000 },
>>>   };
>>>
>>>   static const struct clk_range upll_outputs[] = {
>>> -     { .min = 300000000, .max = 600000000 },
>>> +     { .min = 300000000, .max = 480000000 },
>>>   };
>>>
>>>   static const struct clk_range lvdspll_outputs[] = {
>>> -     { .min = 10000000, .max = 800000000 },
>>> +     { .min = 175000000, .max = 550000000 },
>>>   };
>>>
>>>   static const struct clk_range audiopll_outputs[] = {
>>> -     { .min = 10000000, .max = 800000000 },
>>> +     { .min = 0, .max = 300000000 },
>>
>> Is this min value something valid?
> 
> Yes. This is a valid value mentioned in the datasheet. This is the range 
> that fixes the issue of not being able to set low frequency values for 
> the SDIO interface for instance.

Sorry for the late reply. This range is for audiopll. Can you please
explain in the commit message why this fixes issues with the SDIO interface.

Also, having zero here as min rate would involve, as of my code inspection,
setting frac->mul = -1 for disabled PLLs on probe (I suppose audio PLLs are
among them). Please check:

https://elixir.bootlin.com/linux/v6.15.5/source/drivers/clk/at91/clk-sam9x60-pll.c#L693

Having frac->mul = -1 means frac->mul = 0xff meaning the HW registers will
be set with the maximum multiplier. If my assumption is right, for a
reference clock of 24MHz this will mean the Fcorepll will be 384MHz which
is not in range for Fcorepll specifications (described by
audiopll_core_outputs[]).

This may be harmless if the PLL is unused at boot time, or reconfigured
later, but if the PLL is just enabled later (w/o setting again the
frequency) and the core output frequency is not in range (described by
audiopll_core_outputs[]) it will lead to PLL lock to take forever and the
execution to stuck.

Can you please check this?

Thank you,
Claudiu



