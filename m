Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B91C369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4ImkPMPQU523ycyqzjrL8ve7cqt56BZMsA5wknU5kk=; b=VEYd7EHH1d4DcDg6F7yAvi/0P7
	jsSNyhHr5K/9/zzlZC49YdBPi3iYt6IdOFgzQeCJkR5okcawnR+5dCTUWD5xJTO1WNBWTdo2kgn1f
	tO1e850WU8khzkAG8+SiNLFckBqOtCintaYWc24aHj8edxmP7g/tL62AJD9Dm3EBLVWW159D77gE3
	b5sOGRGdTguA65ejaJ/2gWq9lxGIjiIzG489yaXjn5EGIuJVbQJUHLWYAh2LEPkk8Oghh+tZEDIoR
	JG+guFoAZQTTPhbNCHyNAkJ8umhgliGRMhpIk5hBWkJ8BDyDon0vT9LPZ/xo04aIJuVEqLEDuNBR/
	v2klUMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xeJ-00000008iSC-3ac4;
	Wed, 16 Apr 2025 07:57:35 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xcF-00000008i0Z-0k7m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z4ImkPMPQU523ycyqzjrL8ve7cqt56BZMsA5wknU5kk=; b=DPkwxQQP+TfJ93xNDJfYehSWlD
	8B8Vr6eG5o1u5sQvRTMot5WODMIGtDt0hDm1lESP+8S86bw5HZqgBdtVmbx/dnlbMhFvfzK7e8pfL
	gM+N43B7PR6YE9NR6lJipqYPb6Cf+qFrdGzSt2yB+2YJI17C6NAbaclsdgBXsHHC87NWKYI4+5jtE
	PFq+tNGO8N+1BvlzEu5NzV3JmCp1xuN9MsF8AFzd1Tyw1p0HxAOUgakYOJfq8eU48bkEMoU2t42ND
	+JjmekeUj7dPeylkr5d1FzsvE4lrcaV53WehSDJzJahvP3DSBtDu0CsFJN050RI1t48Z41EuSecJq
	hIqF+RRQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xbx-00G7qI-0B;
	Wed, 16 Apr 2025 15:55:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 15:55:09 +0800
Date: Wed, 16 Apr 2025 15:55:09 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zixun LI <admin@hifiphile.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel - add CRYPTO_ALG_KERN_DRIVER_ONLY flag
 to atmel-aes, atmel-sha, atmel-tdes drivers
Message-ID: <Z_9iXRZ-3sqUhOAM@gondor.apana.org.au>
References: <20250407102050.1747860-1-admin@hifiphile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407102050.1747860-1-admin@hifiphile.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_005527_212308_EE56767B 
X-CRM114-Status: GOOD (  14.00  )
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

On Mon, Apr 07, 2025 at 12:20:49PM +0200, Zixun LI wrote:
> This patch introduces the CRYPTO_ALG_KERN_DRIVER_ONLY flag to the
> atmel-aes, atmel-sha, and atmel-tdes drivers. This flag is set for
> hardware accelerated ciphers accessible through a kernel driver only,
> which is the case of these drivers.
> 
> Signed-off-by: Zixun LI <admin@hifiphile.com>
> ---
> 
> v2: fix indentaion
> ---
>  drivers/crypto/atmel-aes.c  | 5 +++--
>  drivers/crypto/atmel-sha.c  | 6 ++++--
>  drivers/crypto/atmel-tdes.c | 2 +-
>  3 files changed, 8 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

