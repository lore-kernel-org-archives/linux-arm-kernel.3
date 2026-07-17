Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905F3C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVjPGgQmhpSH5kULFLvVPzc+8UPb9X9bd+mdnQCxBA4=; b=SV1x5h+eqz8UilYwbMJUYQrrU/
	a8EQEUm8v4Up7iASqM5nIP3Ma0z9KwA4AZfZh7ldx8TzBwAf9rrbdo5dGg4P+CaWocIlHZDDb3hQp
	G36NgEt5+KGdkV9GGBmELn+zy/9qPGcpX9EnTBFeQNhl4zNdkvT/rlYel/jGEILJBGJ2mS4o5OLOr
	rGw/kG3gcEBcuqPdPW0iGNSB1nvixPzD4BW4inVKH9OsGdqC66jpmEg9Wb2DUAux9Rm5JFWDjIYnN
	9rPyNZDQFO++3u5hxPSxM2GDqdy3tCtCJpwlNl5jTfEBWORyia3HsEnf2nQoIvXRv7KZQbpogpeeM
	rZ/i7W9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkNq-00000002atx-3dsD;
	Fri, 17 Jul 2026 15:21:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkNl-00000002at3-1MEB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B1981476;
	Fri, 17 Jul 2026 08:21:38 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C6333F905;
	Fri, 17 Jul 2026 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784301702; bh=hshQp5SW3TLdYcHxLEIRY0pDy1WP0fQxtmt0LEheZmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZ/BnOvi0wntk6aeCRcAnDUHvCjvHUZbPE/atxemoHCi7gQ3QqveUMZ6IQzHbnq8h
	 AWNLRiFpA8cwMYv+9hA7cxO1KDDJJfNQeQOtYOaCDWgpMGrpmByeNagX2E4QVxIyVl
	 JdXylIaq8Khx9l5zqMQuDywCEZuTxRMAV+JL/zOY=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware dirty tracking
Date: Fri, 17 Jul 2026 16:21:32 +0100
Message-ID: <alpIfIOFfrudBzD5@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0943eb14-9ffb-4dbb-9219-060e97bca2a7@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <20260709104026.2612599-4-zhengtian10@huawei.com> <aliKo7dTZzKcWHzI@kernel.org> <0943eb14-9ffb-4dbb-9219-060e97bca2a7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_082145_457755_A577A729 
X-CRM114-Status: GOOD (  31.59  )
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

On Fri, Jul 17, 2026 at 11:58:06AM +0800, Tian Zheng wrote:
> 
> On 7/16/2026 3:39 PM, Oliver Upton wrote:
> > Hi Tian,
> > 
> > On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
> > > -	if (prot & KVM_PGTABLE_PROT_W)
> > > +	if (prot & KVM_PGTABLE_PROT_W) {
> > >   		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> > > 
> > > +		/*
> > > +		 * No DEVICE filter needed here: relax_perms is only called
> > > +		 * on FSC_PERM faults. Device pages always get full RW from
> > > +		 * initial mapping and are never write-protected during
> > > +		 * migration, so they never trigger a permission fault.
> > > +		 */
> > > +		if (pgt->flags & KVM_PGTABLE_S2_DBM)
> > > +			set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> > > +	} else {
> > > +		/*
> > > +		 * Clear DBM on W→RO downgrade to prevent hardware from
> > > +		 * silently upgrading RO+DBM back to W+dirty, which would
> > > +		 * bypass KVM's write tracking and cause data corruption.
> > > +		 */
> > > +		clr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> > > +	}
> > > +
> > This block makes it pretty evident that the DBM bit really *is* the
> > write permission bit. I'd much rather we introduce the concept of dirty
> > state to the page table library and migrate the abstract write
> > permission to the DBM field, even if we don't have FEAT_HAFDBS.
> >

Ohh, that's an amazing idea!

 
> > That way everything 'just works' from outside the page-table library:
> > write-protecting hugepages would have the effect of clearing DBM and we
> > can separately reap dirty state from page descriptors.
> > 
> > If/when the architecture forces FEAT_S2PIE upon us we will need to make
> > this change anyway since dirty state management is unconditional and
> > handled separately from the actual permissions.
> >
> > Thanks,
> > Oliver
> 
> Hi Oliver,
> 
> Thanks again for your insightful review. Following your suggestion, I've
> 
> reworked the design around a unified three-state model that works regardless
> 
> of whether FEAT_HAFDBS is implemented:
> 
> **State table**
> State               | DBM    | S2AP[1] | Without HTTU            | With  HTTU  (HAFDBS)
> Non-writable   (N)  |  0     |    0    | write -> fault, inject  | write -> fault, inject
> Writable-clean (C)  |  1     |    0    | write -> fault, sw C->D | write -> hw C->D, no fault, HDBSS logs
> Writable-dirty (D)  |  1     |    1    | writable, no fault      | writable, no fault
> 

Yeah, that's how the table works with HAFDBS/HDBSS/HACDBS.

> **Proposed changes**
> 1. Remove KVM_PGTABLE_S2_DBM from enum kvm_pgtable_stage2_flags
> 
> — VTCR_EL2.{HD,HDBSS,HA} enablement in kvm_arm_enable_hdbss_global()
> 
> already keys off kvm->arch.enable_hdbss / system_supports_hdbss().
> 

We may need a system_support_hdbss() for the actual hdbss routines, though.


> 2. stage2_set_prot_attr() — set DBM unconditionally on writable pages:
> ```
> if (prot & KVM_PGTABLE_PROT_W) {
>     attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>     /* Writable-dirty: DBM=1 conveys write intent, S2AP[1]=1 marks dirty */
>     attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> }
> ```
> 
> 3. kvm_pgtable_stage2_relax_perms() — drop the else branch entirely:
> ```
> if (prot & KVM_PGTABLE_PROT_W) {
>     set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
>     /* Non-writable -> Writable-dirty: restore both write intent and dirty state */
>     set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;

In the future, depending on the setup of HDBSS/splitting, we may want to 
change this behavior. But for software only, it looks nice. 

> }
> /* no else: callers passing !W (e.g. exec faults) must not touch DBM */
> ```
> 
> 4. kvm_pgtable_stage2_wrprotect() — unchanged: it only clears S2AP1 (D->C).
> 
> DBM is preserved so HDBSS re-arms next round.
>  ```
> int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64
> size)
> {
>    /* Writable-dirty -> Writable-clean: clear dirty state (S2AP_W),
>    * preserve write intent (DBM) so HDBSS re-arms for next write.
>     */
>     return stage2_update_leaf_attrs(pgt, addr, size, 0,
>                          KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
>                          NULL, NULL,
>                          KVM_PGTABLE_WALK_IGNORE_EAGAIN);
> }
> ```
> 
> **One clarification**
> In the three-state model above, wrprotect() clears S2AP[1] but preserves DBM
> (D->C).
> 
> This allows HDBSS to re-arm on the next write. If we instead cleared DBM as
> well (->N),
> 
> HDBSS would be permanently disabled on that page and we'd lose the benefit
> of hardware
> 
> dirty tracking.
> 
> 
> So my understanding is:
> 
> wrprotect() (dirty tracking): D->C — clears S2AP[1], preserves DBM
> 
> mkreadonly() (true RO, future): ->N — clears both S2AP[1] and DBM
> 
> Does this match what you had in mind?
> 
> Looking forward to your thoughts.
> 
> Thanks,
> Tian
> 
> 
 
Thanks!
Leo

