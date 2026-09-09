Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5171C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7bifEcfysoaJdWY3KiNVCwLaTd7V2wpeFRk1F7RAOg=; b=Mz0ZtX+NuToUewrt75ZBjYLGI2
	yNZMRVzeUdmLbJSS+7U6oHY+zpVuduEQsbvuXakRTBQM2v1kY0HnlqOluYzCXIO1cxSC3fsRRkK6l
	y0TZ+0SMCx+GkrwLjBB00b3yXQ1phe/5x/HQmqYYcH8dCtd2/0YWpGKLCSHwdt9PfQd93pDsi/Ps9
	OJpiHOqmTjh9QvQ/fyeYybIBBE4ofaFjSnjWHun7Z9recz+Ikorn3vsr6RJwYuLwS79HbpxVuuwYl
	6Fjh4klPu++1Qr6ginxnRwNcR3q6hisI4UrH+JpIhk4Cphzhh5af4l2KxR4HF/1Z7eyXc8bJbBK0R
	yTYVcTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NBv-0000000Cd45-2CGW;
	Wed, 09 Sep 2026 18:38:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NBt-0000000Cd3O-0GMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:38:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA4E31576;
	Wed,  9 Sep 2026 11:38:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E02513F528;
	Wed,  9 Sep 2026 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788979114; bh=frS1SGYXgkHttcut/kQlMeX3IPWRF3AjzyZ2IfPARzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvbnJKPA1MGj0YZ27FNXCLGbHFnTA2gbmSglgO9JEDGU4aHJQXBjlgo9j6Vfj16gk
	 twxgs0WSB2Gl/ygBhDheZ74NLtkpS1iyvAGloGlCy0ZbveFJrEZsSKmq0EgRveSJWc
	 HOZf1x51UJnQIGVItf5kyH+RNTbu1hYQ/MFZ/xSc=
Date: Wed, 9 Sep 2026 19:38:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, robin.murphy@arm.com, gshan@redhat.com,
	kernel-dev@igalia.com, kernel@gpiccoli.net,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
Message-ID: <aqGnptkgxLEkqOfx@arm.com>
References: <20260815152759.2046231-1-gpiccoli@igalia.com>
 <aoGIEEje1NIMTjyv@willie-the-truck>
 <aoLLf_iZq6DLNpLO@arm.com>
 <8207cba6-a6e0-38e6-a1bd-6f4453651793@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8207cba6-a6e0-38e6-a1bd-6f4453651793@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_113837_359105_FF55F6FD 
X-CRM114-Status: GOOD (  35.08  )
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

Hi Guilherme,

On Mon, Aug 17, 2026 at 11:48:28AM -0300, Guilherme G. Piccoli wrote:
> On 17/08/2026 05:51, Catalin Marinas wrote:
> > On Sun, Aug 16, 2026 at 10:51:12AM +0100, Will Deacon wrote:
> >> On Sat, Aug 15, 2026 at 12:19:32PM -0300, Guilherme G. Piccoli wrote:
> >>> The register TPIDRRO_EL0 has 2 meanings / usages today, depending on
> >>> the mode userspace is running:
> >>>
> >>> - For native/arm64 mode, this register is always 0 from the userspace
> >>>   perspective. In the kernel, it is used during ventry (entry.S) as
> >>>   a scratch register, related to KPTI (stashes x30 in fact).
> >>>
> >>> - For 32-bit compat tasks, this register holds the TLS userspace pointer,
> >>>   and is not used for KPTI or anything else in entry.S. This is ABI and
> >>>   userspace can count on having a valid TLS pointer there.
> >>>
> >>> Happens that other operating systems follow a similar approach than 32-bit
> >>> compat mode, even for arm64: in both Windows[0] and MacOS (xnu/darwin)[1],
> >>> this register is used to hold the running CPU of the current task, hence
> >>> offering a very fast / non-syscall way for a given task to figure its
> >>> running CPU id.
> >>
> >> I don't think we should allocate TPIDRRO_EL0 for this as it precludes us
> >> using it for anything else in the future. If you want the current CPU,
> >> then I think you're better off using either rseq (which I thought could
> >> do this) or looking at reviving the vDSO work you mention (but that has
> >> unresolved limitations iirc).
> > 
> > Indeed. IIRC glibc already implements getcpu() using rseq.
> 
> Hi Will / Catalin / all,
> first of all, thanks for your prompt responses!
> 
> I'm a bit confused on what "using the register" means here.

One example is Mark's patchset from 2020 you mentioned. While they were
intended as a fast getcpu(), the idea for TPIDRRO was to hold some
offset into a data structure rather than the raw smp_processor_id() (for
future expansion, e.g. task pid). In the meantime we got rseq and never
continued that series.

TBH, I think the Wine or FEX use-case is fairly narrow to give up on
other potential uses for TPIDRRO.

> We have 2 ways of using it, IIUC:
> 
> a) Use it as it's already used today! On kernel space, this register is
> kinda free, right? Currently, it's used as the scratch, in the entry.
> But nothing prevents other usages, given that, as the final step of exit
> to EL0, it's restored to the value of the CPU id. So, AFAIU, it's fair
> use on kernel space with or without this patch.
> 
> b) Use as in "expose something else to userspace". Is it OK doing that,
> even the ARM specification mentioning
> 
> "Purpose
> Provides a location where software executing at EL1 or higher can store
> thread identifying information that is visible to software executing at
> EL0, for OS management purposes." ?
> 
> Or do you mean exposing **different information** than the pure CPU id,
> but still related with thread information?

It might be a thread or CPU specific value but without any guaranteed
ABI to be read directly. Something to be used internally by the vDSO.

> Would it be better if we guard this usage with a Kconfig? Or as Ryan
> already said, prctl flag or another idea?

No, that's bad ABI to depend on Kconfig or prctl() for different views
of this register.

> Finally, I would like to reinforce / disambiguate things here (though
> Ryan already mentioned): rseq or vDSO **are not** valid resources for
> our use case. What we are really interested is in having this register
> filled with CPU id.

Yes, and we have other parties interested in this register for more vDSO
uses. IIUC, you'd not be able to use a getcpu() vDSO implementation
either, so it won't help you.

Not really familiar with Wine but can it not implement
GetCurrentProcessorNumber() using rseq? Or do you try to handle actual
MRS directly? If the latter, any way to patch the instruction to a BRK
and handle the trap? If it's on a fast path, can you branch to a stub
that reads the rseq cpu id (offset from TPIDR) and branches back? You'd
need one stub per MRS.

-- 
Catalin

