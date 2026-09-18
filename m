Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AB4C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmLZ94AHYP63wdAVIRZYQYO4b0tflVV2n0V+mhCuajs=; b=B/q5fBHCY4AyL0my/vopQAJxnZ
	m7x6g+r9AChIZ+D5bvDTlBUmFhdgL0EPxKp3wyzs//f1Ri9QpGDaZN97sUxWYCMMBSnTyIRmE9SUv
	TNVldTY9sndQOu7y9Ta5GpViqniJbnsTN72eqTBpDF+IiycRh7MupBMXomKV1fIogU7zOh1TfB7rX
	l9eHJO2kYThpzzyi4W5v6YX/Lm1awWiQfCiPxlCgjjGzuSYXv/ri4IEDgb8LNsogzDzh9sO1Yb+Nv
	AwZwA+C1h1iSlScLSRsr8KzahaHmxgAZyvnIN7cvlH6blw2GfTNDFyvMT50Ctf1iJhm+AZSFwz2jc
	HM+DYGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hZY-0000000FgER-0lLd;
	Fri, 18 Sep 2026 23:00:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hZX-0000000FgDy-1KTw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 23:00:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 633CF6053D;
	Fri, 18 Sep 2026 23:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414BC1F000FF;
	Fri, 18 Sep 2026 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772446;
	bh=DmLZ94AHYP63wdAVIRZYQYO4b0tflVV2n0V+mhCuajs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/FGilupSkbIY0CbH7lTao6/7xUMgAR7Ql0qN2rDu3+stEAJ66vVVgeFTge2+8F/A
	 zLrfunsKdJKiq1q7k+b+vmEObHnkvqXEdgNanEUIku0QLxtceoEc/Sof1sgIojlduh
	 88MIeYtz/qa/c8a2TgbgB+POBnLkmjwtLP3JOrwmEit33c6K0No8VYm8d1a8CYT+2/
	 bKHZj57i40fguNnd33sMRn4URcW+BKqA6IvdE8DtrblriABP9YKJ9704ufX2yL36/3
	 eeWqDWm876tqUr/Wm5O0ZsHZtf3qiarnkWLczessiYlHmeoztgZ9iFrCyRYCszYMt8
	 ijJuStzO121yg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/11] unwind: arm64: Use sframe to unwind interrupt
 frames
To: "Mark Rutland" <mark.rutland@arm.com>, "Jens Remus" <jremus@linux.ibm.com>, "Roman
 Gushchin" <roman.gushchin@linux.dev>, "Catalin Marinas" <catalin.marinas@arm.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>, "Will
 Deacon" <will@kernel.org>, "Weinan Liu" <wnliu@google.com>, "Indu Bhagat" <ibhagatgnu@gmail.com>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Jiri Kosina" <jikos@kernel.org>, "Dylan
 Hatch" <dylanbhatch@google.com>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, "Mostafa
 Saleh" <smostafa@google.com>, "Prasanna Kumar T S M" <ptsm@linux.microsoft.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, linux-toolchains@vger.kernel.org, joe.lawrence@redhat.com, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org, "Song
 Liu" <song@kernel.org>
In-Reply-To: <20260918224157.1471085-12-dylanbhatch@google.com>
References: <20260918224157.1471085-1-dylanbhatch@google.com>
 <20260918224157.1471085-12-dylanbhatch@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 23:00:44 +0000
Message-Id: <20260918230045.414BC1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: noinstr violation by calling sframe_find() in stack unwinder
--

commit 13ca4d55a43f451bf08442b7e6af494a6c23a78e
Author: Dylan Hatch <dylanbhatch@google.com>

unwind: arm64: Use sframe to unwind interrupt frames

This patch adds kunwind_next_regs_sframe() to unwind interrupt frames using
sframe info, falling back to frame-pointer unwinding on failure. It updates
the exception boundary unwinding logic to recover the return address more
reliably when sframe data is present.

> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrac=
e.c
> index 3ebcf8c53fb04..5aaeac9611015 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
[ ... ]
> @@ -244,6 +247,162 @@ kunwind_next_frame_record(struct kunwind_state *sta=
te)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
[ ... ]
> +/*
> + * Unwind from a pt_regs according to sframe.
> + */
> +static __always_inline int
> +kunwind_next_regs_sframe(struct kunwind_state *state)
> +{
> +	struct unwind_frame frame;
> +	unsigned long cfa, fp, ra;
> +	enum kunwind_source source =3D KUNWIND_SOURCE_FRAME;
> +	struct pt_regs *regs =3D state->regs;
> +
> +	int err;
> +
> +	if (WARN_ON_ONCE(state->source !=3D KUNWIND_SOURCE_REGS_PC))
> +		return -EINVAL;
> +	if (WARN_ON_ONCE(!state->regs))
> +		return -EINVAL;
> +
> +	/* FP/SP alignment 8 bytes */
> +	if (state->common.fp & 0x7)
> +		return -EINVAL;
> +
> +	err =3D sframe_find(state->common.pc, &frame);

[Severity: High]
Does calling sframe_find() here violate the noinstr guarantee of the stack
unwinding path?

The unwind path is called via arch_stack_walk() -> kunwind_stack_walk() ->
kunwind_next() -> kunwind_next_regs_sframe().

Since arch_stack_walk() is explicitly marked noinstr to guarantee safe
execution in uninstrumentable contexts (like nmi), calling instrumentable
or rcu-protected functions like sframe_find() and __module_text_address()
could cause a recursive fault or kernel panic if tracing or kasan is active.

Additionally, could accessing rcu-protected module structures without rcu
watching lead to use-after-free bugs when stack unwinding is routinely
triggered by tools like perf or bpf tracing?

> +	if (err)
> +		return -EINVAL;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918224157.1471=
085-1-dylanbhatch@google.com?part=3D11

