Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916C3FDEE5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 01:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5af1cLbAET7WHKyzk+VJzdretsylt3WV+tmRO/MK9A=; b=ffbMG63IYt0H2y4NPoXXoBRGFJ
	obsyxS+jBsE/V+GTdkqeIlBjRqfeMhRQ7gp/WncEQFABmtktlXtO/Gr12hnP/pEeqpxhCf1VF2kNo
	LQe8XWnOipD9L447GvS21Oxl3MKnO59nrqaPd/Zw6YNm/qGb+z2T75DOXbbscYpTGcvVY1OMLM0xv
	IO0JN9bo++9FU46jZqzNxJVsQh7JF4fgxpIB6jV/EMIA90oqmKFYI3x2WXDVWl2VdkjgKTNt+zCh1
	l7s1NPEcifyCJGh4c2axus3Py7MkBPHvS2rBRn1qEU4hPigLFAnJcPzzJg5G3qIe2wbpU0WbznEvn
	uw9eCeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG5mY-0000000CUFd-1eJK;
	Fri, 24 Apr 2026 01:56:38 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG5mU-0000000CUEx-24Ym
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 01:56:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v5af1cLbAET7WHKyzk+VJzdretsylt3WV+tmRO/MK9A=;
	b=E5rd3yMHG9NWM/SZDvosypGpHRN3+DTF4yNkxZshazBHsf3Rdeb7FmiTkVUG0H3J0fMLUFVKk
	cFEOHJqQKYm3K+yXeU4hdAOFfdzMhk9c3lTWChQUnl0PZsK352pCF9Djhdb7JG9wPt2qRhwqu1p
	CTFytgMvfw+wVu8wik0xQKc=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4g1wrS0gPhz1cyQp;
	Fri, 24 Apr 2026 09:50:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F28A840539;
	Fri, 24 Apr 2026 09:56:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Apr 2026 09:56:22 +0800
Message-ID: <c6fe5e31-c397-4cf1-a422-f8d1a28fe20b@huawei.com>
Date: Fri, 24 Apr 2026 09:56:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Thomas Gleixner <tglx@kernel.org>, <peterz@infradead.org>,
	<sudeep.holla@kernel.org>, <yangyicong@hisilicon.com>,
	<dietmar.eggemann@arm.com>, <Jonathan.Cameron@huawei.com>,
	<linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com> <87ldee0z1w.ffs@tglx>
 <78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com> <aep85G05D3TM9uj2@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aep85G05D3TM9uj2@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_185635_219239_8998560B 
X-CRM114-Status: GOOD (  26.10  )
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



On 4/24/2026 4:11 AM, Catalin Marinas wrote:
> On Thu, Apr 23, 2026 at 08:32:34PM +0800, Jinjie Ruan wrote:
>> On 4/23/2026 6:08 PM, Thomas Gleixner wrote:
>>> On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:
>>>> Another option would have been to avoid marking such CPUs present but I
>>>> think this will break other things. Yet another option is to register
>>>> all CPU devices even if they never come up (like maxcpus greater than
>>>> actual CPUs).
>>>>
>>>> Opinions? It might be an arm64+ACPI-only thing.
>>>
>>> I think so. The proper thing to do is to apply sane limits:
>>>
>>>  1) The possible CPUs enumerated by firmware N_POSSIBLE_FW
>>>
>>>  2) The maxcpus limit on the command line N_MAXCPUS_CL
>>>
>>> So the actual possible CPUs evaluates to:
>>>
>>>    num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);
>>>
>>> The evaluation of the firmware should not mark CPUs present which are
>>> actually not. ACPI gives you that information. See:
>>>
>>>          5.2.12.14 GIC CPU Interface (GICC) Structure
>>>
>>> in the ACPI spec. That has two related bits:
>>>
>>> Enabled:
>>>
>>>    If this bit is set, the processor is ready for use. If this bit is
>>>    clear and the Online Capable bit is set, the system supports enabling
>>>    this processor during OS runtime. If this bit is clear and the Online
>>>    Capable bit is also clear, this processor is un- usable, and the
>>>    operating system support will not attempt to use it.
>>>
>>> Online Capable:
>>>
>>>    The information conveyed by this bit depends on the value of the
>>>    Enabled bit. If the Enabled bit is set, this bit is reserved and must
>>>    be zero. Otherwise, if this bit is set, the system supports enabling
>>>    this processor later during OS runtime
>>>
>>> So the combination of those gives you the right answer:
>>>
>>>    Enabled	Online
>>>    	        Capable
>>>    0            0        Not present, not possible
>>>    0            1        Not present, but possible to "hotplug" layter
>>>    1            0        Present
>>>    1            1        Invalid
>>
>> On x86, it seems that all CPUs with the ACPI_MADT_ENABLED bit set will
>> be marked as present.
>>
>> acpi_parse_x2apic()
>>   -> enabled = processor->lapic_flags & ACPI_MADT_ENABLED
>>   -> topology_register_apic(enabled)
>>      -> topo_register_apic(enabled)
>>         -> set_cpu_present(cpu, true)
> 
> Yes but arm64 marks all CPUs present even if !ACPI_MADT_ENABLED as we
> don't have the notion of hardware CPU hotplug.
> 
> I need to dig some more into the original vCPU hotplug support and why
> we ended up with all CPUs marked as present even if not calling
> register_cpu():
> 
> https://lore.kernel.org/linux-arm-kernel/20240529133446.28446-1-Jonathan.Cameron@huawei.com/
> 
> What's the MADT GICC provided by qemu with "-smp cpus=4,maxcpus=8"? If
> it says Enabled for the first 4 and Online Capable for the rest, maybe
> we can try something like below:

Yes, you are absolutely right,Enabled for the first 4(with GIC Flags:
0x1, bit0 set) and Online Capable for the rest(with GIC Flags: 0x8, bit3
set). The ACPI MADT disassembly result is as follows:

Link:
https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure

# cat /sys/firmware/acpi/tables/APIC > madt.bin
# iasl -d madt.bin


[048h 0072   4]         CPU Interface Number : 00000000
[030h 0048   4]        Local GIC Hardware ID : 00000000
...
[04Ch 0076   4]                Processor UID : 00000000
[050h 0080   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
...


[098h 0152   4]         CPU Interface Number : 00000001
[09Ch 0156   4]                Processor UID : 00000001
[0A0h 0160   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
...


[0E8h 0232   4]         CPU Interface Number : 00000002
[0ECh 0236   4]                Processor UID : 00000002
[0F0h 0240   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
...


[138h 0312   4]         CPU Interface Number : 00000003
[13Ch 0316   4]                Processor UID : 00000003
[140h 0320   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
...

[188h 0392   4]         CPU Interface Number : 00000004
[18Ch 0396   4]                Processor UID : 00000004
[190h 0400   4]        Flags (decoded below) : 00000008
                           Processor Enabled : 0
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0

...
[1D8h 0472   4]         CPU Interface Number : 00000005
[1DCh 0476   4]                Processor UID : 00000005
[1E0h 0480   4]        Flags (decoded below) : 00000008
                           Processor Enabled : 0
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0

...
[228h 0552   4]         CPU Interface Number : 00000006
[22Ch 0556   4]                Processor UID : 00000006
[230h 0560   4]        Flags (decoded below) : 00000008
                           Processor Enabled : 0
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0

...
[278h 0632   4]         CPU Interface Number : 00000007
[27Ch 0636   4]                Processor UID : 00000007
[280h 0640   4]        Flags (decoded below) : 00000008
                           Processor Enabled : 0
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
...

> 
> ----------------------8<-----------------
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index 5891f92c2035..681aa2bbc399 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -448,12 +448,14 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
>  		return *pcpu;
>  	}
>  
> +	set_cpu_present(*pcpu, true);
>  	return 0;
>  }
>  EXPORT_SYMBOL(acpi_map_cpu);
>  
>  int acpi_unmap_cpu(int cpu)
>  {
> +	set_cpu_present(cpu, false);
>  	return 0;
>  }
>  EXPORT_SYMBOL(acpi_unmap_cpu);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 1aa324104afb..6421027669fc 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -566,6 +566,11 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
>  }
>  EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_gicc);
>  
> +static bool acpi_cpu_is_present(int cpu)
> +{
> +	return acpi_cpu_get_madt_gicc(cpu)->flags & ACPI_MADT_ENABLED;
> +}
> +
>  /*
>   * acpi_map_gic_cpu_interface - parse processor MADT entry
>   *
> @@ -670,6 +675,11 @@ static void __init acpi_parse_and_init_cpus(void)
>  		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
>  }
>  #else
> +static bool acpi_cpu_is_present(int cpu)
> +{
> +	return false;
> +}
> +
>  #define acpi_parse_and_init_cpus(...)	do { } while (0)
>  #endif
>  
> @@ -808,7 +818,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  		if (err)
>  			continue;
>  
> -		set_cpu_present(cpu, true);
> +		if (acpi_disabled || acpi_cpu_is_present(cpu))
> +			set_cpu_present(cpu, true);
>  		numa_store_cpu_info(cpu);
>  	}
>  }
> 


