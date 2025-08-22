Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6633CCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cd5s72x9mZV/+O9tEQqldJerG6gz6k4UPw65u8py8ZY=; b=rdHAhKSTz2ajGrbMHrCAbC2AWp
	hONP3L3awarzifyOCDmbODZsLlk7hIVaxZbRjnOwy6NWT7Qb6b2GanJ8As4kdGBWItyOKiAL1YK/9
	D0Gb5RA5IM8hiEhZi5cb+zwLWxdORM5pCST3FNDPQWDZdQRzy6xMnTqCevcKbqiJsydXx1/YUrWYT
	OBlYe/944dzsZSbev/MQ4eZITfbtV2pmCzzCff6TMQgLMX2TALa6lTHIH74M+0Klu8c38xKZurvG5
	cefAhsdJTfAWcgkCJYBOcKSclIbFPa0qzQh2lwZgX4jASsa3ZmWg8sHRSrNnGAYkjsmeOSw4H6dCT
	ti7oCITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTUM-00000002yh1-3riL;
	Fri, 22 Aug 2025 15:15:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOzJ-00000002CEj-2hjF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:27:14 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb7a16441so289863566b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755858432; x=1756463232; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cd5s72x9mZV/+O9tEQqldJerG6gz6k4UPw65u8py8ZY=;
        b=NxNDrd6lp2rehZlF39htXRuAo7Lcyh1x0kQMpGZyLD+g5xGBSl7VJlH281SpuGAZtN
         BBJiu4Mk3WOen638vmR2SbqaG6avi1qla+H2LnNGWxy7alI3EF3elUaA1GrxCaHSdSn5
         cfjWUAsGRFP5mrLjN/scmXwg4SWjTwUNj1BZ0WEWg/sa7o3m0ypDKujWqPKa9ikcsCWG
         zrBhN+mQ4TePrrKHxXkbd0+guACLpqfi9p3V6yM94vCYRjTXkvwQI4MNjh8LhU9rVsYJ
         EtyqXDIlFwDljpUTuCaLwQMBYe2j3Ato5Z3fohhBccLX/fV38YKPutu6Gd8HkbsDLg1z
         zd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858432; x=1756463232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd5s72x9mZV/+O9tEQqldJerG6gz6k4UPw65u8py8ZY=;
        b=qg6dOkwrbHZWX8j+U8GCQrRaWU58WMFR34yegdpq1YzBJh4tzm7V0Zo4obiCoNwqcR
         TAbUWduZI82szdagyuGedFeTe9Vhq+9bhj/EgGsGJRNW1q4vA+/ma0BnL3OrJwzZuhxy
         F8HqvGebaW2BVL+a4S3tOMezfqfpz3/a/2mYzIxBrW58R3TXG82U2l1nEHdMh8/QqSfN
         BEtPeAsw2n4VVN0xa9aVR4vWi20SlsGPWX9BYRQ4v86NdskGlsElGDZxVXXU/5VNVvu3
         8q8L9cC+TiyGmLob2ho2635hpkauFrZ0gZwY67+LKmzDzGdYJ4MTWIXbDitK/XkXGAcW
         xvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXim7k+a9mv9PzbDeDXnAetRKhhNLdfw4O/aJr3/knFFE1ohn5l7ytIK7Pbd004iMcLxAT52spmpjM0q+NEW+9W@lists.infradead.org
X-Gm-Message-State: AOJu0YxpfMdU2tHbIL8PpTI7nWkTjfJnhB0HsnUIrRg3Q4kciS71EOc3
	9IROFTTt/U0vk+vFnJOdeA+/KrbmBc0NYLERF5ThyEeDKYM0MsvObsr9DEmyl9e1kcc=
X-Gm-Gg: ASbGncvMhH8fgMSjTX+lzaun5zcFLszximQfMYgzXkzVagwzIWCQSauHB94cq8282KQ
	Na9LLlbtM3VRx4ud1wx70d3u1E/vUc5xUgj/YN+6lk9qo9jFZGOrES9P02Sy3JzTLSbyS/AMuCO
	w9sQtAADUf3zQ7LxUjhBYQXFNh0F+fg22uVqe5vJMIZMpINRViP1NwUaMHDUFK/9UKBxsyRT+C9
	dqCeIyPBGkDhpzbpeeGEZkC1S5DsCuXGV//lJTkDr4YXOQGPLnIqX8XthQsizI3qfTMnDVfRbCI
	LzTZqAhTh+ZgdxoKGgUzr95mwFVUvym9u9Ea7sZi0q+seBSwMHahY58+sG77XVMWPGmea1c3j1q
	dhch6QVrMBC6oftS6cZAuqK8wAqQN3zIb
X-Google-Smtp-Source: AGHT+IEjRd6Tx5sKZi6OWN0Ddp+BLYTOG0lrQ3ub++Nybf0iOaCMKeFsTfA36+kF67hMQ9sg6CmMMA==
X-Received: by 2002:a17:907:3f11:b0:aec:76c6:6ef6 with SMTP id a640c23a62f3a-afe29605d34mr191833466b.50.1755858431819;
        Fri, 22 Aug 2025 03:27:11 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4ca67fsm585912066b.92.2025.08.22.03.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 03:27:11 -0700 (PDT)
Message-ID: <493a072e-352c-4e96-b58b-04b56fa56dc0@linaro.org>
Date: Fri, 22 Aug 2025 11:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org> <aKdmurrT1pFtLSI8@x1>
 <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org> <aKhFOHFGKPYXgIri@x1>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aKhFOHFGKPYXgIri@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_032713_700870_04D93F49 
X-CRM114-Status: GOOD (  18.81  )
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



On 8/22/25 11:23 AM, Brian Masney wrote:
> Hi Tudor,
> 
> On Fri, Aug 22, 2025 at 09:14:03AM +0100, Tudor Ambarus wrote:
>> On 8/21/25 7:34 PM, Brian Masney wrote:
>>> On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
>>>> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>>>> +				unsigned long *parent_rate)
>>>> +{
>>>> +	/*
>>>> +	 * We can't figure out what rate it will be, so just return the
>>>> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
>>>> +	 * after the rate is set and we'll know what rate the clock is
>>>> +	 * running at then.
>>>> +	 */
>>>> +	return rate;
>>>> +}
>>>
>>> ...
>>>
>>>> +
>>>> +static const struct clk_ops acpm_clk_ops = {
>>>> +	.recalc_rate = acpm_clk_recalc_rate,
>>>> +	.round_rate = acpm_clk_round_rate,
>>>> +	.set_rate = acpm_clk_set_rate,
>>>> +};
>>>
>>> The round_rate clk op is deprecated. Please convert this over to use
>>> determine_rate.
>>
>> I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
>> as deprecated and add your Suggested-by tag? It would help other newcomers.
> 
> I am working to remove round_rate from the clk core and the various

ah, great. Thanks for the pointer!

> drivers. Your driver just needs to be updated similar to this:
> 
> https://lore.kernel.org/all/20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com/
> 
> Brian
> 


