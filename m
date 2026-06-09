Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DDFCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVsisOh2t/3BY9u48eKv6sHKecTbrxVyTPE/nrEqEDE=; b=Ux75JJGh1EugsziqcS/v+FIYjv
	Byd5MrVavfOG136eUXJOM7YjfjaoDbRKx0IyMz3I8aKmOFjDftRn+fCm8EVSy1Q3toc20mE9pae1W
	QH5bo3GXYBjmf+0pnG2w6MKSJkUU2NJ8/0vEeu6zoXx98O5epEWt9L4/6/pRRpCfpbbXHREb5ZtWv
	9m960smODm8W2gylPS5h/ajVwPamu+lK8gz0MPX2DPos+9jkp4pmuXnJ2LIGs63+VuGwp3vt/EaF/
	y/YKQMX3SyzkhJ2E6DpEAsaU/KhPuEMifsqcNYmXVe9k8/nR7KuGwkX4P1ZIb2xbJQbjhf3O/0n+7
	NBc8oZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt6d-00000005Fjm-0fKf;
	Tue, 09 Jun 2026 09:50:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt6c-00000005Fje-2DXg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:50:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0939601FD
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 09:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA671F0089D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  9 Jun 2026 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780998645;
	bh=LVsisOh2t/3BY9u48eKv6sHKecTbrxVyTPE/nrEqEDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=omqD8ec4RwhqP75Swo+2L1XAYZsWpuWBoMBChLXYdR8kYizp0aLPgiic5S64rpMmk
	 vb9iiZRLGgGyAFPj5RuQMpZZTb2eaZs29sOweS0GIp33uyAiyd5eb+Ztgfny7mctrC
	 bNwBiIBwmzDof78RMjqPSG+5SC9BKZntXnazkz8JxepMnr0huQvNNZSzWTh0riXf0D
	 GkQDMjqq4ZXWeg3veFYUtg+j1toh+4hFnrvb8WXX6LJu+bVCdseEUM4wtZH2HNdCnt
	 SZYD+BjwnVx38RcvcS8nr6K/kHbHa08B59TF7yWJnMn1M0EglAuhQ4ZsOjLJPm5bBe
	 ycrjhqeLYPTKQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-befd83e0521so1136756466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:50:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+2HSVHpl1+zgA8Y4kbcTxvsJSwpK3YuqIzdNy5xdl9WYUashTvthGLoBGjFU4wguopiR6IY9Us08TrPK5NbwJl@lists.infradead.org
X-Gm-Message-State: AOJu0YyIlIgUQBxQyqfy0ElV+YYULX6oO5rrCIpMJL/IrzzcsfAcVMOq
	ZmRckAor/hvnQWJEP29K93eQOQpPLumjq8y9jrvOLpwDODldp+Rivbwodv5ZXMGI1LOU+PIWtfC
	R1AGy7sOu4736sItMUCXn7qQelPYy8vs=
X-Received: by 2002:a17:907:60cd:b0:bed:f8a3:23a0 with SMTP id
 a640c23a62f3a-bf3a8a0ce48mr751853766b.25.1780998643858; Tue, 09 Jun 2026
 02:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Tue, 9 Jun 2026 10:50:28 +0100
X-Gmail-Original-Message-ID: <CANk7y0jKE1Mq5FQD1M9+CUQt-+G2EQN7hCvUCQJE=hFmsr+o0A@mail.gmail.com>
X-Gm-Features: AVVi8CeSrRlbGA71o_97ek791-ypZvvhb-lg2xrkdnUMSr3_kQBTCBTCfOxMfQY
Message-ID: <CANk7y0jKE1Mq5FQD1M9+CUQt-+G2EQN7hCvUCQJE=hFmsr+o0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, 
	Florent Revest <revest@chromium.org>, Xu Kuohai <xukuohai@huawei.com>
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

On Tue, Jun 9, 2026 at 6:19=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> On arm64, HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is currently selected
> only when DYNAMIC_FTRACE_WITH_CALL_OPS is available. CALL_OPS, in
> turn, is mutually exclusive with kCFI: the pre-function NOPs it needs
> would change the offset of the pre-function type hash (see
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")),
> and the compiler support needed to reconcile the two does not exist
> yet.
>
> The result is that a CONFIG_CFI=3Dy arm64 kernel has no
> ftrace direct calls at all, so register_fentry() fails with -ENOTSUPP
> and no BPF trampoline can attach: fentry/fexit, fmod_ret and BPF LSM
> programs are all unavailable. Deployments that want both kCFI
> hardening and BPF-based security monitoring currently have to give
> one of them up. systemd's bpf-restrict-fs feature hits this today:
> https://lore.kernel.org/all/20250610232418.GA3544567@ax162/
>
> CALL_OPS is an optimization for direct calls, not a dependency.
> In-BL-range trampolines are reached by a direct branch without
> consulting the ops pointer, and out-of-range trampolines already
> fall back to ftrace_caller, where the DIRECT_CALLS machinery
> (call_direct_funcs() storing the trampoline in ftrace_regs, the
> ftrace_caller tail-call) is gated on DIRECT_CALLS alone. s390 and
> loongarch ship HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS this way,
> without having CALL_OPS at all.
>
> Patch 1 prepares ftrace_modify_call() to build without CALL_OPS by
> widening its #ifdef and using the existing ftrace_rec_update_ops()
> wrapper (no functional change for current configurations). Patch 2
> drops the CALL_OPS requirement from the DIRECT_CALLS select.
>
> Configurations that keep CALL_OPS (clang !CFI, and GCC without
> CC_OPTIMIZE_FOR_SIZE) are unchanged. We verified this: in an arm64
> clang build, every object file is byte-identical before and after
> the series except ftrace.o itself, and its disassembly is identical.
> CFI builds (and GCC -Os builds) gain working direct calls, with
> out-of-range attachments taking the ftrace_caller dispatch path
> instead of the per-callsite fast path.
>
> We tested on a 6.18.y-based kernel and on this base with clang
> kCFI builds (CONFIG_CFI=3Dy, enforcing) under qemu (TCG, and KVM on an
> arm64 host) and on GB200-based arm64 hardware: fentry/fexit, fmod_ret
> and BPF LSM programs load, attach and execute; the ftrace-direct
> sample modules (including both modify samples, exercising
> ftrace_modify_call()) run cleanly; no CFI violations observed. The
> fentry_test, fexit_test, fentry_fexit, fexit_sleep, fexit_stress,
> modify_return, tracing_struct, lsm and trampoline_count selftests and
> the ftrace direct-call selftests (test.d/direct) pass on the new
> configuration with results identical to a CALL_OPS kernel built from
> the same tree, and a broader test_progs sweep showed no differences
> attributable to this series. Without the series, all of the above
> fail at attach time with -ENOTSUPP.
>
> riscv has the same gap (its DIRECT_CALLS select also requires
> CALL_OPS, and its CALL_OPS is likewise !CFI); if this approach is
> acceptable for arm64 we can follow up there.
>

It looks correct to me and should work.

Reviewed-by: Puranjay Mohan <puranjay@kernel.org>

