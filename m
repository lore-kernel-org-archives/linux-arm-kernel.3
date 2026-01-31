Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01EAD73EB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 02:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykINfR+68595rbydHn6nTQMnB5GoHxZgrU275cHex9c=; b=TQJGY9JOolgWDe7YGf6zv+CKQ5
	oEG6yibmLUMM2uBcMxLymLJDuzKU3v18ibQNdTzqCF2IEthUtknihvecSZlSO/2P63H+djuulo/Ly
	XE5+FX5vYCaqAS+wozbt/fI0+NpEHEmRsGrFdv3eyhRpr6BuHbFhfdbUzlmyaBQ6zn9r+b0LmKsdJ
	Cm73Tuv6BCzPsfGz3O4Dan8CcpDQ8djVKSfrb+vCryTFg/YBBpveZzzo9wE1ZC7EZn8GTSRr4cDPT
	aGUtDyhT6JDUhMbDFcrRbnW+sh4iQex6PgP3tsb6tOe0nkOZJGBM/PQCGmyXLUrsOEJCsreX80v8y
	YyfDwGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm12W-00000002FBJ-2dK6;
	Sat, 31 Jan 2026 02:48:48 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm12U-00000002FAS-2eXc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 02:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ykINfR+68595rbydHn6nTQMnB5GoHxZgrU275cHex9c=; 
	b=O+8c0mX09K+V1RawkhytBx8jZqlVw7Ah/1SBBsVzh9QQiphRIJdqV8a6h+KHop7h2mcC3iSgDce
	oWjYZb/gyMXLpqV5UJMGF6xQXBiNeZn1QZgDDsKGXUvdNTa2Zmn1wIBFfd6fXLXj+O793g554Df28
	1Q/2mr3bOAQmcScDidTW+fsTsRqAs/T/sQHXxPLaSCmj+c427GhUNFuRtvnCARSgC+BLOuso+PQQQ
	hJkprPR3IYIqbQi+gitcBSRVG7FvueB2PQpDYEv09FRAemhHm02sVnG2UUFnuZFh9B3OZ61Ot8odW
	p8oT1b0bUp7obduwG15WPW1Gpu52+7VYrItQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vm126-003RrU-0m;
	Sat, 31 Jan 2026 10:48:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 31 Jan 2026 10:48:22 +0800
Date: Sat, 31 Jan 2026 10:48:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: stm32 - Remove unnecessary checks before calling
 memcpy
Message-ID: <aX1tdmQERL25z2Al@gondor.apana.org.au>
References: <20260109142039.220729-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109142039.220729-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_184846_665907_7589AF7C 
X-CRM114-Status: UNSURE (   9.94  )
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

On Fri, Jan 09, 2026 at 03:20:36PM +0100, Thorsten Blum wrote:
> memcpy() can be safely called with size 0, which is a no-op. Remove the
> unnecessary checks before calling memcpy().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/stm32/stm32-hash.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

