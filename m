Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A461CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5htwdDNdovSl8zMRcQaZ0+OenMBudJKvhypafkwFKY=; b=hPEfpfLYR9q/nAhWfoa8ieAQK/
	FXN1XTMl9VhclpxZ3ZmjJ3A6DcQRcmSus8bz5pc+hBxTruj/AARLKlj+fCtcYNAYoQvPhza9EbPtQ
	JkOyjFTCEDJkEMYJOQ9h+YKKbQihNPhWtjDL9eW8/4DLKm2rwomm7AN14NFgWbi3aeAc+jED1lMa8
	3fgQjG7hDduoqwEBVBTA9YzeG6zgyOKRoC1Nxh6oZbTd+EDKnWf4AL1rOiYR+81DjYlflMTnxso9T
	qeRX3zb++kTh8ZnCNpaXgdp1noJVm2KzBvLWabhoEEWjms0RENluDl+c/V3eWWFhCjnKJ6837Fu5h
	9pfSqH6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjOU-00000003r8o-2TtO;
	Thu, 08 Oct 2026 08:22:26 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEjOS-00000003r8K-0Qyu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 08:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Z5htwdDNdovSl8zMRcQaZ0+OenMBudJKvhypafkwFKY=; 
	b=swhPSRh0w9EZYoBvCUPkd14LSNI+XqOt1+Ydqkle4SIwUmdFAjA+1Ni7UnTW4NsHXXKSsLIc02K
	X4HtfKN9bPKjLC9nae2A3GYaJftzNvBqAVSdgZRjjR9nBnzRO5D5vQW6hH34TeXDsazjeyn+Waud0
	DTcGM4zGOjL+71Wj3OjZ4yFjQUPOVbUjVHu9/L8B/ozHj7apvvz2Sx6r+AoQpqOZYuqBgbnJQ7vBH
	UzcI0nx4H127FEM9IeAk+EuTVKfUKhZQLY7cv+rnDKKmiaYe5heGiJBt2SUL3Ls4RRTJBoQzL+aDZ
	85jx11bGxggifSsweq94nrSBlremog4IEsQA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xEjOA-00000001nl9-3Qvs;
	Thu, 08 Oct 2026 16:22:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 Oct 2026 19:22:06 +1100
Date: Thu, 8 Oct 2026 19:22:06 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwrng: atmel - use HZ_PER_MHZ in atmel_trng_init()
Message-ID: <asdSrhaiSvqtc6vv@gondor.apana.org.au>
References: <20260929213751.103658-3-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929213751.103658-3-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_012224_162001_C4616373 
X-CRM114-Status: GOOD (  11.32  )
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

On Tue, Sep 29, 2026 at 11:37:50PM +0200, Thorsten Blum wrote:
> Combine and inline the rate check to simplify the code. Drop the local
> rate variable and use HZ_PER_MHZ instead of the hard-coded frequency.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/char/hw_random/atmel-rng.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

