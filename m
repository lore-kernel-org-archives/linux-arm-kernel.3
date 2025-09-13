Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3404ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 04:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHPC47bISBOTJD21QN1sdK3DKka3QWCE6WCqPFZ1m/A=; b=xQJtIT9ai4bVA+aiOLzaOiMk54
	O8zYa4qFcqwaxBuRK8QeHtiM9pFqQyVadyUZzlYl08iM17DiNUAo3j49hujytWjOk5G4GiNFqCvFX
	xYN6gvSe1vjVtwd6KwW01navIl2lMtVpA/MuqLixUC4ud6eSK+sVTx13sT4t1odSHnL05UXzliHdB
	gKGRdiGj2QLeVFbiEpFTHPzgJNpGonpXMtFh3p7vysSHsYz0ykegWKYmFSTXs6Kqyj5hWsMdLM27Q
	29fAfkE0RInfrFcRBLTvlUSBu/Kdjz6x1Xv7uJlkYME+gxdINpu+7KlJApws1d6g6FhFeNsRvGfgm
	sT2P99/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxHqm-0000000D9HD-13ZF;
	Sat, 13 Sep 2025 04:27:00 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxHqj-0000000D9Dc-2elP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 04:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=OHPC47bISBOTJD21QN1sdK3DKka3QWCE6WCqPFZ1m/A=; b=S3UByejvjAfvXXVsrAIY1jyvT+
	ZyLm8ROgSUL9qnlJkH/LCC6/Yvwcp4FByNeqfExyAbfDL0WM4L8UJtKM9k8jCbdh5QcytsOTe6UEW
	68NtLuvrFjftByp5AKXDJgJ23lG+gWK2Ba8wOfB2uXUQ9BGhrpUo5YsgVW90EygnjJ0Wdz9GBrri1
	Avzlxlj/DZxM/N9Ak+P0ODLxkw4UHihmwpzIcDcJg5JyBpelM1hOnUE8/ebVn+zf/a5QpHRkuohii
	dRd3VgTXf5lnlq0fMbn9Ewcrz5B4WWPEgF+Q6XMT+8qlHRbTAKdTBJM4Ft/5Id9Tbg3HbimhMyAHb
	janisymg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uxHb1-0053pp-1d;
	Sat, 13 Sep 2025 12:26:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 13 Sep 2025 12:26:39 +0800
Date: Sat, 13 Sep 2025 12:26:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Royer <nicolas@eukrea.com>,
	Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel - Fix dma_unmap_sg() direction
Message-ID: <aMTyfxBfbYgFqQC4@gondor.apana.org.au>
References: <20250903083448.621694-2-fourier.thomas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903083448.621694-2-fourier.thomas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_212657_674501_CF9C1C4F 
X-CRM114-Status: GOOD (  12.04  )
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

On Wed, Sep 03, 2025 at 10:34:46AM +0200, Thomas Fourier wrote:
> It seems like everywhere in this file, dd->in_sg is mapped with
> DMA_TO_DEVICE and dd->out_sg is mapped with DMA_FROM_DEVICE.
> 
> Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/crypto/atmel-tdes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

