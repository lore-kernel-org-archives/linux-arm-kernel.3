Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CDEC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P2+ujme6g+HTSW6n7ztSC163pEV3pR8Oo8zV1D+dnQ=; b=adowWz2qO/wEt4hrz/x2bZJVEC
	lFVBBb2Kg6d6XcxBQ7YPECAPsFtl2yvPGHye509QYA7Xu96uunPTsd5947P3r+KRBVr2PuPcJdSNY
	ybaOgyjKL+6V7DJE+HNaNIXpoAVWJ+p+6gXIoS3Yn1cp20Xo2EwsjwGkKBt1EDQe1hHeHv7PjsCs5
	zpyKqFETaUnef/0jNfSEDfm6f9kGv3ejHY+rfTuFGVnuopH1nGNULXsJNA14+TQzL4R0NiYWOTvf/
	eFU3fcTQ5i8pO1Vy6l3+38HYUaBB+Zdv/jCeqiITAcTYc1hhjnQcDP9PKIBfX8cOqMggZ7kJ1vXrq
	xEQE7DRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wre1X-00000004ETy-0aSU;
	Wed, 05 Aug 2026 15:59:19 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wre1U-00000004ERv-3506
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:59:18 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1054735a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785945555; cv=none;
        d=google.com; s=arc-20260327;
        b=Z5ijjLHvVXy2MAChrPrfIrdlVRoTRXr+fpDp2kkDYnh0zr5fTattcSww8V82YYRv2t
         ydoYjjS5cEH1agr31yuhde4AAjGRPylIFUHpty4pkx74Drtc45lY3bqlc+ZoZPfyfKQS
         zNH7BXK0u0iEKgMYXj1y5pJm2f0PsUo9jFLdmsOfm1YdqavqN3waiYMk2u16KhXt5xZC
         p8GHVpAOWWh8stARM10SOT81hdL+Gfu6ZPWj2yfZVpUgG62TX4e1hJfeRmREm71R62Q1
         CIzvTpAv1p8fRKxVqAc+xFe35mF+NWq25cZA/M96BHk52CDJ75G+YuJxTlqZN/Rur/qK
         xo2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6P2+ujme6g+HTSW6n7ztSC163pEV3pR8Oo8zV1D+dnQ=;
        fh=12RhZ05jKW3xHfm0lh+nKC8HZCubxN6OPnDzFsz8Fqc=;
        b=ffcTTwLAeV3DUlSZbs+eSKnD0noEgRE5aYMghPBohZhQ0rLgTwYVDrMyPe2y1M30M6
         XCI9c7FqV5sB0bn4xkwmNRMEdnBAxF0u/0OZiltydjxfLk4bGieGd8EJUMh/FBI6LOcI
         rO8INmAT2tNCsfpxptK2J6AJ8fhaMjUydkALxeg854ZQ8xyQaIf7++0Pcfnu0WLdBxkM
         jZ5Q4vnRb/HgeSW1A5VgtnpAu4v8z9CgwskVkcFyp0ZFtUHP88qA5ot65GD1Y6OgVaVV
         k3MtSEFjtxTBBlHxyOM+VsPWtEzmwGJ49lgjbClAp/cnYCllwJfo7xexiXCsbyoBlrlj
         4BaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785945555; x=1786550355; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6P2+ujme6g+HTSW6n7ztSC163pEV3pR8Oo8zV1D+dnQ=;
        b=PhJ3nOUK+5Xv4tReTa1cIUKHbvM7sCRnKGEBlCsV+W5Mo4f2yvnd2hp51iKScpvUke
         qj4O/93yl29vQzKKzu23TUe7UUIBhorpCIUYS5qYHwL360aN1ryA17b6F8xyW60AfRRI
         UpZ8JBnGKnZpVhABPitDGQRbpZobyCDue2MSNYDHsUbcide8b23agfey7WsdXjZP6Rm5
         5XducOMpPN2RMIQCzOkZoRlPIaQ0VbJBW12L3UstWDrhw2Ju32PFDacVqU1w4krKbVAx
         lKTI1/BXjob2VG1g0/GXtQfK2te4NkRZKRuEf12o6SBHKJ/W8bxSF98fW/MSguivnKPw
         nxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785945555; x=1786550355;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6P2+ujme6g+HTSW6n7ztSC163pEV3pR8Oo8zV1D+dnQ=;
        b=VOjjilDyn5Bc3itdhXR6t1hcbs94oNP9tTujuiZS90ijR2f4PMooQM4WPNMmDtbwIT
         J0NYwZUJyYbaOa5CRlSTPF+OxS7YcBg9Gq+nDKn98kb5ZkmotMMo4PnkHD4iX2VA7nH5
         UYReSQCoUKyu8fJd33yxYKlN+0nLhmRqCLiC9klUVuqBugriDfIgOmmMnuXGjxN0TquI
         MFcInd8Y8NE+TvFFRmUkP7ckP48Uz10JUhV2HMjTpIrwzPWi8hs8Bu942YAYos15VZ7H
         cCVSJGuZotqLgtga9pakZEUq1ifdxW/m/8ASmuM5ceyuUzDmWmPOzeRvmaV58nmLAWZ1
         IBEg==
X-Forwarded-Encrypted: i=1; AHgh+RpNa8XKt6AvMxJoTl7JE9PFCLoQaFw20fGzoyDp63tn3Rx5m4Kmn63nclk7hdAxihlUNTViOCjiliH8JxR/0Nc5@lists.infradead.org
X-Gm-Message-State: AOJu0YwDtSvdobfCJQ1SxgpRc72QVLIpTxf1p41h5MlM4AWJeN6RALdx
	C37TlNirxFJiZeNQT8gLQ3HqS8YhGiGzZpHlZkQOwJ9x7uUAsYSRVbV6QuypU1Nwxqw917XoaDo
	fCA8AP1smCaAml0C3UslBoDuwiZpEXv+209utOGr1
X-Gm-Gg: AR+sD12Ywlg2pO6+hUhXTEkjbq/PV/MVkrlPZ6xwR3UkYQ4WE2kIC9WGmxT+IZc1/xB
	Foc40ZFoGm4IlPpuVMySwXxe5gFsyB4R0n6Y5nwBFbkh3ghwZirywKirhtSBxkcUfVs1jviEKZ1
	O93wH8rgnLsss8Fbt/gej0W07ZUlzVSOSN2mgnPI2vMHvLNyto1s2au62ee7ygHs+BVfe3nNXTF
	9m7r6pZ356Vx0oYK9Xg84srKIpI7jUZihhQhJ0vuxnlfVTIST7hF8fVejvZLfP9APDg8fcVrZ7A
	oi40JMmhm+bP3ke/IggVi5U6ui5pnx6OXCtSLw5U0wUW7GYI8iSpvbZ8gQo8FZVRGWNflx4VFwM
	VX+eg5WcyN/kRl8kWLa9VADMz/uA02r8Q5Ds=
X-Received: by 2002:a05:6a20:9392:b0:3c3:a140:9380 with SMTP id
 adf61e73a8af0-3cb85e469d1mr8503935637.16.1785945554052; Wed, 05 Aug 2026
 08:59:14 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Aug 2026 08:59:13 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Aug 2026 08:59:13 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260803134403.80630-23-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com> <20260803134403.80630-23-steven.price@arm.com>
MIME-Version: 1.0
Date: Wed, 5 Aug 2026 08:59:13 -0700
X-Gm-Features: AUfX_mw87HguPfWFRxAUKpdtMQ3QriucOf-WRaZA41ldEtA-bI259FcP0zXpgjI
Message-ID: <CAEvNRgH+HWHgf26XDHN6aMLYjRh4M8okntBfjDFCBreXRXL=TA@mail.gmail.com>
Subject: Re: [PATCH v16 22/45] KVM: arm64: CCA: Handle RMI_EXIT_RIPAS_CHANGE
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_085916_811880_F24BD132 
X-CRM114-Status: GOOD (  36.87  )
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

Steven Price <steven.price@arm.com> writes:

> The guest can request that a region of its protected address space is
> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
> RSI_IPA_STATE_SET. This causes a guest exit with the
> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
> protected region to unprotected (or back), exiting to the VMM to make
> the necessary changes to the guest_memfd and memslot mappings. On the
> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
> calls.
>
> The VMM may wish to reject the RIPAS change requested by the guest. For
> now it can only do this by no longer scheduling the VCPU as we don't
> currently have a usecase for returning that rejection to the guest, but
> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
> open for adding a new ioctl in the future for this purpose.
>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v15:
>  * Propagate negative error returns.
> Changes since v14:
>  * Use addition rather than bitwise OR for adding the shared_bit in
>    realm_unmap_shared_range(), this handles the case where the region
>    includes the last address (which means 'end' already has the bit
>    set).
> Changes since v13:
>  * Switch to the new RMI_RTT_UNPROT_UNMAP range-based API.
>  * Drop ugly hack for RMM bug which errored when the RIPAS was already
>    set to the desired value.
> Changes since v12:
>  * Switch to the new RMM v2.0 RMI_RTT_DATA_UNMAP which can unmap an
>    address range.
> Changes since v11:
>  * Combine the "Allow VMM to set RIPAS" patch into this one to avoid
>    adding functions before they are used.
>  * Drop the CAP for setting RIPAS and adapt to changes from previous
>    patches.
> Changes since v10:
>  * Add comment explaining the assignment of rec->run->exit.ripas_base in
>    kvm_complete_ripas_change().
> Changes since v8:
>  * Make use of ripas_change() from a previous patch to implement
>    realm_set_ipa_state().
>  * Update exit.ripas_base after a RIPAS change so that, if instead of
>    entering the guest we exit to user space, we don't attempt to repeat
>    the RIPAS change (triggering an error from the RMM).
> Changes since v7:
>  * Rework the loop in realm_set_ipa_state() to make it clear when the
>    'next' output value of rmi_rtt_set_ripas() is used.
> New patch for v7: The code was previously split awkwardly between two
> other patches.
> ---
>  arch/arm64/include/asm/kvm_rmi.h |   6 +
>  arch/arm64/kvm/mmu.c             |   8 +-
>  arch/arm64/kvm/rmi.c             | 473 +++++++++++++++++++++++++++++++
>  3 files changed, 484 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> index 1e5026039458..751659a48be3 100644
> --- a/arch/arm64/include/asm/kvm_rmi.h
> +++ b/arch/arm64/include/asm/kvm_rmi.h
> @@ -107,6 +107,12 @@ int kvm_rec_exit(struct kvm_vcpu *vcpu, int rec_run_status);
>  int kvm_rec_handle_request(struct kvm_vcpu *vcpu);
>  bool kvm_rec_handle_hvc(struct kvm_vcpu *vcpu, int *ret);
>
> +void kvm_realm_unmap_range(struct kvm *kvm,
> +			   unsigned long ipa,
> +			   unsigned long size,
> +			   bool unmap_private,
> +			   bool may_block);
> +
>  static inline bool kvm_realm_is_private_address(struct realm *realm,
>  						unsigned long addr)
>  {

Coming here from guest_memfd, would like to look more closely at the
conversions-related stuff, and learn more about ARM CCA in the process :)

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index cd06881c1497..dcc2ab08d0e4 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -319,6 +319,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>   * @start: The intermediate physical base address of the range to unmap
>   * @size:  The size of the area to unmap
>   * @may_block: Whether or not we are permitted to block
> + * @only_shared: If true then protected mappings should not be unmapped
>   *
>   * Clear a range of stage-2 mappings, lowering the various ref-counts.  Must
>   * be called while holding mmu_lock (unless for freeing the stage2 pgd before
> @@ -326,7 +327,7 @@ static void invalidate_icache_guest_page(void *va, size_t size)
>   * with things behind our backs.
>   */
>  static void __unmap_stage2_range(struct kvm_s2_mmu *mmu, phys_addr_t start, u64 size,
> -				 bool may_block)
> +				 bool may_block, bool only_shared)
>  {

Why convert attr_filter to a boolean, why not pass the filter through? I
think that might allow all the 3 states - unmapping private, unmapping
shared, and unmapping both. (Assuming unmapping none == not even calling
this function).

Also, perhaps it's better to add this parameter to
__unmap_stage2_range() together with the patch that uses the only_shared
information :)

I see that in [1] not changing __unmap_stage2_range() was going to be
explored, did that work out?

[1] https://lore.kernel.org/all/3b8d49be-f031-4134-bd20-a8c51632f4ad@arm.com/

>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>  	phys_addr_t end = start + size;
> @@ -343,7 +344,7 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
>  	if (kvm_vm_is_protected(kvm_s2_mmu_to_kvm(mmu)))
>  		return;
>
> -	__unmap_stage2_range(mmu, start, size, may_block);
> +	__unmap_stage2_range(mmu, start, size, may_block, false);
>  }
>
>
> [...snip...]
>

