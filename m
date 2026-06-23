Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9A1CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZpCUInDhnBDublTX9djjKn8UqqE1Mq1Xlz/SmoClrk=; b=LMMQD43NmtV9DnT7gWXwUj8BXY
	AV+2VYJz2qTv4l7WtSUJBKUBB6vzWto/bUhN1OvNCCRUODF1XRPa3ntmvlNTwh7M63g9j5wdMla61
	n5h3UYsD3kV0GJgiE4OBl9j3Lo0fg7c+pE1EUJ3Bd9Lme5yyrGDdTblZjswGToDzq0//XBCYU/M5q
	GfR/jKgiuOP1tT4l/hwLHIxrMq2JvQfd8joVs1SMENzOGJPUfBUIrfTvhOAl9qU4jOgocnGJaTAL+
	u4e/dAyMGlcjr9EhF/Z1YcvxSlqpuDGdX0Aiu4NFbvoa80ExkUCRE4OWoSpIEazM44J6AYZxVdfGT
	lIabjawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Bl-00000006SXt-3FAU;
	Tue, 23 Jun 2026 14:33:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2Bk-00000006SXW-3CrO;
	Tue, 23 Jun 2026 14:33:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 42F894176A;
	Tue, 23 Jun 2026 14:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A16A1F000E9;
	Tue, 23 Jun 2026 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225200;
	bh=UZpCUInDhnBDublTX9djjKn8UqqE1Mq1Xlz/SmoClrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rh2lkpja7usItkPkL21c8D3oJ/sJj+BeFrnINZg5ZXo0XMUiBESVoC+NJFfXTbGmw
	 AlnyN0+/A3OUoh3Gu+FZC8xXzD82M78lnXhvuOg9K59PmLI28Y1f2H5RDHcUBaHILM
	 9U85m9rQNzb4T6oym6ZfRoJrXLD/5pl9F2NrhPym4KLK5CEqLCIPi8kdypSuYfEQYg
	 tBpL8EaOn00V0r66V62qxNtLYpopmL7XMZay7CpFB//6dDan+H/ry4r2Q5pRiVGML6
	 qPsyx5/D8JKoez9yuuxDzpkh7TPifKGVum5HmBDVUWthTVp4vYhfu/Vi189GVcTKmh
	 kPWqXifwjASWw==
Date: Tue, 23 Jun 2026 15:33:09 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"yeoreum.yun@arm.com" <yeoreum.yun@arm.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>,
	"mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <ajqZJVBCu_D-BkTy@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
 <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
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

On Mon, Jun 22, 2026 at 05:16:30PM +0800, Jinjie Ruan wrote:
> 
> 
> On 6/18/2026 8:21 PM, Will Deacon wrote:
> > Hi Jinjie,
> > 
> > On Mon, Jun 15, 2026 at 04:51:48PM +0800, Jinjie Ruan wrote:
> >> On 6/12/2026 11:45 PM, Michael Kelley wrote:
> >>> From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
> >>>>
> >>>> Support for parallel secondary CPU bringup is already utilized by x86,
> >>>> MIPS, and RISC-V. This patch brings this capability to the arm64
> >>>> architecture.
> >>>>
> >>>> Rework the global `secondary_data` accessed during early boot into
> >>>> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
> >>>> enabling the early boot code in head.S to resolve each secondary CPU's
> >>>> logical ID concurrently.
> >>>>
> >>>> To fully enable HOTPLUG_PARALLEL, this patch implements:
> >>>> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
> >>>> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
> >>>>
> >>>> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
> >>>>
> >>>> |     test kernel	   | secondary CPUs boot time |
> >>>> |  ---------------------   |	--------------------  |
> >>>> |   Without this patch     |		155.672	      |
> >>>> |   cpuhp.parallel=0	   |		62.897	      |
> >>>> |   cpuhp.parallel=1	   |		166.703	      |
> >>>
> >>> The last two rows seem mixed up. I would expect parallel=0 to
> >>> result in a longer boot time.
> >>
> >> Hi, Michael,
> >>
> >> The results are correct and not mixed up.
> >>
> >> Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
> >> cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
> >> of the wait_for_completion_timeout() mechanism (which may cause sleep
> >> and context switching). This significantly reduces the overhead of VM
> >> exits and context switches in a KVM guest, thereby cutting the secondary
> >> CPU boot time by more than half.
> > 
> > I don't think that's a particularly compelling reason to enable this for
> > arm64, in all honesty. The yield instruction typically doesn't do
> > anything on actual arm64 silicon, so this probably means that you're
> > introducing busy-loops which tend to be bad for power and scalability.
> > 
> > I implemented this a while ago [1] but didn't manage to see much in terms
> > of performance improvement and so I didn't bother to send the patches out
> > after talking about it at KVM forum [2]. However, as mentioned at the end
> > of that talk, it _is_ still useful for confidential VMs using PSCI so
> > let me dust off my old series and send it out to see what you think.
> 
> Hi Will,
> 
> Thanks for the insights! Your point about using PSCI v0.2's Context ID
> to avoid the NR_CPUS array for input parameters (like
> secondary_data.task) is incredibly elegant.
> 
> However, if I understand your series correctly, it seems your approach
> primarily targets preventing the concurrent use of secondary_data.task,
> but it doesn't seem to account for the potential data trampling on
> secondary_data.status when multiple secondary CPUs are brought up
> simultaneously.
> 
> update_cpu_boot_status()
>   -> WRITE_ONCE(secondary_data.status.flags[val], 1)
> 
> arch_cpuhp_cleanup_kick_cpu()
>   -> status = READ_ONCE(secondary_data.status)

I need to dust it back off but IIRC I made that thing a byte array, with
a separate byte for each failure reason.

Will

