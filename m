Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33535C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISFvHQZ3NKeevHYQF5oxatYw0rB2ERfN9s0yXu6oE8I=; b=bqWcBrLZPNJEc+2JEjCKI0HmUK
	gcuKYIZkXOc6j+bKz4DWECjjwP71JH+iy2xSlwIcyhgvtJBZ580BXcM1DaJCjVmId521OXkLv1Eyx
	6EKXMnlPfDv3j+L2kFCbBYHraHCJ29b9YxtDpI6OObprx64MLdYQHZPf7Hg87mjbXmCndtjlSOrP+
	rJApdV98qTWXqNUPlPX5h8UwamOYQp5v4MgmBWqGsKriVaxYL+d3v07iYAjBq0Zi2LLDZEMy1FzIO
	RWimcI0XxmTUyE8utn+42/atO5IwgnPDr0kta1wA8K+wEYl3LSZI6USwcnynTDlllm/LdseQTZXvr
	/W/NqMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQR5-00000005iS8-3PZB;
	Thu, 02 Jul 2026 23:03:11 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfQR2-00000005iR8-0GLL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783033388; x=1814569388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SzSr1oCqgTulCTXhvORBDKf3m8KOYxNNU1XaE1bIAds=;
  b=MTYUlqU749QFj0GFdn6ZTtNQtTxZTEExx/JpFCTOFxbcpROXYXDX0jNa
   oaoOjXqarC4WfeKIz/UKLhkW3awEam1pBVGyrGRwKmUxXSywp7w4AoFAX
   g2KFeapb3QeVl0cAH0ycR5mkblkzcpL9zvgeEvLPjBZj+xnoj2ncSJ7m0
   xtjlrbGp/41Ah5BSnOOuCl5MyoUCGea1UOaqwVM1paj7pKDcGpgjO5QSC
   oJ7/zrsd9XKDOQYrJCPWJ904MaOj64kwldKN+eb90nCF6hzMCzjUOgbty
   mpQO0+9g6gsEtTT1lOLqBOw2gDF/6afJW8ZUUJ6Gg8mT6sYjrKuK8u2Nc
   w==;
X-CSE-ConnectionGUID: zWwkUpifRdKgZdzH38PjtA==
X-CSE-MsgGUID: AowYsh2cQoe0v/INp7uBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="232294263"
X-IronPort-AV: E=Sophos;i="6.25,144,1779116400"; 
   d="scan'208";a="232294263"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:03:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E0D9BCA69
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 23:03:04 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8894318ABD27
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 23:03:04 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 924EA40261C;
	Thu,  2 Jul 2026 23:02:59 +0000 (UTC)
Date: Fri, 3 Jul 2026 08:02:56 +0900
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
Message-ID: <akbuIDmd_zH9_m6K@sm-arm-grace07>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
 <akYLdEuPXEGIZx3E@sm-arm-grace07>
 <vfzn6kbhyemhkum2s72yucbgj4shn7j3g7qd3iima242yph2fr@vdihx2sfibki>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vfzn6kbhyemhkum2s72yucbgj4shn7j3g7qd3iima242yph2fr@vdihx2sfibki>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_160308_747593_CA93AFDD 
X-CRM114-Status: GOOD (  31.45  )
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

On Thu, Jul 02, 2026 at 08:41:43AM +0100, Wei-Lin Chang wrote:
> On Thu, Jul 02, 2026 at 03:55:48PM +0900, Itaru Kitayama wrote:
> > Hi Wei-Lin,
> > On Tue, Jun 30, 2026 at 01:09:59PM +0100, Wei-Lin Chang wrote:
> > > Hi,
> > > 
> > > This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
> > > per mmu ptdump files work after all, mainly because there isn't a clean way to
> > > locate the specific nested mmu for each ptdump file as the nested mmus could be
> > > freed when the file gets opened. Therefore in this series a single file
> > > "shadow_page_tables" is created that dumps all valid mmus' page table
> > > information.
> > > 
> > > An advantage of this is that this new ptdump file have a lifetime identical to
> > > other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
> > > dentry UAF found last time [1].
> > > 
> > > With this all ptdump files are only removed when the last kvm reference gets
> > > dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
> > > functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
> > > prevent UAF.
> > > 
> > > Patch 1-2: Undo previous shadow ptdump implementation.
> > > Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
> > >            mmu->pgt is freed.
> > > Patch 4-5: Preparation for the shadow page table dump file.
> > > Patch 6:   Implementation of the shadow page table dump file.
> > > 
> > > The fixes are tested with CONFIG_PROVE_LOCKING,
> > > CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> > > 
> > > Thanks!
> > 
> > Running your shadow stage 2 kselftest with bpftrace shows me that __kvm_pgtable_stage2_init()
> > for shadow stage 2 translation tables are built with ia_bits = 52 and
> > start_level = 0, but the debugfs entry for the active shadow stage 2 tables prints
> > out that's 3 levels. Is this fully expected?
> 
> Where is this level information you are seeing from? If it is
> "stage2_level", that only reports the number of levels for the canonical
> stage-2 (non nested). For nested mmus only the page tables are dumped in
> nested/shadow_page_tables.

Yes I know. The initial stage 2 translation table structure information is obtained by 
instrumenting the kernel using eBPF fexit to __kvm_pgtable_stage2_init().

Since you're correctly loopin over nested_mmus array, and the output is
correctly shown using the kvm_pgtable information via the kvm_s2_mmu for
them, I am confused at this moment.

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
> > > * Changes from v1 ([2]):
> > > 
> > >   - Move from per mmu ptdump files to one file that will dump all shadow page
> > >     tables.
> > > 
> > > [1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
> > > [2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/
> > > 
> > > Wei-Lin Chang (6):
> > >   KVM: arm64: ptdump: Remove shadow ptdump files
> > >   KVM: arm64: ptdump: Undo making the ptdump code mmu aware
> > >   KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
> > >   KVM: arm64: ptdump: Factor out initialization of
> > >     kvm_ptdump_guest_state
> > >   KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
> > >     ptdump path
> > >   KVM: arm64: ptdump: Introduce the shadow ptdump file
> > > 
> > >  arch/arm64/include/asm/kvm_host.h |   5 +-
> > >  arch/arm64/include/asm/kvm_mmu.h  |   4 -
> > >  arch/arm64/kvm/nested.c           |  18 +--
> > >  arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
> > >  4 files changed, 135 insertions(+), 77 deletions(-)
> > > 
> > > -- 
> > > 2.43.0
> > > 

