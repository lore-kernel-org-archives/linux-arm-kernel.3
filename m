Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1BD107BCEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wis8Ztt02echphqiraJLVLvNhZewKrw1vXf9atZnXgs=; b=rXVEiq4U9hqac9xP3GmObTW/ow
	kiRp7UnpvI8pwSnlsyzHco9J64OZCpPrIGhoi55QmxSu+NHnXY0+Nn4mjAbiNyYJDTHmBon03kS4H
	rFf9SkbhQwm/K3C8YvtIRY7G3b/hx7ysaH0/G7Y3G19VQ+kVKugXLrxWvT/4oEwLuH8lmnzPMDUST
	T8+ALWgY6r+rJeZzyEcdntpCgBnFMCynCULqZk8nwRkW9Pa1gyhfgiEuU6Ctco/HNsio3bdX1OhLM
	cr6sB44hlwDR+TNXdtVCDdqrCfxNStKCHtmkkjCZkXsSFBGne2RpmFjHj1TCGF0MM12tODazXdso6
	g3hcur7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HL2-00000001WHL-2p1o;
	Sat, 14 Mar 2026 05:15:00 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1HKo-00000001W4i-1sC0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 05:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Wis8Ztt02echphqiraJLVLvNhZewKrw1vXf9atZnXgs=; 
	b=fOHsND1CEQIhZXZBE7RXmXaLpWqbxgWHGC0f62NgVE8Lk1KJbmufIhlq/xEX4xFR4P2RV1PXMay
	mFjFgnpiJknmlnPd+levPMxRMdie5na8MSRka+SBG7OQscfCgHiV+yiVu5+1PMl2Sa3+/I7v/00y6
	Lt+5+XqN/gNodbxIwEeTNu1rBB690Q6ifHX3TegcAqQX0QJBAD1tIbkhEEuOa4uIEy824LbR7SfPL
	krGqxa2pjLMkGjTRrPlUcK98ncC3YljWQc1uST/55VzZe2bVTcAGcIATxINNtwFMK/jzFGpc7FXCk
	Lr/HI6CWqf2a6it8HAr6dVkvJiZ459CapcxQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w1HKc-00ELA5-0k;
	Sat, 14 Mar 2026 13:14:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Mar 2026 14:14:34 +0900
Date: Sat, 14 Mar 2026 14:14:34 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - Drop redundant I2C_FUNC_I2C check
Message-ID: <abTuusheptf3Cx_m@gondor.apana.org.au>
References: <20260304082402.89237-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304082402.89237-1-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_221446_533571_145EEC7A 
X-CRM114-Status: UNSURE (   9.60  )
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

On Wed, Mar 04, 2026 at 09:24:02AM +0100, Thorsten Blum wrote:
> atmel_i2c_probe() already verifies I2C_FUNC_I2C - remove the redundant
> check in atmel_sha204a_probe().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 4 ----
>  1 file changed, 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

