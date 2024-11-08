Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37806D5E15A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YL1Rgp45aNCeqluD7CNTr/BqOhZWdGker07rC0pXvB4=; b=qhnBg72waMOx6Llv9j57mNJFQI
	CAXoLwvRf7ShWxqXH2Pove6+DgHp7kQ9PpUEVQqDWqV9nV0u6XZJQguL+jERHhOM0GQHLCD91Q+Am
	emqtMsTM1EtlStFol50FAjASTMZ68II5cTKpUuVROa8Ki1+ANPmzcT1gT1y+2jV1Lg1HU38VNMaIO
	CAfEq3UvMT46uwZu7EtZAFk23t1TfKof94yKXQowRRENsDGM/VvwqP8tZkkqojvacXg5XaayM8nmv
	zzEitte6wjmmMriRjzNtCRWWtS7NV0ZEXMfnoJIGY0JXLxZr+vluVvgU/U36b2nnpG89KM8fqc0pu
	hkKIDS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NVr-0000000APTR-1bOx;
	Fri, 08 Nov 2024 11:50:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Mr6-0000000AHsF-38J6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:08:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d5231f71cso220002f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731064123; x=1731668923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YL1Rgp45aNCeqluD7CNTr/BqOhZWdGker07rC0pXvB4=;
        b=qVBr/6Hn19LdtYLKpb411U9tYFT+lB+6FsBhKsLlWEoK0ZeKsf2mSHEBSzIvp1RsJn
         +qJgA/4o/zCn8bJl7GoTJRddZPxKXSmflx6w4AxkCLiud4FbMcCZnevO72AmVjmyUqDt
         6k5WJX70VUgKqqNhjEAQvTlkk1VlsoxmK237mJZxZCGdF3r8jaZNvrnlFl/v7p3QQILv
         NmWOBzqJPkuy3Vdhv3sPpjltnVCqnl6CKaaEJgoBq43c4ABfjqIOushEGRY4YfTQPitz
         ai5TDhJ/srslkPKDtT9vJRrX9CEUIldXUIQjlTIX6Tdnk8hrKuVjGa2QwA7gYMkU+1Sc
         NmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731064123; x=1731668923;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YL1Rgp45aNCeqluD7CNTr/BqOhZWdGker07rC0pXvB4=;
        b=voqMdGcN4ZHVikeNZJtdUhbmkLGp46BaKrLlE+qmIjYFUkPkiERoX/OZynOKRumWMr
         6FX0VoWIaob5oW7XsqM99MQErIKdhWj5eekUA91LzwJqN6GEud+ZygiO4ihOnFGypTFa
         vuSYKqodzJ8F8CIP1KpS6JrLULj7gPI4pkvoJujW/k61XwEV84GkRYpFOCIsqekAMGAY
         i+CzNZk/blw/DAKeJwLrz1w/UoBERCZnNHntq5Iuw6640UhJsmFQ/DOpDBbyswMvD9hh
         DPc8xANkymTtjWrMglBsb1hsTAjuxHRdpa5WHnxXzbH5DE2H1E1kWzpXxxKsjApmzOAi
         2G0A==
X-Forwarded-Encrypted: i=1; AJvYcCVPdG16dHwIZ2h6V9JzDjA7wLZMm4o9awDB5s6bFiFCovpdzkFHeKBaATZ6GTVFhv4seNRVoPgqL5CqZ+mEYpkK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy0qyNztMds6fMFz0e/NroQmVx7TeT2dY8H7Br6Ckzd1fc6q1T
	kf0i1w6WHI1U6SaLIWqmN7f1Q4HT1P8X1oBzTN0g7oPf+E2QsF7UyyXDfxdG7k8=
X-Google-Smtp-Source: AGHT+IGj3BOQZ14AiQY13aS/5gS5f1lxEfbLYLKCMVX8PhMYJaBS9XktQAJj1VkL3pEbWfTw7n9xKw==
X-Received: by 2002:a05:600c:4e90:b0:42c:ba6c:d9b1 with SMTP id 5b1f17b1804b1-432b77fde6emr7620575e9.4.1731064122872;
        Fri, 08 Nov 2024 03:08:42 -0800 (PST)
Received: from [172.16.24.83] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a234sm97153065e9.34.2024.11.08.03.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 03:08:42 -0800 (PST)
Message-ID: <c50d36ca-2268-4149-8bf0-c44fc1786d9c@linaro.org>
Date: Fri, 8 Nov 2024 12:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241108054006.2550856-1-fj5100bi@fujitsu.com>
 <20241108054006.2550856-2-fj5100bi@fujitsu.com>
 <f66a649a-60dc-44ba-b8b0-b049c9e357fb@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f66a649a-60dc-44ba-b8b0-b049c9e357fb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_030845_303572_F8448043 
X-CRM114-Status: GOOD (  13.27  )
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

On 08/11/2024 12:03, Krzysztof Kozlowski wrote:
> On 08/11/2024 06:40, Yoshihiro Furudera wrote:
>> This adds a new dynamic PMU to the Perf Events framework to program and
>> control the Uncore MAC PMUs in Fujitsu chips.
>>
>> This driver was created with reference to drivers/perf/qcom_l3_pmu.c.

This confused me...

>>  CONFIG_ARM_SPE_PMU=m
>> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
>> index bab8ba64162f..4705c605e286 100644
>> --- a/drivers/perf/Kconfig
>> +++ b/drivers/perf/Kconfig
>> @@ -178,6 +178,15 @@ config FSL_IMX9_DDR_PMU
>>  	 can give information about memory throughput and other related
>>  	 events.
>>  
>> +config FUJITSU_MAC_PMU
>> +	bool "Fujitsu Uncore MAC PMU"
>> +	depends on (ARM64 && ACPI) || (COMPILE_TEST && 64BIT)
> 
> Missing depends on specific ARCH.
> 
> Sorry, this looks like work for some out of tree arch support. I don't
> think we have any interest in taking it... unless it is part of bigger
> patchset/work? If so, then provide *lore* link to relevant patchset.
> 

-ENOTENOUGHCOFFEE, I see now ACPI dependency so there will be no SoC
folks for this, right?  Then anyway split work per subsystem and send
defconfig to Soc maintainers.

Best regards,
Krzysztof


