Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA2ACD5BB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUl6Di85zdywTCtLZDpUxTZGF7q2HknhseYIwing12s=; b=DRzTtFjxr3P7PQAtOoslZAN5Y9
	pHArourlVoWWKFjL599hJ7Rxd/0lQDJvSkol04CYNMdIdIVyTIiYAMNXGJUh2WKTTcxIvyfVS776s
	7BhCf5hncTqRhE7CT/y7DJBi41oFdp3gK61FSrBvL6K9Fy/fl58fLpIsCyMgrimprHiskTBplaoUq
	KHxpmbBLzNjQnljr54W54wafkY3CMAtwNhPBPEajKvPhO2UZioQUia0w/18VelVjM4GvX+7Y7lScD
	fZ0gRjk3phLv6eDTf4sHwhZ287wbSIV/G6HOf3C00Ff5BLNt/pqpeDOZ3zOhmC1zfmBW2MiV/v5Qc
	6iwVVFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP79-0000000ApaS-1Tty;
	Fri, 22 May 2026 12:36:31 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP6v-0000000ApG5-1bv7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=pUl6Di85zdywTCtLZDpUxTZGF7q2HknhseYIwing12s=; 
	b=TM5rct7q+wnyPz8c5pmc5+lfFejfF/vDcb2eDm+l83qnc5HpuwUOHbJueYj4/wIwgGolEyCXKbI
	+aSbZ3rakFzZzSeM3LIS5Bo0hHaCvM5GlUo3d6I7QaECes7eGYbqB9gy5a6jlDeWHskxe8dQtp7bg
	mpNbRMsVu/XPsWqXg4QUnsODKsMsNd+mo038qOrgeB3LW5ELUWRbMju82RK8w0Jgy/E04QAktk9Mr
	Qd0sfGxNcKSX9lHs+uHbqLznmOHgvPjrjKtlf9CeUkw4vc9H09OKVAO66K/9LJzrEyTdTW4L+RQGD
	y9OXTQUgFXjHei+shivkt5+0uM3XcxfJnVFQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wQP6k-00GSXH-2I;
	Fri, 22 May 2026 20:36:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2026 20:36:06 +0800
Date: Fri, 22 May 2026 20:36:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lothar Rubusch <l.rubusch@gmail.com>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-sha204a - fail on hwrng registration error
 in probe path
Message-ID: <ahBNtvwCCWlqRLSR@gondor.apana.org.au>
References: <20260517162740.1250-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517162740.1250-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_053619_004481_9E1DCB58 
X-CRM114-Status: GOOD (  12.61  )
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

On Sun, May 17, 2026 at 06:27:40PM +0200, Thorsten Blum wrote:
> Commit 13909a0c8897 ("crypto: atmel-sha204a - provide the otp content")
> overwrote the hwrng registration return value when creating the sysfs
> group, which allowed atmel_sha204a_probe() to succeed even if
> devm_hwrng_register() failed.
> 
> Return immediately when devm_hwrng_register() fails, and report both
> hwrng and sysfs registration errors with dev_err(). Adjust the sysfs
> error log message for consistency.
> 
> Fixes: 13909a0c8897 ("crypto: atmel-sha204a - provide the otp content")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha204a.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

