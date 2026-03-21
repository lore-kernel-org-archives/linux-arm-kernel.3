Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DB41094461
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAYI36BuyLNtFwWJ/mVzmo5kO6+XzauuqvOp/jdB/BM=; b=PvY6jGNeVoHxS39Re/UEeW1ZS+
	iLx/LbWp0aEJdOWGeRP4ekiMrpvLm0CNaGA5cajOuxDUKqxSUXJ75Af4viWgel+IS+bBXcKmrGnMI
	HYSvO69dOEHWJZOq2nqNvLclY+uCbaYreEODb8bzoLRRN5qnavT804fcQL7ZnhBfIcj91tsfzzmmi
	84J5OqrqtC+zjvHjTtb1FbYBY/g9wS1YSsUVUpjrDql8AVP4MOKUWQOIjpIRudPOIWSclQZeVJU2Z
	SBmG/wZ/caCAMa5Pk4y1502XPJjwokA+VJJ9DwBKY6XANVHoQILPQ3HupmJn0tv7O9P9DxSqrcfCO
	Ytdbxe9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3rzp-0000000EH8h-294T;
	Sat, 21 Mar 2026 08:47:49 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3rzm-0000000EH8I-03jK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 08:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=GAYI36BuyLNtFwWJ/mVzmo5kO6+XzauuqvOp/jdB/BM=; 
	b=hGZtU65aSlNzhszzUX62kqapg82S8od4wk2niylkubjcIWYINWO6v7Im/SD6cOWxnS4OUD3/oLV
	PxmzOXyOq1iH6gAaaQuky4RtTEO6AvJDK/JK7igpJjz6iRiCGPnoj8fzp+0rJuswEJ2t1MGOC/v0h
	K+XnS8WsFi6VVOYIY+7gek2ZM49hTW9/TvU2kLYa8J0qWWoaNIHau62a5DQm0ebfooGTO3vsdi/pC
	HtmQ8YPH5poAWvKBK8+FGtQix/IcN5eAncL1fotSvXL5VhSRrYpT69wpZB2IKYJCousVCE9ZU1Wp7
	3bDQhC2y2QQOXwzvceDhIbCL5xEc9xVQ7y4Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w3rzJ-00GJ8e-0s;
	Sat, 21 Mar 2026 16:47:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 21 Mar 2026 17:47:17 +0900
Date: Sat, 21 Mar 2026 17:47:17 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, stable@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-aes - Fix 3-page memory leak in
 atmel_aes_buff_cleanup
Message-ID: <ab5bFYWKvBakbESr@gondor.apana.org.au>
References: <20260311020733.250288-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311020733.250288-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_014746_057265_8AA1BFB5 
X-CRM114-Status: GOOD (  13.17  )
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

On Wed, Mar 11, 2026 at 03:07:35AM +0100, Thorsten Blum wrote:
> atmel_aes_buff_init() allocates 4 pages using __get_free_pages() with
> ATMEL_AES_BUFFER_ORDER, but atmel_aes_buff_cleanup() frees only the
> first page using free_page(), leaking the remaining 3 pages. Use
> free_pages() with ATMEL_AES_BUFFER_ORDER to fix the memory leak.
> 
> Fixes: bbe628ed897d ("crypto: atmel-aes - improve performances of data transfer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-aes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

