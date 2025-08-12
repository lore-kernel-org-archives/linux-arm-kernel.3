Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CEDCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijbWuHSGl43dbfejDrRijP3sy9M2fujmphX5whgf8JY=; b=cXnVrXLbf4fviEj2iM/u0uTzns
	flJ5KPsYdwoJOG7EyUHAKkPIMPj44CeKNZmFZ3qwAbmMw/8Av2mG8CCX9sgWobNzLi34/bQCDaKJU
	4j22IYo0Xv5yxQfxoVjQ3M+R4JC37IyqoC1qrpadWP50gbSTydtzIx6sumjJ8leFKrWOYBDSxpUsV
	dIKZZhe1+GxCK3qTpqCcejMoc64L+wrznhVzUfx/DhEBJStFkuQnEzFPvcvB1mXMzMs9thHOwW2TO
	8yd7H+PBn98YES1txrpLlC1CB3JOpKDqDMgDpZtxxkXrWLFaU9SSA/FF1I/fGYjkWjUDOA+xag8Z+
	94Q+G9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrht-0000000BHQv-2JcH;
	Tue, 12 Aug 2025 16:18:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullna-0000000ASGW-1rsA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:00:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-459e1338565so49377655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754992805; x=1755597605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ijbWuHSGl43dbfejDrRijP3sy9M2fujmphX5whgf8JY=;
        b=pu7V4sLSllEwzh4PtxFMGHmp9KUTjVG0QQRv+8gV0F7sEyna/K5t1B9+ag4+Tr5L2j
         w85wL06rUGpdC67ohZVf4FjMmf1A6BMaWFYCc5K7dRuvKAD0i4pUsDT7eCHxZSV8B4Xb
         aS3S85wy+gNpc6fv/kuKdW/wKIPR6MpchT0OTziMcQMKSzd6JaJTQw7jjMo4WbrHfmsv
         75C0hUsfuGMgeRuZDv3x3WLchc2aK+yhRKAmfA88bStJ56W4b04X0+a1VeAtPmolNdXF
         +JRJ2/PuCMXyO8wOFw+isRe/DvkCscoU307sTGBzeWCKGl4FwbvAvrLqTW8f2AfDKGYf
         Il/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992805; x=1755597605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ijbWuHSGl43dbfejDrRijP3sy9M2fujmphX5whgf8JY=;
        b=wwDBMWJLR6NIM1guJGuMshH4Rmz8+6p8OvmhVNyuIergVuEpb/eL/i3O8NXzOKKB8l
         NjthzYWGsHnbs+fnElnqhKvmGG7FzgciZFc7sMIwWDLh1MCfizm1hunxZPmd6O98uGYh
         wVdzDdPJmj7cLCf2a3Q0ry9vke0q8dkWHwR78d1iHbC78RZl9KlEaoqpF1PDTS9IdAtY
         QjgpbrPZDvS9/VW9/uloh1FERRjtofa2E77/aUJf56R3gRg1nZI5InEEkVQ4C0q2gyp5
         X5qdOH6ym1wkCrGRcLzUmGXwAKy8yQEbgtu5hQg1jtza366VbKILzWg6Ldd3K2gMd1C0
         1G3A==
X-Forwarded-Encrypted: i=1; AJvYcCUjBerkQ9WU2m4AtoPiWPhyDlmwB8Z2KJG+qpB3WNt/6bLDa5tlVUzqfsPMH7MT+JQGXc3w6OMfICFRQb1DYdV1@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt9z5H+JW3T6MyqO7DstYRn7QVbALzMmz2RvqX+U8Co4I7xPc2
	/+pt5xcAWE/pruLO5UqIFMEV1MqNTdQkE4EDH2+Ve559ZWAZXwCf2NN8NXZm8zC9pprGbmLIiCg
	f8D8X4QY=
X-Gm-Gg: ASbGncsu30D3zakY8vKIwdILxcsZhngRgNtDpTA1z78d2QcJ/DXdiquiRdyF9SCXuDf
	xTIXWsoiw1PS/co4P5A7THz4dUm6js5+GhM1WaVwBYBCc64fMSgi6lw4fMVm+xspwSnEifz1FxA
	Wxq1S+WXjN+bu+M9zhlPzmWkrWBc+KHbeHQL+LTLTF/wqJm4wwB+kW87gINQw2VzQcs8eB5Oeig
	Q0vY/NA9+cbxIL3wjpeZim/wzqw6RnwAUJmgQO06WUmuhU5cgvLQno7ydKklQ9GhGyKpPhvr290
	KWrPiyAOEDUxDIyv3eYa5YDxKBuiO3RU/XjOMULU8xE8/GBmoK4lWtLA/MumSWL6TIKKhWMhgzX
	MDI5U1/T3LH7+9wTqLUu4SeL7urliiByq6b3a1A==
X-Google-Smtp-Source: AGHT+IGCIepBU8jXcLYyJ1QZXVwPT84vC+R3sx0IfxxRTvdsE9r6qbtmnUTjXMGFltkzwjZurcDrWw==
X-Received: by 2002:a05:600c:4e94:b0:459:da76:d7aa with SMTP id 5b1f17b1804b1-459f4f13e71mr128114565e9.25.1754992803026;
        Tue, 12 Aug 2025 03:00:03 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5843021sm313696925e9.3.2025.08.12.03.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:00:02 -0700 (PDT)
Message-ID: <3d37844a-63c5-49c2-9d6d-7c3665a95466@linaro.org>
Date: Tue, 12 Aug 2025 11:00:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
To: Yicong Yang <yangyicong@huawei.com>, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org, anshuman.khandual@arm.com, jonathan.cameron@huawei.com,
 hejunhao3@huawei.com, linuxarm@huawei.com, prime.zeng@hisilicon.com,
 xuwei5@huawei.com, wangyushan12@huawei.com, yangyicong@hisilicon.com
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250812080830.20796-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_030006_522777_B78845A4 
X-CRM114-Status: GOOD (  23.53  )
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
> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
> one of the SMT siblings is not idle on a multi-threaded implementation.
> So don't use it on SMT cores.
> 
> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
> patch we'll get:
> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
> --taskset 2 --timeout 1
> [...]
>   Performance counter stats for 'CPU(s) 2-3':
> 
> CPU2           2880457316      cycles
> CPU3           2880459810      cycles
>         1.254688470 seconds time elapsed
> 
> With this patch the idle state of CPU3 is observed as expected:
> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
> --taskset 2 --timeout 1
> [...]
>   Performance counter stats for 'CPU(s) 2-3':
> 
> CPU2           2558580492      cycles
> CPU3               305749      cycles
>         1.113626410 seconds time elapsed
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   drivers/perf/arm_pmuv3.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 95c899d07df5..ed3149632b71 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>   	if (has_branch_stack(event))
>   		return false;
>   
> +	/*
> +	 * The PMCCNTR_EL0 increments from the processor clock rather than
> +	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT silbing is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
> +	 */
> +	if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
> +		return false;
> +

Isn't this something that's static to the PMU? If all CPUs in each PMU 
are always the same then this doesn't need to be probed every time and 
can be set once.

Also you can't call smp_processor_id() from here because this is also 
called in armpmu_event_init() -> __hw_perf_event_init() -> 
validate_group() before the event is actually scheduled on a CPU. With 
CONFIG_DEBUG_PREEMPT you'd see the error.

>   	return true;
>   }
>   


