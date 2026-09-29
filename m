Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C902C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0YpWFeHwuuuO8J+KMdMJU+QUfbxG9RRHw/4ci6IJFg=; b=IxjAyyx+Gg1EJKfJBDwgNj1Yzl
	2SGTSzzsrN3m8SNhtH9NzVESv/kEfWztiQPjyHZ1vhXM3vP391aFAoEE1u770LKLNW0UgKTZjZJxD
	iy3AMrXNRBe7vBASkZJdf2HnIwX6JJ7ZVFBSjkHZe51GQafFAEpvOwCoalP5AUO/8lp2biYI7aUc+
	3lPOvwJ9Nvl8kyRFUTYUg8rHQ0Nq5HI5TVZCcGQwKkaYWkH6HUSLFTcdz9PZciVcnnKJPy+3fiCLL
	NRwlBBRzHVc02g0+KwI2CT8dyLypiTW1/BAbkhoZqru2LZlXxT/0yHXRfCZsril+9bG9K7ix8LyNx
	O7L5m51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYWx-00000003l1a-0sxV;
	Tue, 29 Sep 2026 14:10:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYWv-00000003l0w-1XFU
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o0YpWFeHwuuuO8J+KMdMJU+QUfbxG9RRHw/4ci6IJFg=; b=XQ/OmoAeBiuhqRy8k/P3GwwIMZ
	bYuJHjW1/KMO/AGpmNUcDX3aeQkWgSeVdZ25R1eL+8Bk6PHrfa2djLTA0EivzwMMXrkyNpnQRMhC2
	H09RTBr78+9ZRMtU4yEvk8zsBiY+GhJ4aYuIy6Pw9Vbhl/4zUM/4HSO9ML+DHe5AbV9NUp70u/NlA
	FOATUBdM+KbQHq33AE2MhC2J3Nr+SUiwfdZCuT9SvxJXJdCc00zhxzWkmMlhKCRR/cL1XA1cOYfbq
	WmRUiIkttAtD/O19yOCMj3vjSFxL5uGHYPefdWGbBpjPCyuG0/J+X3jCO4oZABwb5Jj7xsUmkHpwD
	WZwLHnVA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYWs-00000002imB-164Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:10:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B710C152B;
	Tue, 29 Sep 2026 07:09:52 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 122183F86F;
	Tue, 29 Sep 2026 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790690996; bh=drjAjLIf0FiNjXb30u1fBy6oMHBuPaNbZ6+6LguMfEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1A79Yev43HvgLhsasL5CE3UA2ZZebu7AhW0HmQxZh77T5S/AX48u8EipgJqa2ntG
	 jUT+j65NR85Fl/c5U4vti8w404B0nAF+O2Zx+6yCHl38iZ5eXZb3WHoVKJVFhQ2JGJ
	 N5dGYi7EjKCuj14UfdM/aZtzVe09z5XgLkAtYIM8=
Date: Tue, 29 Sep 2026 16:09:50 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, suzuki.poulose@arm.com, James.Morse@arm.com,
	xuewen.yan94@gmail.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: errata: Add Cortex-A725 erratum 3821522
 workaround
Message-ID: <arvGrikAp8focp2Y@arm.com>
References: <20260929134055.3241587-1-beata.michalska@arm.com>
 <491d09a3-cfaf-45d5-9715-459e89180068@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <491d09a3-cfaf-45d5-9715-459e89180068@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_150958_659832_A7A372BC 
X-CRM114-Status: GOOD (  38.49  )
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

Hi,
On Tue, Sep 29, 2026 at 02:55:56PM +0100, Vladimir Murzin wrote:
> Hi Beata,
> 
> On 9/29/26 14:40, Beata Michalska wrote:
> > Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
> > incur a significant increment error when a CPU enters and subsequently
> > exits WFE or WFI, and may no longer track the system counter frequency.
> > 
> > The AMEVCNTR01_EL0 counter is being used as the AMU constant counter for
> > frequency invariance and CPPC FFH feedback counters. Treat the affected
> > AMU counter as unavailable by returning zero in the AMU counter paths,
> > matching the existing convention used when the counter is disabled or
> > unusable. This prevents the broken counter from being used as a reference
> > source.
> > 
> > The erratum can also affect PMUv3 users of the CNT_CYCLES event, but this
> > workaround intentionally does not change PMU event handling. Hiding or
> > rejecting the PMU event from the erratum code would change the perf-visible
> > PMU event interface, including raw event selection, and would need
> > separate PMU specific approach rather than being folded into the AMU
> > reference-counter workaround.
> > 
> > This also folds the per-erratum workarounds for ARM errata 2457168 and
> > 3821522 into a single AMU constant-counter capability, as both require
> > treating AMEVCNTR01 as unreliable and unavailable.
> > 
> 
> Can we please split this in two patches:
> 
> 1. Factor out ARM64_WORKAROUND_2457168 into generic ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> 2. Wire up Cortex-A725 erratum 3821522
Sure,
> 
> > CC: <stable@vger.kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  Documentation/arch/arm64/silicon-errata.rst |  2 ++
> >  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
> >  arch/arm64/include/asm/cpucaps.h            |  3 ++-
> >  arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
> >  arch/arm64/kernel/cpufeature.c              |  2 +-
> >  arch/arm64/kernel/topology.c                | 16 ++++++-----
> >  arch/arm64/tools/cpucaps                    |  2 +-
> >  7 files changed, 68 insertions(+), 16 deletions(-)
> > 
> > diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> > index ac3248b9f2f3b..99a1eb4b833dd 100644
> > --- a/Documentation/arch/arm64/silicon-errata.rst
> > +++ b/Documentation/arch/arm64/silicon-errata.rst
> > @@ -174,6 +174,8 @@ stable kernels.
> >  +----------------+-----------------+-----------------+-----------------------------+
> >  | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
> >  +----------------+-----------------+-----------------+-----------------------------+
> > +| ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
> > ++----------------+-----------------+-----------------+-----------------------------+
> >  | ARM            | Cortex-X1       | #1502854        | N/A                         |
> >  +----------------+-----------------+-----------------+-----------------------------+
> >  | ARM            | Cortex-X1       | #3324344        | ARM64_ERRATUM_3194386       |
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index b5a51b0ef9440..cab741a695f52 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +	bool
> > +	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
> > +	# On affected CPUs the counter may not increment at the expected rate,
> > +	# making it unreliable. As a result, AMU users should treat it as
> > +	# unavailable rather than relying on misleading counter values.
> > +
> >  config ARM64_ERRATUM_2457168
> >  	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
> >  	depends on ARM64_AMU_EXTN
> > +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> >  	default y
> >  	help
> >  	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
> > @@ -1073,6 +1081,28 @@ config ARM64_ERRATUM_2645198
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_ERRATUM_3821522
> > +	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
> > +	depends on ARM64_AMU_EXTN
> > +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +	default y
> > +	help
> > +	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
> > +
> > +	  On affected A725 cores, the CNT_CYCLES event may incur a significant
> > +	  increment error when entering and subsequently exiting WFx.
> > +	  As a result, the CNT_CYCLES may diverge from the system counter
> > +	  frequency at which it is expected to increment.
> > +	  This renders the AMU counter AMEVCNTR01, that implements CNT_CYCLES,
> > +	  being unreliable and unsuitable for use.
> > +
> > +	  Since there is no hardware workaround, reads of the affected CNT_CYCLES
> > +	  counter return 0 in the relevant paths. This causes users of the counter
> > +	  to treat it as unavailable and is functionally equivalent to firmware
> > +	  disabling the affected counter.
> > +
> > +	  If unsure, say Y.
> > +
> >  config ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> >  	bool
> >  
> > diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> > index 76350b38f0d7a..120c5dc3c11d7 100644
> > --- a/arch/arm64/include/asm/cpucaps.h
> > +++ b/arch/arm64/include/asm/cpucaps.h
> > @@ -75,8 +75,9 @@ cpucap_is_possible(const unsigned int cap)
> >  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
> >  	case ARM64_HAS_LSUI:
> >  		return IS_ENABLED(CONFIG_ARM64_LSUI);
> > +	case ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT:
> > +		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
> 
> Hmm, ARM64_WORKAROUND_2457168 has not been present here, so seeing
> ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT here is not quite expected...
Yeah, it's bit of a stretch and not necessarily needed.
Added that for completeness but it's not really required.
Can get rid of that.

---
BR
Beata
> 
> >  	}
> > -
> 
> Nitpick: unrelated change?
> 
> Thanks
> Vladimir

