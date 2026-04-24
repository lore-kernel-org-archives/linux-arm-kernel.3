Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61591FED3C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA8PdTTYgGRzo9N81zSqFuER6UEOwe9I0uNrqgJ41wM=; b=GIXIY1C3hrrRm3Bh3GRO7rHQR2
	IAlQBGy0/5J6hcVlqiamdcaC1ke28a8p3pHb2quzvgN+KraB1iRw0Hx8SvSOaIP89K7hqh8jWNYuw
	moau/qr/GXAae0lttNmSL+tZLcuAGNvSnqnBjohQGBDWxipamOnAoa4XPiK8kImbsqwYwDRvR/mPR
	3rEtGcRa1o+cQBfBT75YYB9+T1QXO1lxJKlI7FlD/z58O1ivwlK/q+o1/ndtnvD3N3a3FSBIa0GHr
	Ekut7Qup5jbiecxsRC2GISxgDHPyU9J2sYjiG9XnuNJ26idEYpmuA+E1zvjZupGZutTf3hudgosTV
	3GiTL4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGG0N-0000000DChI-1rnq;
	Fri, 24 Apr 2026 12:51:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGG0K-0000000DCgv-2XpL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:51:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E38E91A9A;
	Fri, 24 Apr 2026 05:51:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF9113F641;
	Fri, 24 Apr 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777035089; bh=FoL42KhHKRaCwoxP8nyowvsS3lcEySubWnFx6ufsLQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1fPFpudGzrbFRDVUAXqxKzhE1enzLieWDbDwv8LTWOpXVBiztAYq7lWAaJKIx0Vq
	 RKs3tKriO9xVUhH+VfaKvZrvYdQjGSu4KOPRWMIT8UZCvhH2UUvrKrC8V22pyi35eX
	 XcQrixZqaUfKaFvnzcoyOqgWUxgCcnEb8Qw5sS3k=
Date: Fri, 24 Apr 2026 13:51:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Thomas Gleixner <tglx@kernel.org>, peterz@infradead.org,
	sudeep.holla@kernel.org, yangyicong@hisilicon.com,
	dietmar.eggemann@arm.com, Jonathan Cameron <jic23@kernel.org>,
	linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <aetnTT51ucm2azGG@arm.com>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
 <aeNxKpHzTQX4_kId@arm.com>
 <87ldee0z1w.ffs@tglx>
 <78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com>
 <aep85G05D3TM9uj2@arm.com>
 <c6fe5e31-c397-4cf1-a422-f8d1a28fe20b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6fe5e31-c397-4cf1-a422-f8d1a28fe20b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_055132_817739_79A0C737 
X-CRM114-Status: GOOD (  32.99  )
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

(updating Jonathan's email address to match MAINTAINERS)

On Fri, Apr 24, 2026 at 09:56:24AM +0800, Jinjie Ruan wrote:
> On 4/24/2026 4:11 AM, Catalin Marinas wrote:
> > On Thu, Apr 23, 2026 at 08:32:34PM +0800, Jinjie Ruan wrote:
> >> On 4/23/2026 6:08 PM, Thomas Gleixner wrote:
> >>> On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:
> >>>> Another option would have been to avoid marking such CPUs present but I
> >>>> think this will break other things. Yet another option is to register
> >>>> all CPU devices even if they never come up (like maxcpus greater than
> >>>> actual CPUs).
> >>>>
> >>>> Opinions? It might be an arm64+ACPI-only thing.
> >>>
> >>> I think so. The proper thing to do is to apply sane limits:
> >>>
> >>>  1) The possible CPUs enumerated by firmware N_POSSIBLE_FW
> >>>
> >>>  2) The maxcpus limit on the command line N_MAXCPUS_CL
> >>>
> >>> So the actual possible CPUs evaluates to:
> >>>
> >>>    num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);
> >>>
> >>> The evaluation of the firmware should not mark CPUs present which are
> >>> actually not. ACPI gives you that information. See:
> >>>
> >>>          5.2.12.14 GIC CPU Interface (GICC) Structure
> >>>
> >>> in the ACPI spec. That has two related bits:
> >>>
> >>> Enabled:
> >>>
> >>>    If this bit is set, the processor is ready for use. If this bit is
> >>>    clear and the Online Capable bit is set, the system supports enabling
> >>>    this processor during OS runtime. If this bit is clear and the Online
> >>>    Capable bit is also clear, this processor is un- usable, and the
> >>>    operating system support will not attempt to use it.
> >>>
> >>> Online Capable:
> >>>
> >>>    The information conveyed by this bit depends on the value of the
> >>>    Enabled bit. If the Enabled bit is set, this bit is reserved and must
> >>>    be zero. Otherwise, if this bit is set, the system supports enabling
> >>>    this processor later during OS runtime
> >>>
> >>> So the combination of those gives you the right answer:
> >>>
> >>>    Enabled	Online
> >>>    	        Capable
> >>>    0            0        Not present, not possible
> >>>    0            1        Not present, but possible to "hotplug" layter
> >>>    1            0        Present
> >>>    1            1        Invalid
> >>
> >> On x86, it seems that all CPUs with the ACPI_MADT_ENABLED bit set will
> >> be marked as present.
> >>
> >> acpi_parse_x2apic()
> >>   -> enabled = processor->lapic_flags & ACPI_MADT_ENABLED
> >>   -> topology_register_apic(enabled)
> >>      -> topo_register_apic(enabled)
> >>         -> set_cpu_present(cpu, true)
> > 
> > Yes but arm64 marks all CPUs present even if !ACPI_MADT_ENABLED as we
> > don't have the notion of hardware CPU hotplug.
> > 
> > I need to dig some more into the original vCPU hotplug support and why
> > we ended up with all CPUs marked as present even if not calling
> > register_cpu():
> > 
> > https://lore.kernel.org/linux-arm-kernel/20240529133446.28446-1-Jonathan.Cameron@huawei.com/
> > 
> > What's the MADT GICC provided by qemu with "-smp cpus=4,maxcpus=8"? If
> > it says Enabled for the first 4 and Online Capable for the rest, maybe
> > we can try something like below:
> 
> Yes, you are absolutely right,Enabled for the first 4(with GIC Flags:
> 0x1, bit0 set) and Online Capable for the rest(with GIC Flags: 0x8, bit3
> set). The ACPI MADT disassembly result is as follows:

That's great, thanks for checking.

I'd like to get some feedback from Jonathan and James as they
contributed the vCPU hotplug support. The reason was for kubernetes to
add vCPUs to an existing VM. Hopefully no-one relied on
/sys/devices/system/cpu/present to report 0-7 in the above
configuration.

Have you tried the vCPU hotplug with this patch (the original use-case)?

Anyway, feel free to post a v2 with the above proposal, cc Jonathan (on
kernel.org) and James Morse and we'll take it from there. You can add a
suggested-by me.

Thanks.

-- 
Catalin

