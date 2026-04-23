Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97FCFDEE47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBsJXoe7Jvn0fm1H+vn6a8fj9iIxaVc9482YDLJ7vzc=; b=BJ0LgXe2ud2AabCNsb4sWsKqyp
	A5pcD8WAuMMlYW5U0lzXHSggqiTYsYJ2TyyidhnybqFW5vMMsj7DSO6DCl3PFHAg5B8tN6WXRJMpS
	n0KIRvKYfxY8hlhM+2jfypUlgsf9vfZq8i2eKSlkyMLb9+XPNtFe4gEQsBcAYy30CLlkyk3QZRwnU
	sDrg/sfWW2KA8RZfGX+AtKzsD4O2vFJyBt2bLn+czMp3u00tRKrd9xlvr4SEB7gBJbeU2TNF/aCDC
	uX/WUDF+4vtBhNPW6Ap1hEhNLJDcabfy4SC0OG8+Rq2GrUEpD17F5sD+v4PiDemKZTWXX67njFljc
	cabAVmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG0OU-0000000CH99-44MQ;
	Thu, 23 Apr 2026 20:11:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG0OR-0000000CH8p-3qvf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 20:11:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB6F31BC0;
	Thu, 23 Apr 2026 13:11:14 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 015F83F641;
	Thu, 23 Apr 2026 13:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776975080; bh=PjY9Tzmxrr+2BgE+O/ko5UVXdPmLbtgzi9wqdcok6u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l64vNcxScnpE4yIQKse2JJiEh8xAEijsFJ8hsy8VJ1qiCtpPv1uQZQQBZqXjpbJw/
	 2L0aV0UubqZ6h9KkX2Ldf7ChbPMcN1ApUFwj4K9aKrkazoXAIZx57tFz0Z9ASZDOSS
	 cWa2u0jDck743dWzKu1Zw9j2uytA5Z4bhDFswAvE=
Date: Thu, 23 Apr 2026 21:11:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Thomas Gleixner <tglx@kernel.org>, peterz@infradead.org,
	sudeep.holla@kernel.org, yangyicong@hisilicon.com,
	dietmar.eggemann@arm.com, Jonathan.Cameron@huawei.com,
	linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <aep85G05D3TM9uj2@arm.com>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com>
 <87ldee0z1w.ffs@tglx>
 <78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_131124_122169_AB35E5F9 
X-CRM114-Status: GOOD (  30.81  )
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

On Thu, Apr 23, 2026 at 08:32:34PM +0800, Jinjie Ruan wrote:
> On 4/23/2026 6:08 PM, Thomas Gleixner wrote:
> > On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:
> >> Another option would have been to avoid marking such CPUs present but I
> >> think this will break other things. Yet another option is to register
> >> all CPU devices even if they never come up (like maxcpus greater than
> >> actual CPUs).
> >>
> >> Opinions? It might be an arm64+ACPI-only thing.
> > 
> > I think so. The proper thing to do is to apply sane limits:
> > 
> >  1) The possible CPUs enumerated by firmware N_POSSIBLE_FW
> > 
> >  2) The maxcpus limit on the command line N_MAXCPUS_CL
> > 
> > So the actual possible CPUs evaluates to:
> > 
> >    num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);
> > 
> > The evaluation of the firmware should not mark CPUs present which are
> > actually not. ACPI gives you that information. See:
> > 
> >          5.2.12.14 GIC CPU Interface (GICC) Structure
> > 
> > in the ACPI spec. That has two related bits:
> > 
> > Enabled:
> > 
> >    If this bit is set, the processor is ready for use. If this bit is
> >    clear and the Online Capable bit is set, the system supports enabling
> >    this processor during OS runtime. If this bit is clear and the Online
> >    Capable bit is also clear, this processor is un- usable, and the
> >    operating system support will not attempt to use it.
> > 
> > Online Capable:
> > 
> >    The information conveyed by this bit depends on the value of the
> >    Enabled bit. If the Enabled bit is set, this bit is reserved and must
> >    be zero. Otherwise, if this bit is set, the system supports enabling
> >    this processor later during OS runtime
> > 
> > So the combination of those gives you the right answer:
> > 
> >    Enabled	Online
> >    	        Capable
> >    0            0        Not present, not possible
> >    0            1        Not present, but possible to "hotplug" layter
> >    1            0        Present
> >    1            1        Invalid
> 
> On x86, it seems that all CPUs with the ACPI_MADT_ENABLED bit set will
> be marked as present.
> 
> acpi_parse_x2apic()
>   -> enabled = processor->lapic_flags & ACPI_MADT_ENABLED
>   -> topology_register_apic(enabled)
>      -> topo_register_apic(enabled)
>         -> set_cpu_present(cpu, true)

Yes but arm64 marks all CPUs present even if !ACPI_MADT_ENABLED as we
don't have the notion of hardware CPU hotplug.

I need to dig some more into the original vCPU hotplug support and why
we ended up with all CPUs marked as present even if not calling
register_cpu():

https://lore.kernel.org/linux-arm-kernel/20240529133446.28446-1-Jonathan.Cameron@huawei.com/

What's the MADT GICC provided by qemu with "-smp cpus=4,maxcpus=8"? If
it says Enabled for the first 4 and Online Capable for the rest, maybe
we can try something like below:

----------------------8<-----------------
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 5891f92c2035..681aa2bbc399 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -448,12 +448,14 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
 		return *pcpu;
 	}
 
+	set_cpu_present(*pcpu, true);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_map_cpu);
 
 int acpi_unmap_cpu(int cpu)
 {
+	set_cpu_present(cpu, false);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..6421027669fc 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -566,6 +566,11 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
 }
 EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_gicc);
 
+static bool acpi_cpu_is_present(int cpu)
+{
+	return acpi_cpu_get_madt_gicc(cpu)->flags & ACPI_MADT_ENABLED;
+}
+
 /*
  * acpi_map_gic_cpu_interface - parse processor MADT entry
  *
@@ -670,6 +675,11 @@ static void __init acpi_parse_and_init_cpus(void)
 		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
 }
 #else
+static bool acpi_cpu_is_present(int cpu)
+{
+	return false;
+}
+
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif
 
@@ -808,7 +818,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (err)
 			continue;
 
-		set_cpu_present(cpu, true);
+		if (acpi_disabled || acpi_cpu_is_present(cpu))
+			set_cpu_present(cpu, true);
 		numa_store_cpu_info(cpu);
 	}
 }

