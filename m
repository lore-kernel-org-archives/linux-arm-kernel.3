Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE6DCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRXHmeUhDS3PxP6+e2W3Q8rut4tY53cDYhD/afrYh08=; b=uFD467McPJR9X/KkoN0Ste8faI
	NFo/kAUp1oYHlqYo37dmIF4N3vBWb871UTYDtM3LcQA39IpSFyyd5mW1Lc3MJrpJJPckDR/vS4Ojp
	FH8UG5MJKB7cs7GkmoXr/fYCivM+6JnFWr5YFno9aCXlYGChU0I5N/J0RkRfwuMcRaanqPBeanqhm
	lsjrJJIyQF9/yTGasgblwg2REID9i5JqH04shw7AFpjPTlzO8h9QPmjqLsprdtSyUno0jQf5XE4Zs
	mGY4XmdZduHUKhFMH947F/+fqKv1rE6XUEOHhYox5lIP/Lc/9EUjbtDnteFFU/YvegIjWTN19qK20
	4XnEIjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4fG-0000000E3Vf-3kBv;
	Mon, 15 Jun 2026 10:35:34 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4fD-0000000E3VG-2Xxr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:35:33 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000JJ-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C060CC084D; Mon, 15 Jun 2026 12:33:22 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:33:22 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] [v2] mips: select legacy gpiolib interfaces where
 used
Message-ID: <ai_U8j3uOoIzoYrJ@alpha.franken.de>
References: <20260520183815.2510387-1-arnd@kernel.org>
 <20260520183815.2510387-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520183815.2510387-6-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_033531_947946_B95F07DE 
X-CRM114-Status: GOOD (  21.19  )
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

On Wed, May 20, 2026 at 08:38:10PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
> 
> This is the list of all gpio_request() calls in mips:
> 
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_cd");
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_cd");
>   arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
>   arch/mips/bcm47xx/workarounds.c:        err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
>   arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_one(board.ephy_reset_gpio,
>   arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");
> 
> Most of these should be easy enough to change to modern gpio descriptors
> or remove if they are no longer in use.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: no changes. There was no discussion on this, but the patch
>     has so far not made it into the linux-mips tree, so I'm including
>     it for completeness.
> ---
>  arch/mips/Kconfig         | 5 +++++
>  arch/mips/alchemy/Kconfig | 1 -
>  arch/mips/txx9/Kconfig    | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

