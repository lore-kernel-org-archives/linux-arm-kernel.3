Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C91DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADW5eqH6VA2WZDRcAiISRyExIE2KG0j0rlv7Qt6Kq3w=; b=yeu2UIWFZFSz9mpqlWvEPlQiE2
	3bvq4wLWX4lcbDJBKbxRIsGZiVPNFfAvhe2DetKq85ODED3tNCYZGa5/IGG6jcUQiVxitHPbgV3SE
	YaTX3CDkfrkqv9H7mNbxV6JF3dKWLjG6WqLviEnSbOzCIMehO1YJf3MVpHNR2bG/3+zGAlSHR45tL
	Qw1db+wItUTbijLE4+UNs9uMiP1xf6kY1K8HwDIALz47VDIWIpFqoTM+5uohVHHJLk/a8g7snzbXi
	x1AZGkTRNI5fueamju83VauDHOTAvVpOdPH5alU4ZTecpYgWFapS+/w4nedMrlcA2Pu8UoOFzBVn9
	nk3H6CAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDoyu-00000006GKw-0Cl4;
	Sat, 10 May 2025 18:31:28 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDowo-00000006GAU-0Xo3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 18:29:19 +0000
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id ad2ab1b7-2dcc-11f0-96ba-005056bdd08f;
	Sat, 10 May 2025 21:29:15 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 May 2025 21:29:14 +0300
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
Message-ID: <aB-a-tH6AGUfBZVB@surfacebook.localdomain>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_112918_328969_A9B95918 
X-CRM114-Status: GOOD (  15.24  )
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

Fri, May 09, 2025 at 12:45:31PM +0800, Peng Fan (OSS) kirjoitti:
> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.

Why not? These are mostly trivial ones and they fix the warning, they may
potentially be the fixes between -rc1 and -rc2,

> This is an effort to make irq_chip immutable to elimnate the kernel
> warning "not an immutable chip, please consider fixing!"

> The major changes 
> - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> - add IMMUTABLE flag
> - add GPIOCHIP_IRQ_RESOURCE_HELPERS

No need to list the implementation details of IMMUTABLE flag. Just a summary
line is enough.

> For davinci, two patches are made, 1st is to update irq chip data, 2nd
> make irq_chip immutable.
> For xgene-sb, two functions are added, because previous driver directly
> use irq_chip_unmask_parent and irq_chip_mask_parent.
> 
> In some patches, I use irqd_to_hwirq(d) to get hwirq; in others, I
> direclty use d->hwirq to align with previous code.
> 
> Some Kconfig entries do not select GPILIB_IRQCHIP, but I tried
> to build pxa_defconfig lpc18xx_defconfig and multi_v7_defconfig,
> GPIOLIB_IRQCHIP is y.
> Not sure we should select GPIOLIB_IRQCHIP for them, because if
> deselect GPIOLIB_IRQCHIP, there will be build failure.

-- 
With Best Regards,
Andy Shevchenko



