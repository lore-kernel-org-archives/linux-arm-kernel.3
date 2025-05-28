Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802ECC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 20:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pS3L3KRfz5KN2f4PHSrDwEqqU16vREHLyymMNsMjI1o=; b=VdlKXINGE92nVkvxPWKo50kH2T
	2vCsOXnUj5oCzsR6+p07ZUmNVHlayL2c76cePLGa5haHfZychUQBSnjaCI5Acw94pg6wAMxval/vx
	mf1EedBHsXeez20XGb6rhpgscDDnEBus58wfNNZ701HdM4jg1ivS9Udwai50jvsOK5+EP1g1j1u/Q
	4bWk7xVzqncQ0x7G+D6ZzXYeBgAk61GX6QL4Ws2UP6Rj45X2nuWr/muY22/o8YW3CsvtQ6SHEdIo9
	xYUnfb7V9angTUtxZJqFeSPQbFssijG7bm8CbZYzlQAQqRL6GAJbTI+tcir4L7bVqahKxAsENR1bm
	NwmNF1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKNG1-0000000E469-3Ex4;
	Wed, 28 May 2025 20:20:13 +0000
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKNDs-0000000E3n3-2shH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 20:18:01 +0000
Received: by mail-ua1-x949.google.com with SMTP id a1e0cc1a2514c-87dfb4a92abso32716241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 13:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748463479; x=1749068279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pS3L3KRfz5KN2f4PHSrDwEqqU16vREHLyymMNsMjI1o=;
        b=XL67vNiCkxwQx5giKUNJHwA5zDOUFgyGLSNFqgcJyMtzOrV+tRAkZeL7NiKhSq1kxn
         /RxBzd0rq+3OeN2CG2Qb9dEOVqkTo0kVKD8ZQ3nIR1EU4KV7z5aSkXQjs0ZMGMRhZlzu
         Lk4fKUXztfT5mrmrVK9lPrIhpskgYVx3Wu7Kr+FQ+X+xKQRcAGL0DX01CL1Zo3zGaOY8
         gf6AdQbrBlrAU9ryyiv+nhGrigEHjaL2Ak4DxuCQhLY5tWwVyvtZUtje8VX1OikqnEtL
         cBdNlKV5mEBgrByRc3E6rzIlMMRu0EykxCCRBKlHsgnXvKoleuHQrUgxyRis2uE/cU2v
         9hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463479; x=1749068279;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pS3L3KRfz5KN2f4PHSrDwEqqU16vREHLyymMNsMjI1o=;
        b=jzCHIv8Mz9z5ZtrZVBoqB1f43BqqibCaXZxxOLeVgXQFlJCToNzzL1YAd7OJYD9Byg
         xUOW7SGSU1f3g5B+xVSS5dN7wMWp55OIsrMc8BS4zEzjLNc5IWE3VlzM5q/GSItuGDQu
         qFrddY8VIspSlyIuuDKoDfmz/eM8LMmH6CrJA3qzSOVW7S6hkadQVV3JR8J5imWlqeBH
         FPYmXgedVt/gxzCjJPW1Kc/sOJAheP+AR0Mc8OWJABrGJw+bxTlJgAUVDNfCP1FFgwyM
         TbB+ELC0OFT4UTkFS5FLODYs9lOc1cdAlvnWZyqMO0hHC8CwgUMPDu9vatrQN4R/yyJB
         ZsMA==
X-Forwarded-Encrypted: i=1; AJvYcCXe/3nMM/S+v7lfx+gaB/fkzgOXkGwegOY9iwwMRU1OXXKy1Qq8FZbwH8yZCJ0F1dkZAlMxZPCrmq9d4zkXJQep@lists.infradead.org
X-Gm-Message-State: AOJu0YxfV1kGDPrpfPNjWj2TPpZbxUzPlnRMDE47YYUsYCROw9XKFRLY
	5Xjv6LgyZW041X0MMhydrgyDk/2KAqEUWm3dlQUd3Zm9+mRwT7CYpJypT2c/GXpOslSgvBK37M/
	QylVKgeYPdaPu0BH82Vv9zQ==
X-Google-Smtp-Source: AGHT+IGyUJTOXQyn/15OsOvKdvYlJU2g7lRit6+I+UryLZeKjuoksIAEOAqNG3KzRBgJ4D83T1qgfTqVSbHb27/G
X-Received: from vsve42.prod.google.com ([2002:a05:6102:faa:b0:4dd:b083:d38c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:5092:b0:4e5:ac99:e466 with SMTP id ada2fe7eead31-4e5ac99f42fmr1294267137.18.1748463478924;
 Wed, 28 May 2025 13:17:58 -0700 (PDT)
Date: Wed, 28 May 2025 20:17:54 +0000
In-Reply-To: <aDdILHOu9g-m5hSm@google.com>
Mime-Version: 1.0
References: <aDdILHOu9g-m5hSm@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250528201756.36271-1-jthoughton@google.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: seanjc@google.com
Cc: amoorthy@google.com, corbet@lwn.net, dmatlack@google.com, 
	jthoughton@google.com, kalyazin@amazon.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, wei.w.wang@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_131800_727745_EA2F13AE 
X-CRM114-Status: GOOD (  31.48  )
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

On Wed, May 28, 2025 at 1:30=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> On Wed, May 28, 2025, James Houghton wrote:
> > On Wed, May 28, 2025 at 11:09=E2=80=AFAM James Houghton <jthoughton@goo=
gle.com> wrote:
> > > On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > > @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct k=
vm *kvm,
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct kvm=
_memory_slot *new,
> > > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum kvm_mr_chan=
ge change)
> > > > =C2=A0{
> > > > - =C2=A0 =C2=A0 =C2=A0 bool log_dirty_pages =3D new && new->flags &=
 KVM_MEM_LOG_DIRTY_PAGES;
> > > > + =C2=A0 =C2=A0 =C2=A0 u32 old_flags =3D old ? old->flags : 0;
> > > > + =C2=A0 =C2=A0 =C2=A0 u32 new_flags =3D new ? new->flags : 0;
> > > > +
> > > > + =C2=A0 =C2=A0 =C2=A0 /* Nothing to do if not toggling dirty loggi=
ng. */
> > > > + =C2=A0 =C2=A0 =C2=A0 if (!((old_flags ^ new_flags) & KVM_MEM_LOG_=
DIRTY_PAGES))
> > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> > >
> > > This is my bug, not yours, but I think this condition must also check
> > > that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, fo=
r
> > > example, will break the case where we are deleting a memslot that
> > > still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
> > > version.
> >
> > Ah it wouldn't break that example, as `new` would be NULL. But I think
> > it would break the case where we are moving a memslot that keeps
> > `KVM_MEM_LOG_DIRTY_PAGES`.
>
> Can you elaborate? =C2=A0Maybe with the full snippet of the final code th=
at's broken.
> I'm not entirely following what's path you're referring to.

This is even more broken than I realized.

I mean that this diff should be applied on top of your patch:

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5e2ccde66f43c..f1db3f7742b28 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2134,8 +2134,12 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	u32 old_flags =3D old ? old->flags : 0;
 	u32 new_flags =3D new ? new->flags : 0;
=20
-	/* Nothing to do if not toggling dirty logging. */
-	if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+	/*
+	 * If only changing flags, nothing to do if not toggling
+	 * dirty logging.
+	 */
+	if (change =3D=3D KVM_MR_FLAGS_ONLY &&
+	    !((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
 		return;
=20
 	/*

So the final commit looks like:

commit 3c4b57b25b1123629c5f2b64065d51ecdadb6771
Author: James Houghton <jthoughton@google.com>
Date:   Tue May 6 15:38:31 2025 -0700

    KVM: arm64: Add support for KVM userfault exits
   =20
    <to be written by James>
   =20
    Signed-off-by: James Houghton <jthoughton@google.com>
    Signed-off-by: Sean Christopherson <seanjc@google.com>

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c5d21bcfa3ed4..f1db3f7742b28 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2127,15 +2131,23 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				   const struct kvm_memory_slot *new,
 				   enum kvm_mr_change change)
 {
-	bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	u32 old_flags =3D old ? old->flags : 0;
+	u32 new_flags =3D new ? new->flags : 0;
+
+	/*
+	 * If only changing flags, nothing to do if not toggling
+	 * dirty logging.
+	 */
+	if (change =3D=3D KVM_MR_FLAGS_ONLY &&
+	    !((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
=20
 	/*
 	 * At this point memslot has been committed and there is an
 	 * allocated dirty_bitmap[], dirty pages will be tracked while the
 	 * memory slot is write protected.
 	 */
-	if (log_dirty_pages) {
-
+	if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
 		if (change =3D=3D KVM_MR_DELETE)
 			return;
=20

So we need to bail out early if we are enabling KVM_MEM_USERFAULT but
KVM_MEM_LOG_DIRTY_PAGES is already enabled, otherwise we'll be
write-protecting a bunch of PTEs that we don't need or want to WP.

When *disabling* KVM_MEM_USERFAULT, we definitely don't want to WP
things, as we aren't going to get the unmap afterwards anyway.

So the check we started with handles this:
> > > > + =C2=A0 =C2=A0 =C2=A0 u32 old_flags =3D old ? old->flags : 0;
> > > > + =C2=A0 =C2=A0 =C2=A0 u32 new_flags =3D new ? new->flags : 0;
> > > > +
> > > > + =C2=A0 =C2=A0 =C2=A0 /* Nothing to do if not toggling dirty loggi=
ng. */
> > > > + =C2=A0 =C2=A0 =C2=A0 if (!((old_flags ^ new_flags) & KVM_MEM_LOG_=
DIRTY_PAGES))
> > > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;

So why also check for `change =3D=3D KVM_MR_FLAGS_ONLY` as well? Everything=
 I just
said doesn't really apply when the memslot is being created, moved, or
destroyed. Otherwise, consider the case where we never enable dirty logging=
:

 - Memslot deletion would be totally broken; we'll see that
   KVM_MEM_LOG_DIRTY_PAGES is not getting toggled and then bail out, skippi=
ng
   some freeing.

 - Memslot creation would be broken in a similar way; we'll skip a bunch of
   setup work.

 - For memslot moving, the only case that we could possibly be leaving
   KVM_MEM_LOG_DIRTY_PAGES set without the change being KVM_MR_FLAGS_ONLY,
   I think we still need to do the split and WP stuff.

