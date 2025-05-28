Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C640C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 23:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcxQaHt9YO/4vp8lHIwRWi8ySYcHIjzznVMdx4yu7+k=; b=hhhxmQ8K54RXGcZICxsI83L1K8
	oR2KCeOzGkSsqDAX7KzCcZLnQAVO8NzCyOzX9evqpwftSWVIKNWq10XjWHi231ZHslggizrkPXPHb
	NBSDo1KeUnSiw2TTPhlRF35IXGsWnrno0DkzxBO8WGfA4DSeH/rqbUaLNlcBDxKZ2/EL2Nqsr0y3V
	k5tOZ+uZhOVzz381qUnZtVwT3gu2RwIIWFFUba5WCJq8VSiuwrP83tq5Y2U///hgHVvSOkvkeSxGF
	RjjR/4PpXr85O/UjYgt0FYcyYoOtXsh+ky2rJnCGbQV538l8LCkyk7YW7XMrNIyMNiwM7/9S6/VMM
	dhsaqcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKQBQ-0000000ENEN-46XO;
	Wed, 28 May 2025 23:27:40 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKQ9G-0000000EN2B-3eZd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 23:25:28 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7375e2642b4so159956b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748474725; x=1749079525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcxQaHt9YO/4vp8lHIwRWi8ySYcHIjzznVMdx4yu7+k=;
        b=WAvNsxt6lD6wQ1F39K0DpN+tzdSdJNR0lb6kPOrzhYljkZaMmivm5POcIHcSASRHni
         oO/Btzox8TVi3ETyeIWQcU5zXFJe3sV4GH/vDhzu1Iebcl4Ucft/x/a+e7QmdpMB9W2l
         B2Y52Y6c0ysxYfSxtIzO4M5xBmi7/r6g9RVrq9WWA/LgY6J6scq951riN2WQq6V7gAdV
         JlcrJbOL5EuELOpDe8orATAAZWiNU9IqTNgoDsjCpqxuu6LHtXXXYyZSR2eQ3I7HZR0t
         JB2+pZlk6KKUK5oe5l35XCxLumSRx9a1utglISDVw/frmsAyXnz8+0ZoOt3Y39ilCoOo
         9xKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474725; x=1749079525;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gcxQaHt9YO/4vp8lHIwRWi8ySYcHIjzznVMdx4yu7+k=;
        b=BsHGW46lC85t4P/ZWGhLc9dAf+rkv3HhpmAhjPUD7nJxVk4xaXjiybBsRevrGorprR
         cG8irekrCF/hrLQP1UIskBDfpV9CYinorhewCSwGWr9bGYc3fXgcvhpzpuLyuRTKYn/J
         ypFy7lfQ82fgDuO2OreLwMkfLifjpev2yAQdxFnvhFAQJnNHC+71jnVRQW0vDlIUj4uH
         s1DoloC4oYt6WcaufZgUKNLnIFNEv8YF1N0DS5/93EWvfmEyNHKh4H3NBqVPT+fcmKro
         BfD7QLu2L6ErbbMgPIdbnAmvOnfC51eqMFv6zCt8BC6+GDDhIBFYEJX5EIDbOaIyZons
         0yKA==
X-Forwarded-Encrypted: i=1; AJvYcCUHnd+JDKEnrCUpgsI5vqWbzaEDJiINhsQ/bDG6W8+xTHtQEqgWSjSRifF9jk/mRKBfAcQs3Yx9kpOCQtZ4HjNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxrMHDvy9ePaCWClBqYPtSi6euLV2Qp7vVFIRgMg/KGqpnNM3ju
	p+tAj/k0naedQsPwHk0emkemES8eXL1aDxA0nbBn0Klr7uS82I3LubNIK87VDKk8KdDjjVekiIU
	1C1PbLA==
X-Google-Smtp-Source: AGHT+IErw9co+DcBT121540SfwKH6gZVIzfkdn9B2d2kwxMAwaFIuqhkwNuL6Huhgc39bFpmxXdGbf8i9Ig=
X-Received: from pgdu5.prod.google.com ([2002:a05:6a02:2f45:b0:b2e:c392:14f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:699:b0:218:cdcf:106b
 with SMTP id adf61e73a8af0-21aad7827femr6695431637.9.1748474725210; Wed, 28
 May 2025 16:25:25 -0700 (PDT)
Date: Wed, 28 May 2025 16:25:24 -0700
In-Reply-To: <20250528201756.36271-1-jthoughton@google.com>
Mime-Version: 1.0
References: <aDdILHOu9g-m5hSm@google.com> <20250528201756.36271-1-jthoughton@google.com>
Message-ID: <aDebZD1Kmmg15zs7@google.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	kalyazin@amazon.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	pbonzini@redhat.com, peterx@redhat.com, pgonda@google.com, 
	wei.w.wang@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_162526_912130_ABD74429 
X-CRM114-Status: GOOD (  29.94  )
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

On Wed, May 28, 2025, James Houghton wrote:
> On Wed, May 28, 2025 at 1:30=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c5d21bcfa3ed4..f1db3f7742b28 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2127,15 +2131,23 @@ void kvm_arch_commit_memory_region(struct kvm *kv=
m,
>  				   const struct kvm_memory_slot *new,
>  				   enum kvm_mr_change change)
>  {
> -	bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
> +	u32 old_flags =3D old ? old->flags : 0;
> +	u32 new_flags =3D new ? new->flags : 0;
> +
> +	/*
> +	 * If only changing flags, nothing to do if not toggling
> +	 * dirty logging.
> +	 */
> +	if (change =3D=3D KVM_MR_FLAGS_ONLY &&
> +	    !((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> +		return;
> =20
>  	/*
>  	 * At this point memslot has been committed and there is an
>  	 * allocated dirty_bitmap[], dirty pages will be tracked while the
>  	 * memory slot is write protected.
>  	 */
> -	if (log_dirty_pages) {
> -
> +	if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
>  		if (change =3D=3D KVM_MR_DELETE)
>  			return;
> =20
>=20
> So we need to bail out early if we are enabling KVM_MEM_USERFAULT but
> KVM_MEM_LOG_DIRTY_PAGES is already enabled, otherwise we'll be
> write-protecting a bunch of PTEs that we don't need or want to WP.
>=20
> When *disabling* KVM_MEM_USERFAULT, we definitely don't want to WP
> things, as we aren't going to get the unmap afterwards anyway.
>=20
> So the check we started with handles this:
> > > > > + =C2=A0 =C2=A0 =C2=A0 u32 old_flags =3D old ? old->flags : 0;
> > > > > + =C2=A0 =C2=A0 =C2=A0 u32 new_flags =3D new ? new->flags : 0;
> > > > > +
> > > > > + =C2=A0 =C2=A0 =C2=A0 /* Nothing to do if not toggling dirty log=
ging. */
> > > > > + =C2=A0 =C2=A0 =C2=A0 if (!((old_flags ^ new_flags) & KVM_MEM_LO=
G_DIRTY_PAGES))
> > > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>=20
> So why also check for `change =3D=3D KVM_MR_FLAGS_ONLY` as well? Everythi=
ng I just
> said doesn't really apply when the memslot is being created, moved, or
> destroyed. Otherwise, consider the case where we never enable dirty loggi=
ng:
>=20
>  - Memslot deletion would be totally broken; we'll see that
>    KVM_MEM_LOG_DIRTY_PAGES is not getting toggled and then bail out, skip=
ping
>    some freeing.

No, because @new and thus new_flags will be 0.  If dirty logging wasn't ena=
bled,
then there's nothing to be done.

>  - Memslot creation would be broken in a similar way; we'll skip a bunch =
of
>    setup work.

No, because @old and thus old_flags will be 0.  If dirty logging isn't bein=
g
enabled, then there's nothing to be done.

>  - For memslot moving, the only case that we could possibly be leaving
>    KVM_MEM_LOG_DIRTY_PAGES set without the change being KVM_MR_FLAGS_ONLY=
,
>    I think we still need to do the split and WP stuff.

No, because KVM invokes kvm_arch_flush_shadow_memslot() on the memslot and =
marks
it invalid prior to installing the new, moved memslot.  See kvm_invalidate_=
memslot().

So I'm still not seeing what's buggy.

