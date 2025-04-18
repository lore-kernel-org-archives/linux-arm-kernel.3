Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37AEC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlkg+5jDRBY5wNNnTe1hqoMZ0WqQC2CXlXJOinsVxyU=; b=s9C/O2496VXbOZRMAx0Q6kJimy
	oFLuu5O5GRjiVk9rvePHXTtzw/Wi3348Isb8w+qWXBa2EyY9iAc/T1PaJsnmMOsjCD9BsHQaOyprE
	25JjPKU4iM+wmVi3gehc12B3zHee9YLYehtVhM2beU65/OmonMu36iwgSmk4ugPJrrJtUvtJBkX//
	T3kdzD5MymD6oMY1ScfCo+s7i3cZB5zNXT5xZd1cgD7FwaVDeF3NJf5Xfk/mMTj++ULTyGvpM1c9F
	LMXDJi6OBetnssQT5gI+cQBFStzCuKiES36RuaYq7bO1Z7wcsF33OB0PNbJUaVk6nneaMt84bTEPr
	W9YS0O1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hOw-0000000FffE-0mZc;
	Fri, 18 Apr 2025 08:48:46 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5h2j-0000000FcDg-069W;
	Fri, 18 Apr 2025 08:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hlkg+5jDRBY5wNNnTe1hqoMZ0WqQC2CXlXJOinsVxyU=; b=kpcJ1aZefOCOmEslLOYgO5//QM
	Ln6pMr5koiDKWOj7at3DmuXW/+yNTQNemE32nJCw0tUBk2lSSos3j+agdtU8LJ1QmGrITb33TVv2P
	ax7x7ihD9o/9/iRWIG6o5huDo+sjBvBM8N/+4rmITe3RGNDZD3kJRIZDt9wM6vSrDQAsM8CtmlaSX
	oieCkebA9MArb2/oiKMgpHGYdSRIx5EULaGWGCnkwKjcIqfjRnqi6KVnMh+uDMtW/pKGRh9+DYB8j
	6L7OlrJk5uGTHv5eg8RoWUkRMy9N+wd4fu7ENI0N1H5rEEfkOX/zcPw1G7vGUetKFspJKMJxaHYWr
	x44+Tchg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5h2a-00GhP1-29;
	Fri, 18 Apr 2025 16:25:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 16:25:40 +0800
Date: Fri, 18 Apr 2025 16:25:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAIMhLD3UMM41JkT@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
 <20250418040931.GD38960@quark.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418040931.GD38960@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_012549_062597_AD777AFB 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 17, 2025 at 09:09:31PM -0700, Eric Biggers wrote:
>
> arch/$ARCH/lib/crypto/ is the "right" way to do it, mirroring lib/crypto/.  I
> was just hoping to avoid a 4-deep directory.  But we can do it.

You can do that in a follow-up, assuming nothing else pops for this
series.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

