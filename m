Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB6BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TagPhepxlNpaCdrce7q595otgY/GXSOqj932XGHk/Iw=; b=o8W/MjqfGekZj8bHtsMdUhTZT/
	31zupBqEK7mqutljmVy/qsc7gjqYWGjnFS1DvwpOxGRP3hMUYfX2zF/0rg71JfG3MpqG1NJa6isYA
	I/U/abD70jvojcXhhjQE17yfnxvhMRxzpuY2D3+FUF9Mo/5bG2RaHAfdeYXweNt2FOJUy0FA1rsbY
	i6DP/NAx1gjlDZBmuG4j2Ai1gF/Uje2Oz2sMaSLEmFsoCBCzm6bo8sdERUsPz72ldSQMuS3hu4b9X
	H4mM/iqkGcAA6ii4nWidDLz1o4MdnEGNrmBUiC1ruCno07Dp/UF1b06jovrJ4hMmK8ZTRMPY2WeDi
	/3KeHukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBLD-00000003gHG-1DaG;
	Thu, 02 Jul 2026 06:56:07 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBLA-00000003gFS-0lgJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 06:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782975364; x=1814511364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9PbSvEFuUfcy0PIfWMDM+t+H7IAPxaTJxbuKn8F0f4=;
  b=hwyy7IqsZFQFFgvcXhvp4Gf9kMwZmyNFeAhCH0FlWtlBOC9oSTJufUoQ
   RTBeWx+/dKofhvCnWyS77kUtnOw0wP7O1XbhFgFciPGb3cpqUFBja4nuT
   oFSr7JYa34C0193dnI+5odjnBodVemdjFEjn2fuliz39MFMzXZ0hBnQ60
   y62No+IGBid2uUlYd/y1L8PBkSEHC8eftZVM/n0jdf2B+XanQDe9UKQn/
   d3Vxasb2yMgcUI68uL9OcGxY+wmrsccITryeXh/myRJNdC/BpCI2yKQa4
   ajaE8Jj0gL68cqMEsWQVC3++rz8L6TGb4oObbFq60Fmt/X0kkk2cTQIkE
   A==;
X-CSE-ConnectionGUID: 28kxN03XQUO08PWDkfTpZg==
X-CSE-MsgGUID: uxCzikVfTNqtfckLsdQ/hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="224951784"
X-IronPort-AV: E=Sophos;i="6.25,143,1779116400"; 
   d="scan'208";a="224951784"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 15:55:56 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CDDF0100281E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 06:55:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 81FAD826787
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 06:55:56 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 549911802EFD;
	Thu,  2 Jul 2026 06:55:51 +0000 (UTC)
Date: Thu, 2 Jul 2026 15:55:48 +0900
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
Message-ID: <akYLdEuPXEGIZx3E@sm-arm-grace07>
References: <20260630121005.1130996-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630121005.1130996-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_235604_535523_1D9433C0 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Wei-Lin,
On Tue, Jun 30, 2026 at 01:09:59PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v2 of fixing shadow ptdump debugfs files. Unfortunately I couldn't make
> per mmu ptdump files work after all, mainly because there isn't a clean way to
> locate the specific nested mmu for each ptdump file as the nested mmus could be
> freed when the file gets opened. Therefore in this series a single file
> "shadow_page_tables" is created that dumps all valid mmus' page table
> information.
> 
> An advantage of this is that this new ptdump file have a lifetime identical to
> other ptdump files i.e. stage2_page_tables, ipa_range, etc., hence avoiding the
> dentry UAF found last time [1].
> 
> With this all ptdump files are only removed when the last kvm reference gets
> dropped and kvm_destroy_vm_debugfs() is called, in their open(), show()
> functions the nested mmu array and mmu->pgt are checked with mmu_lock held to
> prevent UAF.
> 
> Patch 1-2: Undo previous shadow ptdump implementation.
> Patch 3:   Fix a mmu->pgt UAF that happens when ptdump files are read after
>            mmu->pgt is freed.
> Patch 4-5: Preparation for the shadow page table dump file.
> Patch 6:   Implementation of the shadow page table dump file.
> 
> The fixes are tested with CONFIG_PROVE_LOCKING,
> CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.
> 
> Thanks!

Running your shadow stage 2 kselftest with bpftrace shows me that __kvm_pgtable_stage2_init()
for shadow stage 2 translation tables are built with ia_bits = 52 and
start_level = 0, but the debugfs entry for the active shadow stage 2 tables prints
out that's 3 levels. Is this fully expected?

Thanks,
Itaru.

> 
> * Changes from v1 ([2]):
> 
>   - Move from per mmu ptdump files to one file that will dump all shadow page
>     tables.
> 
> [1]: https://lore.kernel.org/kvmarm/ajty6I7ZqodP4ous@sm-arm-grace07/
> [2]: https://lore.kernel.org/kvmarm/20260623142443.648972-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (6):
>   KVM: arm64: ptdump: Remove shadow ptdump files
>   KVM: arm64: ptdump: Undo making the ptdump code mmu aware
>   KVM: arm64: ptdump: Fix UAF when mmu->pgt is freed
>   KVM: arm64: ptdump: Factor out initialization of
>     kvm_ptdump_guest_state
>   KVM: arm64: ptdump: Extract kvm_ptdump_guest_open() from canonical
>     ptdump path
>   KVM: arm64: ptdump: Introduce the shadow ptdump file
> 
>  arch/arm64/include/asm/kvm_host.h |   5 +-
>  arch/arm64/include/asm/kvm_mmu.h  |   4 -
>  arch/arm64/kvm/nested.c           |  18 +--
>  arch/arm64/kvm/ptdump.c           | 185 ++++++++++++++++++++----------
>  4 files changed, 135 insertions(+), 77 deletions(-)
> 
> -- 
> 2.43.0
> 

