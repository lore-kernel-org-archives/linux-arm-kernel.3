Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D230C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=janMU5MXezvmZmqnJkQjOF/ir5w8di28OoznHFU8LA0=; b=lst+w82t9Sj7aB4oWPZ0If4i67
	JBSaAeQ7U6sYVKW+K5lBdhqufg/ZcVGDS1hXKdLzvrfB5/LoHE3bwAmUZOvacomP30yEFkcbUSDRP
	iQNP958VIvurzc4XXaYutLZ7RtI0CqgdF5mJ7dwk4t2GdsoFAQnirk+WsY4I7inUrZQYDkXv8SkY6
	RL+qXF0lnJC7HtA/K5NTVRH0dxTG4Qvgx+snXmEITq2FO99T9KZ2db/1/FnHoFaATvwLb23GP3CWD
	fxgINhUgguS/vI2uBXxX+sahnsrM4qf3wH6S/c/BoobQPr4De1YVPgZYVgk1LvxxYxquwFROC70Nx
	zt7deakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwuY-00000007btY-2Swd;
	Sun, 12 Jul 2026 16:20:10 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwuV-00000007bsv-1LCy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 16:20:08 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpYCf6T0du87h04NURgPHiNKmX7qicSFNjF4pPvT0+W4OMeJ110K39PQasu5MNcPlH2O2jpFogLU20wEw4M+Rc9@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783873203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=janMU5MXezvmZmqnJkQjOF/ir5w8di28OoznHFU8LA0=;
	b=heLyFBLFwXsQxblT4nN3SNfdXjm0nr9U2PRMv/NHuZ2Q/wEB1cSBNeosfzbInFi1cqBjMP
	dngdU1ISsUbCEbRto2ngGhNY9jZw1vxAqWl/GLEnqs8KxK2Xu0mHCQlKvXMn4BNJ23XrEx
	lCq07mH63DPz1HUfkNafxgL3rK53Ft8=
X-Gm-Message-State: AOJu0Yz0f9W+cWBo0I5hUawCaR3D1ABoyBUME0fGy9PYD1FMlR7pvfEl
	zmjbEobRTYEIJqJMSgipmtSqee+xZ6LMOVEeuWLV9a3e+uVBNiFyp58/4gYyT2QdMc5oI5EZlIs
	lATFd7WKyS/DAKo96amLHCqsKgY+La1bK6xyMNP0s
X-Received: by 2002:a05:622a:5805:b0:51c:ae6:a57 with SMTP id
 d75a77b69052e-51cc08385e1mr10853171cf.11.1783873199708; Sun, 12 Jul 2026
 09:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260712153835.2264905-1-smostafa@google.com>
In-Reply-To: <20260712153835.2264905-1-smostafa@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 12 Jul 2026 17:19:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
X-Gm-Features: AUfX_mw9S0OZ_DagkNOYZ4ShM2Ytghc_E4HL25aTJrhUWph1A1thQJPgeFVqwv0
Message-ID: <CA+EHjTxN1fcBVRi+yK18UgReGsX8Evu1GsijSQC61dY3XrjCtw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Avoid naming collision in tracing
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oupton@kernel.org, 
	seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_092007_663184_B34BC8D7 
X-CRM114-Status: GOOD (  29.12  )
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

Hi Mostafa,

On Sun, 12 Jul 2026 at 16:38, Mostafa Saleh <smostafa@google.com> wrote:
>
> When the hypervisor tracing (CONFIG_NVHE_EL2_TRACING) is disabled, it
> defines a static inline stub for trace_clock().
>
> However, trace_clock() is already declared as an extern function in
> linux/trace_clock.h which is pulled in EL2 compilation.

The rename itself looks correct and complete: all three sites (the
declarations and stubs in nvhe/clock.h, the definitions in clock.c,
and the two callers in trace.c) are updated, and no other reference to
the old names remains under arch/arm64/kvm.

Two small things...

>
> If the file <nvhe/clock.h> is included when CONFIG_NVHE_EL2_TRACING
> is disabled (by including it manually in setup.c) it will cause:
> In file included from arch/arm64/kvm/hyp/nvhe/setup.c:22:
>
> ./arch/arm64/kvm/hyp/include/nvhe/clock.h:14:19: error: static declaratio=
n of =E2=80=98trace_clock=E2=80=99 follows non-static declaration
>
>    14 | static inline u64 trace_clock(void) { return 0; }
>
>       |                   ^~~~~~~~~~~
>
> on GCC and a linker error on LLVM (it seems to change the linkage to
> global)
>
> Although that is not a problem at the moment, as no other files
> include <nvhe/clock.h>. That does not seem to be the intent of
> this code and that will cause issues with more users as the SMMUv3
> driver.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>
> --

git am only treats a three-dash "---" line as the scissors; the "--"
here is two dashes, so mailinfo keeps everything above the diffstat.
Worth a "---" on the repost so the note stays out of the log.

> I did not add Fixes tag as this is currently dormant and not breaking
> anything.
> ---
>  arch/arm64/kvm/hyp/include/nvhe/clock.h | 8 ++++----
>  arch/arm64/kvm/hyp/nvhe/clock.c         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/trace.c         | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/clock.h b/arch/arm64/kvm/hyp=
/include/nvhe/clock.h
> index 9f429f5c0664..c2ccd0e8bf22 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/clock.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/clock.h
> @@ -6,11 +6,11 @@
>  #include <asm/kvm_hyp.h>
>
>  #ifdef CONFIG_NVHE_EL2_TRACING
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc=
);
> -u64 trace_clock(void);
> +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch=
_cyc);
> +u64 hyp_trace_clock(void);

hyp_trace_clock overlaps the host side: arch/arm64/kvm/hyp_trace.c
already has a struct hyp_trace_clock and static helpers
hyp_trace_clock_enable() / hyp_trace_clock_show() for the debugfs view
of the same clock. No actual collision, so this is only a readability
point, but a reader grepping hyp_trace_clock now gets two unrelated
things. Maybe you'd want to consider a different name, but naming is
hard :)

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Test: builds fine with the different config enables.

Cheers,
/fuad


>  #else
>  static inline void
> -trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc) { }
> -static inline u64 trace_clock(void) { return 0; }
> +hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc)=
 { }
> +static inline u64 hyp_trace_clock(void) { return 0; }
>  #endif
>  #endif
> diff --git a/arch/arm64/kvm/hyp/nvhe/clock.c b/arch/arm64/kvm/hyp/nvhe/cl=
ock.c
> index a7fc61976fd0..8adefb0b696c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/clock.c
> +++ b/arch/arm64/kvm/hyp/nvhe/clock.c
> @@ -30,7 +30,7 @@ static u64 __clock_mult_uint128(u64 cyc, u32 mult, u32 =
shift)
>  }
>
>  /* Does not guarantee no reader on the modified bank. */
> -void trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch_cyc=
)
> +void hyp_trace_clock_update(u32 mult, u32 shift, u64 epoch_ns, u64 epoch=
_cyc)
>  {
>         struct clock_data *clock =3D &trace_clock_data;
>         u64 bank =3D clock->cur ^ 1;
> @@ -48,7 +48,7 @@ void trace_clock_update(u32 mult, u32 shift, u64 epoch_=
ns, u64 epoch_cyc)
>  }
>
>  /* Use untrusted host data */
> -u64 trace_clock(void)
> +u64 hyp_trace_clock(void)
>  {
>         struct clock_data *clock =3D &trace_clock_data;
>         u64 bank =3D smp_load_acquire(&clock->cur);
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/tr=
ace.c
> index e7e150ab265f..f2a32463c6c2 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -35,7 +35,7 @@ static bool hyp_trace_buffer_loaded(struct hyp_trace_bu=
ffer *trace_buffer)
>  void *tracing_reserve_entry(unsigned long length)
>  {
>         return simple_ring_buffer_reserve(this_cpu_ptr(trace_buffer.simpl=
e_rbs), length,
> -                                         trace_clock());
> +                                         hyp_trace_clock());
>  }
>
>  void tracing_commit_entry(void)
> @@ -290,7 +290,7 @@ void __tracing_update_clock(u32 mult, u32 shift, u64 =
epoch_ns, u64 epoch_cyc)
>         }
>
>         /* ...we can now override the old one and swap. */
> -       trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
> +       hyp_trace_clock_update(mult, shift, epoch_ns, epoch_cyc);
>  }
>
>  int __tracing_reset(unsigned int cpu)
> --
> 2.55.0.795.g602f6c329a-goog
>

