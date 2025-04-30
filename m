Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FC1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+daFW9TiG3MY86ROFX8OX7W5wH95uIZXeb14ntCkmg=; b=4CbBdq0+eGxiCvvbhdVMeEIOmT
	IFOqI6fFVkbRLoq7+clIh7Jc0GM4UvWK1jKHHULYdJ+9BvqnHsM3Rb+1+q9l8Ier81m+JTsMOd1Hv
	aOyJz9JImkx6DasaooRKr5P2LxwGJwhJ4sU73TwbD9wGO/4PyAtKjQJDY9ySualAQ8P0BHsaf7s5a
	QowYL2fnhkgq5t4OOG3ZSXjXeyeBOXDCpokGyEAKUcl6pMoVA/yADakMXdFRpEveksfrnPUsoMxdO
	j3Pl8fAJOufjRlkdyhJwDCpH6RpKu8wPRjTVijdkJMSNZBzRc6QbaqveuEURalYQjLVmOJmvqzA7E
	9Kkd1iOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xPd-0000000BXAV-2GCH;
	Wed, 30 Apr 2025 02:43:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xLY-0000000BWjs-2v0r;
	Wed, 30 Apr 2025 02:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60BA368462;
	Wed, 30 Apr 2025 02:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05435C4CEE3;
	Wed, 30 Apr 2025 02:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745980731;
	bh=TxucFTFDsaAfXHIM/UmDu7tlSHNslTip/1/i68IYLNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKbKJ7nIpStk8OVO+UghSaA/PHyCumrXyBYGMhec+zz6zGnR725ui8YU/d2He5FZH
	 l3ZysS7wQNq2XykORQq3s6X96GzzDVMLzqg6xRB5oJgw8D/zjnr70FZaqFzpxo/ux6
	 slCd0ewtZDB+TImi79ATUnbFJj1sgEXGWWW0acjg+O3tQjOUW+BcbpUUPzocAdj7Wk
	 bf3XVBXfA5+WHNpc7JRkd7HigULuV18BqxGLAsXHYHc0FuMwOxf5OyajzjpK9zNSxR
	 ZbplbfUya7mHSj39ujX+ycEmi0q7WWaUSaSesTjTADwli278a+F9qyBiH7pdqlnuWf
	 klgtVgYRokWjQ==
Date: Tue, 29 Apr 2025 19:38:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v3 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250430023849.GA275186@sol.localdomain>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
 <20250429165749.GC1743@sol.localdomain>
 <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
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

On Wed, Apr 30, 2025 at 10:27:15AM +0800, Herbert Xu wrote:
> On Tue, Apr 29, 2025 at 09:57:49AM -0700, Eric Biggers wrote:
> >
> > To be clear, the objections I have on your v2 patchset still hold.  Your
> > unsolicited changes to my patches add unnecessary complexity and redundancy,
> > make the crypto_shash API even harder to use correctly, and also break the build
> > for several architectures.  If you're going to again use your maintainer
> > privileges to push these out anyway over my objections, I'd appreciate it if you
> > at least made your dubious changes as incremental patches using your own
> > authorship so that they can be properly reviewed/blamed.
> 
> Well the main problem is that your patch introduces a regression
> in the shash sha256 code by making its export format differ from
> other shash sha256 implementations (e.g., padlock-sha).
> 
> So your first patch cannot stand as is.  What I could do is split up
> the first patch so that the lib/crypto sha stuff goes in by itself
> followed by a separate patch replacing the crypto/sha256 code.
> 
> > Please also note that I've sent a v4 which fixes the one real issue that my v1
> > patchset had: https://lore.kernel.org/r/20250428170040.423825-1-ebiggers@kernel.org
> 
> Yes I've seen it but it still has the same issue of changing the
> shash sha256 export format.

Nothing requires that the export formats be consistent, but also the fact that
padlock-sha uses a weird format in the first place is an artificial problem that
you introduced just a couple weeks ago.  And even if we *must* use the same
format as padlock-sha, that can be done by using your crypto_sha256_export_lib
and crypto_sha256_import_lib, without all your other changes.

- Eric

