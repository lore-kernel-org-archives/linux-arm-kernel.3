Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F78FCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkl4sR7vzufgWkjQ1saXN08wf7PWrUa9x52UIeb6DXo=; b=wJ6XKnxspN00PFPtFyeu/CM8a9
	vVXLfMd4Tn3PdKkVim+HbyKH4kw+00vZbVz3goReGfOY5GsKWmNudPfnImHL0skygbkuZVwA/Ha2o
	37uXKvXpC/aeAdLsBG6rN3zqQ8v540862uzVp3pD0xXYtt/o9aRYdN3VMJilbNBK3yUyGti6qsuZO
	G/Yc/7v3l9aVaTMRHUM+J/7kF0aq0umkDjwHnatFdQ32QC3i+9n/xpjjZoazKCCLl5QzrpwE/ZIzB
	P1TApweOdmIN/0HsYtA4+bCVxSZhUbEgWFAjqVFOwilgF2zid9fddXTMzLVwssjVoVXffVtPuzSkJ
	vgPzbaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxNt-00000007S4r-41TS;
	Fri, 29 May 2026 13:36:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxNs-00000007S4d-1dl2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 13:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57B3E600AA;
	Fri, 29 May 2026 13:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8503D1F00893;
	Fri, 29 May 2026 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780061779;
	bh=tkl4sR7vzufgWkjQ1saXN08wf7PWrUa9x52UIeb6DXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ei/P//Bdo7LQH9SHf4hMwHCjs5/09N0sRrmYWFaUJmPLiYB/r2Ox3F+KotJwIopVY
	 tGzsfEs0PMxKRaMp/EK3dSintQMjamBdnhUchtjYb04yBqJQLTbm4XmmqBXQmkfPTP
	 r/1LedetR72P+I+dkeNIOb4J/guQMcE7PWHbS1S7ztVO+Pb+LJ4wgqouHmq/x8mXCu
	 hCpuPY6pCZOotBU90aqu3prcEBG9/XS5fRevVh3Ab41OkqzInJP5R3WMDoFZUtUVPW
	 3bH4I/ph6hpGGZWw5PM0qr3NO7r28ielMUBjIghzKvuYLwwpt8/LXaro+TwHpW0KXG
	 UHJfbSmDJOSEg==
Date: Fri, 29 May 2026 14:36:13 +0100
From: Will Deacon <will@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: bpf@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf-next v2 2/3] bpf, arm64: Add JIT support for stack
 arguments
Message-ID: <ahmWTbYokwcp1Lel@willie-the-truck>
References: <20260427234801.2104511-1-puranjay@kernel.org>
 <20260427234801.2104511-3-puranjay@kernel.org>
 <ahhGbFY_4Dai1NjR@willie-the-truck>
 <CANk7y0j6JecSuJVZg1phn2tSHrcHPDqqmoaDBy1LdnMo-1qsFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk7y0j6JecSuJVZg1phn2tSHrcHPDqqmoaDBy1LdnMo-1qsFg@mail.gmail.com>
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

On Thu, May 28, 2026 at 03:23:32PM +0100, Puranjay Mohan wrote:
> Thanks for your review.
> These patches have already landed in bpf-next tree as a part of this
> series: https://lore.kernel.org/all/20260513044949.2382019-1-yonghong.song@linux.dev/
> 
> I will take all your feedback and send fixes for all the required changes.

Thanks. My review backlog is huge, but I still try to look at stuff even
after it's been merged.

> > How does that work with kfuncs? I think the PCS means that they will
> > expect to pick the stack arguments starting at [SP+0]. Or are you
> > saying that SP == FP+16 on entry to the callee? It's hard to reconcile
> > that with the ASCII art in build_prologue() because neither "current
> > A64_FP" nor "BPF_FP" point below A64_SP and it's not clear which of them
> > you're referring to when you refer to "FP" on its own.
> 
> At entry to kfunc the arguments are starting at [SP+0] like a normal C
> callee function would expect.
> 
> The line "callee reads them from [FP+16], [FP+24]" is for a BPF callee
> which always emits a frame record.
> So the caller puts the arguments at SP+0, SP+8, .. and then the callee
> creates the frame record in the prologue which means the first
> argument is at FP+16, ....
> This is just an implementation detail about how the JITed BPF callee
> programs can read stack arguments from FP+16, ... easily.

That makes sense, but if you're able to rejig the diagram in
build_prologue() to mirror that then it would really help us to remember
it in future.

> > > @@ -1191,6 +1207,41 @@ static int add_exception_handler(const struct bpf_insn *insn,
> > >       return 0;
> > >  }
> > >
> > > +static const u8 stack_arg_reg[] = { A64_R(5), A64_R(6), A64_R(7) };
> > > +
> > > +#define NR_STACK_ARG_REGS    ARRAY_SIZE(stack_arg_reg)
> > > +
> > > +static void emit_stack_arg_load(u8 dst, s16 bpf_off, struct jit_ctx *ctx)
> > > +{
> > > +     int idx = bpf_off / sizeof(u64) - 1;
> > > +
> > > +     if (idx < NR_STACK_ARG_REGS)
> > > +             emit(A64_MOV(1, dst, stack_arg_reg[idx]), ctx);
> > > +     else
> > > +             emit(A64_LDR64I(dst, A64_FP, (idx - NR_STACK_ARG_REGS) * sizeof(u64) + 16), ctx);
> > > +}
> >
> > Is it worth asserting that bpf_off >= 8 here or can we rely on that? I
> > struggled to find any details about how bpf passes arguments on the
> > stack (beyond what you describe in the commit message) and grepping for
> > BPF_REG_PARAMS didn't help either.
> 
> This and other patches in this set has more information about this:
> https://lore.kernel.org/all/20260513045015.2385013-1-yonghong.song@linux.dev/

Thanks, that matches what I'd managed to figure out.

Will

