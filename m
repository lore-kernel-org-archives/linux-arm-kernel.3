Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3BDCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJP6HXgSPsdlCCU5AgGKGF0EX+f2P6yNyzg4ivXkKMk=; b=HsOu3glhjEfx4rdaeQS0PmOI7H
	YkV2wYiqXMnK//Yjg25U+VNmc7kip2ZM3kQVqlR7MoDDrCwX9s+uhfJZ4KAZ1SB6vhjia3ovmYCAR
	R90XeyodQo7vDUlBBWZoXhgUggvEWzcAhFxKBLUuQt/5UoyyIM7kZAA8B3Td2ER4VRryWqePmii6d
	2YKU/gI0nv4bhAQFZHqNa9dd+2I3QULUndQNGMzhO8DKN9WW1UvxPf/x3ztccOPgjY0sgTv5/SyZG
	a4OXVG3SMdgzkVf7NdYGDctV92qO3L4xo98LR62bvoYeCRebcJttqDkIGGKtUGcWXiQoqc3DdJnw/
	6+uBLNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYSx-0000000DFWN-16hR;
	Wed, 05 Nov 2025 08:02:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYSv-0000000DFVz-0UNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:02:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33bba55200bso885621a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 00:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762329720; x=1762934520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJP6HXgSPsdlCCU5AgGKGF0EX+f2P6yNyzg4ivXkKMk=;
        b=ee1tBvSeBRiv3V5m9LgWCGVa4mPQyJeB8mfmA0z8RF5dBVChdDV0RefhloANd64nA/
         AsZ0/nXtqmoxN+vjvIfDgfV1e5eP0kVQB47Ivd6kRPoyNRkmaRvuVyh90qXem3pKtka0
         FCgn9T1H9bpsF7kJEIgZKTBL8ar1sjsfJbUnb+ZWIKJmNuYRaTfkiHewElRVaxIMDzlt
         gxzaTqlX9ahFuv0N7HGt9AxzRvfG/e4f8RLOCKD8EV4KRvXiZNW0SQUm2bXbbwZHWT6J
         cFuPDbe1JmBTcBuouWneJOS5TMi53juRZW+JRMp4HUXANf8rgvBbZPWoZzgzD8augC4b
         f19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762329720; x=1762934520;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject:cc
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJP6HXgSPsdlCCU5AgGKGF0EX+f2P6yNyzg4ivXkKMk=;
        b=n6MDLNFNzRNxtc2oY3zlMHe2XgADxNwhdSuixCvTuJntxgt29eGq4wAZ4zjgJFtFuh
         uUNtT4UycCHOuX7GedR3ASNS6N+vmQq+g5/NeRCUx9qpiAp22f0niuDt/OV9le3Gb2m2
         wpCgxTy9jAUzeDDuGeRW+sFYwzcJbczoub5Iiqn7Ko1GJus1TxvDQX5O7fw7LpIA81i4
         66Fql/0VHlKxLWXqQtdphz/QWFEF7h1ycIo0B7kEGRTHQKlxH0zG0i+I6ZR/Wf3UZrp6
         fX6nDBO8Fy1jQcD8+pmNKKiX1FsNXonjiksoqn2X2Imlv6o4uKzzoyMzVfeggo+Ga0CZ
         aeXA==
X-Forwarded-Encrypted: i=1; AJvYcCWRGQLoYRRmWfYeaaOm+ES+McHy+Aj4oLEXoCzEgsH62kMpIyveuIOu7JP4x++vVuKJa1kJdajHgjDyjjcNuRlZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxKsmhKo10rY1lS6AeEVr5YgESDKkgq6YlY28eQp4hfF/HYcGer
	ny0HeHrUZqjB6W0u1Tf4gBIZebK8qP3o39IuZbloQTR62PLP6JfBNKit
X-Gm-Gg: ASbGncvquR6MPQZUaFz0TIPVUiIqCjfhfzYm8o95ypOBmdPXCyDtQDj6zBPnBaHG/NM
	ztHhi/YkhMPDQ/jNJIxyG5Ia3MMpVoWU3zoaQ5S6KLX5lknO2RQsE0htgAI/XkkH3l6TKrzwLii
	Zk10iHnYUBQ7z7Fnzej9pT8OQ3bkyUh9qZ2TbruyyhhoGaJmgQOtpiTQavK+Q7+UozoY5PZXMT5
	6NSezbJw+cgmvU7K8Siy4q52akI7eSr9YWbMN3Zv04beCNUqejt08cBJ8NmPz2zo5nP4DtYcH+H
	PaY/UHIqJWvDP8mpgBRDAypkYhe4f/RskhqPwQ/rvB3sHtixtBLJpqau06DQjRJEis4zbmXcaFj
	57jAeF8WO+Ek5Z2JGszpAcOU5HYzECqf0kz0UPEao4/pIfmicn74T9Hbv3TyoWw5gJ4uZXfTIGw
	+nJQlzsswFqz8m9iTdVQJf+1w=
X-Google-Smtp-Source: AGHT+IHViKrQ6nJV1mwdP9YZJrXD0RSrWxyTRTHX7ey/hYE+Gz2/5UGRoM1qypWOy18a+0ipyNXBBQ==
X-Received: by 2002:a17:90b:4acf:b0:341:88bc:7a54 with SMTP id 98e67ed59e1d1-341a700d604mr1335609a91.7.1762329720068;
        Wed, 05 Nov 2025 00:02:00 -0800 (PST)
Received: from [192.168.0.100] ([163.125.181.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696dfe9sm1992137a91.10.2025.11.05.00.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:01:59 -0800 (PST)
Message-ID: <1cc1bd32-2181-44a7-a475-c4417c95f716@gmail.com>
Date: Wed, 5 Nov 2025 16:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: yangyccccc@gmail.com, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] perf: arm_pmu: Fix build on arm if
 !CONFIG_GENERIC_ARCH_TOPOLOGY
To: Will Deacon <will@kernel.org>
References: <20251104134004.6964-1-yangyccccc@gmail.com>
 <aQoqv75M85w9lk8f@willie-the-truck>
From: Yicong Yang <yangyccccc@gmail.com>
In-Reply-To: <aQoqv75M85w9lk8f@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_000201_162863_CC9627E4 
X-CRM114-Status: GOOD (  17.96  )
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

On 2025/11/5 00:33, Will Deacon wrote:
> On Tue, Nov 04, 2025 at 09:40:04PM +0800, Yicong Yang wrote:
>> The SMT implementation is retrieved by topology_core_has_smt() which
>> depends on CONFIG_GENERIC_ARCH_TOPOLOGY. The config is optional on
>> arm platforms so protect the usage with CONFIG_GENERIC_ARCH_TOPOLOGY.
>>
>> Fixes: c3d78c34ad00 ("perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202511041757.vuCGOmFc-lkp@intel.com/
>> Signed-off-by: Yicong Yang <yangyccccc@gmail.com>
>> ---
>>  drivers/perf/arm_pmu.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
>> index ae437791b5f8..f38bdeb906f0 100644
>> --- a/drivers/perf/arm_pmu.c
>> +++ b/drivers/perf/arm_pmu.c
>> @@ -925,11 +925,13 @@ int armpmu_register(struct arm_pmu *pmu)
>>  	if (ret)
>>  		return ret;
>>  
>> +#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>>  	/*
>>  	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>>  	 * detect the SMT implementation.
>>  	 */
>>  	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>> +#endif
>>  
>>  	if (!pmu->set_event_filter)
>>  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
>> -- 
>> 2.50.1 (Apple Git-155)
> Wouldn't we be better off adding something like:
>
> #else
> static inline bool topology_core_has_smt(int cpu) { return false; }
> #endif /* CONFIG_GENERIC_ARCH_TOPOLOGY */
>
> to the bottom of include/linux/arch_topology.h?

I was thinking so but found there's no !CONFIG_GENERIC_ARCH_TOPOLOGY
stubs for other functions. So I checked how this is handled in other places and follow in
the same way [1]

but a stub will be neater here. will respin a version using the stub.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/kernel/smp.c?h=v6.18-rc4#n261

thanks.







