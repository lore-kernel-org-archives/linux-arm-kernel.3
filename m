Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B03C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JysD6bXkXcUxDOraTgzy8CQh664lFTcTfZ1A5hSTWxQ=; b=toIEBi1EI/86DvsnhKaf/mgLoO
	o8MhP9AmIf534HMt7kI/dxCxLA/OEe9B9Y40ZahzYdUyOB2fyDiVsu73kbKOEVLvKU9trem8YWAeb
	GzaYeh+LnGTSS9kIMChdwjANA5vy+BMumPaAWkpmEWyppCBNqKnFWjEo7b2WA0YFCW/ccYeQO4Wx1
	lTSpmIO3SebtRY8A3B67Xefh9+wpriiJ9KMGsxiBMik8SvENRG0fCVif2Y+pUT2CvjFeZ4Fmx/IPK
	eO3cwu2fw5L+nQzatS7tCoxAxJNV7CFhsk8It+9kuza6iFcGK/skP6kFCIieGoznXohbVhmZbTL2G
	gD7PhooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGtjQ-0000000859C-1QAX;
	Mon, 19 May 2025 06:12:12 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGtai-000000083zE-2wRU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 06:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JysD6bXkXcUxDOraTgzy8CQh664lFTcTfZ1A5hSTWxQ=; b=llx4rKCcOaHC0KBZKzMw9i6cz7
	dnoUK2G6yo/cBuZz9iQdMwFCcDDzF5lCy+5MWHnKVk0tLVbcKbDXTBJpZYro9B6hJjSKjOpezBJVl
	wq4g7Wtw5Z9itWlo1avYM1FloiFsDqwH00w0x2BzfF9/CKWJ7iQOcUMxaSza7PUGoNnmG40Ru95/l
	ysHSnrhQp/HJIQdnxczU84wFWIZ9JfAdKhyANqjHH9bqawezTnByq6W7uAJb9eXtiO/ywvTrM94Xa
	Xj6M++OZDXj2CvBu+RpvCb//IasvipqqkpwIGmuH0jBlZdD1WBY3yYsO9JMCsvz9XOw8cFHRO/n/L
	LBKYgmQw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uGtaY-0078AZ-1N;
	Mon, 19 May 2025 14:03:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 19 May 2025 14:03:02 +0800
Date: Mon, 19 May 2025 14:03:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: sun8i-ce - move fallback ahash_request to the
 end of the struct
Message-ID: <aCrJlrZqwhtMUN_w@gondor.apana.org.au>
References: <20250516120656.3610623-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516120656.3610623-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_230312_806219_66CED971 
X-CRM114-Status: GOOD (  12.73  )
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

On Fri, May 16, 2025 at 03:06:56PM +0300, Ovidiu Panait wrote:
> 'struct ahash_request' has a flexible array at the end, so it must be the
> last member in a struct, to avoid overwriting other struct members.
> 
> Therefore, move 'fallback_req' to the end of the 'sun8i_ce_hash_reqctx'
> struct.
> 
> Fixes: 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

