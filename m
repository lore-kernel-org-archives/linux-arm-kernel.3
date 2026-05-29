Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB40BCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aDRMTxnR6Mm1U94jCDGU0V927R383PJOnDTvtv5pw0=; b=QvAHm+1eQ+MJeNxlh5i4yDC26i
	lLzFQr4467BQ69/G+jnbr2pnIJOb0BEL8CJued/qp9ifDGcBwtql9fvXDmbNfQBSTridDOzg2tvW2
	Os8nkIqBTpnLXphqYbH3Uza7IdkMgKYWaVM1/XwJBcS45HJ3MVFT+xbGMSwn7K6k2Hck/IQ4TbxWc
	Kd3BHUFR3LwiIPf3fseoJvn8DTV5XGReYsNUigt0+6WIUocWjk5FQYp36VbIFmwhIJ5IjQ/AJ/srk
	q7t6YQvCjXbI52bvTmJP6W8D3rO2uLC43ipFVUKwIY6729Rj1221AOzuxFoWyxcAx1XdKAUgjKQQb
	esN2Onww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqIy-00000006mjs-3pYJ;
	Fri, 29 May 2026 06:02:48 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqIw-00000006mjS-0M5V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=9aDRMTxnR6Mm1U94jCDGU0V927R383PJOnDTvtv5pw0=; 
	b=tE1pRzbwOMATB+HfPb68vg2JmBumOrfqfLZn6BSr5RDywD3Vp47l06iMVa7VFC8lnpBr1htRKv2
	QETcKYiuZv5rOU+HlOZkvWzk5IYDSRLgfyW5gBfDpUTqAr08zf7HCptjdr9R75klQ3MO2mVqxLaFx
	OeyEoimC45zsZrwkAURiTpXbL8oSPu/jGzUHoMfn0CwjHbaYpu1Fj+JXNxKYiaOXrGIqJ0g/Dwx4d
	TrhuLRKj335qb88Q69LAwZcmdVRyoyIcCTtDr13uwQzuxFMeXb9uNL2e6Nk3fhnViLZ3OCe43GqZ2
	Q8+ayRFvm+gtbs+YJaHbb9Lyl21pVqznwEIQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wSqIQ-000dAN-1r;
	Fri, 29 May 2026 14:02:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 29 May 2026 14:02:14 +0800
Date: Fri, 29 May 2026 14:02:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] crypto - Rework i2c_device_id initialisation
Message-ID: <ahkr5rVYm83b4bBM@gondor.apana.org.au>
References: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1779260113.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_230246_148939_897A1148 
X-CRM114-Status: GOOD (  15.05  )
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

On Wed, May 20, 2026 at 09:01:27AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello,
> 
> this is v2 of the patch available at
> https://lore.kernel.org/linux-crypto/20260519141033.1586036-2-u.kleine-koenig@baylibre.com.
> 
> Changes since v1 are:
> 
>  - Rebase to next-20260519 to account for changes since v7.1-rc1 (= the
>    previous base)
>  - Patch #1 is new
>  - The adaption to atmel-sha204a is a bit less trivial, so split into a
>    separate patch (#2)
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (The Capable Hub) (3):
>   crypto: atmel-sha204a - Drop of_device_id data
>   crypto: atmel-sha204a - Use named initializers for struct
>     i2c_device_id
>   crypto: atmel-ecc - Use named initializers for struct i2c_device_id
> 
>  drivers/crypto/atmel-ecc.c     | 4 ++--
>  drivers/crypto/atmel-sha204a.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
> -- 
> 2.47.3

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

