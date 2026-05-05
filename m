Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79FEFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d21l9thPG17ZaU29OAiBQhhxEX9vxclzw3MCyu9PyB0=; b=E9jrStzDJG0KWTt4cq26WR1XFL
	Mq4juzJXvCSebOm4a4e0OXifL4iojxdKZW2+R0+JwgrDj+DGJui0vkVYc8nERoEy8CXpK0jPULNdG
	VFssptqb9frFi1fHW2tzvrsl+q6cJ3c2+JDQRfTTNIcheCXYRiA3iEWDxjLxysyAVatu6OH+tXoOx
	8MGcA/qngq9ZL4pNf23oFAkL5pdjSXCmqWfxExhP/LlJKjaIFAH3di1q7cGFR/QgmwYUs52SBJ4Ql
	LKhmxzGhXeA/kiVkO26OL9MBSHA9rGUdL/zA1T1xnwWHfOeRqF+BXu7lZ7p+J32s97EdF6JsKzYAJ
	ab5g0Q9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBPE-0000000FYlb-49Po;
	Tue, 05 May 2026 08:45:29 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBPC-0000000FYkl-2byC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=d21l9thPG17ZaU29OAiBQhhxEX9vxclzw3MCyu9PyB0=; 
	b=Of7G8VU2vN3kRwwD/48+B2F0NgG8quny3E+/uskbLy617vgSNdGQQFDRrMJgNN8bq+KJILI+D94
	qIoa/xyjVJXfCn4vMp30VamC/CeROoygM63+nkS9SeAysVUtaMT4FuU7RjJsy/JRgkaTAVl/mJLVq
	GbWM0OFASt6hPKr3SLT9q6qd5zlOGxrLnGtzXY1VHPcMz/wjlmTQbSLNtBTJ/iHGwNxVqqh7VP5Lw
	7PCzK65DiBeXGh5I70M6YPOAnmtdXkOqgdH6PR9VREJtDF7/G4WQtRf6DSRmU9Jv2X+lp/GMyEhSo
	yxpAs2lSrijAh5FitJ7EkywVexbjQaj2RxWA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wKBOj-00BN39-0i;
	Tue, 05 May 2026 16:44:58 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 05 May 2026 16:44:57 +0800
Date: Tue, 5 May 2026 16:44:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] crypto: atmel-ecc - add support for atecc608b
Message-ID: <afmuCSMMPWPbzONk@gondor.apana.org.au>
References: <20260412095642.120815-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412095642.120815-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_014526_665865_F86A73ED 
X-CRM114-Status: GOOD (  11.49  )
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

On Sun, Apr 12, 2026 at 11:56:43AM +0200, Thorsten Blum wrote:
> Tested on hardware with an ATECC608B at 0x60. The device binds
> successfully, passes the driver's sanity check, and registers the
> ecdh-nist-p256 KPP algorithm.
> 
> The hardware ECDH path was also exercised using a minimal KPP test
> module, covering private key generation, public key derivation, and
> shared secret computation.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Resending to include linux-crypto in patch 2/2.
> ---
>  drivers/crypto/atmel-ecc.c | 3 +++
>  1 file changed, 3 insertions(+)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

