Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E807C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=; b=E3wJEcgExsW67i/Wfe3m2kbH0I
	U54HQV4m2Bvlo58iqXUJpoOblKHAWIF02bXGjTR6aYF4oQ+M0RJToPMRYLI/8cxyfKbM5oI4lkHGF
	mpj7yzPLYM2wR1xihaxKIT6NmKBQG0jJRxeE7lEydb/n1Tv3vmtXkci7YbPxvphFMFrKq9kU6hHU1
	BDTOhuLSSoAN8Z2sEshbXtnS5WTzJMzJdej/vymCpFzDz3PDS+B8hSNsaP8HpbWLatx1xXR33XZku
	oEJuLBXy3+/1nLk7HUf+Be74dVVjA3rm9oBY9bjzkJ2CIAcr3UYOduT6FhC/hIJSnnAtPO+EYGfWN
	CR1f3Efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FF6-0000000Bygr-1Hgd;
	Thu, 17 Sep 2026 16:45:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FF3-0000000Byg7-25Qw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789663544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=;
	b=NLml1TD132GDuil1kaelCQm8/b76CU7gdO0OpV/VUhPwzsyhQb568HFOSGZpBL4yUZy4o7
	2xn/s06reCBJUAVEtpIwA4/vn7w2iZmjVYN3V6nYoxZ2HsVY2ctyWUGqtyB2bVjZawuRcB
	82TIbCKVvqge+vH9icfg2TVHG89RbFA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-ZoS6U4QHO9KSzwiElqmdVg-1; Thu, 17 Sep 2026 12:45:41 -0400
X-MC-Unique: ZoS6U4QHO9KSzwiElqmdVg-1
X-Mimecast-MFC-AGG-ID: ZoS6U4QHO9KSzwiElqmdVg_1789663540
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c252634bc4dso121168666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 09:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663540; x=1790268340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFVtn7TG6f4mxtK33dq+a4hRgCkKck590tubt0IqX6w=;
        b=zRLzWP6JTmaF1hm9rKs7B5ZHysQu2c3qaRiGcSBKzEAALX9S6EB5H8NdRF+L8jX0FC
         T5cgcfWX9AT/7RkKj1Q3UO/B/DeUpqmpaOLgSsI+Ypqn73JtRUI/r2hsCz+paf9hl2kk
         N3UY0aXb9YObNFzynok4hm8O8lJvdLbC2Ww9eYKfjQUQyKValVtTi7xirf1gfXdztmzI
         KcFb8BiiQnveAQQJAOpVVTq7007S6LYmv0AZIntcNwJgY2ZnUP0GnnTc+lBSudtj6pi4
         TgAUtJk+6my758AoaAFCNdAFGQOZf4ocTs7NWhqHyIYdxPaSKzZhhnaEDzVtOwnvo/45
         KSvA==
X-Forwarded-Encrypted: i=1; AKwUvByis543ydRVVlv2zvpEJFYeVrdKPcI1pwoDeuY4S54QeNkaRCM2oZJJCqKTMy/r/5EBYhRCKllF5D8JP/dbPnOV@lists.infradead.org
X-Gm-Message-State: AFuF++nHdayp8J3vbwWwu9PapyJgYxnmhCKdS+ATUluLa4DhcILdKN1F
	pKFWTaiEltWFd10RYj7LRIhQs5ONsTxbQQlUS33AVCjcvVQnBjGVkyZHuIK6J5zok5FY9Jxv8PA
	HUT3navqa08XsfRGjqokj2t4xhwOLqGV07K00NXGQ/xh0M6myWXcUqratz+RBS3dMkPfldnCAoc
	9HqKd/hFOS7prdFV20sVc5HFefw2ZaAUZUBhpSG+/ANoxYuPnrhU4=
X-Gm-Gg: AYBFou3OdSWOqAmvyNEQCe7AvBvdztKlhadRQkGk5r5A7rLYg+0cazOloOV6QjUm3Cs
	JIzp25v+h5mFbZ/zGDmGpCCEW8iwNzZpb4v8j6FJx/MMI7oE6CsaQKayFU2yGG4UCVTYnU4pxER
	w9LOpUKTZ6tllIQeuksBMfzCo5llAzFyZo1TNbWKqq1AGhneKdzB0qUjPUQ80hIVlOogg5iS/8O
	GOrAXq9Q0Z3DOK3WQ8UqetJ6ro5d6vOhMgb81fWEgFXodBI2aTD2w3G7SSzAIC7ZlfAj0InYidu
	7xM=
X-Received: by 2002:a17:907:9603:b0:c29:f5d5:5a9b with SMTP id a640c23a62f3a-c29f5d56177mr278869466b.37.1789663539792;
        Thu, 17 Sep 2026 09:45:39 -0700 (PDT)
X-Received: by 2002:a17:907:9603:b0:c29:f5d5:5a9b with SMTP id
 a640c23a62f3a-c29f5d56177mr278866966b.37.1789663539386; Thu, 17 Sep 2026
 09:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1788351089.git.rrobaina@redhat.com> <b30076994d49fa393251c836b5a57a725f218572.1788351089.git.rrobaina@redhat.com>
 <apkuGoWQwLJ7AcUC@willie-the-truck>
In-Reply-To: <apkuGoWQwLJ7AcUC@willie-the-truck>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Thu, 17 Sep 2026 13:45:27 -0300
X-Gm-Features: AcwNN1VE92GuCfaSbB45oDCoyv2ZqeewbUd4A5IjqOoYsq0pANwtPdd_-Sv6Jfw
Message-ID: <CAABTaaA7ZbfLxaQvTegaE9prKUPAu5fbfVt5wiaSZK=ohhjL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] audit: log all six syscall arguments in the
 SYSCALL record
To: Will Deacon <will@kernel.org>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, paul@paul-moore.com, 
	eparis@redhat.com, sgrubb@redhat.com, oleg@redhat.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, guoren@kernel.org, 
	monstr@monstr.eu, tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oDsocju44_SPE-lZ2OQGtaA-6r3zL0jXICEtVzDjnl4_1789663540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094545_608241_DA2FB33E 
X-CRM114-Status: GOOD (  25.42  )
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

On Thu, Sep 3, 2026 at 5:22=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Sep 02, 2026 at 11:43:34AM -0300, Ricardo Robaina wrote:
> > The SYSCALL record currently logs only four of the six syscall
> > arguments (a0-a3). The remaining two are captured but silently
> > discarded before reaching the audit context. This leads to the
> > need for auxiliary records when audit-relevant data lands in the
> > 5th or 6th argument of a syscall.
> >
> > Extend the SYSCALL record to log all six arguments, by adding
> > arguments a4 and a5 (5th and 6th syscall arguments respectively)
> > inline within the existing record. Also add the two new args to
> > the audit rules switch case, so audit rules can filter on them.
> >
> > Rather than plumbing two more register arguments through every
> > architecture's syscall entry path, change __audit_syscall_entry()
> > to take a pointer to pt_regs and use syscall_get_arguments() to
> > retrieve all six arguments.
> >
> >  audit-testsuite# make test
> >  audit-testsuite# ausearch -i -m SYSCALL
> >  ...
> >  type=3DSYSCALL ... syscall=3Dsendto success=3Dyes exit=3D1088 a0=3D0x4
> >   a1=3D0x7ffe43518b60 a2=3D0x440 a3=3D0x0 a4=3D7ffe43518b4c a5=3Dc
> >  type=3DSYSCALL ... syscall=3Dopenat2 success=3Dyes exit=3D4 a0=3D0x3
> >   a1=3D0x7fffc74692c8 a2=3D0x7fffc7467390 a3=3D0x18 a4=3D0 a5=3D7fffc74=
674f8
> >  type=3DSYSCALL ... syscall=3Dopenat success=3Dyes exit=3D3 a0=3DAT_FDC=
WD
> >   a1=3D0x557ced4141a2 a2=3DO_RDWR|O_NONBLOCK a3=3D0x0 a4=3D0 a5=3D0
> >  ...
> >
> > Suggested-by: Will Deacon <will@kernel.org>
> > Link: https://lore.kernel.org/audit/CAHC9VhSjEt_-Bsra4AEqWv+Daw5Ff=3Dgq=
y7dX4Ah11RVhdyCBUQ@mail.gmail.com/T/#t
> > Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
> > ---
> >  include/linux/audit.h         | 13 ++++---------
> >  include/uapi/linux/audit.h    |  2 ++
> >  kernel/audit.h                |  2 +-
> >  kernel/auditfilter.c          |  2 ++
> >  kernel/auditsc.c              | 19 ++++++++-----------
> >  kernel/entry/syscall-common.c |  4 +---
> >  6 files changed, 18 insertions(+), 24 deletions(-)
> >
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 45abb3722d30..9ce5962bc537 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -323,8 +323,7 @@ extern int  audit_alloc(struct task_struct *task);
> >  extern void __audit_free(struct task_struct *task);
> >  extern void __audit_uring_entry(u8 op);
> >  extern void __audit_uring_exit(int success, long code);
> > -extern void __audit_syscall_entry(int major, unsigned long a0, unsigne=
d long a1,
> > -                               unsigned long a2, unsigned long a3);
> > +extern void __audit_syscall_entry(int major, struct pt_regs *regs);
> >  extern void __audit_syscall_exit(int ret_success, long ret_value);
> >  extern void __audit_getname(struct filename *name);
> >  extern void __audit_inode(struct filename *name, const struct dentry *=
dentry,
> > @@ -373,12 +372,10 @@ static inline void audit_uring_exit(int success, =
long code)
> >       if (unlikely(audit_context()))
> >               __audit_uring_exit(success, code);
> >  }
> > -static inline void audit_syscall_entry(int major, unsigned long a0,
> > -                                    unsigned long a1, unsigned long a2=
,
> > -                                    unsigned long a3)
> > +static inline void audit_syscall_entry(int major, struct pt_regs *regs=
)
> >  {
> >       if (unlikely(audit_context()))
> > -             __audit_syscall_entry(major, a0, a1, a2, a3);
> > +             __audit_syscall_entry(major, regs);
> >  }
>
> Won't this (temporarily) break the build? Maybe you need to introduce a
> new helper e.g. audit_syscall_entry_regs(), then convert everybody over
> to that, then rename it to audit_syscall_entry() at the end to keep the
> series bisectable.
>
> Will
>

Yes, you're right Will. Thanks for your suggestion I'll do that in the
next version.

Thanks!
-Ricardo


