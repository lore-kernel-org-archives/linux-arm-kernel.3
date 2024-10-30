Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D76D7495A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCLuidDTViyjVcj7I8PDwf2LhW5knqMmH4XhYbXST9w=; b=eLrEaVY+i1nGSs/mFJom2N5BG8
	VOqRsAD6oMpBc+L3uwNWOelEU4CUkj/3Aw3nSh8Nn2Wb1b88FVSNvgEW1hsHknbvx4M48FtKjXvpw
	c07V2sJBYoKudAd7o4lew0naAgqp8UX6A7QfRLeCJkqrMKUALKAR7wTqaGmC8UHTTnb4q/WjSlKs0
	g58iUBQey5WXKGmj/q7LYGfcyQ0uYPlwEt7vHW+2BMa/WzpVkls3JEyEhKfJAgnrxQP+1zh+jIkAl
	NiIY90+viDnhCs3R3jQUzpTEh6MChdNiyFuHlZ1aT3znh78Lql9unnE1HGzm8JRRNzFI9dPkurcrl
	9Dadg3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zvk-0000000Gdgv-31KM;
	Wed, 30 Oct 2024 04:03:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zu8-0000000GdcO-022K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD09F5C571E;
	Wed, 30 Oct 2024 04:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3371C4CEC7;
	Wed, 30 Oct 2024 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730260914;
	bh=uVky3tQI3j+KiXifNE+KmZt4WDI0UX160uUiPA8t9Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kj+bYJy3boFJiIhoSSDCdm7Fh/Uo4Uc/lAObeG/rX0l5fmVxKpC7LZDiUcj2NqsQR
	 Jz6ULUohdpw28HpHKUDO1m9/PVT58nUrghkL9J7GuUrepIAfNlSHPTtAQSnoHokHx9
	 cmPiJH7EVwhJquE6qbzt+mwThkd4sz2TmVbUYT6d2YbCpmUFvn4uA/KdKFtEMZtuBt
	 ZH9CdhioJ/bpkgtWla66teyic0VHCYnidSX8N79EsB20tlPzS8gShKSnZjTVRjzn/l
	 uQq4Zy96n4KkoveHP22dfHNy6ILQ9Vic/6S70HqKS1ojHnYCUzbwxg6C31W8RFuzrO
	 V9epqklXdPa1A==
Date: Tue, 29 Oct 2024 21:01:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 2/6] crypto: arm64/crct10dif - Use faster 16x64 bit
 polynomial multiply
Message-ID: <20241030040152.GB1489@sol.localdomain>
References: <20241028190207.1394367-8-ardb+git@google.com>
 <20241028190207.1394367-10-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028190207.1394367-10-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_210156_114358_6DD57C6A 
X-CRM114-Status: GOOD (  18.69  )
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

On Mon, Oct 28, 2024 at 08:02:10PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The CRC-T10DIF implementation for arm64 has a version that uses 8x8
> polynomial multiplication, for cores that lack the crypto extensions,
> which cover the 64x64 polynomial multiplication instruction that the
> algorithm was built around.
> 
> This fallback version rather naively adopted the 64x64 polynomial
> multiplication algorithm that I ported from ARM for the GHASH driver,
> which needs 8 PMULL8 instructions to implement one PMULL64. This is
> reasonable, given that each 8-bit vector element needs to be multiplied
> with each element in the other vector, producing 8 vectors with partial
> results that need to be combined to yield the correct result.
> 
> However, most PMULL64 invocations in the CRC-T10DIF code involve
> multiplication by a pair of 16-bit folding coefficients, and so all the
> partial results from higher order bytes will be zero, and there is no
> need to calculate them to begin with.
> 
> Then, the CRC-T10DIF algorithm always XORs the output values of the
> PMULL64 instructions being issued in pairs, and so there is no need to
> faithfully implement each individual PMULL64 instruction, as long as
> XORing the results pairwise produces the expected result.
> 
> Implementing these improvements results in a speedup of 3.3x on low-end
> platforms such as Raspberry Pi 4 (Cortex-A72)
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/crct10dif-ce-core.S | 71 +++++++++++++++-----
>  1 file changed, 54 insertions(+), 17 deletions(-)

Thanks, this makes sense.

> +SYM_FUNC_START_LOCAL(__pmull_p8_16x64)
> +	ext		t6.16b, t5.16b, t5.16b, #8
> +
> +	pmull		t3.8h, t7.8b, t5.8b
> +	pmull		t4.8h, t7.8b, t6.8b
> +	pmull2		t5.8h, t7.16b, t5.16b
> +	pmull2		t6.8h, t7.16b, t6.16b
> +
> +	ext		t8.16b, t3.16b, t3.16b, #8
> +	eor		t4.16b, t4.16b, t6.16b
> +	ext		t7.16b, t5.16b, t5.16b, #8
> +	ext		t6.16b, t4.16b, t4.16b, #8
> +	eor		t8.8b, t8.8b, t3.8b
> +	eor		t5.8b, t5.8b, t7.8b
> +	eor		t4.8b, t4.8b, t6.8b
> +	ext		t5.16b, t5.16b, t5.16b, #14
> +	ret
> +SYM_FUNC_END(__pmull_p8_16x64)

A few comments in the above function would be really helpful.

- Eric

