Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D406CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 03:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/iG5bC/BJdPkF3jn2lGTYxhj70jgu4WHqDM6ahZHL0=; b=N9HEQRoH4moHLdMmfSE96BbIsh
	8/2JlLml1CzLUcqjlgEn/GmtM+79ORwPV+J3gJ3gc8YT+CctaUGwgEMCJF+bXx2DNpeh8gue9XXRO
	lEFM67bfylzXqhlGJtlZOF5DkUnCIoRoiV4tRu2PFIR853VyTnelAzIjQS5ByKLROZTG1vcXsFNXA
	Ha5viSzsq4Zx35Fr/bZPdQByZdAKPuJqzZJq7Fv5iMmCS7NJMRRpi9W4RMCJSVQulhCW1HWste9rA
	v9CET4EceepKDX4cqxJn/7nXyf9wvdB5lSmMGyy9tlEgJjNC8yrrn2cN7j/60Hcpaww0lbU6ZILFO
	S0FcB+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMe7l-0000000FPCY-05lp;
	Tue, 12 May 2026 03:49:37 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMe7i-0000000FPBU-41Rb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 03:49:36 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-365eecc5885so4999052a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778557774; x=1779162574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/iG5bC/BJdPkF3jn2lGTYxhj70jgu4WHqDM6ahZHL0=;
        b=FMN1p7Dv6XTJIVZnwrhDIaESCd+P4exE/nXT7deny2pc9CUBaQ5u8XetjGqo93f32h
         nvuKuZCh9TrFOpFmcTo/qbLYSgvj9UfGV5Lf4phjHFfDTuP81Jv3P6U0KLAn+1NlDnMN
         fa2exGgItG62/8mKMyqbEXE7YpxrMCh+NAHdxywHh8Nz+Svj4z+Tej9qmkKAeHmGkN80
         C90Sxp0GwsD5sg75qb8+eRSyog65P8Bg0Cn8702DMKdkN06o22XpY6uAAe5S2/cwX8u0
         4k17i0ogIc55GdGrp+VZit38GN3okgkfuOc02dUDwV6cJmQv/OaSRbmqP4QGMD80tJXz
         LRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557774; x=1779162574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/iG5bC/BJdPkF3jn2lGTYxhj70jgu4WHqDM6ahZHL0=;
        b=BZ6IFn/5L4trNl396i59v8qeeDTaLZzhGNhgHAFgLlG7mmQwfBfEG300yNEWn1ncCP
         DMKjCnvV+6strVtbt20Ct0vx6YO7ptwlMwSRPTSGUcbFi8/PjFaDpa7sFOmDeEyux2tQ
         FYJRfouKAaI4RQ+fz4buBbOfiyOLFLQryQ6q/7sPiF7f2+CrRPs6Elrk8/g68j3LHegp
         OjWh5L3aD4wA5DB5rCCzgkYgTDNSox33NL4q9A1m138jbGrclfBbKa8dbu554EOhEVDR
         5qJzZCeDn5LXM+Xt3cKysn5cI8Sg3w2CInoCuhxdbvfgFJc47syZ6ZPbZXWfKn7D764G
         P46g==
X-Forwarded-Encrypted: i=1; AFNElJ/CvgLpuktvRKOyguPJMzU2mVgdv5Zn3oI4svd3MljIingEanDyTXItAG2gn89Ffr1Kesa38GhkIstOAc9S1Ps/@lists.infradead.org
X-Gm-Message-State: AOJu0YwaseBkwVW686ZOsukoHRjBlSRj/uTDcDJeAVetSPeO2ThpMdeX
	rgGMnL/WahGSY02VHQgylyY8Qzjo1/QX8Aha+URPAowPRpwnjDpVHk62
X-Gm-Gg: Acq92OGnq7SN7tw2SH0d+xogwBOkd1meMHY3vF4+rQ19lGXVBgz8/ydj+Pql0ehR1gM
	1zSGlOvAkrSiJJ3Gl836LJ8wv1jeh1+U4yXg9dMT7+q0+rUv747CnvUAsnjxdUZz1LvDrBHfVFp
	p57infr4aL/ssEA8LBxpCmRt+AO5d8MCEM98+hzC5Xb4VdiwEoVY9oGvWPq41ztLkOSP3GKg+XM
	fQPFWH0hWPkAKSgaC6iZSsTwfMLQfXoEI3z/ZoGyMSC6YqDe60d3P1lNxKMP/uU9ixuK81yxCx9
	sfLiDUB63IJoUQpSZOwv1X3TrnzlKWyh7/nokYXUTxhB7WdvoPjRTmlU41cyfWUXzTORzPlUwHg
	q9Y/SuSr9DAY2fmNltMoj/8puh9FB8bQlLQekTIElJQank+64H7sOK4goamq0ptceM8+Srdn1Xc
	hbp+1ewfxaqvtHt7ueDnU6IenPYl73fAIKdnxIAPHIYI0w8AqtlwvGdquKaZ5eE+v8+lvfDrlQW
	a7v
X-Received: by 2002:a17:90b:1808:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-367d468c7f1mr12615310a91.4.1778557773606;
        Mon, 11 May 2026 20:49:33 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687c565sm11705782a91.17.2026.05.11.20.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 20:49:32 -0700 (PDT)
Message-ID: <2c061342-850a-48c5-a75e-2a755bcfac4b@gmail.com>
Date: Tue, 12 May 2026 11:49:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511031600.31929-1-a0987203069@gmail.com>
 <20260511031600.31929-2-a0987203069@gmail.com> <agH7qJypv48vkZOr@redhat.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <agH7qJypv48vkZOr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_204935_007352_214E24A5 
X-CRM114-Status: GOOD (  24.15  )
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


On 5/11/2026 11:54 PM, Brian Masney wrote:
> Hi Joey,
>
> On Mon, May 11, 2026 at 11:15:59AM +0800, Joey Lu wrote:
>> Fix four bugs in the MA35D1 PLL driver:
>>
>> 1. PLL_CTL1_FRAC was defined as GENMASK(31, 24) (8 bits), but the
>>     hardware fractional field spans bits [31:8] (24 bits). This caused
>>     wrong frequency calculation in fractional and spread-spectrum modes.
>>
>> 2. div_u64() does not modify its argument in-place; the quotient must
>>     be assigned from the return value. Both ma35d1_calc_smic_pll_freq()
>>     and ma35d1_calc_pll_freq() discarded the return value, leaving
>>     pll_freq undivided and orders of magnitude too high.
>>
>> 3. The fractional-mode calculation divided x by FIELD_MAX(PLL_CTL1_FRAC)
>>     to get 2 decimal digits. After correcting the mask to 24 bits, update
>>     the arithmetic to use 3 decimal digits with proper 24-bit fixed-point
>>     rounding.
>>
>> 4. ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
>>     unconditionally before the switch, but then overwrote its result by
>>     reading the current hardware registers for every PLL type. Move the
>>     find_closest() call inside the configurable-PLL branch (APLL, EPLL,
>>     VPLL). CAPLL and DDRPLL do not support runtime rate changes and
>>     correctly return the current hardware rate.
>>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> Thanks for the patch, however this should really be broken up into more
> patches. If possible, one patch for each of the fixes.
>
> Brian

Thanks for the feedback.🙂

I understand your point and will split the changes into several patches, 
with each patch addressing one fix.

>
>> ---
>>   drivers/clk/nuvoton/clk-ma35d1-pll.c | 34 +++++++++++++--------------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> index 4620acfe47e8..314b81e7727c 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> @@ -48,7 +48,7 @@
>>   #define PLL_CTL1_PD		BIT(0)
>>   #define PLL_CTL1_BP		BIT(1)
>>   #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
>> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
>> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>>   #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>>   
>>   #define INDIV_MIN		1
>> @@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
>>   	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
>>   	outdiv = 1 << p;
>>   	pll_freq = (u64)parent_rate * n;
>> -	div_u64(pll_freq, m * outdiv);
>> +	pll_freq = div_u64(pll_freq, m * outdiv);
>>   	return pll_freq;
>>   }
>>   
>> @@ -110,12 +110,12 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>>   
>>   	if (mode == PLL_MODE_INT) {
>>   		pll_freq = (u64)parent_rate * n;
>> -		div_u64(pll_freq, m * p);
>> +		pll_freq = div_u64(pll_freq, m * p);
>>   	} else {
>>   		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
>> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
>> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
>> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
>> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
>> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
>> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>>   	}
>>   	return pll_freq;
>>   }
>> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
>>   	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
>>   		return -EINVAL;
>>   
>> -	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
>> -				      reg_ctl, &pll_freq);
>> -	if (ret < 0)
>> -		return ret;
>> -
>>   	switch (pll->id) {
>>   	case CAPLL:
>> +	case DDRPLL:
>> +		/* Read-only PLLs: return current rate */
>>   		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>> -		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>> +		if (pll->id == CAPLL) {
>> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>> +		} else {
>> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>> +		}
>>   		req->rate = pll_freq;
>> -
>>   		return 0;
>> -	case DDRPLL:
>>   	case APLL:
>>   	case EPLL:
>>   	case VPLL:
>> -		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>> -		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>> -		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>> +		/* Configurable PLLs: find closest achievable rate */
>> +		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
>> +					      reg_ctl, &pll_freq);
>> +		if (ret < 0)
>> +			return ret;
>>   		req->rate = pll_freq;
>> -
>>   		return 0;
>>   	}
>>   
>>   	req->rate = 0;
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.49.0

