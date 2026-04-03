Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA55CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 01:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+USeSNrd+VSsWq4NWpR8STtSmRmf5rBfxlBSk+ilRjc=; b=TXwEEiTVIIJXxDIpMNIuaU8RH5
	m6a3LO5JWQNrqB4hESi6IT+opdI626KwzTqli067W3pvYQdKkKGTHT2Iu4uwmIhVVNmMEZC+ld5RB
	vJSnAVMTT6TXIQPlvQNrNqgoViSlOkp/UoHAI6wHXU7iGaf+8MYsMMChp+4p8rXonEG/erMYMb90A
	Qu83KUDgadG7FFK9Z5H4hEDT9StYSy+Nh4puUkaBRDmpCJL8gkEO/lPpGIA3bnOs+WcD7LoPwcl5d
	vlUUD4Hmx9D0xIyq2tfyuKfVidKVVlq68epQ//hhrGxuqz/Y9UU+8nI/OwpWtbv7Nfnl973l8egGu
	BQcGjzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8T1L-000000010wu-1mex;
	Fri, 03 Apr 2026 01:08:23 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8T1I-000000010w2-1UvB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 01:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=+USeSNrd+VSsWq4NWpR8STtSmRmf5rBfxlBSk+ilRjc=; 
	b=AA08h6YEptjPw1421+YEP9vDDsn+1EuiCqm+5zGTK1lJnsyCbFH6dRC6U9wVkitvpmXzxA+8t2w
	DQtagT41wHKDNp7O2/+JWthWqPJTAxTThvmZFRhY321eAcjuflFwbl6NxXb4WElIJuUGbZPuKfuCM
	Ndi77UxTBrmTKU6KlCayvnb9z15qE/x+jptTlwE+/LGurxByoU7YY6efkhzcHwj0h260Ktt41Fibo
	Y846aq+hjxXFM1lbV/A2IqFBjccVdJLRrZQj8f3gf1mylLTSItiAOTmJJZRLcGRbM8O3zxkDgE38C
	ghrlFACL/aK1Hd5ly5W8x2TOa7BfiSW5xNBA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w8SbY-003R2l-08;
	Fri, 03 Apr 2026 09:08:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 03 Apr 2026 09:08:02 +0800
Date: Fri, 3 Apr 2026 09:08:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>,
	"David S. Miller" <davem@davemloft.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-aspeed@lists.ozlabs.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: aspeed/hash: Use memcpy_from_sglist() in
 aspeed_ahash_dma_prepare()
Message-ID: <ac8S8jLrZrXg8M-K@gondor.apana.org.au>
References: <20260327092418.10476-1-paul.louvel@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327092418.10476-1-paul.louvel@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_180820_400395_9AFF8D4D 
X-CRM114-Status: GOOD (  11.13  )
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

On Fri, Mar 27, 2026 at 10:24:18AM +0100, Paul Louvel wrote:
> Replace scatterwalk_map_and_copy() with memcpy_from_sglist() in
> aspeed_ahash_dma_prepare(). The latter provides a simpler interface
> without requiring a direction parameter, making the code easier to
> read and less error-prone.
> 
> No functional change intended.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  drivers/crypto/aspeed/aspeed-hace-hash.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

