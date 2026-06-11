Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BDFCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S95Pps6sDL0cr55qXcXyoNsqagjVpdEK9MkSxzWkhp4=; b=VG7ZM2X8Tw6ayQMVSqMT2vkzuM
	jOeM+JtRfeTpUQ0JA9bk6W7T9HRjb7UuIc6xxTHkpWprorsp16kG8pvkBtPhxViJm5wqmWQxYNq8t
	z6X1GFovuacSWmWLp7zG2I79wVGVDO508sVnZM3zFXHbxEGFSlJ9co734fEQm91NOd9HyriV5W0DL
	g2TM84Xwm/v/nXI4wWhp7vhQheRRWzYIF+9xB7h9NV6M3VLWdwkE0veYC1l9Nw3gO20l+dJW8hO8a
	eqNBET+8gsVj3ybfSCMlhV+Cr3WZHTKh8WU+IOTaH9+iU7o0l58nb5aCZ9mzGK5V6BwaUQkQOWfts
	goKK8cGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbBN-000000093m4-2uqY;
	Thu, 11 Jun 2026 08:54:37 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbBK-000000093kN-1Nec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=S95Pps6sDL0cr55qXcXyoNsqagjVpdEK9MkSxzWkhp4=; 
	b=Lwg9Yg+tZO9VgMzfyzz/RjqzFKf6OutFexKpthGW9YuqUlMC8+IdtTGnpIRyC8YGok3HKE2TnjF
	8Sn35SbwnziruUI7Ky9u+haoI6hdh0vek003zvTgvfCj3tCX37gOM8br5Jz0zwrvrmo9ne/O5U4uU
	eEUtpdQp3VCqdn7JDucNlVNDh3GIhYXqdmdVAghCk6agbUvAW5BfgshrxmS74SBLay60PTQZl/c5C
	Sf1DfCvFySXJjyi2cs6gzE0ZfSXxqBNlQEn+SlzKdRt18iOVE7sV0ytwWHv3+PltuwuHdpKjczI1U
	oZjAXqahqEbW8cqvmD4UFnURkG1sxTebwuyA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wXbBC-00000004XcU-0F3J;
	Thu, 11 Jun 2026 16:54:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Jun 2026 16:54:26 +0800
Date: Thu, 11 Jun 2026 16:54:26 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - drop dead code in atmel_ecdh_max_size
Message-ID: <aip3wkCx0UIOXGrn@gondor.apana.org.au>
References: <20260602222517.1071850-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602222517.1071850-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015434_365354_A192012E 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, Jun 03, 2026 at 12:25:19AM +0200, Thorsten Blum wrote:
> atmel_ecdh_init_tfm() always allocates ctx->fallback, so it is never
> NULL in atmel_ecdh_max_size(). Remove the dead code and return
> crypto_kpp_maxsize() directly.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

