Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30072D74951
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 03:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdIIRvwrrP5I0dgJhDbCGSvGJ1iVpExH7iBures8Epk=; b=O35jUz6JACjZ8qwZHA+vVmUoTx
	6wXf3Nni0putKM8AJ9SP7Gx3MKNPPr0UcKdttNt0K2iMUhyn6321sQoZLoJqsDEhH2ICB2cunE82c
	EQDRLnUzNhtlfbDSFQInfM/d9f1Die/twbfb+E8GNi9JVBPy5eicftrRyWYlm1ttaexIs9f2ACGGr
	C0bPMoVG8BAbmpUB4t3LhJM5786lnW2flJMucwWJPY92yS35OxcTviEKzeeysNN/5fBewcdpXw2fX
	w7Qxb9B17tnX2Q+Ek566GfcQ7goskHRZZ8V0/t2pPRNDeWZ6OGBpLq1Z92Hu3tLznvxXutJRcY7q4
	2tDpb8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWRHP-00000009Yn7-31Kp;
	Fri, 19 Dec 2025 03:35:47 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWRHN-00000009Yl4-30wF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 03:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=AdIIRvwrrP5I0dgJhDbCGSvGJ1iVpExH7iBures8Epk=; 
	b=jt6jMTf8tQSIcCQNhzi7Rdf6sUe4bGYREu8vOyx1XKftpDAWVFhw2ygKqBEo0Xlp9TdYPqMVefY
	LWr5CJiCbGcD2UAs2UtMMRke/61UhKQizlAHiGxVNI6yObEjPUeViCNrw55nDg2a6kCIm0YB6s6m5
	ghZ6FyxBFKBvSNathANEyaBADJVP/oXbj/gsdD9MOfDcNLTXoR4zWJRkS+8etL1hNpnz6SBIV1x44
	cd8d6wHqM3tkJ5lI0fuVxWYXb9AUF9oTxeC14lq9QJWpFnxRgAqiaky49VIULnjrIpsfYQ3UAfDmJ
	UlN4Rm0M+CS3cRQ7vQhmataruYvpgiptAvIA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vWRGs-00BCzv-1e;
	Fri, 19 Dec 2025 11:35:15 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 Dec 2025 11:35:14 +0800
Date: Fri, 19 Dec 2025 11:35:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: jeanmichel.hautbois@yoseli.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Olivia Mackall <olivia@selenic.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 1/2] hwrng: imx-rngc: Use optional clock
Message-ID: <aUTH8q5nejrngXck@gondor.apana.org.au>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-b4-m5441x-add-rng-support-v4-1-5309548c9555@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_193545_786273_67D6DD69 
X-CRM114-Status: GOOD (  11.29  )
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

On Wed, Nov 26, 2025 at 08:08:09AM +0100, Jean-Michel Hautbois via B4 Relay wrote:
> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> Change devm_clk_get() to devm_clk_get_optional() to support platforms
> where the RNG clock is always enabled and not exposed via the clock
> framework (such as ColdFire MCF54418).
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> ---
>  drivers/char/hw_random/imx-rngc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

