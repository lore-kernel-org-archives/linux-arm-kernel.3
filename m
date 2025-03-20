Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB42C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMpTW3gdrWaTvvthv6t5nnEEMc/fBBneoro008TKk9U=; b=ZoOzb7+I8KOkhlfH+IKTZDWWhg
	S246ufxWNRuHFuTko7rP21Z4XROKz3Y0wGSkbNJNas93xCSjKwWY6j7BVhH8t4jVk3+3j1HODDKiY
	FT4TTHyuoWqGTYkg0dGSLeXkJEd8DODIrXDA9YtyEMqtDEVPiaaOsUIUlVoDdT1y086nejZST7OGG
	22sQ6l650P3aRBMD/3qMuj9aO5pdZjHOG9u3Z9RjwTvgRsqGgohKvZrZfLsOHCXDVFn76H62CeYCX
	92iQ5ugdvi3kZDlg3FpNsP15XCBObpzvso8bsBULaPt9JxIN6KEzCnF1osTjj3UgW124CQtd+kl2X
	WvY480Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvKAO-0000000Csjm-01aP;
	Thu, 20 Mar 2025 17:58:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvK6P-0000000CsDb-0T2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 17:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F035243C5F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 17:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE30C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742493284;
	bh=4sxwANhWgnEl6Kc/mFjYhiXrRcRqIQfKJad6QWXOhDw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QUp8i5V0XxsaORfuEEn/a57KcDTV8a25rLGsUgHFZRFoIqgJJsWSCiPptlojBtmmZ
	 rCSdImJGPOMzjLbL56J2nU1YfCDQyK4GsVL+gHugqH+1u9PCu0gDF/sJCbAmKO53bE
	 ozIxLLkitm+tNbDG8bY+S6/LfYz09Ge0uBv0fTIkLaI1l4uPtFG/ybtQG3tm+nMmbp
	 v9dVQAY7Uhpou5IK3+bRTMnyd5AYxk71+S+8amCQicYjTHKxX0UhYnfjWOzAczTFMU
	 r5WxD0/HTgEM1Kr8oEPXWnF0PTp7Uxj7PU/B/Mdvimu5c+FKrJeL1y1U6aFzC9XP57
	 Rr7fnU8hNIA7g==
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d450154245so9054505ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 10:54:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVb4bOwIhZ6OJNuNo/F0Q0v+kR9Y5QNzWs3Bn2xX4jLbkcs788dq/oFt8k3LEADD3rsHRxtFOE2pHsLs2vdF7sP@lists.infradead.org
X-Gm-Message-State: AOJu0YxtbaLdreMAhqpNivkOgJUvqEDNfGtT/L6QAbFiDQC3jo3QXGM9
	WeclJoMCQvuiSob3nlq0hxnKLOUC2ukDqYjjoqA3w+rr+igL5Z1z/LjgGaVomVO+xjURf34DDxM
	WNpjuJdhqhSJDBBYodkFH9Q9lcF0=
X-Google-Smtp-Source: AGHT+IFWP8pfbwBl1chUhyuT+CmtDXuqo+7XO1cRO0Tzq74gsrngMMCJZXVSqHKZk5dQh66q7nufSFKxHTUARVoFyIM=
X-Received: by 2002:a05:6e02:85:b0:3d0:4e0c:2c96 with SMTP id
 e9e14a558f8ab-3d5960d2337mr5568995ab.2.1742493283619; Thu, 20 Mar 2025
 10:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250320171559.3423224-2-song@kernel.org> <20250320174642.855602-1-wnliu@google.com>
In-Reply-To: <20250320174642.855602-1-wnliu@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 20 Mar 2025 10:54:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7RAXHRt3c+8DYqirPFRA+Sdw4ZNJ+Ad1uSiAHGOJ9RSA@mail.gmail.com>
X-Gm-Features: AQ5f1JqKgmhQkJ9V_QiMvwS8pM3CeUzcisCl2Y1OPuDskAkxbNElxRHFu-VgG9M
Message-ID: <CAPhsuW7RAXHRt3c+8DYqirPFRA+Sdw4ZNJ+Ad1uSiAHGOJ9RSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
To: Weinan Liu <wnliu@google.com>
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, kernel-team@meta.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, puranjay@kernel.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_105445_191184_9F645E6C 
X-CRM114-Status: GOOD (  14.22  )
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

On Thu, Mar 20, 2025 at 10:46=E2=80=AFAM Weinan Liu <wnliu@google.com> wrot=
e:
>
> On Thu, Mar 20, 2025 at 10:16=E2=80=AFAM Song Liu <song@kernel.org> wrote=
:
> >
> >  static __always_inline void
> > @@ -230,8 +231,26 @@ kunwind_next_frame_record(struct kunwind_state *st=
ate)
> >         new_fp =3D READ_ONCE(record->fp);
> >         new_pc =3D READ_ONCE(record->lr);
> >
> > -       if (!new_fp && !new_pc)
> > -               return kunwind_next_frame_record_meta(state);
> > +       if (!new_fp && !new_pc) {
> > +               int ret;
> > +
> > +               ret =3D kunwind_next_frame_record_meta(state);
>
> The exception case kunwind_next_regs_pc() will return 0 when unwind succe=
ss.
> Should we return a different value for the success case of kunwind_next_r=
egs_pc()?

I am assuming once the unwinder hits an exception boundary, the stack is no=
t
100% reliable. This does mean we will return -EINVAL for some reliable stac=
k
walk, but this is safer and good enough for livepatch. IIUC, SFrame based
unwinder should not have this limitation.

Thanks,
Song

>
> > +               if (ret < 0) {
> > +                       /*
> > +                        * This covers two different conditions:
> > +                        *  1. ret =3D=3D -ENOENT, unwinding is done.
> > +                        *  2. ret =3D=3D -EINVAL, unwinding hit error.
> > +                        */
> > +                       return ret;
> > +               }
> > +               /*
> > +                * Searching across exception boundaries. The stack is =
now
> > +                * unreliable.
> > +                */
> > +               if (state->end_on_unreliable)
> > +                       return -EINVAL;
> > +               return 0;
> > +       }
>

