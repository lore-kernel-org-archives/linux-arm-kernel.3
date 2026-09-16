Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D702CC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dF++227s426dvSNFc818Auu+DPoHM/RnvGPblP6+Cwg=; b=ooSXJUTwtpGmzuBIYDB0R+pbbc
	abr+mfkSsbmTqIegrU98LMy+9ranMAZIauxH1ict6aKT/TMmzhg3wI8rMMN9wYMXqnajRvyDbMIXU
	72cAk18Bb65S2VY1uFN4M6CjJ27dEkO8PUtbEJbAlgIVcg0YyK5ZIjcD4kFFkcIKLwD3OblqZ9omw
	AQByh8ECVr6ArsG3/ik6b5g1AHMhRJBrNazfeugPCmGgMtFVt40+VACyO78nYL4PN+Bgy8dPRaCx0
	1meSrTT+qdn3Dv8VF25Xi4F/cNW8psKqvQH/a+dFKEbYpRSx5Y7BvlW+eqUuyO8fBBIyRuRXuw874
	bobf8eLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hit-00000008L06-0BFw;
	Wed, 16 Sep 2026 04:58:19 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hip-00000008Kzm-2jLb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789534695; x=1821070695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SnAcro5Dui87SihtGm652xAlG5XwDxA05uuCThf6Qp4=;
  b=QXDKNpb9mzgYKH76Iu2S3ysReBd1CCr+O3qFruHmYBH3EwRJiG28iwu0
   OINTv3Tqh9IXnjyE3bIIXJ2GvahBzEfQRxabu2kXi0MtX/pQIbcjmTWKS
   P4tWntamTKy5pVsQI8XGIx2M+raZy6gz7l2JipCkjEMCj+CFRATxBJ8v+
   Xk6JQk6/+S394z7wV6cbay6o1u2OFX5GAVDU8gMPtxp5i38LF4eQ3jfcM
   LFkJdcJ9GmzdcKWSktWtpi+g565a5WS4HXqp8a0oRhHDKLJ0Jq3Uk6S4X
   Td3R5bLP8pmnhOKlDJ/iIudJhcy1884HOFzl5da02oBetHR4sIH/X2MGL
   A==;
X-CSE-ConnectionGUID: 5NqHYmkkS0SnFCYsYdWi1A==
X-CSE-MsgGUID: UZYg2bKJQgSL7ZpqMWHyuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="234108883"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="234108883"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:58:12 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B412742A33D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:58:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 63B801C00148
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:58:12 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 497CD100019E;
	Wed, 16 Sep 2026 04:58:06 +0000 (UTC)
Date: Wed, 16 Sep 2026 13:58:03 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <aqoh27cSs5gMHeAL@sm-arm-grace07>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_215816_221589_11298FCE 
X-CRM114-Status: GOOD (  26.97  )
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

On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.
> 
> This version fixes a few issues, and adds Marc's space optimization
> for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> 
> Tested by booting L3, and running in-kernel targetted tests described
> in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> carry them over since some bugs fixed in v6 are non-obvious. Some
> retest would be much appreciated!
> 
> Series based on v7.3-rc3 + Marc's nested mmu lifecycle fixes [3].

Observed on QEMU (accel tcg) only, but I saw:

[ 1812.052752] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1630
[ 1812.052896] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 596, name: shadow_stage2

The kernel is built on top of Marc's fix and your version six series, but
the fix for debugfs will be posted later?

Your hello_nested and shadow_stage2 ran without an issue.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> * Changes from v5 [4]:
> 
>   - Align the addresses down to the mapping size when recording the
>     guest s2 mappings. s2fd->fault_ipa isn't necessarily PAGE_SIZE aligned.
> 
>   - Record guest s2 mappings even when page table maps return -EAGAIN.
>     kvm_pgtable_stage2_map() can create mappings while returning -EAGAIN.
>     For example, a 2M block map (A) could race with a 4K page map (B):
>     1. (A) maps the 2M block in kvm_pgtable_visitor_cb()
>     2. (B) breaks that block into a table and maps 4K
>     3. (A) reloads and finds the table after kvm_pgtable_visitor_cb(),
>        then descends into it.
>     4. (A) maps some 4K, but before it finishes reads entry mapped by (B).
>     5. (A) returns -EAGAIN although it had mapped a few pages.
>     In this case, we don't know what subrange is mapped, just track the whole
>     requested mapping range.
> 
>   - Don't remove tracked mappings from the interval trees if they only
>     partially overlap the removal range. Because of the previous bullet point
>     we can have a 4K shadow mapping tracked as a 2M range in the interval
>     trees. It would be wrong to remove the 2M range when a guest TLBI doesn't
>     touch the 4K mapped.
> 
>   - Check mmu->pgt during mmu unmap notifier, as it could race against
>     MMU teardown.
> 
>   - Make guest_s2_tracking_destroy() canonical mmu only. We simply don't
>     need to detach the nodes from the nested mmus' trees. Freeing them
>     during canonical mmu's teardown is enough.
> 
> Thanks!
> 
> [1]: https://lore.kernel.org/kvmarm/86h5jv7qrd.wl-maz@kernel.org/
> [2]: https://lore.kernel.org/kvmarm/gerjpm62a2gszzggc6vuai22bf3prfquvfsp7ueumps7vz2ev3@odlmovaklg2b/
> [3]: https://lore.kernel.org/kvmarm/20260911162203.1919330-1-maz@kernel.org/
> [4]: https://lore.kernel.org/kvmarm/20260810205038.118843-1-weilin.chang@arm.com/
> 
> Marc Zyngier (1):
>   KVM: arm64: nv: Drop kvm_s2_mmu pointer from kvm_guest_s2_mapping
> 
> Wei-Lin Chang (6):
>   KVM: arm64: Use a variable for the canonical IPA in kvm_s2_fault_map()
>   KVM: arm64: nv: Introduce guest stage-2 tracking structures
>   KVM: arm64: nv: Track guest stage-2 mapping creation
>   KVM: arm64: nv: Track guest stage-2 mapping removal
>   KVM: arm64: nv: Avoid full shadow stage-2 unmap
>   KVM: arm64: Refactor kvm_unmap_gfn_range() with common variables
> 
>  arch/arm64/include/asm/kvm_host.h   |  31 +++++-
>  arch/arm64/include/asm/kvm_nested.h |   7 ++
>  arch/arm64/kvm/mmu.c                | 109 +++++++++++++++++++---
>  arch/arm64/kvm/nested.c             | 140 +++++++++++++++++++++++++++-
>  4 files changed, 269 insertions(+), 18 deletions(-)
> 
> -- 
> 2.43.0
> 

