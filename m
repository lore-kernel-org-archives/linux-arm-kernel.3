Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0354FD2F35C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 23:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHU+/HLwiitPDlXwom6qRitlX1fipBA+Q9yORBvMlwY=; b=QZ9NGEbbgdVrxwRgdQxJTTKLKK
	73r60vyJrnBslneVvjFD/sSDZ0jOMYHs+Wpi7t2hSvvswR+rOD3aDP/OpMOdYjfoZd/cV5LUmKWxx
	ZIiDnClqrsuGTcLRJL6zBtUgh/AGGSjVh09RpgDk4feumyPEQ1HDT4ezqskEhg63kwdd8RSezLj2c
	Z95SRD5aAFwVTCZF1aMgPkpRCACYMpLjLFLlTC650pxWDuZRXRjcJGgpDiQiw0bMQcVO3PLstSOmb
	QkMalaDOfSsKKT+L5rs0SXBS8XzZ67OE8IkeMZOkfzzTkH5+n9uLVhE/Ret/U/9JYtuEKZtfBebWz
	6/l/QAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnlf-00000007s3c-05nG;
	Tue, 13 Jan 2026 23:25:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfnlb-00000007s3G-4BOZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 23:25:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43246af170aso178177f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 15:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768346737; x=1768951537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHU+/HLwiitPDlXwom6qRitlX1fipBA+Q9yORBvMlwY=;
        b=NMD4OnFsvBhiWENAtIp8i/igenHh3lYWRlJ5O1hzDyM+LJKJtV+3/GoZrVnOgp0xBT
         dsDlA2l16JM9g3G7EmirtmwjVL+gbi05UpQ3rxOFIrY3o1rVDKnnBCda9LN8oyvVvgC6
         +yqMPcP5CyX5wwtccV1g89nZg6GTWfqPgF2VXvX0ObylvXOcbGglp2Sp1Fhr4B9jl2EK
         K9C3ocUhmDPOFDQvnSpEhUhEEYIB6pIwiSgmXgAR2zYKKUeyK0jcgu1Xme1CGbBlfgBG
         qQSZC4ZMe34oW5tfv3lvbWx2T1vhqKs4I51tUPEMh29bOcZamVAUIlyZ2ETyusAYzuLS
         Xcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768346737; x=1768951537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHU+/HLwiitPDlXwom6qRitlX1fipBA+Q9yORBvMlwY=;
        b=lL38G2ruIbzbC0QOlij3rKJunPnmYMQ+sA82mVfkV5YDca1oPQmcisQ1cPRPZcJVx3
         nRlhZA/JTyj50oPmp785dy+2iXmAeRVE8H9+fY7rp+c/ZzfxJyWOaqSn9dgVtEvlk+XC
         DKBqQ7tinty6cs/g+8TgNTLFApOGJaBX6A9QWzkChS5MKo16fyMPMkpQSG/UJoOnWgqL
         1QBjlNBIW7uo/x1Nc0ItR3tjoYvii7Ii9zlXdC8jbggEw1GWXjRauuVSAXwQdOu0UgxF
         evKKQTBYNSOrKxC/6S3WPUdbB29csN3AWksFoV8D80O39PgM3bM80nVVIee09s5XskQj
         ZdQw==
X-Forwarded-Encrypted: i=1; AJvYcCW0CMAU30sZMYUAepJ4RaHtudqszzMG6m1H61Dc1s6xYoET95p2o2GT413ZwlYTK+//nrF9aLxKY1eJGAXPruQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxdApQk5hHsLNZmQ+wy4tfV0KX8XpOT//6qKztvzX9J/8bwCZmV
	XtDgdsMNoleWJ5Mt6o8lr6n29eOwsG4/dtnyGacwj8IQ1yBBqCgykkIJibCmzy54Wyn/kC1302b
	gHV+asUjXFAYOYkJPJwtmekbrIujcqAc=
X-Gm-Gg: AY/fxX49ECmeEkhJZDTGklDO20EVjwmYc8nMq/zPdTLYji+xM8ofPVZxaOxucn/v46n
	/++VFgoiHb5kWnzzZID7amJq5MzAW3HSdYNMKxPv7RaLrnFnb9m7JrD9TQX8sroLxtEY9ShU0Yk
	u4EhAXQ9LrXIMave5VBGlyqTEEDm5aEBw7WU3eeO1IzsmHLGEOEw1JxfcnWTzbIKVspbQ3J3/8G
	v6eWPsk05GdV+a/5hGZKyZJvXN1lRczIYQj2ixuUVIwsP+Ye3Y5dUZisNFKpKPefHf+K3LfHqoe
	w7Gvb4wGoTSX57w00kr4THQb2ZMt
X-Received: by 2002:a05:6000:200d:b0:431:8bf:f08c with SMTP id
 ffacd0b85a97d-4342c0e33fcmr746753f8f.21.1768346737371; Tue, 13 Jan 2026
 15:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20260107215353.75612-1-longman@redhat.com> <864iowmrx6.wl-maz@kernel.org>
 <87ms2nsqju.ffs@tglx> <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org> <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com>
 <87cy3eg94y.ffs@tglx> <5f4bfd8b-8699-4bef-bf49-f29965e95ca4@redhat.com> <20260113115515.98Mc29Nm@linutronix.de>
In-Reply-To: <20260113115515.98Mc29Nm@linutronix.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 13 Jan 2026 15:25:26 -0800
X-Gm-Features: AZwV_QgNIEr3g_107xkIOrrw3Ge4zQle_mq-J4yht-YAYcdNLGT_KWBNo0kRCyQ
Message-ID: <CAADnVQ+eQU+isNBXOJwQ=RYZUyO00e48ESHUhh8Kp7pgRgQu0Q@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in allocate_vpe_l1_table()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Waiman Long <llong@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-rt-devel@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_152540_111519_E8A45618 
X-CRM114-Status: GOOD (  21.41  )
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

On Tue, Jan 13, 2026 at 3:55=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-01-12 12:14:30 [-0500], Waiman Long wrote:
> > On 1/12/26 10:09 AM, Thomas Gleixner wrote:
> > > They might be acquired though. Only alloc_pages_nolock() guarantees t=
hat
> > > no lock is taken IIRC.
> >
> > Thanks for the suggestion. I will look into using that for page allocat=
ion.
> > I had actually attempt to use kmalloc_nolock() to replace kzalloc()
> > initially. Even though it removed the call to rmqueue(), but there were
> > other spinlocks in the slub code that were still being acquired like th=
e
> > local_lock() or the spinlock in the get_random() code. So I gave up usi=
ng
> > that. Anyway, kmalloc_nolock() doesn't seem to be fully working yet.
>
> with kmalloc_nolock() you have to be able to deal with a NULL pointer.
> Looking at kmalloc_nolock(), it has this (in_nmi() || in_hardirq())
> check on PREEMPT_RT. The reasoning was unconditional raw_spinlock_t
> locking and bad lock-owner recording for hardirq.
> There was a trylock path for local_lock to make it work from atomic
> context. But from what I can tell this goes
>   kmalloc_nolock_noprof() -> __slab_alloc_node() -> __slab_alloc() ->
>   ___slab_alloc() -> local_lock_cpu_slab()
>
> The last one does local_lock_irqsave() on PREEMPT_RT which does a
> spin_lock(). That means atomic context is not possible. Where did I make
> a wrong turn? Or did this change recently? I do remember that Alexei
> reworked parts of the allocator to make the local_lock based trylock
> allocation work.

Are you forgetting about local_lock_is_locked() in __slab_alloc() ?
With sheaves the whole thing will be very different.

