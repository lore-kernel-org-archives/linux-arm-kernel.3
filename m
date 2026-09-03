Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5556C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBU02k+XzoPdmqydAHzpAb3ZuayNpJVBxKlMr3WuRYg=; b=1iofxAh+ZXhrBkXV5j5T24uhZT
	BVfvLJ5smHtX8aBRrsz8iuSjNIKDFQcJ6p+fS3SchDjonELmKStYY6utCaE4KVi58B6BTVqJNoffd
	JKwBbvliv430ZjWrb9NyiH/+4Rhb4ZlU1FqfBpgYUmYajZGpdYyChYCLd2eiws5fsM9onWeHm1oOA
	Mh3ok9E8y+HWTR0pI8VVLwEe9r5LagAnRlAETKQNLXxRV6JT7xyiqZ5v4HUSiDNTvZUeUFF9Syo8k
	wlY51PVvkOMFO/9+5pucqkOqIDWKRhNDZHQXy9FdWAe6Nfh/Gp6AmwmjhzARRyr5Z8nlXH4L46Gov
	maVHKamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28L0-0000000HVIi-2CZZ;
	Thu, 03 Sep 2026 14:22:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28Kz-0000000HVIY-0VwJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:22:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57FC96053D;
	Thu,  3 Sep 2026 14:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FAE1F00A3A;
	Thu,  3 Sep 2026 14:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445364;
	bh=TBU02k+XzoPdmqydAHzpAb3ZuayNpJVBxKlMr3WuRYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cIhg8xkn3Mywk8kIj3Ub4wIHzfHVb0eF7oGn4PLX8QhuU52NQkoZAHtYCD5zi6GWn
	 btEGAIIDNx5ByqjIvykDRg6/GwjX5iwaOffsQ2JI2tjS+dIP+JALtqUlJMK98FL6dS
	 PSN88Dh4X0ODr4IknsHJUF70cbjZC4TLBcVDFcRRK4XBBWJA7eolNdjSFjeimr7GBN
	 oicWSWBy1UioLwk8QpUnTjbB2IJ+OXDBZoaZ5X204/SSfz//A+LGJINrmYVLNuTCQD
	 pX0YmGuIk5i+jZZkL4B3hV2er8APlTcPt2H4k4pe4Xx8LcBD6oSKRNaWFVF52eerS7
	 jEZ/WKgKGudwg==
Date: Thu, 3 Sep 2026 16:22:38 +0200
From: Thorsten Blum <blum@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-tdes - sync output bounce buffer before
 DMA
Message-ID: <apmCrvihjaMSr_Dd@kernel.org>
References: <20260902192323.29337-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902192323.29337-1-kmehltretter@gmail.com>
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

On Wed, Sep 02, 2026 at 09:23:23PM +0200, Karl Mehltretter wrote:
> The slow path maps its output bounce buffer once at probe time with
> dma_map_single() and DMA_FROM_DEVICE, then reuses the mapping for every
> request.  After the CPU copies a result from the buffer,
> dma_sync_single_for_device() must hand the buffer back to the device before
> the next DMA transfer.  The driver omits this call, so cache lines from the
> previous result can remain valid while the device writes the next one.
> 
> This bug was masked by the completion paths calling
> dma_sync_single_for_device() immediately before the CPU copied the output,
> where dma_sync_single_for_cpu() was required.  For DMA_FROM_DEVICE on
> ARM926, dma_sync_single_for_device() invokes arm926_dma_map_area(), which
> invalidates the cache lines.  The misplaced call therefore discarded the
> stale lines before every copy-out.
> 
> Commit c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
> correctly changed the completion paths to call dma_sync_single_for_cpu().
> On ARM926, that function invokes arm926_dma_unmap_area(), which is a no-op.
> The missing pre-DMA dma_sync_single_for_device() was therefore exposed on
> ARM926-based SAM9X60 and SAM9X7 SoCs.
> 
> With CONFIG_CRYPTO_SELFTESTS=y all four DES/TDES algorithms fail on
> SAM9X75:
> 
>   alg: skcipher: atmel-ecb-tdes encryption test failed (wrong result) on
>   test vector 2, cfg="unaligned buffer, offset=1"
> 
> Call dma_sync_single_for_device() for the output buffer before starting DMA
> in both atmel_tdes_crypt_pdc() and atmel_tdes_crypt_dma().
> 
> Fixes: c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v2:
> - Reword the changelog and use full function names. No code changes.
>   (Thorsten)
> 
> Link to v1:
>   https://lore.kernel.org/r/20260829045316.92931-1-kmehltretter@gmail.com/
> 
> Tested on top of:
> 
>   crypto: atmel-tdes - zero-initialize device state
>   https://lore.kernel.org/r/20260829035821.67220-1-kmehltretter@gmail.com/
> 
> Without that fix, on the tested SAM9X75 the DES/TDES self-tests hang on
> their first requests before reaching this test vector, so the failure
> fixed here is not observable on an otherwise unpatched tree.
> 
> The two patches are independent and apply in either order.
> 
>  drivers/crypto/atmel-tdes.c | 4 ++++
>  1 file changed, 4 insertions(+)

LGTM, thanks.

Reviewed-by: Thorsten Blum <blum@kernel.org>

