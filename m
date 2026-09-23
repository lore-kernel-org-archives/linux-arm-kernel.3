Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80792C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mLdHkKI/Hk3BqqZoW+gtkhvs5fryLWhkPrRSEcEKag=; b=BpEtoPPXdutSK+aQZyomGdDRt4
	PXIG/dkRDi87Ckg5Lxwm/GBRYjEqiEubkR4SzhnuKr8+BWJaYpL4417X+ZAapInemeCIWJfXy4hRw
	xEy2dY5TeZOHPavkdIML1hB/Z8lPWVFIEHZANqKieHiIWv6hBYw95/7bSEXoiV0hIOyFKkFrxnOWr
	QlZ18ExTguqivYVKrCar9MgRBaCwYhbJVCd+/ULD0rjBIIN2bqhkoxai29oHoFfdj1Bv7i3nOtKuF
	gfKNW4m7JvqYeYqSce2y4KhKZQXpRoClIyC/vyQJUaoMvWlraZrc1Z+VrogTjTNYL2s2bTxpEDFmb
	nF/t2+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CXS-00000006uoV-3ksi;
	Wed, 23 Sep 2026 02:16:50 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CXQ-00000006uo5-1Y4a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 02:16:49 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so281667a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 19:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790129807; x=1790734607; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5mLdHkKI/Hk3BqqZoW+gtkhvs5fryLWhkPrRSEcEKag=;
        b=XD4FVMOscB+kJuGVn5EKvSzEP+CetahtRHDga1ZPDDU4M8fByukNRnNlPMUlL4AqGE
         nKFf6dcqShlKHQrpCcUY09BMNZRBU5/GFp5SQgJeFiyXj0MINTOZjrWEiM8oK3+Ep4Cg
         yx6+IVfVXC5959FsxStA+kqz2AdqJ5xll8FqG8z9fYZ9/p3lU3dQIkikMCPuwMiwqlYM
         LSoRroEUnNI7QxYZrN7HhxGTl8prXNmCVzPMZ9RBM61YurgpD1KDYz5ZKcnbuWDTStdo
         AnM7ztbkPiOTvTEtwMMAMPxIqV520QV2BYpe9ErqNo3Fn31bfJk6DRV1cCRr/29o+A2O
         q9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790129807; x=1790734607;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mLdHkKI/Hk3BqqZoW+gtkhvs5fryLWhkPrRSEcEKag=;
        b=pLir27WghnDngRYwcmZG968exoS5vTOCMLFR1uATEq/WX4EEEAx53GU/WfqPYNDnLq
         tSlClBknZAGi/tlnwqV8xkmKYFntHgN+1ujoH7acv5Sls1DLr9uiXC91aQIn2qFycxal
         28cnT40peVG2u4aKvGRqGjdg7253jAao14bNJLAlslnU6ENpL6lKzrtrkcAtCSXGigAc
         vbSmI1PTYceKEWrqf01V3egtfvbI9S7oVEGYjVA9O/jKA26tdXgIJjsjGIS60wlGvFXK
         ZABWLX346D9Od6xg4P9qfKh+6ypOrO7dIKlBwFtb3lo0IbHfUHbMXpcsxOcaxpNd9B48
         Tj+g==
X-Forwarded-Encrypted: i=1; AKwUvBzkhbZwtvNG5wCmN/jK7gRrQMp79zbRtHc6ajLwwBRg2eeJ6iecXZFRK3R0Gj2PG2y9smFgCWlQTsi6jot08kY5@lists.infradead.org
X-Gm-Message-State: AFuF++kzyH5eSgVVi3aygW4/SdHyAJnqH1ykwJ2comorDjJu00OW9vHB
	ih5OCX85sB8u64MeFvQPZ+InxW7eQR6kM2Y0/ZdSMJna5cIyGDUN1eJh
X-Gm-Gg: AYBFou2P2WkJ9NgMYFNa2X0exHM/AaOM2J66bx0xn42xmPQip3+XFbbtCrzS/nHSxkA
	j4RmhjAS28R/Ro9HDy/C3EPH+sgJsZweCJFn3eCsX7HSYQN13Bbm6S98SBePiPdPPHuZ6aIRbgO
	qO+hZGvgsz6B8aH1OC66Cw0X6FuomoGhBJCrItrNYYcbLl5/VDsjetnH3R/JP9h0lNbHyXQF11Z
	L01oUQFTcW89QGg4Ns225YW/uB99dPRalkqkeuKUnm1PSQ7KVBCi8U6huw7jSCNHMuZPiRT2UTv
	kPWVLE3bufqez0jVOuj/28pHXklvCAiL0D7d6UHfXImtkkbl+CESX0irQXnj4/1rGtpGSA2Dr2F
	l43FwCGqMMGUPQ24ASgmOXfm48+F7r/Stqe1eb4mMKc1gkGdBx15rs4da8e+zgGEbeg+Nn8PwJ9
	9+8bKYYGflL5LuBG2MrWhQHOskBPumCQwF+fbMfXXy3DJGJneewuDhBvlIQiKqaKzOtEvF3BOwG
	5gO/sgouxxDDtNFZfS34dmS0KtNrDNJEUkQz5JMU6MqPMjdISyP3XExg290I37HtTwuC1orHLGg
	L7QzhkWP2np0CRo=
X-Received: by 2002:a17:90b:2e0d:b0:39e:6c6a:4b6d with SMTP id 98e67ed59e1d1-3a07e6bc443mr1025420a91.55.1790129806696;
        Tue, 22 Sep 2026 19:16:46 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2013459a91.5.2026.09.22.19.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:16:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 02:16:45 +0000
Message-Id: <DLMC1ZMTWZYV.3H2LAOGONVAUQ@gmail.com>
Cc: "Boqun Feng" <boqun@kernel.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>,
 <rcu@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 07/13] bpf, x86: Take a Tasks Trace reader in the
 trampoline around its call-outs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Frederic Weisbecker" <frederic@kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260922-b4-rcu-tasks-preempt-qs-v5-0-410f57770bad@toxicpanda.com> <20260922-b4-rcu-tasks-preempt-qs-v5-7-410f57770bad@toxicpanda.com>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-7-410f57770bad@toxicpanda.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_191648_418915_4543149A 
X-CRM114-Status: GOOD (  30.09  )
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

On Tue Sep 22, 2026 at 2:23 AM UTC, Josef Bacik wrote:
> On HAVE_RCU_TRAMPOLINE_READERS kernels Tasks RCU keeps a BPF trampoline
> image allocated only while a task using it is a Tasks Trace RCU reader
> or is executing text that rcu_tasks_trampoline_text() recognises.  The
> image itself is such text, but the C glue and the programs it calls are
> not, and only sleepable programs take rcu_read_lock_trace() today.
>
> Have the x86-64 JIT open-code rcu_read_lock_trace() and
> rcu_read_unlock_trace() in the trampoline, as ftrace_64.S does for
> ftrace_caller: one reader from just after the frame is set up to just
> before the original function is called, covering __bpf_tramp_enter()
> and the fentry and fmod_ret programs, and a second one from just after
> the original function returns to just before the final register
> restore, covering the fexit programs and __bpf_tramp_exit().  The
> original function itself runs outside both, since it may run for a long
> time and the image is pinned by im->pcref across it.  Trampolines that
> do not call the original function get a single reader around all their
> programs.  The second reader is entered before ip_after_call, so the
> ip_after_call -> ip_epilogue jump that bpf_tramp_image_put() patches in
> is inside it, and the fmod_ret early-exit branch lands after that point
> still holding the first reader, so exactly one is held on every path.
>
> The sequence uses r10 and r11, which are scratch at each emission point,
> and references current_task and rcu_tasks_trace_srcu_struct by absolute
> sign-extended address, the form the JIT already relies on for
> this_cpu_off.  Sleepable programs' own rcu_read_lock_trace() simply
> nests.  Nothing is emitted on other configurations.
>
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 107 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 2853e87797a7..b77e29c9599d 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -14,6 +14,7 @@
>  #include <linux/memory.h>
>  #include <linux/sort.h>
>  #include <linux/execmem.h>
> +#include <linux/rcupdate_trace.h>
>  #include <asm/extable.h>
>  #include <asm/ftrace.h>
>  #include <asm/set_memory.h>
> @@ -722,6 +723,91 @@ static void emit_indirect_jump(u8 **pprog, int bpf_r=
eg, u8 *ip)
>  	*pprog =3D prog;
>  }
> =20
> +/*
> + * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() for the
> + * trampoline, see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the equivalent
> + * macros in arch/x86/kernel/ftrace_64.S.  The image is not relocated, s=
o
> + * current_task and rcu_tasks_trace_srcu_struct are referenced by absolu=
te
> + * (sign-extended 32-bit) address, the form the JIT already relies on fo=
r
> + * this_cpu_off.  Uses r10 and r11, which are scratch at every emission
> + * point, and clobbers flags.
> + *
> + * lock:                                  unlock:
> + *   mov  r11, gs:[current_task]            mov  r11, gs:[current_task]
> + *   mov  r10d, [r11+nesting_off]           mov  r10d, [r11+nesting_off]
> + *   inc  dword ptr [r11+nesting_off]       sub  r10d, 1
> + *   test r10d, r10d                        jnz  2f
> + *   jnz  1f                                mov  r10, [r11+scp_off]
> + *   mov  r10, [&srcu.srcu_ctrp]            mov  dword ptr [r11+nesting_=
off], 0
> + *   inc  qword ptr gs:[r10+locks_off]      (smp_mb)
> + *   mov  [r11+scp_off], r10                inc  qword ptr gs:[r10+unloc=
ks_off]
> + *   (smp_mb)                               jmp  3f
> + * 1:                                     2: mov [r11+nesting_off], r10d
> + *                                        3:
> + */
> +static void emit_trace_rcu_reader(u8 **pprog, bool lock)
> +{
> +#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
> +	const u32 nesting_off =3D offsetof(struct task_struct, trc_reader_nesti=
ng);
> +	const u32 scp_off =3D offsetof(struct task_struct, trc_reader_scp);
> +	const u32 locks_off =3D offsetof(struct srcu_ctr, srcu_locks);
> +	const u32 unlocks_off =3D offsetof(struct srcu_ctr, srcu_unlocks);
> +	const bool mb =3D !IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB);
> +	u8 *prog =3D *pprog;
> +
> +	/* The plain this_cpu_inc() form of __srcu_read_lock_fast(). */
> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE));
> +
> +	/* mov r11, gs:[abs32 current_task] */
> +	EMIT2(0x65, 0x4C);
> +	EMIT3(0x8B, 0x1C, 0x25);
> +	EMIT((u32)(unsigned long)&current_task, 4);
> +	/* mov r10d, dword ptr [r11 + nesting_off] */
> +	EMIT3_off32(0x45, 0x8B, 0x93, nesting_off);
> +
> +	if (lock) {
> +		/* inc dword ptr [r11 + nesting_off] */
> +		EMIT3_off32(0x41, 0xFF, 0x83, nesting_off);
> +		/* test r10d, r10d */
> +		EMIT3(0x45, 0x85, 0xD2);
> +		/* jnz 1f */
> +		EMIT2(X86_JNE, 8 + 8 + 7 + (mb ? 6 : 0));
> +		/* mov r10, qword ptr [abs32 &rcu_tasks_trace_srcu_struct.srcu_ctrp] *=
/
> +		EMIT4(0x4C, 0x8B, 0x14, 0x25);
> +		EMIT((u32)(unsigned long)&rcu_tasks_trace_srcu_struct.srcu_ctrp, 4);
> +		/* inc qword ptr gs:[r10 + locks_off] */
> +		EMIT4_off32(0x65, 0x49, 0xFF, 0x82, locks_off);
> +		/* mov qword ptr [r11 + scp_off], r10 */
> +		EMIT3_off32(0x4D, 0x89, 0x93, scp_off);
> +		/* smp_mb(): lock add dword ptr [rsp - 4], 0 */
> +		if (mb)
> +			EMIT2_off32(0xF0, 0x83, 0x00FC2444);
> +		/* 1: */
> +	} else {
> +		/* sub r10d, 1 */
> +		EMIT4(0x41, 0x83, 0xEA, 0x01);
> +		/* jnz 2f */
> +		EMIT2(X86_JNE, 7 + 11 + (mb ? 6 : 0) + 8 + 2);
> +		/* mov r10, qword ptr [r11 + scp_off] */
> +		EMIT3_off32(0x4D, 0x8B, 0x93, scp_off);
> +		/* mov dword ptr [r11 + nesting_off], 0 */
> +		EMIT3_off32(0x41, 0xC7, 0x83, nesting_off);
> +		EMIT(0, 4);
> +		if (mb)
> +			EMIT2_off32(0xF0, 0x83, 0x00FC2444);
> +		/* inc qword ptr gs:[r10 + unlocks_off] */
> +		EMIT4_off32(0x65, 0x49, 0xFF, 0x82, unlocks_off);
> +		/* jmp 3f */
> +		EMIT2(0xEB, 7);
> +		/* 2: mov dword ptr [r11 + nesting_off], r10d */
> +		EMIT3_off32(0x45, 0x89, 0x93, nesting_off);
> +		/* 3: */
> +	}

I think lockdep is still broken due to inlining.
lockdep enabled kernel will miss this rcu tasks CS.

Instead let's add rcu_read_lock_trace() to __bpf_tramp_enter()
and remove it from __bpf_prog_enter_sleepable*().

Also add __bpf_tramp_before_call_orig()
and __bpf_tramp_after_call_orig(), so that orig call
can run outside for RCU tasks CS.

Better ideas?


