Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C1BCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D15WYqEqCtCB7v610GJBwva3MsN/FcT88sDyZBQLmFU=; b=eId1LjquyA6s/u1XLZhhtQIXcv
	s5Jda+dRcKeC9iOcVQFRIDklZGUGFgbyot8V2AVzodHyetIDLXBZYErhPYloW/v9u9/TMAac1ZQKE
	aWCWBF1P8xeJDw9EP5cjnK+hE9pfd3Tq9zlc/yJ/nqbbwpvqCHKQqefyfoDoun8WIx9y3oWyk6BRW
	/gpF7FpeRGx4lZhedJ6ArcdRyGeHSZPgSwYBKDeh9pdB6DofYvBcbVxlcYUurkHYQDntjMZ3YckfG
	KlT0MnLlHj1iCrvAD6M3qjEQllLBlgKD19zcAwHjuewsccwdw08oVIwE17gP8yMY454a2pOaqn2OL
	y9vXa+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacW-0000000GrjN-0Uhb;
	Mon, 08 Sep 2025 12:05:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZWp-0000000GUck-445k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:55:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso2790032a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757328918; x=1757933718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D15WYqEqCtCB7v610GJBwva3MsN/FcT88sDyZBQLmFU=;
        b=LQW7jlJ1AhbODuib5NOeI5hIBIDJHVbDogLoTRCJp4ufHCpXobzGjfCk0lnYhBor+J
         cHJMwIuXILTq/4+pXAH2y4fSw+xU1jrdxlIIBwDUFkjp/wKXybIt5lfcxvFVrsRIAk6v
         7mKK7mbhnwPJuOVI5I9onP8di0upzcK3PpV1lhCwJiyi6Q5g9K8JwzsOgSKooGygUoAs
         H9gLf0w4sEB2T28VqsjO/g/I8dY3EQOLBXvvlqaBpTNv0U3YzppUnubiZSQCcFbaUhGS
         rELrsrCDP7wacPJVwhpZaJRifuFPKs8S2LYgCH03RcfgrkbGJPszrS0Z256/vi+FuvVz
         ba1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757328918; x=1757933718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D15WYqEqCtCB7v610GJBwva3MsN/FcT88sDyZBQLmFU=;
        b=GHKga+fMT1aq1hz72yLTGczoro+ezYdyTVxkQc4INhnrh7KRPvVvLO8NNC0vM7YS+Q
         j6sOvYzysDbzamA0B8bwa0z+Nbkv11nvocfvJE5OBtvkmLSshnNUcRuQz4q/O1tMU3ZR
         dYhgCuqJCD6hSqDTP2KIyEDT3d2Ual74PP59MZEtJZQkC6owVtJdthuKpmR66/I+dvyL
         Xfkqj0qiLy+TFCO9ser4wWwo4qyyklW63uQL40QpQhEgvzMdsVuzuKsC2bDvpAWh4gO/
         PLyQyLOqZHFQbCe8WkHLoiOvfBaFFGNu7zEbbI1pmiTLBzUoOE+pd484gajpMkY4i8NG
         ej/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjoWCqAtzu53/rzS2ixB5vt8E293TJ4mHfM+X3DgfvGpEHlaPPvFibIfrqLzkfvBaoIk8uCgpGqY6NaLbaipJS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrz2yRUSi4f5idS2Vk8KB7CDsBbBc2NhTmFYpmVCai62zCpEZV
	hHfJ4X6p3BGs6nHIeezVH7SEn9D8DIbmLMkVjfASojzV6Jodl5oFFKhf8VZ22Y40ylk=
X-Gm-Gg: ASbGncsE7ZleI+rLg/lBp7nPK3EmmwlsAzL01ky/vyX3XCB1xASVJv+Ez45C7Gd1gFW
	VFv7B6KekVYdZ7gmFV+Mhi+MiSvXfE9RTc79f8vlHE/xSwZR6KrCsMC7SQhKXAntmXe1K2s+dsT
	YL/+T+HjkVVP1uQ2zZ4xBQIfrtT+QPr6JyFEJoggDOJcMIZMx7KMlBelaZFMO/3eSaT+b9BlClu
	HqzV7i83Qg7OiF0PAihBaFnsErdiuEcGvrNDLPcGWYuzGX4KmCIHDNlO2GQuTigmgc/tciBPcNa
	QG+VYyhWyzZpsw6cc0Z7Sh7TNeWrEL9lvV4MollHlvKRg+JAKOBMnNFBR4LqNrbiRgsAgSFhoWn
	cwmnnkScbohmOyrjMkSwlFs6fmG/wFPib
X-Google-Smtp-Source: AGHT+IH10y9VESvsaHZG3UuRMxdkRiSrai95h1SgmUQXtpdxF6A/nnAVrY3x0CbvcZ5YJbcxhlzjXA==
X-Received: by 2002:a05:6402:278d:b0:627:d1af:8c66 with SMTP id 4fb4d7f45d1cf-627d1af8dccmr3858818a12.5.1757328917870;
        Mon, 08 Sep 2025 03:55:17 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-626c8d8693esm3539727a12.48.2025.09.08.03.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 03:55:17 -0700 (PDT)
Message-ID: <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Date: Mon, 8 Sep 2025 11:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
 <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
 <91407377-f586-4fd2-b8e4-d1fd54c1a52a@linaro.org>
 <32a28a8c-2429-4d61-88f0-b7e3e866f85e@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <32a28a8c-2429-4d61-88f0-b7e3e866f85e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035520_067120_FEE1B34C 
X-CRM114-Status: GOOD (  32.51  )
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



On 9/8/25 8:45 AM, Krzysztof Kozlowski wrote:
> On 08/09/2025 09:39, Tudor Ambarus wrote:
>>>> +
>>>> +	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
>>>> +	if (!aclks)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	for (i = 0; i < count; i++) {
>>>> +		const struct acpm_clk_variant *variant = &drv_data->clks[i];
>>>> +		unsigned int id = variant->id;
>>>> +		struct acpm_clk *aclk;
>>>> +
>>>> +		if (id >= count)
>>>
>>> This is not possible. You control the IDs build time, so this must be
>>> either build time check or no check. I vote for no check, because I
>>
>> using BUILD_BUG_ON_MSG? that would work, see below the why.
>>
>>> don't think the ID is anyhow related to number of clocks. What if (not
>>> recommended but what if) the IDs have a gap and next ID is 1000. I see
>>> your code using ID:
>>>
>>>
>>>> +			return dev_err_probe(dev, -EINVAL,
>>>> +					     "Invalid ACPM clock ID.\n");
>>>> +
>>>> +		aclk = &aclks[id];
>>>> +		aclk->id = id;
>>>> +		aclk->handle = acpm_handle;
>>>> +		aclk->mbox_chan_id = mbox_chan_id;
>>>> +
>>>> +		hws[id] = &aclk->hw;
>>>
>>> ^^^ here, but why do you need it? Why it cannot be hws[i]?
>>
>> so that it works correctly with of_clk_hw_onecell_get() in case the clocks
> 
> Ah true, hws[] has to be indexed by ID.
> 
>> IDs are not starting from 0 or are reordered when defined. For example let's
>> consider clock ID 1 is wrongly defined at index 0 in the array. When someone
>> references clock ID 1 in the device tree, and we use of_clk_hw_onecell_get,
>> it would get the clock defined at index 1.
>>
>> In my case the clocks start from index 0 and they are defined in ascending
>> order with no gaps, so the check is gratuitously made. I wanted to have some
>> sanity check. Do you still think I shall remove the check and use hws[i]?
> 
> 
> Look at some users of of_clk_hw_onecell_get() - they all don't care
> about this and do:
> 
> 441         for (idx = 0; idx < count; idx++) {
> 442                 struct scmi_clk *sclk = &sclks[idx];
> 
> without any checks.

I saw, it felt a bit rugged at first when reading it, but not so more now,
see below why.

> 
> I just do not see why runtime check is necessary. This is purely build
> time relation and either we do not care, because the code should be
> synced between one and other place, or (if you care) then it must be
> build time check.
> 

I tried the following:
+/*
+ * Use a static assertion to check that the clock IDs are sequential
+ * and do not have gaps. This check is performed at compile-time.
+ */
+static void acpm_clk_build_check(void)
+{
+       BUILD_BUG_ON_MSG(gs101_acpm_clks[ARRAY_SIZE(gs101_acpm_clks) - 1].id !=
+                        (ARRAY_SIZE(gs101_acpm_clks) - 1),
+                        "ACPM clock IDs are not sequential or have gaps.");
+}

and then in probe() called it. It works in a few cases, but it leaves the
possibility open for the intermediate clocks to have unrestricted values,
even if last-clk-id == nr-clks - 1;

So to be comprehensive I'd have to combine a build time check with a run-time
check. Which feels like over engineering. The assumptions scmi and other do
don't look that bad now :).

I'll drop the sanity checks and use hws[i] instead of hws[id] so that at
least there's no out of array accesses in case the writer really mangles
the clock definitions.

Thanks,
ta

