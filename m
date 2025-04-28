Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9CDC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCIxb6KxtNgGIni8qVkGyXOpNxUgqN+zGP49XIJbcO4=; b=FGWvUyuX3sjEx01ySMsfBkVTam
	FRlR0qsGnTUaC1tkCupubKZ4Ri9AoCEILfLncesDC1jXiV4SA3ioKONiRpeM8eze1SSm55/DoOA9H
	L+01xUSmF9eYVm4dpslNm8mri9tT6qwCYgSqVMm/GP2wJmY7NBQvUbY30t7otofcxp3Gmh1pP/5KA
	jtJviUcEW+phA62AI8c2lmAQDz9DQhAP/If1qPyB+c5JIfMWzZACUY5rk9dt/W9MLPk0ImPalaIzu
	yTEWa6JV6CJKcUsX8KcTCGr3RJy3XHsdmr0RlgCTlCftUXuz0nRs6iEQwSA56A4j0uBsUeCnUiRnw
	G3KDOtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NWa-00000006Aa0-27nk;
	Mon, 28 Apr 2025 12:23:52 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N3R-000000062zg-1HjW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JCIxb6KxtNgGIni8qVkGyXOpNxUgqN+zGP49XIJbcO4=; b=ftXANzCm1LJpcwaENbP4y31DDi
	ntSqRpGQPeDv7PSeZDzzFM52Z/iBy5NTS1bFHvL9J6Up09bizKQLhAUwuhvpG6f6FxJg6V/H/iSt5
	qwyxWypIr6w20qjwRiZv/Tt6ywzhAzoJtZs+6e8L/Tey3Xenn+2/CKjlh7PFnBYme4Zf09bIaOnoj
	pd01Q7W6LGXWMqnwvKlD6gORLiHKImi00AF7s8s6LlJfbnOy2necdUj7JKA8t+a1PraGCfRRJ3tHX
	Tq+6bKxdzUkdU4ySyeOhqeLK9sD1ZJeEZEnStazX2s5rd6qU5V62mpnwSBSbt4wGSWYUf0haaaYpr
	e9SpAnZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9N3L-001bJb-0u;
	Mon, 28 Apr 2025 19:53:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 19:53:39 +0800
Date: Mon, 28 Apr 2025 19:53:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] crypto: sun8i-ce-cipher - fix error handling in
 sun8i_ce_cipher_prepare()
Message-ID: <aA9sQ5p9_wQ2Vmhb@gondor.apana.org.au>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_045345_343728_B9FA9B2E 
X-CRM114-Status: GOOD (  15.71  )
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

On Fri, Apr 25, 2025 at 03:45:14PM +0300, Ovidiu Panait wrote:
> Fix two DMA cleanup issues on the error path in sun8i_ce_cipher_prepare():
> 
> 1] If dma_map_sg() fails for areq->dst, the device driver would try to free
>    DMA memory it has not allocated in the first place. To fix this, on the
>    "theend_sgs" error path, call dma unmap only if the corresponding dma
>    map was successful.
> 
> 2] If the dma_map_single() call for the IV fails, the device driver would
>    try to free an invalid DMA memory address on the "theend_iv" path:
>    ------------[ cut here ]------------
>    DMA-API: sun8i-ce 1904000.crypto: device driver tries to free an invalid DMA memory address
>    WARNING: CPU: 2 PID: 69 at kernel/dma/debug.c:968 check_unmap+0x123c/0x1b90
>    Modules linked in: skcipher_example(O+)
>    CPU: 2 UID: 0 PID: 69 Comm: 1904000.crypto- Tainted: G           O        6.15.0-rc3+ #24 PREEMPT
>    Tainted: [O]=OOT_MODULE
>    Hardware name: OrangePi Zero2 (DT)
>    pc : check_unmap+0x123c/0x1b90
>    lr : check_unmap+0x123c/0x1b90
>    ...
>    Call trace:
>     check_unmap+0x123c/0x1b90 (P)
>     debug_dma_unmap_page+0xac/0xc0
>     dma_unmap_page_attrs+0x1f4/0x5fc
>     sun8i_ce_cipher_do_one+0x1bd4/0x1f40
>     crypto_pump_work+0x334/0x6e0
>     kthread_worker_fn+0x21c/0x438
>     kthread+0x374/0x664
>     ret_from_fork+0x10/0x20
>    ---[ end trace 0000000000000000 ]---
> 
> To fix this, check for !dma_mapping_error() before calling
> dma_unmap_single() on the "theend_iv" path.
> 
> Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

