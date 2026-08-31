Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4283DC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=; b=GuGvWHANbeMMMVYFUeDcBZaTqs
	tDuHm70oEZa4TtYbNNyw59L6ugF34sqEC6SGbQuwm5GOi1aJj5jJm2unNXv/McZdAm3iVGq0a6+y9
	PSm+iOqXLnj98UCWXy2CWPJyMsrcqBdECN6qSnh0fU1ha35ce3bG+1eSJzWhL8I+VKwHEWum0QnQX
	ChpIEn5+xsSHcwVTVwODybz9JQOvQ7ekvzmNF4UKi1rgF1oiIJvcA9x4BAPMo/TtLj3VOTiDNuctG
	FCLidrtHyHCJq5D3hXjKbfBleYZ75S+CyheM9Ubp5XLweSvuKgTnCfswBBtgPXh5mmDzmjupIihwP
	0sDkNywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x163r-0000000AE6e-3BPt;
	Mon, 31 Aug 2026 17:44:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x163o-0000000AE57-32B9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:44:45 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so2125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 10:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788198282; cv=none;
        d=google.com; s=arc-20260327;
        b=clzqWUxBJMdC/wvb44gyhM9fnwiT9OxIsWCRtwsUE/rLOqSvtGDDLLc4RyW5d2VJtN
         ptVI3NvrkusF9pslgnHnW1sHbgESMAluiREN5MwZ8LmWvAA8IX0YJEgHHeqzhTKdh6Hr
         XCEDQMmH3/3W+UClHzSg/NH2PqykB63y6eF61ELjCSKX03An4EzShanWh75vrLUiU+Lp
         pEarYYnXQtR9GgLl25qOm9T/oP2AxGkT1pb21FZOcX5+mBb3Z0DYcjleUDGkczRrSaff
         WPrs6pA0kEthM1mdrgk2we+KM0GcuBbpVqZNbXQWThfVQt0wCk3YG6LcMEHRrls9Q/wM
         eqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=;
        fh=UmK8nrby14bLn9CGqMY1omFOuxP+rLD9yXQIu47y9bE=;
        b=VfXNO3OVit/BeeBrL8rF3S8z5k8ZXNoyBtjOrQKwI8on6AYsBFaczK12lPPTaJ1Nuj
         c033ZI5h9/yjRSIdcJP3Gi1XrmyUcdPg441BdidwALi4IAAgRt5Os8fiOyzAbTlgEx5B
         izhcQbyh3GT6roxT5gaR0YGuDepoPOjfeaqqjAvyG1G/7YBqh62DdFVVVY73Ta1S9X10
         lxo1+BX+V5hQagEhpLdVZUJPaeGKgnAmGaVib3ajvxhjBpr72nXJbaHjRzMMZM9bDAdD
         zE25RQf1Ykh+VnR4lVTbSvDDPdMWQuPQN9/QfRWCVhBEpl32RYlab05Z82pP0dt45n+z
         BPHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788198282; x=1788803082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=;
        b=TRbF6QFpNdZ/9r4E3prf10wAis6xi3Pc6iBKEahjqdceE3/0/wqt/Lerx+pk8tmNOM
         HexCR2tWUG2Y8qauXhJ1KoO1wsjvCW2PTJC5cDnNp6c9KZy59CDuOSB6siLGCLZ//8PX
         LLAJIQVTOIzqaeOzA1Rnaj+aQm7XYjXM8JGNnBD9aAzGPDOaIybVNtOkFl0XNsLrAzt7
         CUH2M4/2FieR+ni4I0QW0Uy/4n9pPGgx+ofbODNQxUaD39gU8J0R4td56ouZMRRekziR
         8aYsZ8RQf8A/b3o5wSFBNFOD6YBmMZUSMp8iS7K6ewkedRRLF1V+cXHncla97Jo5cvZd
         rfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788198282; x=1788803082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISAzL6GuJopoRMWQpQWk2e7HTJAN8rWZ7VQ5HvwdBSw=;
        b=f4UFWu3/Mq2b9MJLo3C0x9psmtNVS/NmoNP9aagTpew4IGrbhw7hVQha2hJlGYaCQl
         2HIu7DE5SPKkY4vdwEq1WPjbEK2NReojaDALRyszzgJz3H9sXFPJ+mhoqDLDdKrUlAJa
         /eHpbF4Y1VB2IRZYMXPMqrUQk1w8OpBsIEOpsZLtRhhu0wySHDNcD3VpmCVJksGjfDiq
         U7psRF8n14YPVkL7PkoVdPJlEG6/qxsTeIWnvZGJ5k1MQ+gnAcNEhFTGjSnwmkEBN6hY
         Hgl+2+GEB52hBrSb4YWFiWQAq8rwXEMjKQzX1pU96H6zLKMpJzMvY+OTn1VO9OKBbwhW
         S5lg==
X-Forwarded-Encrypted: i=1; AHgh+RrzusRJphl83gg3vZ9FOEsfLuaQsQKkcc5nZOHIPy5CCkEsXPJG0tXIdMDMvD4Mb6tmyiWWa73aOvSkJDcvWXfh@lists.infradead.org
X-Gm-Message-State: AFuF++miD5Bt9dWmDucTb2WDTYMjCP+W803s+wc+3akGGWiIG51ua8vJ
	F4lE5tU1Q+mb2P1f+dgJtNCqsgJBf6M3r+mZ7BcvlYt/eDZ3KmCeoyTto7UUxGFSCmD73HLXqMh
	fpAQeANq4AI/yJlz0DtDEUWzMlPXp96sgy9GXHXgB
X-Gm-Gg: AR+sD12eo03/y+pIv7EvQVz3C+q6YYB5QFLVLEuOVD+sBCI/UxtOvjTUuTsq0g46031
	3y3dboxeW4suH5hNXvd/6PplnO6pdU13twpuqhG4r6A0zcOcX/pIbZLVAzT02DgbfAJYwZG9LkA
	eaF8+KmYbHgJ7fFkIPHYVlWW3mGlA/2anykcj4DpY8pTJuxLR/b/EcH/zv/y1HRFz/IAr0uNTUv
	G7E5S/tVpKWYmdOQyCOcWN+w0n8kT6QU1WaSsHTdCmQJYWutOTJwnCtWlDrboySOP6qexWVYxRT
	UAT85m/pd3z0+JQMuoE3b+iihVAsiXJi3HxHiB7VDhVQ5rs0ug9eFxIKDgw9z60PmHg2+aR64uT
	AiPBwQwjm2dupB9o09nEEq0udGjDTuDy0RSX6WmakE28=
X-Received: by 2002:a05:600c:6d8a:b0:49b:8eb7:4a7d with SMTP id
 5b1f17b1804b1-49cdd243062mr28165e9.4.1788198281222; Mon, 31 Aug 2026 10:44:41
 -0700 (PDT)
MIME-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com> <20260827232948.2520558-7-stevensd@google.com>
 <20260828120408.GN687043@noisy.programming.kicks-ass.net> <CAOiLmNHWGSwAqH815X3JWMrQCc2nh-fRNsNZ0hjQGv8JvFndag@mail.gmail.com>
 <20260829083929.GZ776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260829083929.GZ776954@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Mon, 31 Aug 2026 10:44:29 -0700
X-Gm-Features: AcwNN1WpmAgjgQmF9GpDiXzg08-hj-z0i4rUlR_td_jtRLd8aXHDJ1pfdit0KWY
Message-ID: <CAOiLmNFsuaBf4C9=d5xrdi8SXYgFbjjD7ZnK1+G1=RaHquVinw@mail.gmail.com>
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
To: Peter Zijlstra <peterz@infradead.org>, shakeel.butt@linux.dev
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
X-CRM114-CacheID: sfid-20260831_104444_817884_7B076292 
X-CRM114-Status: GOOD (  25.81  )
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

On Sat, Aug 29, 2026 at 1:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Aug 28, 2026 at 05:18:05PM -0700, David Stevens wrote:
> > On Fri, Aug 28, 2026 at 5:04=E2=80=AFAM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> > > > @@ -4320,8 +4319,18 @@ int try_to_wake_up(struct task_struct *p, un=
signed int state, int wake_flags)
> > > >                * A similar smp_rmb() lives in __task_needs_rq_lock(=
).
> > > >                */
> > > >               smp_rmb();
> > > > -             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flag=
s))
> > > > +             if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flag=
s)) {
> > > > +                     trace_sched_waking(p);
> > > > +                     break;
> > > > +             }
> > > > +
> > > > +             if (!ensure_stack_is_present(p, &need_deferred_repopu=
late)) {
> > > > +                     WRITE_ONCE(p->__state, TASK_STACK_RECLAIM);
> > > > +                     do_deferred_repopulate_wake =3D need_deferred=
_repopulate;
> > > >                       break;
> > > > +             }
> > > > +
> > > > +             trace_sched_waking(p);
> > >
> > > Absolutely not; ensure_stack_is_present() must not call
> > > repopulate_stack() while holding ->pi_lock. Not happening.
> >
> > The optimistic fast path for repopulate_stack() could be modified to
> > try pulling from a pre-allocated pool of zero'ed pages. That would
> > reduce the function to a couple of memcg_kmem_charge_page() calls and
>
> Afaict memcg_kmem_charge_page() ends up in a local_lock, which is a
> spinlock, so that cannot be.
>
> Most, if not everything, in mm/ is build around being preemptible and
> thus not suitable for use under raw_spinlock_t.

With the recent work to make memcg charging NMI safe, I had thought
that charging from within the scheduler would be safe. However, you're
right that the fast path does call local_trylock(). I didn't realize
that only works because of an in_nmi() check inside local_trylock().

Given that NMI safe charging requires only using trylock and handling
the !trylock case, it's not infeasible to have an implementation that
always skips the trylocks.

The alternatives to that would be either not uncharging on unmap, as
suggested further down the thread, or using deferred charging.
However, both of those approaches would make memcg charging less
accurate, which is not desirable.

> > then vmap_pages_range() to repopulate the stack's page tables. That
>
> vmap_page_range() can end up in the allocator, which I suppose is ruled
> out by the vmap having been populated before, but it still has a
> might_sleep() that will scream AFAICT.

It looks like when we go through vmap_small_pages_range_noflush(), the
might_sleep() check is missing. That would explain why I haven't been
seeing errors.

We wouldn't want to remove that might_sleep(), so I guess this would
require either a new function or flag to support mapping into existing
page tables.


-David

