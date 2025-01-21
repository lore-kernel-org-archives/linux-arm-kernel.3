Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B46C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMNoKFYOZb3R7VlLMaWGscF4MpJ/+U5da1Onznh3O84=; b=t2YAWeFYMJGbgBSuag+CQhHdVg
	4G2io2UPz59p1rtF79rob2jDLwNQsFm2Ebg3vr8d+Y01TFFtdiAsLDt0D2T68pXtwfgbNQNI9fbjw
	+UX8Cj8c1tRc+BqtqeEjvJmb2aqp7TTjQa5AuT78npuN2wGYbEpZrNg+0V2KzAOMhtoyN/Hbxrgv7
	IwGQANzM28IZKdSvgIo00omNNsTyLzebVALsHe+4cl5tE+VymfLeEJdgl64mpuX+3PqKjQik3V0VI
	IF3ygieuTC8fHSyN5oA0vweHKKMjAifLBSFTyIoYMTbuhj66b+lzFBYCRWZYfZv7kqT3YOOoSwkWe
	DEx8e2gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCXo-00000007lWG-3vdo;
	Tue, 21 Jan 2025 11:35:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCWQ-00000007lMY-1tuc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 11:34:19 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taCWE-0004e1-6h; Tue, 21 Jan 2025 12:34:06 +0100
Message-ID: <f1b00285-4afb-4a3b-9918-46fbfc8ce4a8@pengutronix.de>
Date: Tue, 21 Jan 2025 12:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Linus Walleij <linus.walleij@linaro.org>
Cc: imx@lists.linux.dev, linux-gpio@vger.kernel.org,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Haibo Chen
 <haibo.chen@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andy Whitcroft <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CACRpkdbgv5BhP_iv1fV7-=w6qF3H+=GiUJz=hQko3rcd6uq4BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_033418_490648_7AFBDDF6 
X-CRM114-Status: GOOD (  20.69  )
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

Hi Linus,

On 15.01.25 13:00, Linus Walleij wrote:
> On Mon, Jan 13, 2025 at 11:19 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> As these concerns won't go away until the sysfs interface is removed,
>> let's add a new struct gpio_chip::legacy_static_base member that can be
>> used by existing drivers that have been grandfathered in to suppress
>> the warning currently being printed:
> 
> I think entire drivers, pertaining to in worst case several generations
> of SoCs is not the way to approach this. It could be a SoC or, more
> likely, single systems using a SoC, that has a problem with this.
> 
> If you want to safeguard this I would use some code loop in the
> gpiolib(-sysfs) that looks at of_machine_is_compatible("foo,bar-machine")
> to match the top-level compatible for known problematic machines
> so we can be fine-grained of this so when that machines retires
> the driver can start using dynamic GPIO number allotment.

It's meant to apply to all existing i.MX SoCs, but not for new ones using
the same driver.

Filtering by board is not practical and doesn't address the problem of
a kernel update leading to toggling of arbitrary GPIOs.

I am wondering, what remaining _users_ of the GPIO base do we have.
Is it just SysFS and legacy board code?

Cheers,
Ahmad

> 
> Yours,
> Linus Walleij
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

