Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8151CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBcqfJDDEAhoW2q4sP2fhRolkVFvahCE6bvX49j/3VE=; b=13a9qD8Y8fztufuui7AUDFUiH3
	R0CW1tjx9NQVOXVWSfTa22oJxx5V0BuS0ElopHDGHbvfCA2B8tuo16ZR8q6E0FNQbssuoUSVM4oLn
	3rjRsMHHmFURGMJ6UwIGhtlkh0wjAHVmc1B2URao55XfKlLTO/fiKBAvkykXu460XMgF5cPP62HKD
	0oWqyL949KoNblQGu4Wj8k+Y73TjjTdvcItCd2Z3OeHXCqXB0f0eVqOH33YJLEHa1sKEd+Xv6b0z2
	uidREaNSAZMgrYUvxBPPCdANejaa7tY5y0x0EW/oWh2bgzeew2KdDald3QLcrMyo6plVpq6bcYFgj
	8nJrAw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDyQ-0000000EJIm-1yq0;
	Wed, 13 Aug 2025 16:05:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDJx-0000000EApX-2Eb9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JBcqfJDDEAhoW2q4sP2fhRolkVFvahCE6bvX49j/3VE=; b=ueO7nrZ228+3Tvd9WzNQKL1z0D
	QzQ0zAtn5PQKi4jxkXd8wNQyy7s6D9P4MVsy92WbkTEy2tISUR4BPodvO9rLPM58DZiDSMxuSL192
	VIXIx0iAUFheAdZ5JRH2jlygHMd/W8/kqzebo7ziTsphlx+V6TGgU0IHlL8bvwkB3PI5uzM8wB6Ar
	HY9Rw+Z7i+Jj3qSB8lhBnhQlrYugLHzVC6y/pGOD1CIa3bI4C524tXX/zMPzPOb6l6Uzx9uWr4o0/
	HoBmm9Y7KTl1gAzUSNFgG7McMmQiVAG020uIdhyr1q2Voy/aNUnsvHDEQ4W05X8lAZ7h1n1szOUBa
	YkMvxD0w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umDJk-0006vX-1U;
	Wed, 13 Aug 2025 16:23:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umDJg-0005rb-1m;
	Wed, 13 Aug 2025 16:23:04 +0100
Date: Wed, 13 Aug 2025 16:23:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Message-ID: <aJyt2I1w6VYo1PPD@shell.armlinux.org.uk>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJpP5eABTYnQRV82@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_082321_569496_FB2C59D6 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, Aug 11, 2025 at 11:17:41PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
> > Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> > and modify the i2c_init_recovery() function to call that if specified
> > instead of the generic i2c_gpio_init_recovery() function.
> > 
> > This allows controller drivers to skip calling the generic code by
> > implementing a dummy callback function, or alternatively to run a
> > fine tuned custom implementation.
> > 
> > This is needed for the 'i2c-pxa' driver in order to be able to fix
> > a long standing bug for which the fix will be implemented in a
> 
> > followup patch.
> 
> "...next change."
> 
> ...
> 
> The first traditional question is why the generic recovery is not working.

I opposed the conversion of my recovery code to generic recovery when
it was first mooted for this driver, and was over-ruled. Lo and behold,
as I predicted, generic recovery fails with i2c-pxa. I now don't
remember the details, but there has been a regression reported...

Given that I was over-ruled, I am not minded to go back and try and
find either the previous discussion (google can be exceedingly
difficult now to find such history) nor to try and work it out again
(I've other things, including meetings today.)

Nevertheless, all I now remember is that generic recovery breaks
i2c-pxa, whereas my recovery works.

If I had to guess, I suspect it's something to do with how careful I
was to ensure a glitchless transition between i2c mode and GPIO mode
on the pinmux, and the generic recovery probably isn't as careful, but
I could be wrong there.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

