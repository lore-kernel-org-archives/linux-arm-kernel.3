Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 04:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9EXkjrp0W9SWrd3TKQSTVrYxj7+y+riyDawKW9WulU=; b=jUsX5hRlQyRuy6ljLU8Pl2WGFi
	pa/5dGbr6glXvtY9Kwsza3NL4LY20MLVwKZZmB66Mzg46F2pUcQ14QxhznAAZ+XqpdSeMgra6rSG4
	gImcQ6OqvzVzOo0yP6OHw3kbNE0NdEEu0TSK+3a1GjesDZKC5UfOPAQ4UJbhDZyEM0M+/sfO9kZYg
	OqPUJQlrmO4dtoN7MXkYANFKZMQJj3agR0bbxSC+V4ZmQmjj1w8An0JHATSGQ0kDk1qa+AxvesBPK
	Ltd+wuqIV8RiTwP854u4VfhDwrCnlXPU/I6uht4zcgwYZfhBqeQORfVebBnn0uiV2JXhEEFLzOE07
	iq6Qq2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR146-00000003Je8-1Bbh;
	Mon, 16 Jun 2025 04:03:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR11a-00000003J5P-3V2t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 04:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 300C65C42BE;
	Mon, 16 Jun 2025 03:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFA7C4CEEA;
	Mon, 16 Jun 2025 04:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750046445;
	bh=DNjwjD8hhxbYC5MpkZvfw4zJE0EdrDcAW1zA+Ae08dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJ1peQkDLOiv4Y+i8Uj6JDkRJBClMNSdzYWuoRgA7dIVv+UAlVomCsCTtYUBZtyva
	 4MNPrL/3n8vaoFc5U8hEBPhOQb4sUKuGKtLVUqI4VgD1TblmpuTE/AEQn+B93J0kzO
	 kfbw39TmzO/6Xl+JgG+CnP0OXYwDCBKI4r/f7WmyGchHF4WIB47S46tzh6gPrBr6Ji
	 mifNCMklUd5rQniJfvFb8wCXYq0one4WJKHd3w7peLeZ98ULoBpl1ZNfm64PjbtHiy
	 9HeUVguZMLVXO55sKzo0n7kQOBiMy3YdWE+JQm0T2Z5BdcTAqVuX+7hgpiO8w3OeeT
	 wBJfc/6yd39Ng==
Date: Sun, 15 Jun 2025 21:00:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Jason@zx2c4.com,
	ardb@kernel.org, kent.overstreet@linux.dev
Subject: Re: [PATCH] lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch()
Message-ID: <20250616040016.GA749462@sol>
References: <20250616010654.367302-1-ebiggers@kernel.org>
 <aE-PDfmowagPegen@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE-PDfmowagPegen@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_210046_999657_74A4EBC1 
X-CRM114-Status: GOOD (  20.98  )
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

On Mon, Jun 16, 2025 at 11:27:09AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > For some reason arm64's Poly1305 code got changed to ignore the padbit
> > argument.  As a result, the output is incorrect when the message length
> > is not a multiple of 16 (which is not reached with the standard
> > ChaCha20Poly1305, but bcachefs could reach this).  Fix this.
> 
> Sorry, it was a cut-n-paste error since I copy the code from
> the update function where the padbit is always 1.
> 
> > diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
> > index 6a661cf048213..c9a74766785bd 100644
> > --- a/arch/arm64/lib/crypto/poly1305-glue.c
> > +++ b/arch/arm64/lib/crypto/poly1305-glue.c
> > @@ -36,18 +36,18 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
> >        if (static_branch_likely(&have_neon)) {
> >                do {
> >                        unsigned int todo = min_t(unsigned int, len, SZ_4K);
> > 
> >                        kernel_neon_begin();
> > -                       poly1305_blocks_neon(state, src, todo, 1);
> > +                       poly1305_blocks_neon(state, src, todo, padbit);
> 
> This would do the wrong thing if someone ever tried to pad a
> message more than 4K and called the block function with padbit == 0.
> Fortunately it can't happen today as there is no digest interface
> to poly1305.

The final partial block is (and needs to be) processed with its own call to
poly1305_blocks().

> Looking around it seems that this pattern is replicated across
> all of our poly1305 implementations so it isn't a big deal.
> 
> I presume you will be picking this up via the lib/crypto tree?

Yes.

- Eric

