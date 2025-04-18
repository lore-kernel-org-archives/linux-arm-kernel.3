Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20EAC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5FIE5cHQYuMr1+LHfbtaiLujfedpAMdrckiF6Jw7wE=; b=x3CDlzsw1j5UpHtyzAF2hQ4lUG
	s15NLjxFPML1ngST1p+KqMbvQQrfim9XaYUWbW/061XvEuC2t2M63ZUzUPV8CQjeRpLCpqGqNGRdv
	Tif2grCm6JtbrrjU10A/3mR0APXOcXvGc6fofcJwRak8m2FfWwG6sC2lJSHdyDou4IWvmJ6fL9xgI
	a7ODqJAfs/6QRPCFOh6reHM73TYFPYXCwgFUq9AIu+g97CpqCbaEFzIhaPbzgapYBQdCncY/oLher
	aeeYTvEEhI+ib1BiUU/dCY/vaCexfnDVZWPpc7p2rHgryLTd4IBaOkyhEou0yKUOg/lEV67IXKv7+
	rVVWnpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ccQ-0000000F0Jr-2ffH;
	Fri, 18 Apr 2025 03:42:22 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cZ1-0000000EzlK-2vb2;
	Fri, 18 Apr 2025 03:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=B5FIE5cHQYuMr1+LHfbtaiLujfedpAMdrckiF6Jw7wE=; b=Sw/SPaiIwN2XkEd3xx63jQvQU8
	6GooV8x5tQUoq0lZci9EL+Z/URNL5NnWrKhvkqhVIkw/wqqBHP0/AcSjEFSPQ08OCbpdQEziW4WA1
	BjhVGq+q4PPss7KWlPRXKYTEX7bm8DfxuHlxraHZYmYNuv0dCNhAsAPT6Kl1rqkEhAWv1Dg+1HRTK
	VrGJtSoHwAef6a+FxsIYM42MFza4Tcqt3RNsgJYu+qCX0A3O1uCxjhZ7cQLllWj6ZiWPQerfPZHPk
	ZzmdOqQcktgF3XJAIgaS7LwiTpMmJyNHj8iMjo5PylXrBp3FZ7Qk+tnZJ9BoNz2srhcV4TEiX1GCE
	b//mLDQQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cYw-00Geir-1h;
	Fri, 18 Apr 2025 11:38:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:38:46 +0800
Date: Fri, 18 Apr 2025 11:38:46 +0800
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
Message-ID: <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418033236.GB38960@quark.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_203851_732132_2B18F0F9 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, Apr 17, 2025 at 08:32:36PM -0700, Eric Biggers wrote:
>
> I don't think that would be better.  The 'if' would be up to 400 lines long, and
> it would be easy for people to miss the context when editing the file.

We should separate the symbols for Crypto API options and the library
options.  If you're worried about people missing the if statement,
how about splitting the file into two? One for Crypto API symbols
and one for the library symbols.

In fact we could move the library files into a different directory,
e.g., arch/x86/crypto/lib or arch/x86/lib/crypto.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

