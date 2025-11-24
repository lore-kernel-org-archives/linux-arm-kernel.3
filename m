Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C4CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcui04wUrJGLCUSACMGAJjVCbT+7fdon+daQNvMd9Zo=; b=LFJig2MUXbkiIFRRt6uMxSwTae
	k27kHQHY72ZT2bafW7iV5DDi+0Ir3NTbxOrwufc+JDV0tuNd8Ap35nlj0dekhpym+avDC2IqF1mKz
	kSrerZpxAKPS6jCQncLww3plKNfzxDdH86ckD+LRdW9IS8w8ynULONhlN4onfoyiAbJ+iZx0uepB7
	VXKXwTdIRGOwcp7EwTQ9iLXiUGC44Mq8TZuQzfWLE4gJKTgbYUwpTQSc9zm4GzDX0OzznxCYbTCXG
	oXMkgL786cg/LMiIxWqV2mlbn9s0AQtmwW2Xtlbe+gCKDGeUz/LCO0K6COTfwuMOC3ds28qAtjT23
	+PVJ+gcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTC2-0000000BNLx-0QOP;
	Mon, 24 Nov 2025 09:49:10 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTBy-0000000BNLA-23oD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 09:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=bcui04wUrJGLCUSACMGAJjVCbT+7fdon+daQNvMd9Zo=; 
	b=Gzok8FeUMi+72XYChLg5NvbnOmmS+6/dobmqOxyGZ3EPUr1DGs3dCT4nf7Jc6igiIg5VlkExM5o
	qfujUK4WYscZTivMF+W8YXg2ONdVoBVzpzgN0wY1o0UZwbUtE/1gcb8ZVOw2UyqUtlp/CWYs8rUN+
	WORtHCOxERS6jw39KJmj7/byJ2NqyWj9AXalsRX+tdtzNcuxJLiutXJHNJjxe9tlE9u9JPMvvyoq+
	xMShLX8tmDs/5pUnSHRsqBbSUoFBWF2H/G3YjU/nIUG8cjGFmn8k/4R1I0dEvk3uC/Gmqj+XQKik5
	R7ZZ8jTss3SADpVdsGTRydaFYdPiR4NSVq6A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vNTBT-005XMj-1s;
	Mon, 24 Nov 2025 17:48:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 24 Nov 2025 17:48:35 +0800
Date: Mon, 24 Nov 2025 17:48:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - Add missing DES weak and semi-weak key
 tests
Message-ID: <aSQp8x2yrLTZQ-lj@gondor.apana.org.au>
References: <20251117114426.99713-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117114426.99713-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_014907_135537_8AAD2537 
X-CRM114-Status: GOOD (  13.92  )
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

On Mon, Nov 17, 2025 at 12:44:26PM +0100, Thorsten Blum wrote:
> Ever since commit da7f033ddc9f ("crypto: cryptomgr - Add test
> infrastructure"), the DES test suite has tested only one of the four
> weak keys and none of the twelve semi-weak keys.
> 
> DES has four weak keys and twelve semi-weak keys, and the kernel's DES
> implementation correctly detects and rejects all of these keys when the
> CRYPTO_TFM_REQ_FORBID_WEAK_KEYS flag is set. However, only a single weak
> key was being tested. Add tests for all 16 weak and semi-weak keys.
> 
> While DES is deprecated, it is still used in some legacy protocols, and
> weak/semi-weak key detection should be tested accordingly.
> 
> Tested on arm64 with cryptographic self-tests.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  crypto/testmgr.h | 120 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 120 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

