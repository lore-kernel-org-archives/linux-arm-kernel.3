Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B87FED3F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 18:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCwp+mIbLGBQYvAtNiYxPnSWx5RoqzsBw2FoZVW3aWg=; b=FzVb8UbHdGQNtbJFjTcBym7W32
	ecUZmPxrunix4pEHV8sD8ATBx8xwFer2xntpV5qtTdUzgzvd32B4mct5hhOhKdWunbjceiUZJ2ENR
	iEBk4pSpZT0xbh5uoChXe53QkrYq/oowhVgO3y2P9lUUXivAQeiVwNORqLLd5xJy7A4qkIUxOtZSo
	p6mljCcxAbtNkhWHXDBmP5tPPx4HYGB2yAH3oJjZhbyCDZt8F2BqovXo/merY4KzbDdGGJYI7oBy2
	L/gly8tKdiGAG5bON3VK69ZmZJjOk1XlkRIckxPkpyrXyPg8eEps8VGoJf7om5vohoY9LTuFJoRSY
	PEfxAxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLFX-0000000De7M-0q4x;
	Fri, 24 Apr 2026 18:27:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLFT-0000000De67-10MZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 18:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F040B4457B;
	Fri, 24 Apr 2026 18:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0687C19425;
	Fri, 24 Apr 2026 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777055249;
	bh=umhEa+yjy8NpluGJvNLTzPXWi1CPXDJ9JKVWASLXvB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tDg/iaDS/8Qm3cy1lxsGl1I3iK09OomLEiNQpqzha/t/wJ8XnYyk2To2gJ/44d87A
	 wEBm8arlADNCQsfyeBikPlWZUYgvDTzrenvtae09enHpD0UzDiWIuTXX+NzHWpzvRT
	 hNeR8HEV5DGo4mnyhPFBgNwmjLuG/71S2TwmlyAuEPBRpTGYMWAfiuqZPQbimxk1BF
	 xa+HWT/rAlTdfU/xSQEnpkuOFQcTnVt0ilc56/A+cTWgM1ao2LLXxNSmkqXx+/t2/y
	 u+71t9aTMw55iOhmIlGAzIcGK6KBy0w2oKG/GcTA7iVqjaN7YMrKJ/qqK2nRmXtPpL
	 /aw5K1prUDVsw==
Date: Fri, 24 Apr 2026 19:27:20 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Thomas Gleixner <tglx@kernel.org>,
 peterz@infradead.org, sudeep.holla@kernel.org, yangyicong@hisilicon.com,
 dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org, James Morse
 <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpu/hotplug: Fix NULL kobject warning in
 cpuhp_smt_enable()
Message-ID: <20260424192720.4a147b9c@jic23-huawei>
In-Reply-To: <aetnTT51ucm2azGG@arm.com>
References: <20260417075534.3745793-1-ruanjinjie@huawei.com>
	<aeNxKpHzTQX4_kId@arm.com>
	<87ldee0z1w.ffs@tglx>
	<78515da3-03a1-4fdb-a606-3fea9f4cd20b@huawei.com>
	<aep85G05D3TM9uj2@arm.com>
	<c6fe5e31-c397-4cf1-a422-f8d1a28fe20b@huawei.com>
	<aetnTT51ucm2azGG@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_112731_327952_1494293F 
X-CRM114-Status: GOOD (  44.60  )
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

On Fri, 24 Apr 2026 13:51:25 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> (updating Jonathan's email address to match MAINTAINERS)
Thanks!
> 
> On Fri, Apr 24, 2026 at 09:56:24AM +0800, Jinjie Ruan wrote:
> > On 4/24/2026 4:11 AM, Catalin Marinas wrote:  
> > > On Thu, Apr 23, 2026 at 08:32:34PM +0800, Jinjie Ruan wrote:  
> > >> On 4/23/2026 6:08 PM, Thomas Gleixner wrote:  
> > >>> On Sat, Apr 18 2026 at 12:55, Catalin Marinas wrote:  
> > >>>> Another option would have been to avoid marking such CPUs present but I
> > >>>> think this will break other things. Yet another option is to register
> > >>>> all CPU devices even if they never come up (like maxcpus greater than
> > >>>> actual CPUs).
> > >>>>
> > >>>> Opinions? It might be an arm64+ACPI-only thing.  
> > >>>
> > >>> I think so. The proper thing to do is to apply sane limits:
> > >>>
> > >>>  1) The possible CPUs enumerated by firmware N_POSSIBLE_FW
> > >>>
> > >>>  2) The maxcpus limit on the command line N_MAXCPUS_CL
> > >>>
> > >>> So the actual possible CPUs evaluates to:
> > >>>
> > >>>    num_possible = min(N_POSSIBLE_FW, N_MAXCPUS_CL, CONFIG_NR_CPUS);
> > >>>
> > >>> The evaluation of the firmware should not mark CPUs present which are
> > >>> actually not. ACPI gives you that information. See:
> > >>>
> > >>>          5.2.12.14 GIC CPU Interface (GICC) Structure
> > >>>
> > >>> in the ACPI spec. That has two related bits:
> > >>>
> > >>> Enabled:
> > >>>
> > >>>    If this bit is set, the processor is ready for use. If this bit is
> > >>>    clear and the Online Capable bit is set, the system supports enabling
> > >>>    this processor during OS runtime. If this bit is clear and the Online
> > >>>    Capable bit is also clear, this processor is un- usable, and the
> > >>>    operating system support will not attempt to use it.
> > >>>
> > >>> Online Capable:
> > >>>
> > >>>    The information conveyed by this bit depends on the value of the
> > >>>    Enabled bit. If the Enabled bit is set, this bit is reserved and must
> > >>>    be zero. Otherwise, if this bit is set, the system supports enabling
> > >>>    this processor later during OS runtime
> > >>>
> > >>> So the combination of those gives you the right answer:
> > >>>
> > >>>    Enabled	Online
> > >>>    	        Capable
> > >>>    0            0        Not present, not possible
> > >>>    0            1        Not present, but possible to "hotplug" layter
> > >>>    1            0        Present
> > >>>    1            1        Invalid  
> > >>
> > >> On x86, it seems that all CPUs with the ACPI_MADT_ENABLED bit set will
> > >> be marked as present.
> > >>
> > >> acpi_parse_x2apic()  
> > >>   -> enabled = processor->lapic_flags & ACPI_MADT_ENABLED
> > >>   -> topology_register_apic(enabled)
> > >>      -> topo_register_apic(enabled)
> > >>         -> set_cpu_present(cpu, true)  
> > > 
> > > Yes but arm64 marks all CPUs present even if !ACPI_MADT_ENABLED as we
> > > don't have the notion of hardware CPU hotplug.
> > > 
> > > I need to dig some more into the original vCPU hotplug support and why
> > > we ended up with all CPUs marked as present even if not calling
> > > register_cpu():

James may remember more but I think there were some usecases
which broken if we reported CPUs that might turn up later as
not present.  We spent some time discussing what to do about this
on various calls, leading to just giving up and marking them present
always.

I think it was something to do with userspace code that would allocate
stuff based on the sysfs present information and die horribly when more
CPUs turned up later.

I'm not sure I ever came across that code. Maybe it was something
James had come across.  I may be completely wrong but my memory
is hinting that it was something Android related?

> > > 
> > > https://lore.kernel.org/linux-arm-kernel/20240529133446.28446-1-Jonathan.Cameron@huawei.com/
> > > 
> > > What's the MADT GICC provided by qemu with "-smp cpus=4,maxcpus=8"? If
> > > it says Enabled for the first 4 and Online Capable for the rest, maybe
> > > we can try something like below:  
> > 
> > Yes, you are absolutely right,Enabled for the first 4(with GIC Flags:
> > 0x1, bit0 set) and Online Capable for the rest(with GIC Flags: 0x8, bit3
> > set). The ACPI MADT disassembly result is as follows:  
> 
> That's great, thanks for checking.
> 
> I'd like to get some feedback from Jonathan and James as they
> contributed the vCPU hotplug support. The reason was for kubernetes to
> add vCPUs to an existing VM. Hopefully no-one relied on
> /sys/devices/system/cpu/present to report 0-7 in the above
> configuration.

I think not in the kubernetes case as such, but in general userspace
code which might run on the same systems :(

J
> 
> Have you tried the vCPU hotplug with this patch (the original use-case)?
> 
> Anyway, feel free to post a v2 with the above proposal, cc Jonathan (on
> kernel.org) and James Morse and we'll take it from there. You can add a
> suggested-by me.
> 
> Thanks.
> 


