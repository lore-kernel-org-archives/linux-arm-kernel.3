Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CC5CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH/zqRVNW5/wF48NfxaOXQq398oJPEWVDcg9Q+DAoTs=; b=I+OI2X52XUFcUOV8hbxqO6VeWk
	8UKdV91evSmfQcfYE/5SUVVWVoOziMxaI6JYp1VEa+a/jhEqu/BxI8GIR3fLAjAARANE3Yw03QUkF
	GVINLfW65HUST8/JSqDHqyTdufhIUW3M2vsZdJpH/qkAsRZn5qWzAzNuKj+YNUqi+P5yHRnCz6wcJ
	OV9ys6DIXgmAO9XyLFls0wFKM+SSAFPLHOPZPvszm51HLzssIK90Io6Mmoi92GbfpcS2UHVEMOXRs
	DemT5EBkImsnGGpSdqMw6MGQWhc1yt07pA+G5H+106b5vrV86hg/jHNmF/ZB5JlaeiAfo+ayJsk7b
	0lSNJTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqmi-0000000HSDP-0G1L;
	Wed, 17 Jun 2026 13:58:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqmh-0000000HSDH-0DEg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 13:58:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4509D60120;
	Wed, 17 Jun 2026 13:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCAE1F00A3D;
	Wed, 17 Jun 2026 13:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781704706;
	bh=JH/zqRVNW5/wF48NfxaOXQq398oJPEWVDcg9Q+DAoTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fFFU8S6yJfQdd/DpFwJi1fMTNBs7fkhNAbep+yUv9GkF3D3dbvTb/kNRgCaI+zSuv
	 IPGOQDPdbFzrIvRuIlotxVyPKWnzS9k5lLZabUR//cemuWwOY9jdIhMf+6QknmyXc6
	 DR5uDEqbzs96rIXdWpMh8cIV4XYZCbATKmv8OCTpH3E0fyAPjSbyFhqUKHVFKo7VTk
	 LtwwVdR1GLmP1MagM+XqUd2lQmBTd7/q8CUkZ+wzX5ZgpLBv5XLZbcC3uV4v6mcwdC
	 /KyNvFkzFpDGVK7Gy3T3RsFmmPPq2E0vtafINEvTLZp1DhlO27V73NBd76O/2vh4XV
	 c+Dwlp7BveS4g==
Date: Wed, 17 Jun 2026 14:58:20 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajKn_Pt50CmOUrsP@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <ai_yj7GA_q1hD9cr@J2N7QTR9R3.cambridge.arm.com>
 <ajAPxKUTp66IRMMF@willie-the-truck>
 <ajDpc1-c2_zhycr6@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajDpc1-c2_zhycr6@J2N7QTR9R3>
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

On Tue, Jun 16, 2026 at 07:13:07AM +0100, Mark Rutland wrote:
> On Mon, Jun 15, 2026 at 03:44:20PM +0100, Will Deacon wrote:
> > On Mon, Jun 15, 2026 at 01:39:43PM +0100, Mark Rutland wrote:
> > > Regardless of the erratum, to correctly handle a vCPU being migrated
> > > from pCPU-x to pCPU-y, we rely on:
> > > 
> > > * The host to set HCR_EL2.FB to ensure that TLB maintenance is
> > >   broadcast to the ISH domain.
> > > 
> > > * The host to set HCR_EL2.BSU to ensure the DSB is upgrade to ISH such
> > >   that any guest-issued DSB NSH will it can complete any TLB maintenance
> > >   that was upgraded to ISH.
> > > 
> > > * The host to issue a DSB ISH on pCPU-x before the vCPU can run on
> > >   pCPU-y, to complete any outstanding maintenance that was issued on
> > >   pCPU-x. IIUC a DSB ISH on pCPU-y is not architecturally sufficient; it
> > >   must be executed on the same CPU which issued the TLB maintenance.
> > > 
> > > ... but as above, all of that should be independent of any of the errata
> > > that require the workaround.
> > 
> > Yes, I understand all of the above but the case I'm struggling with is
> > where a vCPU runs on a system that needs the TLB invalidation to be
> > performed twice. For non-broadcast invalidation (from the guest
> > perspective), this patch will mean that it only performs the
> > invalidation once. So if the vCPU migrates to another physical CPU, can
> > that effectively undo the HCR_EL2.FB upgrade unless KVM issues TLB
> > invalidation as well as a DSB on migration?
> > 
> > Maybe I'm missing something, as it looks like upstream already elides
> > the call to __tlbi_sync_s1ish() for the NOBROADCAST case.
> 
> The key thing is that these errata only affect the completion of memory
> accesses, and only those accesses made by other (physical) PEs.

Thanks. That sort of detail isn't generally disclosed in the writeups,
but if you're certain that applies to all of the errata workarounds
selecting CONFIG_ARM64_WORKAROUND_REPEAT_TLBI, then let's rename
that config option and document this somewhere (in the Kconfig help?)
to make sure that anybody trying to use this workaround to e.g. resolve
problems on the broadcasting side, are aware that it won't necessarily
help.

> A single TLBI will correctly remove the actual TLB entries, and
> HCR_EL2.{FB,BSU} will still ensure that TLB entries are removed from the
> TLBs of other PEs.
> 
> The errata only prevent completion of memory accesses made on other
> (physical) PEs, and:
> 
> * For accesses made by the vCPU which is issuing the TLBI(s):
> 
>   - Regardless of the errata, the hypervisor has to ensure that when a
>     vCPU is migrated from pCPU-x to pCPU-y, any prior CMOs or TLBIs are
>     completed, which requires the host to execute a DSB ISH on pCPU-x
>     before the vCPU can be run on pCPU-y.
> 
>     Maybe we have a latent bug here?

I think that should happen in the context switch path (see the
barrier in __switch_to()).

Will

