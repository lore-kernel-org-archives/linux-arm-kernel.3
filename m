Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8D5C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 02:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4QjAmh83yMZNLzUuAj1J5f4WZGw3kbBWCArSRYks8c=; b=AskaqCw4/b0F7WdjESPwp7zjD8
	DJm/ZvzoBJlHQBa0W/rPrup56LiuxGs/l3chw2UXuI22EKt3TNk/hRaK5XH4PUgk0ZjV5BV6IAz7Z
	OKZG2SiCdDF+4SMLfVg2iA9QHdlKoCJKjI9ei20/MRtR+6EpyiYMT0TVZ2DjxKldwbKPIKF3UFDPg
	jKjDQMNBTIhiVwkB6P7Wq9vYBRO3KS+SDAmOn+bGzQACGM9B4Jgz/AGsmboXbrzgLvpz7OFhIyLnk
	V++xLAN+LhrdcCzQG4Cm+BXmp1qXh2ldEVDAmNuYcS5gg2U2YatU/aqTqngsFXo4BS+TPW1GPavCl
	VcOBFeag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xCP-0000000BW9F-22nT;
	Wed, 30 Apr 2025 02:29:25 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xAV-0000000BVx7-2BuY;
	Wed, 30 Apr 2025 02:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=k4QjAmh83yMZNLzUuAj1J5f4WZGw3kbBWCArSRYks8c=; b=Vieyc26VLhqz4zWnYRj3rYoyQj
	H0zpuIjmCDGV04Csn9F7DAzFr4VMNjSPrC0ttYmpV9ePC4GcLW04Gh2LQ1DfIxlqp8R2aL3ipQgqS
	Hoxj4/7XIQ9SP8MYTw9J6YxFRkgAmoixnyakr025Cu5UwmrQd+FkzC7jHq9Sv7Lbup88SHAX/kJOO
	gCZMT32Dh2FRvOwZvUtHvMWVDl4ZzRtgK+7mmLDbkUAE5fgD6/s5zMPyYWMNXS2Dyy648liRupOcp
	RncktiF2kCxxXhDi4UksWk66YNHf90reaqkRJHJIrq0moVeglYppY4Tl1LsVfkb0I0T9xlkGgF+Dz
	KZjeX6Og==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9xAJ-0028rg-2e;
	Wed, 30 Apr 2025 10:27:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 30 Apr 2025 10:27:15 +0800
Date: Wed, 30 Apr 2025 10:27:15 +0800
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
Message-ID: <aBGKg5bq0zLkhy3-@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
 <20250429165749.GC1743@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429165749.GC1743@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_192727_559688_5E126435 
X-CRM114-Status: GOOD (  15.00  )
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

On Tue, Apr 29, 2025 at 09:57:49AM -0700, Eric Biggers wrote:
>
> To be clear, the objections I have on your v2 patchset still hold.  Your
> unsolicited changes to my patches add unnecessary complexity and redundancy,
> make the crypto_shash API even harder to use correctly, and also break the build
> for several architectures.  If you're going to again use your maintainer
> privileges to push these out anyway over my objections, I'd appreciate it if you
> at least made your dubious changes as incremental patches using your own
> authorship so that they can be properly reviewed/blamed.

Well the main problem is that your patch introduces a regression
in the shash sha256 code by making its export format differ from
other shash sha256 implementations (e.g., padlock-sha).

So your first patch cannot stand as is.  What I could do is split up
the first patch so that the lib/crypto sha stuff goes in by itself
followed by a separate patch replacing the crypto/sha256 code.

> Please also note that I've sent a v4 which fixes the one real issue that my v1
> patchset had: https://lore.kernel.org/r/20250428170040.423825-1-ebiggers@kernel.org

Yes I've seen it but it still has the same issue of changing the
shash sha256 export format.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

