Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1569AD711B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFjKS8FuHxdevVGTPIXW1TnXSm9ej+3wMVfAYZJ1jvs=; b=ADix2+ueixOLLHaN9IW+DA4ws2
	VH4uFHPbaPXLEXzeWUPIKUiKqUiVJKuO/rY38ebvfUTn1Ztqm3aahp2fdHzLMO2Uq2Yx1GUuLHX5q
	CYdDy7PW4XAQrYF29kbBVO41DlQrNeBlBVb0mt0rvwh1qAtMkQLCI8Xt2BtNB/h+ON/ojnEQAadJv
	1EGOeJELo7E9r5zeCnOpgbSBoCKVhLnqs0TuTgHqfrNCzX4W3hx7tMo5SnRQQvLSUnic/D1PpjlPO
	zZYiTaD4k6N3neuTgJ7cyvcdmAECqIu78dbZ8tpZUwDHI4gfU71tONZYT9OybWGImOrYLM6Gsqg35
	vL0WQukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmpm-0000000FiDf-3pJw;
	Wed, 20 Nov 2024 15:41:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmoe-0000000Fi12-3Auw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 15:40:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cd76c513cso57469585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 07:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732117228; x=1732722028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFjKS8FuHxdevVGTPIXW1TnXSm9ej+3wMVfAYZJ1jvs=;
        b=hw8Swmgc+Yq82FFR8J1TN8NDdAF03sqvOYWPesC1E+cHqlgaBOrS4++vGCb67Zm5Wv
         hCCCtGoVBdMw/N9wrckV8+G6qCqUaWtwv5VSRXdtqlyDz0AVTc4dd6lLcUIthdufOe7h
         hlynZ3ZO7GTwYp5s1Y+r1Dfr2vJVyBLDiMBY6UuhPf7bQgwheCqAJ3m7AdB11jj5DHVV
         5R2Z6xKt5wS94sXUABF0VHOBzlTgBIjC2Eu7ZgOTspcpq1iItIUzv4HnQpnyBBc9JoCD
         fQtVkHoPP8BIsLBIJvZzCxcfsOUrfxSH4/SR+8WWZi1Z207+1Bs8Sw7089xcDTryo7AU
         7VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732117228; x=1732722028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFjKS8FuHxdevVGTPIXW1TnXSm9ej+3wMVfAYZJ1jvs=;
        b=PZqgeClVC6wkF8ng7am+8eQnNHBnIzRRV7MNed0nb9aWvcpoMHj1XvbIHwctOpoH7F
         oZneG+8cGrfk3E5thHt1y6fKHmsiEfURvZZkxnDQThfNaTF2a4Q9HD7eTYLa68v4MECj
         OWhQBAy9P+fpx9Qwkx2w6drxbtg+sOWJKrf/CPtbGFxX0j2yOIhok2PqBfpr93JyM1SX
         tJw0pv1zzNmrwXyoNAOJu1YCmx8yLgiEH5gNd/rfppMqLj1WCsXhSte3A740TX/h0qWT
         G8YvHT5ikzPXqQzeGeSc+l65ODgz7228EQOLNZ8LP/RS6qIxcmtzFcCMg3MQCC0wdSdX
         U/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXPpvxSaLg4kcqMu3RsoX7lYsE3C3+MloDCbiXcwBhfpI8vRnOJC78NUF2WklgosFIPoEU59dF8IoBCD74LaHS7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc1j2S7FpPfcklLQ0JJUhRK7BIVlajp2oc2gQN5Gr3/u0gKc2O
	NXgEQxAtNY2otNdiUFqcHRDDbguy2UfEfoZT1ldMkQAyFqWLqZkypxMw3VdYg+xA+buW/DM7QtM
	aMn4EoOmpJMbcmOpxPanEEjsYBHU=
X-Google-Smtp-Source: AGHT+IGccb8V9MDgANcN/DkHMib6H9ZLqwSbLtXKcpBFjHV91T5dzsJwSZ2Qs9oUVT2cqw0siTJHZxcILUXkEuGT1EY=
X-Received: by 2002:a17:90b:3ec5:b0:2ea:7fd8:9dc1 with SMTP id
 98e67ed59e1d1-2eaca738a43mr3423668a91.18.1732117227729; Wed, 20 Nov 2024
 07:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20241028010818.2487581-1-andrii@kernel.org> <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
In-Reply-To: <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Nov 2024 07:40:15 -0800
Message-ID: <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
Subject: Re: [PATCH v4 tip/perf/core 0/4] uprobes,mm: speculative lockless
 VMA-to-uprobe lookup
To: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, peterz@infradead.org, oleg@redhat.com, 
	rostedt@goodmis.org, mhiramat@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jolsa@kernel.org, paulmck@kernel.org, 
	willy@infradead.org, surenb@google.com, mjguzik@gmail.com, brauner@kernel.org, 
	jannh@google.com, mhocko@kernel.org, Andrii Nakryiko <andrii@kernel.org>, vbabka@suse.cz, 
	shakeel.butt@linux.dev, hannes@cmpxchg.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david@redhat.com, arnd@arndb.de, 
	richard.weiyang@gmail.com, zhangpeng.00@bytedance.com, linmiaohe@huawei.com, 
	viro@zeniv.linux.org.uk, hca@linux.ibm.com, 
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_074028_800847_F31C9FCC 
X-CRM114-Status: GOOD (  42.28  )
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

Linus,

I'm not sure what's going on here, this patch set seems to be in some
sort of "ignore list" on Peter's side with no indication on its
destiny.

I'd really like for this change to go into the new release with the
rest of uprobe improvements that happened this cycle, as they all
nicely complement each other. This patch set has been done-done since
Oct 24 when Suren sent the final version of mm-side changes ([0]),
which I subsequently resent as part of this mm+uprobe patch set on Oct
27, after coordinating that this will go through uprobe subsystem with
Andrew Morton ([1]). The uprobe part was effectively unchanged since
this summer, when this speculative uprobe lookup logic was posted as
part of an earlier RFC series ([2]). That's just to say that this was
thoroughly reviewed, discussed, and stress-tested, meanwhile, and I
see no reason to delay landing it for so long.

I've even written a separate overview email with a summary of all the
uprobe-related work and how it all fits together ([3]), realizing that
there are a few seemingly independent email threads and patch sets,
trying to engage involved maintainers. The outcome was:
  - two patch sets did land (uretprobe + SRCU and Jiri's uprobe
session prerequisites) after a bunch of extra pings, but that's at
least something;
  - Liao's siglock optimization ([4]) still hasn't landed with no
explanation what's the delay;
  - this patch set is also stuck in limbo for weeks now;
  - there was little engagement on arm64 front for Liao's optimization
of uprobes on STP instructions [5], which is perhaps a separate topic
for another email, but just another instance of maintainers not
engaging in timely fashion.

In short, I hope to get your help with the next steps. What can I do
to help land this patch set (and hopefully also others I mentioned
above)?

More broadly, what should be contributors' expectations on timeliness
of maintainers' engagement? Maintainer record in MAINTAINERS can't be
just a veto power, right? It is also a responsibility before others to
move the kernel development along. I'd like to understand what you
think is reasonable to expect here? Same question for patch handling
(applying, reviewing, rejecting, etc.) latency.

Thank you!


  [0] https://lore.kernel.org/linux-mm/20241024205231.1944747-1-surenb@goog=
le.com/
  [1] https://lore.kernel.org/linux-mm/20241028204822.6638f330fad809381eafb=
49c@linux-foundation.org/
  [2] https://lore.kernel.org/linux-trace-kernel/20240813042917.506057-14-a=
ndrii@kernel.org/
  [3] https://lore.kernel.org/linux-trace-kernel/CAEf4BzY-0Eu27jyT_s2kRO1Uu=
UPOkE9_SRrBOqu2gJfmxsv+3A@mail.gmail.com/
  [4] https://lore.kernel.org/linux-trace-kernel/CAEf4BzarhiBHAQXECJzP5e-z0=
fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com/
  [5] https://lore.kernel.org/linux-trace-kernel/CAEf4BzZ3trjMWjvWX4Zy1GzW5=
RN1ihXZSnLZax7V-mCzAUg2cg@mail.gmail.com/
  [6] https://lore.kernel.org/all/172074397710.247544.17045299807723238107.=
stgit@devnote2/


On Mon, Nov 11, 2024 at 9:26=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, Nov 5, 2024 at 6:01=E2=80=AFPM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Sun, Oct 27, 2024 at 6:09=E2=80=AFPM Andrii Nakryiko <andrii@kernel.=
org> wrote:
> > >
> > > Implement speculative (lockless) resolution of VMA to inode to uprobe=
,
> > > bypassing the need to take mmap_lock for reads, if possible. First tw=
o patches
> > > by Suren adds mm_struct helpers that help detect whether mm_struct wa=
s
> > > changed, which is used by uprobe logic to validate that speculative r=
esults
> > > can be trusted after all the lookup logic results in a valid uprobe i=
nstance.
> > >
> > > Patch #3 is a simplification to uprobe VMA flag checking, suggested b=
y Oleg.
> > >
> > > And, finally, patch #4 is the speculative VMA-to-uprobe resolution lo=
gic
> > > itself, and is the focal point of this patch set. It makes entry upro=
bes in
> > > common case scale very well with number of CPUs, as we avoid any lock=
ing or
> > > cache line bouncing between CPUs. See corresponding patch for details=
 and
> > > benchmarking results.
> > >
> > > Note, this patch set assumes that FMODE_BACKING files were switched t=
o have
> > > SLAB_TYPE_SAFE_BY_RCU semantics, which was recently done by Christian=
 Brauner
> > > in [0]. This change can be pulled into perf/core through stable
> > > tags/vfs-6.13.for-bpf.file tag from [1].
> > >
> > >   [0] https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/com=
mit/?h=3Dvfs-6.13.for-bpf.file&id=3D8b1bc2590af61129b82a189e9dc7c2804c34400=
e
> > >   [1] git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> > >
> > > v3->v4:
> > > - rebased and dropped data_race(), given mm_struct uses real seqcount=
 (Peter);
> > > v2->v3:
> > > - dropped kfree_rcu() patch (Christian);
> > > - added data_race() annotations for fields of vma and vma->vm_file wh=
ich could
> > >   be modified during speculative lookup (Oleg);
> > > - fixed int->long problem in stubs for mmap_lock_speculation_{start,e=
nd}(),
> > >   caught by Kernel test robot;
> > > v1->v2:
> > > - adjusted vma_end_write_all() comment to point out it should never b=
e called
> > >   manually now, but I wasn't sure how ACQUIRE/RELEASE comments should=
 be
> > >   reworded (previously requested by Jann), so I'd appreciate some hel=
p there
> > >   (Jann);
> > > - int -> long change for mm_lock_seq, as agreed at LPC2024 (Jann, Sur=
en, Liam);
> > > - kfree_rcu_mightsleep() for FMODE_BACKING (Suren, Christian);
> > > - vm_flags simplification in find_active_uprobe_rcu() and
> > >   find_active_uprobe_speculative() (Oleg);
> > > - guard(rcu)() simplified find_active_uprobe_speculative() implementa=
tion.
> > >
> > > Andrii Nakryiko (2):
> > >   uprobes: simplify find_active_uprobe_rcu() VMA checks
> > >   uprobes: add speculative lockless VMA-to-inode-to-uprobe resolution
> > >
> > > Suren Baghdasaryan (2):
> > >   mm: Convert mm_lock_seq to a proper seqcount
> > >   mm: Introduce mmap_lock_speculation_{begin|end}
> > >
> > >  include/linux/mm.h               | 12 ++---
> > >  include/linux/mm_types.h         |  7 ++-
> > >  include/linux/mmap_lock.h        | 87 ++++++++++++++++++++++++------=
--
> > >  kernel/events/uprobes.c          | 47 ++++++++++++++++-
> > >  kernel/fork.c                    |  5 +-
> > >  mm/init-mm.c                     |  2 +-
> > >  tools/testing/vma/vma.c          |  4 +-
> > >  tools/testing/vma/vma_internal.h |  4 +-
> > >  8 files changed, 129 insertions(+), 39 deletions(-)
> > >
> > > --
> > > 2.43.5
> > >
> >
> > Hi!
> >
> > What's the status of this patch set? Are there any blockers for it to
> > be applied to perf/core? MM folks are OK with landing the first two
> > patches in perf/core, so hopefully we should be good to go?
>
> Another week, another ping. Peter, what can I do to make this land? MM
> parts are clearly ok with Andrew Morton, uprobe-side logic didn't
> change (modulo inconsequential data_race() back and forth) since at
> least August, was approved by Oleg, and seems to be very stable in
> testing. I think it's time to let me forget about this patch set and
> make actual use of it in production, please.

