Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0AEE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0IMN5OU4hbVrS5t00San57aLCq8tVf/YYU7UNV9XtU=; b=ZPsawUGF8qyaM+o5QxvVUo7dje
	VAiyD/2f4zaSKXfnjnxEYH8U+sncDdSmjR2dT6jKxiZHTg0l/rb4b2VEwOzV/p6zKJW35POTgZhLb
	mu0Obul0j6ECFOch9663Bg6q5rSJu8m75g1ynQGU4BpjByaMT6kOyGMN/wBqeogciltz7D2MlW/l5
	x4DgL475HWumGdfUVW83bDPZOLQldRq9qdLWy90eTRfkTH+PDsOHZ9KOkxzg9TobXksyh7XYJLDMJ
	iXIlttjaJgqgSmDORAIA7V+ORXgEf0o9veY2TId2xNP4dkkyGC+1MO5Uc7D1I5FPHWJ6eO+gC/7t3
	9QltpY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLKx-0000000HZle-1DQz;
	Thu, 05 Dec 2024 23:32:47 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLJv-0000000HZdy-2iy5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 23:31:44 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6efe5c1dea4so1004147b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 15:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733441502; x=1734046302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0IMN5OU4hbVrS5t00San57aLCq8tVf/YYU7UNV9XtU=;
        b=aIw+vhRLrtonbFQVOOvFkcZXhIg2l7G6zA5qRt+FdLerjnl1ZutwerOAfydQjotEX6
         +GUPihvCiu4diD+Xii62qtJqcAeqjtddy/dcABIKc4TgGMDOaVzRAzZRPFvxDN+yHuk7
         hiqMODy8jpgNWPu0TQQZAJz7uXibMDxwdHEhzmBTePR9Q6U/1qfaGlWsK7maLM9ER+cx
         8Ncwsj4xBOA/bUUuq9F+q0vEDM7kXPRZphmIzZ6VYF+DfZGRxbrSfyhmNHvDlII+kzKj
         ToYfBCbbFTrXMr/krUIxpp4Bz4SRP4kmvh2BlGrP+KAy8wXc76Nc5ywSbyjKW2wOo20S
         1OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733441502; x=1734046302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0IMN5OU4hbVrS5t00San57aLCq8tVf/YYU7UNV9XtU=;
        b=GNVTYVEEFTS3T8agnwmadY67uP1bDMkt7TmidUbeZo3koEGOr6jQbhgziJziG5BNo0
         dbLK5GO+qJ75KaCFC9ouKav9i8Aq4b9gum5boXHY5riFe617XysNEuMQbxLEXYhn0j5k
         ZpipEpTQe3oV4Bwhybs4RVx4bW0Dh3N+vQqhE4ysJmzDKWDcShBS+wQ+RIihHo1gUQiY
         8X+zKAeGYFhNyMo3yrFY4YYSnjFULBYMXcVtg8xPcnkEXXwe+4QY0NAM7pZTZW4BwTHA
         tDmEzsn2N7SgASYWuNIg6HShHi/bRMvnRTzg8KXz+5BGeqeaP0IFojiaWB/1gEj4Lf5l
         idYg==
X-Forwarded-Encrypted: i=1; AJvYcCWi4MHnOwtACzhDQ3fj531MVzPgyfphBjSFjtHGsRCFWYuMIaiy3RLcbMI1iSjzojkKiXE5m7CIv78YrRuh3ih2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Ockb6CHnrjsXMZDu+yuj+KD6Ir1PuWmKF4SfyP+N6EoVILvm
	AMdaXGJGvcUZR6/5xz8tz7yKjvxHn5T1yAprJKsqjwLDnmxZwmdX7gglQg0ByE78fzuLdc9Yy/f
	fUz8k6BsTsw0FHeNnGL9qEDoroKJgF2O+T/DG
X-Gm-Gg: ASbGncuoSVSh+rhCf8H1iDJVyXKLFwnO9Ll0gga7UH71YztIoNxrNVnx9n0efVFwxAQ
	rTA8hAenZXbbAP8GS/UN9lTNr6UUlBy+zr2CMw0jwz3L8UlkGnIpVHChP05c9
X-Google-Smtp-Source: AGHT+IGmoqWrGrMqKXzXbSlaDtMUJEUS1r8dSNypZARIHLTYBVYvB4FriHIdmOjPWn9wrKQu/NTZU5U476BPS24s0cI=
X-Received: by 2002:a05:690c:6083:b0:6ee:6c7d:4888 with SMTP id
 00721157ae682-6efe3c6049bmr11833187b3.22.1733441501392; Thu, 05 Dec 2024
 15:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
 <20241204191349.1730936-7-jthoughton@google.com> <Z1Dgr_TnaFQT04Pi@linux.dev>
In-Reply-To: <Z1Dgr_TnaFQT04Pi@linux.dev>
From: James Houghton <jthoughton@google.com>
Date: Thu, 5 Dec 2024 15:31:05 -0800
Message-ID: <CADrL8HWC7HhYmEBWa+5KeWmyD+iT1zPBJUAUtNyrhH7ZpLXJNQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_153143_688460_E145A150 
X-CRM114-Status: GOOD (  26.60  )
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

On Wed, Dec 4, 2024 at 3:07=E2=80=AFPM Oliver Upton <oliver.upton@linux.dev=
> wrote:
>
> Hi James,

Hi Oliver!

>
> On Wed, Dec 04, 2024 at 07:13:41PM +0000, James Houghton wrote:
> > Adhering to the requirements of KVM Userfault:
> >
> > 1. When it is toggled (either on or off), zap the second stage with
> >    kvm_arch_flush_shadow_memslot(). This is to (1) respect
> >    userfault-ness and (2) to reconstruct block mappings.
> > 2. While KVM_MEM_USERFAULT is enabled, restrict new second-stage mappin=
gs
> >    to be PAGE_SIZE, just like when dirty logging is enabled.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >   I'm not 100% sure if kvm_arch_flush_shadow_memslot() is correct in
> >   this case (like if the host does not have S2FWB).
>
> Invalidating the stage-2 entries is of course necessary for correctness
> on the !USERFAULT -> USERFAULT transition, and the MMU will do the right
> thing regardless of whether hardware implements FEAT_S2FWB.
>
> What I think you may be getting at is the *performance* implications are
> quite worrying without FEAT_S2FWB due to the storm of CMOs, and I'd
> definitely agree with that.

Thanks for clarifying that for me.

> > @@ -2062,6 +2069,20 @@ void kvm_arch_commit_memory_region(struct kvm *k=
vm,
> >                                  enum kvm_mr_change change)
> >  {
> >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> > +     u32 changed_flags =3D (new ? new->flags : 0) ^ (old ? old->flags =
: 0);
> > +
> > +     /*
> > +      * If KVM_MEM_USERFAULT changed, drop all the stage-2 mappings so=
 that
> > +      * we can (1) respect userfault-ness or (2) create block mappings=
.
> > +      */
> > +     if ((changed_flags & KVM_MEM_USERFAULT) && change =3D=3D KVM_MR_F=
LAGS_ONLY)
> > +             kvm_arch_flush_shadow_memslot(kvm, old);
>
> I'd strongly prefer that we make (2) a userspace problem and don't
> eagerly invalidate stage-2 mappings on the USERFAULT -> !USERFAULT
> change.
>
> Having implied user-visible behaviors on ioctls is never good, and for
> systems without FEAT_S2FWB you might be better off avoiding the unmap in
> the first place.
>
> So, if userspace decides there's a benefit to invalidating the stage-2
> MMU, it can just delete + recreate the memslot.

Ok I think that's reasonable. So for USERFAULT -> !USERFAULT, I'll
just follow the precedent set by dirty logging. For x86 today, we
collapse the mappings, and for arm64 we do not.

Is arm64 ever going to support collapsing back to huge mappings after
dirty logging is disabled?

