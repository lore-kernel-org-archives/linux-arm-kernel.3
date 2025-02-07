Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB08C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKiGI1lOXAaZwC/l1zpWg8G3iuUVUu+MQ65Z4M5VaBI=; b=cDrmwBtAFSpY2g6aVbTOAZvQVV
	zrCKQUiVIoigE9mA/uN3iSjNczrPcmqG3HD12FMge5X4J1h22UEsHHCgPmYwuOIpwa800tykpEE9r
	XFX5F1qx2LuzO1cDjKdf7rv0wwsD3X3m35U26krQ10cG6GHetNVm2xiWLp3BlOCqoD3FHSOMg1jqJ
	wm4dr5cWC2G8Gt3cSIlT0qXegWBKrTIKjatpgp3o42Bhkxs4PPy4GKPJyK2YiOSCSCH0HNmVngBGL
	CL3GSKDQneSwYiOxjJ2cIAGNQzoMr5Lpxuokv2fvspFPfB3/RvgOEXWRDKgeDADZPN/Qwclz73+ju
	fcQO1paA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSpJ-0000000AdcD-1kjY;
	Fri, 07 Feb 2025 18:11:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSnu-0000000AdN9-3utc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DEE8A43906;
	Fri,  7 Feb 2025 18:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F219C4CED1;
	Fri,  7 Feb 2025 18:10:10 +0000 (UTC)
Date: Fri, 7 Feb 2025 18:10:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	kvmarm@lists.linux.dev, oliver.upton@linux.dev, will@kernel.org,
	mark.rutland@arm.com, cohuck@redhat.com, eric.auger@redhat.com,
	sebott@redhat.com, yuzenghui@huawei.com, wangzhou1@hisilicon.com,
	jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
	anthony.jebson@huawei.com, linux-arm-kernel@lists.infradead.org,
	linuxarm@huawei.com
Subject: Re: [PATCH v6 4/4] arm64: paravirt: Enable errata based on
 implementation CPUs
Message-ID: <Z6ZMgDyyA5oV99hu@arm.com>
References: <20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com>
 <20250205132222.55816-5-shameerali.kolothum.thodi@huawei.com>
 <Z6YT7GxVKGKcnYmL@arm.com>
 <86h655u8r3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86h655u8r3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_101015_035347_1CE4C3D8 
X-CRM114-Status: GOOD (  22.82  )
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

On Fri, Feb 07, 2025 at 02:31:12PM +0000, Marc Zyngier wrote:
> On Fri, 07 Feb 2025 14:08:44 +0000,
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Wed, Feb 05, 2025 at 01:22:22PM +0000, Shameer Kolothum wrote:
> > >  static inline bool is_midr_in_range(struct midr_range const *range)
> > >  {
> > > -	return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> > > -				       range->rv_min, range->rv_max);
> > > +	int i;
> > > +
> > > +	if (!target_impl_cpu_num)
> > > +		return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> > > +					       range->rv_min, range->rv_max);
> > > +
> > > +	for (i = 0; i < target_impl_cpu_num; i++) {
> > > +		if (midr_is_cpu_model_range(target_impl_cpus[i].midr,
> > > +					    range->model,
> > > +					    range->rv_min, range->rv_max))
> > > +			return true;
> > > +	}
> > > +	return false;
> > >  }
> > 
> > It's a interesting approach but how does this work in practice if an
> > erratum requires a firmware counterpart? Do we expect firmwares on all
> > machines involved to have workarounds for the other machines? Or is KVM
> > going to intercept those SMCs and pretend the EL3 counterpart is there?
> 
> KVM already traps SMCs, and could do something on behalf of the guest
> (such as pretending that the mitigation has happened if not on the
> correct host) *IF* the mitigation is architected (à la WA{1,2,3}).

That's the main thing I had in mind. I don't think we have any other
errata that requires firmware run-time discovery and interaction, though
you never know when we'll add new one.

> If it is implementation specific, then we can immediately stop
> pretending that a guest running on those systems can be migrated.

Makes sense.

> The only thing it helps a bit is big-little.

It does help a bit or, at least, we have some code for handling these
variations that cab be extended. However, with this patchset, the host
only probes the availability of the workarounds on the SoC it booted. It
has no idea about the extra MIDRs the VMM picks and what the other
machines in the clouds support.

Anyway, let's hope the VMs only migrate between platforms that are
equally broken.

-- 
Catalin

