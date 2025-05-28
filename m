Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAA8C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=; b=Y5SW5EhyvW3RxmM9KwzGVHXopz
	gav/20wVv7J0M2/6zd+1a+xxQ3Doo6AA2FUE6vz89Wep88tASoWVlyYfDKr9aYrnqQdsMDlADq2HJ
	fcC8kN2vZ1nSCysL9ReMwYfRz8/zv8ifxFjKhkwz3vgiKputy5FaUGBvIstd6qkhBr3L+fJqEl6qd
	oYMdJCBqtT2453RiZ8KMCu+8DleRIHdeFurwMtQWBCroOl1uocMkNoMI0+0oxUKJ/KyuzPWiV/Yh7
	U80UJdUnEa6GtRwqwLvMey361jMKKfR3n/Yp4uPwLA70l/2EDBVqTJA0xWDQt7zkHphyaTCSyDv8k
	LiVMhqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIa1-0000000DXLa-3c7p;
	Wed, 28 May 2025 15:20:33 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIQO-0000000DWBx-0YTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:10:37 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e7da3180098so3129618276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748445034; x=1749049834; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=;
        b=QCevMDztbSbci8EuzfVu/utZVeEMoV2Ze8YSx1r0/SEtrvKuseQd6qqHI09pY5n5lv
         voi4IJ2oJ6rEeO+xwZfPxYWLCaZd8xzF1GWIzv5NVA6K+VrUnSuWEsVC2Wi1H/gVXopM
         d2JKhfvOHiJH5awCk9/+Zcua/dvzX6/XKAGzEh5fhCgTrq06T2qK2sQ5JWue89NUCSAB
         H0mYL8pu8bU9ejaFswID+02BSc65O9sNLYwIKjCg/utJH5s9B0QFVXamE3gEXpm/a42n
         VdP0LCPbcWF35DUt4oGrhds8WK31ve3Au5cERHpMp5qn1wJB6sRuRCWL11kRlnOS0AHy
         6Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445034; x=1749049834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=;
        b=ttZat41BosqMwR6GvgbBLC22CPCvk4xbdo0GzUvuu82uvzciY6K6bQ09P2nXf4mBwV
         hG3bRJ9uSl44SKv8Qh1Qa1dbNSj/qHc5vRQRNYD73nDspDk569jxzgdrPfbwPRbNezwM
         BQl14rUJzgggGLAN2YlMBRGxMpFyCiYk3xJuODLXttNvbpI2BuoAlQInVxSvyuL3j+Ol
         /vFcHVSXHfGaGxbw0HYqX+uihljWinGRr+9Zm12hARofHcvXkQnSiXTc6P9phNBe+Us5
         XqpHyiajV8V3N40aPFSlqGJJZSYnqpWAaO6ZU/s11eyNZpjOGYwQVjEjF4Og3J1t+2V2
         F+dg==
X-Forwarded-Encrypted: i=1; AJvYcCUg/skC9+c/7JGsqetbEXfZebq5j7e1JJgAsIwiAspgw94ax5jvnDLwgWjEdECT8gDMHCN6S0C5S0euD7U0rbsd@lists.infradead.org
X-Gm-Message-State: AOJu0YxOLzUjdKqaWBusfYr/1HcrjWGxrBoWNO1DwqjH+jPN5lmKYBZ7
	fnn0iK+xZCLAINA7C8KkSgVOtKuZDGpDZFFxQFD96XTnUhjrv7w1kX3fRQNS9Z+Yj022AOibs7A
	dyIt7b63jOyYX7KKIl7AwGMTY22f8OriQC9hockfu
X-Gm-Gg: ASbGnctWhD3KQcKmPeBOmgHMrho0MUtxG3c+q9B21+K/3ZKbn/Lmovd9Y0EASufcUQI
	IMc2q9nPMzQ3SlkojoQayYWKkqi1A8tuuIsCM+EnFZRUF57IxdqlroDhTK6pDV63Y1OYJ4RixsZ
	W84xgkG8quqRswHrHgwtrlMJ/f0mDiE/95BKdHoY/hNZm67KJeRVt630q8HyootVjxYf3z+73gJ
	FsSs3CiVe+HxEGA
X-Google-Smtp-Source: AGHT+IGR99lWrX4uBQGr2kH0bGfT4JkEfaCzPmaHW/nbBCSd4QahIO99ZAocGBZAuHyfUiwPf1Ucb1uKFWWP5NDU59M=
X-Received: by 2002:a05:6902:2841:b0:e7d:6fe3:fc81 with SMTP id
 3f1490d57ef6-e7d91b459aamr21754237276.30.1748445033884; Wed, 28 May 2025
 08:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-7-jthoughton@google.com> <aBqkINKO9PUAzZeS@google.com>
In-Reply-To: <aBqkINKO9PUAzZeS@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:09:58 -0400
X-Gm-Features: AX0GCFt9PLVfklSGC-mOnCNW0mGP_16cIQYPD6tP1ev5K3PmI8fYxDutOCJrYcQ
Message-ID: <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_081036_170762_B110D5E7 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> > @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm *k=
vm,
> >                                  enum kvm_mr_change change)
> >  {
> >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> > +     u32 new_flags =3D new ? new->flags : 0;
> > +     u32 changed_flags =3D (new_flags) ^ (old ? old->flags : 0);
>
> This is a bit hard to read, and there's only one use of log_dirty_pages. =
 With
> zapping handled in common KVM, just do:

Thanks, Sean. Yeah what you have below looks a lot better, thanks for
applying it for me. I'll post a new version soon. One note below.

>
> @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm *kv=
m,
>                                    const struct kvm_memory_slot *new,
>                                    enum kvm_mr_change change)
>  {
> -       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> +       u32 old_flags =3D old ? old->flags : 0;
> +       u32 new_flags =3D new ? new->flags : 0;
> +
> +       /* Nothing to do if not toggling dirty logging. */
> +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> +               return;

This is my bug, not yours, but I think this condition must also check
that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, for
example, will break the case where we are deleting a memslot that
still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
version.

>
>         /*
>          * At this point memslot has been committed and there is an
>          * allocated dirty_bitmap[], dirty pages will be tracked while th=
e
>          * memory slot is write protected.
>          */
> -       if (log_dirty_pages) {
> +       if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
>
>                 if (change =3D=3D KVM_MR_DELETE)
>                         return;

