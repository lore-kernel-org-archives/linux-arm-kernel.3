Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DD9FC9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 05:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncEAcVoiDcL3iA7lBgrDArbDOB8Q2IyQEoXbd7dWsmQ=; b=3V3/lpM1Q+5iCxBCWggcq7hTty
	gLLEKORoEQ2WbmdgSgMF6Po/obvm5dzx2c9kZesSE5SRg+mDj0uufiCj3IzkHFgYSA7vFliA2pVdg
	mb8W1DF8M0i7228B+LbyP7ZXGxk2lf8vrJ1XYmDlgvJ1T+1sBc9xBh9lvRKyOQ7wJw+YX2NodEavS
	Zno83AKdzk8eFA0ppkqI9ZFLb65WuPyVmp0F2X4JK/zlY73+rkVpq9z5IYiWEEWV+KppbKPDf9uvz
	ii2QCtyo9FocfPLnSHR8UJqSqSpF1RWV/vogekAvz7xiB75JSItM5UDoCeUHQigJOuIw2P2JEASjy
	JL/bzXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykCf-00000004ui1-2rth;
	Sat, 07 Mar 2026 05:27:53 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vykCd-00000004uhT-1GC6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 05:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ncEAcVoiDcL3iA7lBgrDArbDOB8Q2IyQEoXbd7dWsmQ=; 
	b=puOBay21/q5TPhksr5OQX0h7vxxmjPUpnnXzfHf0+EvhUDaqf13zsw2/nNJcPI1R915lhqtSe7n
	dk/KgN4HIXGzQdFl7M9HIpFWZmgu8tjs+lC1WfDnsK+08nPnqyd3q9oLqW38obtDXQDnyBIKYnkxX
	eARqN402dh0YmrrDzL/TEAByhH28zeuI/hbHVWY6DZDfb/jT8I0uDFrNexlzR2I17G1LgKoZ9TG2c
	QQJWlyOxeVAiX5SYqswsL5ZgAfDV3fhnKvj7NG7Ampf4j/JhDSp+FB8XD0eCGrludO8NRPHpvy0bi
	tHlUGAqmYNlukyWP1gd3al2ORjS9DN5t61bA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vykCM-00CJSZ-1x;
	Sat, 07 Mar 2026 13:27:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 07 Mar 2026 14:27:34 +0900
Date: Sat, 7 Mar 2026 14:27:34 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - Release client on allocation failure
Message-ID: <aau3RlbxzA1PHZvc@gondor.apana.org.au>
References: <20260220140313.1123405-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220140313.1123405-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_212751_340678_C17A1AD9 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, Feb 20, 2026 at 03:03:13PM +0100, Thorsten Blum wrote:
> Call atmel_ecc_i2c_client_free() to release the I2C client reserved by
> atmel_ecc_i2c_client_alloc() when crypto_alloc_kpp() fails. Otherwise
> ->tfm_count will be out of sync.
> 
> Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
> ---
>  drivers/crypto/atmel-ecc.c | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

