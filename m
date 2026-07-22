Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289EDC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SDsO25Rk7rGd75+RSY95wTDn5tS6ra/XRsVnBi1d1U=; b=HS5Zkrji5sff5ZhBijxX7k2YUl
	npS6rES3mGm1PXQ0U0bnReltLg606bcu95bGtp9X9WVk+7S7r7XSeVMIkc1mrs/heEGNpAeLqwKw7
	npoO78CTYIcmaq3mLx+1eAsDgdv9VVRgOZCP/TAk/NzwpRY4j/KQbNbiCw48z5aN1lRxsWTUeNpBs
	bY/MtEz+0QrmoaWe+UNc6na3A9uzFR9o6rwYAuZdNw8sKm6weZHtT3bt45CIX+0cxGRy5/ZaARs1u
	p5Kv5aZB7UFSzxiYqqwsXvZdj1mAf08LtGwoGvzOqBSk2/s/PsqWFYE4Ipg5vuzov4Wy0fPirzg5+
	PXooKJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTj6-0000000BTbU-1OFX;
	Wed, 22 Jul 2026 09:58:56 +0000
Received: from mailout2.hostsharing.net ([2a01:37:3000::53df:4ee9:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTj2-0000000BTZU-2HQ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:58:55 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 0AFC210611;
	Wed, 22 Jul 2026 11:58:44 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E9FB062749F4; Wed, 22 Jul 2026 11:58:43 +0200 (CEST)
Date: Wed, 22 Jul 2026 11:58:43 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Cc: Mark Brown <broonie@debian.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <amCUU5WNbcgn3UR-@wunner.de>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
 <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025852_734770_8BD672D8 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 22, 2026 at 12:09:44AM +0800, Shih-Yuan Lee (FourDollars) wrote:
> This confirms the root cause is not a software IRQ routing issue but
> rather that the DMA controller's interrupt line is physically
> non-functional on this motherboard.

Like Andy says, the DMA controller is internal to the SkyLake-Y-ULX
with SunrisePoint-PCH (Intel 100 Series Chipset), it's not something
that needs to be connected on the mainboard.

I've just looked through the Specification Update for Intel 100 Series
Chipset and it doesn't list DMA-related errata.  Hm...

Lukas

