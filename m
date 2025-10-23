Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C470CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 05:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rF34TyMXjGlqnz4VoV+LRea+gcOnSTSfnchR0MLkbZU=; b=ZPLnjca85eb7t8/iGHwzJa+dum
	v8AHMO48qHQO3ENBuIzKPkr8fCc7wTydj/9OMVouwaU9ZusRSCEN2Px04BV7mCu2arsHa7ufJw5yx
	AVxIkwroled2AzUXGcRafdSjrSb6XiHz/mJD0QR2ojkwLiEPU4vEh2g7KTNJL8/Yt0Xw7LZpvsFGr
	PhJlaLtIKeNC9DEjYt0KD6OaseeWwNKDXMhE0bN2qdvpZu3MRaH1SHdlD83H4HfCdH2YORyhKoReZ
	TwInCS3hMJnstXfzX33vE1RqqZ0MWWwYXveSzTwAOQghuyl/w0cmZ0HjPmo8P540DhmYt3Sjo5YYU
	OEMahqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnR6-000000055XE-0iIa;
	Thu, 23 Oct 2025 05:00:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBnR3-000000055WY-48YI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 05:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=rF34TyMXjGlqnz4VoV+LRea+gcOnSTSfnchR0MLkbZU=; 
	b=EsA98BBUcYgv90WePfYVkp5iIZthfKbwWg4eggacbq4SONi8muRl+YN9cltdyaMsUCQFz3jPol+
	pUvs7UBgJTm7cP59uCeX0R9wqsbW7lErcPvdDGfLeqv6HY7/YizAQ93zSqD44H6lN/aGillTp8eYd
	/frAHlzZYM2jbV5PSE+1JGJUKVWMpSSw5EEsswH3uK7mQzCaS+YWROb2+ORckfbbhSxq0w8kq/tAQ
	qYZG8PdNpz8vOvqFapaoAS6c5o7D4MQILJu41yJbChb3EfeIdnTUmYxvoxsNKnO1vrvo4vrPn4OfH
	/4wEe+7SCUm5FQmrEz8Xj1DWqls8gRo/thGQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vBnQc-00EsHx-0p;
	Thu, 23 Oct 2025 12:59:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 23 Oct 2025 12:59:58 +0800
Date: Thu, 23 Oct 2025 12:59:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: neal_liu@aspeedtech.com, davem@davemloft.net, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: aspeed - fix double free caused by devm
Message-ID: <aPm2Tql4npKIokVY@gondor.apana.org.au>
References: <20251020101109.1030-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020101109.1030-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_220026_024833_02446A12 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, Oct 20, 2025 at 06:11:09PM +0800, Haotian Zhang wrote:
> The clock obtained via devm_clk_get_enabled() is automatically managed
> by devres and will be disabled and freed on driver detach. Manually
> calling clk_disable_unprepare() in error path and remove function
> causes double free.
> 
> Remove the manual clock cleanup in both aspeed_acry_probe()'s error
> path and aspeed_acry_remove().
> 
> Fixes: 2f1cf4e50c95 ("crypto: aspeed - Add ACRY RSA driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/crypto/aspeed/aspeed-acry.c | 2 --
>  1 file changed, 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

