Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159E4C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dqEgwvBJ5Y9hvWsPQvTfS3Ud5MBzSCZYXYvWemD47E=; b=2IEBOk16vEMlfNBJBWi9h20GQE
	mpxmY9gcLjpmyn+5i9zynHkHQIZ3qyYILX5gp/hHqsAbjhZlffgPa5dzMA4l5XNVJ8ncLVB2+hC16
	alKcuw3a9vqVC2r4RKuVtXIO/Xpj2pWWwp83cNbMongyeQ2drZaOE/pNw42W/ZGmEmG4oqB8ZVsoI
	Y8DUMpwaB9PbbYlCdrin++8zNL28zK/DOWX0TstjeO0N/xgongT0UiILvuQqnyoP3PYQf7NkFRLhr
	Fgwl1W0iMO35ajOnsDjHrLKi2sfWemp9VPE3dpAwruJPgPwBa+ZXzF5YMtwrHMooqndS5dDzR15f9
	jH+ATK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1V2-00000001Mg0-3WgB;
	Sun, 26 Jul 2026 16:14:48 +0000
Received: from mailout2.hostsharing.net ([83.223.78.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Ux-00000001Ma9-3nej
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 16:14:47 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id EF8A51062B;
	Sun, 26 Jul 2026 18:14:35 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id DC283614B38E; Sun, 26 Jul 2026 18:14:35 +0200 (CEST)
Date: Sun, 26 Jul 2026 18:14:35 +0200
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
Message-ID: <amYya_hiHM6lrxTX@wunner.de>
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org>
 <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
 <al_ZlTkEUHj-X1YS@ashevche-desk.local>
 <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091444_101847_8FB5A927 
X-CRM114-Status: GOOD (  15.07  )
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

On Sun, Jul 26, 2026 at 11:41:39PM +0800, Shih-Yuan Lee (FourDollars) wrote:
> Direct MMIO inspection of the LPSS DMA controller (PCI device 00:15.0)
> on physical MacBook8,1 hardware reveals that Apple's EFI firmware
> leaves the functional reset register (LPSS_PRIV_RESETS at BAR0 +
> 0x204) permanently set to 0x00000000 (held in reset).
> 
> Since the LPSS DMA controller is held in reset (0x0) by EFI firmware
> and the SPI peripheral relies on the dedicated OOB GpioInt() line for
> PIO transfers, forcing PIO mode via the DMI quirk in spi-pxa2xx-pci.c
> accurately reflects how EFI configures the hardware, allowing the
> driver to operate reliably out-of-the-box without system hangs.

The OOB GpioInt() and the DMA controller are two different things:
The former allows the peripheral to signal that a key has been pressed etc,
whereas the latter allows feeding the FIFOs of the SPI host controller
without CPU involvement (or with *less* CPU involvement, the CPU is still
needed to configure the DMA engine for a transfer).

I'm not sure why Apple chose to keep the DMA controller in reset,
but have you explored enabling it on boot?  If this can only be performed
before EFI hands over control to the OS, then it could be done in the
EFI stub, see setup_quirks() in drivers/firmware/efi/libstub/x86-stub.c.
Or maybe it can be done at runtime after the kernel has assumed control,
I'm not sure.

Thanks,

Lukas

