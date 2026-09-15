Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA8C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 21:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKmja9kTQF2NF3cgjctD2o7RYTl072tWIj1yarac8Uw=; b=b2Pk9KKY3gfPykimuYxE8epojj
	9czeUxwrSDjBYw1+zp9kr0O0aC5qpmoMefK2b41oIcgCHeMAThyI2tl2dd/DA6zns0w0rVkc5FDor
	/aHYLn3MpiQy7CrEX457HDOg3YXCllhuKTrNJ75tDWYe0UKRPKhUycsA1VLnM8D9HhE9X4h/u/6no
	bDAyA6bvaOioR45EKhc1wNnfIidIgILoQhDWpZFW2A0rgEaZQcP+7sCbe4w+McAiroXBlyKQlv0Zg
	7d7Auhghfg1AnvBygV5/iMVNy1ve+6rTeQQfsx8oTN7ibj/8jEcomMsuyg5muCYvR8KQ+gu4ti57S
	s+BaIfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b2b-00000007yzB-1Ddv;
	Tue, 15 Sep 2026 21:50:13 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b2Y-00000007yyd-0Uw6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 21:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789509010; x=1821045010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBD1UvlBlRAVfbgJdKlrQtWgl0n/EsOA+/7NfYLSFM4=;
  b=R/nrpZMsZebKnmRhch5lxII2+MdkIN182ewUx9QUHf4Z2RHHVvaqEKvl
   S83G2Z6WVr45XVZMcvqSoHK27aDQel76RkTB0o6nyr0Fk09E33OpoVKIA
   agjnBrvjoUYZeqImwFSGkzN2MeZR8qM+8vY7uAIDHT11YPYRbeQw58Q5w
   SBOGWb61bsVYtWbuIewJzcTUSTsOTYvbrEKKYSgjnk7m94qHLm6T33fry
   2S+hfsHj9WahAYtbIktqQdPXLPPEPwDOWqfVc8frBA8n/AS4vbXd5rUEA
   q9QLPjrOWlTswoQ0DxhVyEsrLbfUHBSGUWhawtcHhoFABUOwxu7rALdA0
   A==;
X-CSE-ConnectionGUID: +KY8nR4pS2ClxvVj5W6P0w==
X-CSE-MsgGUID: frW9iNlbTaaEVkvZWmH6OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="242654572"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="242654572"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:50:06 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2ED1F8203FC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:50:06 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D8E0114003AC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 21:50:05 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 29FD410001C5;
	Tue, 15 Sep 2026 21:49:59 +0000 (UTC)
Date: Wed, 16 Sep 2026 06:49:57 +0900
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
Message-ID: <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_145010_654817_1C027B58 
X-CRM114-Status: GOOD (  26.39  )
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

How did you boot into L3, with KVM selftest or recrusively boot on HW?

Thanks,
Itaru.

> 
> Series based on v7.3-rc3 + Marc's nested mmu lifecycle fixes [3].
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

