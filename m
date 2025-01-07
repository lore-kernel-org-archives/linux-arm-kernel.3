Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65321E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xQPM8GlyvrYQL2ipNVH1pEAS9moSFslwHLjifYpbj4=; b=XlZuRS4bCXwDxJ1FFvqO0nXN/s
	yqdMJIqRqawrsLDFC046WLPI0o2gO8aAKXEjzLhDFYL7KlLKdGkJxIUGwLQD4tqmbkNp+z6zJaMP+
	+AUkcXXf/p/Z6uXSs0sePERkbP/vR9Muqj4JJkadyiJmkgwi4FWnQcH9yO6FOAi99FJcc0d0TTP6D
	feZW14qsMaOZqAyz+hm1/z+z1xwxWH3WdixtepxZNaNUXou0/whn9XiphSIwzji2mRhyIAGSAUSBx
	7xs/VVJnpKgSq5pgrIk7SffD75stTkQzi8+GBxWMP326Lz1+DSe929kn6tkDDocYhGRRSNvBhw7nH
	715HO/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFgt-00000006BJ5-1cnj;
	Tue, 07 Jan 2025 19:56:39 +0000
Received: from mail-oa1-x41.google.com ([2001:4860:4864:20::41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFfg-00000006BBx-2J9N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 19:55:25 +0000
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-29e5aedbebdso7392483fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 11:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736279723; x=1736884523; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xQPM8GlyvrYQL2ipNVH1pEAS9moSFslwHLjifYpbj4=;
        b=NI6m4swyA8UGHtuPSTD3ru5cpJi7QAj1sciXWLGJbGd40ZZLq3dhD/wmoBMNFRWQs2
         4Gv/m4ZmipR1/90Hehghtm9jfXpa1H2dVFgVMcUvnzQItLRHnQub/jBCPxm3yffPnwno
         jbBmX4NihHe5KZtJYUhnYlZrQS8R/zlYn9D9zS++kPOvV9x4QCatX+oyOzyMW0iutcyb
         CcyNOasiY1IXTok6lc/jMip5sRnoNpl1uiAP1sWe0qWAytK3dulNFo+wjZIUPN7M1CDF
         WuaTgwPJNJbtC7eT6gMaZDxDVQzRPpi0yg2dX3abL/JyG4H9GOY2W0Z8ICW1awwVlPX5
         d4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736279724; x=1736884524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xQPM8GlyvrYQL2ipNVH1pEAS9moSFslwHLjifYpbj4=;
        b=BsowA4eYDiTHR/RuUSoPU1sDIaXYP+Ye0L8pzjXtkDbJQMu5/G1+bjGa51uvtKkMxO
         I2qWCGtfpM25mA0C4FCZPQaMwp0jIzYf4XYxFCXqd3NjaYZHyq1kIHgZwwnZltcXreyQ
         LH9w0qAa/Ebh8Nd9eakx4ED9NxFku5ShpxbF9RYHwI3swQWk8H+zUIQj7oTPPZ81NxP7
         xbSLyPsHDkQiYqnFiiC+vxITD5WZKFaFbIEYCW21l0+lquySQE9a+ZlJLqXmQ16TW/0Q
         Kj6v6FOrCTfomENN68pZQn+ZyJWbnRY9kWy48RLXAeznHH+PZFpEDwVvY4OIRhCUGytP
         YU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXm0KlV0jQYXY4McYbca1kxo/mabngjyHDYTngZIKp6gKpVw4MwH9IRP1v9IA6C+Le9QXpHGlEDCPorkgwdccFc@lists.infradead.org
X-Gm-Message-State: AOJu0YzOXPDCw2yWtsL4ZFBFiZDUAnmLYSQcyB57ZPF9dys6sIXLa4ay
	Vf0S2AOeQDDu2dT7O8k3yaEKcfOQk+w49nsYK51cHIYJTsfZcHF+iBsHZ6312CZrUmlEzoCISIQ
	fQI1QW9Y2aMnFbKLm5n+4sTzVEFI=
X-Gm-Gg: ASbGncupolQOF26VCmrXBSPZckEdD2TRYRuHBvchHjEI5DKrIe3WR3CpN62NgQgDIMY
	w6BKUR/yMFKfWHlzTkAUGF1tLC0b0+2M7/ixVJvcZVaOsWdmgykr6eRzN4TME6fF8/Wgk
X-Google-Smtp-Source: AGHT+IF8LAaZfHUGPsibyrZDMGXjaOEsDhZBhjbwBPjLCqCgjgeQ/Y+S/X2AjO+N7L930ALL+GNdnjcVDMI7C2vdBNY=
X-Received: by 2002:a05:6870:d0f:b0:29e:2991:d953 with SMTP id
 586e51a60fabf-2aa0673a3a6mr161175fac.20.1736279723668; Tue, 07 Jan 2025
 11:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20250107140004.2732830-1-memxor@gmail.com> <20250107140004.2732830-9-memxor@gmail.com>
 <20250107145159.GB23315@noisy.programming.kicks-ass.net> <CAP01T74SHdhtshm3iO_=+W4AHNQSZekJVKwaQn-Sr5up2apKhA@mail.gmail.com>
 <20250107191756.GA28303@noisy.programming.kicks-ass.net> <20250107192202.GA36003@noisy.programming.kicks-ass.net>
In-Reply-To: <20250107192202.GA36003@noisy.programming.kicks-ass.net>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 8 Jan 2025 01:24:45 +0530
X-Gm-Features: AbW1kvYNDn-hwrVgbcJZYSxe8OVsnAj85VqDc7V-R4ClCrxolK1ZlT4SjpsDc8Q
Message-ID: <CAP01T75JPEFVYnVQhJ_Lv0F=oKoT7-LDEXeLoc2mzVv4Vvw9YA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 08/22] rqspinlock: Protect pending bit owners
 from stalls
To: Peter Zijlstra <peterz@infradead.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Barret Rhoden <brho@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, kernel-team@meta.com, 
	Will Deacon <will@kernel.org>, Ankur Arora <ankur.a.arora@oracle.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_115524_589207_31A73370 
X-CRM114-Status: GOOD (  32.22  )
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

On Wed, 8 Jan 2025 at 00:52, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jan 07, 2025 at 08:17:56PM +0100, Peter Zijlstra wrote:
> > On Tue, Jan 07, 2025 at 10:44:16PM +0530, Kumar Kartikeya Dwivedi wrote=
:
> > > On Tue, 7 Jan 2025 at 20:22, Peter Zijlstra <peterz@infradead.org> wr=
ote:
> > > >
> > > > On Tue, Jan 07, 2025 at 05:59:50AM -0800, Kumar Kartikeya Dwivedi w=
rote:
> > > > > +     if (val & _Q_LOCKED_MASK) {
> > > > > +             RES_RESET_TIMEOUT(ts);
> > > > > +             smp_cond_load_acquire(&lock->locked, !VAL || RES_CH=
ECK_TIMEOUT(ts, ret));
> > > > > +     }
> > > >
> > > > Please check how smp_cond_load_acquire() works on ARM64 and then ad=
d
> > > > some words on how RES_CHECK_TIMEOUT() is still okay.
> > >
> > > Thanks Peter,
> > >
> > > The __cmpwait_relaxed bit does indeed look problematic, my
> > > understanding is that the ldxr + wfe sequence can get stuck because w=
e
> > > may not have any updates on the &lock->locked address, and we=E2=80=
=99ll not
> > > call into RES_CHECK_TIMEOUT since that cond_expr check precedes the
> > > __cmpwait macro.
> >
> > IIRC the WFE will wake at least on every interrupt but might have an
> > inherent timeout itself, so it will make some progress, but not at a
> > speed comparable to a pure spin.

Yes, also, it is possible to have interrupts disabled (e.g. for
irqsave spin lock calls).

> >
> > > Do you have suggestions on resolving this? We want to invoke this
> > > macro as part of the waiting loop. We can have a
> > > rqspinlock_smp_cond_load_acquire that maps to no-WFE smp_load_acquire
> > > loop on arm64 and uses the asm-generic version elsewhere.
> >
> > That will make arm64 sad -- that wfe thing is how they get away with no=
t
> > having paravirt spinlocks iirc. Also power consumption.
> >

Makes sense.

> > I've not read well enough to remember what order of timeout you're
> > looking for, but you could have the tick sample the lock like a watchdo=
g
> > like, and write a magic 'lock' value when it is deemed stuck.
>
> Oh, there is this thread:
>
>   https://lkml.kernel.org/r/20241107190818.522639-1-ankur.a.arora@oracle.=
com
>
> That seems to add exactly what you need -- with the caveat that the
> arm64 people will of course have to accept it first :-)

This seems perfect, thanks. While it adds a relaxed variant, it can be
extended with an acquire variant as well.
I will make use of this once it lands, it looks like it is pretty close.
Until then I'm thinking that falling back to a non-WFE loop is the
best course for now.

