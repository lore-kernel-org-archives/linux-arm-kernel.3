Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFCDD7495C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYO2T+OQI2pW4WXksFSofah53bAh2nrMVfqpclHqiT0=; b=x9RLOcN8K+kyEKOqT9CDKNbN5p
	jS7pvegSQKOIthUkL+L/meXnNHaDHUqkfsqR0L0A9G16eBPqNxiqd8Db6bKKJFJfAa5hNoN/X0vNW
	7WiVllI5ZVnJkVxELjZy06ZiF6CGa2zYWHSIKWJiilZ974fnYQgX1c8k0J+eKLSF7B9Wg7uO33Wxp
	GVNDkdrF9+DMzwbIrhBCZOCBn+kcJZMhxp7m+xRo9DMjkpyn9cxuLTRDmAYpp3z3uUBNPrDAyd2+O
	HyPaqhMSqcX8CeHg5uuwk081tWISIm9sMPDBebfVmx74VB/UIaZj8piI/Ft4IUVq4WajRHzSecl6g
	KUbB/5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t609L-0000000Gesg-3UAc;
	Wed, 30 Oct 2024 04:17:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t607j-0000000GenW-3Tur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 375A45C5983;
	Wed, 30 Oct 2024 04:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C33C4CEC7;
	Wed, 30 Oct 2024 04:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730261758;
	bh=o4QMNINshMdeE54Ikmn/fVeslMwC6VMHBKeT0bsQGQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrT04QnjqJdWe6taNkLHz5sNSOMujexhTn9lrkSvnhsF6R8TI9GMu2VY9M67YaTOu
	 jBgY63OMgmEX9eh7gJylEdWF/gtuEs2jGOdt/zLmsMwb7I9e7bkbKVwk73wCgB9RhP
	 AJuXyz/XMDhhEop/5cQuVtaCJpbwG1jRBBZqWlbGersh/HLGCpI3AX/N/ESsPLEoqI
	 43itpkwhBUM0dilJSLg455zH68bHSlRYhL831nRPNPjqCMUz37TzMcX5+ADrfKB4ur
	 xs0dB3j5hX+8y3CKZlEbzDYbhaYE1xYenJdOdYBLhohQ2XsnwbfzCm+bbEDeXhUZO/
	 rc4bhJCb1vEXQ==
Date: Tue, 29 Oct 2024 21:15:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 3/6] crypto: arm64/crct10dif - Remove remaining 64x64
 PMULL fallback code
Message-ID: <20241030041557.GC1489@sol.localdomain>
References: <20241028190207.1394367-8-ardb+git@google.com>
 <20241028190207.1394367-11-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028190207.1394367-11-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_211559_941102_475BF2BE 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, Oct 28, 2024 at 08:02:11PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The only remaining user of the fallback implementation of 64x64
> polynomial multiplication using 8x8 PMULL instructions is the final
> reduction from a 16 byte vector to a 16-bit CRC.
> 
> The fallback code is complicated and messy, and this reduction has very
> little impact on the overall performance, so instead, let's calculate
> the final CRC by passing the 16 byte vector to the generic CRC-T10DIF
> implementation.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/crct10dif-ce-core.S | 237 +++++---------------
>  arch/arm64/crypto/crct10dif-ce-glue.c |  15 +-
>  2 files changed, 64 insertions(+), 188 deletions(-)

For CRCs of short messages, doing a fast reduction from 128 bits can be quite
important.  But I agree that when only a 8x8 => 16 carryless multiplication is
available, it can't really be optimized, and just falling back to the generic
implementation is the right approach in that case.

> diff --git a/arch/arm64/crypto/crct10dif-ce-core.S b/arch/arm64/crypto/crct10dif-ce-core.S
> index 8d99ccf61f16..1db5d1d1e2b7 100644
[...]
>  	ad		.req	v14
> -
> -	k00_16		.req	v15
> -	k32_48		.req	v16
> +	bd		.req	v15
>  
>  	t3		.req	v17
>  	t4		.req	v18
> @@ -91,117 +89,7 @@
>  	t8		.req	v22
>  	t9		.req	v23

ad, bd, and t9 are no longer used.

> +	// Use Barrett reduction to compute the final CRC value.
> +	pmull2		v1.1q, v1.2d, fold_consts.2d	// high 32 bits * floor(x^48 / G(x))

v0.2d was accidentally replaced with v1.2d above, which is causing a self-test
failure in crct10dif-arm64-ce.

Otherwise this patch looks good; thanks!

- Eric

