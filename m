Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC490CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxvhe6p1siX027yhrT2z3XtNk0V+WNmEv1s3Z1RR4ZI=; b=QSbw+7Ed9lw6P2T4Bp2f1M7BSI
	ZPC+pixtygy9OlFj15VGvlJAASVtGFW4/dlbAayWDAURqJgw6QWC0UmEh34AemAcpMb7YlCmp4yQV
	01HwmscEdg/5NW9sC0m9MQOIDG+zrLToU2fjKCYgeigfPptbkKKNKqbTcDYl42Mevkw9gtVmZMc+K
	D24YJz0jhLis6H2MwmYsT9FuRlSU5NTo6Devmt5NG+nLQgBoXga28VXWvzM0PFPfL4sDKJKK7Y2T3
	BaIkMZ3vL9IhO58K8xOoVZoFZIME9C5y+/DNX6JAR0GCM4ORGbv0qnb+SyiQG7+FdCRDIBj0xhHjQ
	6UNLzQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBkH-00000001Fyo-0wEm;
	Thu, 18 Jun 2026 12:21:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBkG-00000001FyI-1oxb;
	Thu, 18 Jun 2026 12:21:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20C8960008;
	Thu, 18 Jun 2026 12:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014171F000E9;
	Thu, 18 Jun 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781785278;
	bh=Jxvhe6p1siX027yhrT2z3XtNk0V+WNmEv1s3Z1RR4ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Abiv2iO4RiW//8pR9dLhCcfHcyT0i58RzDg5KzLOl4m1sOVrs9DawRFk1ryHLcLTZ
	 GPY4ji0YfFluVDNoGFEQXe/s9wWAINc1y53L2TgIChzRQy+tck3KRiTB4YXjBtxuF/
	 dKOzf0YDV7JDGJYBomYM/m/3eJJw0ECQPGWyOA2dny3d1EqMKYJ5bv0qL/FdTFInjo
	 UwObl+tH/TA8ZI2XIv81QMpK+UGTHEWY2yqpQg+12mo83OKk5o3NZmROcMePyhmjO+
	 piAkoCTIX25wwfovDDqzcGs4sdtJWDhEf0M8suoHHDosU2AvUXb3uErsuxUgwmrIPT
	 xJGfjxrHWZ73A==
Date: Thu, 18 Jun 2026 13:21:08 +0100
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
Message-ID: <ajPitENEHWa8lDfC@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
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

On Mon, Jun 15, 2026 at 04:51:48PM +0800, Jinjie Ruan wrote:
> On 6/12/2026 11:45 PM, Michael Kelley wrote:
> > From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
> >>
> >> Support for parallel secondary CPU bringup is already utilized by x86,
> >> MIPS, and RISC-V. This patch brings this capability to the arm64
> >> architecture.
> >>
> >> Rework the global `secondary_data` accessed during early boot into
> >> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
> >> enabling the early boot code in head.S to resolve each secondary CPU's
> >> logical ID concurrently.
> >>
> >> To fully enable HOTPLUG_PARALLEL, this patch implements:
> >> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
> >> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
> >>
> >> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
> >>
> >> |     test kernel	   | secondary CPUs boot time |
> >> |  ---------------------   |	--------------------  |
> >> |   Without this patch     |		155.672	      |
> >> |   cpuhp.parallel=0	   |		62.897	      |
> >> |   cpuhp.parallel=1	   |		166.703	      |
> > 
> > The last two rows seem mixed up. I would expect parallel=0 to
> > result in a longer boot time.
> 
> Hi, Michael,
> 
> The results are correct and not mixed up.
> 
> Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
> cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
> of the wait_for_completion_timeout() mechanism (which may cause sleep
> and context switching). This significantly reduces the overhead of VM
> exits and context switches in a KVM guest, thereby cutting the secondary
> CPU boot time by more than half.

I don't think that's a particularly compelling reason to enable this for
arm64, in all honesty. The yield instruction typically doesn't do
anything on actual arm64 silicon, so this probably means that you're
introducing busy-loops which tend to be bad for power and scalability.

I implemented this a while ago [1] but didn't manage to see much in terms
of performance improvement and so I didn't bother to send the patches out
after talking about it at KVM forum [2]. However, as mentioned at the end
of that talk, it _is_ still useful for confidential VMs using PSCI so
let me dust off my old series and send it out to see what you think.

It relies on PSCI v0.2, which means we don't need the NR_CPUS size array
for secondary_data and I also have some support for error handling (it
doesn't look like you handle __early_cpu_boot_status properly).

It looks like I could include your first patch, though!

Will

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
[2] https://www.youtube.com/watch?v=Q6kOshnnQuE

