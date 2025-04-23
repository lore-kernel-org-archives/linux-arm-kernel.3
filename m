Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975EDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 00:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZGPFf3wMnSbU09hVmCJjsXY+G6x3DIKE+UVsiEcfVo=; b=XHiuhdpcxgcmoYgn0HHYQhztdp
	9Sqe23wDiqAXniq7++27hnuxJNPTMoM4/BjfHTxDowZqw+iX9eMFKY5JHki1pxPH/h5YqxDB1F+5G
	L7T+BCJJezjvrUYBCHRaxVm/oufTAIIZo6K3sSeS6uLQ6P9CetnXYORzCcTd1m41E2XF+49aEwsCc
	1cE4r6VeQXbGqwCLMS++be0nC2OHNMRjbzKPnSJLgsT9B9hOFE2RfRQKzTUBdJohI7wH2V3CtEfOZ
	k5Bm0EcgTr1IpXN/jOjArNc42fDUvvz73hS9iBIpaXwmmlEE+3HgTFrGZ+sDUnPn0tE7M1uwv8L1g
	iUsUfI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Nbs-00000008rLk-1m5j;
	Wed, 23 Apr 2025 00:05:04 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NZy-00000008r47-1poz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 00:03:08 +0000
Message-ID: <42e1d440-24a0-4bdb-b21f-fedf8b7be4fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745366573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZGPFf3wMnSbU09hVmCJjsXY+G6x3DIKE+UVsiEcfVo=;
	b=VhzsM7SfNxZBX8mRw1/QEzjMwF2pH593aPmDUeBsHCgaieFXrT8VRFFfIFY3prO034W1jt
	+bTJq+wjNisRfusKlmRzBCJP9HI2Txq8P/OmG2NCMR2VbCR5tIP+SSMbok6Kn2a6giMEZY
	1zMY3nOiwGnbm9AccKkxUE1U9Y6IROA=
Date: Tue, 22 Apr 2025 17:02:44 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v5 11/21] RISC-V: perf: Restructure the SBI PMU code
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
 <20250327-counter_delegation-v5-11-1ee538468d1b@rivosinc.com>
 <20250404134937.GA29394@willie-the-truck>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250404134937.GA29394@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_170306_609888_76A4D8F4 
X-CRM114-Status: GOOD (  15.10  )
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

On 4/4/25 6:49 AM, Will Deacon wrote:
> On Thu, Mar 27, 2025 at 12:35:52PM -0700, Atish Patra wrote:
>> With Ssccfg/Smcdeleg, we no longer need SBI PMU extension to program/
>> access hpmcounter/events. However, we do need it for firmware counters.
>> Rename the driver and its related code to represent generic name
>> that will handle both sbi and ISA mechanism for hpmcounter related
>> operations. Take this opportunity to update the Kconfig names to
>> match the new driver name closely.
>>
>> No functional change intended.
>>
>> Reviewed-by: Clément Léger <cleger@rivosinc.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   MAINTAINERS                                       |   4 +-
>>   arch/riscv/include/asm/kvm_vcpu_pmu.h             |   4 +-
>>   arch/riscv/include/asm/kvm_vcpu_sbi.h             |   2 +-
>>   arch/riscv/kvm/Makefile                           |   4 +-
>>   arch/riscv/kvm/vcpu_sbi.c                         |   2 +-
>>   drivers/perf/Kconfig                              |  16 +-
>>   drivers/perf/Makefile                             |   4 +-
>>   drivers/perf/{riscv_pmu.c => riscv_pmu_common.c}  |   0
>>   drivers/perf/{riscv_pmu_sbi.c => riscv_pmu_dev.c} | 214 +++++++++++++---------
> 
> I'm still against this renaming churn. It sucks for backporting and
> you're also changing the name of the driver, which could be used by
> scripts in userspace (e.g. module listings, udev rules, cmdline options)
> 


Ok. I will revert the file and driver name change. I hope config 
renaming and code refactoring to separate counter delegation (hw method) 
vs SBI calls (firmware assisted method) are okay ?


> Will
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


