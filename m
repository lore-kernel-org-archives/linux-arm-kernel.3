Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96497CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7qvxvycRKUr3VRn/IAwsM25G2ry91n1nwMcSratYqU=; b=JgThkUNCOOgalCF0hxynPOa8il
	X3RCsgl3J/8D4q4YjS6wH8f+u9vA4EH+/6a0XUVZASDHf+Ek0Tq4PABNZgmELvps8H++Zf1Vv34zG
	l/swkpH3x0shx6TDL2isv+FBKEt82gvYZQlNa7hez6H6EijkJN7YxLdF7+btMGVl5wJsu6kAD+mti
	nG3NyY2Hd6bhJwvl3/Gf77pGdHeQmImi9QqwSpndvJ1xF51glrvXQO0wn7fVbh/XsrsKmJYH/FhNJ
	TCUhdSKXSPpNRhA6PRYDMWb1sXKsOwcdCTnfIO5aBJZUPfKX+RlfQOaazyxkPZOmGGpPItsPzXzqd
	H6HRDWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjZO-00000003t8p-1Ymr;
	Thu, 08 Oct 2026 08:33:42 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjZK-00000003t5P-3Eau
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=M7qvxvycRKUr3VRn/IAwsM25G2ry91n1nwMcSratYqU=; 
	b=HlfNLCPYtxyycidMuK5BooFkXup13eA5Jryh9Ix5r9xdMkKng3wDXiY7hssWnxy+UGZyjm6mCge
	GHNXLBQiXB+FOmek0FDUXNHzkH8dzXDMMolsSAYPA2FKd9m7rWiH69MoTnTZ8950KPvUpGPhMXrv6
	3w74ryOFxBXqM1tmIBVbCEszB7V3gazFuZf6nbztmmMWdVfP+W8WHQhvutHYOv2LI5ylrFZlBi7FU
	XiEnSAEXfmxflYlEfDKWEHvTCSgQBQXudTQsLZO/Mv1WP2FdJRsFcvHGvlC8ZHdCQMJUXVBgkjMF+
	eFNNLlwtlCVrSewCLm0V0xB9WiwFKqezDiWA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjZC-00000001o4n-497l;
	Thu, 08 Oct 2026 16:33:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:33:30 +1100
Date: Thu, 8 Oct 2026 19:33:30 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Can Peng <pengcan@kylinos.cn>, Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: stm32 - use devm_platform_ioremap_resource() in
 stm32_rng_probe()
Message-ID: <asdVWtkRsWWnaV8H@gondor.apana.org.au>
References: <20261002144839.51627-3-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002144839.51627-3-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013339_158166_E250CEED 
X-CRM114-Status: GOOD (  10.75  )
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

On Fri, Oct 02, 2026 at 04:48:38PM +0200, Thorsten Blum wrote:
> The resource pointer is unused - use devm_platform_ioremap_resource()
> and remove the unnecessary local variable.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/char/hw_random/stm32-rng.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

