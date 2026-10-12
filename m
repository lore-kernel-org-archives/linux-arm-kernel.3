Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF0BCA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 05:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YfFK5/qq9t394ytyKSs2GhlrPJ7z3Fz6Rt9xrFCB/U=; b=lD9NOy+daVokz+GhX3onn94eus
	y1dCtMgL7Jy32xr+a4zWmkw3XfgOpwbsSop8KOM9+ZACwIk2SeXnB35EcNxSzCTTg8CdLKTFonYwQ
	ouiLskon9vx/5VUjUCVyNZfaVc1PfHyKhrmo/THLUUFq8Zld/xfTUZOKX8H68yMro8JvWSefX2M3C
	BZQZd1he+v7XCVu3c2hdSbVa9DTAUscra1oVzCXWET14gesnPIuDOOrwdOm10sz+JQA0FldozQmYc
	WIAitW6vRl7lLqGPs9CHTbZ/PFM7lyoF/4IooRFgfaeir54NnKljCaq6CIaemu4Y6kgM6qF+0J/7R
	J2FlyKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8iQ-00000009gnx-0bm0;
	Mon, 12 Oct 2026 05:36:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8iO-00000009gna-0bBi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 05:36:49 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso966730a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791783407; x=1792388207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YfFK5/qq9t394ytyKSs2GhlrPJ7z3Fz6Rt9xrFCB/U=;
        b=PUOXH7CpvL72yK7wqZpRq0FASO2ULj0I7ZeqlGHkY/ZXXpNXSyTyYXWs+uBdExSA+x
         uJLLh9hoksb60Xrk8igHZPY9Ren45W4i/YlYBW0BQfdRFhZnOqAMRrKmnjY+87eRGYhV
         Woc1BcBNf5FzHAQwtk52JPm27Ac4CMlcKO1OS3iIAwXOHI/cTKEbLcx9s/GogKlqSNLE
         q9YBG6Ylk+p8mjTST0GouJeS3AvFDEDGJSbIfWeA/h34HHtovPUryi+CjhPPi3GcPVfu
         DEdagYzitN6xgt0TzpbP64bkTJx6hqArPlDTJ1cOtonzdgpanFMQji8GEUKuLJBHgiqF
         iUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791783407; x=1792388207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YfFK5/qq9t394ytyKSs2GhlrPJ7z3Fz6Rt9xrFCB/U=;
        b=YD6YLIyPLjR++0hAgXQ2ybovuiKOSwD94W4/AnX1WaXAer/kRI5APlV9fypjcwfedD
         dawGRMLAIwoamO/JftT+Sb2q8wsKKNqADU98V1a8IGDp3ag/7DyUA2r0qkGNgqGZooxG
         B/XDyzC7pLz3P+Wyp1rPZl+vlmVDgsPqRlbVzrA+omcqAbo4ppvt2zGOyjhPYaILewTr
         N5NiJAZsdRYV+y5fds5kOkVkt6dBunAaRGaPD3h5ixHSgK6TUlJfZ7ZdPLd7AqgOE3P3
         8LOhdf25mS62BHJh3toSp1tjoZfZagvvyEk/8g7H7r9JvD7ygRkbOkwCjJdhb/FClU+f
         VC4g==
X-Forwarded-Encrypted: i=1; AKwUvBzsKl8nUi/0tVYMn4nvnPFDXMoNbetOI0QgfxR88d9RXHkCGt4BgQpiaNvvdGY1wZaAZocjCHYZXcvnOetcp/AG@lists.infradead.org
X-Gm-Message-State: AFq9FYIyY+EBycN+0GVdJ1eWIGvmZtTiiQMGp7ojjmV5jwlRQchCYL0L
	qfe0TZxsqxwszhcVTW77Ik3hSdS9SPON6+rzuSYzGSO+vNoullGcPFHn
X-Gm-Gg: AYBFou2fp4h4uZUhMoxfwq3P7b1D+xlb+Oy0e90qfYytQCq0wozZV2CSpOrH5Y8Rv28
	v7XYyHXTzCrPZrA5tV0QYrDav9rTi1MPxObdHK3Mq6cvyGPi++k1QnpUsmlli+vYO1N3yMIN8rm
	siHOOu2Ec69/XxFoLNqtOtwIa8qScQNmw55qd2Jl+H8cZ5bfByRp53OwjwSf+OPzQqDdTHZRPZh
	UmB04Sn3/LUMZHtjCEopcUa90kjjqLidvPME6HqGfAY4lHWKB7skataT4HtD4FkmNvIvZEdCXOi
	bkVXjHmlV94tVlc6KW0rNF7B1twls1GigqHRHb0A3zyQGhqiD5LEeK32I+wJj6QFIUJwhl3cXGt
	4wOTWKnbEDOKxf9i3+6fYgqXQiDxmmTsT3m/Os5GQdfPIaRrEWUXusYwbP0vMLhXp+gGAnxf1ZV
	CvuLDMr+AEOODaWz8ZS0fTy0PUF7xAvMafygt0toAF6xbkS0KmQX6fBMSMIY0aoGB5ko+D+u7UV
	1htUMLzPeO2tXLWpdWYK2MICho5JQU+uq/1SiS8Fgo37I45IfJQfDs=
X-Received: by 2002:a05:6a20:c784:b0:3dd:a197:ede9 with SMTP id adf61e73a8af0-3e16bef6952mr6940746637.56.1791783406452;
        Sun, 11 Oct 2026 22:36:46 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1ee81sm3738457a12.12.2026.10.11.22.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:36:45 -0700 (PDT)
Message-ID: <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
Date: Mon, 12 Oct 2026 13:36:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct formula
 instead of divider table
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
 <179156372588.266328.3848259565001346041.b4-review@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <179156372588.266328.3848259565001346041.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_223648_215864_C6EDF942 
X-CRM114-Status: GOOD (  24.36  )
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


On 10/10/2026 12:35 AM, Jerome Brunet wrote:
>> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
> Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
>
>   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>   *	Formula is 2 * (value read from hardware + 1)
>
> Am wondering if this driver is necessary at all ? Can you just use the
> regular divider here ?
>
>> which was previously modeled by building a clk_div_table with one entry per
>> possible divider value (up to 2^width entries) and feeding it through the
>> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
>> helpers. That is unnecessary overhead (a large table allocation and a
>> linear scan on every rate lookup) for a relationship with a simple
>> closed-form expression, so compute the rate directly instead.
>>
>> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
>> OR'd an arbitrary bit into the divider register on every set_rate() call,
>> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
>> rather than a bit index, so BIT() shifted by an out-of-range amount, which
>> is undefined behavior. The divider field write already clears and rewrites
>> only its own bits, so no extra forced bit is needed.
>>
>> Select the divider with a single helper shared by determine_rate() and
>> set_rate(), using closest rounding as before, so the rate promised by
>> determine_rate() is the rate that set_rate() programs. The helper clamps
>> the divider to the valid range and avoids overflowing 2 * rate for very
>> large requested rates, which would otherwise lead to a division by zero.
>> Reject a rate of 0 with -EINVAL.
>>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>> index e992e7c30341..12a946c989e9 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>>   	void __iomem *reg;
>>   	u8 shift;
>>   	u8 width;
>> -	u32 mask;
>> -	const struct clk_div_table *table;
>>   	/* protects concurrent access to clock divider registers */
>>   	spinlock_t *lock;
>>   };
>> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>>   
>>   static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>   {
>> -	unsigned int val;
>>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>> +	unsigned int val;
>>   
>>   	val = readl_relaxed(dclk->reg) >> dclk->shift;
>>   	val &= clk_div_mask(dclk->width);
>> -	val += 1;
>> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
>> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
>> +
>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
>> +}
>> +
>> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
>> +					  unsigned long parent_rate,
>> +					  unsigned long rate)
>> +{
>> +	unsigned long max = clk_div_mask(dclk->width) + 1;
>> +	unsigned long val;
>> +
>> +	if (rate > parent_rate / 2)
>> +		return 1;
>> +
>> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
>> +
>> +	return clamp(val, 1UL, max);
>>   }
>>   
>>   static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>>   					struct clk_rate_request *req)
>>   {
>>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>> +	unsigned int val;
>>   
>> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
>> -				      CLK_DIVIDER_ROUND_CLOSEST);
>> +	if (!req->rate)
>> +		return -EINVAL;
>> +
>> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
> Rate propagation support is lost with this.
Thanks for the review.
On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider 
is exactly 2 * (val + 1), so the regular divider covers it. The 
dedicated driver is not needed. You're also right that my 
determine_rate() lost rate propagation, because it never forwarded the 
request to the parent the way divider_determine_rate() does.
I tested the regular divider on hardware. That showed a separate problem 
in the existing clock tree. The mux parents are declared with .fw_name 
only, but the controller node has no clock-names, so the lookup fails. 
sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up 
as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns 
early without writing the divider register. That hid the real behaviour 
of the divider.
So I will drop this series and send a new series that:
1. fixes the parent lookup in the clock tree, and
2. switches the ADC divider to the regular divider and removes the 
dedicated driver together with the unused mask_bit parameter.

Best regards,
Joey

