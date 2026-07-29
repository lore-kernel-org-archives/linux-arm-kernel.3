Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97B3C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AZP6114ahs+Pbhia62VnJaRb/axsXLl/AsInVTkJec=; b=pXhDbhiIcjPI4Jv8lqi2soJLwK
	6zncSrb9kqYxX/x/RQyIiYSTprDIj8EL/KNLBLJv7s8NFBK4PooJnwO2jgqMvb3/es4obBpHckOqw
	M49CvspzOdyuNmwISwr+aK+6VJ7wa5fK4sYrxR4kFtkzRMC+i7WWfAd7leWOqoFnPfV4WiJJXjqlm
	QGq+q2KwtMBhJTPJEoCprZNBZfQsx1GekUqdU4dSflTT1GYh9LWO/WZO3wxONyeh0v/tmpshkgJpu
	iNOIXYuKH4mfwnbRNarXbXgYgGsuHDUQYtvhcK8d9AVJTk0YHfU7cermpbuu8CzPS1wbNdOisDvlK
	YDGI4TUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAXa-00000008w3M-0vQM;
	Wed, 29 Jul 2026 20:06:10 +0000
Received: from mailout3.hostsharing.net ([144.76.133.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAXW-00000008w1t-2UDs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:06:08 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 46310C1A;
	Wed, 29 Jul 2026 22:05:57 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 12B556031592; Wed, 29 Jul 2026 22:05:57 +0200 (CEST)
Date: Wed, 29 Jul 2026 22:05:57 +0200
From: Lukas Wunner <lukas@wunner.de>
To: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mark Brown <broonie@debian.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <ampdJY4LcP6Qc1de@wunner.de>
References: <20260720162117.32304-6-fourdollars@debian.org>
 <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
 <al_ZlTkEUHj-X1YS@ashevche-desk.local>
 <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
 <amYya_hiHM6lrxTX@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amYya_hiHM6lrxTX@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130606_784567_DCB97923 
X-CRM114-Status: GOOD (  12.02  )
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

On Sun, Jul 26, 2026 at 06:14:35PM +0200, Lukas Wunner wrote:
> I'm not sure why Apple chose to keep the DMA controller in reset,
> but have you explored enabling it on boot?

Thinking about this some more and after taking a look at
drivers/input/keyboards/applespi.c, I realize messages exchanged via SPI
are always 256 bytes in size.  That's not a whole lot, and of course
messages are only exchanged when a key is pressed or the trackpad is
used.  So perhaps Apple determined that sending this in PIO mode is
ultimately more efficient than keeping a DMA engine powered on all the
time.  The CPU load saved through offloading the SPI transfer is offset
by having to program the DMA engine for each transfer.

So perhaps usage of PIO mode was indeed an intentional choice by Apple
and need not be second-guessed.  I'm not sure.

Thanks,

Lukas

