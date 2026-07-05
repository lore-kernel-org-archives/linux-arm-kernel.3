Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CBBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3JkHKn7CYnIQUIHAEnygms5epVvFw1YEAPwLWruV2k=; b=vbK5BhyCmvA0IPnPJ/sVs2mAQb
	nYArlWWdBCXGwZdFsHen7mxH3zaQ0FvMG0AosrUH1qrMxC4juuKdJTePivy91PlT3DYqCReNt67ZT
	qHEVzw8Q+GOgqrx60s7BMZrhW6BwS5u2UcvwZ1iKzmIXNkvvUNRQHqOkZG1RUv9GE0JPqIioBC+Mb
	ZV3qvnheIykB+eEY1qnWIf9hZoV17Tz/oPrC1Zu6zTlMotXXizjPF/vT9K++JORceOjq6ZWEW4A6Z
	XJIdyGKZqD08IEjRdFuEmn0Iexxw2d1n3Xsr7rNr8UZGdIsRIkbHpYjKh6/OdlT2N1HGpjfRtpA5r
	AE8IcR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIMR-00000009966-2QYU;
	Sun, 05 Jul 2026 08:37:59 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIMO-0000000995e-3lP6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=G3JkHKn7CYnIQUIHAEnygms5epVvFw1YEAPwLWruV2k=; 
	b=P5tpVYVL7QJAYSVvr12KGJdoAQCrQaDLcXkP7hPBi1Jm+R8YbaYXcyMXjrtwQUDwdWoLz/JcFtC
	Js8XsE/rbKykCddxK6jqX1jpcZ22BJaKnGsdMe1xV9uiUokY6m5u78XpewEnlpEYcxbbVcMX3hU3J
	5BR4UdkyC/PIEg3KGd6a8FFPCoz0+J5mQtcvUjWew4vZIt9RIv+uDUXTGwpEFhfiHpJRF+OHyEhaF
	JyKpGON3/BTK96db4RZ96lDPQk8i8kTqtGjPmTPD8t2E2duAYJvkAmYDAVoSFRbWPOulTK3qo1qhT
	6dFE4i0DASPGm8J4Xe6soqcMtecdBm5ziC5g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wgIMD-0000000Al4S-41ay;
	Sun, 05 Jul 2026 16:37:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 05 Jul 2026 16:37:45 +0800
Date: Sun, 5 Jul 2026 16:37:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp - fix source scatterlist length access
Message-ID: <akoX2XUWuBezygdK@gondor.apana.org.au>
References: <20260621192615.277957-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621192615.277957-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_013756_937524_518A6FF2 
X-CRM114-Status: GOOD (  12.40  )
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

On Sun, Jun 21, 2026 at 09:26:16PM +0200, Thorsten Blum wrote:
> mxs_dcp_aes_block_crypt() uses sg_dma_len() without mapping the source
> scatterlist with dma_map_sg() first. Therefore, sg_dma_len() is invalid
> and could return zero or a stale DMA length, causing encryption and
> decryption to process the wrong number of bytes when
> CONFIG_NEED_SG_DMA_LENGTH=y.
> 
> Use the original scatterlist length instead.
> 
> Fixes: 15b59e7c3733 ("crypto: mxs - Add Freescale MXS DCP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/mxs-dcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

