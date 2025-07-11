Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AABC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92a1BMGAgSFSlfdbtWZOCIjPJqcTtzOvDqxTIQeL8pE=; b=4fvQiwxetaB2i9i3FtAHmOQ15J
	HdBGTgx3i7R84On5y1L23mYzCDckKWgsEYJG4ljrrrwYFU+yyXfVyJjfSpLVolD90RHf7jsPUqgmi
	kCnlMnuM87HujEauCIUMLEFfM+6sJG254n+k6lSheX4YgiHuXYCloD++oguo0cnE6HPnNbX5xNvTC
	MYrmXHy525KaezuDzEQBs1Pw5c+d+m199MTQ+JNMxU5H/YrjWGbncLaDN8bliqYYtgkLkTUjvBv4n
	OhUCIecFCVaqmpVmQzQhHh9YQwh4muOSqQdmBMG8eYRZC7VX52SXJtTgzuoxWorO3FZR5eSj7u0ym
	zlkZ7Aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDMe-0000000EoLX-0ph9;
	Fri, 11 Jul 2025 13:00:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDKG-0000000EntJ-2A5p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:58:05 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae0c4945c76so329272166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752238682; x=1752843482; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92a1BMGAgSFSlfdbtWZOCIjPJqcTtzOvDqxTIQeL8pE=;
        b=V8nrjwRG1RmQDWGjvHnTIFHEtR4+38LHxyoBiqMtrDMo5yOEBZgV/2059OxQsYdkTe
         QlM8S77EPF8zzN+JW9GwFKfBiElPi/J29WQACNGPlIKKJPvKeM0Ieu5S7hD2HHI+FP5D
         wG3Lv4Z6+8oMCPmlyle/dqQvZqVVsUSzsJCPxjWX2VT0KupYZNcwJyg7AW2X2+B4G9LI
         w5+Dz9XOhvjN+Z9xpCXVRdI4AL2/0mc/wL3pPj7a/K1vfkxX2sB9o7phNxLbCbuzIXug
         W/NyYSLDatzi1iEnvNQx3j1lI/IZDhc9+XCbWg4ekg5RVKDUd0ejaGnChZbna8Cg2Qv3
         y4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238682; x=1752843482;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92a1BMGAgSFSlfdbtWZOCIjPJqcTtzOvDqxTIQeL8pE=;
        b=vZM68YtyUBVFcw+WRaDw0gmQc1pX54DkOLdQ0yST0wG8c7PO8yIwqv8c0axfbnNs7j
         byWDs/18s1gUXIi/uMUWNAvHJw7jZH7lieMZHMfRjIaMCX/bngVl/C+0WOsY/Vp91lw9
         Vlvyq3QjdrOCbQ7JgTy/+1bZB63Oa5zFR7AcYNWzeH9uReTr1fCL7Fr2TpLqbvx2Ko6q
         bF8jZVluNpoY6OgriYxm/VmQBg6fnz/ST9m0to4yi2a2gQ73kquU16Nq1WlZcpiVl+Cl
         s4k/8NmhB83g1fqfJZvCMu2uN0oXG528S2WmJx6yy49rwVXtdm3CR8U0OnG5iiZXLhu/
         jMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSz1HP4YHiuarZGDn8pUiLL96wBs+y0eYcrVEjKO3poAKBpsNJxguUKvB3wRpXdznddBEYqcKdgKKwHVdgxfxd@lists.infradead.org
X-Gm-Message-State: AOJu0YwTU2PgKpAiHa6rl3BhzUMJ6be7M7TUwlxeyZZoOb5EYVxaB6yo
	TD7WIK0AqbT2ytayFIV0WE+yvUjcLhDEnIKGYCuCUO89HF/cPhDMHcipKUio66SY2m5wXdzuJa7
	0104t
X-Gm-Gg: ASbGnctxX+TqS95aryJ/tLZyKk4+aCK0rLmBl44iA4/KL3uoaIP4k/DgKM8BLwJYQ1i
	dPku2y7oJJNp6Hdp/I9hiI+JB+3LZb1wQigyDXpB6fYKyuEeG0b5BUtgJzCYv78vdN80206RIMQ
	g/qWsaODcLGrHNct1yDAa8GZwGsga5H4EtYDvu9OmCcm3xRPkncQ6y32kZkMjPFtwVZgUTUfIZ/
	Acyu0US5pAwneoMOvwPfDK46eq551hFqnP4h9HUWbAQeSO9RYIVZ0bAsODtpsw+lelEH9pzpO+S
	Zc6pymLjMySUa9VeJjcMskzpY5smzNui+CM9hABeYnipgndNGxYyeXdDSreGckCmuzZXJs1Uvcf
	rZtXztMohv1eTi7auzAtW5aCzeCHgxQ==
X-Google-Smtp-Source: AGHT+IGQ76WU0AB+rvk/zt28ZNRFOKV2e22kKyB0M5bcv4nzPUIbvT27s8Y8oQFLMrTvDQ/Em2YmUg==
X-Received: by 2002:a17:907:2684:b0:ade:36e4:ceba with SMTP id a640c23a62f3a-ae6fc3c4510mr344276566b.52.1752238682247;
        Fri, 11 Jul 2025 05:58:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293ff2sm294908766b.111.2025.07.11.05.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:58:01 -0700 (PDT)
Message-ID: <38b14d24-534a-447e-a930-6a96c693b7e4@tuxon.dev>
Date: Fri, 11 Jul 2025 15:58:00 +0300
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
 <d1a16315-8e17-446e-87f2-57f18046288c@tuxon.dev>
 <e59a1c94-e6b3-49c8-aa78-78d031e8a6ec@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e59a1c94-e6b3-49c8-aa78-78d031e8a6ec@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_055804_668378_2D5589B8 
X-CRM114-Status: GOOD (  31.63  )
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

On 11.07.2025 10:38, Varshini.Rajendran@microchip.com wrote:
> Hi Claudiu,
> 
> On 10/07/25 1:48 pm, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Varshini,
>>
>> On 24.06.2025 12:09, Varshini.Rajendran@microchip.com wrote:
>>> Hi Claudiu,
>>>
>>> On 24/06/25 12:34 pm, Claudiu Beznea wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hi, Varshini,
>>>>
>>>> On 10.06.2025 11:45, Varshini Rajendran wrote:
>>>>> Update the min, max ranges of the PLL clocks according to the latest
>>>>> datasheet to be coherent in the driver. This patch apparently solves
>>>>> issues in obtaining the right sdio frequency.
>>>>>
>>>>> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
>>>>> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
>>>>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>>>>> ---
>>>>>    drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
>>>>>    1 file changed, 10 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
>>>>> index cbb8b220f16b..ffab32b047a0 100644
>>>>> --- a/drivers/clk/at91/sam9x7.c
>>>>> +++ b/drivers/clk/at91/sam9x7.c
>>>>> @@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
>>>>>
>>>>>    /* Fractional PLL core output range. */
>>>>>    static const struct clk_range plla_core_outputs[] = {
>>>>> -     { .min = 375000000, .max = 1600000000 },
>>>>> +     { .min = 800000000, .max = 1600000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range upll_core_outputs[] = {
>>>>> -     { .min = 600000000, .max = 1200000000 },
>>>>> +     { .min = 600000000, .max = 960000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range lvdspll_core_outputs[] = {
>>>>> -     { .min = 400000000, .max = 800000000 },
>>>>> +     { .min = 600000000, .max = 1200000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range audiopll_core_outputs[] = {
>>>>> -     { .min = 400000000, .max = 800000000 },
>>>>> +     { .min = 600000000, .max = 1200000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range plladiv2_core_outputs[] = {
>>>>> -     { .min = 375000000, .max = 1600000000 },
>>>>> +     { .min = 800000000, .max = 1600000000 },
>>>>>    };
>>>>>
>>>>>    /* Fractional PLL output range. */
>>>>>    static const struct clk_range plla_outputs[] = {
>>>>> -     { .min = 732421, .max = 800000000 },
>>>>> +     { .min = 400000000, .max = 800000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range upll_outputs[] = {
>>>>> -     { .min = 300000000, .max = 600000000 },
>>>>> +     { .min = 300000000, .max = 480000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range lvdspll_outputs[] = {
>>>>> -     { .min = 10000000, .max = 800000000 },
>>>>> +     { .min = 175000000, .max = 550000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range audiopll_outputs[] = {
>>>>> -     { .min = 10000000, .max = 800000000 },
>>>>> +     { .min = 0, .max = 300000000 },
>>>>
>>>> Is this min value something valid?
>>>
>>> Yes. This is a valid value mentioned in the datasheet. This is the range
>>> that fixes the issue of not being able to set low frequency values for
>>> the SDIO interface for instance.
>>
>> Sorry for the late reply. This range is for audiopll. Can you please
>> explain in the commit message why this fixes issues with the SDIO interface.
> 
> I can do that, while doing so, I can rephrase it as well. SDIO is just 
> an example, It can potentially fix any range issues in any clock 
> associated with peripherals can have.
> 
>>
>> Also, having zero here as min rate would involve, as of my code inspection,
>> setting frac->mul = -1 for disabled PLLs on probe (I suppose audio PLLs are
>> among them). Please check:
>>
>> https://elixir.bootlin.com/linux/v6.15.5/source/drivers/clk/at91/clk-sam9x60-pll.c#L693
>>
>> Having frac->mul = -1 means frac->mul = 0xff meaning the HW registers will
>> be set with the maximum multiplier. If my assumption is right, for a
>> reference clock of 24MHz this will mean the Fcorepll will be 384MHz which
>> is not in range for Fcorepll specifications (described by
>> audiopll_core_outputs[]).
>>
>> This may be harmless if the PLL is unused at boot time, or reconfigured
>> later, but if the PLL is just enabled later (w/o setting again the
>> frequency) and the core output frequency is not in range (described by
>> audiopll_core_outputs[]) it will lead to PLL lock to take forever and the
>> execution to stuck.
>>
>> Can you please check this?
> 
> I inspected the code on my side and did the calculations and I didn't 
> quite get the part how you arrived at the value 384MHz, my bad. But I 
> did get your point.
> 
> What if I set the minimum AudioPLL output that can be obtained from the 
> coreclk output range which is 600MHz minimum, which gives us 2343750Hz 
> as the minimum AudioPLL frequency achievable from the divider part. If 
> that is okay I can send another version of this patch.
> 

I've rechecked this on my side and I concluded I was wrong. The call:

ret = sam9x60_frac_pll_compute_mul_frac(&frac->core,
                                       characteristics->core_output[0].min,
                                       parent_rate, true);

from sam9x60_clk_register_frac_pll() is using
characteristics->core_output[0].min as parameter but not
characteristics->output[0].min as I initially considered. So, the change
here should be OK.

Sorry for confusion! Please re-send with the patch description adjusted and
I'll apply it.

Thank you,
Claudiu


> Thank you for spending the time to review my patch and for the detailed 
> explanations.
> 
>>
>> Thank you,
>> Claudiu
>>
>>
>>
> 
> 


