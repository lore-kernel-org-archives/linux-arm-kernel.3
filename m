Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F8AC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=; b=38Ovx/MDrQmq5a7IT22epNcbPq
	FinkiNJoBK4OqovpMwqdp2iwfUDcGGNellz+0Z9v4wFdlRWiDXN9wo7GJUAYm7KxMELke7+ma6XYt
	4ksKORlscGSdkcGnG+Ec4S5LabkHASNwk7nsIDST64Rpc8sjhZSfRZ2boKrDaUmFn/chVT05wMQBO
	QQldBe3cjRiIEU7YSbSifeaM6whGywI3GrEQ3mKiii16jMzA5zfI8osh5k84/t2sUNm6QYwO4vd5b
	pVsH7OBvKfPKo+SeDiEDunHw4WS7RNcxMuipCQWWpvoYhYmpKHW0HwUHKE1wB0YUU5pt5cEN1ty6f
	McWztzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x064T-00000006W08-0SY9;
	Fri, 28 Aug 2026 23:33:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x064Q-00000006Vza-2oN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 23:33:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-499add6348fso8085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 16:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787959993; cv=none;
        d=google.com; s=arc-20260327;
        b=JvPzzAfXKpEFS993kt5Ldew6JNGrdA9ghdB5XQNp2+jEim+xn5nBKoUt0JF0QK4mEf
         BgfewUzAT5Br1efzlAgTI5+uP92d2WclA9w5cXcjOLy5NOToN427ybCVH59q73prsaRb
         V+4eVoiXYVXaBnox48DxPSWibAA0Urj9QdM57WfvEHxSDJWnimvtBEQk3qINtwb0b5jh
         ZoOohM7i+G4/PVPjmwc/yX6z1Db0ygHuQ62V+tg/J3ghrLpm0JRc6ueGFPmcyYTBDc7S
         vZ/XlPw0YoMfvgdvSG6fvDNmfhLSNd7DtpBeUXR3oi2nTEj42jMirLEQQzoeC52NG3gK
         wnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=;
        fh=tr/FzT1FQ0Y2x2Vpf0NoC1JeVDN6cXT3P/uRd0m+uOA=;
        b=pyUU1QfuUtAWtlOeCL5ULIeWMnHGWuHTwEvSrJytqa0LDF0JHt1MOIjAvEqbLUeo6e
         16KeaZIsjLCHeG+Pr+Lo0q9D3ygq4y35OOiXOZiaRqxO8yeq+nxw3VLCc8QUh0CR5/UP
         ysugHQqowN1NtLgClXhXJqu9ERBClti8gGH9W9u6wLSCQ39+o/1bl/5PCD1uoSx9v9xp
         cXtjYeJ0O8MaRj68hhvlsepqjhlxnJy0Sjs+LcZ9fhb2F85Sz3UxQi4Jvccm3d3Z+N6T
         n5n7+ycC1GDSsesirjGbwKTDWc7Llo/nt25iNOmRSIUUbu1Fft51RD69IeGapyihWp4D
         U3/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787959993; x=1788564793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=;
        b=h7fsBgDQvHW3Jb9LE+d9M7B844Odzv+mVhWvdOHchrm+ycyOb+//Hwy7Rw8Ej5kCpk
         MZmslvXf6gkzhWuhiO9ik2Xf73E0i3Z80Z19fJBgaxJc1Qc8wDiLu1tBVmDV/KERzi5H
         vUNHvu4WCnFdGcavYpzAPi02G4ektswuzbKhZmIf3MNSpq/SIg7ZOYc8mFPBvy0iYK80
         PtDvx+Vw+Zcu7semGz2b7sQd7FjeJgZrKF1Noi4n33VK0T5FxlNeYw07I6tX1WHMCF8c
         yVD32RT39aRujvTAQ2rUE8MbgnKk/6rNqG4VAmP96D2Gf7Y0Zld+NZNbJZDhhJCoYgxy
         jX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787959993; x=1788564793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vPbHw3SXRt8c1h9FzmacGhPD5cdWkOAwAK9dhsy7doU=;
        b=YAKbDR2IOfGDAW3FttO5tJvKHm1wzlqR4PG/Vie3RwrwAHF6Nr2roQdockF2nLCjkR
         GdFbsX0uI1xjAfsfJLqqLpYqqmeOZT3gV8BwRhMRXZ8I8HatAxaMkohOQwQjrdSS3iPG
         J8KhAsLfJZqoitzEnRJPMidLEdR4uo3ZJDpW3gW5/lCktGewwiiCapcydttSRHUwcv/S
         3IH31903yRtkI3m8pfLh5IAEi9D/hkpjBz3veDXS5bG2OrjMvixHD4HLFyJKFmJArn/4
         8FNT6rlY+dm2mut0v/4ntF+FK5xecSMfrEAlAlphD/tSXxz+O2fq72+bwo3FHmHDfi19
         qT2Q==
X-Forwarded-Encrypted: i=1; AHgh+RppApBtJKmURzqYHYkQE1txgL1+R6gN8DNmnkRxkqkhTNRL3OehZwf/CQIAZmuNlNE2D2TEoPiYBfrKneq7hhCB@lists.infradead.org
X-Gm-Message-State: AFuF++leK6sal0ScCgzajlCI3rszUHFWk1l0qv/Jho9HS9rhbOY2ilqD
	J6PCpI0kAPwKzq78IavDGcF0j7DKaszPLr7jYMXP4I9LauEke+KPeYFmHMaWfIpV89GkrXh42aj
	m2rrOXluDVvBVWE30aU3e1UiRe7ykTxeJRq3HiIt9
X-Gm-Gg: AR+sD10QmDmpxkOvn8f3/YR15xUCgiNyvfNY3QTtnHBmO3KLPtDzopeUn/HRSktcvd+
	RoFFF9G2SusB/yy93/V3JdBdDwI/9lojAZPoFomWWtOl7YT2isXXYrPLojJy3fN0ciAkxEQVUHI
	hq2sBkn4nGqvi+tgMu4J0HTvdL4JL9/xegOJSdaw1lnMt1GPzHwOOwzhd8lXsydsIzUd6yjSRqM
	dKFpZHAcuneLq8UL3Zj6t1ah/R2Z8tuM4KtUlgwVU+OVsVi6wZ3t5RLnb/YXcYIH6lv0rdYL5ge
	97pCKqoLcTpnxgyJ68l3ax2/v7bWSrgMYkoW/cPb8BbJkSqoasquBKGd7T7fmueESIpyMyINg6Y
	=
X-Received: by 2002:a05:600c:3794:b0:499:cb15:4511 with SMTP id
 5b1f17b1804b1-49ccbb61af8mr349255e9.8.1787959992396; Fri, 28 Aug 2026
 16:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828125706.GQ687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828125706.GQ687043@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 16:33:00 -0700
X-Gm-Features: AcwNN1X4mjRfDUQTmdB2Q8G8afN4YKn_2mHhFiMGwyOfarmpU5bToKMeymOANtE
Message-ID: <CAOiLmNG8XUKzy7uyodfDyuSBKJa4LujqSRKhgmOiRUSFEAEjFQ@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_163314_786103_0E218272 
X-CRM114-Status: GOOD (  20.91  )
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

On Fri, Aug 28, 2026 at 5:57=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> > +DEFINE_CLASS(allow_stack_reclaim, bool,
> > +          ({
> > +             if (!_T)
> > +                     current->flags &=3D ~PF_RECLAIMABLE_STACK;
> > +           }),
> > +          ({
> > +             bool was_set =3D current->flags & PF_RECLAIMABLE_STACK;
> > +
> > +             current->flags |=3D PF_RECLAIMABLE_STACK;
> > +             was_set;
> > +           }),
> > +          void)
>
> > +     allow_stack_reclaim(prev);
>
> > +void __allow_stack_reclaim(struct task_struct *tsk)
> > +{
> > +     union stack_reclaim_state prev_state, target_state;
> > +
> > +     if (WARN_ON_ONCE(tsk->__state =3D=3D TASK_DEAD))
> > +             return;
> > +
> > +     prev_state.val =3D READ_ONCE(tsk->stack_reclaim_state.val);
> > +     do {
> > +             target_state.val =3D prev_state.val;
> > +
> > +             if (prev_state.stack_state !=3D STACK_PREPARE_RECLAIM) {
> > +                     WARN(prev_state.stack_state !=3D STACK_IN_USE,
> > +                          "Reclaimable state %x for previously running=
 task", prev_state.val);
> > +                     return;
> > +             }
> > +             target_state.stack_state =3D STACK_RECLAIMABLE;
> > +     } while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.=
val, target_state.val));
> > +
> > +     if (irq_work_queue(&tsk->stack_reclaim_work->irq_work)) {
> > +             /*
> > +              * Take a ref that gets released by do_reclaim_stack() so=
 we don't
> > +              * have to worry about races with remove_from_stack_shrin=
ker().
> > +              */
> > +             get_task_struct(tsk);
> > +     }
> > +}
>
> > +static inline void allow_stack_reclaim(struct task_struct *tsk)
> > +{
> > +     if (unlikely(tsk->flags & PF_RECLAIMABLE_STACK))
> > +             __allow_stack_reclaim(tsk);
> > +}
>
> So you have a guard with the same name as a function, but the function
> only functions when inside the guard of the same name. WTF ?!
>
> Anyway, it looks like you're sprinkling this guard around a few specific
> block sites. Which seems to suggest your PF_ flag *should* have been a
> TASK_ flag, no?

A TASK_ flag is definitely better. I was thinking in terms of defining
safe scopes, but that just complicates things for no real benefit.

-David

