Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD43CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEci9uMjZdI28rwm3iBkZ0dPmOuD039KbuybMmsaWKg=; b=yQl3y1fyH5pBE3iChLJYcyhs+/
	aukv/7kcSLfHtTq5W2N06TAN7Ef/MPoNLxbLh51NDrZ0PrSurRGSkD5+2H6OTVgs7p/0SELABjppk
	UfyWjGkhkYlKWf8uE58RBc0xlpwmMVElr1prJ42cpWVBoer5EBQmsGgpQgC2Kz3dgMZsmd/fO6jpA
	Bap4jXuDq2rChtNPuu6a0ESF00uavJj4kOumizt3Rk9rGi59b3AiiKg49ZUgEGMQIfQcE/D8s/RJn
	cJdYLCAaH55SZGujJeocCRgs64u2aZNn/+17RqE/VlSwyxSFbMOAD3BvxbaaQDXpdkGbH6jpxypQq
	1GvT9/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYeq-00000008L43-3y8U;
	Mon, 25 Aug 2025 14:58:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWJ9-00000007usk-47zO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:28:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3c84925055aso969426f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756124898; x=1756729698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEci9uMjZdI28rwm3iBkZ0dPmOuD039KbuybMmsaWKg=;
        b=o3b09y69qQeQ/KjuXmUy0A2OuEpBzvh4n5nVD4dSAiHM6bWwK9CZa4lQruywUypTp0
         ECN9qSXmXR7TllDOi5Na6T0xrwQqS7JLdTdu3C3I54MVfRuapRCXRhSraKmbRJVu64bX
         6jSidUIk/WMvRpDq3ApQoLA9tw3idTCN5R2gp4c+dS8VnmqFO9sBLptvyKT9Y3NpqG9u
         ahNjcR56BV/ZXejBf3TBbKgUwi2huvXTXRrsHsaiufYmcdd9AtGWeW4HWiNBGtoK+/PB
         uDSKctBXfmltiv6StoYLoyZr+Jbla1ZgiKrMSlJjCqG9VuKP03YqTbR83M8TxsAdOmab
         j5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756124898; x=1756729698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEci9uMjZdI28rwm3iBkZ0dPmOuD039KbuybMmsaWKg=;
        b=kIcRmS4fwOHOGW3XYHJv7mKnYB9tEM/THrNHWYsADhnOMOfrHSbFGPf8LSO2ZjU217
         Rea+iXY4PZ0N1zujrqxzY0GBVRXMEfR29yOD833zJNNDC5vPUzT7FVW65qi1m2ET6IhW
         g3qPyZOlB24C+wVJ03sDsg1wDkmiILHT4bgQbYFuz9hcNAPT48QpUn3YaR+qqttsSvVJ
         XEW1GmU6EbpcP+piAQNn5AHwRtMgTGGjNRSvPhwIPdsorwuUBee2Q0zi8aFOPFfjFefv
         89/zkLMfXtfIBhuMoufZ1+jiXiwIEwojU1JS0aDr76POdnqJenpMtvLdzWyjfz7hJVpJ
         SyQw==
X-Forwarded-Encrypted: i=1; AJvYcCXElkL1+av0T+UbAgdbxfGlR80qis/HzjKGyex7sK8hDPVCjEhr9egq872GIo6ZqE0799c4W77lrT5J4ArQ3Tbv@lists.infradead.org
X-Gm-Message-State: AOJu0YzFK/PIo1+dyuu2eZbVeuTwMylJRXcUYKBYO6YLEnX6/ZDZvHhc
	jh5UbbH36qA3CZlembOipmHJtntCOmTcTRaRppfFeFyBsUwBSMEhLD4KiF/8REcTwmI=
X-Gm-Gg: ASbGncvqzVBqfWxvy3YO9PqGzheqZMAnpbXgAPuNSmXoBvG43RpZmgVqMftKXytvqIN
	iouI73DMuGyTo4s10Xf5XDQXPeu7zOfNJ07MYxvl6ALQ7ZzW+Km7BbG0UK1fD+6Vm3s14VrP+t9
	IIMqbzbP268pr0T9aRIJOKTEqJURJfMb9K4d8z3gRZwncZQsLAVqA3W3xE9WGEXUG+iVeUT1WVn
	K+KU9MTniMUzDK/h6H8WagIV+IYDwTUr+KeCPul3Xr2yYqqGz3D4tUbZniCsv93T9ArBf1/zFmH
	oqF3qI8GlMQYCT9xrd+LPaT4kxlCyAldXe/1At4uKjIyYvv0SFjysnbnUbgY4/t2pv1xyHX+5bi
	5wqvFGuKcJH1AnhA1eC8sKvrCboeFfP4=
X-Google-Smtp-Source: AGHT+IFIp/SnHEdMPilDFNbxP0Dbi82GGffS4GH1XlIR8cNBhKEBrJgtBQ7C69WSa2euQj37PuOC5A==
X-Received: by 2002:a05:6000:288d:b0:3c7:36f3:c352 with SMTP id ffacd0b85a97d-3c736f3c4c0mr6600072f8f.59.1756124898359;
        Mon, 25 Aug 2025 05:28:18 -0700 (PDT)
Received: from [192.168.0.251] ([82.76.204.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7119c4200sm11315101f8f.53.2025.08.25.05.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 05:28:17 -0700 (PDT)
Message-ID: <6a52b243-11b1-4740-9d15-dcda7bf79777@linaro.org>
Date: Mon, 25 Aug 2025 13:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
 <e17ea82b-fb3e-45d2-a168-3b917816fe7b@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e17ea82b-fb3e-45d2-a168-3b917816fe7b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_052820_031141_74C0CDCE 
X-CRM114-Status: GOOD (  20.73  )
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



On 8/24/25 6:10 PM, Krzysztof Kozlowski wrote:
> On 19/08/2025 13:45, Tudor Ambarus wrote:
>> +
>> +static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			     unsigned long parent_rate)
>> +{
>> +	struct acpm_clk *clk = to_acpm_clk(hw);
>> +
>> +	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
>> +					clk->acpm_chan_id, clk->id, rate);
>> +}
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +	.recalc_rate = acpm_clk_recalc_rate,
>> +	.round_rate = acpm_clk_round_rate,
> 
> This should be determine_rate. Check recent patchset from Brian Masney.
> I applied the samsung bits from it to samsung soc tree.

Will do.

> 
> ...
> 
>> +
>> +static int __init acpm_clk_probe(struct platform_device *pdev)
> 
> module probe for sure should not be __init.

Ah, indeed, both __init and __refdata are wrong here, my appologies.
I assume they came from the time I considered the driver only needed
at boot time. Will drop them.
> 
>> +{
>> +	const struct acpm_clk_match_data *match_data;
>> +	const struct acpm_handle *acpm_handle;
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct clk_hw **hws;
>> +	struct device *dev = &pdev->dev;
>> +	struct acpm_clk *aclks;
>> +	unsigned int acpm_chan_id;
>> +	int i, err, count;
>> +
>> +	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
>> +	if (IS_ERR(acpm_handle))
>> +		return dev_err_probe(dev, PTR_ERR(acpm_handle),
>> +				     "Failed to get acpm handle.\n");
>> +
>> +	match_data = of_device_get_match_data(dev);
>> +	if (!match_data)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Failed to get match data.\n");
>> +
>> +	count = match_data->nr_clks;
>> +	acpm_chan_id = match_data->acpm_chan_id;
>> +
>> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>> +				GFP_KERNEL);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +
>> +	clk_data->num = count;
>> +	hws = clk_data->hws;
>> +
>> +	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
>> +	if (!aclks)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		const struct acpm_clk_variant *variant = &match_data->clks[i];
>> +		struct acpm_clk *aclk = &aclks[i];
>> +
>> +		hws[i] = &aclk->hw;
>> +
>> +		aclk->id = variant->id;
>> +		aclk->handle = acpm_handle;
>> +		aclk->acpm_chan_id = acpm_chan_id;
>> +
>> +		err = acpm_clk_ops_init(dev, aclk, variant->name);
>> +		if (err)
>> +			return dev_err_probe(dev, err,
>> +					     "Failed to register clock.\n");
>> +	}
>> +
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>> +					   clk_data);
>> +}
>> +
>> +#define ACPM_CLK(_id, cname)					\
>> +	{							\
>> +		.id		= _id,				\
>> +		.name		= cname,			\
>> +	}
>> +
>> +static const struct acpm_clk_variant gs101_acpm_clks[] __initconst = {
> 
> This goes to top of the file, after struct declarations.

Okay, will do.
> 
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
>> +
>> +static const struct acpm_clk_match_data acpm_clk_gs101 __initconst = {
> 
> Are you going to have more of such clk_match_data? More variants?

I see downstream that gs101 and gs201 have the same clock IDs, clock names
and acpm_chan_id. But I can't tell about others. I assume it's safer to
assume there will be other variants.

Anyway, I'll pass this as platform data, if I understood correctly.

Thanks,
ta
> 
>> +	.clks = gs101_acpm_clks,
>> +	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
>> +	.acpm_chan_id = 0,
>> +};
>> +




