Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4547BC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTb31aJyYEihExlJbMTmTBFJ0xHAaFSqcXJx0OH+m38=; b=XskB5TsoVpGDgOlo7j51UR8Hjq
	tU5nOiWsoZIzNGCk4OJ8ZLhiSYb0gkhihBwBuoQuw39vegDp50FtXugwQTyhivDdO4LODeyCdnQSB
	k12RvoRkPwsVs0KXbDMA30s7DvpYoy3x2X0WuHp2wXQpuc4Z3j7X9Um4f3XP+OQAVrnLRcP4691Vy
	UMpKKtMF0CKgej8GiSti9+dw47b3Mbehrbk9A2Ng164ZluFOvJzXJuD6LQEJ8uxOpf+BcnRqbGQCP
	T4pzamlBBIj7oa0tLED9NBa893ivsJVPpfwxEKXVWR0jQ4M3Wr7zi3nTnd4q5RretDvNst984XMSn
	BGw+GFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oaD-0000000FPss-0bqJ;
	Wed, 02 Sep 2026 17:17:09 +0000
Received: from out-235.mta0.migadu.com ([2001:41d0:1004:224b::eb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oaA-0000000FPs8-47qB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:17:08 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kbN2T3HRxTE8CcU7FkVYnjiHCvTMBx8FujkNyQbwo6o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788369424; v=1; x=1788974224;
 b=mJISh18usSyksGynG0cxc4RIvEDwxbD6UZO69me3t4fCYcBkAmhFblRH4MCX8MCclmC7v3ET
 pvDcw9yrjAovso+kk3C6MLJEbCisS7NOzPaHAr/3PGhpHYA/wOo/i1vEgrFTenEwTKWrGmfibHg
 xnUSzwLfKPw8DyAEK3Y3wukI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 29a99734ea6f9c70;
	Wed, 02 Sep 2026 17:17:04 +0000
X-Mizu-Trace-ID: 29a99734ea6f9c70
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 19:16:57 +0200
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - sync output bounce buffer before DMA
Message-ID: <aphaCSSkk_pDjyqz@linux.dev>
References: <20260829045316.92931-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829045316.92931-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_101707_181322_306AEBE7 
X-CRM114-Status: GOOD (  20.30  )
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

On Sat, Aug 29, 2026 at 06:53:16AM +0200, Karl Mehltretter wrote:
> The slow path DMAs into a bounce buffer mapped once at probe with
> DMA_FROM_DEVICE.  On reuse, nothing invalidates the CPU cache for it
> before the DMA writes, so the copy-out can read stale data.
> 
> This was hidden by the copy-out calling dma_sync_single_for_device()
> instead of dma_sync_single_for_cpu(): on ARM the misplaced for_device call
> invalidates the cache, which is exactly what the missing pre-DMA sync
> should have done.  Commit c8a9a647532f ("crypto: atmel-tdes - fix DMA sync
> direction") corrected that call.  On ARM926 dma_unmap_area is a no-op, so
> for_cpu does not invalidate and the SAM9X60 and SAM9X7 parts lost their
> only invalidate.
> 
> With CONFIG_CRYPTO_SELFTESTS=y all four DES/TDES algorithms now fail on
> SAM9X75:
> 
>   alg: skcipher: atmel-ecb-tdes encryption test failed (wrong result) on
>   test vector 2, cfg="unaligned buffer, offset=1"
> 
> Sync the output buffer for the device before starting the DMA, in both
> the PDC and DMA engine paths.
> 
> Fixes: c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
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

The code change looks correct to me.

However, I find the first two paragraphs of the changelog difficult to
understand. Could you please reword those and consistently use full
function names with trailing parentheses?

Thanks,
Thorsten

