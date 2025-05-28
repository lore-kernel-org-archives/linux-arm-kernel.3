Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C8C5B553
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZ+8fLpUTUE00SwjTXDSYLrDkmSnBdYHcuMZzbgG8cE=; b=U0AAGAA3/0tc+Y3AtMJs+U5BuJ
	K10p9wnFG+/5V2koXOJ4rnudcBoxpA6cxKevJHZj2HKl/eX44x66PTbasMBrwpr+bdsB+olpimaZr
	zkloHRXtqLMv8rwMXBQz8JQvkTcC0a2z5YWZJ56dZd1PdIfpFS/W5U2TEQq8iX6RsV3FECroAn17G
	QMvaRQOKee+5Zxfms4oQEt7nUpPiHIelZDllbfivIxl0xLMb697T8s5zxWHprl69zwm1G7m4027YW
	fB7GbQnz338wZiBJBrnVJcyzoZY/O7mXuuHtZToIhtAJysw3et/OsQtR2AUmtvR5UgPn0zYROhFs1
	o+VKSqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKJdI-0000000DenT-2DWO;
	Wed, 28 May 2025 16:28:00 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKIfD-0000000DYEn-38kW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 15:25:56 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-70e102eada9so40016517b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748445954; x=1749050754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ+8fLpUTUE00SwjTXDSYLrDkmSnBdYHcuMZzbgG8cE=;
        b=hVkoV0SlZGJr2NiO90xImoq4txRf0MtEiV0i1gzVtiFzAsekDdHMqLRuS5J9fQJqvB
         j5WfFIiJ368zfdCqc8SUalCwp5FYzlxTnqLUaLA6ZMY+hzjZqfrNB0EMPyHz+OIIWE+G
         AE+R0sV8HD5wXpl2awskqnApJ4twa5RiEBvL3PGRrxPhKlbxv1CWZV37jxsB/HXHUbCL
         FPLi+hPfeX8p/G1EDvXJhroskYca+ik+Y5ja75lQ8Gz6fFsvT33HFPOYaKqES9ufAaUK
         7/p7eIKihogcbyKqrOylNbl9pa9tGT/RTSlg8R0dI+MykiRsybsysPYO8EAT+30+Pq/+
         qqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445954; x=1749050754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZ+8fLpUTUE00SwjTXDSYLrDkmSnBdYHcuMZzbgG8cE=;
        b=wmD36nftI6OcCjlcXOOQofW1jYYSjq6Bi5UEJlw6XI9VbmCmhP0LPSsLoqlKoMKy25
         ytYo1dL62y7NVmDz41QY2YSHKLW2UbXZwLgAOXr/CBjTauK2X/CLoTmQexnoDZY16/eR
         6jya3AhMaJSYONFZPUZVQeGE9oKf9QINIes5YQ7vE31Vm+7Hyl3fW+S3QvZMKHiSseaE
         8o+L99VWhwaEez4kFRcxo+gBdDN2JKhGPJ3mbZC0YjDVOm7/MaKh9Y2bjnUgw5BxVv6F
         +LreMC+8UsnKRSl6Bp8T72Fo+3N9sgSU3VziH6ajCGAUZMrClm8xrPwrkTBmVs3yLyoq
         vdfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFl4N+Hc6texbidzabSkOOWX+CKuz7/ABuOaCnU4iCHt6nY2G3ikN+n5Lr1+NYj1zwDGedbW7djdsOHwojPXGf@lists.infradead.org
X-Gm-Message-State: AOJu0YyWdFc8fdItAB6y7sYy7vvtuo3KjtLQg9nGgdKBCpv9XW+LH7Oi
	7Da5CHoFUBUH7geOCxZynY9b4L6tFc+oR45xUTFdo+h9bPRRMgOG/M8syIM3UqU8fgAEffZjZI1
	wm6AN1PsugzB2pBMXs70JdIBNsk0xy2GjZ4LCAlm6
X-Gm-Gg: ASbGnctFR4oZaOrkcqu5EECK/aYHV1d7dxji5Ex0AqbD7aBUMA4XV580VTXb+budwLS
	I9Ygyo65qlPQi8PsltMFmRBAlmanBMtT4FPmX8ze5UsnEzdIach3/r3mWWAFRVqAT5LEX8w4Et6
	INwyNRvGIJ7v5fBixWWyXNMRE8t+nOE9tpnxCOM/Hwu3gn+Cqf/tpH+Tz84AwC4oQQb/iVgDsyH
	vkgoQ==
X-Google-Smtp-Source: AGHT+IHHTjFjHU0PvV1+djItsz78YttpGm4E3LPln4uNDhF+ecRDSLHAHEgplJviovwSCSuAsvDL2RN+PvRS8fF8nxk=
X-Received: by 2002:a05:690c:6382:b0:6fb:a696:b23b with SMTP id
 00721157ae682-70e2daa40e4mr229796257b3.33.1748445954277; Wed, 28 May 2025
 08:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-7-jthoughton@google.com> <aBqkINKO9PUAzZeS@google.com>
 <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com>
In-Reply-To: <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:25:18 -0400
X-Gm-Features: AX0GCFsuA5ETDJCRPXwcAF_CgwvMWNwjHd-w8eEw30VBFRDQPn6RHYkUrDT3M_g
Message-ID: <CADrL8HXS7zvJZjOxTxPKH0dAGoMXnFrrxCW7J7CXRtaeV6izjQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250528_082555_787370_B8C74ACB 
X-CRM114-Status: GOOD (  24.04  )
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

On Wed, May 28, 2025 at 11:09=E2=80=AFAM James Houghton <jthoughton@google.=
com> wrote:
>
> On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Thu, Jan 09, 2025, James Houghton wrote:
> > > @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm =
*kvm,
> > >                                  enum kvm_mr_change change)
> > >  {
> > >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_=
PAGES;
> > > +     u32 new_flags =3D new ? new->flags : 0;
> > > +     u32 changed_flags =3D (new_flags) ^ (old ? old->flags : 0);
> >
> > This is a bit hard to read, and there's only one use of log_dirty_pages=
.  With
> > zapping handled in common KVM, just do:
>
> Thanks, Sean. Yeah what you have below looks a lot better, thanks for
> applying it for me. I'll post a new version soon. One note below.
>
> >
> > @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm *=
kvm,
> >                                    const struct kvm_memory_slot *new,
> >                                    enum kvm_mr_change change)
> >  {
> > -       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_=
PAGES;
> > +       u32 old_flags =3D old ? old->flags : 0;
> > +       u32 new_flags =3D new ? new->flags : 0;
> > +
> > +       /* Nothing to do if not toggling dirty logging. */
> > +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> > +               return;
>
> This is my bug, not yours, but I think this condition must also check
> that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, for
> example, will break the case where we are deleting a memslot that
> still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
> version.

Ah it wouldn't break that example, as `new` would be NULL. But I think
it would break the case where we are moving a memslot that keeps
`KVM_MEM_LOG_DIRTY_PAGES`.

>
> >
> >         /*
> >          * At this point memslot has been committed and there is an
> >          * allocated dirty_bitmap[], dirty pages will be tracked while =
the
> >          * memory slot is write protected.
> >          */
> > -       if (log_dirty_pages) {
> > +       if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
> >
> >                 if (change =3D=3D KVM_MR_DELETE)
> >                         return;

