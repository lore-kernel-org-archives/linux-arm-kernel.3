Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C28CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMUFRQkUCFTnfXTOUg1GE/4NL6hravK/FIP/AgB9Y0E=; b=2pvQ0zVro4F4Uh32FRBbjUqxbb
	O3Admkds7TYvj1YwNS5jhlKkMQjSeiqymJgjPgRHbrm4/HORRcPDoVj3qQe0XgDsqny4ciVEtwWmB
	/vl1uEVuefs60us00AvyZU0Abv9kfB7bCUzkrQ6cog4ENLko9KELrZgEh9Ift5bk4Xg5QHdorrgkX
	bdVK03kRbEuMHoWPoUeDY7vzxeh9sD1EI6lX5MEJkJM/3oeHYoNYY+0EtOaL+2RDMEv05i8odRHhi
	zUEB08A3ePGILyRkBNlm3Ovw9rcEQ20OCZmUyAWofULReph5heA+axgymNKKefbrmtr7FQLznoxX2
	d/nMayPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhv-0000000BHTp-1HS8;
	Tue, 12 Aug 2025 16:18:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullqI-0000000ASfg-0OtC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:02:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so48200615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754992972; x=1755597772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lMUFRQkUCFTnfXTOUg1GE/4NL6hravK/FIP/AgB9Y0E=;
        b=fB8zWEW6WJmeSnBnDOEkNDIdb8YxEB3EWqNqz7hsS8m1/eNO53c3sYx8lXZEJFT6iK
         xlSj1Bh9H0554sQ8s6FzjMXdVfSlFC8/mSo07ca6Y4b2GUATGmvdMHAXPNee1eyONThs
         3rmfzY33exDJLhpWs8aXO4LpUWPAYJByu2hdsopqOLOM7VZGzgxGLpvz1sLB/7Ex88j1
         a6Xj7yeG4DBCDa2KNCtXG0UBN9XaWowxaLCinhdDakuMl/jiVOoyF6kntG4Cor3SYH6I
         BQCLoVWd98IkL9DiHtCcHL6wIvDIrek5SXjqoTHR72ilS5YM4FOZ5eqKSUsPHpZv6R9j
         ncCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992972; x=1755597772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMUFRQkUCFTnfXTOUg1GE/4NL6hravK/FIP/AgB9Y0E=;
        b=Bz/HgMEtk5l5d7Ba6avwhIOC3IN+qrVv/9J/L/TDtgGXBNBMptw+6h/Tmq14ruUfiI
         ZupdWQw7kyp6SZ+1lOAK/Z3A0QZMgdOEOIm84i5zpOH2RHfr/1dGRwQ+bMjkJSzOWBuq
         cSRtC622mpuku4okFz/Wgo+NS7JgolulsaQ87Mf7vbr1caK18St83hMLFPrth8CWv9Dm
         toFMTikYcu1m3ICaS0G36jCf3E5eRXxwS/1Po9RhIIx5nGxHRPgGz2Z6fwSHLaE8pE3O
         0MnF1JsG8ST4ec8k5sK7HBo7es3ZpGJw8eRjUFVOI8c0dQUacOUd2kigJ3aQvxhvn3ut
         WKaw==
X-Forwarded-Encrypted: i=1; AJvYcCXhNBih0hYO2JdAQ5Xvh3PR4lR7oqg75e7ylANNVtXjrBRfv5NSPvss3AVfBfBNc30loZoMrliFbxc93xEAr6rn@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/zvMgD0t9SiWiYMXzy6amBkOO6FODRFkg6w32xiHjynKBwl+
	/H7Jx/nrgOqZqxN7lxa9T3Vs6VElpJT/I+ufalKQa+4qGLce9R645KcaDgdlGqcqicQ=
X-Gm-Gg: ASbGncukfl7lNRVIlARxJoXV/WtodDkIsdIpEMG2r9eg3rE+Yx1Qzu48X1oN+GpHZvc
	s5ER4th13zTmttfPzfCGhJ56d2X4ie2tITn+G8TIgWntjBYXXdSFYqIqOL9WnLF1I29HmgY+G9K
	TF35IDbFKseudFV3T3D51iXbVK806K9KuGNUwePObPvigE9HpueiIvJItciko+WHSBWa3f7/I2S
	vwH+15Y+lrt3K6jgqjRje6LfyEbfFRotUafEZKeIkmRHNn6Xkjvr9woZu+uURAw7W4/NckR1f4E
	Zl+7WPeHKpDd81GQqnBqGF8j6imxoRykVic/xbsNWZx0hRol8iwUrH61m5r39ddrmJ4M/RK0mj7
	4vR71pegq2xxF1Wel6i+yKx5bThY=
X-Google-Smtp-Source: AGHT+IEDgZDdlC29E7WPXX5mHtnM5xMJLgYKltbMlfqTk2eqtCCdDKPsKEittUUlIJjKSGxZRm5M6w==
X-Received: by 2002:a05:600c:4708:b0:456:10a8:ff7 with SMTP id 5b1f17b1804b1-459f4f146dfmr126807615e9.28.1754992972506;
        Tue, 12 Aug 2025 03:02:52 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5b84674sm312126965e9.30.2025.08.12.03.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:02:52 -0700 (PDT)
Message-ID: <73285731-5be8-4a27-b609-b4ad80274b51@linaro.org>
Date: Tue, 12 Aug 2025 11:02:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf: arm_pmuv3: Factor out PMCCNTR_EL0 use
 conditions
To: Yicong Yang <yangyicong@huawei.com>, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, anshuman.khandual@arm.com, jonathan.cameron@huawei.com,
 hejunhao3@huawei.com, linuxarm@huawei.com, prime.zeng@hisilicon.com,
 xuwei5@huawei.com, wangyushan12@huawei.com, yangyicong@hisilicon.com
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-2-yangyicong@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250812080830.20796-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_030254_141696_1FE2E8AE 
X-CRM114-Status: GOOD (  21.39  )
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



On 12/08/2025 9:08 am, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> PMCCNTR_EL0 is preferred for counting CPU_CYCLES under certain
> conditions. Factor out the condition check to a separate function
> for further extension. Add documents for better understanding.
> No functional changes intended.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   drivers/perf/arm_pmuv3.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index f6d7bab5d555..95c899d07df5 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -978,6 +978,33 @@ static int armv8pmu_get_chain_idx(struct pmu_hw_events *cpuc,
>   	return -EAGAIN;
>   }
>   
> +static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
> +				     struct perf_event *event)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
> +
> +	/* PMCCNTR_EL0 can only be used for CPU_CYCLES event */
> +	if (evtype != ARMV8_PMUV3_PERFCTR_CPU_CYCLES)
> +		return false;
> +
> +	/*
> +	 * A CPU_CYCLES event with threshold counting cannot use PMCCNTR_EL0
> +	 * since it lacks threshold support.
> +	 */
> +	if (armv8pmu_event_get_threshold(&event->attr))
> +		return false;
> +
> +	/*
> +	 * PMCCNTR_EL0 is not affected by BRBE controls like BRBCR_ELx.FZP.
> +	 * So don't use it for branch events.
> +	 */
> +	if (has_branch_stack(event))
> +		return false;
> +
> +	return true;
> +}
> +
>   static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
>   				  struct perf_event *event)
>   {
> @@ -986,8 +1013,7 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
>   	unsigned long evtype = hwc->config_base & ARMV8_PMU_EVTYPE_EVENT;
>   
>   	/* Always prefer to place a cycle counter into the cycle counter. */
> -	if ((evtype == ARMV8_PMUV3_PERFCTR_CPU_CYCLES) &&
> -	    !armv8pmu_event_get_threshold(&event->attr) && !has_branch_stack(event)) {
> +	if (armv8pmu_can_use_pmccntr(cpuc, event)) {
>   		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
>   			return ARMV8_PMU_CYCLE_IDX;
>   		else if (armv8pmu_event_is_64bit(event) &&

Reviewed-by: James Clark <james.clark@linaro.org>


