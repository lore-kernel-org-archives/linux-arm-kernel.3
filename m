Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD57AC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsoRHD8aMQ2FeGGWT4vMQiPcLcCsPohhSBsh5dfsoR8=; b=o79n4WYqazx6LWiQ2wSs8joZMv
	jy0vm+TkBamzCD4BN6x/+boCfH1XBxjZdwghLFxFFTnVbAFasSK6NbWFnMs5qcTwunnfD4QmWbOrQ
	V39DxpMhHfs6qaF0TQd6TAAmy+pgOqTn39HbtnAluCTg4QvkpY+6L2PpN/P5mc2n57c9UIV4XKvl8
	+eKF56onUKlgImbVAgyq+G7ToImeHxQJ4tPtx96nGotD8XbmGtdGVYXeovVbrVsg9UOKUpN8MeN5Q
	Y+6oYubCkUUg7pOk8tEokcz3hYNgGAwR6Z6w84uEL62bq2VzxBzweGt4n967M9hq8NhKMsYUOxHrS
	4JVSAqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6p82-00000009Cmq-1AIv;
	Wed, 16 Sep 2026 12:52:46 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6p7z-00000009Clv-2una
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 12:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=GsoRHD8aMQ2FeGGWT4vMQiPcLcCsPohhSBsh5dfsoR8=; 
	b=LE0u9hq7xq92TCZFjhSploUls9vq66y9yxFfK53u964GTDRy+KhuMu/k8p/a56krkiZ2t7HRxlg
	OjMnndUbyuM+dLQ8LSEM4JanmRfc3LwsE+0WaYSpVU/NgrFXYnhwnWSOFQWAGy2caN7drtnkjejhe
	lipA3I8mSTSg8VjluPlpWcMSDhrJpJx3o/LGQz/TVq98nwqAm2XoPuWcZTS/+Ee/YCZ+PNrgDMLls
	j45fGqJ7NyWrPdl/LG8kwoGHmrvXapj/K1p9QwFp+kYEbhbty46TnuRlMIw7SMix3yXJ3TMyj5188
	zkbfEqyeb/27UXBdZLhK3FEj/Wz/uzUXbNDw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x6p7k-0000000EcWS-3aNJ;
	Wed, 16 Sep 2026 20:52:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Sep 2026 22:52:28 +1000
Date: Wed, 16 Sep 2026 22:52:28 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-tdes - sync output bounce buffer before
 DMA
Message-ID: <aqqRDIBn_joIAnIM@gondor.apana.org.au>
References: <20260902192323.29337-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902192323.29337-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_055243_735895_289BC5DB 
X-CRM114-Status: GOOD (  20.83  )
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

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

