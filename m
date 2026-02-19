Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EAFE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B6yAbwQi885iJhPO7sKHwrFaCS4FvfMYyRvu80r6Ww=; b=2SFuq5Mkj1Pi9o/yX3Ryyl25Ww
	NZJbjVnNagBIBeZEQfTs/iS34P67h9eLiwG2TlGQJN1uOV/5yfmRvCctfG8u/PdX57tQ/IaPiuz5k
	cVWRzBL3La82Dxd1g6tET250aF2osKIf4yMvKYCikugmXT9LeGDDusKcg/tnHK3rwsGfoFYAPD0P+
	6HCMVywazye1qLxQd+j9ltopPChhVNe6yMVCcAc3gStCn6xn0vlMwajDJ6ncQXU9ZxVakqoraf22j
	2FNsUsDx3qjGuPs+jRDVGUOLnLL1Z8s4Sm8+by+b1JeHPfctXgr/5NhOjYTv2FlcXOJBLn51H+L5+
	QUeiod/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0Gf-0000000BAbO-1wzq;
	Thu, 19 Feb 2026 09:24:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt0Gd-0000000BAbG-2CR2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 09:24:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 945DE6014C;
	Thu, 19 Feb 2026 09:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F6EC19421;
	Thu, 19 Feb 2026 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771493054;
	bh=7x4iJcrAJx0s0mdhi4aA1VWX8cBG3QA4CqCnflf0TaM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=j0S7PTc1AYTKclJM4VrrVU73y39Gm+g1r0n/WB7xvc3rog9V/88uQNpd+8q1TlVcn
	 ra6uE9LnD/79O8wcOlmXwu9frhVyscQZnWG7kWrQyn5qTxRmOwzunDbtYSczvigdQD
	 ZTOcAwGOMbTeUY5sIy2E0enw9aRm1Ng6Umu2gKZYUQpRgZOvFBBhAltlarDgN7p+Am
	 E0al+pDRVghpOIouVejND5QjFktE9G1S02hbhwv+/9rtqDBy/gcqZBd1NiTsHyaFpV
	 +6gY/TUDkPL2SMODbqJt2GntC0KvwUsViOAurmArgOX/BI9R0uw3X/Lmlj/xuJOY7E
	 2JDwQhG8WBF3w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 67629F40069;
	Thu, 19 Feb 2026 04:24:12 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 19 Feb 2026 04:24:12 -0500
X-ME-Sender: <xms:vNaWabUcj4Aqx9nItrl4czIWPhn8_OResdeqA8wQhJn4x4rLxaDZIg>
    <xme:vNaWaeaqJJmsesaxFxUUxAR6N5U-1Wdl2OF-dWkCWD10w_KDLVGV_mXTUlpaGtL_Z
    pp9Z8OOU3O17BfqmwyW7PKa2ydBlWTKAdgMpAbYFtP-MWeUgLQw6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdehudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejudffheffueetveelgfeiueetgfegffelueetfeevkeeiueetieejkeef
    ueeiudenucffohhmrghinheprggvshdqmhhouggvshdrshgsnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusg
    eppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthht
    ohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgvrhgsvghrthesghhonh
    guohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegvsghighhgvghrsheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlih
    hsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtghifhhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqtghrhihpth
    hosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfihirh
    gvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgv
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrshhonhesiiigvdgtge
    drtghomh
X-ME-Proxy: <xmx:vNaWaS64zKkRvQhaNM4wCXInrk7mBmRvcZy3O0-GJa4-wT3LisAR5A>
    <xmx:vNaWaXyS8N5sSvspaCM7is8CG3TqLDxl3wmtkBthmQen6O9hfbZ2yQ>
    <xmx:vNaWaefhJHLJmMJBEgL7DuqFOar2e3PCt75BVdSotqPSZEe5b9PsAg>
    <xmx:vNaWaUAkzwzwun1XhrdCGxSumha3ZtmudVayj7zyOqUPz8l0hnV-fg>
    <xmx:vNaWaa4oFUIZH8U2AHQhIKYPHtakE0NUwPusoA5Ny-wiou4_xJBzfBPs>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44524700065; Thu, 19 Feb 2026 04:24:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AlW4kGf5pqho
Date: Thu, 19 Feb 2026 10:23:39 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-wireless@vger.kernel.org, stable@vger.kernel.org
Message-Id: <21d30582-9cb2-4e7a-9aa8-36e16aa45ff9@app.fastmail.com>
In-Reply-To: <20260218213501.136844-4-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
 <20260218213501.136844-4-ebiggers@kernel.org>
Subject: Re: [PATCH 03/15] crypto: arm64/aes - Fix 32-bit aes_mac_update() arg treated
 as 64-bit
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



On Wed, 18 Feb 2026, at 22:34, Eric Biggers wrote:
> Since the 'enc_after' argument to neon_aes_mac_update() and
> ce_aes_mac_update() has type 'int', it needs to be accessed using the
> corresponding 32-bit register, not the 64-bit register.  The upper half
> of the corresponding 64-bit register may contain garbage.
>

How could that happen? Setting the 32-bit alias of a GPR clears the upper half.

> Fixes: 4860620da7e5 ("crypto: arm64/aes - add NEON/Crypto Extensions 
> CBCMAC/CMAC/XCBC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Agree with the change but I don't think this needs a cc:stable (or a fixes tag)

> ---
>  arch/arm64/crypto/aes-modes.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/crypto/aes-modes.S b/arch/arm64/crypto/aes-modes.S
> index 0e834a2c062c..e793478f37c1 100644
> --- a/arch/arm64/crypto/aes-modes.S
> +++ b/arch/arm64/crypto/aes-modes.S
> @@ -836,11 +836,11 @@ AES_FUNC_START(aes_mac_update)
>  	encrypt_block	v0, w2, x1, x7, w8
>  	eor		v0.16b, v0.16b, v3.16b
>  	encrypt_block	v0, w2, x1, x7, w8
>  	eor		v0.16b, v0.16b, v4.16b
>  	cmp		w3, wzr
> -	csinv		x5, x6, xzr, eq
> +	csinv		w5, w6, wzr, eq
>  	cbz		w5, .Lmacout
>  	encrypt_block	v0, w2, x1, x7, w8
>  	st1		{v0.16b}, [x4]			/* return dg */
>  	cond_yield	.Lmacout, x7, x8
>  	b		.Lmacloop4x
> @@ -850,11 +850,11 @@ AES_FUNC_START(aes_mac_update)
>  	cbz		w3, .Lmacout
>  	ld1		{v1.16b}, [x0], #16		/* get next pt block */
>  	eor		v0.16b, v0.16b, v1.16b		/* ..and xor with dg */
> 
>  	subs		w3, w3, #1
> -	csinv		x5, x6, xzr, eq
> +	csinv		w5, w6, wzr, eq
>  	cbz		w5, .Lmacout
> 
>  .Lmacenc:
>  	encrypt_block	v0, w2, x1, x7, w8
>  	b		.Lmacloop
> -- 
> 2.53.0

