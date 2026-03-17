Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81C8FF6E87
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 21:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIRmM9ecFZK8P3pt/TYPRPaBVPH6CQ+wpwKO9UI5a3s=; b=j5Biqi5NNyMZKXL8ID5kYhuSNV
	NZB+gEWm4CAnbzsF0DBgG/J4rWLG7RoUt8+rldPagKXPkJLN2gcv+3hKrtbFuPY7MAV+KNBGUONRy
	YVeqe28aLtR8Dw9ldz8tHzzUTRGyp4MfN/crg6XAz8h+cBEEkMGffLiUhJTwPnwIGFj+p6ejYlaDD
	dxyIn/7RMd845CRxF7/O/438Cz3kF17euGVu73ODR7gJQSNjnCekuPd1d++F3AaDUgj1AlMiCSJbD
	PLHLHYxiXHxChw+1qCDwUcQhKaVHU1Z0hnH8DY0feqwJV32dcSZdC5pjx0nS+0TQm9cbBQtsd56hC
	mSBWuXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2c7R-00000007GTr-31fY;
	Tue, 17 Mar 2026 21:38:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2c7E-00000007GT7-2HGe;
	Tue, 17 Mar 2026 21:38:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 419131477;
	Tue, 17 Mar 2026 14:38:07 -0700 (PDT)
Received: from [172.27.42.179] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E05563F73B;
	Tue, 17 Mar 2026 14:38:11 -0700 (PDT)
Message-ID: <e4b0aefa-7108-47b4-ad5d-d62d385b8f33@arm.com>
Date: Tue, 17 Mar 2026 16:38:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] ACPI: Refactor get_acpi_id_for_cpu() to
 acpi_get_cpu_uid() on non-x86
To: Chengwen Feng <fengchengwen@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: punit.agrawal@oss.qualcomm.com, guohanjun@huawei.com,
 suzuki.poulose@arm.com, ryan.roberts@arm.com, chenl311@chinatelecom.cn,
 masahiroy@kernel.org, wangyuquan1236@phytium.com.cn,
 anshuman.khandual@arm.com, heinrich.schuchardt@canonical.com,
 Eric.VanTassell@amd.com, jonathan.cameron@huawei.com,
 wangzhou1@hisilicon.com, wanghuiqiang@huawei.com, liuyonglong@huawei.com,
 linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-perf-users@vger.kernel.org, stable@vger.kernel.org
References: <20260313022144.40942-1-fengchengwen@huawei.com>
 <20260313022144.40942-2-fengchengwen@huawei.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260313022144.40942-2-fengchengwen@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_143816_677197_5018F3DF 
X-CRM114-Status: GOOD (  26.13  )
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

Hi,

Lets try this again, since the last one looks like it got caught in the 
moderation system and wasn't quite right anyway.

On 3/12/26 9:21 PM, Chengwen Feng wrote:
> Unify CPU ACPI ID retrieval interface across architectures by
> refactoring get_acpi_id_for_cpu() to acpi_get_cpu_uid() on
> arm64/riscv/loongarch:
> - Add input parameter validation
> - Adjust interface to int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
>    (old: u32 get_acpi_id_for_cpu(unsigned int cpu), no input check)
> 
> This refactoring (not a pure rename) enhances interface robustness while
> preparing for consistent ACPI Processor UID retrieval across all
> ACPI-enabled platforms. Valid inputs retain original behavior.
> 
> Note: Move the ARM64-specific get_cpu_for_acpi_id() implementation to
>        arch/arm64/kernel/acpi_numa.c to fix compilation errors from
>        circular header dependencies introduced by the rename.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   arch/arm64/include/asm/acpi.h      | 16 +---------
>   arch/arm64/kernel/acpi.c           | 16 ++++++++++
>   arch/arm64/kernel/acpi_numa.c      | 14 +++++++++
>   arch/loongarch/include/asm/acpi.h  |  5 ---
>   arch/loongarch/kernel/acpi.c       |  9 ++++++
>   arch/riscv/include/asm/acpi.h      |  4 ---
>   arch/riscv/kernel/acpi.c           | 16 ++++++++++
>   arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>   drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>   drivers/acpi/riscv/rhct.c          |  7 ++++-
>   drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>   include/linux/acpi.h               | 13 ++++++++
>   12 files changed, 122 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
> index c07a58b96329..106a08556cbf 100644
> --- a/arch/arm64/include/asm/acpi.h
> +++ b/arch/arm64/include/asm/acpi.h
> @@ -114,22 +114,8 @@ static inline bool acpi_has_cpu_in_madt(void)
>   }
>   
>   struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu);
> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
> -{
> -	return	acpi_cpu_get_madt_gicc(cpu)->uid;
> -}
> -
> -static inline int get_cpu_for_acpi_id(u32 uid)
> -{
> -	int cpu;
> -
> -	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> -		if (acpi_cpu_get_madt_gicc(cpu) &&
> -		    uid == get_acpi_id_for_cpu(cpu))
> -			return cpu;
>   
> -	return -EINVAL;
> -}
> +int get_cpu_for_acpi_id(u32 uid);
>   
>   static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>   void __init acpi_init_cpus(void);
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index af90128cfed5..f3866606fc46 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -458,3 +458,19 @@ int acpi_unmap_cpu(int cpu)
>   }
>   EXPORT_SYMBOL(acpi_unmap_cpu);
>   #endif /* CONFIG_ACPI_HOTPLUG_CPU */
> +
> +int acpi_get_cpu_uid(unsigned int cpu, u32 *uid)
> +{
> +	struct acpi_madt_generic_interrupt *gicc;
> +
> +	if (cpu >= nr_cpu_ids)
> +		return -EINVAL;
If this actually happens, its probably useful to know it with a 
pr_warn/pr_warn_once.> +
> +	gicc = acpi_cpu_get_madt_gicc(cpu);
> +	if (!gicc)
I think this check is redundant because we can't have logical cpu's that 
aren't in the cpu_possible() list, which on arm64 doesn't AFAIK have 
holes. In the past this might have made sense if we weren't maintaining 
a copy of the gicc structure from the MADT for each core.> +		return 
-ENODEV;
> +
> +	*uid = gicc->uid;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_cpu_uid);
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 2465f291c7e1..41d1e46a4338 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -34,6 +34,20 @@ int __init acpi_numa_get_nid(unsigned int cpu)
>   	return acpi_early_node_map[cpu];
>   }
>   
> +int get_cpu_for_acpi_id(u32 uid)
> +{
> +	u32 cpu_uid;
> +	int ret;
> +
> +	for (int cpu = 0; cpu < nr_cpu_ids; cpu++) {
> +		ret = acpi_get_cpu_uid(cpu, &cpu_uid);
This might have been a simplification, but since we are basically doing 
a for_each_possible_cpu(cpu) and every possible cpu will have a GICC 
entry before it becomes 'possible' there will be a UID, so all the error 
checking AFAIK, is impossible here.> +		if (ret == 0 && uid == cpu_uid)
> +			return cpu;
> +	}
> +
> +	return -EINVAL;
> +}
> +
I also moved this below acpi_get_cpu_uid() in acpi.c and I don't see the 
a forward error issue you mentioned. It seems to me that they should be 
kept close to each other since they are basically inverses of each other.

