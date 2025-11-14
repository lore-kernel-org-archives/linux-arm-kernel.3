Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDF8CE8D47
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=937Kna5FIMcmuhcM43I4XpAxP0ORWeCDFNrCp2ECx8A=; b=SH3QAG/9NUt+KTTH3UfNJtXNF1
	NpCjHQd7rX+7LpP2NYfRUYRXp32Q7lny2R/nkcDSJrl8a+vB5vjElkzrTRaZEVNYkLAIFeLW034xt
	/5y+2yhHwhXSoJkGMgjleeMi7p4JMXL42RhRW9/9/yeFIClKnUaFSEIWk7PsrqzObLAMEXY5QI2BC
	T1wfNVh79fZPy4LImPFFU7stDBdjosj//JTIfkbhtxv8geiLx0KQL1niQDAwpV+HKhRwdKDoQn5Sy
	be1WIlrmz+OifloYZGqemVWrvW3NyNl/f9dOimKOIZg+/Fx2O++k7bMgb4D2pD48mJtb1ndVqM4Du
	Qqu+6R/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwBT-0000000Cdbd-119n;
	Fri, 14 Nov 2025 15:57:59 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwBQ-0000000CdbD-1Nns
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:57:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d7MGK3DXjzJ46Cx;
	Fri, 14 Nov 2025 23:57:13 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 62FF014033F;
	Fri, 14 Nov 2025 23:57:49 +0800 (CST)
Received: from localhost (10.122.19.247) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 14 Nov
 2025 15:57:48 +0000
Date: Fri, 14 Nov 2025 15:57:46 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Conor Dooley <conor@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Linux-Arch
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>, Dan Williams
	<dan.j.williams@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
	Drew Fustini <fustini@kernel.org>, "Linus Walleij"
	<linus.walleij@linaro.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzk@kernel.org>, James
 Morse <james.morse@arm.com>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v5 0/6]  Cache coherency management subsystem
Message-ID: <20251114155746.00003719@huawei.com>
In-Reply-To: <02244119-d6b8-4ef4-833f-b8fba7a73f43@app.fastmail.com>
References: <20251031111709.1783347-1-Jonathan.Cameron@huawei.com>
	<20251108-spearmint-contend-aa3dd8a0220e@spud>
	<20251114124958.00006a85@huawei.com>
	<20251114-juror-stiffness-046b47b8d9f7@spud>
	<02244119-d6b8-4ef4-833f-b8fba7a73f43@app.fastmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_075756_680837_C3D93AAB 
X-CRM114-Status: GOOD (  49.79  )
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

On Fri, 14 Nov 2025 15:07:33 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, Nov 14, 2025, at 13:52, Conor Dooley wrote:
> > On Fri, Nov 14, 2025 at 12:49:58PM +0000, Jonathan Cameron wrote:  
> >> On Sat, 8 Nov 2025 20:02:52 +0000 Conor Dooley <conor@kernel.org> wrote:  
> >> > 
> >> > On Fri, Oct 31, 2025 at 11:17:03AM +0000, Jonathan Cameron wrote:  
> >> > > Support system level interfaces for cache maintenance as found on some
> >> > > ARM64 systems. It is expected that systems using other CPU architectures
> >> > > (such as RiscV) that support CXL memory and allow for native OS flows
> >> > > will also use this. This is needed for correct functionality during
> >> > > various forms of memory hotplug (e.g. CXL). Typical hardware has MMIO
> >> > > interface found via ACPI DSDT. A system will often contain multiple
> >> > > hardware instances.
> >> > > 
> >> > > Includes parameter changes to cpu_cache_invalidate_memregion() but no
> >> > > functional changes for architectures that already support this call.
> >> > > 
> >> > > How to merge?
> >> > > - Current suggestion would be via Conor's drivers/cache tree which routes
> >> > >   through the SoC tree.    
> >> > 
> >> > I was gonna put this in linux-next, but I'm not really sure that Arnd
> >> > was satisfied with the discussion on the previous version about
> >> > suitability of the directory: https://lore.kernel.org/all/20251028114348.000006ed@huawei.com/
> >> > 
> >> > Arnd, did that response satisfy you, or nah?  
> >> 
> >> Seems Arnd is busy.  Conor, if you are happy doing so, maybe push it to a tree
> >> linux-next picks up, but hold off on the pull request until Arnd has had a chance
> >> to reply?  
> >
> > Yeah, I did step one of that last night and will put it in linux-next
> > from Monday. Ultimately the PR goes to Arnd, so he can judge it there
> > anyway.  
> 
> Sorry about the delay on my side. I've read up on it again and understand
> better where we are with this now.
> 
> I think the implementation is fine, and placing it in drivers/cache/
> is also ok, given that we don't have a better place for it.
> 
> However, this does feel sufficiently different from the three existing
> drivers in drivers/cache that I think we should have separate
> submenus in Kconfig and describe them differently:
> 
> - the arch/riscv drivers are specifically for managing coherency
>   between the CPU and any device driver using the linux/dma-mapping.h
>   interfaces to manage coherency using CPU specific interfaces.
> 
> - the new driver does not interface with linux/dma-mapping.h
>   or a CPU specific register set, and as I understand that would
>   make no sense here. The only similarities are that it manages
>   coherency between multiple entities that access the same memory
>   and have private caches for that.
> 
> If we can come up with better names for the two things, I'd
> like them to have distinct submenus. Something like the draft
> below for the existing drivers would work, in addition to
> a new menu that only contains the one driver for now. I've
> moved the 'depends on RISCV' into the 'menu' here, since that
> is the only thing using it today (32-bit arm has the same thing
> in arch/arm/mm/cache-*.S with a different interface, most others
> only have an architected interface).

Hi Arnd,

Thanks for taking another look.

Agreed splitting the menus reduces chance of confusion, so makes
sense to me as well.

Implementation wise I think we have to use menuconfig + bool if we want
to have help and dependencies and then an if block under that.
The syntax for Kconfig always leaves me finding an example to copy
rather than finding it intuitive

menuconfig CACHEMAINT_FOR_DMA
	bool "Cache management for noncoherent DMA"
	depends on RISCV
	help
	  These drivers implement support for noncoherent DMA master devices
	  on platforms that lack the standard CPU interfaces for this.

if CACHEMAINT_FOR_DMA
... drivers here...

endif #CACHEMAINT_FOR_DMA

menuconfig CACHEMAINT_FOR_HOTPLUG
	bool "Cache management for hotplug like operations"
	depends on GENERIC_CPU_CACHE_MAINTENANCE
	help
	   These drivers implement support for cache management flows
	   as required for action such as memory hotplug on platforms
	   where this is done by platform specific interfaces.

if CACHEMAINT_FOR_HOTPLUG
... drivers here

endif #CACHEMAINT_FOR_HOTPLUG

Alternative would be to hope the short text is enough and use

menu "Cache management for noncoherent DMA"
	visible if RISCV

endmenu

I'm not sure if the 'hotplug like' is close enough to all the cases
for device drivers that provide the services needed to implement
ARCH_HAS_CPU_CACHE_INVALIDATE_MEMEGION

Alternative might be to phrase around pushing beyond the point of
coherence, but that seems to be an ARM specific term and would
seem to incorporate fine grained sharing where this interface might
work but isn't a good solution.

Thanks,

Jonathan

> 
>     Arnd
> 
> ---
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index db51386c663a..8a49086eb8af 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -1,9 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
> -menu "Cache Drivers"
> +menu "Cache management for noncoherent DMA"
> +       depends on RISCV
> +       help
> +         These drivers implement support for noncoherent DMA master devices
> +         on platforms that lack the standard CPU interfaces for this.

>  
>  config AX45MP_L2_CACHE
>         bool "Andes Technology AX45MP L2 Cache controller"
> -       depends on RISCV
>         select RISCV_NONSTANDARD_CACHE_OPS
>         help
>           Support for the L2 cache controller on Andes Technology AX45MP platforms.
> @@ -16,7 +19,6 @@ config SIFIVE_CCACHE
>  
>  config STARFIVE_STARLINK_CACHE
>         bool "StarFive StarLink Cache controller"
> -       depends on RISCV
>         depends on ARCH_STARFIVE
>         depends on 64BIT
>         select RISCV_DMA_NONCOHERENT


