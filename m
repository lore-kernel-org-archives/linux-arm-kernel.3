Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF1610ED64F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c12kSdprXC39vKCXXFKji6j7eF/JjYqJMcZ0t574Ubo=; b=y3y1NJGI5aSEbjP8e8SB/xWEW0
	zgxP2d+gefXgXgx2CQ4xySXjP8xJKcbjEvKYtaYV0bqN/fDX2gj31uryPiZTQXLKN4isU5TmlmwDE
	oOlQLuPAAozTUrGf98xOx5o1IGbkViPPWLaRecKDFn56bf+kBPS9ofy0a5yHFoHU2AjltXr9B+lUz
	9Mek7N9z3r1PDPZvnKRAdeYpEzstB7kMNfUUkkVCZW2pAh9IiOJlgPUPdQt2Gw8sqYmu/FYDQmep+
	O/+Q1lBDbRCrm39qH02/XVmvaZW9JsuMszmD0b6NzpTZ33zRrYKK5nAPdFgPGKrMSVYRiAh4dpPn1
	arRZgwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w647V-0000000788I-3YYP;
	Fri, 27 Mar 2026 10:08:49 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w647P-00000007878-3kac
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=c12kSdprXC39vKCXXFKji6j7eF/JjYqJMcZ0t574Ubo=; 
	b=jBYSXik0SFiBONhs8ZtSl9Eh2coka3evQ7RheiY02Gfy3rufsMAH/8YDsyQJk/Pot2tM+rB123n
	h34NTdyT1ALO6kevY5C3moaTyJedrrW2G1zeG7Das3yl69W4SLQKE9RmeL0WQTbBhQcHbdFKaCgCU
	p5+wgD2eCp5pWCcduMb1Wc9vZ5g+aazxYFCuKQMnXmil2ZlcEz+h1fVBnjwBXxdG4Cx/2ati27VnU
	Wtc53CjM6juKmqN9jvvqQCnT9h2G5jg3pcE0+0VLxDX6Z2ziGwTC8HjF4am+6ok5ddLqlNyDnumRj
	4iN8MXpHuPMikMfXJmAqoxD6UMWka5w0LtgA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1w63hh-001bo3-3D;
	Fri, 27 Mar 2026 18:08:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Mar 2026 19:08:28 +0900
Date: Fri, 27 Mar 2026 19:08:28 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: stm32 - use list_first_entry_or_null to
 simplify hash_find_dev
Message-ID: <acZXHNMdYNgQfxCb@gondor.apana.org.au>
References: <20260320084914.7180-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320084914.7180-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_030843_935402_F0118488 
X-CRM114-Status: UNSURE (   9.69  )
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

On Fri, Mar 20, 2026 at 09:49:13AM +0100, Thorsten Blum wrote:
> Use list_first_entry_or_null() to simplify stm32_hash_find_dev() and
> remove the now-unused local variable 'struct stm32_hash_dev *tmp'.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/stm32/stm32-hash.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

