Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F28DC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuJIf2aoBaJ6kPCjr/Pql12UXi9Q+aLNH7PnF7eMFVw=; b=ZTY1C4tu3ucfMtZdTC0zrdIbAZ
	iZdDBxOR77MFVAgsFHOBlMImjZsolLAmPRw5s5r+zKbEM8e4lFmJUqwGvOGJAu/+RJZ6uedZ84hwV
	EM5IPg/XwANMqWueXgtjO/87f3daSRfVI2lAnjfjmyEg5t7Zlg0CzMsALLkYDvRPROdJULgMc01E3
	B7Rsqi5GFXb7rrB4Px32l76EnsPh/tE1kbGDQ6X3KgsHuIhGwH1X72xjwbMhR/eIbY20zX5odCVpO
	XUohrhi5Zwa9hYDBQaesMB6fI8VEfSouMla8svZnpSepvy7IzwgXoytymbiNILengGptEDvc5s2h2
	S59wGL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto2R-0000000EH8W-0yk0;
	Tue, 11 Aug 2026 15:05:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto2P-0000000EH87-2pJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:05:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EC814370B;
	Tue, 11 Aug 2026 15:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0447C1F000E9;
	Tue, 11 Aug 2026 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786460709;
	bh=cuJIf2aoBaJ6kPCjr/Pql12UXi9Q+aLNH7PnF7eMFVw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=FzvBZJHLjxF6MSUz0zXv+SF4BGkk+l60a9iK0ynAK3FQrCkpIktRS42+EF3qcnBzR
	 1fS1XhWAaumtbKDqxthjKv8ctxBOffEva3kxusutK1hDxhxh0uHo7Be6n1k6GNNR1E
	 3Wr3ZjnFAACU3Na0bFP243MP39o+RObKp7CkzCRiBFXAUqXOpELq26QI1gjQgZ+7gf
	 mO8ka/GQZkW8Bu/wqpZ4kzw4xGn7qkes5yrZEvDFEC5WGtxuxr1LZzE21zQmfFpFBL
	 LJug4isqEjg/8/MGj+gv7nDyupw1rLR3Y4cOgK/QkdbWt9MjonIYKkWTuVkA90hSu2
	 5Z7RwD8QSMAHg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A6532198003A;
	Tue, 11 Aug 2026 11:05:06 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 11:05:06 -0400
X-ME-Sender: <xms:IDp7altxbQQ3JSXWjcWQGqE8Z4qYs4lNXMfPxTpGdjIJ3OXp4Fr-GQ>
    <xme:IDp7apTZ43v-T7GFVODgjgaX8bo-UxesO3CIpw4w9mx1i0ksPDIlyEZ3LkAHOaX1n
    VE6vHzJGFxDb9xn_suGsinzJc83jK4Zw4O-W2TXlmymzwkYjp1LTyA>
X-ME-Proxy-Cause: dmFkZTGRQrvTqj4nIxnBKZouz0SX5s2ZjoZ7nSFEG3l9OO77VZpVPLA/jn1cTOIiAEXUKX
    K2ftnlB35lAHgdnpgJNXqXn1FBo8DAIzVHrgBz0jc6w8gofPFoJvMNVdrnkYjIaBsmrwMa
    MKvUrjMOztwtjXlcCnDEOVJPTepLaxy1bx1COwCwRhsp4/iVyv0JOoG6HKSVdEeK6ONY4q
    ogX84oZC4/KXXs16WHMMRFgrxKvq7t6Tn9OtaptXwAMsSkZ/a3/W29IfqUD6oruHG1AM+g
    DOcH7VcizzefX3EOZKEP+KgdwbgFIPrZef1+s0JJpfxPHUjEVK7veUdNdipzaijBK11HAe
    PYz5lzOlSFuDNBIlNgtEBVIblIqqiCkgsywZ/+pRCyElxe+sTqMmQLcsMaQvFYfMzt5NRG
    D2EuHNbXPQhdoD2RuQPCuCwObePYpN2m8/bT3QGcEtic6tub5WAGyUXMFqvtLbbHqjUgY4
    KkH/VhOHWtQFuE1ry2zwPiSVKZW6rIbHF73MoNlmSNHe/TjjFD54olBSPnvTNFhjEp5OlI
    ovWuSVJnhjADcrwhk0W0CErXLZlkm6Nbzdi1eAfjLllC0i5kYsg4J0pv93lQh4wP7tTNdA
    MSogLa48oFy2UE3bFZB1wH1ofmWMgwABEPfHEgNp5W/XANux/TVqhg0h8LIA
X-ME-Proxy: <xmx:Ijp7anRySrEqSiBe9QAwGgN-OGZrn4dv55EzpkMey7GZs6pJIoPGUQ>
    <xmx:Ijp7aqUwJa1LxHPLBXIseQOtDylAtUpyk6jBpnFK9DtSYQbMSSIhkw>
    <xmx:Ijp7asGKMFdvqBejEE-9JwTCEJ6nda56n-i9iWOHo3XV_dWKttWwVw>
    <xmx:Ijp7atdLPy-7AA8prEbR5rE0q1KF1oDLkz_uPZ2ScHgT8LpcbjV1Fw>
    <xmx:Ijp7alqC4yEqpsJRFMkwPF4-81ufUla44S5ZWSe7pGx1-XO3NFNOGMlJ>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0B92CF8006E; Tue, 11 Aug 2026 11:05:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 17:04:43 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Arnd Bergmann" <arnd@arndb.de>,
 "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>
Message-Id: <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
In-Reply-To: <20260811140132.22778-7-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
 <20260811140132.22778-7-will@kernel.org>
Subject: Re: [PATCH 06/12] arm64: assembler: Remove endianness helper macros
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Tue, 11 Aug 2026, at 16:01, Will Deacon wrote:
> The CPU_LE()/CPU_BE() helper macros are only used by head.S. Since
> big-endian support depends on BROKEN, remove the last users along with
> the macro definitions. The unused regs_to_64() assembly macro, which
> somewhat bizarrely behaves differently depend on the endianness, is also
> removed.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/assembler.h | 31 ------------------------------
>  arch/arm64/kernel/head.S           |  3 +--
>  2 files changed, 1 insertion(+), 33 deletions(-)
>
> diff --git a/arch/arm64/include/asm/assembler.h 
> b/arch/arm64/include/asm/assembler.h
> index effae53e9739..45279e577ff5 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -133,37 +133,6 @@ lr	.req	x30		// link register
>  	b	\label
>  	.endm
> 
> -/*
> - * Select code when configured for BE.
> - */
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -#define CPU_BE(code...) code
> -#else
> -#define CPU_BE(code...)
> -#endif
> -
> -/*
> - * Select code when configured for LE.
> - */
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -#define CPU_LE(code...)
> -#else
> -#define CPU_LE(code...) code
> -#endif
> -
> -/*
> - * Define a macro that constructs a 64-bit value by concatenating two
> - * 32-bit registers. Note that on big endian systems the order of the
> - * registers is swapped.
> - */
> -#ifndef CONFIG_CPU_BIG_ENDIAN
> -	.macro	regs_to_64, rd, lbits, hbits
> -#else
> -	.macro	regs_to_64, rd, hbits, lbits
> -#endif
> -	orr	\rd, \lbits, \hbits, lsl #32
> -	.endm
> -
>  /*
>   * Pseudo-ops for PC-relative adr/ldr/str <reg>, <symbol> where
>   * <symbol> is within the range +/- 4 GB of the PC.
> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index 87a822e5c4ca..8951ce693552 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
>  	b.ne	0f
>  	mrs	x19, sctlr_el2
>  0:
> -CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> -CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> +	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
>  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
>  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
>  	csel	x19, xzr, x19, eq		// clear x19 if Z

There is some more code that can be removed here - see
2ced0f30a426c7301350681f838344d5aea711e3


