Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD728C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGbNBs3yLnaaPzsst7Hh6viCa4Co74eh6YnBkCnlEz0=; b=hDlWf/GpLQlPcSaPX7NWLisig5
	ytJWFGEPHUS33xExwhVYsVclWz7cdvJYJ913uaw1k5QcMT0536/AgAjcj3IKo6xa6uIVmuXJMZJ4L
	+I76KpdL9M+Ox8wP34DiAMPtlSClEtZ2aBkhAy2PP5jOdJwSDseVeKeCO3EnCxTjiwl96YgSYF1Pe
	eJ4i1htCQA7HMiZgM6w0ctrqVKCOXUcrmkDPwQ+UXO/dC0x5EcUch4VBfcfGAwYAkpVABXVfJEi3j
	r8nfEBTFzgSbMeO5VdPh/ViYqWKyoNiJx/Qaq85hj0hsRP+lFB5VNdMEwqOI4NPv35apVeYZKUT9S
	s4DLXsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mPM-00000008v85-20DM;
	Wed, 16 Sep 2026 09:58:28 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mPJ-00000008v7V-1zOu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=WGbNBs3yLnaaPzsst7Hh6viCa4Co74eh6YnBkCnlEz0=; 
	b=RQvx7XBg80cQ/nYilbdQ8LYXCZgai4NXqb1Bv8SyXnkRyKSeFC7BDK1sKeaLSCpHVYKDAPenSYa
	1Ir6EkzUeL9QDIk1/4Ss2t2hfh7olJnlDbUyhaWiv8O3PmFIju4w+X+6MezQJwpt8quaIwDTn1D35
	FBqzRaTgPCLBWiEXqiM2Nvddsm7TFEwBbDB01rJ9F9gTw878rdO79Q/qT/lFl4MFjPpZ/zVSwWEgi
	Xxy0XWqtwdwQAbe/uhiXURPMWVjfPltyNoycB4kYlzPekjTt8DXEC1RDSxhTj6llJvmvBGqdlZZCk
	wKPs3i6HrMtGRS+BgoBEGjyHkcdTFebWv2Mw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x6mP9-0000000EZCF-0uOc;
	Wed, 16 Sep 2026 17:58:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Sep 2026 19:58:15 +1000
Date: Wed, 16 Sep 2026 19:58:15 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-ecc - simplify
 atmel_ecdh_compute_shared_secret
Message-ID: <aqpoNxZBkvkmIzAG@gondor.apana.org.au>
References: <20260901081126.44790-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901081126.44790-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_025825_513862_38D319D8 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, Sep 01, 2026 at 10:11:27AM +0200, Thorsten Blum wrote:
> Free work_data and return ret directly to simplify the control flow.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/crypto/atmel-ecc.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

