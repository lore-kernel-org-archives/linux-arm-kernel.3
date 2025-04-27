Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7552FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 01:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z6B1Bd4xVYC2gvLvE/46soerbfzyW1n205UZ9uRG/8=; b=UP+wuWQFI8/RzmS0yMKAV9rW6S
	MPVONtUSrsPbHI1TCVvWnKxcW9ZtccfaBTbUubgGusT5wgLNuecUkFN4OmI77Lg/OpUxu3/A8Jrw6
	74xwaEBXHOhTGCRvrnGgesCRqB5j8G4gIhhI7loS4fsByFyuEF5hboJvtSOUDHzCh3GbMWX+DndeB
	wpkt4L9LqYwuCU37AjNva16rJ9un/t8JWe19Z2YMgO7Nbb0q1HmXvRj6lAYMSgLeztFaP6zyw817a
	+j0C3GDM9msm1ux92hxS7s1UoczSX2hCS01eV3FgBnD1UdYhlPEctcAbBVf+FaIfhLYFnODlaNn3D
	1eK8mbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qbC-00000002i7d-2jBc;
	Sun, 27 Apr 2025 01:14:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qZG-00000002hva-2hw9;
	Sun, 27 Apr 2025 01:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00639A400AD;
	Sun, 27 Apr 2025 01:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15DFC4CEE2;
	Sun, 27 Apr 2025 01:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745716345;
	bh=XtR2f2thGcnDYbhl0pb+41JAmRYzjJrz7p093kCXmZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGr63U24Gm8hRXTQSMA4lzYe51LBc4e4LKosvkah6KUyAMJnYCNTl7qlYhU9meJPQ
	 JXkGSHgyHAyGkABiWTxETPK9T9HG/YCslPrpz1C2Rd8U2nORRVXbC4q/iDWve+GK82
	 tKfCzgcrJ9AoZEh29PMKmsJJndXIegAqGM6CXLVC0Jh29/H7Y2m/d6O+p5ZDEL/K1B
	 BsxWASsxCYPCjwizywmWlK+UzpRcqKy6xOMgy1n/V4zXZhtyAWrSPPp7i+Xo/4/X0e
	 Daye4QLiZSXNkXPQd/hQ2xs+4CCmLsIfbjf9n7+azNxdTbZM9lQ7Q5y3du8vu544X9
	 Trq6TtAEEdGeA==
Date: Sat, 26 Apr 2025 18:12:28 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <20250427011228.GC68006@quark>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_181226_747549_FDB3F1E6 
X-CRM114-Status: GOOD (  10.05  )
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

On Sun, Apr 27, 2025 at 09:06:51AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > +static int crypto_sha256_update_arch(struct shash_desc *desc, const u8 *data,
> > +                                    unsigned int len)
> > +{
> > +       sha256_update(shash_desc_ctx(desc), data, len);
> > +       return 0;
> > +}
> 
> Please use the block functions directly in the shash implementation.

No, that would be silly.  I'm not doing that.  The full update including the
partial block handling is already needed in the library.  There is no need to
implement it again at the shash level.

- Eric

