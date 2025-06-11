Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A79C71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 04:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkg7qi5JwCUTytdTfYAgM1lz/bXjif9Ie46lsyx0iEk=; b=saznTrlfTxwJNTfY4ZijztPevn
	UsL7Y1Z/LLYdcdkMb1gQWLGV9lJJ+l+NHjltrBJ+z+kpfp6dQXbQS8Zzw9n1QBo3ZVj6Rj4YcW8QA
	RehxwcKfgY+e7SyPDfar8dUFaA+PJReCXc/iwGb4JeKFPbAnyjv7OVeJ1RTBwDCJkSVq6nljUPk/t
	tWnk8HREAlrt3seWi4VbtyVKW2nQbAHawk5/w79YphfCbl5Rquysevu7tPiE5sMSZOSq1GcZr72I/
	mUSgS96OLYGs89cD2aMzr3OVD6xPQBXA5FRb95kA1LdJ9Zt4imaPC8WFOh2hxgXp4cS1Fm35RpPkA
	640qCskQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCfX-00000008nrI-0zph;
	Wed, 11 Jun 2025 04:02:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCcI-00000008nK6-1VHR;
	Wed, 11 Jun 2025 03:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A193544D84;
	Wed, 11 Jun 2025 03:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A1EC4CEEE;
	Wed, 11 Jun 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749614346;
	bh=szt+yu2QyA/QhUjatSBOr43sMK30sECLXWC5HWNvAj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCI/NgO6t82+0dt4rZ58DB+IkwRvjcNZ8pj5AEN6fKZSLEVlNEcF2b+DBphS2gu8/
	 soA6FLw7oMdHnpjUO+8dOJvlRr1p33bXZWdRSPljd2QvQe3FkrsUr+3IlRuy+lY705
	 8OIZGNq6+RStoCDw3miB+z/Emh3WsYmaW7T5NQTVBV/iG//6cY5agrJleSTHWSbuGH
	 eFd8ehhhWiUy0B2yIimmqk8TwvGDygZZ14r7jQYOb7GPEXoSNehfYGl1FkahLvK4x5
	 IGbF4jVwt+BqNJ8PquUrLFiUbiNyU8mcnJGot5yfNv+gOb2msM+oiMu2P4k9vYt2YW
	 nReNvxvHkbt1w==
Date: Tue, 10 Jun 2025 20:58:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250611035842.GB1484147@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_205910_418631_139B7D50 
X-CRM114-Status: GOOD (  23.75  )
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

On Wed, Jun 11, 2025 at 11:46:47AM +0800, Herbert Xu wrote:
> On Tue, Jun 10, 2025 at 08:39:57PM -0700, Eric Biggers wrote:
> >
> > Do you have a concrete example (meaning, a specific driver) where this actually
> > matters?  Historically, export and import have always had to be paired for the
> > same transformation object, i.e. import was called only with the output of
> > export.  There is, and has never been, any test that tests otherwise.  This
> > seems like a brand new "requirement" that you've made up unnecessarily.
> 
> It's not just drivers that may be using fallbacks, the ahash API
> code itself now relies on this to provide fallbacks for cases that
> drivers can't handle, such as linear addresses.
> 
> I did add the testing for it, which revealed a few problems with
> s390 so it was reverted for 6.16.  But I will be adding it back
> after the s390 issues have been resolved.

Okay, so it sounds like in practice this is specific to ahash_do_req_chain()
which you recently added.  I'm not sure what it's meant to be doing.

> > I'll add export and import functions if you insist, but it seems pointless.
> >
> > Could you at least provide proper definitions for the legacy structs so that I
> > don't have to do pointer arithmetic to generate them?
> 
> Just expose the sha512 block functions and use them as is.  There
> is no need to do the export/import dance.

We're not going to support direct access to the SHA-512 compression function as
part of the library API.  It's just unnecessary and error-prone.  crypto/ will
just use the same well-documented and well-tested public API as everyone else.

- Eric

