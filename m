Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63715CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=; b=E+jlHlLLyqvmA/rjDNuzPOYZv3
	8l2DFVMb3ln3d53Ts4Z3tiK3h3YLbBDnyXnqnZC6vsCMzpyt7CZRSPhng7IhjqSKziLDJd6tfyPuY
	uxcue2d2gzQHlGkwOlDnj5gSDE1+rIxzF/+QxjRWUZSrQJEM8mFA7yWlVh6Qcf9a6WYhdU9mQ5KkC
	XPkJ1tY9KQcDBn929uZ3gOHtUlvSwQKXQvsBaVwwyV+t0jdyyxEvnLgSjKykq7NojeAJMri3iFAI7
	o6bQrOhl1ebWvRm3tLjR8BbJIfCI+0ElPA1PJEvkR2TJ7olUdsU2zwgEqekCVlA7hkwS5eEObCMs0
	y9qc9zSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCNG-0000000A46K-3D5E;
	Mon, 12 Oct 2026 09:31:14 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCNE-0000000A44t-0N5P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:31:13 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso486817a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797471; x=1792402271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=;
        b=ePXFdAX1UxHzdiJiBGp4pOrutnB6YjKVkoNbdgsb7CPbiSM+l5ztCVtLcz9iro5Avr
         EF7bN26dRgSOQI8ghNBTvVRgXqlGmO2vt5zXKI+dN94mUxzKtafxFSV3Rup6LNMWHnuc
         YHa7QJGkCAe069FUeuJ5/IUfwdYflMm/WzIlPSIDHT0hKpFLhB1NbUdkpvpVyBkpAWNg
         3hNqb5gQuAfJbCY5wums0Wp2TvOZNU+JelxYddpAGirnNlG5CeLI4b73KKoEmbw3MVWh
         a1nNYnt6v9StqIZbXt432ohZfJZeNDNnXJ15WtAv0sSXtjRdeOLrLFPyEOruLC7mi0G+
         6TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797471; x=1792402271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=;
        b=yJChL8zXa73CZuxuDSHQ661Q0DF+zV/ZRGPu1OgUwk7LwScJ8O/oZfFD9PxCgfPkg+
         OTFiuUEIjwkXm/g8Oyaz+WMZaGBPObRIV5mFUFelbHrZa/M/D2dtEM+S4ODoG7u8MZ29
         G4aqQWf/yrWbvXcGldFGHIRGCOj26ofwirLX4TyGehIKJuiBkoHSsjqHOeKW4/hLMIA4
         08AsDvhp+zuCidOi5iJXE3Dbvw0hmcPLaoVD3kwm6H7F2T9X9c51yGP6ziEYSbftI5hN
         izU2x2XUQAJdeObm4qFdHbEaMnH1JpxOoxatFAOzKP0Ew83MIdkbNw3qh3VWzJOZrggj
         8V7g==
X-Forwarded-Encrypted: i=1; AKwUvBzPoFHkOdAcMyuJlMNeLNmoJ1OJuW7UtpO/JhiregmJ+EtMJ9Hy4rg5rICAT5CLPFqPdCu3GkhvHg/bn2HeUk3B@lists.infradead.org
X-Gm-Message-State: AFq9FYK9WBJs7VO3sCjsuSHV9sZtZLqS31/KBIZad86aZwmf9JgCfmgl
	2sAjVww31wtpdWU7lsha8aonJvg11OHwrRY14uUUF4rZHlPmEufW3vSd
X-Gm-Gg: AYBFou3+R1LWaTy1zcXphyAIYHERWyxZUDvWs+0zX5kZk56uS3PiiNScoydkrgMwLWn
	gDfwD56N6aU+xiiTiqqjgj2I6MxBdXl+yYaMDdbNm2HPu3KSlz7JIrDtFwoZ0Jt5NtFMngwZ2u3
	mgK0gU6Zf0RMD7Ivphfx62U2qH0GTqD2Y2+tNMjki2+yZoNHh7H/BvlYuQ1rYph0TrR6SA4zeLa
	NF6T++be4aAiqCsPibGNAx7GBfBaNVKvkoDsucLKov4uiQ0hw8gprWodazG1PMwu2R7HNehuI/u
	ycZ1Vv7ZAZUH77Vm94AnU1/E9kMeb8fr7gsHGzIpD8L3XF36xnmTHh7JbtPOZcQ+xN33h4YQrk6
	arYLLmbHmfbWPtz5wy12ukuxh3+YbfoaymJCEv00FXwOXVpefWAln0jDCONS+E4ka9VVaSapVi2
	4YMHTvO9VWT6s7keJzkNKTzY4lGhoB4nWrmTh/lyTad1T+QQ8QiIO7ItUFgt/M7INP7MOxtoscg
	COM3ViueVyPTUJmr6Zr75MHn3l9IVMySTkVqXcfHS2ehjWCd3IAbrI=
X-Received: by 2002:a17:90a:e70c:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3ab3ac9dc30mr7226256a91.29.1791797470974;
        Mon, 12 Oct 2026 02:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm18455640a91.11.2026.10.12.02.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:31:10 -0700 (PDT)
Message-ID: <88c1f8fd-b972-4fd8-99e3-66eadb0f06fe@gmail.com>
Date: Mon, 12 Oct 2026 17:31:06 +0800
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
 <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
 <179179301672.27179.2823663473263190790.b4-reply@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <179179301672.27179.2823663473263190790.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_023112_143751_5F531022 
X-CRM114-Status: GOOD (  26.64  )
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


On 10/12/2026 4:16 PM, Jerome Brunet wrote:
> On 2026-10-12 13:36 +0800, Joey Lu wrote:
>> On 10/10/2026 12:35 AM, Jerome Brunet wrote:
>>>> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
>>> Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
>>>
>>>    * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>>>    *	Formula is 2 * (value read from hardware + 1)
>>>
>>> Am wondering if this driver is necessary at all ? Can you just use the
>>> regular divider here ?
>>>
>>>> which was previously modeled by building a clk_div_table with one entry per
>>>> possible divider value (up to 2^width entries) and feeding it through the
>>>> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
>>>> helpers. That is unnecessary overhead (a large table allocation and a
>>>> linear scan on every rate lookup) for a relationship with a simple
>>>> closed-form expression, so compute the rate directly instead.
>>>>
>>>> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
>>>> OR'd an arbitrary bit into the divider register on every set_rate() call,
>>>> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
>>>> rather than a bit index, so BIT() shifted by an out-of-range amount, which
>>>> is undefined behavior. The divider field write already clears and rewrites
>>>> only its own bits, so no extra forced bit is needed.
>>>>
>>>> Select the divider with a single helper shared by determine_rate() and
>>>> set_rate(), using closest rounding as before, so the rate promised by
>>>> determine_rate() is the rate that set_rate() programs. The helper clamps
>>>> the divider to the valid range and avoids overflowing 2 * rate for very
>>>> large requested rates, which would otherwise lead to a division by zero.
>>>> Reject a rate of 0 with -EINVAL.
>>>>
>>>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>>
>>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> index e992e7c30341..12a946c989e9 100644
>>>> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>>>>    	void __iomem *reg;
>>>>    	u8 shift;
>>>>    	u8 width;
>>>> -	u32 mask;
>>>> -	const struct clk_div_table *table;
>>>>    	/* protects concurrent access to clock divider registers */
>>>>    	spinlock_t *lock;
>>>>    };
>>>> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>>>>    
>>>>    static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>>>    {
>>>> -	unsigned int val;
>>>>    	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>>>> +	unsigned int val;
>>>>    
>>>>    	val = readl_relaxed(dclk->reg) >> dclk->shift;
>>>>    	val &= clk_div_mask(dclk->width);
>>>> -	val += 1;
>>>> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
>>>> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
>>>> +
>>>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
>>>> +}
>>>> +
>>>> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
>>>> +					  unsigned long parent_rate,
>>>> +					  unsigned long rate)
>>>> +{
>>>> +	unsigned long max = clk_div_mask(dclk->width) + 1;
>>>> +	unsigned long val;
>>>> +
>>>> +	if (rate > parent_rate / 2)
>>>> +		return 1;
>>>> +
>>>> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
>>>> +
>>>> +	return clamp(val, 1UL, max);
>>>>    }
>>>>    
>>>>    static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>>>>    					struct clk_rate_request *req)
>>>>    {
>>>>    	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>>>> +	unsigned int val;
>>>>    
>>>> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
>>>> -				      CLK_DIVIDER_ROUND_CLOSEST);
>>>> +	if (!req->rate)
>>>> +		return -EINVAL;
>>>> +
>>>> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
>>>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
>>> Rate propagation support is lost with this.
>> Thanks for the review.
>> On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider
>> is exactly 2 * (val + 1), so the regular divider covers it. The
>> dedicated driver is not needed. You're also right that my
>> determine_rate() lost rate propagation, because it never forwarded the
>> request to the parent the way divider_determine_rate() does.
>> I tested the regular divider on hardware. That showed a separate problem
>> in the existing clock tree. The mux parents are declared with .fw_name
>> only, but the controller node has no clock-names, so the lookup fails.
>> sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up
>> as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns
>> early without writing the divider register. That hid the real behaviour
>> of the divider.
>> So I will drop this series and send a new series that:
>> 1. fixes the parent lookup in the clock tree, and
>> 2. switches the ADC divider to the regular divider and removes the
>> dedicated driver together with the unused mask_bit parameter.
> Have you looked at this series ?
>
> https://lore.kernel.org/all/20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com/
>
> It does address several problems the existing driver has when it comes to
> parents and incorrect usage of .fw.name
>
> Please sync with Miquel on this.
I tested v8 on an MA35D1 board
This fixes the same problem I found, so I am dropping my own patch. Once 
this series lands, I will send a follow-up that switches the ADC divider 
to the generic divider.
Thanks!
>

