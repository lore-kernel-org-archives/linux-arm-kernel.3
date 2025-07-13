Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195A4C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFpwko4you1qWviX5+uv3oBLEqN9EKfxcttZW89fHpw=; b=DVxl5uUbG4T5pVLvORR+zXQYbI
	bdrPSE3ceoF+IHgrm+NDHAvMQ1eOh/5iB4h7L/F4NphOAMnUugKMiVksXpvgvWtrrb56wsHQiUxUJ
	owfNs+wISXBPdePF3dyvDtYo8KsHRRcQ0Yvylyu7uwOpHHOKt0xTdL1TWVGooyMcR0Ppsr0orHwn7
	4WH1p1PMiY3xSpV8qkWD7/LQZzC9NFa60jN8mRkLAbnIDcnr2NB3kZNxJhAFDSYFUmxVVe/B4bc9S
	PBVRPDck/gLy3RTu6hGssOwhU63ltbGgneYuz/wLujNmZBM06EkZuh3vMeTw3qJAEeNXK/M0VuPN3
	1YckTWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uauV6-0000000050N-0KHg;
	Sun, 13 Jul 2025 11:04:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uauSh-000000004rf-2y7m
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 11:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4903944584;
	Sun, 13 Jul 2025 11:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED52C4CEE3;
	Sun, 13 Jul 2025 11:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752404498;
	bh=3ppvpjpE778pR8n0IiMaZ2ojlFIf7ZdM68QSPS9hKOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FDq9/w7vNZwogdD6T7cz6Axb3o/rs2QVeLRHOucGVkWk2DES14Rbo5xe+Yc/GWoWN
	 G9oc+Oyd4Z6b0TMUU5S+n0t8n+auBLff7HXZChTCnRN4twX8tJj/tzwqA4UcTrp9qT
	 D2tLWRroi1gm4uLLGOPtHJG0ncjNn3MpSKvbYtONulitHsLl4DVC28kWEKNPC6BqUm
	 Q1zihsSgSWa1yB0Uxw12YArp2mBmWT6JsMTP6jwEPUM29tV34P/OteUmM/Kiy9hrEC
	 9vQ8kFoV+cZjt03Ah3uQapC9aSPn2Df1AxqoVGl+AFo7dx3ALPUD+PspGhNylk99Uo
	 VReuZKXA4wZEg==
Date: Sun, 13 Jul 2025 12:01:30 +0100
From: Will Deacon <will@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maxwell Bland <mbland@motorola.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Dao Huang <huangdao1@oppo.com>
Subject: Re: [PATCH bpf-next v9 2/2] arm64/cfi,bpf: Support kCFI + BPF on
 arm64
Message-ID: <aHOSCtykfYLLmy1n@willie-the-truck>
References: <20250505223437.3722164-4-samitolvanen@google.com>
 <20250505223437.3722164-6-samitolvanen@google.com>
 <aHEfJZjW9dTXCgw3@willie-the-truck>
 <CABCJKued2XsLp5+ZW1ZWQn6=CgYkhjEDyJdfTRTR1MGkvDtmXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKued2XsLp5+ZW1ZWQn6=CgYkhjEDyJdfTRTR1MGkvDtmXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_040139_795119_8D4A03C7 
X-CRM114-Status: GOOD (  25.38  )
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

Hey Sami,

On Fri, Jul 11, 2025 at 11:49:29AM -0700, Sami Tolvanen wrote:
> > > +#define cfi_get_offset cfi_get_offset
> > > +extern u32 cfi_bpf_hash;
> > > +extern u32 cfi_bpf_subprog_hash;
> > > +extern u32 cfi_get_func_hash(void *func);
> > > +#else
> > > +#define cfi_bpf_hash 0U
> > > +#define cfi_bpf_subprog_hash 0U
> > > +static inline u32 cfi_get_func_hash(void *func)
> > > +{
> > > +     return 0;
> > > +}
> > > +#endif /* CONFIG_CFI_CLANG */
> > > +#endif /* _ASM_ARM64_CFI_H */
> >
> > This looks like an awful lot of boiler plate to me. The only thing you
> > seem to need is the CFI offset -- why isn't that just a constant that we
> > can define (or a Kconfig symbol?).
> 
> The cfi_get_offset function was originally added in commit
> 4f9087f16651 ("x86/cfi,bpf: Fix BPF JIT call") because the offset can
> change on x86 depending on which CFI scheme is enabled at runtime.
> Starting with commit 2cd3e3772e41 ("x86/cfi,bpf: Fix bpf_struct_ops
> CFI") the function is also called by the generic BPF code, so we can't
> trivially replace it with a constant. However, since this defaults to
> `4` unless the architecture adds pre-function NOPs, I think we could
> simply move the default implementation to include/linux/cfi.h (and
> also drop the RISC-V version). Come to think of it, we could probably
> move most of this boilerplate to generic code. I'll refactor this and
> send a new version.

Excellent, thanks.

> > > @@ -2009,9 +2018,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> > >               jit_data->ro_header = ro_header;
> > >       }
> > >
> > > -     prog->bpf_func = (void *)ctx.ro_image;
> > > +     prog->bpf_func = (void *)ctx.ro_image + cfi_get_offset();
> > >       prog->jited = 1;
> > > -     prog->jited_len = prog_size;
> > > +     prog->jited_len = prog_size - cfi_get_offset();
> >
> > Why do we add the offset even when CONFIG_CFI_CLANG is not enabled?
> 
> The function returns zero if CFI is not enabled, so I believe it's
> just to avoid extra if (IS_ENABLED(CONFIG_CFI_CLANG)) statements in
> the code. IMO this is cleaner, but I can certainly change this if you
> prefer.

Ah, that caught me out because the !CONFIG_CFI_CLANG stub is in the
core code (and I'm extra susceptible to being caught out on a warm
Friday evening!).

Hopefully if you're able to trim down the boilerplate then this will
become more obvious too.

Cheers,

Will

