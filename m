Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6FCC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 06:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc8ST05/lU4vkA1b2+jaw3Ej+aipM8BwFYTtBem1TFQ=; b=3MWgg+5x91wly3R8QMfwlukPC/
	lK101ikgVOPhl1/88HlaXrPprYgZ+uyJQlAy8U9/2M7a3eYQnml/ZbFuoUdeWEfBq6ff61mcVfK9H
	vC9hBxGgRnMQ+WL2yF2VHJ+BTONP+XubNmQ0cJcdmF8xizLPy0cTyD+JfVB2gwRDDeFIjdCfDl+hL
	fo+C8kACvcYOLcD+hA7lCy9mCDvC83UnwMkIzKjJMftZBNj/S1aZ6211gDjb7WihMDx0bCIJkB4SW
	fcHi/DqEmf5uSLs0F4e1od16mNWHc6LeQAk301T2+91G1rTCrgNWWpFlrgllZqZSRvyi0d3H1wt35
	l04lQIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTacH-00000001jDZ-1ov3;
	Mon, 23 Jun 2025 06:25:17 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTa3c-00000001fMq-1fa1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 05:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Gc8ST05/lU4vkA1b2+jaw3Ej+aipM8BwFYTtBem1TFQ=; b=UhL7QmOY09cYp0raNZkdvXbms0
	GMOKiPj+ZfCfhAhtkyR2fk0uMDxy3w+2aZIkBdsMECrog9d2vW5V2SYTaGmS0fPuovWnsJApzV5SG
	9vaMKVrfSIjJNMEyMq6eUzdSNAXPmBIlKzEVj6H79ZZJpyvIKFWZAru/hIW5FzTt+a8HOCZHitbSq
	tLnUBgzYJ8NS8RLxoWkWAowUDEYmNHlitYnpd8Q7QpGwgJRA5MfBiwKfWHdRyUbOKD7F8A4qvYTdZ
	IYNPdzP0JtLo2rkBkkkx2cvFp7CAdUoDjeVSFYLt2sA82oLZVlx2pfHMIf37eK1G1aLvdHkQZO7Vh
	6L8R5ZCQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uTZnn-000CoY-2v;
	Mon, 23 Jun 2025 13:49:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 23 Jun 2025 13:49:04 +0800
Date: Mon, 23 Jun 2025 13:49:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robert Marko <robert.marko@sartura.hr>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
	broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de,
	ore@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de,
	daniel.machon@microchip.com
Subject: Re: [PATCH v7 6/6] crypto: atmel-aes: make it selectable for
 ARCH_LAN969X
Message-ID: <aFjq0EO0Uj3MGcqU@gondor.apana.org.au>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-7-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-7-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_224928_436530_42D67B9D 
X-CRM114-Status: UNSURE (   9.31  )
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

On Fri, Jun 13, 2025 at 01:39:41PM +0200, Robert Marko wrote:
> LAN969x uses the same crypto engine, make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

