Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC79CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nomoDwC9apKbvhbkrNN8KmZTKGsxkb/dhs8zbSF9x9M=; b=s40ayYCBX0h2/Gs8bRKfVjAtCe
	49YXsEUTWLWpCksnQ20meYpF+XcwM3LapDYxkYlv8EN7xEVB6v6sLgCYXhUR4tIepP+NFsakDmiZe
	fjMwNROgy4H1QiWYnS4N7bxplKlK4jcPGyYJerSEhUaETdpI2KnBaEDtDbk/F1prH8qBBs0iTwZAq
	YajKu0SLG//idqHtt1OCaT8r6nE1khX7E0iuuUpgzBwESNx08BgPFRK/tsd68d5Lkws2p5v4VYDzH
	Q8Gv3w7AT8bS+lipsv/6D0B90Md7pR+rOnF1tMmO/qDVN28lG4K9UpF3sxBfZfBKg7bX4etfrGhik
	pTY25LFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWDgL-00000002Gfq-3vKm;
	Sun, 07 Jun 2026 13:36:53 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWDgJ-00000002GfW-2Jwr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 13:36:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84275887a3fso2831778b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780839410; x=1781444210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nomoDwC9apKbvhbkrNN8KmZTKGsxkb/dhs8zbSF9x9M=;
        b=IqomSiwEwm+GIwTiMtcZn/BgU/UmFG0w3BS2Rpx4b5sm9Olxm+OO1DAvM75YDu1beS
         a/qDIyYki6288LTV6b7LpafIPlKrGwnZcmFkvuPx1TbMsV4rGcM09xhidEQ2VS3tuOSp
         9pzACoAV9xQ9Hxzn0Wq8g/s5M3+d75HUyjI6iXDWx2bpcMtk3Z9MAMhxnTFd2tnfZ7js
         15eFZASyA0VOB5tfJ7OvWEzIsmQQoFuA6/xN4NE9Ic/fFCHBSf5buO5UDRXkBA3Nw6N+
         RkOocpq3ikotLKk+N5oFegYMW8jR6+T8YsHhdcAhNRFafKigyjghLrFBbsciStARAQFI
         ktng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780839410; x=1781444210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nomoDwC9apKbvhbkrNN8KmZTKGsxkb/dhs8zbSF9x9M=;
        b=luoDmImzrbgbdd/UqENMT/p78SRFH5f/MzwLA50/9RwVfoh9+FFoArsOEn79sKcSvT
         yd1gR2OSjXtgm9E1/GJ37iK65SGsaPr5oEGUacj5E1LrLXr5aM9Ln3Y2VMrfDVnGaWYD
         +nP94eAZ+w7+tDVszXO76WwzY5NhiL+Mwx3WrqmQ8QZ4dc3HnNBqJu8nJ6Yf+5YF6R8M
         lttLBysSsMY3weixsCjAei5mw+1mwdEuD+VhkQmYbTBSB28BLDbuMzvGqXzUmAq9w1fl
         K70vS1iDhFhFYI+0s1oVoXiTLs1kc/kdapywof1EImTLoUdvkMZkgJJvitzTevEmPbql
         wdwg==
X-Forwarded-Encrypted: i=1; AFNElJ9fZFQHEBm/T0XIC3IbkztaZOioM4q8fJxR0rpVot7waVnGwUdRleHAFneELA7RgnUj56S+XRGI+w3iX9rS7hVz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ByCUx8/dynZCEsne4MxrxZrhwW9wO5HUxsyV6HXRx8xidk7X
	LfPAegFsR4sE6b2x4ddaaTShk3LlS++7nluK4MmToYAD61d1lIwTGDte
X-Gm-Gg: Acq92OHqdloYlPI5vqWeuorY2FbYR+u3ch8bDqsugCGcnVycTLyq0a9FJecbxJs/Xz7
	fRLp6PBMk1Ao7eCihAryTf+iHd4/CJxQ6+aMpJk3HGOD9Yvdwjv25DDpo/Zy/jnUe5Tjk8u3NJ9
	vipNsU4drY4AtPMb2OHJeoTVRFEq3evJgkK5O1Ihpnyq1B8XnU8iLLB2EpFfLdt+8nH48uEe1Rb
	ObmAEncJ9E8fPsuLlM/Ww5faswT22KVCLaMGNjBXr9lI4zaJEMYSHT70o9S/FsV+9mSTEF0clhR
	8D/ChLShh82Rr2UuccBEIV2jJvcLzJFrH02f6NfYu/9FEoTKhVsfwqhRbfbiVFginaaxjmwsyM1
	P2XHIEMNg3OF8twZMHt4SE2q1tHRMBK7TF2kcoYPvF1dcuP/JCuNfTz41yKoslg/gT9PoASHCeZ
	o0yVO25ZWhizA/21De/7gQVi7UcCLJxe/dhSFqkh5bgiHMcwUACMXnH1fu5CsqBQpI
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr8665149b3a.31.1780839409910;
        Sun, 07 Jun 2026 06:36:49 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282375f2dsm16053596b3a.19.2026.06.07.06.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 06:36:48 -0700 (PDT)
Date: Sun, 7 Jun 2026 22:36:44 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: Re: [PATCH] KVM: arm64: nv: Skip vCPUs without a pseudo-TLB in
 invalidate_vncr_va()
Message-ID: <aiVz7O_FIpY2k2bV@v4bel>
References: <aiUvSbrWndQeUPc8@v4bel>
 <8733yya4ch.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733yya4ch.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_063651_617976_F45DE64F 
X-CRM114-Status: GOOD (  34.11  )
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

On Sun, Jun 07, 2026 at 02:05:02PM +0100, Marc Zyngier wrote:
> On Sun, 07 Jun 2026 09:43:53 +0100,
> Hyunwoo Kim <imv4bel@gmail.com> wrote:
> > 
> > vncr_tlb is not allocated before a vCPU runs for the first time, so
> > vcpu->arch.vncr_tlb is NULL for a vCPU that has been created but not yet
> > run. Code that iterates over every vCPU's pseudo-TLB must skip those.
> > 
> > invalidate_vncr_va() iterates over the vCPUs with kvm_for_each_vcpu() and
> > dereferences vt->valid without checking whether vncr_tlb is NULL.
> > 
> > While iterating, skip vCPUs whose pseudo-TLB has not been allocated.
> >
> > Fixes: 4ffa72ad8f37 ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
> > Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> > ---
> >  arch/arm64/kvm/nested.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 6f7bc9a9992e..063e079d1d1a 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -969,6 +969,10 @@ static void invalidate_vncr_va(struct kvm *kvm,
> >  		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
> >  		u64 va_start, va_end, va_size;
> >  
> > +		/* Skip vCPUs whose pseudo-TLB hasn't been allocated yet */
> > +		if (!vt)
> > +			continue;
> > +
> >  		if (!vt->valid)
> >  			continue;
> >  
> 
> This looks correct and matches what we already have for
> invalidate_vncr_ipa().
> 
> But I think this misses the opportunity to squash a whole class of
> similar bugs, should we ever have the need for another function that
> iterates over all *valid* VNCR pseudo-TLBs.
> 
> Since I'm on a train and have nothing better to do, I've written the
> following hack.
> 
> Thoughts?

Looks like a good direction to me. I confirmed it fixes the issue (as
expected).

How about you submit this patch yourself?

> 
> 	M.
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 38f672e940878..f0a9f81a08302 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -897,9 +897,21 @@ static void invalidate_vncr(struct vncr_tlb *vt)
>  		clear_fixmap(vncr_fixmap(vt->cpu));
>  }
>  
> +/*
> + * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
> + * either can race against a vcpu not being onlined yet (no pseudo-TLB
> + * allocated). Similarly, the TLB might be invalid.  Skip those, as they
> + * obviously don't participate in the invalidation at this stage.
> + */
> +#define kvm_for_each_vncr_tlb(idx, vcpup, tlbp, kvm)	\
> +	kvm_for_each_vcpu(idx, vcpu, kvm)		\

Maybe vcpu -> vcpup?

> +		if (((tlbp) = vcpu->arch.vncr_tlb) &&	\
> +		    (tlbp)->valid)
> +
>  static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
>  {
>  	struct kvm_vcpu *vcpu;
> +	struct vncr_tlb *vt;
>  	unsigned long i;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
> @@ -907,24 +919,9 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
>  	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
>  		return;
>  
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
> +	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
>  		u64 ipa_start, ipa_end, ipa_size;
>  
> -		/*
> -		 * Careful here: We end-up here from an MMU notifier,
> -		 * and this can race against a vcpu not being onlined
> -		 * yet, without the pseudo-TLB being allocated.
> -		 *
> -		 * Skip those, as they obviously don't participate in
> -		 * the invalidation at this stage.
> -		 */
> -		if (!vt)
> -			continue;
> -
> -		if (!vt->valid)
> -			continue;
> -
>  		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
>  							    vt->wr.level));
>  		ipa_start = vt->wr.pa & ~(ipa_size - 1);
> @@ -954,17 +951,14 @@ static void invalidate_vncr_va(struct kvm *kvm,
>  			       struct s1e2_tlbi_scope *scope)
>  {
>  	struct kvm_vcpu *vcpu;
> +	struct vncr_tlb *vt;
>  	unsigned long i;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
>  
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
> +	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
>  		u64 va_start, va_end, va_size;
>  
> -		if (!vt->valid)
> -			continue;
> -
>  		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
>  							   vt->wr.level));
>  		va_start = vt->gva & ~(va_size - 1);
> 
> -- 
> Jazz isn't dead. It just smells funny.


Best regards,
Hyunwoo Kim

