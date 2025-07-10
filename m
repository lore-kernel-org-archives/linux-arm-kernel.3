Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F95C83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2M9UzPooAH4xms8AQ/UUyaHRr7orBGN4WSmNKt0TTs=; b=DK2l8lRgKepnhRiVvpxNXXwXbm
	aes1Ljli2bHzrYS95+c3WRdmFV0uWVRhxYFCiFxzwEpodnv+NmYoRuyJh7/251WhbUHbWnySTunjv
	lJEPMLwXaKFlRiVmywUbK4vEgbn34blVDqEBZ34mk2JRC3RBigiLZhIuK1FUMtumd0qK10PvImkHd
	oVfZFqb/aDi6SxV+DibmtVSVuZYBR2GV1THCV3W421eDSbSvy8o7x232M723DO+u/e67295Ecm/8W
	WGG+dgfRZeUX78URz0ZKsd0f+moPeuY7J0frkE9pMlcscVaMKjnl53cM75edkxcsygDUyx524f93b
	FT8pAvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnKw-0000000BJCi-18Dk;
	Thu, 10 Jul 2025 09:13:02 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmKa-0000000B7QJ-02p0;
	Thu, 10 Jul 2025 08:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=h2M9UzPooAH4xms8AQ/UUyaHRr7orBGN4WSmNKt0TTs=; b=kFcHmoUxWcjbLkrbePzQ7yVZrF
	FNB7PpULB3X+20i/zjqq83O44Q+yB9JeDVOek3lqoIvg8QjYO8D6HwQ07aFKlNqp2IPFCCY5JPjoh
	Ab+lAfBWG/ImFlJT9RSwzZpyjdco/Lhnr+w7MIr3k0YTC7Ivcp7uu1Jn0irNMOTNPYbbh6fF0VV2a
	/dSZ7kTfEbxDXVj6dVz8zqF2L1SCdA7xFYCFjSQbrmmqcBhbMCpodA6eYvpPQIrnj78bcKaNkgim1
	aJX7EkhkbekSEb8CjE4XSz3RYW2ixDvg4wXTauiWcroWP5j3BUlmfQbqEl5aTGxN/ZPeFpZah8x9N
	9mI5U6kA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uZm4f-005Olj-1u;
	Thu, 10 Jul 2025 16:08:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 10 Jul 2025 20:08:05 +1200
Date: Thu, 10 Jul 2025 20:08:05 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <romanov.alexey2000@gmail.com>
Cc: neil.armstrong@linaro.org, clabbe@baylibre.com, davem@davemloft.net,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 11/22] crypto: amlogic - Introduce hasher
Message-ID: <aG905asYccnkO3P1@gondor.apana.org.au>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
 <20250624135214.1355051-12-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624135214.1355051-12-romanov.alexey2000@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_010836_045705_4D1FD0E3 
X-CRM114-Status: UNSURE (   7.15  )
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

On Tue, Jun 24, 2025 at 04:52:03PM +0300, Alexey Romanov wrote:
>
> +static int meson_fill_partial_buffer(struct hasher_ctx *ctx, unsigned int len)
> +{

Please use the new partial block API which removes the need to
handle partial blocks.  See aspeed for an example.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

