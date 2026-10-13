Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060FACA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Py5W+zOf8jcv9SphAVIYRIsYaiROXNPiORfkJ1reQcA=; b=PeVBuMNGR5riQYPDzzIQvCegUe
	mV7ZHHcwwG7Jlncq/leIT2dgCZhVECV0NLUvpgujgQVJZI/hG0mLER4bDcjvFM1yHGsdqjWyqK+UJ
	Ee7Ya4405/XzgLXj+gCQOU+R5mT4ZbT9Q6iDabqnmjt2yE1qn3XBdRQYV5ku6w3nND0B/TvPYRXTn
	GZj70Ofw6jnq+znqLe7/epwXv0GUtTSNVwdQ/6OohxjoS9ecOXcwlb/uj2shrtEuPuB6+koUZyg9W
	04srvfSW5NTegDhrEYo1YTQR6UTYFCK+Ra/I5Ks+1GvE2Rd83GGZabyR/3kfzlZsMCWGd2pWfyGoU
	ewXtP0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSY1-0000000Bpl4-2B4x;
	Tue, 13 Oct 2026 02:47:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSXo-0000000Bpia-25t2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:47:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB9AC41A9D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02281F00898
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 02:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791859631;
	bh=Py5W+zOf8jcv9SphAVIYRIsYaiROXNPiORfkJ1reQcA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HbLdQSZ7lUz9oL05RWz6k+V6Qv3JS5sb152wnuh9/C7fqzhiLnol9W4Zo/AYHud5+
	 G9kAB19LQKv+cDKB7IHLRfqSBGQmXA5Zjuv8mZFFEkFrZaCX93O2qHj9diPwd7wT/o
	 iQxSjMRoHzmyMWaMQng0yWVlJzy3frz4iMdaiYe0qKzQcNccon0pYeugOwWqt63NKk
	 CvskBZhjH7jFs18BsTCEE/HnXlyziHvOoW2FIvNg/52GfWxYuRgsYprVUK5/LSneiD
	 nUyyAsuRweVt25aLYJHkWXWRZ6RYIZ/Ppmq8Ce0nTi6sOXlUmqso/KpyfuXJcscrNw
	 d9zzw0VVzbABw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so2252639a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 19:47:11 -0700 (PDT)
X-Gm-Message-State: AFq9FYJH5r4e29tBLsSTr4ERWUdsq+jeMzMq7XfKh/rttS3+Y5fisEIl
	DyHCi0rE2yBAxOzh+s0FGvD4cocMpXQDQmysGUR4YyFWd+JSfdmKPWaTs6dfQPmcdCXVfv5SmgQ
	0o2Ico1c6qz59X437XZ+jmG8bQWZz2f0=
X-Received: by 2002:a05:6402:1d49:b0:6b1:c327:a9d0 with SMTP id
 4fb4d7f45d1cf-6b1c327b8acmr3296104a12.40.1791859630439; Mon, 12 Oct 2026
 19:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261012090431.TF3iVDsk@linutronix.de> <CAAhV-H4=nnhbJS4srmt7dNdgpkEZ8_RQ5Z+0baYMiXF1UrJ3KA@mail.gmail.com>
 <20261012102143.lpVrHb9R@linutronix.de>
In-Reply-To: <20261012102143.lpVrHb9R@linutronix.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 13 Oct 2026 10:46:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7xME-UrgMHcfY41793yxWyvgEMAufwgcboEL2q3Jg+VA@mail.gmail.com>
X-Gm-Features: AclHuK-5nGNIjnalns2TTYeuiR7MEop7yTmsqLsf4e42_RR9QXEQZeMe2PdFpnw
Message-ID: <CAAhV-H7xME-UrgMHcfY41793yxWyvgEMAufwgcboEL2q3Jg+VA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM, ARM64, LONGARCH, XTENSA: Delay HW BP notification
 to task_work()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>, 
	Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oleg Nesterov <oleg@redhat.com>, 
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Clark Williams <clrkwllms@kernel.org>, 
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, James Clark <james.clark@linaro.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jiri Olsa <jolsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Oct 12, 2026 at 6:21=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-10-12 18:15:51 [+0800], Huacai Chen wrote:
> > Hi, Sebastian,
> Hi Huacai,
>
> > > diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpo=
int.h
> > > index db199d653dd1a..91e8d80220c54 100644
> > > --- a/include/linux/hw_breakpoint.h
> > > +++ b/include/linux/hw_breakpoint.h
> > > @@ -85,6 +85,9 @@ extern int register_perf_hw_breakpoint(struct perf_=
event *bp);
> > >  extern void unregister_hw_breakpoint(struct perf_event *bp);
> > >  extern void unregister_wide_hw_breakpoint(struct perf_event * __perc=
pu *cpu_events);
> > >  extern bool hw_breakpoint_is_used(void);
> > > +extern void perf_arch_hwbp_send_sig(struct perf_event *bp);
> > > +extern void perf_hwbp_notify(struct perf_event *bp, struct perf_samp=
le_data *data,
> > > +                            struct pt_regs *regs);
> > Maybe this declaration can be put in one line because there is no 80
> > characters limit now.
>
> We don't save much, do we? It looks more readable. Maybe if the perf
> maintainer requests it. Looks like waste to repost it just for that.
>
> Any comments on the looong bits?
Others look good to me.
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

>
> > Huacai
>
> Sebastian

