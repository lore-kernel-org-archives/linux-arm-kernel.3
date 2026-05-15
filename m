Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4776CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NnQR+jyfhEOUkjyMF+jpjt0gX3QhcoeRSCdVZk1re4=; b=QaWDF2BR8IoJlgD449jIdMZZtK
	KWdKpmEgoghZ5X0znWchotx7I6+0VLZn7jEMjXAOIJdQTF/VJ6RhSxtTegidsAJu87BXkd+qKeWXn
	bTJ7f5VULFaFJZDroEMbQAvkvFjCgCYUjEFeA8SZ7nQWYPIlGuuru7sVn8z2HRzPq4X1dU+CHulH+
	rDxYtpy4nOLSsvVeo+3DDKymhnJi1d7yqqgwdaTkd4XLn3E5DOCBCUMhj10N67bgDgTC0YWtTYABl
	z5cL9SfPFgmqHVRYWckfbtp7gSOq9CNYxZHTi+gAceIDiyxPiOxFtBxgzDY74TuDjj8rcgu0XhvMk
	Jz2Y0H5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNphg-000000081lj-17WK;
	Fri, 15 May 2026 10:23:36 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNphd-000000081kq-0McV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=8NnQR+jyfhEOUkjyMF+jpjt0gX3QhcoeRSCdVZk1re4=; 
	b=mV3Wzn2lV+cbkyuRsOmnSA3nyP+MBQ6knKm9KkLAi9UUPjiQViaL5XP+t3ZPbMnYBzHbSMx+2LH
	UJcq8kPJTFwRXCxT3G7FsZQfWeQ4JFkPF2rVi5X1LxMcVsxlSVcjC/aJZXwMDoWUhc8FVwp8SYjzv
	5ERkfSdYC4jtJwPoB8Hvb7RzmRHK2h0vlJKXjWhXUVQiD2itdCYYl5qSnX12p2p37UPhhCshlJAYU
	nUtPQFY6WkrbcumiiVn4b9QkVpz0PVYaL18iPun3QdQ84Aqjo7ZXfSJxxLOcP2kFWtGLIqhxjfR81
	k1OxzW3R0qWYjpHti/NFC18vT7BHWojgzuWQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wNphI-00EOXt-2Q;
	Fri, 15 May 2026 18:23:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 May 2026 18:23:12 +0800
Date: Fri, 15 May 2026 18:23:12 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - replace min_t with min
Message-ID: <agb0EIfOeRSRb3f0@gondor.apana.org.au>
References: <20260507135525.331107-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507135525.331107-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032333_128414_3011E2ED 
X-CRM114-Status: GOOD (  10.56  )
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

On Thu, May 07, 2026 at 03:55:27PM +0200, Thorsten Blum wrote:
> Use the simpler min() macro since the values are all unsigned and
> compatible.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-ecc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

