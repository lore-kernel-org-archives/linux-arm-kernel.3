Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54371094461
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ew4b6Du8jBihJbSUcGCASA7OYqEMzJLSf09+YdWVI+4=; b=ciOv68T/5OnSxEKSIJeF+7eb5A
	Gqbx6pAvEdsWZ8vP41cLp6ABrUl2J1ySGJYHhGXeebcwWhcy2dsvZS2PBHRCHP56Ir8xmxRMu8wiV
	MgC5BaC9NzEO2G+hbSxj7DrNTSYbwbLJ5PxKsBJ/SG74oTx3or20lOLgveom7RO2Y0i6CXonRdxzN
	D6dLzW4l9BNaEwRajGowr7B0x105fw4860JkAAEOCO6BhasqZZUDXRlJ1ivRtPiNNz3Z9zq8Ub5OQ
	8y1/d7pDIsAXbHj63Ouh0p4Dw+bPukHTThgObltSZm97uQiDv4Egf8ElCKpgv3VOsjfiyY5+e8rzU
	Lkr4zlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3s13-0000000EHEm-3eqg;
	Sat, 21 Mar 2026 08:49:05 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3s10-0000000EHE7-3GmR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 08:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=ew4b6Du8jBihJbSUcGCASA7OYqEMzJLSf09+YdWVI+4=; 
	b=GC99Jqvew+yJLRJmskcV3lWozHTbHv773XQ+SSaciYMxP947kvzh3cyI8IswooJIKWZzdxd97U1
	MaQpcMJUZ+zqTlrrx2rpgvpjSzFxPybWp3yBHbenAfzFiPNhOeavWKVfxKE9DssWtZSm0kaPFTx7W
	AJSHHEF+xqxjOZME6wwwqIkPR8GlShpPe1W+8xcRGwSRh2krAkQg0p7Qc93D9Zn75I3PiaWF9y52p
	8HJf7jcUaN/Q4BBJ+E9FER+QC96arhT4P8+E2B36ZemO6q6pt71RAlUy75TIdo0hYUumFIC2IEMbn
	PXXSN+LFBLINlCGujps7lNUkSuXdWO4J/zzQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w3s0k-00GJAG-22;
	Sat, 21 Mar 2026 16:48:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 21 Mar 2026 17:48:46 +0900
Date: Sat, 21 Mar 2026 17:48:46 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-aes - guard unregister on error in
 atmel_aes_register_algs
Message-ID: <ab5bbqzl-EeKqf7t@gondor.apana.org.au>
References: <20260311113927.305633-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311113927.305633-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_014902_817229_5E42917C 
X-CRM114-Status: GOOD (  14.78  )
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

On Wed, Mar 11, 2026 at 12:39:28PM +0100, Thorsten Blum wrote:
> Ensure the device supports XTS and GCM with 'has_xts' and 'has_gcm'
> before unregistering algorithms when XTS or authenc registration fails,
> which would trigger a WARN in crypto_unregister_alg().
> 
> Currently, with the capabilities defined in atmel_aes_get_cap(), this
> bug cannot happen because all devices that support XTS and authenc also
> support GCM, but the error handling should still be correct regardless
> of hardware capabilities.
> 
> Fixes: d52db5188a87 ("crypto: atmel-aes - add support to the XTS mode")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-aes.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

