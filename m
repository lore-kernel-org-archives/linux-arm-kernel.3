Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF5CCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1PqOUmZ0Ne7FPif1yb7D1u9567Eu8Y0LGe+cU3C1kk=; b=zoCrllQxYwuRVrwl/Sq17Yd5OC
	nO5F4xn4wkIpfm1D0Jjl+lUQuwVRYLAHqE0Yx6XOijjIOUqRQRHMTB1a52/nAUp5fgSloUzhioMV7
	Mj6T6JGMEBXKq51DzI5FWKzh9XDlUCwSTwYhvWEIVUf1z/t1j0wfOOqOVBpOjlLN0mOnKevSE5g/H
	BTuXn3SOTeWWF7KshmsqnAIwEA2tmsh844yUjVJLzbfIzkiHVaEMlb6LAWWcAeLpZQHBljlADkjVL
	LVEVg52Orqzs/uSKaOERLk+rMrRKCy3CEcAJW7jPZVw/4VSEKhkrCDnL7az9s2RIwd2kiKh8Q7JEp
	EGidu2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0WQ-0000000BhHE-1tpf;
	Mon, 01 Sep 2025 09:08:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut08a-0000000BcX6-3v31
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:43:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b7d485173so24428805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716219; x=1757321019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1PqOUmZ0Ne7FPif1yb7D1u9567Eu8Y0LGe+cU3C1kk=;
        b=IXPJjjWlvtxsU+IDH3JkFqAMdqXCRYbFk92vQDDWRDXue4TavlZabwMnurRXUG2x8W
         LALDTlIMhmkJWTaCXe2wCsJZBol84y2b4Vh68xPHNgLTEwIfBWFs0s7za19PXCGcjNCK
         Aks5iaj2x6IBIp2JReTuAfbmI6zIQLmyBG3MB1wt85CFmC1QgLiaLCiWDw2HTuwfElnr
         3wovSOYsEvOZSY67KJBNvl2pQ/SzinaXhXwpX1rRoRppgyaabNGTc+yvSOwXe4k5MFk4
         QvHnq+4ospiXIFBxNg5TKJWDAmw3EnLIupWmfm1kM0JFDanmYaDtMyRWUA5YufdQdAWc
         tiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716219; x=1757321019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1PqOUmZ0Ne7FPif1yb7D1u9567Eu8Y0LGe+cU3C1kk=;
        b=S/M1g11saH8nck1VaQMOwXYJb1txquzfljJdhGmAK0wLU0J0ED0h5oGsj5odszeKa8
         EmNAoBPfo5YwveFqHNASD5KccX+VHGBrpbKtbIBtt8HNx5kE3QLZTaXGQs4/ZkVtvkVF
         PLRXY386coy3Yh5lBZHg7dLhFq+D9b1WEZYDVzgOnI9Y3YDFxwlYU5xppdZOwnH8WqJ6
         +5tod+nLYTQHno6R0xMmuJQBDLveh0qPPvoXHP0YbpfKbefL1HPuR8pr/jw7tenVWMI1
         2psrkePdVOFqy0V2QD3/B70ELsBfrZ0yQugzhFzqVd1I2EXa3e1qd+ECX28FcbTSdqgN
         rOsw==
X-Forwarded-Encrypted: i=1; AJvYcCUJHMR2NvibfsTg1ZuWwz5Qek5aiH1xdv9Z4ycvIXKoBROmDD4YLEFsc4JqK6WcVAWwZUCGXGVFcIksc9lUSbeR@lists.infradead.org
X-Gm-Message-State: AOJu0YxcBNIAGVKkG0wVVu9tGGxWgEJjoiHzFbXBEjjb6ROs4+msmX6E
	9h08u2FL6GwXIja2K5Hjwgdfq7kWzTviPLSbv76ByOi770KtDumSd0BYULvx9P45hSs=
X-Gm-Gg: ASbGnctbXVBI3yQ9KrfD8rDhQfI0c7q6lWJEWWxaCR8QnSripkFYO6jUtD5JqakaXvA
	mvA6KHTEZ7899Yiyvo91R4sNGKXVEaiVE8ZIeRQ1YEYBONlv2Vd1lNB/WuxZ1Y/DIjhH4SRi0iO
	p5+tMoR0hN0lKJGCLu2ljRDU3pnyHrFUMhIdC918NXGqrzlw0Ljomn8pQBs0TwAn0fMIeiNm/Vy
	mmESKdS7Kl6uFBlCVHDERmF1blAl+zWRgJBNxlnYW7oRi5Uav8KkQ9utS0ymb4J2T4uDpHgCyca
	j3ewHYm0Nq9UU8aHJ6/tO45ZZITL7Z30DZFZPkbmqbBVo9lcXvJZbW7U1tQNE0ZHsFsR2t4K27I
	Cg3SusEjhZUCNOZsoXeDUeQnuWIooQg==
X-Google-Smtp-Source: AGHT+IEOfIZTQy6jci7xeBxd5WsSj+WaclDlxn3VgJ9N1OGclS2wRjNkjBAzbocqqf4Z87S9TOQbdQ==
X-Received: by 2002:a05:600c:a4b:b0:45b:6365:794e with SMTP id 5b1f17b1804b1-45b855711fdmr62236345e9.24.1756716219178;
        Mon, 01 Sep 2025 01:43:39 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b69b7529asm139030665e9.0.2025.09.01.01.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:43:38 -0700 (PDT)
Message-ID: <c1321c46-e7a4-4489-a63b-a3ed72e5e98a@linaro.org>
Date: Mon, 1 Sep 2025 09:43:36 +0100
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
 <761936e8-1626-47f8-b3f5-ebc62f4a409b@linaro.org>
 <2567a939-4938-4c92-8893-83d03ff8767f@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2567a939-4938-4c92-8893-83d03ff8767f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_014340_978549_186236E1 
X-CRM114-Status: GOOD (  27.68  )
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



On 9/1/25 8:48 AM, Krzysztof Kozlowski wrote:
> On 01/09/2025 08:56, Tudor Ambarus wrote:
>>
>>
>> On 8/31/25 11:50 AM, Krzysztof Kozlowski wrote:
>>> On 27/08/2025 14:42, Tudor Ambarus wrote:
>>>> +
>>>> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
>>>> +	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
>>>> +};
>>>
>>> I don't understand why clocks are defined in the firmware driver, not in
>>> the clock driver.
>>
>> I chose to define the clocks in the firmware driver and pass them as 
>> platform data to the clock platform device for extensibility. In case
>> other SoCs have different clock IDs, they'll be able to pass the
> 
> You will have to modify firmware driver, so still at least one driver
> has to be changed. Having clocks defined in non-clock driver is really
> unusual.
> 
> This solution here creates also dependency on clock bindings and makes
> merging everything unnecessary difficult.
> 
>> clock data without needing to modify the clock driver. GS201 defines
>> the same ACPM clocks as GS101, but I don't have access to other newer
>> SoCs to tell if the ACPM clocks differ or not.
>>
>> The alternative is to define the clocks in the clock driver and
>> use platform_device_register_simple() to register the clock platform
>> device. The clock driver will be rigid in what clocks it supports.
>>
>> I'm fine either way for now. What do you prefer?
> 
> Please move them to the driver.

Okay, will move the clock definitions to the clock driver.

> 
>>
>>>
>>> This creates dependency of this patch on the clock patch, so basically
>>> there is no way I will take it in one cycle.
>>
>> Would it work to have an immutable tag for the clock and samsung-soc
>> subsytems to use?
> 
> No, just try yourself. Patch #3 depends on patch #2, so that's the cross
> tree merge. It's fine, but now patch #4 depends on patch #3, so you need
> two merges.
> 
> Or how do you actually see it being merged with immutable tag? What goes
> where?
> 

Unnecessary difficult indeed. Hypothetically, if we kept the current
structure, we could have have a single tag on #4. Since the dependency was
on a new clock driver, the clock subsystem could have lived without merging
the tag, as the chances of conflicts with the clk core are small. But not
ideal. Lesson learnt, always put yourself in the maintainer's shoes.
Thanks for the patience!

Cheers,
ta



