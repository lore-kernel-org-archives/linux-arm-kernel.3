Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97E1CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2Ray92q6Vmgf55HUr1VGCUVBdkkO0DjyIM5lhthz7I=; b=YAMK9AU79870yWlLY2WFqwyMge
	E9+JIqqJ81xGe2SuZC6H/ya+k12sTC2tgzPSivhWH3LusPoD1oeZ0evTqL9gLCpORmhFn43E1CpNW
	7UMJMjDTtCdnnIwB1NfC1z+17VPn9Mh0UaFnYtJ/lwDldWll9Ohn6NckPpgSPkGadtPHpWh5JiX9r
	FhiWBKy8YFziTBaTBmRbHtri9Z3FHXcecNIUiloo0iz4kkz0e8AotYF/ne5cS1n9iTJ63NySy4eGd
	WiwwiHcJo1q6VyInDY0IkCyLxNc3lLHjBR8fMVJOZSyWCv+R75ewLQeT7CueA1Ye0CVmmCVNNKLD7
	hR4XG6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjbD-00000003tVN-2pJA;
	Thu, 08 Oct 2026 08:35:35 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjbA-00000003tUX-1MNQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=s2Ray92q6Vmgf55HUr1VGCUVBdkkO0DjyIM5lhthz7I=; 
	b=EJN7pIsIGeo72dNY8XzKRQTcAWf5B+9ncRDI9R8bdlKZfx7YMgi4PDZPhZLbsLQ6x+ptNNyYXjU
	CW2IQf3doIlkXneU9b483E5eZSkxbgxEfgy8glz7H78FGx8dZL184T5GJGiGPbueP0MPGAnUBVYuk
	bLkzm+4dleewvrj+tYMBZISKr7aRdeWSWWJdcsL2BPUwK/5kF8tBFyanWxuBpSbWl3aGZa3qUyj4L
	Npytki0Q3iodeQjwVXI8d2JExSeUmwPvHSXrPPvzYGE4Em2R8iCs8cEGKqIjkLY+4VH8sU8nGXW1I
	Pb5F2msazMk3lP1jMgw6WhcLa7Kk2L9Ovo6Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjaz-00000001o7M-3enA;
	Thu, 08 Oct 2026 16:35:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:35:21 +1100
Date: Thu, 8 Oct 2026 19:35:21 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	Eneas U de Queiroz <cotequeiroz@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v9 00/14] crypto: qce - Fix crypto self-test failures
Message-ID: <asdVyUKWndnZ1Mxv@gondor.apana.org.au>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
 <ar9qNirrzOTDLipN@gondor.apana.org.au>
 <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdRBu5gg7Q3pz8Wn9Da4RpmmiKLP2-LwiszKCd3o8jQdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_013532_382557_08ADE7D2 
X-CRM114-Status: GOOD (  20.78  )
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

On Fri, Oct 02, 2026 at 10:31:41PM +0300, Bartosz Golaszewski wrote:
>
> > Please check the Sashiko comments:
> >
> > https://sashiko.dev/#/patchset/20260922-qce-fix-self-tests-v9-0-b1aa742e79af%40oss.qualcomm.com
> >
> 
> I've gone through them. None of the issues were introduced by this series, all
> are pre-existing. I've added them to my list and will fix them. Can we not
> delay this series any longer and instead work in smaller steps since the crypto
> algos will be disabled by default anyway?

The very first comment appears to be pointing to new code:

> > +/*
> > + * BAM DMA cannot handle zero-length transfers, so the driver always holds
> > + * back at least one byte to submit to the engine. A zero rctx->buflen at
> > + * finalization time does not necessarily mean the message is empty: the
> > + * caller may have imported a state that already reflects some hashed data
> > + * with nothing currently buffered. Handle both cases through the software
> > + * fallback: reconstruct the running state when there is one instead of
> > + * assuming the message is empty.
> > + */
> > +static int qce_ahash_finalize_zero(struct ahash_request *req)
> > +{
> > +	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
> > +	HASH_FBREQ_ON_STACK(fbreq, req);
> > +	struct __sha256_ctx core;
> > +	struct scatterlist sg;
> > +	int ret;
> > +
> > +	sg_init_one(&sg, NULL, 0);
> Can this trigger a kernel panic during zero-length finalization?
> qce_ahash_finalize_zero() creates a dummy scatterlist by calling
> sg_init_one(&sg, NULL, 0).
> sg_init_one() unconditionally calls sg_set_buf(), which attempts to resolve
> the page via virt_to_page(NULL).
> If CONFIG_DEBUG_SG is enabled, this triggers a BUG_ON(!virt_addr_valid(buf))
> kernel panic, because 0 is not a valid linear map address.
> If disabled, it results in a bogus PFN being stored in the scatterlist,
> leading to potential invalid memory access during software fallback operations.
> This path appears reachable by untrusted userspace via AF_ALG performing a
> zero-length HMAC finalization.

How is this a pre-existing issue?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

