Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD4ECD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 04:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrfCOYnawNby/+6P5H5Tb/h+uk8XWKJB+gnkB26erd0=; b=iTvJ3qrnl1eGmqjcQZ983jvEse
	AYjPnuUzqiWQvmFx6vQD5BVZ94UFpF5Kjtd0rd1zgplmM6j5mOX5ArIFiaebA82J6fCzaOYZrbod0
	ooZxMtGHK3TbuC7S5wIBsgCQVn7PQmm82ii5JfYOddqbpWXK5QgIFYuSrKRbn5srx7CDpyolSX9SL
	xV8XDnTaznBSWYhwWnY/7+kzCTtMqAAuDaRRV4l4PRUPUXsYiNgtd4ZmKS8nkA3Ht60KpVfVm2gMK
	K0+s8D0aep20NwOZBSjGwjtDx0nkVmmpQwbWAZHTw4c7JuIVBZ5IhkVm+CCC82QLomR18ZvKi3wdI
	YtC73RYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAmY-00000006mxY-07VZ;
	Wed, 10 Jun 2026 04:43:14 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAmU-00000006mx2-2XaW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 04:43:13 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=key1; t=1781066582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrfCOYnawNby/+6P5H5Tb/h+uk8XWKJB+gnkB26erd0=;
	b=HjIzng/PovlFPzFjQIm3WEnGb3lIqEqOpN83SRyVl11T0Q6qhZZ2c665qUk+FpBzWNZSCc
	p6lBKhYhWMqi7mtmsb6CFySW9JvTlQuicxxP66QwLuyhv3qrXdD6bzXqCPDqFDR0EQ1vBy
	pW41C5Y3GEHBAlb7lN4Tp59P/gSQLV1yZ50g8UMnARlIjc8KfJEdqIbMbsoYx8zlf7CHuI
	eQbW5a7+UgkBsVhGWRYdkLhj0kktK9pCr3D8bO40VCgXIPJo6kKyMJLSlH/AtOPtfF1xH/
	k4fSQ0fQvKyI2IhqM+t++UnxBSJtse5s3E9NzdXFC5FaQ6gYYA33YAtMoOBTqA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 21:42:56 -0700
Message-Id: <DJ53EPMYFXVH.3I4BP5PF8XJ9G@craftyguy.net>
Cc: <linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <llvm@lists.linux.dev>,
 <bpf@vger.kernel.org>, "Florent Revest" <revest@chromium.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without
 CALL_OPS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Clayton Craft" <clayton@craftyguy.net>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_214311_247390_464A3728 
X-CRM114-Status: GOOD (  24.61  )
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

On Mon Jun 8, 2026 at 10:19 PM PDT, Jose Fernandez (Anthropic) wrote:
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
> ---
> Jose Fernandez (Anthropic) (2):
>       arm64: ftrace: prepare ftrace_modify_call() for use without CALL_OP=
S
>       arm64: ftrace: allow DIRECT_CALLS without CALL_OPS
>
>  arch/arm64/Kconfig         | 2 +-
>  arch/arm64/kernel/ftrace.c | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260607-arm64-ftrace-direct-calls-152230ef7077
>
> Best regards,
> --
> Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>

Thanks for fixing this! I gave it a try on an aarch64 laptop (macbook m2)
using kernel 7.0.11 with CFI=3Dy && DEBUG_INFO_BTF=3Dy, built with clang. A=
FAIK it
seems to work great, I am able to finally run systemd with BPF support (e.g=
.,
unprivileged nspawn works now)

Tested-by: Clayton Craft <craftyguy@postmarketos.org>


