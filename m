Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A1AC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAkmSFxEapr/OWEzeHTZRFq6RfOULXKfw/VYTwth8bI=; b=gfMcFUTV2eHIg12P0PFgV0aAgw
	pHuZHfvjriOkBYiFqzAeQ933R/UBYZVohdmmqHWx+IkmRK7EeYm3IwShwm4BpS2xZVyQ4wuk6h9V/
	LhOju3mo0LPlioZzIhdgZ52ab1udek6D7OXpaikpro/+MKUfh5pVrogB2I9hi0dLqNM1vcwE1iPr0
	JKk1l8Z/rX2Y8vsbX3EgJIZZ3QUQ++Pg9Lr+sXiOMbdT5aKkUo7uREzvdq85ZzXZZjp8lHa+FWsL6
	FoUGyHbQjJtPTj4dY+ecEWEzmIVZ/Rk0DpSCJjvGtss6ehbU9Ei8EFXr0QyQuIMI3r9gbAl4tSiMX
	yJ721bPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tpf-0000000FsM2-0wCU;
	Fri, 11 Sep 2026 05:29:51 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tpc-0000000FsLV-1Gx1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=eAkmSFxEapr/OWEzeHTZRFq6RfOULXKfw/VYTwth8bI=; 
	b=ONLiLJSpewQtgDqGoRdoeaEzn8YVSOLdeighfjbG+T89vBc31mRvWLbfFIZPAzRFoHBUXfB8Zyf
	UlPhyM+XKIDWd/J5vHH32HZIsxSmPgec5qsA51QPtmAXmbt+Xb9SZv4LLbu5u88+FS90O5y+Pz3UH
	1L+vdRr32OIIPfHu7XDnIx9R76ySqMgLSFUyQnldk8j7VLZWpRSYv5bteaIdDBj8P49stHCwRHmD7
	uQXEzr98lb3CvYCDElxaBX34f65ehze2za4z834EAN241Y+O0t1uY4r+fpWEAticm4tqMYyx+YwZ1
	YMt7lAziwlfIzLtDV55CaUeP6KRsnVqhES4A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4tpP-0000000Cu8A-2TFC;
	Fri, 11 Sep 2026 13:29:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 15:29:35 +1000
Date: Fri, 11 Sep 2026 15:29:35 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: "David S. Miller" <davem@davemloft.net>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Leonard Crestez <cdleonard@gmail.com>,
	Radu Solea <radu.solea@nxp.com>,
	Franck LENORMAND <franck.lenormand@nxp.com>,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp: handle zero-length skcipher requests
Message-ID: <aqORv0iyPUE2qKep@gondor.apana.org.au>
References: <20260828093209.3179074-1-lilinmao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828093209.3179074-1-lilinmao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_222948_343501_74FB909D 
X-CRM114-Status: GOOD (  12.20  )
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

On Fri, Aug 28, 2026 at 05:32:09PM +0800, Linmao Li wrote:
> Zero-length skcipher requests are valid no-ops, but MXS-DCP queues them.
> When such a request reaches the worker, last_out_len remains zero. The
> CBC completion path then subtracts AES_BLOCK_SIZE from this unsigned
> value when updating the IV, causing the offset to underflow. On
> decryption, the resulting source address precedes aes_in_buf.
> 
> Return success before enqueueing zero-length requests. This avoids the
> invalid source access and leaves the IV unchanged for a no-op.
> 
> Fixes: fadd7a6e616b ("crypto: mxs-dcp - Fix AES issues")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/crypto/mxs-dcp.c | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

