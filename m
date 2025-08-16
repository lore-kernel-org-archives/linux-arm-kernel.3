Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2472CA0EEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsG18bRLbzBDlWWJBWH8shg+HfW363Y8h4z4QtNnMgU=; b=fhBARMoGRNlrulvNb8Uo5msJog
	VXrppqKMBZBOd9Lwp2vIqi9vus+f5Ps1y4QUHR4FqAmsMsR3Z9RntkRfRz/MvcaaMs68P+XQ9Trgd
	ItmdnxFJi0UI2CyaB0q2HIqZezL5FtgLraYMrDRd/SYuKlSfCYd/tDNvamqZ0BZOiP0FhJwiK53gw
	rUC4fIEZ2XzDQ+8r0WXzPxqzSLbGtlIQ1tzB3Yf+AzdmsfIgoxiBaP+sKXndYB+/O8CWDj3BnRlmF
	8/WiOoDlRkDy5n0ctBaIPCIcnDXt5hT9969mdGpS8Ga4BPNfdIuvH9l7vLIS6jSNsQik2KO00H5KK
	dIas+tQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxN-00000004N16-1A6j;
	Sat, 16 Aug 2025 09:12:09 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCuo-00000004MsI-0COi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 09:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PsG18bRLbzBDlWWJBWH8shg+HfW363Y8h4z4QtNnMgU=; b=ZiQi59f9VWa4kBg1fzLxkP2ppo
	jrHvLfuXVbTM9njC9u0q55rZzV9M6hIzYUZZt3Hnf4BLqMnUeLURy/BDr07PtNgiXKwt9f8wdp4iB
	D7dpftrau1AEU0atNdINFlPZIaH8Zl3r5U7cBQ8oPFOtDZ0sKLu6fBdlznmQg9hZtbNpY1PZrikZs
	BZ5e0SIba6tYlAyjrhmI2eF9og6XMoaepr6sQ5+q6FgaL3FovP58B0TIMGvtwLdM7gu6ksZXg1WIX
	x29TXp40jIb0D//FJauHhJ+VwUkXVfp6sLaoTtzytc2ZacKiIKS/QTGpqt3QSQI5o/BC7+vKlJOYm
	sqyHPrRg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1unCf7-00Em8c-2p;
	Sat, 16 Aug 2025 17:09:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 16 Aug 2025 17:09:14 +0800
Date: Sat, 16 Aug 2025 17:09:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] crypto: sun8i-ce - save hash buffers and dma info to
 request context
Message-ID: <aKBKul0unf06oBiV@gondor.apana.org.au>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
 <20250728060701.1787607-9-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728060701.1787607-9-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_020930_085737_7FE88640 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jul 28, 2025 at 09:07:00AM +0300, Ovidiu Panait wrote:
>
> +	u8 result[CE_MAX_HASH_DIGEST_SIZE] ____cacheline_aligned;

To get proper alignment for the reqctx, the driver should use
the ahash_request_ctx_dma helper.  Of course, the reqsize should
also be increased by CRYPTO_DMA_PADDING.

For the struct member, instead of __cacheline_aligned use
__aligned(CRYPTO_DMA_ALIGN).

> +	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE] ____cacheline_aligned;

This is to-devce only, right? If so it doesn't need to be aligned.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

