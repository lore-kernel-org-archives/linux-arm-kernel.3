Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2ADF4485A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsDaaZpv5n8qCkNzSvqAjTBWRAYGmVq1A4ZZMvBAgtQ=; b=EsquLX0lVjdbJ8Ly0EZuMaxQif
	VtcLihD5dq2ez1YwSGw/TBEUv5PRXQOABJaCohaVGC2NvW5Gylw9jlBZwgCRCxNkqtirMgMIMN4Gv
	np5Md2MhiWeJUb0O/nhLF9ilJTOpfTb/a/Adi9ah0o0BQ3qsueyHHXb9r+Z01ywXMXQnEnTv20mEH
	KtbDd56bU2diiw+lLJVKkXxB0bk2RkGs9+MfPfkkt5YYnJO0RZcHGs4qfJQN2TbFVimacvpTtu2Oc
	Flw9Q1vrzQfx993Uz21EIlEOBayfX3EetHDXS+HcuBasmfPD4OB+tZPED1EIlQpn0YolpfB0cMtyR
	w1VztxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBsJ-0000000CJgS-0wze;
	Fri, 10 Apr 2026 13:26:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBsH-0000000CJgI-3qwv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:26:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 028536111A;
	Fri, 10 Apr 2026 13:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FB7C19421;
	Fri, 10 Apr 2026 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775827576;
	bh=jUlRnma1xJa8+nwYl3V3dOclO0avaVVMiv4EZmu+y9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkG8wasp5CWzpUJDwopaAscES9R3JseIjXRorRp+swZzYlpCRH4AsfoP/799kxCdE
	 Yw+7Eku+oLyW4ee3eF5CD9VQIXWHp5iLY6PMoR2nVCJoTEpwqnthavC8K6vr556AGy
	 xQeOoym3vfEEPmO9k0bKxcO8J8SEmJ2/cEjNYYisLC/3/8+cBeJsYulODdr5BFBwIf
	 v+101L2LSyHqItg8cdBEGYffdoCihq5/QqBgErPXpjTMpSPvMl4kjUFY0VjKw6rP4A
	 6E13a3xrAuxXzU87CPwP28nA73SRMqcdQQ3eBXKRYVsJeISlaKzCMLa3KQIrLWon0k
	 /aXztOJC6y1Fg==
Date: Fri, 10 Apr 2026 14:26:12 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 4/4] arm64: errata: Work around early CME DVMSync
 acknowledgement
Message-ID: <adj6c84nm0K1S228@willie-the-truck>
References: <20260407102848.2266988-1-catalin.marinas@arm.com>
 <20260407102848.2266988-5-catalin.marinas@arm.com>
 <adjohQBfrHVc1HIh@willie-the-truck>
 <adjzVTjEOz7DGmW4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjzVTjEOz7DGmW4@arm.com>
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

On Fri, Apr 10, 2026 at 01:55:49PM +0100, Catalin Marinas wrote:
> On Fri, Apr 10, 2026 at 01:09:41PM +0100, Will Deacon wrote:
> > On Tue, Apr 07, 2026 at 11:28:44AM +0100, Catalin Marinas wrote:
> > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > index 489554931231..4c328b7c79ba 100644
> > > --- a/arch/arm64/kernel/process.c
> > > +++ b/arch/arm64/kernel/process.c
> > > @@ -26,6 +26,7 @@
> > >  #include <linux/reboot.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/init.h>
> > > +#include <linux/cpumask.h>
> > >  #include <linux/cpu.h>
> > >  #include <linux/elfcore.h>
> > >  #include <linux/pm.h>
> > > @@ -339,8 +340,41 @@ void flush_thread(void)
> > >  	flush_gcs();
> > >  }
> > >  
> > > +#ifdef CONFIG_ARM64_ERRATUM_4193714
> > > +
> > > +static void arch_dup_tlbbatch_mask(struct task_struct *dst)
> > > +{
> > > +	/*
> > > +	 * Clear the inherited cpumask with memset() to cover both cases where
> > > +	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
> > > +	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
> > > +	 */
> > > +	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
> > > +		memset(&dst->tlb_ubc.arch.cpumask, 0,
> > > +		       sizeof(dst->tlb_ubc.arch.cpumask));
> > 
> > nit: use cpumask_clear() instead?
> 
> I tried to explain in the comment above. The memset() is on purpose to
> avoid #ifdef CPUMASK_OFFSTACK. When enabled, cpumask_var_t is a pointer
> and we want it set to NULL (for later lazy allocation) rather than
> clearing the parent's cpumask. I had the diff below initially but it
> looked uglier. Or we make the erratum dependent on !CPUMASK_OFFSTACK but
> it won't get compile coverage with defconfig.

Sorry, my mistake. I was focussing on the mm_cpumask() changes since v3
(which always seem to be embedded as part of the 'mm_struct' allocation)
and didn't realise that this memset() is operating on the TLB batch
cpumask.

So it looks like v5 is the charm :)

Will

