Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D48DD7495F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wGV0644zHjr70nx+mJSFvKbx5slDLCDhnfCCOlyOwc=; b=4eIx/mOAMSvTmtL+UieaunxxiK
	Dq549/MiLlZnje4DSXfRd4zlrlJBOcozg4JMZ96j2zHh2L3uaykMOtz7fUUCASWNs5J+0/WfLg/+v
	0CInh7ecP0EQ6W17ZeNPvH5a8mvJo0l5P3gBrjG/6+7FaYo7VCEQofDLx5CY1JJsbhMpIQBsxfZQr
	o5ezaubWvKl5+3nHfRHlpBvL4KB3rTvg6q4G9SC6RgNkjLgOYYB/evYKlb6r4r3HuGc72Pnx4QzKL
	elQXIaY7m1MMCa4NmHTeHqpemoLj0NqvUXIPzMMQGEJ19r6I1wGx8IxITqekK5JEoE8buitXbQvcf
	a+3Fdkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60QI-0000000GgGf-0HZC;
	Wed, 30 Oct 2024 04:35:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60OU-0000000Gg08-3luX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DD21A42DEF;
	Wed, 30 Oct 2024 04:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87730C4CEE4;
	Wed, 30 Oct 2024 04:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730262797;
	bh=t4mVJkp9rXHoy60NmVGpzaELgy6bwcIcAK3aI7X/TsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Okp7QzXIpIroAShlV5GUsK5+YhgeR88PjhCdDHvCQUljYBg13QhrMqfl31EUk+zKQ
	 /TJkV18mhxdNopKDNBTIql8d0zyJfVIsqs6hIGRxWWgp8L8aBCML7pkqkbGe5CAhji
	 kbHrRPpr1Pa0BHSoG3cDFBUsWVg44R6SW7+r2jpPxvgD9KGmfnObrdUHm3UmGItB0o
	 u5XT74wCZNYpaf8f4cAA3J2+XoY7hNA6leWcdcjcdt0nptQ/5OVrEJ7SdA9s8aV/71
	 nBP4OcqEkncf9IiVspxeNC1zjO7VXD2O0uSsAOu2JUFCK7cCGl16dkm7bn+r2KFRme
	 geqttPntgwCFQ==
Date: Tue, 29 Oct 2024 21:33:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 6/6] crypto: arm/crct10dif - Implement plain NEON variant
Message-ID: <20241030043316.GF1489@sol.localdomain>
References: <20241028190207.1394367-8-ardb+git@google.com>
 <20241028190207.1394367-14-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028190207.1394367-14-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_213319_025475_53648DFC 
X-CRM114-Status: GOOD (  18.14  )
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

On Mon, Oct 28, 2024 at 08:02:14PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The CRC-T10DIF algorithm produces a 16-bit CRC, and this is reflected in
> the folding coefficients, which are also only 16 bits wide.
> 
> This means that the polynomial multiplications involving these
> coefficients can be performed using 8-bit long polynomial multiplication
> (8x8 -> 16) in only a few steps, and this is an instruction that is part
> of the base NEON ISA, which is all most real ARMv7 cores implement. (The
> 64-bit PMULL instruction is part of the crypto extensions, which are
> only implemented by 64-bit cores)
> 
> The final reduction is a bit more involved, but we can delegate that to
> the generic CRC-T10DIF implementation after folding the entire input
> into a 16 byte vector.
> 
> This results in a speedup of around 6.6x on Cortex-A72 running in 32-bit
> mode.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm/crypto/crct10dif-ce-core.S | 50 ++++++++++++++++++--
>  arch/arm/crypto/crct10dif-ce-glue.c | 44 +++++++++++++++--
>  2 files changed, 85 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/crypto/crct10dif-ce-core.S b/arch/arm/crypto/crct10dif-ce-core.S
> index 6b72167574b2..5e103a9a42dd 100644
> --- a/arch/arm/crypto/crct10dif-ce-core.S
> +++ b/arch/arm/crypto/crct10dif-ce-core.S
> @@ -112,6 +112,34 @@
>  	FOLD_CONST_L	.req	q10l
>  	FOLD_CONST_H	.req	q10h
>  
> +__pmull16x64_p8:
> +	vmull.p8	q13, d23, d24
> +	vmull.p8	q14, d23, d25
> +	vmull.p8	q15, d22, d24
> +	vmull.p8	q12, d22, d25
> +
> +	veor		q14, q14, q15
> +	veor		d24, d24, d25
> +	veor		d26, d26, d27
> +	veor		d28, d28, d29
> +	vmov.i32	d25, #0
> +	vmov.i32	d29, #0
> +	vext.8		q12, q12, q12, #14
> +	vext.8		q14, q14, q14, #15
> +	veor		d24, d24, d26
> +	bx		lr
> +ENDPROC(__pmull16x64_p8)

As in the arm64 version, a few comments here would help.

> diff --git a/arch/arm/crypto/crct10dif-ce-glue.c b/arch/arm/crypto/crct10dif-ce-glue.c
> index 60aa79c2fcdb..4431e4ce2dbe 100644
> --- a/arch/arm/crypto/crct10dif-ce-glue.c
> +++ b/arch/arm/crypto/crct10dif-ce-glue.c
> @@ -20,6 +20,7 @@
>  #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
>  
>  asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
> +asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len, u8 *out);

Maybe explicitly type 'out' to 'u8 out[16]'?

- Eric

