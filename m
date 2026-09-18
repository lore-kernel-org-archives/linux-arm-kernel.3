Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8154CC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cBmi5rDcDFE4LGowyANqWcanFUVM4w4mUVj3rI8W3A=; b=EJE253ryjmf/nMJblGS5XaCbXR
	8FQuZ9SSUe1RSbdEk1qYGg8Hz7+rUvj5VP8ZUvqbqzHiEGULepS2mMvHkoXyg+H63cneUHK4ingxa
	Vm83BiV7csAq3BS2J4mThSO/D7GOtyLmMVrmxkC74ZbDs6rb2uU5rIqkiXJX/6wI3MmvBqEV4VlYH
	Ncls2C2Sgoi5NettJBYWaH2GuMqTHMTW8KBWqIbuxHcNYcNpbRSQy+tGthRlPREhSnA6OqwPaq+RP
	IyU1YYmFc3g5Yy4FS+VC+/IfeHvGvH3TFWEqsgqoSLSrsBcRYeHBnB+USa5DJ6tiRW1Xa1nJZN5Of
	wkmQzjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIF-0000000E05i-1a60;
	Fri, 18 Sep 2026 09:54:07 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIC-0000000E04N-2dAw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=4cBmi5rDcDFE4LGowyANqWcanFUVM4w4mUVj3rI8W3A=; 
	b=e0p6U52gOhCU3lyAaPCzlSbYYI0QFrwvYvylH4nlyFQGDdzWr2k+Qvjti/fLzTRXzLdv5znegfj
	nXXEaHW9xEYXNaRVJWU9YIKVOYGpGuJJcWz8JEkS/z5xSEUFna9Vj0xK3XObWAl6IIgeX/4OxZHc9
	mNAIMXlTf1vUg+KcOjSP6NV/Ck4kxd2Nk2Zlpe2H/VNqKqFHp5Drxu0Wm85cwvSbWVqll0BG3JQph
	75JhRLpZhWLnEJGg4U5UWxAZQ71cggqwZFZmY3iLUD+XocRCbSS42U2BvTdEoXylujZsR5Pr0q6Ut
	i0URYBs3RzoV6faKoHnNG1opeceyVs31W6uA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x7VI4-0000000FM0t-0qcl;
	Fri, 18 Sep 2026 17:53:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2026 19:53:56 +1000
Date: Fri, 18 Sep 2026 19:53:56 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Harsha <harsha.harsha@amd.com>, "David S. Miller" <davem@davemloft.net>,
	Michal Simek <michal.simek@amd.com>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: zynqmp-sha - fix NULL pointer dereference in
 init_tfm
Message-ID: <aq0KNOqblAfdG-NF@gondor.apana.org.au>
References: <20260908075339.396499-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908075339.396499-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025404_662092_D5CC097A 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, Sep 08, 2026 at 09:53:40AM +0200, Thorsten Blum wrote:
> zynqmp_sha_init_tfm() checks crypto_shash_statesize(tfm_ctx->fbk_tfm)
> before assigning the fallback transform to it, which dereferences a NULL
> pointer since the transform context is zero-initialized. Use the local
> fallback_tfm pointer for the size check instead.
> 
> Fixes: c1dd353d18e5 ("crypto: zynqmp-sha - Make descsize an algorithm attribute")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/crypto/xilinx/zynqmp-sha.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

