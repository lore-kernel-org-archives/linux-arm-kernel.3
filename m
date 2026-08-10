Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC53DC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeN+7i9ajU/dD3F9RAbJ9KjLrqh56SYkoriI9RmjyKI=; b=lUxw5KDDJVFDTtZIhx+E/ZDsRB
	KNBrpOi86Lup32BcE+6quhx/HEJO/XKXEhp3Ov1OrkGZtz083sqS/ltU+xYt63mjHHgwQ2E9l2VX6
	b06dg8P/U0WS+F1QVJqRVnrKptsOqAIjjBeg9eG8UGUaPgJtziqwgdECH/sZGq+IwcERhIJYnT4xc
	+RqPvqA/Nvq2xHJfPk0EwZ47Zn6xh5QcGFHsni5+/9NCcWzCrkEEumyZSgIb8tnl8UwuLjQyrZegb
	M13ttC6/NSOlFZAHGuKqrzvhBqTkXvSp4BRMdZ4VKQTbkHlcP7ApZ+dTfFlo3Wqm+ITkqHisxrYdL
	nM7q3IOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLLV-0000000BHqw-0UNC;
	Mon, 10 Aug 2026 08:26:57 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLLO-0000000BHmu-31Ql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=EeN+7i9ajU/dD3F9RAbJ9KjLrqh56SYkoriI9RmjyKI=; 
	b=oETLbnAgnYh3EPViBTtOILmJyEWQp1041O32dJa3vVcnQZYIbAnrzaXoSrIzJLJ8Rjiv+pWf45v
	eKyk5VhtTfBmc1a+GqJbdpXoU1xHjpltU/lQ34k3EaJwpLvL+G95kLc6QJm4GTkHTYcYmVhQU4w6d
	QQBg23gFMNDpgKpec5m1fhegEnEv4nS2N+c9JABKZ4n08wdbK21bmK0grOBbZRr+st8UeyZMeo/Bl
	Jne7S7dU8mIWVpOaP3hbTifYGGxAafhfWyL8SLqYjzEafH4nGGoLWXaWHVeKHHH8fYYRkJV2JjsP0
	jbImRQviU3drMqnAE9l3l02TJkcc5MMy8zVw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wtLL5-00000003WeA-0r11;
	Mon, 10 Aug 2026 16:26:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 10 Aug 2026 18:26:31 +1000
Date: Mon, 10 Aug 2026 18:26:31 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: atmel-ecc - simplify control flow in
 atmel_ecdh_set_secret
Message-ID: <anmLN8KKX7rVCwp2@gondor.apana.org.au>
References: <20260728205825.471233-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728205825.471233-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_012650_760550_513F747E 
X-CRM114-Status: GOOD (  11.14  )
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

On Tue, Jul 28, 2026 at 10:58:26PM +0200, Thorsten Blum wrote:
> Free the public key directly on I2C transaction failure and remove the
> free_public_key label to simplify the code.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

