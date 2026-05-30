Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86027CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1suTZzjeKKm1M2CPVaqVj1nFGVAvH1OGHJ6QIFVOJpU=; b=gt3TWdYiFFT9q2AkbVo9fLxDbM
	i7GiT95VVXrIRDXbnaaLmv6R2eM+zw/Msml6vf76hRlcJcNW3/FDwx6pqM0oItIWDQzlvBaHMNe6u
	1VmiG5hduqEUq9e6ZSxL2ePIzJOLDMQWanVOSivs+V83DaD5IA3x2r2K+CGCP/mumIoT1ygew1VQb
	NwtbVsQC9R6kRV52KkEmlcXdbFAkDWoGdLqxl4wEXrTvVwNTKQ9iKR+x1IoSZKJuAPnHctm+aqLGc
	G1GjSgYU2Da9CwlddpAF7WWuUvrxFVtQLwliL0DAWxoP6vLE9S9cx9De7d/qR4usrgd5UOV7v7H0B
	Ibq7REVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMVJ-00000008vZI-3ntF;
	Sat, 30 May 2026 16:25:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMVD-00000008vYH-2cSD;
	Sat, 30 May 2026 16:25:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DC4841B57;
	Sat, 30 May 2026 16:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB20F1F00893;
	Sat, 30 May 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780158334;
	bh=1suTZzjeKKm1M2CPVaqVj1nFGVAvH1OGHJ6QIFVOJpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNZulNZWopBoouy0/z4gcjC11VMW+fTvUrQ09qpmPKznqSj+bQDP9lcOybTNBz00u
	 jq7ay/ejY+Cb+GCmiHvxtp2t6DeCzHRKhhyy+f5sufkOPpJR0B+nFfwxWfJvFRce2s
	 VqGaGsio2ebJiwUKmS4D+Mr1+pnZZjeL8cHrQV8cEEaGQoQExr8ByXCCUH5EpMbUp4
	 NNX5fsoQ/L/HfuSCRU2U4PvdPmeW8OcKs8RQkEBbDMlPiVfQTcx3Eaz1uAR/9130L6
	 Mi2kaeXpxLG0x3MrzfXvcWrftE68RFqLXGMiYQs8S31o7y6Phs/1MZY6/armSuLsIF
	 hk7vRncNndt8w==
Date: Sat, 30 May 2026 19:25:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Wandun Chen <chenwandun1@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	iommu@lists.linux.dev, zhaomeijing@lixiang.com,
	catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, robh@kernel.org, saravanak@kernel.org,
	akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, m.szyprowski@samsung.com,
	robin.murphy@arm.com, quic_obabatun@quicinc.com
Subject: Re: [PATCH v3 09/11] arm64: kdump: exclude non-dumpable reserved
 memory regions from vmcore
Message-ID: <ahsPcv8G1BR9rLah@kernel.org>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
 <20260527032917.3385849-10-chenwandun1@gmail.com>
 <ahmr-UjoApj2j5JS@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahmr-UjoApj2j5JS@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_092535_705417_854789DC 
X-CRM114-Status: GOOD (  27.92  )
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

On Fri, May 29, 2026 at 04:08:41PM +0100, Will Deacon wrote:
> On Wed, May 27, 2026 at 11:29:15AM +0800, Wandun Chen wrote:
> > From: Wandun Chen <chenwandun@lixiang.com>
> > 
> > Reserved memory regions are excluded from vmcore by default unless
> > marked dumpable. Honor the dumpable flag to filter out device firmware
> > regions (e.g., GPU, DSP, modem) reserved via device tree, since they
> > typically contain data not useful for kernel crash analysis and can
> > significantly increase vmcore size.
> > 
> > Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
> > pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().
> > 
> > Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
> > Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
> > ---
> >  arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> > index e31fabed378a..1d65320c6ba4 100644
> > --- a/arch/arm64/kernel/machine_kexec_file.c
> > +++ b/arch/arm64/kernel/machine_kexec_file.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/memblock.h>
> >  #include <linux/of.h>
> >  #include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> > @@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
> >  	nr_ranges = 2; /* for exclusion of crashkernel region */
> >  	for_each_mem_range(i, &start, &end)
> >  		nr_ranges++;
> > +	nr_ranges += of_reserved_mem_kdump_nr_ranges();
> >  
> >  	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
> >  	if (!cmem)
> > @@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
> >  			goto out;
> >  	}
> >  
> > +	ret = of_reserved_mem_kdump_exclude(cmem);
> > +	if (ret)
> > +		goto out;
> > +
> >  	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> 
> This looks fine to me:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Although I do wonder whether there's scope to consolidate some of the
> arch code here. Now that you have a helper for reserved memory, perhaps
> the core code could also handle the crashkernel reservation itself as
> well? If the arch code passed in its number of memory regions, the
> core code could take care of (a) allocating the crash_mem ranges array
> (b) excluding the crashkernel and (c) excluding the reserved regions
> (the part you have here).
> 
> Obviously that would be follow-up work, but the fact that you're having
> to apply basically the same diff to three architectures is a bit of a
> giveaway that this could benefit from some wider cleanup.

There are patches that move common code to kernel/crash_core.c:

https://lore.kernel.org/all/20260525084932.934910-1-ruanjinjie@huawei.com
 
Review from arch maintainers would be helpful there ;-)

> Will

-- 
Sincerely yours,
Mike.

