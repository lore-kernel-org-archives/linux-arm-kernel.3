Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E86C61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 00:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=; b=igxboSQUiiq38qeE3qRSeL23rA
	cTXHw9tYKU4hqkHpiQA2koY6f8rvJh1Qeh1hU5tVcbm5KdpKz2/Se+b+mYUQgUTEkCTFyFeTYt+dZ
	J/JHVH1ruuXO6Bz+TNSipRMewDqgJB2OBpHBl545zi7KLVsC5pMKBq3ZDjSZi5kWuL+lOzL0SvGTZ
	KTBBzyLPr4d1bbrF6Lx8Y/morC6/z22Khh74y/7Lmwjrk1OGbPWZ9tFMrIaeNrI+OGLnS2gxgM+Yk
	2ceXHYDw9MmcNwgrJdzaaiHct1yd9mXghF+V1ZeCaf1CToRrbW0E1SkYQG8/J0+S9cd8r3wfVcLUt
	WgrXhdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x06m6-00000006XHN-2Cf2;
	Sat, 29 Aug 2026 00:18:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x06m4-00000006XGo-0gty
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 00:18:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-498012a61f6so16475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 17:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787962698; cv=none;
        d=google.com; s=arc-20260327;
        b=ScVhH0WFCxTL4PBPA/CktN/hanUvhYxxIDIbTl9GyG6+rz05lGpxtUQ1FCbdM0P8cn
         GvnTAs8rFvKg7U35KgXhEXoTygqeJ2/sjtSMLIUtQDdytE5Ii/DwsWQmbSZZtYOvPP/I
         R5XMABgtPEQzpVA05MqSoc3OXleC6s2nSZ0N/Dkg81tKhNz7SZzUMQhdjSXRss+aVV7w
         4DW1FOLlOUtUNZKU6nDTG3hRz4YZ3BjHozFaVYwCJMUtlk6lm0von97V6AQDJGHky5U/
         HWIR4tL8B9MXbMgBL3HJnoAouBIYb8wVpEUgYHwmOOobTWB5lNTvKlyjKYE6qv2xMn/r
         wZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=;
        fh=KZ4Tg4gDCNogetKpOPnt9ufkiDERxLaDAH0Pc7te0P0=;
        b=QLI8NwOsMcFLO/FfxL36OHYQHWRAI/sT/YU+/yZWhWW8/ENhBtnRiEr1ztbe/PmYw+
         mXLSWAksIXTp3j8lpeQ25JAQu6DMbfXfZQLdLKZdAMhNwbirXMkBxBaA6jyDKFTkaq/3
         +rSDxO45S+6u9qrBgn6zeU9No+qIcj517nzZKDai+oHd+2l5cxmemQgazGkEP0UW7hkw
         WDNz+pV0PYyKvpYcoM0Dcs7VpUpWci5P0FWvTF2RPbY50V5UwLD0r2pUZwZq3o0hSctC
         jbfm41fjnTuoiE12vD5ZGhe4MAOp3VOpIZ8hStPcLTbxjIJQWfToSgXMnZiqbQxjhORk
         wKrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787962698; x=1788567498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=;
        b=Xb1jwhn2LcXaal5/Icw1FUkvN4ljPSay8/+/hyXlo0IsF+W/LSmYdG3e7tC4782enu
         eoIil/jy5lf9SyjcAMVamsPaNaJYfyW/aWWV9e3Aoypv7BKunz02r24FkWB/0uhPRJ6/
         +yvAvUDSwAs1dOapkHB9oAdFiNGYQkH/FciUoCS1CFzxZcEtppx3V8dj2uUgq1WtLWtR
         MEBtc3DYdu5nx4XgSX9y8E3XpPI1qURCG8pm2hFiFfwFr2L0OCy0vnaptLWNIXzhQ2FA
         DdKmCHQTuKy2C2E7wddkzZRBQC+ChusHFAonR7W6taXJAXpqvV9B3K0NUgg+LdGJE0GR
         Trzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962698; x=1788567498;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92zwtXlgyBYYVN9xkl2KGrhKya15L+GyHSeWZLE5yFc=;
        b=HF+b3Tzei83Tjltd7HmbfRivcZhg/H9/A/OApQhT9OWP6jk40Y+WrA70C2ajKpUeDR
         sYoXgzJ0WAYrN58B5BkFYOH2ZRMpGRa5KqM5oZGFhMJmgWBV8yq2GPZYEJns+744O9Xj
         F5dwjksT1zYVDHRur07aQHQUK/w5N7sX1wYG4y1J9NQQdPHhXUakJCcczwS1LyDOeicH
         X3AnviGAzMvQZhuZdN41oxvsGhQ/he64H4Urp6j8/nmOnR+HyACnygL41NTKWoFaV/JN
         DFiCLiK70XhrE0HhrbqndOACDSp5/MswlscFJl/Sc2oAAe7xPPMGZgGxKbjoqx9Th+u4
         HC5w==
X-Forwarded-Encrypted: i=1; AHgh+RrgwPCIGMQ4Vpsei+YRNpsNQx9G5YiDTg3pMfxb8A2hwcaTC7hLHh8++9mPpo0k2QIqqJ0tdO2MV2RPmY7uA++L@lists.infradead.org
X-Gm-Message-State: AFuF++n3uP931wXXUlv/fJwB86yFlppUJkmJZpUylBIWAMXsD6tZd5OR
	E8yO8vYzqXeyB3zYi44U6VpSiDdq39yDztnPYI1gC48zNs5NBXcIgKopIpiOiBj+A68ZuuZOG+8
	0wypjvOYbbDau6WgptcxrAK8yVHYHwSxwmcWJyoZP
X-Gm-Gg: AR+sD12puGRVNPruP+4N2/8Z+Un6C2ZvZAxUx/u+/VnL02yG6RbqshoGherlVNnsNsB
	YNYy/91MD/OKkXGClSzgSQmtchzOekJ4uY/xHIEJ4Su+1IHpT6rS6ruNlRwPqWIuSczclxcxsI/
	vwTFpunL/LATPf0HKF2x+qpeJGWB/cLKICAI3EPB3W5OKXeMdcQKe9WWQgGayWvrKaugpY97Ood
	L075CGHsmRR3FjwTwMI0FK1+u94aRlQ0mBaS38KEQG/NQO4wzOjGnzzEDzBhvJFdUT1dQ2odtZN
	xhoNbHeaR/nFsg2He4FvEhLiFTlE7gMw5Aci62xZago6f5TXxBZ/vodLysTWRKxeTx8s5lBlnjg
	=
X-Received: by 2002:a05:600c:6051:b0:499:c46c:addc with SMTP id
 5b1f17b1804b1-49ccbb107damr428575e9.2.1787962697528; Fri, 28 Aug 2026
 17:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828120408.GN687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260828120408.GN687043@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Fri, 28 Aug 2026 17:18:05 -0700
X-Gm-Features: AcwNN1U6VBNd8zJTEq4mYD8VweLtljSgvulTToePYb44m-5Q8rEJ_yFqUyGXmiE
Message-ID: <CAOiLmNHWGSwAqH815X3JWMrQCc2nh-fRNsNZ0hjQGv8JvFndag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260828_171820_227403_616A8572 
X-CRM114-Status: GOOD (  18.29  )
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

On Fri, Aug 28, 2026 at 5:04=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> > @@ -4320,8 +4319,18 @@ int try_to_wake_up(struct task_struct *p, unsign=
ed int state, int wake_flags)
> >                * A similar smp_rmb() lives in __task_needs_rq_lock().
> >                */
> >               smp_rmb();
> > -             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
> > +             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags)) =
{
> > +                     trace_sched_waking(p);
> > +                     break;
> > +             }
> > +
> > +             if (!ensure_stack_is_present(p, &need_deferred_repopulate=
)) {
> > +                     WRITE_ONCE(p->__state, TASK_STACK_RECLAIM);
> > +                     do_deferred_repopulate_wake =3D need_deferred_rep=
opulate;
> >                       break;
> > +             }
> > +
> > +             trace_sched_waking(p);
>
> Absolutely not; ensure_stack_is_present() must not call
> repopulate_stack() while holding ->pi_lock. Not happening.

The optimistic fast path for repopulate_stack() could be modified to
try pulling from a pre-allocated pool of zero'ed pages. That would
reduce the function to a couple of memcg_kmem_charge_page() calls and
then vmap_pages_range() to repopulate the stack's page tables. That
wouldn't require touching any locks except a raw_spinlock protecting
the pre-allocated pool (or just make it per_cpu). In terms of cost,
this would involve a couple of atomic operations for the page pool
lock and the memcg charging plus non-atomic operations on 5-10 other
cache lines.

Is that within the scope of what can be done under the pi_lock? If
that's still not happening, I can see how things look if we always
defer wakeup to a workqueue.

-David

