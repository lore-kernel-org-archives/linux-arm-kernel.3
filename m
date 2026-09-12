Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516E3C88E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1c6suOtzZ2rRuH1TXxQJyOcddxpg3oryXf9dCc4tZI=; b=gRHiLtbT6r1+Wd36ua/ir3X1Pw
	syOkY4YoPCYuS8ybcLcsuz6JVodIZT6OBwGFnYGWI+QrcySGZdLMeD/8TvFRaWWeUup/Vp2iaiXkv
	nM+W1PtucyzZobIi+0cT2/8Rz4EZvP5jZZUT2aGdgA21dYaq1xjV+ckLxvX64Rz+iusMcqRblzamR
	MldPE+qARRLzAFBx0M05TIZUXyRtTl6RteQfx0qjmwtW63NrfB6aHuMqtUlXeWnFHPk4igk6U8qPP
	vV5tUh6mzLTsRnaUi73vud9DSm8aZ2bVoyfOAZdA/JCcNfmFFPwDVaQTpoq2gUHcXabY1I3xUoCcv
	wtVwxa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5RNO-0000000128i-2DL2;
	Sat, 12 Sep 2026 17:18:54 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5RNM-0000000128M-1BlF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 17:18:53 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c2c08ff3f8so404702b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 10:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789233531; x=1789838331; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M1c6suOtzZ2rRuH1TXxQJyOcddxpg3oryXf9dCc4tZI=;
        b=Dpe4WD7FkclejlDBmMPZtBiLV5XWsJhuXdikeHuMRx6RrEUCcdI5UDWDknNCGlWQVd
         UuysqAIvxkAYgotsxEQkJhLo64AMds06Q9PQKyVx6kwx1/QhMLAbrC3y5u7BBi+qhzyz
         H2fA0H2O+F8nE6NaHqmOREN3fkhI9YLCRJdrEqYnBbNboiTo2hd9C9wi2RiP1QSicaeJ
         80LUY4Ettu3QCL0lN5nLeL7o+bclUeaTLMKqZEhVYqm5Yc1/SiAuRW+gwdyENs4g3y8R
         t/DbHEctVW2hutZzKmindrF1t/o7R4+A2u/vrKJ7Yj2FKgmFNB//IXPL1q4tt/Cty6Ct
         p0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789233531; x=1789838331;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1c6suOtzZ2rRuH1TXxQJyOcddxpg3oryXf9dCc4tZI=;
        b=hbNgIqowip8WUNPgQLK/PkcHuBu+bVKJ/KcXm3n7gVU+/ZVZxuErLcM3hjV3h4W2Be
         1K5xfaTjJGkjGI2YcrhLkDTxhK7tBbWhIoSPWch4MZ3Iz01SScR+97z3gbAH9ABiTEgQ
         70kYBx9nyA7uqtYCXxlTcksHKzGeHRCrw5kqn7A0IcqDlESYN3waEWnezqYTivseM+S2
         gRNKojrwzUk2OYBOqIUNTuOvr4/Kow+WqUII/0HoCC0L532Ao0JUb4u2eITJYa4C5jPB
         9MMQ/vX/3YZ/xTC8DqJ9dO8TFt9XtPQWINX9RQlpNJOsqe6Qs96BLWqWCEGhLIAYUgbG
         ra6A==
X-Forwarded-Encrypted: i=1; AKwUvBxxG2tLGwAs7yhHlD5MCC9/OZbgrLQYOoq4w+V6Iopsg8Qsf/rw1hIXTjD6dPVEPlzbsrlI3qZenooqi4TqBjI+@lists.infradead.org
X-Gm-Message-State: AFuF++nZ3v1dyPMHu4ndQOubU6BEQNYSNA5laB7srpQFBFgK9OmQgqkW
	ctqGXbfu68cneQXBHedhm+Yfe42pF1U27aiathN+5gU1hvITwRO02QuY
X-Gm-Gg: AYBFou01aWmMsiRbR2Wlg8v8mK2z2JzVSjW/1wC9awBau4O4gz5VytdrmGBYY8obelP
	TBxBjrOz/orVr3icjD93+6R5aOOSJvXE89Ty01afuygY1sEeIXmPKF2kk1qTkB5hIOimdr1fSlL
	YSQRDPHZJ/qYXFwCEhS74B0yzpOiSvpx2Kr39Q7XTaggItiXwfFHQ4A6Apse7hLpQXU7W8Nh5c/
	xYkbVM46W+jDnKjoD0KhfIu5hfguBX/U0bJ/uGFfrILBbdIIwYeUVlHd9u7slom3hzdpEqUlVtr
	5kB39Ihem0vRXkWV9vQcxDslx7iu1cg5PMIlbLu1iNz+bqmsF8owcNODbvog7ETc8se08zwtuRE
	dOsgi8HrmamLe66X/3PmeNsn4Wv+Y7AKm3xcjE1mNJIiYC+u/dcDxJrvDHt/BS0QuRciCUyt/DI
	j0pBV9swcY4KYhustkrfsQb/6EnOcgn7xfgv3KbeUj355O5q8qXKFPoerIEHepKgiNOKPPIzZEC
	r8nE5VnZDAKvlvOiIVmvue2KLcaXi3TEzyawQwFOT3o4WmGo1DBosdLcrir39Np8g==
X-Received: by 2002:a05:6808:3503:b0:4b3:8323:8cd8 with SMTP id 5614622812f47-4c4a751294bmr2617971b6e.5.1789233530981;
        Sat, 12 Sep 2026 10:18:50 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:72::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4c3315b19afsm5495263b6e.10.2026.09.12.10.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 10:18:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 10:18:48 -0700
Message-Id: <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
Cc: "Josef Bacik" <josef@toxicpanda.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <x86@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross" <jgross@suse.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <paulmck@kernel.org>
X-Mailer: aerc
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com> <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
In-Reply-To: <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_101852_362147_0A651E01 
X-CRM114-Status: GOOD (  27.46  )
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

On Fri Sep 11, 2026 at 10:10 PM PDT, Paul E. McKenney wrote:
> On Fri, Sep 11, 2026 at 08:27:56PM -0700, Alexei Starovoitov wrote:
>> On Fri Sep 11, 2026 at 7:08 AM PDT, Josef Bacik wrote:
>> > Emit an increment of current->rcu_tramp_nesting once the trampoline's
>> > frame is set up and a decrement before the final register restore, so
>> > that a task preempted while running fentry/fexit/fmod_ret/LSM programs
>> > or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
>> > Tasks-RCU quiescent.  Drop the count around the call to the original
>> > function: that may run arbitrarily long without sleeping and must not =
pin
>> > a Tasks RCU grace period, and the trampoline frame above it is held by
>> > im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
>> > fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke b=
oth
>> > skip the decrement/increment pair around the original call, so the cou=
nt
>> > stays balanced on every path.
>> >
>> > The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]=
";
>> > r11 is scratch at every emission point and (u32)&current_task is a val=
id
>> > sign-extended %gs-absolute with the current per-CPU layout, the same f=
orm
>> > the JIT already uses for this_cpu_off.  The image is dynamically
>> > allocated text, so the instructions outside the bracketed region are
>> > covered by the irq-exit IP check.
>> >
>> > Assisted-by: LLM
>> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
>> > ---
>> >  arch/x86/net/bpf_jit_comp.c | 43 ++++++++++++++++++++++++++++++++++++=
+++++++
>> >  1 file changed, 43 insertions(+)
>> >
>> > diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> > index 2853e87797a7..a375c1b7bd50 100644
>> > --- a/arch/x86/net/bpf_jit_comp.c
>> > +++ b/arch/x86/net/bpf_jit_comp.c
>> > @@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bp=
f_reg, u8 *ip)
>> >  	*pprog =3D prog;
>> >  }
>> > =20
>> > +/*
>> > + * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
>> > + *
>> > + *   mov r11, QWORD PTR gs:[current_task]
>> > + *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_=
nesting)]
>> > + *
>> > + * r11 (AUX_REG) is scratch in the trampoline at every point this is =
emitted.
>> > + */
>> > +static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
>> > +{
>> > +#ifdef CONFIG_TASKS_RCU
>> > +	u8 *prog =3D *pprog;
>> > +
>> > +	/* mov r11, gs:[abs32] */
>> > +	EMIT2(0x65, 0x4C);
>> > +	EMIT3(0x8B, 0x1C, 0x25);
>> > +	EMIT((u32)(unsigned long)&current_task, 4);
>> > +	/* inc/dec dword ptr [r11 + disp32] */
>> > +	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
>> > +	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
>> > +
>> > +	*pprog =3D prog;
>> > +#endif
>>=20
>> It's not a lot of overhead, but I feel it will be the death by thousand =
cuts.
>> rcu_read_lock_trace() in bpf_prog_enter_sleepable is doing the same thin=
g...
>> increamenting a variable inside current.
>> Can they be combined? Like treat current->trc_reader_nesting > 0 as
>>  current->rcu_tramp_nesting > 0 ?
>> Or replace one with the other?
>> Two current->foo++ operations look redundant.
>>=20
>> bpf trampoline is already quite heavy. I'd like to find ways to reduce
>> its overhead instead of adding more.
>
> Replace rcu_read_lock_trace() with Josef's rcu_tasks_trampoline_enter)?

If necessary...
what I don't understand why we need another rcu_tasks_trampoline_enter-like=
 counter.
Can existing rcu_read_lock_trace() current be used ?
It's already doing current->trc_reader_nesting++
so use that as a signal ?


