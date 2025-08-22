Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA8DCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROyhNrncK658haLq5ZO1KaSMWsOIBPy61dygEVqQzjI=; b=hsxfjaGBKnaEhTfctmShgzhl5x
	riVig31TxQvhuNEOXQo/eVtXlHN9TJYzfD5g/YadpPo7N3urOmg6yA0B/v/+cjaDVWNjWA1Vi4sh+
	GRuuCGRFUBDTKrJD7aRNzfoPqBYmuYwx0wGJiC8m5HChf9Lg497iCIAEnvbiDADYICDhB5nOqtFUg
	9Ba8ia02N1kaZigXELk2f4zncyZ6so2dqW4/QDqdoLmnUr0ukpllnyM/hvCjYi3k/MGcvbhOUuVGJ
	/1O2HgVsoq43yWSAyPqUzZlFxCLchRnbRKDcp12cqNECggRSmpLcoIhKai+gOvaEgV0Of84xWOIzT
	E1z3LHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpA-000000043mk-2Sc3;
	Sat, 23 Aug 2025 06:34:00 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO8X-000000023S5-2H2M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ROyhNrncK658haLq5ZO1KaSMWsOIBPy61dygEVqQzjI=; b=NDpts+OwAboF+KyuG/H4pnt6oh
	iuRtXo9XDXGe+OfbggYWMcs5wqkvX7DD7WGxp6I4TyR8HYrz78DZtyap5jsHK/NQcKx5shh9HNNaA
	XssYw/DTXB8s1cz7OY3R9SC00qM0/s4pECmSmdhnJmVxvo9qlcPjnGWuIYc30RWH2BUyVduIBcakO
	PiKfZWkwnt5A50tFwKlRPpETvsD6V2VQMXPzxwsa0BswpvonV13JBONP+0ZND15ZgZnu54y1omZA0
	3X8LLGhsu29+d71RPg/fscTk4hlYh0wgvzpw1VH4IUPNPSrloZ7yxd76dY1wOvvKto+kPpGpJjKdA
	1vd6DHTQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1upNsW-00GN2t-1r;
	Fri, 22 Aug 2025 17:32:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 Aug 2025 17:32:04 +0800
Date: Fri, 22 Aug 2025 17:32:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	davem@davemloft.net, andi.shyti@kernel.org, lee@kernel.org,
	broonie@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 9/9] crypto: atmel-aes: make it selectable for
 ARCH_MICROCHIP
Message-ID: <aKg5FKzlF_AABz9Q@gondor.apana.org.au>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-10-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-10-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023241_576066_D3ED6990 
X-CRM114-Status: GOOD (  11.86  )
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

On Wed, Aug 13, 2025 at 07:44:45PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel crypto, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v8:
> * Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
> Microchip SoC-s
> 
>  drivers/crypto/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

