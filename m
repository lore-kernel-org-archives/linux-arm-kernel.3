Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC7CCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79j64AKzmBVKZ0VCce+vDNcysOjiWPQfOIPmvpLv7oQ=; b=EwP010KdX2ia3D6TaKdD5/TMf0
	Hry9fMfSBDR5YisFlfIOe2dptRcCIURpcGAYbPVh3VQ/fjw5/ulieQDInNoeyjwi5BIZClJL4M5KD
	BCHPDKGYMap+GJb23VEAoiRtUO5r4KljMebNRJe2vRPeMOM1QtP3XAIlW7/RZaVuthqbOTpE5/Oc5
	sLwb+JhDRM6nnG97AdNs1cCr7dvkQvbso5trNcV1CamF3+TMvfNZACtd+RlG7aGYJ8ugZA6T6fzMU
	6E/X2g1jIj0LZ0vKE66yrw6uHOn9ozBnzB9tBI9nXX9nxgT9SmLMsQn3YYJBz6mWoqcVVtujwD8wE
	LAO1gW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gwi-0000000AZuy-0ouz;
	Mon, 22 Sep 2025 13:51:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gwe-0000000AZuK-0O8G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:51:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E609B1424;
	Mon, 22 Sep 2025 06:50:58 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9EA23F694;
	Mon, 22 Sep 2025 06:51:04 -0700 (PDT)
Date: Mon, 22 Sep 2025 14:51:02 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, gregkh@linuxfoundation.org,
	Sudeep Holla <sudeep.holla@arm.com>, rafael@kernel.org,
	dakr@kernel.org, beata.michalska@arm.com, ptsm@linux.microsoft.com,
	sumitg@nvidia.com, yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH v3 1/1] arch_topology: move
 parse_acpi_topology() to common code
Message-ID: <20250922-adventurous-pumpkin-booby-d4c95c@sudeepholla>
References: <20250919085918.5442-1-cuiyunhui@bytedance.com>
 <20250919085918.5442-2-cuiyunhui@bytedance.com>
 <20250919-colossal-splendid-bettong-e5a0bd@sudeepholla>
 <CAEEQ3wkRoX5Y5xQu22kVCFxEy8fgcUxKHEm=9Bpg7g-Np8b-SA@mail.gmail.com>
 <20250922-buffalo-of-hypothetical-downpour-d2a47c@sudeepholla>
 <CAEEQ3w=4aKS=p=+q4iC42Va+dMVm017R0Surxff+4R+4RjkgAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3w=4aKS=p=+q4iC42Va+dMVm017R0Surxff+4R+4RjkgAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_065108_246584_4A7FA835 
X-CRM114-Status: GOOD (  28.22  )
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

On Mon, Sep 22, 2025 at 07:04:05PM +0800, yunhui cui wrote:
> Hi Sudeep,
> 
> On Mon, Sep 22, 2025 at 5:01 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Mon, Sep 22, 2025 at 10:18:57AM +0800, yunhui cui wrote:
> > > Hi Sudeep,
> > >
> > > On Fri, Sep 19, 2025 at 10:05 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > [...]
> >
> > > >
> > > > Just thinking if it makes sense keep acpi_cpu_is_threaded generic without
> > > > the need for weak definition.
> > > >
> > > > Additional note: not sure why you haven't moved this under CONFIG_ARM64/RISCV as
> > > > done with other code.
> > > >
> > > > bool __init acpi_cpu_is_threaded(int cpu)
> > > > {
> > > >         int is_threaded = acpi_pptt_cpu_is_thread(cpu);
> > > >
> > > >         /*
> > > >          * if the PPTT doesn't have thread information, check for architecture
> > > >          * specific fallback if available
> > > >          */
> > > >         if (is_threaded < 0)
> > > >                 is_threaded = arch_cpu_is_threaded();
> > > >
> > > >         return !!is_threaded;
> > > > }
> > > >
> > > > Then you can just have the define in
> > > >
> > > > #define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMASK)
> > > >
> > > > in arch/arm64/include/asm/topology.h
> > > >
> > > > and
> > > >
> > > > +#ifndef arch_cpu_is_threaded
> > > > +#define arch_cpu_is_threaded           (0)
> > > > +#endif
> > > >
> > > > in include/linux/arch_topology.h
> > > >
> > > > Thoughts ?
> > >
> > > If placed in include/linux/arch_topology.h, there is a possibility
> > > that "arch_cpu_is_threaded" will be redefined.
> > >
> >
> > Why is that a problem ? We want arch to override the default definition
> > if and when required.
> 
> Because include/linux/topology.h first includes linux/arch_topology.h,
> and then includes asm/topology.h, a warning will be generated during
> compilation:
> 
> In file included from ./include/linux/topology.h:37,
>                  from ./include/linux/gfp.h:8,
>                  from ./include/linux/xarray.h:16,
>                  from ./include/linux/list_lru.h:14,
>                  from ./include/linux/fs.h:14,
>                  from kernel/events/core.c:11:
> ./arch/arm64/include/asm/topology.h:39: warning:
> "arch_cpu_is_threaded" redefined
>    39 | #define arch_cpu_is_threaded() (read_cpuid_mpidr() & MPIDR_MT_BITMASK)
>       |
> In file included from ./include/linux/topology.h:30:
> ./include/linux/arch_topology.h:94: note: this is the location of the
> previous definition
>    94 | #define arch_cpu_is_threaded()  (0)
> 
> Unless #undef arch_cpu_is_threaded is used in arch/arm64/include/asm/topology.h,
> 

The above way of #undef first should be fine.

> So it's better to place
> #ifndef arch_cpu_is_threaded
> #define arch_cpu_is_threaded (0)
> #endif
> in include/asm-generic/topology.h.
>

I don't think asm-generic/topology.h is the right place and also you are
again better on order of inclusion.

-- 
Regards,
Sudeep

