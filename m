Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C7EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=raAhIfb6mrkEa9otig6G+/EvzWwCRX34bqCxwuMdJNA=; b=Flg7oLDRi5xasDcOkQA4nnvw4W
	ZIDt3yqU7EtCcf/mMjXrSE1GEDsLUlVyIAh7m/TGhHIpXWvhyb/UiTQFxkxuQEvFnL1quapQsvyP1
	jSKq8GzZ/GAEBXBjpxNHrYcZuehBrlu/I77kOw2sEcIvlgB+babVdnk6g9Lbq/BAUapTRAU8UQaLf
	v53AgxVdLqeCYKBHD8gcnQIULVAaWTCo1TelB8pv7jIZYjHVWNp9o0qePufPzQiA2fZoZE/RI+z2J
	XPdzWQvoLbcWtKSWvm290CbHqtebNr1gtdMx0OCI36EKIOLKTorUzUXtBmRzXolHfBC/UgSDL9dSw
	qqgUGoew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5dI-00000004L7E-04vm;
	Fri, 10 Jul 2026 07:26:48 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5dE-00000004L6r-2L8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783668404; x=1815204404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zznoagUEBRjA/KDqLgxm31OiKTSDk9+kUK0j3IfcVlQ=;
  b=OuQc5ILMjmp9fpGvNg/gU/XbiCPGPy55DZvHr/HP1o8JCYIQ9MXV1grq
   sRVBXDf30EE/PEhrWeAHAluGFRT4yXSrcupqJ2OEDQTYVRAptCl9eYfCQ
   ItEAmpfc1Z8gMeuw2QyRH0gPPOVQsbae+16yEfiYBAs1r5lYl+Ol26q8p
   FI67eh/WPl9Qbeaoo2fdfqL75d+dLdMvc0EMEtvD2os2+VacBJwFLqIFC
   fsrJwE4qSBFCHuYT9Rue8SCpHEzgkzSOEWWUOjetwSz5Lh4blduxGJK/t
   XlSWJrRSfD6/q4NtXkXtorzgYTrxQAYYNzwoeMRIfx2LBECQ8BuMzMztj
   w==;
X-CSE-ConnectionGUID: bfi/An0LS6SXtS192fLHjA==
X-CSE-MsgGUID: bRhYtFLrRf6oVCgVO+N0BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="224638172"
X-IronPort-AV: E=Sophos;i="6.25,154,1779116400"; 
   d="scan'208";a="224638172"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 16:26:42 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 046F0406EEF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 07:26:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A56F41800D52
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 07:26:41 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 628291802EF7;
	Fri, 10 Jul 2026 07:26:36 +0000 (UTC)
Date: Fri, 10 Jul 2026 16:26:32 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: ptdump: Shadow ptdump fixes
Message-ID: <alCeqFsNubTAt-YY@sm-arm-grace07>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <akYLdEuPXEGIZx3E@sm-arm-grace07>
 <vfzn6kbhyemhkum2s72yucbgj4shn7j3g7qd3iima242yph2fr@vdihx2sfibki>
 <akbuIDmd_zH9_m6K@sm-arm-grace07>
 <nzvizmyxj4otyo5itl425vdflimp6pnkuwo4qtwzzsbjobhzco@ygxydualln47>
 <ak9PHJJzjliTeiFB@sm-arm-grace07>
 <m637wmil3r2bnhlw2mbj5xy5ahucbykk7b4uc6yfcz3c3dfkkj@z4hkns5sieds>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m637wmil3r2bnhlw2mbj5xy5ahucbykk7b4uc6yfcz3c3dfkkj@z4hkns5sieds>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_002644_927880_B0AAC8A0 
X-CRM114-Status: GOOD (  50.03  )
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

On Fri, Jul 10, 2026 at 07:43:46AM +0100, Wei-Lin Chang wrote:
> On Thu, Jul 09, 2026 at 04:34:52PM +0900, Itaru Kitayama wrote:
> > On Fri, Jul 03, 2026 at 11:24:53AM +0100, Wei-Lin Chang wrote:
> > > On Fri, Jul 03, 2026 at 08:02:56AM +0900, Itaru Kitayama wrote:
> > > > On Thu, Jul 02, 2026 at 08:41:43AM +0100, Wei-Lin Chang wrote:
> > > > > On Thu, Jul 02, 2026 at 03:55:48PM +0900, Itaru Kitayama wrote:
> > > > > > Hi Wei-Lin,
> > > > > > On Tue, Jun 30, 2026 at 01:09:59PM +0100, Wei-Lin Chang wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
> > > > > > > per mmu ptdump files work after all, mainly because there isn't a clean way to
> > > > > > > locate the specific nested mmu for each ptdump file as the nested mmus could be
> > > > > > > freed when the file gets opened. Therefore in this series a single file
> > > > > > > "shadow_page_tables" is created that dumps all valid mmus' page table
> > > > > > > information.
> > > > > > > 
> > > > > > > An advantage of this is that this new ptdump file have a lifetime identical to
> > > > > > > other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
> > > > > > > dentry UAF found last time [1].
> > > > > > > 
> > > > > > > With this all ptdump files are only removed when the last kvm reference gets
> > > > > > > dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
> > > > > > > functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
> > > > > > > prevent UAF.
> > > > > > > 
> > > > > > > Patch 1-2: Undo previous shadow ptdump implementation.
> > > > > > > Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
> > > > > > >            mmu->pgt is freed.
> > > > > > > Patch 4-5: Preparation for the shadow page table dump file.
> > > > > > > Patch 6:   Implementation of the shadow page table dump file.
> > > > > > > 
> > > > > > > The fixes are tested with CONFIG_PROVE_LOCKING,
> > > > > > > CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> > > > > > > 
> > > > > > > Thanks!
> > > > > > 
> > > > > > Running your shadow stage 2 kselftest with bpftrace shows me that __kvm_pgtable_stage2_init()
> > > > > > for shadow stage 2 translation tables are built with ia_bits = 52 and
> > > > > > start_level = 0, but the debugfs entry for the active shadow stage 2 tables prints
> > > > > > out that's 3 levels. Is this fully expected?
> > > > > 
> > > > > Where is this level information you are seeing from? If it is
> > > > > "stage2_level", that only reports the number of levels for the canonical
> > > > > stage-2 (non nested). For nested mmus only the page tables are dumped in
> > > > > nested/shadow_page_tables.
> > > > 
> > > > Yes I know. The initial stage 2 translation table structure information is obtained by 
> > > > instrumenting the kernel using eBPF fexit to __kvm_pgtable_stage2_init().
> > > > 
> > > > Since you're correctly loopin over nested_mmus array, and the output is
> > > > correctly shown using the kvm_pgtable information via the kvm_s2_mmu for
> > > > them, I am confused at this moment.
> > > 
> > > Two things here:
> > > 
> > > Firstly ia_bits being 52 is not expected to me, as I didn't change the
> > > VM's IPA size via KVM_VM_TYPE_ARM_IPA_SIZE in the selftest, to me I
> > > would expect ia_bits to be 40 (the default). Start level being 0 looks
> > > normal.
> > 
> > Instrumenting the ptdump code you're proposing I see the shadow stage 2
> > translation tables are constructed with the max 52-bit IPA; irrespective
> > of the IPA bits set in the init_s2_mmu() helper for the guest hypervisor
> > setup in the selftest, I am guessing here to me fixed? 52-bit IPA size 
> > because it's awkward if nestd guest's IPA size is larger than the shadow 
> > stage 2's IPA size.
> 
> Sorry, I got it wrong. It is correct that shadow stage-2 translation
> tables are constructed with 52-bit IPA, irrespective of what L1 sets in
> init_s2_mmu(). This is because L1 is free to decide what memory map it
> exposes to its guest, so we only constrain it with the PARange exposed
> to the guest. Please see the comments in init_nested_s2_mmu().

Thanks for the cofirmation, yes on QEMU the "max" CPU model that's what
the PARange exposes, bpftrace was showing that too.

> 
> > 
> > I confirmed using the __vm_create() helper with various guest modes
> > supported that canonical stage 2's "ipa_range" changes according to the 
> > guest (L1) PA size so I wonder if it is a good idea to create something like
> > shadow_ipa_range and shadow_stage2_levels files under nested directoy.
> 
> I guess shadow_ipa_range and shadow_stage2_levels can be added if there
> are explicit demand for it. Although right now they aren't too difficult
> to infer from the PARange exposed to the guest.

Surely, it's up to you. If you kindly take my Tested-by: tag, that'd be
great the kernel I used for this series is the latest kvmarm/fixes, with
your series applied I can see the mapping information extracted by
walking the shadow stage 2 translation tables.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> Thanks,
> Wei-Lin Chang
> 
> > 
> > Thanks,
> > Itaru.
> > 
> > > 
> > > Second thing is I still can't get what you are confused about, if it's
> > > not about the first point. Note that the "3" in ptdump means it is a
> > > level 3 mapping, not saying the page tables are using 3 levels.
> > > 
> > > Happy to discuss more if you clarify. I'll also check the ia_bits when I
> > > get to it.
> > > 
> > > Thanks,
> > > Wei-Lin Chang
> > > 
> > > > 
> > > > Thanks,
> > > > Itaru.
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Wei-Lin Chang
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > Itaru.
> > > > > > 
> > > > > > > 
> > > > > > > * Changes from v1 ([2]):
> > > > > > > 
> > > > > > >   - Move from per mmu ptdump files to one file that will dump all shadow page
> > > > > > >     tables.
> > > > > > > 
> > > > > > > [1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
> > > > > > > [2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/
> > > > > > > 
> > > > > > > Wei-Lin Chang (6):
> > > > > > >   KVM: arm64: ptdump: Remove shadow ptdump files
> > > > > > >   KVM: arm64: ptdump: Undo making the ptdump code mmu aware
> > > > > > >   KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
> > > > > > >   KVM: arm64: ptdump: Factor out initialization of
> > > > > > >     kvm_ptdump_guest_state
> > > > > > >   KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
> > > > > > >     ptdump path
> > > > > > >   KVM: arm64: ptdump: Introduce the shadow ptdump file
> > > > > > > 
> > > > > > >  arch/arm64/include/asm/kvm_host.h |   5 +-
> > > > > > >  arch/arm64/include/asm/kvm_mmu.h  |   4 -
> > > > > > >  arch/arm64/kvm/nested.c           |  18 +--
> > > > > > >  arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
> > > > > > >  4 files changed, 135 insertions(+), 77 deletions(-)
> > > > > > > 
> > > > > > > -- 
> > > > > > > 2.43.0
> > > > > > > 

