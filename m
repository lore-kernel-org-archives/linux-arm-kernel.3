Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D43C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 18:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTzYppBcdhBFWRKO4APp0v9obd2mOnQ78WZp5mRGP0s=; b=ZnnxxiU+L3qlQfc4gbJKZkXEKH
	f/Uvsn7/uaIXJGA90ne1D3W/H4+T8RT3/EFMtyT0Gy4i1qZi5cmmEdiuXbaOTEKCYgmFTka0ECJGh
	RpVwqDu4Oy8jTvWek5BJqzsTWW9W3upfqnRoa+/74EDDKo4ilO+KJa8dVZB7150zIeqgsOhkEt3je
	3CuTuO/6VZr4J19tO5Y0SQWoNjV1o5Y+3yBGLb+KzRadkcbHM4bsfP+OhHR/lQ6BxG/vcspBMnF8b
	HQNtHo2JRjOSEb/oSJP147pzMtp8ny8IKUVlOlLJlx2tZpfPkBwfXs4ls23pVurfFzT8h0d5OtVNt
	v5QlXNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDp0w-00000006GU4-37kO;
	Sat, 10 May 2025 18:33:34 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDoyR-00000006GJC-2hKQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 18:31:01 +0000
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id e8fa2954-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:30:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:30:55 +0300
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v1 1/1] pinctrl: at91: Fix possible out-of-boundary access
Message-ID: <aB-bX57Y88TmYyas@surfacebook.localdomain>
References: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508200807.1384558-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_113059_841563_4F44AF2B 
X-CRM114-Status: UNSURE (   7.34  )
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

Thu, May 08, 2025 at 11:08:07PM +0300, Andy Shevchenko kirjoitti:
> at91_gpio_probe() doesn't check that given OF alias is not available or
> something went wrong when trying to get it. This might have consequences
> when accessing gpio_chips array with that value as an index. Note, that
> BUG() can be compiled out and hence won't actually perform the required
> checks.

Also
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202505052343.UHF1Zo93-lkp@intel.com/

> Fixes: 6732ae5cb47c ("ARM: at91: add pinctrl support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



