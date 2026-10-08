Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCAFCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Esk5fXnrPEEn31pIrwlHjBwRy+AdMKNFnic6mp3T7Is=; b=d6nSoWkUbJYTn7zPAeIUuS0flu
	2J9FH+vVcLRG9uQ+e9jvs5Pg6mtaQoJ2Qkd/d+fR1EF8Hh/T6AzvLdxS48PgRenCwc94Z9ECJVdZI
	jX2wdDqrmRdrnoTjTL9Mf9yBhy1b86zupVCfNnxRtSLAd0Sw6+qZ5ShmRcpbY++2qAOn3DnvZoyuR
	Lg2bp3u3OrzP0s748bZ6nybZBRhSFnH+AdGerzf50eVL+6QvUTtqrqtP+cUzV80ii7IJ34K98Er3u
	74LviIBWCGjMSQ8RUPWGtNvoecSDwCf1fSMCZZ8zum5Lpy7gxfx1xOE2CJj0jEQantBXor91qXmzX
	T2AyZAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjXP-00000003sVy-1HPy;
	Thu, 08 Oct 2026 08:31:39 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjXM-00000003sUr-2ySa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Esk5fXnrPEEn31pIrwlHjBwRy+AdMKNFnic6mp3T7Is=; 
	b=ljdnrFhpr/TWPcOSjjJ+EyQZfqw1oYAWI7T3hCrsMhW33MHVBqnPzjX/9VKJwOT8ijrue98bKcy
	y7g5I4j7IzqJcb+ZZaI9VASAZn9hjDes74nw5B45mCf9KO5n8xZJ8feKDnTcw0YU/U1vg+VbIPEAu
	VWz4rqzGGj5oVmFqwrfSEkThJULZerR8psDwrDvzPIJlmZoXstwE9hd5aeYalJacLGQZPi8Xd/YhJ
	RhhYCxdRiOXWbO7Hn9UFzxI+n3zardkYxRE6k/Rj5jZBJGWtcz0EISmJtx20LFNISKzsN9+SqKC67
	ohbRxL/0O+gu8ZYRPLMzDCR9ToiW4JdBOAmw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjXD-00000001o24-2frE;
	Thu, 08 Oct 2026 16:31:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:31:27 +1100
Date: Thu, 8 Oct 2026 19:31:27 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Can Peng <pengcan@kylinos.cn>, Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: stm32 - use swap() in stm32_rng_probe()
Message-ID: <asdU3y_WRb2-PShe@gondor.apana.org.au>
References: <20261001210450.37467-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001210450.37467-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013136_747172_04673D2D 
X-CRM114-Status: GOOD (  10.19  )
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

On Thu, Oct 01, 2026 at 11:04:48PM +0200, Thorsten Blum wrote:
> Use swap() to simplify stm32_rng_probe().
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/char/hw_random/stm32-rng.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

