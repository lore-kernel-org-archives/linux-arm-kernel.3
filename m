Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F17C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d86Tf0LllrXXpe+yggb0gJXtQSGuOtZBdvyxrLeFofM=; b=LNP7J5JU05GQZ4f8XqxKXz64LS
	hwCNS+37jPzWJDNDcU6mpf68JMEk+Hs5eeaBdj0yb38KIst0GEun2Z50bIcAoJMJEXDtmoKa2axFW
	qmV7eVR3Y9y9vv38ejMiCkndm+U8LWLQFKxOJVjmay4FWi4R8Wg6J4QZ5+Z1CJ8AoR6NiWTD5svSR
	PyOACz758K+cWpMpdciAMklsem82dZhbuteDs5WyCGiCjeqt0FGDPssvN+Qf9daQw9fWtU7xXZ5GP
	bZUikXJ8itHZkH84ljOsIuIYluDLzYPMwyKO6KONVF+/tRLMpfO0je8cnhi14+hJh74zZHCzCZhXW
	ejjy9IKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6p8n-00000009CuO-3sLr;
	Wed, 16 Sep 2026 12:53:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6p8l-00000009Ctd-2KLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=d86Tf0LllrXXpe+yggb0gJXtQSGuOtZBdvyxrLeFofM=; 
	b=tM1doCnjaU5WeMhOXF7rJ8vHCR2pK2UIp4JEwU2GFPbWi89ekVLHxquWQB/ij1vIKgUvbybiwEM
	S9FF1kV0uGkYcI29bx4aVhL5Tju4moOY09AhcKV30CXPLx2X1AE/cFjSix1BzWOk9Pw8jWRKH9Ghf
	I06a0I/U+yCeLQiN9qWjIM9iCpKS3xrxMZ1sUZmnBLB14noURu8MP0mTDenDZ/3THFEdCixfC4dV5
	SZnPbf3LvPAF0Fnm8OolNkxf8rsxsSnozCNB3ewEVUwfAOIudWwiH92bkm2Kirp0VLYk5pDiIdfbC
	eqnvkdvatQn5K9pEnDQLgAGNH6ZvCIcBSYhA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x6p8d-0000000EcXk-3WFx;
	Wed, 16 Sep 2026 20:53:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Sep 2026 22:53:23 +1000
Date: Wed, 16 Sep 2026 22:53:23 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - simplify DMA buffer initialization
Message-ID: <aqqRQ-vn3l2-bjWs@gondor.apana.org.au>
References: <20260903210845.162790-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903210845.162790-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_055331_593362_5B029DD8 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu, Sep 03, 2026 at 11:08:46PM +0200, Thorsten Blum wrote:
> Calculate the buffer length in a single statement and simplify the error
> handling. Inline the dma_mapping_error() checks and return -ENOMEM from
> the common error path. If mapping the output buffer fails, unmap the
> previously mapped input buffer first.
> 
> Also use dev_err() to log errors and %zu to format size_t, and clarify
> the error messages.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/crypto/atmel-tdes.c | 36 ++++++++++++------------------------
>  1 file changed, 12 insertions(+), 24 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

