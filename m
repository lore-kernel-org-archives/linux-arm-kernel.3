Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F43CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+5l3fHno/+RdcEbAfvBbgPLJtbuD4ohAwU1afUy64o=; b=B+OF9/bT3LRFGp5E3hSAw7zFnp
	cL/JNNaVaUbN2bX8e/IVezjUMdc+VDYtpB0Ta4NkMKUnO7G8nhZrls4IBdwE44xHAeGPRx6l6vPAs
	4fYg2lUAvMVvV7F6MpbIR8WIbak+6/iv3ZqkvU6Dzlx0fLGz7Mo1xd6y3i/T9+l0Ko1e4eGdwXB92
	4+Bdx3Tg/hTkTcjxRTAY5LXCohY6iFwkjNuYWBwXbHIezFk6TJ6hkAx8fLsEZSWr6sHW5I5E8m3fS
	OJsS33u2793Chhlx1KRGc8SwX9vgwbauAH0PxTdXhFaQz4tW2iPIsIb06yp8IROqaHQpycpQBYhj9
	dyuZzoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQy-0000000BWVz-3aJE;
	Mon, 24 Nov 2025 11:08:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUQt-0000000BWQU-387e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 11:08:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so26725855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763982514; x=1764587314; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6+5l3fHno/+RdcEbAfvBbgPLJtbuD4ohAwU1afUy64o=;
        b=QCTvZlEIocPa9efl8eVo8q7dobqGjE23BcfuM3Yzd4OPcruZR5d+g+GZoIY1Co03Bh
         bgd1JUbvLVMM3uyB5xhNMOor7kg7I3/6Qg+JjXEvdPdZXHaGk9OAA61JGZipXdIBbbu1
         FxDmlR8ZFpjMxcndzBGijZCbAQlSclSERbxme9pXUdoeHIafAEfjHFxgTht7e7BidlqA
         MHAze6ugFoab8NqFhy8VVwvxdjbHUnequUaNyShsH32sYvLfhX8VYNnIwxKF1J7/XvMK
         /lcYgHw/updSfvzyzCVx55wQoIzdG4FV6isSr2b6hoefh8g4URZ5SmYUh0OJpvzSlVr/
         DmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763982514; x=1764587314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+5l3fHno/+RdcEbAfvBbgPLJtbuD4ohAwU1afUy64o=;
        b=TvB/CSoTAKV0Jo4qZGbOdfTAWeVk5AcpXWA887AK9dd3YQnpEmkUNwpNQ/RPvmKDiG
         L1tknkye5EbNIL7RQEcxF2IeTsmgr8SO8JH36xj1sd+3IEuSW12uKcq8CSgvhAq48AZb
         HHXKppAURfqovbT50Ebq6tjW55nYCdhQsUQp31O57H7Q+ysCAdZwyUqZDrVO5l97OU8b
         qh+N/a8Gp4K/doEUM4zkfQuxkfaGqFXxcOByYaQeuZFYUbKxD6pCA1eE83qnWrMobxvV
         HKAcgHluC11UfMs2uNCvV7IMtiGN9M4uXvScQOw/V737esDNxJJDk7S7AcW+WoeTYiVJ
         0lYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpnypgl4uoML1i+2VfXLpGu+xiEEiXjEzi9RAAXssi150QIWlrRbhYCaP6KSiRup8ATXipXMwM6TCukUMEItTl@lists.infradead.org
X-Gm-Message-State: AOJu0YwmsCoExbkWKY7GbeHddgmvCOYDtWg9ZBQ58Rt+zAWzjx8kV+XZ
	2fhmP1pQ10J07BrP4WQol2tsxdAcr4EmE83GXJXKk6eurTqTQKcWZevMroiN63/avQI=
X-Gm-Gg: ASbGncvSwKLkHuGsFqtNy4AdhwlT0r4+mbmYj6qo9065lAa29kyqIwfScavOF+p34TL
	CqcpVybgKaixIUY0jXrkjkPPMQG1SVk5+ab2TgrdCm64I0A7OqjDpF0HtjKUczc1/G/UJOS+Q4O
	nYJ5bw7uo4FiICZMMRY8B4SuBDt2MkRRswaS4y4kp1da7qiH0mz7VxcNEEL2QXgwRRN1Ao0e6WV
	TpQu+1J2rXW8jKrgW0ytRuL2nQGkzhSoe6vaWDi1iYwM9IBjGL8UO2HF/wP7ZC/xPehSueIyfE6
	H4NRpf2IOHYn+vGlsTCwOSFOVHxNbV8esIvXoLpKCx3a+BBcN+YqX9Eo2CliVuGoEZvx5d8fbX7
	ZMbgKw/wpkoePa27VI2rKlsgbmmoQFAC5rf36wHlwCz388RuL1ojqC1UVkbKDrcKKbsw+g/9IMN
	Sic1mx/jqt4/oa1dgFN74iqlPftoXXPuIO3ODS2/DmErWpR8oF/bXT+P7u1r7drk3/Mw==
X-Google-Smtp-Source: AGHT+IFTZFirZPCwnUDDiKfKr7H0K4OzotyW7bjOyOjeldVQNp8jBiM4RwHnhw/nv1j7ENdmzDjRpA==
X-Received: by 2002:a05:600c:1914:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-477c112587fmr86546865e9.25.1763982513683;
        Mon, 24 Nov 2025 03:08:33 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:a756:bb6c:7b35:af9b? ([2a05:6e02:1041:c10:a756:bb6c:7b35:af9b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0e1sm186819905e9.10.2025.11.24.03.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:08:33 -0800 (PST)
Message-ID: <2b63c064-ce62-421b-8469-e434bd0c9652@linaro.org>
Date: Mon, 24 Nov 2025 12:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 RESEND 2/3] thermal: exynos_tmu: Support new hardware
 and update TMU interface
To: =?UTF-8?B?7IaQ7Iug?= <shin.son@samsung.com>,
 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
 'Krzysztof Kozlowski' <krzk@kernel.org>,
 "'Rafael J . Wysocki'" <rafael@kernel.org>, 'Zhang Rui'
 <rui.zhang@intel.com>, 'Lukasz Luba' <lukasz.luba@arm.com>,
 'Rob Herring' <robh@kernel.org>, 'Conor Dooley' <conor+dt@kernel.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Henrik Grimler' <henrik@grimler.se>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251113064022.2701578-1-shin.son@samsung.com>
 <CGME20251113064044epcas2p1b87addb21473eca7cc52052e4e2e9237@epcas2p1.samsung.com>
 <20251113064022.2701578-3-shin.son@samsung.com>
 <2180a854-8ba6-4424-add2-eb34637530c1@linaro.org>
 <000001dc5d2a$0697bf10$13c73d30$@samsung.com>
 <ab35c20e-390c-4479-9bb1-9f5e49cba2a0@linaro.org>
 <000001dc5d32$2b4bfb20$81e3f160$@samsung.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <000001dc5d32$2b4bfb20$81e3f160$@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030835_814609_D0D8C1A4 
X-CRM114-Status: GOOD (  10.00  )
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

On 11/24/25 12:04, 손신 wrote:
> Hello, Daniel Lezcano.
> 
>> On 11/24/25 11:06, 손신 wrote:
>> [ ... ]
>>
>>> However, since ExynosAutov920 diverges significantly from the existing
>>> driver, Would introducing a separate driver instead of unifying
>> everything be acceptable?
>>
>> So this driver is one controller for multiple sensors while the others
>> drivers are one controller for one sensor, right ?
>>
> 
> Yes. As far as I understand, the previous Exynos variants used one TMU controller per sensor,
> while on ExynosAutoV920 the hardware has multiple TMU instances and each instance contains multiple sensors.
> Therefore, this new automotive SoC requires supporting multiple sensors behind a single TMU controller.

Ok thanks. It makes sense to create a separate driver.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

