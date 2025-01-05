Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7752CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIR2WUB7iDaUANGVgvlHqJmyWXuaYhgnizl4jAm8L5k=; b=yQ0hzoJKQcgyWb1iEeNbUS5BpB
	VeLcxOKjUMXvuY6KZ2q4hMOvfQH3yhKQRSVPbjF0epxoXksh+zTE/kBUMVXMSO/zjknVidD0o9ai7
	C6f82auo7Mx/UiJ+I4odv7Cmput+J4EMRmtGRnMsvmHvFEhRf8cUwYTT9iIOEsncdntaxEUyQ/Mdi
	bKpIbW6LxCDtDJw0V1i5nG5lJdVbKO0XgYACYVkXDUwpEVwOVq6B8ddrKs4J8wXRFieu64At/yrEB
	z9N33YyjRntN+NObmSkKTwq/ofzUxn2CVK6acSvKIvc5qkXkL4pLGXANYhdverow7bU2sI4sXKjA9
	8Kle5Hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPU5-0000000Gn26-0QWq;
	Sun, 05 Jan 2025 12:11:57 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUPSs-0000000GmwI-0iqt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 12:10:43 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-304d9a1f198so22957131fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 04:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736079039; x=1736683839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIR2WUB7iDaUANGVgvlHqJmyWXuaYhgnizl4jAm8L5k=;
        b=Xg2M+nU9JMg9GiRwtffneHjHi9xIF5ypWoLNPSZA6bmFEh4NJ19E4yAlSrkw9N+DVB
         ABGaYv5V2DThyc1pbVihp93U39w2OjbQOGdQnF6WUoxfbjdH+HYvgUwfRXlIgrB//Iit
         nx9ZSkkEugq6+fvWez3eVMmsroD57WYe8GvVIXEKr2hzPYSearZ6tq1MXm5eKC8lhGhe
         qLp6HQnLzoPaYkvcChAbHDG8EiKgi7d+CvSyY1cY353FmoQ7k+thX6gaiDpW/+hFHkYZ
         e8hh87+pjMqzlHV9n4TEy8rFj3D2BtZbP91OVkZHGKkqoqHYGBjQLAPbh8NLt3ojlCRq
         mXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736079039; x=1736683839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIR2WUB7iDaUANGVgvlHqJmyWXuaYhgnizl4jAm8L5k=;
        b=qAE8V/kpQvgM/AXNQn7prBBIJC2Ue1u22eWRE05XR6AR5y7yt63ZSqaEKp/tlSb8y+
         JXzBDLGG5J+Jl8S5wlAUEroTevPiOylIMA8V4Uo54CtBiYrOEvYc3DXvsR3hszF2NXgi
         Taf9i9db3SGk47ZCJW+UdworGf83F9EiPiaxIKLHACu05WdcRyfJxx0RC8S6WAZjKJFM
         8ZsBk/io3nEsWkqMGxSWPuvdFuTmFVG6y9/VwI2pqxRoe4YvkE6XxQtFhy6/83KJktJ9
         ScmdAwMCt78RvYq8fzsBI9E4UxEK3c4K5x5tDXVmejgmEt/CuLcEqIAHbBqvPOKZtIZ+
         IITA==
X-Forwarded-Encrypted: i=1; AJvYcCVHwl0Q3Lh+9UjQQiqjEsWQA5YKbgMEOA4WP3yjczFImrP83a9sVqOlAPk7DVzx9spQ4AOh170YJp8544N5XYz1@lists.infradead.org
X-Gm-Message-State: AOJu0YyLrAFCE1uW7ZL5hBl3+AdOtaKhM5yVbnOcwR6kUTeDjtkszpJU
	vkM+ipQwfwAb8MrxwCB/Ye0uSPDuI+7RZT1kqX0PVSR9z+GHFz8n
X-Gm-Gg: ASbGncvhDLIXGpQsEriTu9AChZqgs635Duq2x3Q9ytpzoivlXhDCqEvYoQa0qh/GPOO
	3GXbVq+Qv3+iaifnn5/rUv4hYzHKmK6o+9G3MGqoYAuTVY3SC6uDEgNGzfp0Q+1UrVWO8+5CfGw
	vPacbXa/kqpiDz4IB/NS+v7a+Q3Z6wrbw9o9j/xiUYREH/mbuHT+Z+muR4vR5xnwLdiOdr6IMbv
	3NGNsYCuGkSgngoDFSetxt5SAwpnRnrEbWEIfxTIdp/SJkusBjDCJu3vKgjeg1m90t6
X-Google-Smtp-Source: AGHT+IFlc24ByTKQOGlSaCSC9vJUmoKQHw2J7odDp9pVsfiTWElFZ/1BMjPvv295W02VrkuPrX2Row==
X-Received: by 2002:a05:651c:2107:b0:302:1b18:2bfe with SMTP id 38308e7fff4ca-3046860ed27mr204531111fa.25.1736079039172;
        Sun, 05 Jan 2025 04:10:39 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082d56sm52973331fa.106.2025.01.05.04.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 04:10:38 -0800 (PST)
Message-ID: <6b66b484-badb-4a99-b19f-5cab019cc5ea@gmail.com>
Date: Sun, 5 Jan 2025 14:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos990: Rename and sort PMU nodes
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105-pmu-sorting-v1-1-b55519eaff2e@mentallysanemainliners.org>
 <bb1e89a5-a83e-4e68-9568-073f9c4a8af9@gmail.com> <Z3p1IV0rVH9dPQ_C@debian>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <Z3p1IV0rVH9dPQ_C@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_041042_217356_713F4647 
X-CRM114-Status: GOOD (  17.87  )
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

Hi Igor,

On 1/5/25 2:03 PM, Igor Belwon wrote:
> On Sun, Jan 05, 2025 at 01:39:04PM +0200, Ivaylo Ivanov wrote:
>> On 1/5/25 13:16, Igor Belwon wrote:
>>> These nodes were sorted by name, but it's nice to have the same class of
>>> devices together. As such, drop the pmu suffix and add "pmu" as a prefix.
>>> This keeps consistency between other Exynos SoCs too.
>> Well, most SoC device trees still have it as a suffix. Perhaps it'd be better to
>> apply this change for all exynos device trees instead of waiting for other
>> people to apply it separately?
>>
>> Best regards,
>> Ivaylo
> Hi Ivaylo,
>
> The newly-merged 9810 SoC had it hand-fixed by Krzysztof while being
> merged [1], and there is a current patch to fix it on 8895 [2].
> That's all the SoCs with Mongoose cores (and the Mongoose PMU breaks
> sorting). Only 990 is missing this change.
I believe for Cortex PMUs it's also preferred to use the e.g. pmu-a53 
name instead of arm-a53-pmu. This name is at least also used on 
exynosautov9, exynosautov920, exynos7885, exynos5433 and exynos7 (list 
not conclusive). So maybe could fix it on all SoCs at once, instead of 
making individual patches for every one. This is just a suggestion 
though, your patch seems ok.
>
> [1] https://lore.kernel.org/linux-samsung-soc/d1c6d2f2-f733-4cbe-8108-c9c9aaa417cc@kernel.org/
> [2] https://lore.kernel.org/linux-samsung-soc/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
>
> Thanks and best regards,
> Igor
>

- Markuss


