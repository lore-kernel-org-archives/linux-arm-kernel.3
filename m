Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D9C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 23:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=; b=F2a50HAFwgt5acZJsj/r4WKqNi
	vZkAPnWHDC8Z9lSKzq+buumoChVHMbrGBNzXLx9z27+Vk6tLBaSW3z1zKVbJzmNGUATH0DnwwVnzI
	byUnXLS9IuKt4vl7zNofaXQb4w9b4BGReK8h0en8Unu9n4Pga1WBfZh/Boxoqr7PQQjOoVPxiTiDe
	ZwSEN+chQKrwqD1FfIkqLXelWSf46guahnXV7SOlLRWOJjj3JeKki7ihJYQcm8hKuGdXoTloxvzbI
	9lJ1kRAcQsn8LrrdSridPgNNUQ2u/KXCPwtYWvW99/vfdqnFm4DUYNa2+xGfaaNRr+L0TghtT927P
	q3KEBwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Xcr-00000001Hc9-2V7N;
	Sat, 12 Sep 2026 23:59:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Xco-00000001Hbl-4AAG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 23:59:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso21142725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 16:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789257554; cv=none;
        d=google.com; s=arc-20260327;
        b=VUeIjbcNsSP+egZDKtO8yrSWIp83I/A9CUcIJyNiDqt3+/JtbdPVOK5o7KW1nQMfnV
         xEbo+V1sJtfq72PE4FH5j+FnfhvEPKvWsWOqH93PW6gX5tVZ3EaeNzBdi4JEvhySoFQH
         3O42JqS39giDI1/FGzQwAGaBYyHQLMhP22TUJpHpaK/h787wqF+gGDAT9awoDD3zX9mM
         JQVu+caq0lObbA85S0Xsd4c6tkjHevSai2Bjlrj0IBHXIAXKoe9yGozf6LGQ9976ACEd
         yhH73W8sMqKbYmDzNns9kbZKa9LL6SxD2Ca3LE819R4MWyTMJ4qq8j82AhGQ0mm4IKag
         qKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        fh=hP1xefUBC8DbJpm0WZ2FG27g/UfMOo7Rt4dydAtNKjc=;
        b=pT80tCZF3pqzuWcuCJNWfl9XE5fGvuyl/72W9QUaOA4F1kVjh6amAeVDQSdC1Zk/gJ
         ZcslpYsfvlOYrZ9pFem0EtDwZLwxpg2ikPdcp5VAANJhFlhAgFwqP8hkbaF3U8sA5y6H
         tj2sVrcykvvMkEfyVBZtolWou8Nh5CwB4folFNcFwsFbJ/wWdI7+v/nWA9N1eWoJS66f
         vxMLCpIktAiFff/PzHTaT6najaAtmWGcZ+Uswp1xAzjK83T5HuqpyTWM4Xa2NNK0vNG2
         O5uxiVAd+Ts05Yyin+2Fw5nR6+UR57jExMu1fr9KsJbvccjOuQTvMpFg6KFGy1cIoyDj
         7QBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257554; x=1789862354; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        b=BmX4Fpcti4xgPQWGWMGEWIQ0juw6DEAIaA8CMrWW2P3D1cKVEdM/3q2SOWvNQvNOKy
         WV3DfrHBt47RhvKR5kqdrqjwvVXBeQjAc3DOFCExP8dPfLG3OzbLMFUC3Oxb2/MMe/1J
         zNOrjouo89mqv2zGKonXI9EhzkrTyELOo5qRDp3qkIDSzY2SLZeJqYdkXQXzGO4YZ7K0
         3RRg+v8uzLyqI9OewAu3V06U/Im62k5jSG3YZ5NNUOrS4N2gfumHN7uq1Zg1qQVVATQ8
         P5UhrJ9ni+wpt11bA5JrUKpNzlVCyaael1W1MlVqnJk8mspolFv3EYjMuCA/kVTUuaai
         uPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257554; x=1789862354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5whm1ZGtSD6d9UTQoSVGX4pAamqW3MhbLVJJEUPVUGg=;
        b=j+/fqRvsNw8ge4hX/CZUGKvw0qJz7SKNb8UNg5hrcSLxwtVClQvUzO01ozvCppUNVa
         xzcEEJaS32QRVcn3d5T8FARcSHPS/KoSAaEkYo65r8KAtLegcgwTZttJd7uqq6ehN8uj
         17oeLftPGTxxHCxJUTnQmqwNFsh4yIuPjZ0FDsBH7cawy+ub0snD4TjVVp6qWt2u11xw
         sje5z2U7JFaSa9YKXQQtQ8LISAgoINOGMzgYHArcebWGSFvRgCwNBvyYcVZhZqkuAy1o
         hyBfI/1uBqGDfbZqwGvyqgnI2SvhH4S08ycpRbPbGFlayWVueu/AZZC1J5Ky0tZLI3xa
         I14w==
X-Forwarded-Encrypted: i=1; AKwUvBz+IGc8xPNg16m3U/QjE5CWERLolC+zQa+ubVE8fMAHRiW8jqWHI+Twk/uSWpUdjpnU4s3l5dakr4/gMVK7SmZQ@lists.infradead.org
X-Gm-Message-State: AFuF++kW5xhx61oaWY+XbKtxVYM+FKZHj2TNAP7AyL0qahyZMyQ6MWzq
	kl5a0Iweflt9/ReEJvxqD21Uw+TzVK7z7IHjgFiNacUW753mfGM6C2qF1kcpPkVGNiS+0P+4lJQ
	3qeKREcjLpEfGc/HdYB0oOSnWkCbisj0=
X-Gm-Gg: AYBFou1axqvvIQ/gNa2K/jeMdr66mmhg+nFiRDENOnWWtz4f+dP+7vreg3MBDxv8ojE
	V0FyacqQZqOmmQv6A3E8+mRxmyx/g9KqTeYwjCBY+o/AoTkLi8LRgGVvygCGYHNjSOrm6CmDdEt
	o22BeHZv8FNa9oPEzuWsPQnSPkzGKRJXI63L7q0jWWi5wtuCOf8lU7+7iuSvR3/oBLv2qSXHm0a
	8RgOvr4aMqi9z7guPLJ0yUoBkGLX+rm3Tz1qcYed6kJoQLNArzyG1/7SFAT73l5QUknU8aTGRSN
	AuG/EqkA8cMYF6BeYsptO8FclY3EbQ1gS4tcKVlqrElN3IDRnTmwP9owL8XjRw0FCCW8JTj+mf8
	O/ED54etFEEjGrInHg+kPStFZjxzs2xRILvEOGI8=
X-Received: by 2002:a17:903:1ac6:b0:2db:331b:e187 with SMTP id
 d9443c01a7336-2dd2a1e0a15mr200200855ad.8.1789257553733; Sat, 12 Sep 2026
 16:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com> <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com> <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
In-Reply-To: <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 12 Sep 2026 16:59:02 -0700
X-Gm-Features: AcwNN1V04v_YLyVyvshDjEX_boeHQmR-dgrTXGEZk0Tlq9YUUBiA7_5E2kzlt5Y
Message-ID: <CAADnVQLQs-+-cu2R3QrHppcxOQt9m7Hi+grr4fOnw8m73kQn0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Andy Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	rcu@vger.kernel.org, linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_165915_042287_0D4E50C0 
X-CRM114-Status: GOOD (  20.45  )
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

On Sat, Sep 12, 2026 at 3:28=E2=80=AFPM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Sat, Sep 12, 2026 at 12:40:55PM -0700, Alexei Starovoitov wrote:
> > On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
> > >
> > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > other thins is a bit faster and does not need to hook into the schedu=
ler.
> >
> > old kernels? I'm confused.
> > rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
> > and then calls __srcu_read_lock_fast().
> >
> > Are you talking about some RCU branch that you target for next merge wi=
ndow?
>
> No, I was thinking of rcu_read_lock_tasks_trace(), forgetting that
> rcu_read_lock_trace() is still used.  (For good reason, just be clear.)
> Your comments are quite correct for rcu_read_lock_trace().
>
> Hmmm...  Josep's using t->trc_reader_nesting would break for
> partially overlapping RCU Tasks and rcu_read_lock_trace() readers.
>
> But yes, your #5 makes sense:  Deprecate RCU Tasks, upgrade RCU Tasks
> Trace to check for preemption from within trampolines, and move RCU
> Tasks users over to the rcu_read_lock_trace() variant of RCU Tasks Trace.
> (Or am I still missing your point?)

Pretty much. This way bpf trampoline stays as-is. No extra overhead there.
rcu tasks users (faultable tracepoints and what else ? )
switch to rcu_read_lock_trace().
The only difference for faultable tracepoints is
extra t->trc_reader_nesting++.

I have studied the rest of the patches in the series,
so this proposal can be completely off the mark.

