Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7934C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5lk3aR+RzRKEkMTxOWzVHzMD+THYlxrp/Tixh3xiWc=; b=cc7sUxc6/QXt+X0h4aq+1DYKUB
	lU9Y9rxFYR1Z8uSXxTlGfQBkwh7yY3K1xYotu7ARMo5hTcbMRZum/VpZBBY06tnxSIcPprbB7WPPD
	xszopCUfJ8rDQmaImGMdx3AuMAl8DrE9w9G3Tai9coervx3xU2ngPAkjcgyOGuMtoY1OWO72hkRgO
	yAo51IPOKlfrH6oqHEhTjFduMvLckRdKnzSUM+uHjOzsNG04fsmztZAQxojKEYQMKeHElFkRJLfIq
	ZbPMdMhkMXXAkR8OL/jhE43NCoEjmib2wP48Na43d2jEXDeEFgRN/dNrkmUUEhAVUAHh2VYAETPxb
	0ZTSwZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKdn-0000000Dpcl-3w0w;
	Wed, 28 May 2025 17:32:35 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKbf-0000000DpRF-17KF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:30:24 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b26eec6da92so886125a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748453421; x=1749058221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5lk3aR+RzRKEkMTxOWzVHzMD+THYlxrp/Tixh3xiWc=;
        b=oOLdGiPX+8SVCeLyw7jht+I1w+wdy2qRSPXZ6BdbIw9EXsUSRjfDIZQ9EUe89JfWSK
         8D7AXRxXSZhhJld0SNwf8fG5J7CG4zGvjFGbzdIXXcNlWD7SP0Fi1BXvezZRefHQg/kw
         8yPK6Nlfh+LtkTRSd/mGoXVT89GgTYZz122IpIix9T9xcTUcOMrjYprnc5E4235a/rNQ
         4D7R5+I2EpxyUD1WzNyN0cmHUnCkh8XOjkkDoXxG/Xcet3Sr98URyywUeeUxBWrrK5OM
         aUCBex60x6gXER/QtNF3fya5ISzvXGJU4GEDvqHggHBtvdzVmNWEOAtT4PQXL/OIQgvF
         NBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453421; x=1749058221;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X5lk3aR+RzRKEkMTxOWzVHzMD+THYlxrp/Tixh3xiWc=;
        b=qRoD7dFeH896GCN9gn+jz6ZFKWcdvGwFxgY4svH0gDsuyieEqLnqriSqldMDU5+k+L
         2N+L4aoFE0ef1bBVVWWGJbztIxLcXOwlfcs8u1BbkeYi2ulWnySVlVo1I7ty2uhLnBH/
         Tqx/531ZDMvjDAoEmA5rKUZIqzL6s/OQmuW9aKyinsDtYvGC19UDlTngtRtvkY2yVPLR
         mWsapJOoWyF6wlTSPiPn9KJbmz+bEAaM1BQOZOfy/pkmwtqFfKprgM2YF8+8CDRau31J
         lFYUxh7FBJdnzbmbg/bujN+OYO17QGQwSqR++IMcWQOD04jCetYhMALZS1b2Km6T42/K
         pHew==
X-Forwarded-Encrypted: i=1; AJvYcCXue/zcRzweWeKd5pVZE06YwTACrRvsVI9AV0aWD7DveIvfrsTePN2wWCKRGPubtaBJ8CcpplMT2EedxXYGxGhA@lists.infradead.org
X-Gm-Message-State: AOJu0YzLYHQylDBJIOlW35IQWIZ7QOcqIGou2wbhE8/215QWcef3A33e
	jRJx1puW/JH0MfLBSyKlsdDOcijZJVFJEvjKyuLmShFin/l6syFzwNXztotRX+2ZawfrRStzic8
	FhvEoKw==
X-Google-Smtp-Source: AGHT+IEsnEf7VuMExZRw8wVJdfyr2XCnHx5H/B/LOCvx+d5raumWeIsp3ExyZi0ZxIt7xWBlYTiCNvkn+ag=
X-Received: from pjbpx18.prod.google.com ([2002:a17:90b:2712:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3848:b0:311:be43:f09a
 with SMTP id 98e67ed59e1d1-31214e6e01dmr517950a91.9.1748453421388; Wed, 28
 May 2025 10:30:21 -0700 (PDT)
Date: Wed, 28 May 2025 10:30:20 -0700
In-Reply-To: <CADrL8HXS7zvJZjOxTxPKH0dAGoMXnFrrxCW7J7CXRtaeV6izjQ@mail.gmail.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-7-jthoughton@google.com> <aBqkINKO9PUAzZeS@google.com>
 <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com> <CADrL8HXS7zvJZjOxTxPKH0dAGoMXnFrrxCW7J7CXRtaeV6izjQ@mail.gmail.com>
Message-ID: <aDdILHOu9g-m5hSm@google.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_103023_324711_4A1C68CE 
X-CRM114-Status: GOOD (  23.44  )
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
> On Wed, May 28, 2025 at 11:09=E2=80=AFAM James Houghton <jthoughton@googl=
e.com> wrote:
> >
> > On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Thu, Jan 09, 2025, James Houghton wrote:
> > > > @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kv=
m *kvm,
> > > >                                  enum kvm_mr_change change)
> > > >  {
> > > >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRT=
Y_PAGES;
> > > > +     u32 new_flags =3D new ? new->flags : 0;
> > > > +     u32 changed_flags =3D (new_flags) ^ (old ? old->flags : 0);
> > >
> > > This is a bit hard to read, and there's only one use of log_dirty_pag=
es.  With
> > > zapping handled in common KVM, just do:
> >
> > Thanks, Sean. Yeah what you have below looks a lot better, thanks for
> > applying it for me. I'll post a new version soon. One note below.
> >
> > >
> > > @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm=
 *kvm,
> > >                                    const struct kvm_memory_slot *new,
> > >                                    enum kvm_mr_change change)
> > >  {
> > > -       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRT=
Y_PAGES;
> > > +       u32 old_flags =3D old ? old->flags : 0;
> > > +       u32 new_flags =3D new ? new->flags : 0;
> > > +
> > > +       /* Nothing to do if not toggling dirty logging. */
> > > +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> > > +               return;
> >
> > This is my bug, not yours, but I think this condition must also check
> > that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, for
> > example, will break the case where we are deleting a memslot that
> > still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
> > version.
>=20
> Ah it wouldn't break that example, as `new` would be NULL. But I think
> it would break the case where we are moving a memslot that keeps
> `KVM_MEM_LOG_DIRTY_PAGES`.

Can you elaborate?  Maybe with the full snippet of the final code that's br=
oken.
I'm not entirely following what's path you're referring to.

