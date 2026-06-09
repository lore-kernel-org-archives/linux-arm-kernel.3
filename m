Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59E0CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+UvVcPNIJTujEiwKCc8yWm6iXismMJtmBqi9AzvehY=; b=SCthVQD409DMXY2DPgSwRTsbUc
	1tVbiRTgb1Gq8a43WbljHsrv+OJiJehHkRHmVkk9/vlr53CZVPw53zkgcbg/6YV01nMXrsyQhiauN
	BOfrWUAfdnm2WNm1F1VVf33VSEB1FACR6UoSJwrEDoumbTaLLFXaRJGjgOGC/qb+8+ePnEv8PLQt4
	o6L1C5fzrLMrkWQESEf4pO8DkA0C8Gwo7vFhW2qNJLczadelpp6CXAD84LbNM/rIlNHWQWRCNPwGT
	Ip8o3+4EYN4NVB5KrI/VOyQ3tpSlGXr4o6GxQMjanggDgfkAHnwmolQQ2QUbqPpwsBV9qOvUBPrLN
	WPgokNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0il-00000006A1v-1fPp;
	Tue, 09 Jun 2026 17:58:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0ii-00000006A1G-22xq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:58:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318813D6A;
	Tue,  9 Jun 2026 10:58:24 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D051A3FD88;
	Tue,  9 Jun 2026 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781027909; bh=17UlZdz2nMdyTrEUz5ek0AIVuii3F4B4SW4ls8GDlUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6Z5SnihxPnVvw5f2YFVpT+cXdhZQ3cGlZ9ugH8oZDKRKqqlFvR4Ixvr32QCZgoaZ
	 By/APjldmxiBEx8OxV20fU3AnRHw7W3UvPLWXY+AATEGfZsa998kCI25uXWKj3SIn6
	 xRS1CtMTLn0G9Dd+gfe+E1qeHn7iV/STrgzcZbfs=
Date: Tue, 9 Jun 2026 18:58:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Will Deacon <will@kernel.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, punit.agrawal@oss.qualcomm.com,
	jic23@kernel.org, osama.abdelkader@gmail.com,
	chenl311@chinatelecom.cn, fengchengwen@huawei.com,
	suzuki.poulose@arm.com, maz@kernel.org, lpieralisi@kernel.org,
	timothy.hayes@arm.com, sascha.bischoff@arm.com, arnd@arndb.de,
	mrigendra.chaubey@gmail.com, pierre.gondois@arm.com,
	dietmar.eggemann@arm.com, yangyicong@hisilicon.com,
	sudeep.holla@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <aihUPsuEytsM6Dly@arm.com>
References: <20260520022023.126670-1-ruanjinjie@huawei.com>
 <ah65zXlOH6a9geD9@willie-the-truck>
 <02932ef7-5819-4cf5-8e78-8fd3fd40274f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02932ef7-5819-4cf5-8e78-8fd3fd40274f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_105836_713506_AD622B26 
X-CRM114-Status: GOOD (  28.16  )
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

Hi Jinjie,

On Wed, Jun 03, 2026 at 02:38:11PM +0800, Jinjie Ruan wrote:
> On 6/2/2026 7:09 PM, Will Deacon wrote:
> > On Wed, May 20, 2026 at 10:20:23AM +0800, Jinjie Ruan wrote:
> >> When booting with ACPI, arm64 smp_prepare_cpus() currently sets all
> >> enumerated CPUs as "present" regardless of their status in the MADT. This
> >> causes issues with SMT hotplug control. For instance, with QEMU's
> >> "-smp 4,maxcpus=8" configuration, the MADT GICC entries are populated as
> >> follows: the first four CPUs are marked Enabled while the remaining four
> >> are marked Online Capable to support potential hot-plugging.
> >>
> >> Fix this by:
> >>
> >> 1. When booting with ACPI, checking the ACPI_MADT_ENABLED flag in the GICC
> >>    entry before calling set_cpu_present() during SMP initialization.
> >>
> >> 2. Properly managing the present mask in acpi_map_cpu() and
> >>    acpi_unmap_cpu() to support actual CPU hotplug events, This aligns with
> >>    other architectures like x86 and LoongArch.
> >>
> >> 3. Update the arm64 CPU hotplug documentation to no longer state that all
> >>    online-capable vCPUs are marked as present by the kernel at boot time.
> >>
> >> This ensures that only physically available or explicitly enabled CPUs
> >> are in the present mask, keeping the SMT control logic consistent with
> >> the actual hardware state.
> > 
> > Please can you check the Sashiko review comment?
> > 
> > https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
> 
> I think commit eba4675008a6 ("arm64: arch_register_cpu() variant to
> check if an ACPI handle is now available.") introduced this bug.
> 
> It introduced an architectural safety block inside
> arch_unregister_cpu(). If a hot-unplug operation is determined to be a
> physical hardware removal (where _STA evaluates to
> !ACPI_STA_DEVICE_PRESENT), it aborts the unregistration transaction
> early to protect unreadied arm64 infrastructure, thereby skipping
> unregister_cpu().
> 
> However, the generic ACPI processor driver path in
> acpi_processor_post_eject() currently treats arch_unregister_cpu() as
> an unconditional void operation. When arch_unregister_cpu() bails out
> early, the subsequent cleanup flow blindly proceeds to call
> acpi_unmap_cpu(), clears global per-cpu processor arrays, and
> unconditionally free the 'struct acpi_processor' object.
> 
> I think we can fix this by:
> 
>     1. Refactoring arch_unregister_cpu() to return an integer
> transaction status. It returns -EOPNOTSUPP when aborting due to physical
> hot-remove blocking, -EINVAL/-EIO on firmware failures, and 0 only upon
> successful unregistration.
> 
>     2. Guarding the downstream execution flow in
> acpi_processor_post_eject(). If arch_unregister_cpu() returns a error
> code, the hot-unplug transaction is considered aborted.

I wonder whether we need all this guarding. In the worst case, we could
rewrite the function, something like below, to always unregister and
only warn:

void arch_unregister_cpu(int cpu)
{
	acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
	struct cpu *c = &per_cpu(cpu_devices, cpu);
	acpi_status status;
	unsigned long long sta;

	if (!acpi_handle) {
		pr_err_once("Removing a CPU without associated ACPI handle\n");
	} else {
		status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
		if (!ACPI_FAILURE(status) &&
		    cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT))
			pr_err_once("Changing CPU present bit is not supported\n");
	}

	unregister_cpu(c);
}

However, on the first condition, can we actually trigger !acpi_handle?
If not, we could just drop it. I tried to look up the paths and I don't
think we'd ever end up in this function with !acpi_handle. So this
leaves us with the next checks.

On the second/third conditions, it's more about preventing physical CPU
hotplug as we haven't properly defined it for arm yet but we could just
add a WARN_ONCE() to make it more visible and still proceed with the
unregistering. I think with your proposal, we don't fully unroll the
state anyway just by returning an error in arch_unregister_cpu(), so I'd
rather continue here.

What does firmware do for virtual CPU hotplug w.r.t. _STA? I noticed a
slight change in wording in the cpu-hotplug.rst doc with your patch from

  On virtual systems the _STA method must always report the CPU as
  ``present``

to

  On virtual systems the _STA method must report the CPU as ``present``
  when it is activated by the firmware

Was your intention that _STA.PRESENT can become 0 when hot-unplugging
virtual CPUs?

-- 
Catalin

