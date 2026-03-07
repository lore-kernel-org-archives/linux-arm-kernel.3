Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D318FC9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 05:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ef99pQ6BhbQYKEJKAhkUF+17RAs4E6wJGMJKDzOyINg=; b=C6Kk9hSkSd+yJTa2O1s8TA7pEd
	dc2OEAIpASx9jflbEcolO43fLePHREyMWgZR1C6wetiglVxmYdI4pD9PbOSs+BTH90gM+w5wead0s
	ornhaIdr4tXevwkdtnh061o9wEkqaDpfB+wpzY/laxTMXPNRM/uROJuVP5eBVyMMdLdP/ALY8vHHp
	ApFcPIjk2GC4nosf4z4Qc47bavjWpewtJkYi9q+CAB2nXG2H3SmJg761H6zPwMRl/GaBM6KE4V/hh
	eJ01W+zjI8OyGeznI7idZ4VGIZF/11EwhIpjrlgXZX01BSFcDYb0oDEiHX0MiQoXoFCEvAEOuu31q
	VvUX+/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykCW-00000004ugq-1ehj;
	Sat, 07 Mar 2026 05:27:44 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykCT-00000004ugO-2l5N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 05:27:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Ef99pQ6BhbQYKEJKAhkUF+17RAs4E6wJGMJKDzOyINg=; 
	b=DCweGE8ntf+8aj2qaJolSLw/3ZnU9TpvTh4jnoC8S/bZvGIDJ+UdBfQ+zCNmMRk0TbEIoUMr79D
	XAj1arCr1AmKeANaHjIg2wsVKEBtx1oSUvNPwyyH0R1keS3WslUo3hE9BGcve4u9WrOYNEuaFf+J5
	DSCyra9B3XJwRz2fWU137R2/5ifeN4BVO8ZXQT8ZrqARSUT5InM8Hy3egiujMeziX7FEEdlYvek6V
	gbzlw5hf7e21SRc9ggtQ03WSLpMieX91fTseqBMi2StPBV8yncX7es5vtlVDwIN719DV0RxDqOn08
	hQbMYeHji/VnJ5Yxd3BNi2FrDaS1c8F0cstA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vykC8-00CJS0-06;
	Sat, 07 Mar 2026 13:27:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Mar 2026 14:27:20 +0900
Date: Sat, 7 Mar 2026 14:27:20 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lothar Rubusch <l.rubusch@gmail.com>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix uninitialized data access on
 OTP read error
Message-ID: <aau3OCCHGZFARas8@gondor.apana.org.au>
References: <20260220133135.1122081-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220133135.1122081-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_212741_699799_E41C3A94 
X-CRM114-Status: GOOD (  10.55  )
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

On Fri, Feb 20, 2026 at 02:31:36PM +0100, Thorsten Blum wrote:
> Return early if atmel_i2c_send_receive() fails to avoid checking
> potentially uninitialized data in 'cmd.data'.
> 
> Cc: stable@vger.kernel.org
> Fixes: e05ce444e9e5 ("crypto: atmel-sha204a - add reading from otp zone")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 4 ++++
>  1 file changed, 4 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

