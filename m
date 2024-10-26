Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88DD10BE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iqjgwPoSadyGxLdrVj7DYmqocPwRm0P5OMZARcUhpIg=; b=pja002j608CN58
	iypUjv2OK53eE2reh/VdogS8g8rhlibqr7vexcIPo5T2Xc33+1gxtQ91ardrHt7osF9nJtTWcc38N
	ILOHotCzhLbwOVGzAr2DzrDZs5iCNQ6yEKBtqI7NFIPSChytXJA60CZH661VYTTy8TJ1z/wdNubwt
	CKD+Aou0CBgAIKZ9f699Yi6rkMEIVgex/VyrCsa9dkX6T2GhdDxibBNLOpz+s0rYIgKOw8RNWfhMI
	bLyBdMce454FY7qFby7q7N7pJe/yTMpLu3Fub+4VrFzVyB7xkirLVKkD266uQqKLu2CVeV/paIfOs
	732eCxl4gWInvaFB4K5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ard-000000065Xe-392f;
	Sat, 26 Oct 2024 07:05:33 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4aq2-000000065GD-2w9f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 07:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iqjgwPoSadyGxLdrVj7DYmqocPwRm0P5OMZARcUhpIg=; b=YboSmBu1TFEJbpaBgR8TCTVnhS
	P6jGo1LcARnvh6ckzHNzThGd4Ao6Vt8XgtgpNGcEW75wvyMhKH9tYDpADEbaZ2kkJ52zgMSFWCzvc
	l/6b9/ZAUUcBwdfYl3ozz/y0EUH80b9OJBIoSp2UW37mRT7aazrtC2PSweYQqRhDYA7YhqKhXkOyk
	zmsFwCj2ttGQtU8gkUB1o4iAAo42TPPylBSKvJKw605wg1gEV2XdyYcFTEeZbO4kZoS6Cn3MPZ7Ae
	OBZl/SFOkWcEcCiqHZZTzw2gGjz1cLpbEBf8is7imHWdk8ybTiEAOLunbCLBxb0u8/Osp7R6h07KA
	aF/VtEFw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4apz-00CG1O-1S;
	Sat, 26 Oct 2024 15:03:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 15:03:51 +0800
Date: Sat, 26 Oct 2024 15:03:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, ardb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto - move crypto_simd_disabled_for_test to lib
Message-ID: <ZxyUV2cMZoKJ317I@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018235343.425758-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_000354_758529_78133FD4 
X-CRM114-Status: GOOD (  13.10  )
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
> From: Eric Biggers <ebiggers@google.com>
> 
> Move crypto_simd_disabled_for_test to lib/ so that crypto_simd_usable()
> can be used by library code.
> 
> This was discussed previously
> (https://lore.kernel.org/linux-crypto/20220716062920.210381-4-ebiggers@kernel.org/)
> but was not done because there was no use case yet.  However, this is
> now needed for the arm64 CRC32 library code.
> 
> Tested with:
>    export ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>    echo CONFIG_CRC32=y > .config
>    echo CONFIG_MODULES=y >> .config
>    echo CONFIG_CRYPTO=m >> .config
>    echo CONFIG_DEBUG_KERNEL=y >> .config
>    echo CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n >> .config
>    echo CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y >> .config
>    make olddefconfig
>    make -j$(nproc)
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> crypto/algapi.c     |  6 ------
> lib/crypto/Makefile |  2 ++
> lib/crypto/simd.c   | 11 +++++++++++
> 3 files changed, 13 insertions(+), 6 deletions(-)
> create mode 100644 lib/crypto/simd.c

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

