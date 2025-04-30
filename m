Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A08AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 02:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9QkBZZevuauHxVFsy3Xp8pLr99dnXjzdN0XHxuFEuE=; b=WuxzeZgTlxbORjt2q6b4iGqp0I
	/NoBy4phyiMAFIFb5xEv4owgzH3tiTwXu1j1JYSOazHlSq7T7RbpJFE0DGFrPNO4C+UUBBvBfBj+Y
	e6/zf+eTxE5cx/ZmMG1LEcAwkqI0PpQRDb6cIDtcOy4QaXFIFVx/F+hxemAcEMdqubvaRUqGx++Gx
	G9K5wTXfYpT+CNINBl6a89WADd1nCLU0M/Ug9ougOoK7Uf3OoFp2FtbinEauISy1r/II79DjCyT2d
	l4GAf+oCkTgGbYc2OEkhQIWJVTjIsFkDVi5a1vIiDRwqbRIMeUfoYj/TRAimJLHd1ZBTLzsk8ppoN
	ejwhI4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xTc-0000000BXwF-0gy8;
	Wed, 30 Apr 2025 02:47:12 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xQY-0000000BXJc-1LDh;
	Wed, 30 Apr 2025 02:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=m9QkBZZevuauHxVFsy3Xp8pLr99dnXjzdN0XHxuFEuE=; b=slhfLJxHOtOfQ65Qhl8JSbPCcb
	XqkmyPT58SSpWJ7pD9KS7SxPajdJZ4dHGDlXKtXsR8gTS6XQAFgAP6ZYpFU3rKnoW0/9byyYAwJ/R
	GD8f4Zg1TqF0P+e9AlHd9q6ggqDu+W9ZGp/7BGKVyH2/DYezWwEWFFHvPjZcG89v4s+4o/5l4DTdz
	uzFd2vqfrtvbZbuCXjHrgZ39HSV2EJU71upABqo3N09RZ1o6SSudTUB2KoCSfytn0eM8ufQZC7TW2
	SvSbDJ9gOEk9vkgraa8eIcRuXVysE5xkBgpzhM8QKW8NjaqdOEP80zLQHXmMTMUbtTJecf2EHL+D6
	4WxmKkyA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9xQU-0028z1-2i;
	Wed, 30 Apr 2025 10:43:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 30 Apr 2025 10:43:58 +0800
Date: Wed, 30 Apr 2025 10:43:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v3 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <aBGObifCORhrBXz1@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
 <20250429165749.GC1743@sol.localdomain>
 <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
 <20250430023849.GA275186@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430023849.GA275186@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_194402_356233_0735B6D4 
X-CRM114-Status: GOOD (  11.17  )
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

On Tue, Apr 29, 2025 at 07:38:49PM -0700, Eric Biggers wrote:
>
> Nothing requires that the export formats be consistent, but also the fact that
> padlock-sha uses a weird format in the first place is an artificial problem that
> you introduced just a couple weeks ago.  And even if we *must* use the same
> format as padlock-sha, that can be done by using your crypto_sha256_export_lib
> and crypto_sha256_import_lib, without all your other changes.

That was just the reason of why I can't take your first patch as
is and then add my changes as incremental patches.

I do still want to bypass the partial block handling in lib/crypto.

But alright I will do it like this:

Patch 1 is just your existing patch + my export/import functions.

Then I will add the rest of my changes as incremental patches.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

