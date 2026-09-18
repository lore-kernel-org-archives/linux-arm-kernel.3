Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25A1C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iz2d2e8t0wkEWqjMMjv5AWLmaohR4cR1kKJ341FT4sA=; b=vfhwGKF8ip0k1j3/cG/0E8oLcV
	yh4INJe3pmXvyS+yKr+7VeJ7R1+5NhNnRMTYLPPDXYb5eUSuwgXnTbnZyo7yCYFkB5YGaqMgQPPki
	Yi0TcBGrynSEJZ7iX+Z3YMxFuiuIzR19x5pbWcuCQy+h9pAsJKzkEWrLo5P8SaYUhNkpatdSm7woN
	QjJ6PSzJM3gP6dJeY2FWxCbvgsAG/fy68mg2D8afG8bS16cFhQYvj+ATVoAKh1BjpcnEyeiYmdVS8
	fJvJhWJnz2YCsI9kiT5cmXPkBhjsOwt3mX399Wkjx+UCT3HziZWWv/hw1u1ZmdTnY7lFtI71rxaxG
	OHfArE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIr-0000000E0J6-2uV7;
	Fri, 18 Sep 2026 09:54:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIj-0000000E0F2-2B6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=Iz2d2e8t0wkEWqjMMjv5AWLmaohR4cR1kKJ341FT4sA=; 
	b=UYfHUl43RguOC2naDWh4jO8Tc/f+RdMOGDIz0BbvKRLTaS9XfLcfyeZENnBq9zPCKBDlw+uNIGX
	wVfComfvl7y0c8uOa+2phzUBvbwJvMiupQb41ZJeheJ0rLNSE7tbH0Zuu4zzCZH949hdHZGh/vQZY
	OPY02F25RPOD5WSrdUTO3hynbBu3eYUZGkUntlbBBO8ph+No5fXliiTpHQiANdOvzp5GC1IW4rYYD
	lzzAU6ZFhosYxekk/v1lRmoRLlydFOEBgKw3SK4jrQiFS05BunVRaoiiz0pj2ebxncjzwtskwzt8/
	Y1ufqRHcbz7jH5iRvsvi40TQ0IVDzAn0mWxQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x7VIb-0000000FM1c-0Jx0;
	Fri, 18 Sep 2026 17:54:30 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2026 19:54:29 +1000
Date: Fri, 18 Sep 2026 19:54:29 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Michal Simek <michal.simek@amd.com>, Harsh Jain <h.jain@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: xilinx - clear AES key buffer before freeing it
Message-ID: <aq0KVeDLBP11Eaw_@gondor.apana.org.au>
References: <20260908191607.405177-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908191607.405177-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025437_556994_D4530191 
X-CRM114-Status: GOOD (  11.90  )
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

On Tue, Sep 08, 2026 at 09:16:06PM +0200, Thorsten Blum wrote:
> In xilinx_aes_aead_exit(), the AES key buffer is freed without being
> cleared, which allows key material to remain in memory. Use
> kfree_sensitive() to clear the buffer before freeing it.
> 
> Fixes: c315cb0005be ("crypto: xilinx - Change coherent DMA to streaming DMA API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

