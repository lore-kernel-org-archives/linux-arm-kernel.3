Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54722C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gz+GUsAUy8ZmZMfWIFNxOOMGCIQ1fx8CdVDZ+HKxXIM=; b=BmXiXgWDlBEU+Pgx455eVvZX8x
	7ifmB9VlLMqu5yi6bwn7wfMCqIpu7Zhqi/KadVc4DPH7UZkwse5rY4tgn5eVqkjxpR2vTaddUSlMr
	jjBPGI0BE4MAI0C8ISuz/sOpE+au8IFjtnF6Y1T7n1XrSIiaX1yePr4Qgjy12DiHfYD1nRC9UMYph
	md/SXVYnr0amJr0y8agOufaO3JoLfi+D0JheYoqx7hywOn2ZKfPKuftCWLYv/oI0xPEIJH4/Vtoul
	dIh8JUrH6psmzW8oTJhG1J7tdfQRhzw9shqne5Gx6fT4l2tCS2VURHjtO0b6S+wOa/nBSMPZyzc4T
	tcXAEBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQybY-000000033yl-16SR;
	Mon, 16 Jun 2025 01:25:44 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyZK-000000033ts-2NcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:23:28 +0000
Date: Sun, 15 Jun 2025 21:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750036995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gz+GUsAUy8ZmZMfWIFNxOOMGCIQ1fx8CdVDZ+HKxXIM=;
	b=TJHnasiAJbvnyH8es6MgCm2OMRASqzF9CUJ8HgIT1sEjp6rYfaL338ev5rAG2E2HziQ3YI
	z9Sl5aZUi/vXZ48WAWehXNg4Mfe2Vm7OJyKbq6YL4Xa2ngWpgyLURJ10WWVmnpjBOEBojR
	J2ERRChEzKb2iW9sm8AGiNFKnlEiOHo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, "Jason A . Donenfeld " <Jason@zx2c4.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch()
Message-ID: <zjzuypgma6p5dme5dh4iyh6a3km6qhsydelubdf2jvbsykyywf@4incsw36xqxh>
References: <20250616010654.367302-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010654.367302-1-ebiggers@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_182327_386035_A141434F 
X-CRM114-Status: GOOD (  18.04  )
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

On Sun, Jun 15, 2025 at 06:06:54PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> For some reason arm64's Poly1305 code got changed to ignore the padbit
> argument.  As a result, the output is incorrect when the message length
> is not a multiple of 16 (which is not reached with the standard
> ChaCha20Poly1305, but bcachefs could reach this).  Fix this.
> 
> Fixes: a59e5468a921 ("crypto: arm64/poly1305 - Add block-only interface")
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Thanks for the quick fix :)

Tested-by: Kent Overstreet <kent.overstreet@linux.dev>

> ---
>  arch/arm64/lib/crypto/poly1305-glue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
> index 6a661cf048213..c9a74766785bd 100644
> --- a/arch/arm64/lib/crypto/poly1305-glue.c
> +++ b/arch/arm64/lib/crypto/poly1305-glue.c
> @@ -36,18 +36,18 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  	if (static_branch_likely(&have_neon)) {
>  		do {
>  			unsigned int todo = min_t(unsigned int, len, SZ_4K);
>  
>  			kernel_neon_begin();
> -			poly1305_blocks_neon(state, src, todo, 1);
> +			poly1305_blocks_neon(state, src, todo, padbit);
>  			kernel_neon_end();
>  
>  			len -= todo;
>  			src += todo;
>  		} while (len);
>  	} else
> -		poly1305_blocks(state, src, len, 1);
> +		poly1305_blocks(state, src, len, padbit);
>  }
>  EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
>  
>  bool poly1305_is_arch_optimized(void)
>  {
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.49.0
> 

