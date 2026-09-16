Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C610C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj+y6ofO60whmz2vCvegBW+tgN8yCIqpGPSKGsummcQ=; b=Nr/duIz9c9VeOrPHIYAGQpHoz7
	ZvJ6KdhB8yv+5NhMCzBSXGO2jCxY+7W/VfIQ/AyAqyDCUoo4jqRhDUp69zZOWvHdcgh+u7a2noQpj
	Cn98gnk4VgZWsIqGc0ecgRZnE78cuQY/Hq/TfqHrtD6//I5S1QQOQwi6ys9pxTKGBNXKf9iUp6pWD
	ycf1WqWvcmkLLDnmm3VPU0nBL9kD5hfoXHbBcWpi0d0LXpD7Qnj509tQ1HfoTypjsuccTJJTXtjVl
	278MfSl7cpJZSqLI9ceNep9fASjAr503EO5mH28/I7160yKzQwPLo8ck8481Pb2Wg0nyQ7/bUUdS9
	4WMpDyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qC0-00000009MDv-0JlO;
	Wed, 16 Sep 2026 14:00:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qBw-00000009MDK-3LX9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:00:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71178152B;
	Wed, 16 Sep 2026 07:00:47 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (unknown [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B58283F86F;
	Wed, 16 Sep 2026 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789567251; bh=X32TptwEZT8cNEFqLMIyufpmRkecQmhziZDP7tUEcFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KvTp87F375+25OWbtr4lzE6MhuYnnz7yrLqjKKabM/qIP0yCdpHFAvjv127/mHkyw
	 zNK/AxgFUI+K0zz4un8xqXs2VJW/1sOtg4tVYTyk/wM+QBJ/JRcUWauDC6RwWYk5iI
	 xzgbpyo1Dv8iqh6vr2jO7nw9f6phwndr1/BSrUOI=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on migration
Date: Wed, 16 Sep 2026 15:00:46 +0100
Message-ID: <aqqhDs3NyjtkZzXK@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqneWnlsdpocLIl6@kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com> <20260901171558.2674031-6-leo.bras@arm.com> <aqneWnlsdpocLIl6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_070053_039081_0DDDF237 
X-CRM114-Status: GOOD (  43.61  )
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

On Tue, Sep 15, 2026 at 05:10:02PM -0700, Oliver Upton wrote:
> Hi,
> 
> On Tue, Sep 01, 2026 at 06:15:56PM +0100, Leonardo Bras wrote:
> > When dirty-logging is disabled, even non-write faults make a page dirty,
> > which avoids a second fault when the page is actually written to.
> > 
> > On dirty-logging enable, this approach causes all (writable) pages on the
> > memslot to be marked clean, even if they were not written to, which can
> > take a lot of time, while holding the MMU lock, doing atomic writes to
> > PTEs.
> 
> Do you have any performance numbers for this? Enabling HAFDBS seems a
> bit involved to avoid some stores on the first pass.

Not yet, but if the idea does not look too crazy I can find hardware and 
collect some data :)

> 
> > So, if the system supports VHE + HAFDBS, keep the non-write-faulted page as
> > writable-clean, and let HAFDBS update that on demand when a write happens.
> > 
> > When dirty-tracking actually starts, disable HAFDBS as having it on
> > avoids the same fault that is used for dirty-logging.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > ---
> >  arch/arm64/include/asm/kvm_mmu.h    |  6 ++++++
> >  arch/arm64/include/asm/kvm_nested.h |  9 +++++++--
> >  arch/arm64/kvm/arm.c                |  7 +++++++
> >  arch/arm64/kvm/mmu.c                | 26 +++++++++++++++++++++++++-
> >  4 files changed, 45 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
> > index 6eae7e7e2a68..3defa1a988d3 100644
> > --- a/arch/arm64/include/asm/kvm_mmu.h
> > +++ b/arch/arm64/include/asm/kvm_mmu.h
> > @@ -383,20 +383,26 @@ static inline void kvm_fault_unlock(struct kvm *kvm)
> >   * and CMOs are NOP'd. This has the effect of no longer requiring a
> >   * KVA for addresses mapped into the S2. The presence of these features
> >   * are thus necessary to support cacheable S2 mapping of VM_PFNMAP.
> >   */
> >  static inline bool kvm_supports_cacheable_pfnmap(void)
> >  {
> >  	return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB) &&
> >  	       cpus_have_final_cap(ARM64_HAS_CACHE_DIC);
> >  }
> >  
> > +static inline bool kvm_supports_hafdbs(struct kvm *kvm)
> > +{
> > +	return IS_ENABLED(CONFIG_ARM64_HW_AFDBM) &&
> 
> cpucap_is_possible() is the right place to park this.
> 

Noted!

> > 						      has_vhe() &&
> 
> I don't see a reason why this needs to be constrained to VHE-only.
> 

Humm, in nVHE would not the host kernel run in EL1?
I thought that this being a feature that depends on EL2 registers host 
would need to be in EL2 to make use of it.

That being said, I understand very little of how this works, so I 
constrained to VHE only at the start.

Would this work in nVHE?

> > +		!kvm_vcpu_has_nv(kvm) && cpus_have_final_cap(ARM64_HW_DBM);
> 
> Same thing goes for nested... KVM can make use of HAFDBS in the
> canonical stage-2 MMU (or even a shadow stage-2) independent of the
> guest hypervisor.
> 

Humm, I remember reaching the conclusion that it could not be used if the 
guest supported NV. Let's say:

L0 - Host	- Has HAFDBS enabled
L1 - Hypervisor - Has HAFDBS disabled
L2 - Guest	-

Let's say guest writes to a page, and the shadow S2 has DBM=1, so it's 
marked as WD by HAFDBS. Since no fault was taken, how would the L1 be able 
to update it's S2 pagetables to mark the page dirty?

(We would have to transverse the Shadow S2 Pagetable updating the original 
S2 pagetable)

I was wondering, thought, that we could emulate it in the last level 
hypervisor, if it's guest does not support nested guests. That would mean 
we can have the last-1 level hypervisor to update the S2 pagetable on the 
last level hypervisor without it having to fault. Ex:

L0 Host - HAFDBS disabled
[...]
Ln-1 Hypervisor - HAFDBS disabled
Ln   Hypervisor - HAFDBS enabled
Ln+1 Guest - No E2H feature

When the guest writes to a page, the host should receive a fault, that IIUC 
have to propagate down up to Ln Hyp. If Ln Hyp has HAFDBS, we could skip 
injecting a fault in Ln Hyp, as  Ln-1 Hyp could emulate HAFDBS and write 
the dirty bit to S2 pagetagle of Ln+1 guest, that resides in Ln memory.

Not sure if the troulbe would be worth, though.
Does it make sense?



> >  #ifdef CONFIG_PTDUMP_STAGE2_DEBUGFS
> >  void kvm_s2_ptdump_create_debugfs(struct kvm *kvm);
> >  void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu);
> >  void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu);
> >  #else
> >  static inline void kvm_s2_ptdump_create_debugfs(struct kvm *kvm) {}
> >  static inline void kvm_nested_s2_ptdump_create_debugfs(struct kvm_s2_mmu *mmu) {}
> >  static inline void kvm_nested_s2_ptdump_remove_debugfs(struct kvm_s2_mmu *mmu) {}
> >  #endif /* CONFIG_PTDUMP_STAGE2_DEBUGFS */
> >  
> > diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
> > index 1ed708335809..9242b5d665af 100644
> > --- a/arch/arm64/include/asm/kvm_nested.h
> > +++ b/arch/arm64/include/asm/kvm_nested.h
> > @@ -1,24 +1,29 @@
> >  /* SPDX-License-Identifier: GPL-2.0 */
> >  #ifndef __ARM64_KVM_NESTED_H
> >  #define __ARM64_KVM_NESTED_H
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/kvm_host.h>
> >  #include <asm/kvm_emulate.h>
> >  #include <asm/kvm_pgtable.h>
> >  
> > -static inline bool vcpu_has_nv(const struct kvm_vcpu *vcpu)
> > +static inline bool kvm_vcpu_has_nv(const struct kvm *kvm)
> 
> The name would suggest this thing takes a vcpu pointer...
> 

Ah, that name was based on
#define kvm_vcpu_has_feature(k, f)  __vcpu_has_feature(&(k)->arch, #(f))

That takes a kvm struct to check the kvm_arch one, instead of looking into 
the vcpu. I did it like this because there were some scenarios it was not 
quite straightforward to get the vcpu to use vcpu_has_nv(), which takes a 
vcpu.


Thanks!
Leo

