Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF75D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1j4qiRIjaYkaIgl8KBQd391HFndUa0vrlTQ5lUlIj4=; b=TJ0RlHH2D78Zujo6KMMXosWqmF
	g21Jkh1N8GTfJE+NM7aAIBWn+aIYelr7B3Qpw/X7VgHaXoPAzTUNDXl4BNgHybWvmwGoy0bmLmWzZ
	/PUItBeFp5HdzRzAdQ7XbYnPse2GxiCepBrGoDMDF6WTfpXfUzsDjOl7Fwj8qCm2ztMVtzljXQI/3
	v2lFW5RWbKiioaaN6cVcIT4uRxxLboOpwQr26xOUnwS4hEYc4UZX0BlKZVwCyEh5gYsn7xFva6t+A
	GD8QxQuYvo8ViPJvmWq4jTb+EsF8dTGi0vsFJWwJyjfAYWJYbr4Gr4qeOZ90QA4to2g2Xvp1nVEVN
	FMlhvAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzKd-0000000ERIe-0ekn;
	Tue, 09 Dec 2025 15:08:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzKb-0000000ERI5-2mBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98589175D;
	Tue,  9 Dec 2025 07:08:40 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CB683F762;
	Tue,  9 Dec 2025 07:08:44 -0800 (PST)
Message-ID: <47b3b953-1ab9-4b85-9cb4-e1ad8eb4a0f6@arm.com>
Date: Tue, 9 Dec 2025 15:08:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/38] arm64: mpam: Context switch the MPAM registers
To: Fenghua Yu <fenghuay@nvidia.com>, James Morse <james.morse@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Gavin Shan <gshan@redhat.com>, rohit.mathew@arm.com,
 reinette.chatre@intel.com, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-2-james.morse@arm.com>
 <a3305659-929d-45f6-823d-a886f197d652@nvidia.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <a3305659-929d-45f6-823d-a886f197d652@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_070849_787918_97654184 
X-CRM114-Status: GOOD (  24.89  )
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

Hi Fenghua,

On 12/5/25 23:53, Fenghua Yu wrote:
> Hi, James,
> 
> On 12/5/25 13:58, James Morse wrote:
[...]
>>
>> Resctrl allows a per-cpu 'default' value to be set, this overrides the
>> values when scheduling a task in the default control-group, which has
>> PARTID 0. The way 'code data prioritisation' gets emulated means the
>> register value for the default group needs to be a variable.
>>
[...]
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/
>> mpam.h
>> new file mode 100644
>> index 000000000000..86a55176f884
>> --- /dev/null
>> +++ b/arch/arm64/include/asm/mpam.h
[...]
>> +/*
>> + * The value of the MPAM0_EL1 sysreg when a task is in resctrl's
>> default group.
>> + * This is used by the context switch code to use the resctrl CPU
>> property
>> + * instead. The value is modified when CDP is enabled/disabled by
>> mounting
>> + * the resctrl filesystem.
>> + */
>> +extern u64 arm64_mpam_global_default;
>> +
>> +/*
>> + * The resctrl filesystem writes to the partid/pmg values for threads
>> and CPUs,
>> + * which may race with reads in __mpam_sched_in(). Ensure only one of
>> the old
>> + * or new values are used. Particular care should be taken with the
>> pmg field
>> + * as __mpam_sched_in() may read a partid and pmg that don't match,
>> causing
>> + * this value to be stored with cache allocations, despite being
>> considered
>> + * 'free' by resctrl.
>> + *
>> + * A value in struct thread_info is used instead of struct
>> task_struct as the
>> + * cpu's u64 register format is used, but struct task_struct has two
>> u32'.
>> + */
>> +static inline u64 mpam_get_regval(struct task_struct *tsk)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
>> +    return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
>> +#else
>> +    return 0;
>> +#endif
>> +}
>> +
>> +static inline void mpam_thread_switch(struct task_struct *tsk)
>> +{
>> +    u64 oldregval;
>> +    int cpu = smp_processor_id();
>> +    u64 regval = mpam_get_regval(tsk);
>> +
>> +    if (!IS_ENABLED(CONFIG_ARM64_MPAM) ||
>> +        !static_branch_likely(&mpam_enabled))
>> +        return;
>> +
>> +    if (regval == READ_ONCE(arm64_mpam_global_default))
> Why is this check needed? We need to read arm64_mpam_default in any
> case, right?

If a task is in the default resctrl group then the per-cpu resctrl
configuration determines the mpam configuration. The way this is dealt
with here is that for a task in the default group mpam_partid_pmg is set
to arm64_mpam_global_default. When mpam_partid_pmg is
arm64_mpam_global_default we know the task is in the default group,
otherwise it would have a different partid, and so we consider the
per-cpu configuration, arm64_mpam_default. When the task is not in the
default resctrl group then we can just consider the per-task configuration.

As mentioned in the commit message, this is complicated by code data
prioritisation (cdp) and the value of arm64_mpam_global_default, depends
on whether this is enabled or not. See resctrl_arch_set_cdp_enabled()
added in a later patch. I'm not sure of a way to make this clearer in
the code while keeping the arch and drivers/resctrl patches separate.

> +        regval = READ_ONCE(per_cpu(arm64_mpam_default,
> cpu));
>> +
>> +    oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>> +    if (oldregval == regval)
>> +        return;
>> +
>> +    write_sysreg_s(regval, SYS_MPAM1_EL1);
>> +    isb();
>> +
>> +    /* Synchronising the EL0 write is left until the ERET to EL0 */
>> +    write_sysreg_s(regval, SYS_MPAM0_EL1);
>> +
>> +    WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
>> +}
>> +#endif /* __ASM__MPAM_H */
> 
> [SNIP]
> Thanks.
> 
> -Fenghua
> 
Thanks,

Ben


