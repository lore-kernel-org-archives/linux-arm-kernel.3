Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD1CCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXm+uHlHfZgedQy7awQGODnu0Y7BrstQqwvkQcn0G/I=; b=DTCA4kpCkmjx0mDbI+2u60Pvdu
	OXifBLebmLy3FfLWuYtXei1RuIzEr7CtfRYL19yfe3ahbo9x6T9N8YVZlDHe492J7QdhPpOBowssR
	tYFiile6fYY+bPeaePASS+Qp0JSDQWuSdFiNdGtFFQYuiUpKOsht0AEKZDnM3v+UKpOBo1Kb1eIYI
	SiZRdkel1e7R31HLce24kSUJFC03KFBXHHN2MVSl4WLdYbXg6c0Yes/D10mrDHUsDTWJP7N/ROxXZ
	ifixRw3Ya1Gpo5NwBR4f3XMeZbXfQSWHfUR142A/FDuuPeNx5yOU20YLj2VJEwNabll6kms0ii4IX
	R5TtxWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYXH-0000000AyNQ-3NBt;
	Fri, 02 Oct 2026 08:22:31 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYXF-0000000AyMh-16Y7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=GXm+uHlHfZgedQy7awQGODnu0Y7BrstQqwvkQcn0G/I=; 
	b=Z3oarPXVmBdSH7uO8JIcZjqyZ8sV2zsrQm7KUmePRt3EVssn9iQA8vDHfq7TNxptA21gXbjb0ls
	K2fbRSeGdUI5/ygNMg7Omn8iFozvQW82oiOqHbovWAv6ZzpveC2zhx7yMb0hlxHhtrCTQiPswHwaI
	R+d9zQDfnF52RXW1kUPTaM/OexYAUnis0czxpig/71WQfq48wlQfcwSL1TmSgE+P9pcXHsaUfsMn+
	O6Y3G2UdP+LZKY2WDClQeUUl7thzeLbKkPiI5MSuXZz6NDePPWNIGLlOHvu/wyn9XnEeAjbhd5h9z
	dV0RyfqludBoUefYW5I4lpC3IFqWQKxCgRvQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xCYX6-00000002mc7-3Pgz;
	Fri, 02 Oct 2026 16:22:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Oct 2026 18:22:20 +1000
Date: Fri, 2 Oct 2026 18:22:20 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: phucduc.bui@gmail.com
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, davem@davemloft.net,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] crypto: Use pm_runtime_resume_and_get()
Message-ID: <ar9pvDoD-JXb704Y@gondor.apana.org.au>
References: <20260922031954.320895-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922031954.320895-1-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_012229_383493_1835C66A 
X-CRM114-Status: GOOD (  11.56  )
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

On Tue, Sep 22, 2026 at 10:19:51AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series replaces open-coded pm_runtime_get_sync() and
> pm_runtime_put_noidle() error handling with
> pm_runtime_resume_and_get() in several crypto drivers.
> 
> No functional change intended.
> 
> Best regards,
> Phuc
> 
> bui duc phuc (3):
>   crypto: sun8i-ss - Use pm_runtime_resume_and_get()
>   crypto: ccree - Use pm_runtime_resume_and_get()
>   crypto: sl3516 - Use pm_runtime_resume_and_get()
> 
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 3 +--
>  drivers/crypto/ccree/cc_pm.c                      | 8 +-------
>  drivers/crypto/gemini/sl3516-ce-cipher.c          | 3 +--
>  drivers/crypto/gemini/sl3516-ce-rng.c             | 6 ++----
>  4 files changed, 5 insertions(+), 15 deletions(-)
> 
> -- 
> 2.43.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

