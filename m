Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F9CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLWIFVQRHB5qd32LJSyZVW2YD4K906tt2u8jGkqFmSQ=; b=xujAdyIjzsN85hnuvYmTERpw4Q
	8HeOuYSDjV/Fj91T4ssOxtGJiVhdbiSBnaAK7CwDRVy84i9eIewQjopGZyMw0HXke8IlBabhPWE+B
	vFtwviN8SQPPQm5wsJtg6QGVR6u0fGF3zeIyd2PxxWMBJOayGPxZYPhTScQd8yyI8HSEpcVwhkUYZ
	oOPeJK4WKiP3gYCzOX8YnDw03/TM6bW/3Khgo0G8DC0fBTls39IAx8H5X+mUrjj3j+jRLFYK9gCnO
	xBl+EC+JzcmE8D9lGi2+l6Q/LlkouV/rYoeTGGpq7KtXq82L4mAC3W6/TGqGX269WHdy86wZ+r+D4
	DC8IFDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHan-00000007GUi-1MdC;
	Wed, 24 Jun 2026 07:00:13 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHak-00000007GTf-2LJm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 07:00:12 +0000
Message-ID: <c23bec7d-9571-4917-b23b-d6b08c2cc159@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782284407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLWIFVQRHB5qd32LJSyZVW2YD4K906tt2u8jGkqFmSQ=;
	b=GCjf4y4G2cFqF2sb9SzQPMbGZ00TV7Isvch0xHsbC0kXWXnVhyj3D0TmXGNDbN8rAgLJT/
	ePYuWASdg1NFDZhlEXhW1GeGm8acBTbyUHj7wGiUqix5DPSY+wQ8QWagAXgQFz+O4qCTvm
	eNdJKVP7KC0FiRkQ+54md/XPjC6QTQ4=
Date: Wed, 24 Jun 2026 00:00:01 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 17/21] RISC-V: perf: Add Qemu virt machine events
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-17-285b72ed65a9@meta.com>
 <ajjZ5NljehUXERN1@blinky>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <ajjZ5NljehUXERN1@blinky>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_000010_932374_AD7CC829 
X-CRM114-Status: GOOD (  20.85  )
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


On 6/21/26 11:44 PM, Charlie Jenkins wrote:
> On Mon, Jun 08, 2026 at 11:01:31PM -0700, Atish Patra wrote:
>> From: Atish Patra <atishp@rivosinc.com>
>>
>> Qemu virt machine supports a very minimal set of legacy perf events.
>> Add them to the vendor table so that users can use them when
>> counter delegation is enabled.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/vendorid_list.h |  4 ++++
>>   drivers/perf/riscv_pmu_sbi.c           | 36 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
>> index 7f5030ee1fcf..603aa2b21c0b 100644
>> --- a/arch/riscv/include/asm/vendorid_list.h
>> +++ b/arch/riscv/include/asm/vendorid_list.h
>> @@ -11,4 +11,8 @@
>>   #define SIFIVE_VENDOR_ID	0x489
>>   #define THEAD_VENDOR_ID		0x5b7
>>   
>> +#define QEMU_VIRT_VENDOR_ID		0x000
>> +#define QEMU_VIRT_IMPL_ID		0x000
>> +#define QEMU_VIRT_ARCH_ID		0x000
> Palmer proposed a change to this a while ago to set the archid for qemu
> as 42 but it looks like it was never merged in qemu, but it was merged
> into the riscv spec.
>
> Here is the spec PR: https://github.com/riscv/riscv-isa-manual/pull/1213
> Here is the current spec: https://github.com/riscv/riscv-isa-manual/blob/main/marchid.md
> Here is the QEMU patch: https://lore.kernel.org/all/20240131182430.20174-1-palmer@rivosinc.com/
>
> Should we follow up with this/maybe this should be accounted for here as
> an alternate id?

Ahh yes. I remember that thread now. Thanks for digging this.
Yes. We should resurrect that patch and use that archid as an alternate ID.

> - Charlie
>
>> +
>>   #endif
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 00b84b28117a..74acac54328e 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -26,6 +26,7 @@
>>   #include <asm/sbi.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/vendor_extensions.h>
>> +#include <asm/vendorid_list.h>
>>   #include <asm/vendor_extensions/andes.h>
>>   #include <asm/hwcap.h>
>>   #include <asm/csr_ind.h>
>> @@ -453,7 +454,42 @@ struct riscv_vendor_pmu_events {
>>   	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
>>   	  .attrs_events = _attrs },
>>   
>> +/* QEMU virt PMU events */
>> +static const struct riscv_pmu_event qemu_virt_hw_event_map[PERF_COUNT_HW_MAX] = {
>> +	PERF_MAP_ALL_UNSUPPORTED,
>> +	[PERF_COUNT_HW_CPU_CYCLES]		= {0x01, 0xFFFFFFF8},
>> +	[PERF_COUNT_HW_INSTRUCTIONS]		= {0x02, 0xFFFFFFF8}
>> +};
>> +
>> +static const struct riscv_pmu_event qemu_virt_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
>> +						[PERF_COUNT_HW_CACHE_OP_MAX]
>> +						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
>> +	PERF_CACHE_MAP_ALL_UNSUPPORTED,
>> +	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10019, 0xFFFFFFF8},
>> +	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= {0x1001B, 0xFFFFFFF8},
>> +
>> +	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= {0x10021, 0xFFFFFFF8},
>> +};
>> +
>> +RVPMU_EVENT_CMASK_ATTR(cycles, cycles, 0x01, 0xFFFFFFF8);
>> +RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
>> +RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
>> +RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
>> +RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
>> +
>> +static struct attribute *qemu_virt_event_group[] = {
>> +	RVPMU_EVENT_ATTR_PTR(cycles),
>> +	RVPMU_EVENT_ATTR_PTR(instructions),
>> +	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
>> +	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
>> +	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
>> +	NULL,
>> +};
>> +
>>   static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
>> +	RISCV_VENDOR_PMU_EVENTS(QEMU_VIRT_VENDOR_ID, QEMU_VIRT_ARCH_ID, QEMU_VIRT_IMPL_ID,
>> +				qemu_virt_hw_event_map, qemu_virt_cache_event_map,
>> +				qemu_virt_event_group)
>>   };
>>   
>>   static const struct riscv_pmu_event *current_pmu_hw_event_map;
>>
>> -- 
>> 2.53.0-Meta
>>
>>

