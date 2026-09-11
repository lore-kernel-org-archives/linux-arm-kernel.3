Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DA2C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAzqMJyfWffnd0KP5f4SwAp8Y5vWAr+5IodcQ5y1LnQ=; b=CwxpEbynlqX0cvLiY1LAxpCpP5
	pIUWIkLMORhR1Bu0mcGZx4AV4jly2sByMGp2poT0nUtOpVbrU8uFG6kQwa7F1FE6E/naN7jnELwIi
	RcazykZX6EKoeaFeM3ClwPfsVFkoUKPXYvcgE1dzlflBFFloeaJtOhhdpKHmdjOrKyLDoNujPfwML
	dsyQ2nAAx59zzRHO/87+b9KO126uzG8JCRU0CCzG0aeIG2bWkle3//jxe/r+vwdM8oNB+8DjKJf0z
	SxZDA9JKRfM0h7kvhsLMWlTchhN5UZAxfKQza/Xnh9jFaP4XaeJtBRAsWPb7Yf+UQOgz+tWpR+b+l
	PAW+6NaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tqY-0000000FsUf-2tyk;
	Fri, 11 Sep 2026 05:30:46 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tqO-0000000FsRp-2BMK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=RAzqMJyfWffnd0KP5f4SwAp8Y5vWAr+5IodcQ5y1LnQ=; 
	b=Mov11AJSwbzm2/RpeywMES4De1nrUJ3gQs7Wfr4CFwCghSsX11X9Y+RnhlQovOcqKM79OGXAOCf
	Euuk3ehdm5ZLP1czSgWRQVtIE6jT0ajK2faPwObgYex3/2pvNqYaDy5ODa893Lk3UDY75lDvdqbTd
	trjs5swrmslxrlVghRcJesnpJPpb5efR7EverX25vvm7g7/VR8wSKoobUZAntCr3/N+y//zLfSK1d
	qbOJRCkWZw9qqJIr6mJh15N7SuI80TX4ZR3ePJmmhbHGOAieH5RlfCk4wPFPElRof4uup5FvqLTTa
	M2Y8Dtz+WPWIHnxud0D5vF+QRRQd/gW0quQw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4tqH-0000000CuAu-0mpt;
	Fri, 11 Sep 2026 13:30:30 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 15:30:29 +1000
Date: Fri, 11 Sep 2026 15:30:29 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-aes - fix AADLENR for standalone GHASH
Message-ID: <aqOR9dg-KzA-U2QP@gondor.apana.org.au>
References: <20260829042604.82719-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829042604.82719-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_223036_584381_5DF31616 
X-CRM114-Status: GOOD (  16.31  )
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

On Sat, Aug 29, 2026 at 06:26:04AM +0200, Karl Mehltretter wrote:
> atmel_aes_gcm_ghash_init() writes dd->total, the request's text length,
> to AES_AADLENR.  But the GHASH it runs hashes the dd->datalen bytes passed
> in: the 16-byte length block, or the padded IV when the IV is not 96 bits.
> The data sheet requires AES_AADLENR to hold the length of that input.
> 
> With empty plaintext and empty AAD, dd->total is 0 and the tag comes out
> wrong.  Later requests only pass because dd->total still holds the
> previous request's length.
> 
> This is testmgr's first gcm(aes) vector, so CONFIG_CRYPTO_SELFTESTS=y
> fails at boot:
> 
>   alg: aead: atmel-gcm-aes encryption test failed (wrong result) on test
>   vector 0, cfg="in-place (one sglist)"
> 
> Without selftests the broken atmel-gcm-aes is preferred at priority 300.
> Seen on a SAM9X75 Curiosity with 6.18 and current mainline.
> 
> Write dd->datalen instead.
> 
> Fixes: d4419548dba9 ("crypto: atmel-aes - add support to GCM mode")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/crypto/atmel-aes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

