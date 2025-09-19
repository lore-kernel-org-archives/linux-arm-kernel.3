Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38817CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSzMe//16LtxEw4Uy0kZy400DtRRLQUi9irQyjFw1CM=; b=miZBm0iMZxa2MCD//Qv7IovwI0
	Lf010Uh+FXEERYEfmekztQ1HhQAZGdoYE6qmdivcLUp/WbvnI2wwvohavbtf2P4gKBeYPQWUIaO4F
	iLl9doykqD6LbNeieXAEbYaYYIQ9UKECMJ+DsHLMEW7aSnJi2H6IcuspGaOeMLTpDkT+F+gySUr1v
	DATNGksPC/lW8HEToy/UJIgyO75BRCUT++v2YWgn+1BZ4ZLgyk+AzSLRLZYCXr8qQpv9JrTUROLnJ
	4MAuuskm09irnOx5vDTxQX3HltTHtq3Gonth4snX07paWGx8gntMGnOQUhGaVYM1YpBtdNmyHGqzU
	yWe4+/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjns-00000004Eif-21DQ;
	Fri, 19 Sep 2025 22:42:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjnq-00000004Egz-0xKc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:42:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9695744F1A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 22:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770D9C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758321725;
	bh=Zm1M3jHb9CJ3r71mYFzgfrQOp48B7ZOWK1X98tIDqzI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iCI3vAvxCZ1fdHW7PlbAGgZvqXMeRuoIhAE1SwbMhBQZhtPLhQxkxks6Xv1ecCjYK
	 zA+FyJo4ZycF/1Sa82O00r7ip4tY4ljZuZWU+YmeOgzp6+RIkU8pt5PaB/xnzAa6yV
	 xa1MCA2nc54d+OvT0vC3mru5Nyj+XwGKbzpGABAYMqAXDJSi5YlRurCl2wtE1zPNTp
	 tCeEPynuKTvxw3pZSrxbYlsgT8Uptgsd8VDf7bMwvdRAMGopUy1S0mZQ2rz6CEZIBW
	 LAah1wVrsCTzVK5Bq0YHJyKwv+5Mpy6Bvs5C0pjvuJKi7Fd2KmgiwIIv5rregCROJY
	 Vng59aOXu+rHA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-33730e1cda7so22158761fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 15:42:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAoz+DZO7Y++gnh0mmNs8cSbTywrphhMLMT/n81r+jM3dLBv0Kgca/6AAfB6IoLl8U2mOwAFLyCQrLHKld8+uo@lists.infradead.org
X-Gm-Message-State: AOJu0YwMPgi17z4vf2lsMwM/ztf7naQpdTbfk0QJuS0i5Xu8RCh03bzk
	nCbdIKtXrGNbcKRZM3kcOo+NWkDi+yDEsLnr2pJnwU8a4s3wBdzKXbqelvn5WRGuWJq/EFcAbzn
	Zk3ozS4dxVLW8KateDnwAN567yIhjJ7g=
X-Google-Smtp-Source: AGHT+IFHcKMAvs4PQQTYZlUVDWSc5ZK0PVWE4ileGQsev+UZeJzNDCdz1kpAlU2C8sOjUFnO06qBBhVnBMPRCeiLVIc=
X-Received: by 2002:a2e:8a8e:0:b0:35f:ddb1:96c4 with SMTP id
 38308e7fff4ca-36419785d45mr9902251fa.29.1758321723793; Fri, 19 Sep 2025
 15:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250918063539.2640512-7-ardb+git@google.com> <20250919193221.GB2249@quark>
In-Reply-To: <20250919193221.GB2249@quark>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 20 Sep 2025 00:41:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFOS4n4HNCZuoSUT3KUs+pM6OqSYz3Pv5z1dmZJZ70meQ@mail.gmail.com>
X-Gm-Features: AS18NWAn8XZaWe_Iq5DVEqnG3m8nSgWuT9HLn9m4iHtAqolG9uEsGI6YX_WDbKI
Message-ID: <CAMj1kXFOS4n4HNCZuoSUT3KUs+pM6OqSYz3Pv5z1dmZJZ70meQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: Move kernel mode FPSIMD buffer to the stack
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_154206_305952_88DF0758 
X-CRM114-Status: GOOD (  29.08  )
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

On Fri, 19 Sept 2025 at 21:32, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Sep 18, 2025 at 08:35:40AM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
> > context switch out of struct thread_struct, and onto the stack, so that
> > the memory cost is not imposed needlessly on all tasks in the system.
> >
> > Patches #1 - #3 contains some prepwork so that patch #4 can tighten the
> > rules around permitted usage patterns of kernel_neon_begin() and
> > kernel_neon_end(). This permits #5 to provide a stack buffer to
> > kernel_neon_begin() transparently, in a manner that ensures that it will
> > remain available until after the associated call to kernel_neon_end()
> > returns.
> >
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Mark Brown <broonie@kernel.org>
> >
> > Ard Biesheuvel (5):
> >   crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
> >   crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
> >   crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
> >   arm64/fpsimd: Require kernel NEON begin/end calls from the same scope
> >   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
> >
> >  arch/arm64/crypto/aes-ce-ccm-glue.c |  5 +--
> >  arch/arm64/crypto/sm4-ce-ccm-glue.c | 10 ++----
> >  arch/arm64/crypto/sm4-ce-gcm-glue.c | 10 ++----
> >  arch/arm64/include/asm/neon.h       |  7 ++--
> >  arch/arm64/include/asm/processor.h  |  2 +-
> >  arch/arm64/kernel/fpsimd.c          | 34 +++++++++++++-------
> >  6 files changed, 34 insertions(+), 34 deletions(-)
>
> This looks like the right decision: saving 528 bytes per task is
> significant.  528 bytes is a lot to allocate on the stack too, but
> functions that use the NEON registers are either leaf functions or very
> close to being leaf functions, so it should be okay.
>

Indeed.

> The implementation is a bit unusual, though:
>
>    #define kernel_neon_begin()  do { __kernel_neon_begin(&(struct user_fpsimd_state){})
>    #define kernel_neon_end()    __kernel_neon_end(); } while (0)
>
> It works, but normally macros don't start or end code blocks behind the
> scenes like this.

That is kind of the point, as it restricts the use of them to an idiom
that guarantees that the stack variable lives long enough.

> Perhaps it should be more like s390's
> kernel_fpu_begin(), where the caller provides the buffer that the
> registers are stored in?
>

If we're happy to change the API on both arm64 and ARM, then we could
make it more explicit. It's a lot more work, though.

