Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B95CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCyc7kQfoMfEL6TVndWCcMyXe6R2NRmKhQkJocZ5/1U=; b=EyCuiWnmjptyD32E2aeqYgcVgX
	QLxvxNt2m6qxtPke7fHtBWORn1NkVSxqin2G+qrTH8UPc1K0wrnxVp62/14dh5DfGeMo82lFQTHV4
	shioU2gBaynxJI+tkQMCCy2/i8e0ltZiBukrQmz6B4v5rL1nbvZjufp7PDNVga++PCs2eGSoGbJEf
	n7APmLWIWWwU5V4YQHSOdqEN8xDT+wLVrLvOX0eWNGuiwxrWRjGToEkDxZrAvpurebzJ1tQHI4KJ5
	uRrtvYlsA+yM8v3t1A7Hjsxsb9tp9Uvdi5WyKxrgvVEX9QRkWoyw2A0LAnisCsPKooJrq3hZ/vQ/O
	OfZPLz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXDb-0000000Fh8y-01Yv;
	Mon, 08 Sep 2025 08:27:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWTW-0000000FMf0-3EPU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:39:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b9853e630so38417455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 00:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757317181; x=1757921981; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCyc7kQfoMfEL6TVndWCcMyXe6R2NRmKhQkJocZ5/1U=;
        b=s/JX5uKb497oOUWrXCgucI5Up2iqAWPXTBCzQH0VFnS/UjvO480ZwGN/CFNUxd1jF/
         qt4kfi3ijOXeAEyxX3Y4bapCVDemp++Ty29cDKN2CI42TEn0c4gMN+3nwZY3kbth82f3
         do+Z7xEH3/SxVc7DwxV/Xs9M+oFeCnwq0WObrVtJd+pkR8r4LwYN7olsgDOWcCWHAN7N
         bcuU/H/C99K0t/MThvDO6Uc9RLMvzKQnEqJC2+VDOeSpdrKl5TtsLftlv8ZaWcLJ0P3a
         Uy3UlSY9SOEqMsI1IGsB1vVJgG9ZPm6+ydTnauqMnw7Y/Obo2nyMcn02IVkGqHBwyAiS
         H/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317181; x=1757921981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCyc7kQfoMfEL6TVndWCcMyXe6R2NRmKhQkJocZ5/1U=;
        b=WOpga/zICxKyzf5ZxJPOAtKDfGVNTn2/gagqg5tAq9Fcb9u2BYJi5iN7T8Z0l91anS
         Cdo9ROlvHCpRTL8Z1vhBpa52dQoH3P0Tesp2m/pOv9JEIhQe4MbRODH3dxPW7F/bmXtc
         9C5TVMJ7x6VvLnyZtJtF3noCozjibiCqtnucJ/eoKJhICdNficktxUkmf9iPquVviDCb
         0+JK41GNBmJ9u9j6V2Z9xvrR+GR1e3Vvhba3+sMk5zkmlsFnwLxw6HHB2q22/XUtyxhy
         LS1H/5x8+XPB7Odobys9E01kZM5Y4nsVaDdEtzbEngZCYZRtDh08Jm3TaXph+tKjFoVk
         A7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA7r2/KfAEHQGPWV3VU5OYLEAzlY+Z4iTLHqeAy1xX7e7EhSmO84nBx2/wPoVNDt1kDq+dZAtaFYMa1wm/E2UQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0cValZoKnZuBBj2O37axAO2F0iUi0w8t1GcAvLCuEsL4lDRUe
	IP9fVKAuI8faEeVwUhqCmLH+rqLwjtnyBufSRSjRuNhUKYqcxooEcrw/DwpMfiEi280=
X-Gm-Gg: ASbGncvQ8+nf9Hc/rxpy6IUGBvQf9/XtvwoZwTnTd1BgoT8ocRKP64rRxbEjRrxsbQ7
	Epdw8AD9HLlYrA50Brf50E4u999sXt+af2RMmwMEnzToLvRMyb7rE8uBaOZ3C0CVpZdpUXKgop6
	SYPsr4PePD64vkoKIiA+X0kSUGEWK04gr5pjKw2LhRH6qEQRVfMUND7jtx/qP0aio0TxuqUgEHe
	zp+xMlcEWK/GSaM+DQYzENDeJNWp1JtO/SmQUXqe21ry4T8bS2PUauAvf46oaK3vwvWVOpbfsI8
	Hdp2gu0rXcP8JglUs6P69fOH6GtL1RjZJ1VgL+pn+qGTmp8zBHhV/zk7tnSsMMtmRs+SRB+ZTjB
	o55RMgTqjqMrHDu4dL/U/wnI0kKDmnW51tAjtkqf9kFs=
X-Google-Smtp-Source: AGHT+IH+1Dsv8foQbfZSX/5/VoAySl4UUdGzifJPzufIcH96xXLSdDwjQ9Qlk+2F227iYeAIAqIiUQ==
X-Received: by 2002:a05:600c:1d16:b0:45c:b56c:4194 with SMTP id 5b1f17b1804b1-45ddde8984amr53951655e9.2.1757317180933;
        Mon, 08 Sep 2025 00:39:40 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddd47b6easm97814895e9.18.2025.09.08.00.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:39:40 -0700 (PDT)
Message-ID: <91407377-f586-4fd2-b8e4-d1fd54c1a52a@linaro.org>
Date: Mon, 8 Sep 2025 08:39:38 +0100
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_003942_822409_A079F95D 
X-CRM114-Status: GOOD (  29.44  )
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



On 9/6/25 1:19 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 15:56, Tudor Ambarus wrote:
>> +
>> +static int acpm_clk_probe(struct platform_device *pdev)
>> +{
>> +	enum acpm_clk_dev_type type = platform_get_device_id(pdev)->driver_data;
>> +	const struct acpm_clk_driver_data *drv_data;
>> +	const struct acpm_handle *acpm_handle;
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct clk_hw **hws;
>> +	struct device *dev = &pdev->dev;
>> +	struct acpm_clk *aclks;
>> +	unsigned int mbox_chan_id;
>> +	int i, err, count;
>> +
>> +	switch (type) {
>> +	case GS101_ACPM_CLK_ID:
>> +		drv_data = &acpm_clk_gs101;
> 
> Just use acpm_clk_gs101 directly (see also further comment).

okay

> 
>> +		break;
>> +	default:
>> +		return dev_err_probe(dev, -EINVAL, "Invalid device type\n");
>> +	}
>> +
>> +	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
>> +	if (IS_ERR(acpm_handle))
>> +		return dev_err_probe(dev, PTR_ERR(acpm_handle),
>> +				     "Failed to get acpm handle.\n");
>> +
>> +	count = drv_data->nr_clks;
>> +	mbox_chan_id = drv_data->mbox_chan_id;
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
>> +		const struct acpm_clk_variant *variant = &drv_data->clks[i];
>> +		unsigned int id = variant->id;
>> +		struct acpm_clk *aclk;
>> +
>> +		if (id >= count)
> 
> This is not possible. You control the IDs build time, so this must be
> either build time check or no check. I vote for no check, because I

using BUILD_BUG_ON_MSG? that would work, see below the why.

> don't think the ID is anyhow related to number of clocks. What if (not
> recommended but what if) the IDs have a gap and next ID is 1000. I see
> your code using ID:
> 
> 
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "Invalid ACPM clock ID.\n");
>> +
>> +		aclk = &aclks[id];
>> +		aclk->id = id;
>> +		aclk->handle = acpm_handle;
>> +		aclk->mbox_chan_id = mbox_chan_id;
>> +
>> +		hws[id] = &aclk->hw;
> 
> ^^^ here, but why do you need it? Why it cannot be hws[i]?

so that it works correctly with of_clk_hw_onecell_get() in case the clocks
IDs are not starting from 0 or are reordered when defined. For example let's
consider clock ID 1 is wrongly defined at index 0 in the array. When someone
references clock ID 1 in the device tree, and we use of_clk_hw_onecell_get,
it would get the clock defined at index 1.

In my case the clocks start from index 0 and they are defined in ascending
order with no gaps, so the check is gratuitously made. I wanted to have some
sanity check. Do you still think I shall remove the check and use hws[i]?
> 
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
>> +static const struct platform_device_id acpm_clk_id[] = {
>> +	{ "gs101-acpm-clk", GS101_ACPM_CLK_ID },
> 
> Please drop GS101_ACPM_CLK_ID here and in other places. It's dead code
> now. It should be introduced with next users/devices.

okay. Thanks for the review!

> 
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(platform, acpm_clk_id);
> 
> Best regards,
> Krzysztof


