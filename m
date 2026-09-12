Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F93C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 03:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud1ZpqadGMe+QubhUEhtcVCLKFg2sCSQ6NPZYlf26Tg=; b=cO4NZKiIjMs49S+m1LMFAKFEPx
	jPt3lWa7EcOlcloGuLYda1VwLF+T6r//PzRGVXfyLLHjhThae8ouf2ExQ3uvIYsqxZrpTRfzWdDGN
	MM9QV20SDsnelG7FzGPB2dxQ27pugCIWam/eedelKT7tuGmWBDaGCEIOXdIhJJtpYnsP+gZGWig9W
	Vof6zhlkE1OOToy+X1gCkagQ/L+04KzeP87i05A7xY1SRzsTqmfxDJxgc+XalHTq3Sdyu9hoVQpC0
	LYIkkobcmQZOVxokHq7b2dWa7oYCSLhvuEJZbKqXAIZpHUzSOeoZ8mTRAWLXXlLT93XnOFnJCRKxU
	g5BQ/Yhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5EPL-00000000Vj7-2FQv;
	Sat, 12 Sep 2026 03:28:03 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5EPI-00000000ViT-2sLw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 03:28:02 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7f4e729368fso1719805a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 20:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789183679; x=1789788479; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ud1ZpqadGMe+QubhUEhtcVCLKFg2sCSQ6NPZYlf26Tg=;
        b=cqUF1V8uFOoCwoy1E5111crSt1HlNTbV4T08jaWwaIcqq1bgdShJuzeTxRpwcEgNhR
         V4PLuolYGAXyVg+eqQOqE24iTWKgBETQ+/rfaYKLgKPo9FAz+IEtKrsLLwAF3ysucKnq
         k84qx0N6Ge1ATyls9VaI2OrdNjttZFwUVK110BgSVJ/KChx/ni5WtB7ftaKdNTWwMlOY
         L0ns5J8+xOGL5RdgWu/v78GjyhGdwrAQNOhOvRiNs6WQsN4e2/KqvVJXioA55o3A2vBT
         wrpbJWQ2jBhQDFeo9JEm1jv/Z6f9MiviEHVc3m4pmX3lP+RW7XY9h+OcdO+1q96OYXYO
         gQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789183679; x=1789788479;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud1ZpqadGMe+QubhUEhtcVCLKFg2sCSQ6NPZYlf26Tg=;
        b=G3Ha99f4m0fEmOYC9849JfLesYYxbbhchRYOrzTSsx84fIw8onnHZDtql6fk1qQk/3
         Lj2rs+TnpslmzT7A/rb74545UeH/vfRf0So9omlseOx6hFR9KdlZz88xoppHnw6zzY3o
         qSKjfTzhH84jYkP8eFmnCaYCxUhKA0f1jIeHRzdfNhOA/XVRzneOsQA6PZq6siVtBhtv
         2zgDTGlKv8eY2GkpN+EuBL8Wb4enMgfLdZzLfb0U+UK3ywgd2kIWfoZffOD8PDZmvWHl
         9Zfg7AGTeWDZJQJVt/ZugNMafbu02ZXaei7EDM9ro/baDVZYElxqvXQX+SPqtDS0iI0E
         MkRg==
X-Forwarded-Encrypted: i=1; AKwUvBzM9xWrFbcI1e2nQ2BJRH8iuwmAZnL55oObThq2Tj8Z10huReFi6URfnVvjEZzH7pqpOLwPahbcsW6LUFr38PaG@lists.infradead.org
X-Gm-Message-State: AFuF++kbuZsBPrmBYZ2xj8LzfXE6jCX49qoiIRn9Y77jhm85rFZm5x8L
	tMjrfK2K3jnZ0AlGWPzkHV+37j3LPyg7gxvfApYtX352Nt0pzohYbvkq
X-Gm-Gg: AYBFou2SBaeDiucmzicqcCvj5QJGideuWjC2QpBfXK70xo18XMm6aNoL+85gVeC/vp2
	0If3zc74pznnlKCaiET2cyZMQwJvoesN7di0XX6DS1CdmHNV7cD2mD+3fcbAeG2ecZ2SppFwdgC
	UFt/6e2Gi8NyftlaImhFBLBsUiLFeu+Enujv/u+hGkHDcFgtH+oTpepWQGuuUbF8CpTKf2p52+5
	JRDCm5NYzQbSXmasiFl7MFcCNwCS8ZPzOJsD2rTyQ+je+Z1SKxckrsKoV9KUfjCRNslfkqQwlqd
	PF+71P8eJqibj9cUDJb317Daa8I5dAJfcUHHJGFhtxtRbqSSYOtFEvvwzJQT3XFdYaIm6XAxSaE
	3cAD7o9v196/bGvjGVdBzGLS6b1VkBO0L1pdNKO2qwZpN3+FzKWkNpy/NMGCaJfn5gFjKyk70S2
	W5sR/ilegxc7Fa5D0BROGnB5/P5Ld4AEKjfRcBR09G/iS8USTpR35SA2/fMsynOxU6EifVDmBNL
	72OtWhP2NTbdqhl0vqXqK3K24BaOuZml8UEGK4oBIsI0p8NMNzdkIIUspmUXrT//Q==
X-Received: by 2002:a05:6830:2786:b0:7fa:ac4f:785 with SMTP id 46e09a7af769-80400b2042dmr6714669a34.17.1789183678934;
        Fri, 11 Sep 2026 20:27:58 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:15::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f6d208f5sm4822052a34.25.2026.09.11.20.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 20:27:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 20:27:56 -0700
Message-Id: <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj
 Upadhyay" <neeraj.upadhyay@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>, "Thomas Gleixner"
 <tglx@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Jiri Olsa" <jolsa@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 <x86@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>, "Xu
 Kuohai" <xukuohai@huaweicloud.com>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Josh Triplett"
 <josh@joshtriplett.org>, "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross"
 <jgross@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
X-Mailer: aerc
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_202800_762644_4EC9F9D8 
X-CRM114-Status: GOOD (  24.38  )
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

On Fri Sep 11, 2026 at 7:08 AM PDT, Josef Bacik wrote:
> Emit an increment of current->rcu_tramp_nesting once the trampoline's
> frame is set up and a decrement before the final register restore, so
> that a task preempted while running fentry/fexit/fmod_ret/LSM programs
> or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
> Tasks-RCU quiescent.  Drop the count around the call to the original
> function: that may run arbitrarily long without sleeping and must not pin
> a Tasks RCU grace period, and the trampoline frame above it is held by
> im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
> fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke both
> skip the decrement/increment pair around the original call, so the count
> stays balanced on every path.
>
> The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]";
> r11 is scratch at every emission point and (u32)&current_task is a valid
> sign-extended %gs-absolute with the current per-CPU layout, the same form
> the JIT already uses for this_cpu_off.  The image is dynamically
> allocated text, so the instructions outside the bracketed region are
> covered by the irq-exit IP check.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 43 +++++++++++++++++++++++++++++++++++++++=
++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 2853e87797a7..a375c1b7bd50 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bpf_r=
eg, u8 *ip)
>  	*pprog =3D prog;
>  }
> =20
> +/*
> + * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
> + *
> + *   mov r11, QWORD PTR gs:[current_task]
> + *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_nes=
ting)]
> + *
> + * r11 (AUX_REG) is scratch in the trampoline at every point this is emi=
tted.
> + */
> +static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
> +{
> +#ifdef CONFIG_TASKS_RCU
> +	u8 *prog =3D *pprog;
> +
> +	/* mov r11, gs:[abs32] */
> +	EMIT2(0x65, 0x4C);
> +	EMIT3(0x8B, 0x1C, 0x25);
> +	EMIT((u32)(unsigned long)&current_task, 4);
> +	/* inc/dec dword ptr [r11 + disp32] */
> +	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
> +	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
> +
> +	*pprog =3D prog;
> +#endif

It's not a lot of overhead, but I feel it will be the death by thousand cut=
s.
rcu_read_lock_trace() in bpf_prog_enter_sleepable is doing the same thing..=
.
increamenting a variable inside current.
Can they be combined? Like treat current->trc_reader_nesting > 0 as
 current->rcu_tramp_nesting > 0 ?
Or replace one with the other?
Two current->foo++ operations look redundant.

bpf trampoline is already quite heavy. I'd like to find ways to reduce
its overhead instead of adding more.


