Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A49D3B9B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 00:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bazfhuUcPUoOMFs2ohWb9g/bFLyka0Y+g/3ow8qU7FQ=; b=dZEPc4NqvTswSurTXQX33B0F+G
	joNLcVYzOIonSjyq6Y+4Il7/ocw3U+yYENfmkd4N44o5hx0SueefIgQjimr4M4ryohPy1kaWFxXRx
	47N89Cm/o9kXUVZl0C6rTB+17Ty+xy1zozoWmw9FSz2PscW1Nf42rsdaet004TVGJhv9cJbYdsGGD
	2QM+3ylbXmkK5dgwi7C/WKdH+UtIQsxI8qw5XiKWKhj6MXJXxPhNYLiUTh8bP1oDpbAq8ENLG/Y3W
	hqFGUT+2ar94sx65v/EFLjm5UDoyV4Zw/lFe0nveLGBknh+2WfV/Wh4quFapglWNux8wDnrK5SjbE
	s/vr2h5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT86D-0000000EwL5-39jm;
	Wed, 10 Dec 2025 00:30:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT86B-0000000EwKc-2nko
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 00:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83B80418B9;
	Wed, 10 Dec 2025 00:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F205C4CEF5;
	Wed, 10 Dec 2025 00:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326630;
	bh=TmJNhm+njmALNP3L4ljbZmBzGPihgoVSO4K2zy5v3ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R8XbRskDJulZRK8C6nooZbSqEgU+UpEp+g+eU99P+IUAB2IiXMmk4J3wDPvTZJtcx
	 uvhwRvzwaz/x5qzVLm+yMR3BrozWVHrya/vFtP/+0+Z/9agSRJJk17n2m72cvG6BZO
	 XVAkeXyf5XNLxTzi0FM91j1V9/+eFG9wqF7XOpG3e4rj3ill/PQi8tMHUIEkNqFMy0
	 rEh2nW6TDLoZKVckOm+kneWHOUDKIf43rXZQjL/39xaTmQpSuMYiOnJvmBjc14eSGc
	 C6kNZcdeyeasQIqWwEKas8/xbx7iLCJX9o8rQ6sNum+qqSOZzCoxAEi1Ct3w6HQ2P3
	 cgDSi9tEXL3kw==
Date: Wed, 10 Dec 2025 00:30:28 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH] crypto: arm64/ghash - Fix incorrect output from
 ghash-neon
Message-ID: <20251210003028.GA1783653@google.com>
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com>
 <20251209223417.112294-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209223417.112294-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_163031_735947_AF1DA043 
X-CRM114-Status: GOOD (  14.59  )
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

On Tue, Dec 09, 2025 at 02:34:17PM -0800, Eric Biggers wrote:
> Commit 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block
> handling") made ghash_finup() pass the wrong buffer to
> ghash_do_simd_update().  As a result, ghash-neon now produces incorrect
> outputs when the message length isn't divisible by 16 bytes.  Fix this.
> 
> (I didn't notice this earlier because this code is reached only on CPUs
> that support NEON but not PMULL.  I haven't yet found a way to get
> qemu-system-aarch64 to emulate that configuration.)
> 
> Fixes: 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block handling")
> Cc: stable@vger.kernel.org
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/linux-crypto/DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com/
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> If it's okay, I'd like to just take this via libcrypto-fixes.
> 
>  arch/arm64/crypto/ghash-ce-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

(As always, additional reviews/acks still appreciated!)

- Eric

