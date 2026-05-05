Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F67CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iFjxSowMvuMBQYdWrDTkbNzEcz8jfIC8K0vfmREwfM=; b=ze8SLWQtzM5dMozHkk+ZHKkUi3
	jdrmV+bl+Qs6Rhw2SSqS90HQkMqPIHKBSBfoFWLAtX34wSIpb/wYyFqSEhKjfLpLJAxfDd6cDpYtq
	E9hMPSZyjFXeZkZKPScm0SEErDKA1vkOCPcqUJiPYo2gTfsQsLsl5GPY+NLvOu36gaBaMaITUdEPz
	M0PicjxsjhfFv4Fypr8tacjza0KSjHyVoDxizUgEVD2Vv0ufHJWiOw5xSi2tcOERI3a6vzYdjBUZj
	m8xjT5/VQtZ9lDcpHYWGRFTRl2R0w2HBE3FlQpArL8IvdKJzqLUFS5GvWReMDvXQeiXff50dOoQr1
	bn2h1QVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC0j-0000000FeYG-1pTC;
	Tue, 05 May 2026 09:24:13 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC0h-0000000FeXY-0hTM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=0iFjxSowMvuMBQYdWrDTkbNzEcz8jfIC8K0vfmREwfM=; 
	b=Y41gk5U8Cns3zRxaKmmQVn8+A39mLYqXQrFvAMToSrCH5Wwdvb7LjOuBDRguIIZHielES7s3kKG
	R461lbkcS8Z/Cd37DK2yKFFd3DovVSeiDSUBn0bMxOLNIM18FSDJEXR7zEKRhY5Fxbs2Qs+Uww2v9
	DktsMswR9CNGzrvsYyIizGkWvqs3bBUlu8T4sT4jKGACBiJ5PhbY47lqbniFN8ce9KlWAwJkQotwd
	n3gYQntFEz0nC3NHsXnqbROXpoabdnlTdhMhVTRBg8UccWaOKBZZ2Gu+KNQW/p7MthpiRbZYBQ5i4
	lJpxlubiKGt3WYhppMLSS80SPN0pf3LbbdJQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKC0X-00BNlw-0J;
	Tue, 05 May 2026 17:24:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 17:24:01 +0800
Date: Tue, 5 May 2026 17:24:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ss - avoid hash and rng references
Message-ID: <afm3MTvlJUKv87AN@gondor.apana.org.au>
References: <20260423065600.2081989-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423065600.2081989-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_022411_277545_5938CC62 
X-CRM114-Status: GOOD (  20.76  )
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

On Thu, Apr 23, 2026 at 08:55:42AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> While the sun4i-ss and sun8i-ce drivers started selecting CRYPTO_RNG,
> the sun8i-ss variant does not, and causes a link failure:
> 
> aarch64-linux-ld: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.o: in function `sun8i_ss_unregister_algs':
> sun8i-ss-core.c:(.text.sun8i_ss_unregister_algs+0x94): undefined reference to `crypto_unregister_rng'
> aarch64-linux-ld: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.o: in function `sun8i_ss_probe':
> sun8i-ss-core.c:(.text.sun8i_ss_probe+0x40c): undefined reference to `crypto_register_rng'
> 
> Looking more closely, I see that all of the allwinner crypto drivers have the
> same logic where the rng and hash parts of the driver are optional, but then the
> generic code is still selected, which is a bit inconsistent, aside from the
> missing CRYPTO_RNG select on sun8i-ss.
> 
> Change the approach so only the bits that are actually used are built, using
> ifdef checks around the optional portions that match the optional references
> to the sub-drivers.
> 
> Ideally the drivers would get reworked in a way that keeps all the bits
> related to the skcipher/ahash/rng codecs in the respective sub-drivers,
> rather than having a common driver that knows about all of these.
> 
> Fixes: cdadc1435937 ("crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> The simpler approach would be to add even more 'select' statements
> ---
>  drivers/crypto/allwinner/Kconfig                  |  2 --
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c |  8 ++++++++
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 12 ++++++++++++
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 12 ++++++++++++
>  4 files changed, 32 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

