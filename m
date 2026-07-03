Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB1CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHNWeboVzu/sz1+mYHlMeCUdF3GLKwe2wqp3veycPUs=; b=wzrt3sCwBmFFouUBXGX7m67qIg
	mFOgajLZ8SI77mADSTG83s+KM47ZJrtozVWJ0pMrnhUWJD0NahStqdjBknAELeYqJAGPj1/IUVdIt
	Cl7pGlWZxQSsj/aMoBdKzws1fNgh39ed1RfVWHm21d98IWAnf0zJMnhTelSYxWY86yrfkDBl11XAA
	Mp/mQ32ieJKQQKQ601jbmJM7PHn/DLD6UTXOQzICXmSkNyo6BUWzqtIkO8UPc2Qz1lYe1+LWkFjBI
	Ay+pJYnwsf2cDiLt7CDj8rhDBGMzOmGRP+8vVwO+Cioyw0rRmJKXvDwj77hcMUXhC/6XcMpk6DkLs
	oe7EUq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb5B-00000006avC-0pSJ;
	Fri, 03 Jul 2026 10:25:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfb59-00000006auH-2AoC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:25:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 795301F91;
	Fri,  3 Jul 2026 03:25:10 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77A5F3F905;
	Fri,  3 Jul 2026 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783074314; bh=ZQ7CAuTPM6Tf9+DTaYp2vlX5tPQhRYzc+U6LC/OQ2LQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8n/v18VXUB34szM/yrAGV780z+7NVyAa8tqQWd3++dvpUiIZe42DsrEhhvoop3Hv
	 4gQVbD147+LYcsrJQr1Ld/MG53+LJxvWo91A9QowhOFgTtIC1o6NvjezyDBVRLOb6s
	 L43MNKKcgmzotD72h/Y//bM9/I0DQk1MT0DLLMN0=
Date: Fri, 3 Jul 2026 11:24:53 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: ptdump: Shadow ptdump fixes
Message-ID: <nzvizmyxj4otyo5itl425vdflimp6pnkuwo4qtwzzsbjobhzco@ygxydualln47>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <akYLdEuPXEGIZx3E@sm-arm-grace07>
 <vfzn6kbhyemhkum2s72yucbgj4shn7j3g7qd3iima242yph2fr@vdihx2sfibki>
 <akbuIDmd_zH9_m6K@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akbuIDmd_zH9_m6K@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_032515_638594_960DB64E 
X-CRM114-Status: GOOD (  35.34  )
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

On Fri, Jul 03, 2026 at 08:02:56AM +0900, Itaru Kitayama wrote:
> On Thu, Jul 02, 2026 at 08:41:43AM +0100, Wei-Lin Chang wrote:
> > On Thu, Jul 02, 2026 at 03:55:48PM +0900, Itaru Kitayama wrote:
> > > Hi Wei-Lin,
> > > On Tue, Jun 30, 2026 at 01:09:59PM +0100, Wei-Lin Chang wrote:
> > > > Hi,
> > > > 
> > > > This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
> > > > per mmu ptdump files work after all, mainly because there isn't a clean way to
> > > > locate the specific nested mmu for each ptdump file as the nested mmus could be
> > > > freed when the file gets opened. Therefore in this series a single file
> > > > "shadow_page_tables" is created that dumps all valid mmus' page table
> > > > information.
> > > > 
> > > > An advantage of this is that this new ptdump file have a lifetime identical to
> > > > other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
> > > > dentry UAF found last time [1].
> > > > 
> > > > With this all ptdump files are only removed when the last kvm reference gets
> > > > dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
> > > > functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
> > > > prevent UAF.
> > > > 
> > > > Patch 1-2: Undo previous shadow ptdump implementation.
> > > > Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
> > > >            mmu->pgt is freed.
> > > > Patch 4-5: Preparation for the shadow page table dump file.
> > > > Patch 6:   Implementation of the shadow page table dump file.
> > > > 
> > > > The fixes are tested with CONFIG_PROVE_LOCKING,
> > > > CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> > > > 
> > > > Thanks!
> > > 
> > > Running your shadow stage 2 kselftest with bpftrace shows me that __kvm_pgtable_stage2_init()
> > > for shadow stage 2 translation tables are built with ia_bits = 52 and
> > > start_level = 0, but the debugfs entry for the active shadow stage 2 tables prints
> > > out that's 3 levels. Is this fully expected?
> > 
> > Where is this level information you are seeing from? If it is
> > "stage2_level", that only reports the number of levels for the canonical
> > stage-2 (non nested). For nested mmus only the page tables are dumped in
> > nested/shadow_page_tables.
> 
> Yes I know. The initial stage 2 translation table structure information is obtained by 
> instrumenting the kernel using eBPF fexit to __kvm_pgtable_stage2_init().
> 
> Since you're correctly loopin over nested_mmus array, and the output is
> correctly shown using the kvm_pgtable information via the kvm_s2_mmu for
> them, I am confused at this moment.

Two things here:

Firstly ia_bits being 52 is not expected to me, as I didn't change the
VM's IPA size via KVM_VM_TYPE_ARM_IPA_SIZE in the selftest, to me I
would expect ia_bits to be 40 (the default). Start level being 0 looks
normal.

Second thing is I still can't get what you are confused about, if it's
not about the first point. Note that the "3" in ptdump means it is a
level 3 mapping, not saying the page tables are using 3 levels.

Happy to discuss more if you clarify. I'll also check the ia_bits when I
get to it.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > 
> > Thanks,
> > Wei-Lin Chang
> > 
> > > 
> > > Thanks,
> > > Itaru.
> > > 
> > > > 
> > > > * Changes from v1 ([2]):
> > > > 
> > > >   - Move from per mmu ptdump files to one file that will dump all shadow page
> > > >     tables.
> > > > 
> > > > [1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
> > > > [2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/
> > > > 
> > > > Wei-Lin Chang (6):
> > > >   KVM: arm64: ptdump: Remove shadow ptdump files
> > > >   KVM: arm64: ptdump: Undo making the ptdump code mmu aware
> > > >   KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
> > > >   KVM: arm64: ptdump: Factor out initialization of
> > > >     kvm_ptdump_guest_state
> > > >   KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
> > > >     ptdump path
> > > >   KVM: arm64: ptdump: Introduce the shadow ptdump file
> > > > 
> > > >  arch/arm64/include/asm/kvm_host.h |   5 +-
> > > >  arch/arm64/include/asm/kvm_mmu.h  |   4 -
> > > >  arch/arm64/kvm/nested.c           |  18 +--
> > > >  arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
> > > >  4 files changed, 135 insertions(+), 77 deletions(-)
> > > > 
> > > > -- 
> > > > 2.43.0
> > > > 

