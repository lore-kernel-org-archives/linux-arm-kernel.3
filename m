Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39453C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mMxPjfLJVl/h31/+Cp3kDhXDyUWB4O08tigZqQltdQ=; b=FREcRZjhkm1EuPBF+n8MHzZy0Q
	PXigvFzq5/lgL+WAHAllCrrHoCQShrFvc0aYDOVN8Devb2jzJhQk+USEVzLSb8wH+V4tW0J2yPFnf
	dYtjYJLENZoEkWv4f69ZN9X3964YzEyvF2T99T851gR9+fwk37CGsCavQ/xlYp9N0CbPkRscUunNp
	QuvaEWxRNNhMX63Kbs5E03A41esXD2ysBm8Xu3XdnqfXlsGdX5HXLMqdrF4BOsPN5/mN3giOTWG8F
	9Lr0UO/xOxQUDi5cNowbnFql/4ayIOYRoHID2XAgR18HbcwBzA3QMGTsx1EbWFnEq1Ggc/WZv5nC0
	gw2TZnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC3l-00000003lCO-1mla;
	Thu, 02 Jul 2026 07:42:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfC3i-00000003lBy-3r0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:42:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 026C8288E;
	Thu,  2 Jul 2026 00:42:01 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 307CA3F85F;
	Thu,  2 Jul 2026 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782978125; bh=DPzfo6/w+ULEP1PseWJbMhgHybRliNbNTvQjB2jqyGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c8Gtrz9D82PDtqc+9tsHSuV/kv/KTXFr41Tx6UUyVGL3vCTtsynONLT5HPkP/YK1U
	 Oj7wS2TVn5u2PM90po5FDjIMhnm72OWFfvNhkWIlD7b9OATWlEZ5fuEbE/N+7mrX3x
	 xQKn0Qcn4cCxI2+d4YZt0stj0pIe4NNXnca7JXNI=
Date: Thu, 2 Jul 2026 08:41:43 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v2 0/6] KVM: arm64: ptdump: Shadow ptdump fixes
Message-ID: <vfzn6kbhyemhkum2s72yucbgj4shn7j3g7qd3iima242yph2fr@vdihx2sfibki>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <akYLdEuPXEGIZx3E@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akYLdEuPXEGIZx3E@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_004207_074173_20A3992A 
X-CRM114-Status: GOOD (  26.35  )
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

On Thu, Jul 02, 2026 at 03:55:48PM +0900, Itaru Kitayama wrote:
> Hi Wei-Lin,
> On Tue, Jun 30, 2026 at 01:09:59PM +0100, Wei-Lin Chang wrote:
> > Hi,
> > 
> > This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
> > per mmu ptdump files work after all, mainly because there isn't a clean way to
> > locate the specific nested mmu for each ptdump file as the nested mmus could be
> > freed when the file gets opened. Therefore in this series a single file
> > "shadow_page_tables" is created that dumps all valid mmus' page table
> > information.
> > 
> > An advantage of this is that this new ptdump file have a lifetime identical to
> > other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
> > dentry UAF found last time [1].
> > 
> > With this all ptdump files are only removed when the last kvm reference gets
> > dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
> > functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
> > prevent UAF.
> > 
> > Patch 1-2: Undo previous shadow ptdump implementation.
> > Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
> >            mmu->pgt is freed.
> > Patch 4-5: Preparation for the shadow page table dump file.
> > Patch 6:   Implementation of the shadow page table dump file.
> > 
> > The fixes are tested with CONFIG_PROVE_LOCKING,
> > CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> > 
> > Thanks!
> 
> Running your shadow stage 2 kselftest with bpftrace shows me that __kvm_pgtable_stage2_init()
> for shadow stage 2 translation tables are built with ia_bits = 52 and
> start_level = 0, but the debugfs entry for the active shadow stage 2 tables prints
> out that's 3 levels. Is this fully expected?

Where is this level information you are seeing from? If it is
"stage2_level", that only reports the number of levels for the canonical
stage-2 (non nested). For nested mmus only the page tables are dumped in
nested/shadow_page_tables.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 
> > 
> > * Changes from v1 ([2]):
> > 
> >   - Move from per mmu ptdump files to one file that will dump all shadow page
> >     tables.
> > 
> > [1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
> > [2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/
> > 
> > Wei-Lin Chang (6):
> >   KVM: arm64: ptdump: Remove shadow ptdump files
> >   KVM: arm64: ptdump: Undo making the ptdump code mmu aware
> >   KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
> >   KVM: arm64: ptdump: Factor out initialization of
> >     kvm_ptdump_guest_state
> >   KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
> >     ptdump path
> >   KVM: arm64: ptdump: Introduce the shadow ptdump file
> > 
> >  arch/arm64/include/asm/kvm_host.h |   5 +-
> >  arch/arm64/include/asm/kvm_mmu.h  |   4 -
> >  arch/arm64/kvm/nested.c           |  18 +--
> >  arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
> >  4 files changed, 135 insertions(+), 77 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 

