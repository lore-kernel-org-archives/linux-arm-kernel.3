Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9DAC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 03:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qq3IJ8JynJU7O/u61XzBFurm3qauuCX8QJaB8lmSmMc=; b=jNTovjAhqzhr2k
	Vc3MPmoB+9Ou2wXQQTYclbBdkg8P/o54dQfNmfGRvvesd6wP5Scn2/n3rKQxdiY5ZxacnuMoMkJ1k
	2F5UQcwOrSXyGALSpjbklhlGH1N4x5YKuOg4at393O78MuHWmb/KhEUBOGsvq9iRpT4Ll3gkZP8Zq
	JJ+0W1gGNS5NHsuFXF8JTb6eG5JorZ9TFKCVyWgkZluGmVKPOHvBtwJkxeipiEMUwg2BctsxJkBH/
	GjGTKBi7XjND7tua/s1BM4q8hyppUZWw3kvqSpcR6cGaydbCCTQsoKS2ktkAf1jjpW7g1mEW4cLer
	2hCYm7gfnL1j1hPlsG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5cBV-0000000Exa7-38V6;
	Fri, 18 Apr 2025 03:14:33 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5c9e-0000000ExLo-1PIo;
	Fri, 18 Apr 2025 03:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qq3IJ8JynJU7O/u61XzBFurm3qauuCX8QJaB8lmSmMc=; b=lB9E6cNuSpcyi+wIu4AqMWeil0
	alzcTCb8M0sQjC3ocdCcpRZ7ehcuXZCrNwyx1ktrooWWCIj9iFB6ayBnatRwq92K37AmhyCcFpXLM
	OR9e6IryCcw4t9lLbx+iOgIT/J6/Nf7SPfzVxH+nsHHDbyUlxK9gArH9xK0tEh68vW8tpZqshwV60
	srqfoeG+JXGqwaRw7MJ5peD3FZ4dVqaCTIk4WCfXtFicKq71IJL7/pd35ZfY6eJZdKDcfGOtNV+RZ
	uMoaQcAjSWR5DbCKLE+VpsD4RlHlZGjqodehTXvdjY2oZGusKWENmpVPPhYzvxILIptYXb2DLX0SE
	9vbdVKHg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5c9Z-00GeXp-1B;
	Fri, 18 Apr 2025 11:12:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:12:33 +0800
Date: Fri, 18 Apr 2025 11:12:33 +0800
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
Message-ID: <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417182623.67808-2-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_201238_370626_136780FE 
X-CRM114-Status: UNSURE (   5.66  )
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
> config CRYPTO_CURVE25519_NEON
>        tristate
> -       depends on KERNEL_MODE_NEON
> +       depends on CRYPTO && KERNEL_MODE_NEON

Rather than adding CRYPTO to each symbol, how about grouping all
the CRYPTO symbols together under one if statement?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

