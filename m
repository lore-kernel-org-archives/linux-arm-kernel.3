Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82BFC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 02:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WZVREpLjDbDWGkNX0co8NLJSuDCKSkP1OqgirQElB6U=; b=KHZogIOB9jAAHn
	G0l3pusYK/K8lUc32F9a5ngokKroN0PyRIKWIMtBwiLCnd57EyndY1SuPvBBft4zbe2l6YmGLPTdd
	vTvY+CC/TI0L3vDpwJh/NUMUT9bEMe0XfxEcTHtCURtcTMNC5mFhOFX7RneHIYoFrwGFlK1VQDHcH
	mlULryvG4gRacjZlHk196T5+n3PIRz+aZ2dOOoC61RQA+Ek2z+P7onmG8xOomQ8WcLRX2YXxOKDDk
	ioca9dhF4G0MQudGZHpUZIpTnrMTzyp0yZ8Vn54tXU6PFkUkjNd4cE0YwAw6fhfkgSOr8qRq8sajs
	NItUk3Q0PlTaY5NSWXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBZr-00000008gq5-2omz;
	Wed, 11 Jun 2025 02:52:35 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPB8y-00000008eN7-1m3g;
	Wed, 11 Jun 2025 02:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WZVREpLjDbDWGkNX0co8NLJSuDCKSkP1OqgirQElB6U=; b=TMQWHPrTX3Fx+ENfQm6BAshHcE
	a9cvrMqulk98YyB590WJKrLkMlmaLaieZYlrFtoqASdEJn2XmNVMB+API98+sbhBEXqPTV5mhL7eJ
	QSb7cT3mQgJJ6Rm5ou9iCOzEceGw5lA/FE4hfXkAqxKRg09dWM3ZvHjh5I0x4UMST1LsaYrEh8O0K
	zH3diIcMUpZ6KCkjdHIIZBkGu1IXM87/5M/SjvpXedbtvdxQsV0iIMcvUDlyI6M74N1SR3ZRivvK7
	ZDbR5Ylq9hWF/4VSmBf3oQo8DuKzfQT+dXB/1hYY/oKiJHU/jXPioKY8GDnouEukzMujBuSdMB/0k
	Tja+Xzkw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPB8r-00CEkN-06;
	Wed, 11 Jun 2025 10:24:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 11 Jun 2025 10:24:41 +0800
Date: Wed, 11 Jun 2025 10:24:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611020923.1482701-8-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_192448_460935_F225A5CE 
X-CRM114-Status: UNSURE (   6.02  )
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

Eric Biggers <ebiggers@kernel.org> wrote:
>
> +       {
> +               .base.cra_name          = "sha512",
> +               .base.cra_driver_name   = "sha512-lib",
> +               .base.cra_priority      = 100,
> +               .base.cra_blocksize     = SHA512_BLOCK_SIZE,
> +               .base.cra_module        = THIS_MODULE,
> +               .digestsize             = SHA512_DIGEST_SIZE,
> +               .init                   = crypto_sha512_init,
> +               .update                 = crypto_sha512_update,
> +               .final                  = crypto_sha512_final,
> +               .digest                 = crypto_sha512_digest,
> +               .descsize               = sizeof(struct sha512_ctx),
> +       },

This changes the export format which breaks fallback support
for ahash drivers.

You need to retain the existing export format.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

