Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A30CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5gwX0oUoQ1OWBmNFYCauKpaErmMd3o/oWX1X0hG9WI=; b=sdbQAozCbN82o5JqyBE/hoEWd7
	nTxfczFpSdZ7ZEe/XwB4FoKroSXrbK5pxj4Pv+2A9orRlQUbkE+5qwa0o6wMEKb+AhXXmcVWF3i3c
	3GUYYtT9eB/T8K51z8umWPsBJEcepRUXoQbOL8NT/8WTbpAmRTsKkbh6d/t2w2C0jCBqZZ0nU/JAi
	Y/5Pi59GETqYp1TSdCdwXve2wloEeOv+E695r2aV64uEnYzM7E3LlsOJkf/r1snf+f5lddpQNIXsn
	SNMDRJVLFS0Sef9L3LvQqFbzv1vJtlHUjXR2W7Pl8vlVnb36+g1M/m/OYiZ3MCav5ZmJZFcf45Q2c
	xAASNwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz1J-0000000BRen-1Nfb;
	Mon, 01 Sep 2025 07:32:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyTG-0000000BNfz-1Pnl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 06:56:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b84c9775cso7856385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756709813; x=1757314613; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5gwX0oUoQ1OWBmNFYCauKpaErmMd3o/oWX1X0hG9WI=;
        b=bhmI83wV6/I5cj2U6WjJ52m46CulP/y4TcwUonepY82wKmCXyBKltfvGl32Tc/QA+P
         Avwtx1iXHAeV21my8meQVn9/kjuFRhVf9SfGP22p9501TzxIMwQLtf683xt4rA5mY6No
         BLk7q89PYNjRi2oOlyonAuCNmzlStUaQb555gL4Qyo3DjNHQYYac/hO19Q7H5aIOGLHA
         rjo0Rj2IGVIEJ/aJ6EKsxiqWZiCMtfjy2C6/dtqes3amihaURTfxiHlbxtAlGGKjRKHR
         zkFo6cW9GaSolPr14uaQSYz8BQQu6wT1COLcfeVJvbRJtkQ7Yyr72qTLrS6tBgJ97uNF
         1B/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756709813; x=1757314613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5gwX0oUoQ1OWBmNFYCauKpaErmMd3o/oWX1X0hG9WI=;
        b=M/TDbEQEh7eT9oAxiChR1hc3aK2+hbc34zldRu+YJaQLNlKK7qiG2gcXcRanhxTNUc
         jPcPgXDDfY6e9riFRjxLUSA9+Kwu0UKWohpClHuH3yAo0ddg8Gz+kVJm9VIfVh1N4gdI
         YhpoFgHHDAwKtlKSk7PRQnIENAZ2lmIoNm4hzQXrH2l7TR0JpWuFYSvxJqwcH1sI/q4y
         3VnkDElqI7O59Ks1qnRY5b2MaYT1OrEYU2vkBAo0ezbK+JKOVQetM/VPXHJipk4PWy2U
         9KJTTCVRL9pV952GXEZBdv0NtaDSp6WnJYUtCDh0AFmz2j2xnw3AzoaXbK4jqkFYSjR8
         DltA==
X-Forwarded-Encrypted: i=1; AJvYcCUX/NMsVWw83WCtgUOs4pVgZV7pfPeqFGBR7bFWV5yh66Fyzanr+Mao3CsWHKNfmYtNaX4exhWjAG3BiNFrHG9f@lists.infradead.org
X-Gm-Message-State: AOJu0YxJza58RSelrXyrQlX9QNdSfH3ObMm6ZqGi335RMZM8B/8PBFu+
	9JSNq+Xs3fm4Azxh0kIn7tKwRUELYEtqJNXOcGONRt2PAZlChSV5MeHfRa7wUvj0vMo=
X-Gm-Gg: ASbGnct3VWrjXY9QxVfV909gMkrH9uz/jaVXw2GSSa0K1czLbx670ANNcOWQYtiVU3e
	VDZvfTg1VaGvnPqom4yIQI/9pSQuHWPbvXSrfTMVgkNtw+XWdxdBvdNx3lOxocHUNpoKfEGqZi6
	k6i4RT7uzyoHBg+5l49Zx8xV+oAYTO+XYkX5HAvJdBkige8kbgzE5Q7Gv6BlsDvrTCVdf0LGetl
	mrO4ixrjaz1+1coWx2+8+qD5NsbxW+5WFnMIqHBM1m+nkv4bcKa0TorRoBWJTMw+c+sictncAet
	wwlDh9XafhNCg8NtoeWCv14wGXm3V7D7J+GsUp1XKyp4W5MzbTuWh8FUcD+OpQTJyzjSbUfmr/t
	7o3d65DmlV2r+slzHSQ5ytfsd+EQXKuxz40/m4Uh+
X-Google-Smtp-Source: AGHT+IFTyDtYclqmVOzGIS9ZJjlqs10NwWpon1hN8bxRSUY5lhRzsuWs0h2u4qUYWfT36TppjXjdDQ==
X-Received: by 2002:a05:6000:40ce:b0:3d5:f5ef:3bb with SMTP id ffacd0b85a97d-3d5f5ef0766mr2382494f8f.11.1756709812699;
        Sun, 31 Aug 2025 23:56:52 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d12c90a01bsm11387089f8f.31.2025.08.31.23.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 23:56:52 -0700 (PDT)
Message-ID: <761936e8-1626-47f8-b3f5-ebc62f4a409b@linaro.org>
Date: Mon, 1 Sep 2025 07:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] firmware: exynos-acpm: register ACPM clocks dev
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
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-4-de5c86b49b64@linaro.org>
 <e8346a38-fef7-482f-81ab-20621988b047@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e8346a38-fef7-482f-81ab-20621988b047@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_235654_386669_DBF91F39 
X-CRM114-Status: GOOD (  25.65  )
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



On 8/31/25 11:50 AM, Krzysztof Kozlowski wrote:
> On 27/08/2025 14:42, Tudor Ambarus wrote:
>> +
>> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
>> +	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
>> +	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
>> +};
> 
> I don't understand why clocks are defined in the firmware driver, not in
> the clock driver.

I chose to define the clocks in the firmware driver and pass them as 
platform data to the clock platform device for extensibility. In case
other SoCs have different clock IDs, they'll be able to pass the
clock data without needing to modify the clock driver. GS201 defines
the same ACPM clocks as GS101, but I don't have access to other newer
SoCs to tell if the ACPM clocks differ or not.

The alternative is to define the clocks in the clock driver and
use platform_device_register_simple() to register the clock platform
device. The clock driver will be rigid in what clocks it supports.

I'm fine either way for now. What do you prefer?

> 
> This creates dependency of this patch on the clock patch, so basically
> there is no way I will take it in one cycle.

Would it work to have an immutable tag for the clock and samsung-soc
subsytems to use?

> 
>> +
>>  /**
>>   * acpm_get_saved_rx() - get the response if it was already saved.
>>   * @achan:	ACPM channel info.
>> @@ -606,6 +636,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
>>  
>>  static int acpm_probe(struct platform_device *pdev)
>>  {
>> +	const struct acpm_clk_platform_data *acpm_clk_pdata;
>>  	const struct acpm_match_data *match_data;
>>  	struct device *dev = &pdev->dev;
>>  	struct device_node *shmem;
>> @@ -647,7 +678,30 @@ static int acpm_probe(struct platform_device *pdev)
>>  
>>  	platform_set_drvdata(pdev, acpm);
>>  
>> -	return devm_of_platform_populate(dev);
>> +	acpm_clk_pdata = match_data->acpm_clk_pdata;
>> +	acpm->clk_pdev = platform_device_register_data(dev, "acpm-clocks",
>> +						       PLATFORM_DEVID_NONE,
>> +						       acpm_clk_pdata,
>> +						       sizeof(*acpm_clk_pdata));
>> +	if (IS_ERR(acpm->clk_pdev))
>> +		return dev_err_probe(dev, PTR_ERR(acpm->clk_pdev),
>> +				     "Failed to register ACPM clocks device.\n");
>> +
>> +	ret = devm_of_platform_populate(dev);
>> +	if (ret) {
>> +		platform_device_unregister(acpm->clk_pdev);
> 
> I think this should stick to devm-interfaces everywhere, not mix them,
> to have exactly expected cleanup sequence. Now your remove() first
> unregisters and then de-populates, which is different order than it was
> done in probe(). Use devm-action handler for device unregistering.
> 

Right, I will take a look. Thanks!
ta

