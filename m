Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF55FD6CFD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLUWXUHo5Q/GmBrApC+e/MrzWDT+tmgwBy88fymy8h4=; b=faniFbfp4/jYap+b2cHig5ABbZ
	JzCNKbw5gkY1FWqGYy4uf9qD8VX67wQlOU4NVdsYewE5YRB3EJoGy4Do9EbMSbTEx19Zpeg0Cm3pT
	QdT7pF8ytccc6hOS2LOf80ajkGLK+MgraraBNVqU+BiaUHxGqtsY8okXYMvaB+hlGuPskMHKhnj8/
	OYfQM1VQvfnKi+BbZ5Ffgv9EQ17Gi/xQaII2o4ov9mpaN+fmk6pitu3TwEWbPZNFqwVLx3t9c3ysz
	8FFHCpV4EfKeOw3oa2GAZSDygcluTbT/Ln4bYTc9ff1m3H+rSHeZUqyF40Y32z+WKEdSKImvpfbAs
	8WV9MoAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAD3-00000008GAk-3K4T;
	Fri, 23 Jan 2026 05:59:53 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAD1-00000008GAE-1vLk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 05:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=oLUWXUHo5Q/GmBrApC+e/MrzWDT+tmgwBy88fymy8h4=; 
	b=jvZ/Ou6cZ8VQ2jLiwnAcGfCVe8LX2Vv50ho5wWfvf49+xLbAwhB1I8DtCrWH38mmKwPjOPp//ey
	isfPgJlA1HF0+l4K4931Y9XRnQolxGBVtUVbne3/yTU+xVKWlFXo9Vx4OZHsdkveFjWA0RbRK6/U9
	RG80592jE7FL1lPAIC698eJf9ZvXvMkCEHHYbuSUf1qodiNCl/k3TUdiNi80rR9ykpujDRhNgo8/0
	nXF8ZIyN4sblCrhOApGDZbcz7MRzshdg5vf7/X1AWHMZypIB2ACWybr5ZJBJSbDsVXrhhqp7W55ut
	9o4ItGEmizPC04MVdoyvGtlCwtgbT4BlzTXA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vjACn-001VPJ-00;
	Fri, 23 Jan 2026 13:59:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 23 Jan 2026 13:59:36 +0800
Date: Fri, 23 Jan 2026 13:59:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: testmgr - allow authenc(sha224,rfc3686) variant
 in fips mode
Message-ID: <aXMOSCt5Yzfk8vTI@gondor.apana.org.au>
References: <20260101152522.1147262-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101152522.1147262-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_215951_496271_C170FB98 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, Jan 01, 2026 at 04:25:18PM +0100, Aleksander Jan Bajkowski wrote:
> The remaining combinations of AES-CTR-RFC3686 and SHA* have already been
> marked as allowed in 8888690ef5f7. This commit does the same for SHA224.
> 
> rfc3686(ctr(aes)) is already marked fips compliant,
> so these should be fine.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  crypto/testmgr.c | 4 ++++
>  1 file changed, 4 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

