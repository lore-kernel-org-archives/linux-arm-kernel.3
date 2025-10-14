Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CC5CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 00:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60W7dGApFCGXHKlXBRGDaLpu3YLgl4WyK3JcN6QaedU=; b=x5JtLP0to1re12muNplAYlbitw
	VtLtMKWlaNr9Eb3faw7hMnsc45/SLsA3MgZ/icqlHIzNjacW8PHiikbJvAW0tNZgSmUjKm+B0ZYz3
	64XyI3nP+/iEphbZzb2dnWOgA4m8unZAP1xoeD2RIqXt2ZmyFvmRq/FQqcdXkcQQ7LNtfuyHOdCZG
	iU3QjyZjrDJI1x7gDYGP9tg7jyLYaPtMHlwnGQa8WECCXn/ATF1r6O+zuh8PsydlrH1kqQBB6it5g
	TsrKMYwV1dPje3R6iXtV1dU0NpRXjY69FlyCCINxRx5E32+/qDaG5W3Pm9uFNX12FTbC10QrC0juw
	DAelCAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SU0-0000000Enmr-07WW;
	Tue, 14 Oct 2025 00:01:40 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8STx-0000000EnmM-2PT1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 00:01:38 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befbbaso11341185a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 17:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760400096; x=1761004896; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=60W7dGApFCGXHKlXBRGDaLpu3YLgl4WyK3JcN6QaedU=;
        b=jvOByeWGXu+DhPFYpjcmptHsKArdb2rLCNAwqT/nDXv+Lxf+enRJxHHYs3KTjM2GSe
         62Ki3ebr5g62w84jOB19YQLHEV6ZG+pDTvRtZjNmttYIrf4ut/H2OX3WeDstP1+P/axG
         J8S59dB9VLQgeZs+HdFAZc6HrS7A4oo2cQ5WfN6h2BE//AyJcnqxgqdtWfT46gknIYJQ
         ygPJcwpkTqZX4t7mgIQw/Uxxv6ivfFzsLH429xuYMjmU64zO4kvi5E1tlSmZhWWYiwbJ
         Ym7hzYIkhnxPn1m6BNGoTNlQ/ICtb1ePuUhc9wxi0CJeyNdZWdh6BU6onmu9BSiWZcc0
         sRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400096; x=1761004896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60W7dGApFCGXHKlXBRGDaLpu3YLgl4WyK3JcN6QaedU=;
        b=bhstJbwgOgBba9rBo8so+6ugvWxjrbj+2tyta5vu6U4QRNd4PgRMBmdPHeq66FWgOS
         EhT/3DzKjnusAyPX7vc2iQkXxAvyYYBrk2sYMtQSV9w6Tmw9saZekUQEM4RLxD1sg6f9
         oTrvv82KWN16DWr60SjCIMFSs7LLgOtVWMEODU8WHFCPJyEy/G1uEAxLoew0acNHejI+
         j0kHJY+m/iAw+muPT4EHsslLY40TGk+gBkAVlYYRWgV9c8hBzN2NdNASI6Dp3GKxQPYf
         nldv3Fb6MPIS5qpmbjGSvDlsTd+Klhx4uglF8kA4YnODr83DH2xktLWZcVFmGAnDOfHW
         IqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrn0sxspUppKvgyKkOenhsbLDuBeqvV0ZZI+7d+E1oqDy+jb4nm9l33Uq7Prz5hrTSrRvp92cilVjoO5qoUIiK@lists.infradead.org
X-Gm-Message-State: AOJu0YxRSLIA/7GKGMOLUEakRQasuM/Bzx1StYp4kJjz2DVDhNGS37zp
	stq6bR/ax252Jq1xSEXciVrfyp0ebz3yaYoGhlueNF4UjBg6v5+JZWORBQHS+6UcsLdWiTam7cW
	j01zSBw==
X-Google-Smtp-Source: AGHT+IHFYfnmFjxjbFQp7BMqqD83h/lwfyE6WGt5bwyArJ6H0ox9P/tbWn8NIGRGgabEk9PVFSZMkd4SLvs=
X-Received: from pjbbk16.prod.google.com ([2002:a17:90b:810:b0:339:dc19:ae5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38d2:b0:335:2eee:19dc
 with SMTP id 98e67ed59e1d1-33b5138401amr31287086a91.28.1760400096074; Mon, 13
 Oct 2025 17:01:36 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:01:34 -0700
In-Reply-To: <20251010153839.151763-20-vschneid@redhat.com>
Mime-Version: 1.0
References: <20251010153839.151763-1-vschneid@redhat.com> <20251010153839.151763-20-vschneid@redhat.com>
Message-ID: <aO2S3oZwOW_UgAci@google.com>
Subject: Re: [PATCH v6 19/29] KVM: VMX: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn <jannh@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, 
	Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_170137_615546_D0656382 
X-CRM114-Status: GOOD (  23.67  )
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

On Fri, Oct 10, 2025, Valentin Schneider wrote:
> Later commits will cause objtool to warn about static keys being used in
> .noinstr sections in order to safely defer instruction patching IPIs
> targeted at NOHZ_FULL CPUs.
> 
> These keys are used in .noinstr code, and can be modified at runtime
> (/proc/kernel/vmx* write). However it is not expected that they will be
> flipped during latency-sensitive operations, and thus shouldn't be a source
> of interference wrt the text patching IPI.
>
> Mark it to let objtool know not to warn about it.

Can you elaborate in the changelog on what will happen if the key is toggle?
IIUC, smp_text_poke_batch_finish() will force IPIs if noinstr code is being
patched.  Even just a small footnote like this:

  Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
  being patched, i.e. this is purely about silencing objtool warnings.

to make it clear that there's no bug/race being introduced.

> Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index aa157fe5b7b31..dce2bd7375ec8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -204,8 +204,15 @@ module_param(pt_mode, int, S_IRUGO);
>  
>  struct x86_pmu_lbr __ro_after_init vmx_lbr_caps;
>  
> -static DEFINE_STATIC_KEY_FALSE(vmx_l1d_should_flush);
> -static DEFINE_STATIC_KEY_FALSE(vmx_l1d_flush_cond);
> +/*
> + * Both of these static keys end up being used in .noinstr sections, however
> + * they are only modified:
> + * - at init
> + * - from a /proc/kernel/vmx* write
> + * thus during latency-sensitive operations they should remain stable.
> + */
> +static DEFINE_STATIC_KEY_FALSE_NOINSTR(vmx_l1d_should_flush);
> +static DEFINE_STATIC_KEY_FALSE_NOINSTR(vmx_l1d_flush_cond);
>  static DEFINE_MUTEX(vmx_l1d_flush_mutex);
>  
>  /* Storage for pre module init parameter parsing */
> -- 
> 2.51.0
> 

