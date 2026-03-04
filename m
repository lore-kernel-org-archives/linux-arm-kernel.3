Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A21EF8FE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inLNF6s7jzPXaIKhV0kcRGT2D6va2Ay+1uYeLl1r+fg=; b=Q2pSVFv0uUZw1XS2warVtGYEyG
	xI+LmNPA70zYCCJnU7+VQfCn3MwR30K86KHpVMxz8WUFMqLZesWR4VooxQ3Oe8VeIiDIQD9+OixD8
	Nhyy8Hj19mu8/FrMcCxhYCTuIy1NVgxEqGyIawcVGCZlmGaI9dG8Q/0gIt4cUEneKHJ/6aTbcQcU0
	2tUtDwLGH931B35GXQibDKZXl+JQNuWXD+c1jEPlI++hUZ9plQuT12dkZSX5SD9+6SBdvbD0XbRhx
	A/4GZUgsNghzP677ethfaPE+m1koS8d4dMvqO2uUWOKKFLQEIk6UzqnO8vxiBbQjteDH2iYW5O0F3
	cCdbpnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlyh-0000000HE2i-1qrv;
	Wed, 04 Mar 2026 13:09:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlyf-0000000HE1n-0n19;
	Wed, 04 Mar 2026 13:09:25 +0000
Date: Wed, 4 Mar 2026 05:09:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Joachim Vandersmissen <git@jvdsn.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
Message-ID: <aagvBY-XMfPIqkDO@infradead.org>
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org>
 <20260303193102.GA2846@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303193102.GA2846@sol>
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

On Tue, Mar 03, 2026 at 11:31:02AM -0800, Eric Biggers wrote:
> > It sounds like xxhash should be removed the crypto API entirely.
> > There's no user of it, it's not crypto, and doing xxhash through
> > the userspace crypto API socket is so stupid that I doubt anyone
> > attempted it.
> 
> dm-integrity, which uses crypto_shash and accepts arbitrary hash
> algorithm strings from userspace, might be relying on "xxhash64" being
> supported in crypto_shash.  The integritysetup man page specifically
> mentions xxhash64:

Oh, ok.  So at least for now we need it, although it would be nice to
convert dm-integrity to lib/crypto/ and limit it to the advertised
algorithms (including xxhash).


