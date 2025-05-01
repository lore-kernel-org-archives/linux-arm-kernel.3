Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659ACC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 05:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t5+R7MBB1CitzsoU7qrOUojn4639+WchyM4zx0d4j4=; b=RAJSqCAYpAQ8lMoJWlVoHyki/9
	k7ANoomlWbv2jGTu2irM1UtFTyI52MzPhzD4sy4LYtl09fr1k1f9LI06seb/3+8r1fYOXRQlq+X9w
	FURL+fwaMizO/8Ib/TzrFrXPoTrhWTNWVv69i6rb5QbzS7R2ra2OGk3KZNktbn1L5jBqetsHfsPEM
	MxZtfmBH2vb3mRZQrpG3n6sQAFHROS1V8e8gM0ZcyzX5d+tWF6Od6K7a3ChSk3bxXslv909XYq+16
	zxpUM2reZ2NdP7u33o/wOGTEYCblM45VmZZXcs+DWyEJX+DGvRzmfugawd0ZjIepS5sw2DVMCBYj6
	MDib+gCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAMM8-0000000Ekxe-3XY5;
	Thu, 01 May 2025 05:21:08 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAMKB-0000000Ekjd-3MUm;
	Thu, 01 May 2025 05:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9t5+R7MBB1CitzsoU7qrOUojn4639+WchyM4zx0d4j4=; b=ORsTUm+3tDs7MqOLXniwLbTENu
	6p8Ijou3tB4FtepjWe3F1A6W8IvySh95cZdbo6AzTOgys1fAFOnLjgZl/ixeJAU3uP78oydLi8D//
	yAax6cWpNxoAHYpOezO8beaYeuGHP68V4qdyQTdAirltbeZ3K5W1HWRLRdTu1DRHvIhqGACuMLtsD
	L4/ELm9xRzxjZE9uSzRBsLPKu384XEncFgdp8RWbWcWOQIo8DOJNbz9+cCdkKdgpDc51jJ2r9y5VI
	V7Wcl+IDdkPoN5XAqV8kKx2r8DlOwoCrwVYtmf6WPYNYB7nm6jKdpr5Y35dDNgam3PekRDwUujufp
	tuz3w6FQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uAMK4-002SVz-1M;
	Thu, 01 May 2025 13:19:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 01 May 2025 13:19:00 +0800
Date: Thu, 1 May 2025 13:19:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/12] crypto: sha256 - Use partial block API
Message-ID: <aBMERARvCQsl-5iN@gondor.apana.org.au>
References: <cover.1745992998.git.herbert@gondor.apana.org.au>
 <20250430174543.GB1958@sol.localdomain>
 <aBLMi5XOQKJyJGu-@gondor.apana.org.au>
 <20250501022617.GA65059@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501022617.GA65059@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_221907_840843_236AC238 
X-CRM114-Status: UNSURE (   7.91  )
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

On Wed, Apr 30, 2025 at 07:26:17PM -0700, Eric Biggers wrote:
>
> Interesting approach -- pushing out misguided optimizations without data, then
> demanding data for them to be reverted.  It's obviously worse for
> len % 64 < 56 for the reason I gave, so this is a waste of time IMO.  But since
> you're insisting on data anyway, here are some quick benchmarks on AMD Zen 5
> (not going to bother formatting into a table):
> 
> Before your finup "optimization":

Thanks, I'll revert to the single-block version.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

