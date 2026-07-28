Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F07BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zul95q2edkfvVEgOYYXJEs/IWUfnxAxG6HlhqT6G6ZM=; b=d8a1fsYedTVSbVxF/pH8msnY87
	2EE5ITmceglH/tiMhulwqlMUejUE6Q5YdCPHN0cYJGk1jS+AyqezzQe0SIJQPSrrS9/4hMmVOOxHy
	V9R6xy8bE71h0XG0wz5olz0kbwbhIzVJcacGAbcfU3rnmwyOIX6wMihnra+SQvdkM5ZQBH6zpPnLr
	yDYsY18vJCVNxTzN2S0Gr/o469n8z4UVimTgJT0i1LiXLMxCKTwJAUGzGu2B/boGk7vVTXoKE/AqG
	1q8jtgc4amaNAyTQCy04ka2zNCNXKA0V4vMh2lwQrgXhUxphLTxRMm9pI1LUXv6wSAcRW+pjXFWya
	hOZaBRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woePD-00000004sT8-0ZOP;
	Tue, 28 Jul 2026 09:47:23 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woePA-00000004sPJ-0EBV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:47:21 +0000
X-Forwarded-Encrypted: i=1; AHgh+RrMLMqRh71Yf4Ku5ZSBrjmjVslMMjVe2SE+zP8/TFhvW8rGNWXItcAVw/q8vXPMZzK8b73yMK/D3k6TdmuMiNpP@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785232036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zul95q2edkfvVEgOYYXJEs/IWUfnxAxG6HlhqT6G6ZM=;
	b=MJWASw8UR+vxkfwf/E9gi2AyZy64rwG3lRyVoU9VxI5WLEMiBNqzFUG56pxkQP3W43G5ua
	502wZA0k+PZz81QOSrnbp166VZ+Olk13c/nvWDbYO+fKppWEFEL+0KLyMgPDrkoHibDpfR
	Z7RIY32q5e4rPSjFFPPobx3hea+Yunk=
X-Gm-Message-State: AOJu0YyP7XMMA05s7let65pxd3mhrJ5JADpwLAMkV1NjPFS8QaoibSk/
	WFIBfLMKnkZm5fu/w0AvDMyfsok9oFddElwAEu7SeZWV2ZClt5QmqSIG6qfLflEZDC61KZsx2bT
	IZGvs+WgG2TRtfD8FvJPrAQPdnGgl4YMqdpcc3aCC
X-Received: by 2002:a05:622a:aa4d:10b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-529a766aaa6mr50860001cf.7.1785232025049; Tue, 28 Jul 2026
 02:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <ameGoxbn2wzBq2kL@v4bel>
In-Reply-To: <ameGoxbn2wzBq2kL@v4bel>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 28 Jul 2026 10:46:27 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzmrSD=mPwGv2E+P0+buA=N5+HiV+QkMC=G+9zsQhPJFA@mail.gmail.com>
X-Gm-Features: AUfX_mxBDit6wudXeLiFNj76ppjc7lUTgOi-ZIE3Da7a8Xd_yV4KRw99UJrNVE4
Message-ID: <CA+EHjTzmrSD=mPwGv2E+P0+buA=N5+HiV+QkMC=G+9zsQhPJFA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Don't skip VNCR invalidation when the TLB
 size is unknown
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_024720_409343_621D4FBF 
X-CRM114-Status: GOOD (  32.15  )
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

Hi Hyunwoo,

On Mon, 27 Jul 2026 at 17:26, Hyunwoo Kim <imv4bel@gmail.com> wrote:
>
> ttl_to_size() returns 0 when no size is defined for the (granule, level)
> pair. That is the case for level 0 with 4kB pages, and for levels 0 and 1
> with 16kB and 64kB pages. For a VNCR pseudo-TLB this happens when the
> guest runs with SCTLR_EL2.M cleared, because __kvm_translate_va() returns
> success with wr->level left at S1_MMU_DISABLED, and that s8 value becomes
> level 1 as it goes through the u8 parameter of pgshift_level_to_ttl(). The
> size is then 0 if the guest has TCR_EL2.TG0 set to 16kB or 64kB.
>
> kvm_invalidate_vncr_ipa() and invalidate_vncr_va() feed that 0 straight
> into the range computation. When the size is 0 the alignment mask is 0 as
> well, both ends of the range collapse to 0, and the first comparison, the
> one that decides there is no overlap, is always true. As a result the
> pseudo-TLB is skipped whatever range the caller asks for, including the
> full IPA range passed by kvm_nested_s2_wp() and kvm_nested_s2_unmap().
>
> kvm_nested_s2_unmap() is called from kvm_unmap_gfn_range(). A guest that
> meets the above conditions therefore keeps its VNCR fixmap mapping across
> an MMU notifier that reclaims the page, and still holds a writable EL2
> alias of that page once it has been freed and reallocated for something
> else.
>
> compute_tlb_inval_range() and compute_s1_tlbi_range() already treat a size
> of 0 as "no size information" and fall back to a conservative value. Apply
> the same principle here, folding the range computation into a helper that
> reports an overlap when the size is unknown. This also removes the
> computation that was duplicated between the two functions. The result of
> the test is unchanged for a non-zero size.
>
> Fixes: ebb2d8fd81b8 ("KVM: arm64: nv: Fix incorrect VNCR invalidation range calculation")

The tag looks right to me. Before that commit the mask was "pa & (size
- 1)", so with a size of 0 both ends collapsed onto pa itself rather
than onto 0, and the full-range unmap still overlapped. So the missed
invalidation only starts at v6.17.


> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  arch/arm64/kvm/nested.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index dfb96edbdc43c6..3ac8789b458f39 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -985,6 +985,21 @@ static void invalidate_vncr(struct vncr_tlb *vt)
>                 clear_fixmap(vncr_fixmap(vt->cpu));
>  }
>
> +static bool vncr_tlb_intersects(struct vncr_tlb *vt, u64 addr,
> +                               u64 start, u64 end)
> +{
> +       u64 size, tlb_start, tlb_end;
> +
> +       size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift, vt->wr.level));
> +       if (!size)
> +               return true;

I was wondering if this deserves a short comment. It is the whole
point of the patch, and on its own an early return from a function
called vncr_tlb_intersects() reads as if an unknown size meant "no
overlap" rather than "assume the worst".

With that and with the caveat that I am not very familiar with this
code, but traced this while reviewing (and testing):

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad




> +
> +       tlb_start = addr & ~(size - 1);
> +       tlb_end = tlb_start + size;
> +
> +       return !(tlb_end <= start || tlb_start >= end);
> +}
> +
>  /*
>   * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
>   * either can race against a vcpu not being onlined yet (no pseudo-TLB
> @@ -1008,14 +1023,7 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
>                 return;
>
>         kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
> -               u64 ipa_start, ipa_end, ipa_size;
> -
> -               ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
> -                                                           vt->wr.level));
> -               ipa_start = vt->wr.pa & ~(ipa_size - 1);
> -               ipa_end = ipa_start + ipa_size;
> -
> -               if (ipa_end <= start || ipa_start >= end)
> +               if (!vncr_tlb_intersects(vt, vt->wr.pa, start, end))
>                         continue;
>
>                 invalidate_vncr(vt);
> @@ -1045,28 +1053,21 @@ static void invalidate_vncr_va(struct kvm *kvm,
>         lockdep_assert_held_write(&kvm->mmu_lock);
>
>         kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
> -               u64 va_start, va_end, va_size;
> -
> -               va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
> -                                                          vt->wr.level));
> -               va_start = vt->gva & ~(va_size - 1);
> -               va_end = va_start + va_size;
> -
>                 switch (scope->type) {
>                 case TLBI_ALL:
>                         break;
>
>                 case TLBI_VA:
> -                       if (va_end <= scope->va ||
> -                           va_start >= (scope->va + scope->size))
> +                       if (!vncr_tlb_intersects(vt, vt->gva, scope->va,
> +                                                scope->va + scope->size))
>                                 continue;
>                         if (vt->wr.nG && vt->wr.asid != scope->asid)
>                                 continue;
>                         break;
>
>                 case TLBI_VAA:
> -                       if (va_end <= scope->va ||
> -                           va_start >= (scope->va + scope->size))
> +                       if (!vncr_tlb_intersects(vt, vt->gva, scope->va,
> +                                                scope->va + scope->size))
>                                 continue;
>                         break;
>
> --
> 2.43.0
>

