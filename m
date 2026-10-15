Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF25CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0G1u5/k4DcckxQeq3RlZifz6+ya0XrhqOvHOHu/ECU=; b=NkN1CedEffVitUcb3XvgPOVII9
	+lCbJNxJxZx6dNIN6CGMASuLLiOwFyy6lWoeWqAZA2K4rrmq+Nj/BfYP2+effqhhkPsQTkdN3kI9R
	/kO6pU0k5+51s3+Wh60cOE0iKHpp0xEIu3u3y5Bp9nAF1LFYAjnkX+krDkhHjs5D07wcoWLSemmBQ
	seuoVGcwvaWrVcyh0ryUlQTzIhTYCqPR6Zh0Ke9PqDBcheXODslGnKpYhA7PlFcHNZL1GLREkh3t/
	WYNSC7E5/dHVUM+Mc9Y8pP767r9cs3aPojtFBL+by5TLgIgIytcCnQZD4NW/VlU3x690kjV4NNSeC
	6IWAEFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKd1-000000007U3-0eFy;
	Thu, 15 Oct 2026 12:32:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKd0-000000007Ti-1WTh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:32:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C530743B03;
	Thu, 15 Oct 2026 12:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A611F000C4;
	Thu, 15 Oct 2026 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067529;
	bh=l0G1u5/k4DcckxQeq3RlZifz6+ya0XrhqOvHOHu/ECU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WoXuu5iVYKzi0YL78zWXnX1DzmJ9moh6C+TQj5egRlmmHOKiGZopRHDcl5ahXN4jO
	 UijgWMZFE6Wakd4tlP8zhkv2mYEc1+Y9DXIBSd1JujYrZAKw8959VM5rR2sRFXrzLK
	 +lMXbP80hpSBDDq3NxjBhcouNDhyAqjkXSsF/v1XtYeAAyVxvJI3NBJg3EjLe5qDb+
	 +wzbLMyZUS6SWTyx4nQ3BAgIhUPS1v9zHFtBbcmMpoMcwL6wtvWoop8Zl2dnNSTUoH
	 0miTYK7WiOJ090Q/1u4tQW7fXC7lt7OejPe89lrNrsZQSA/8ATyEywSehgxhDOPms9
	 BIJkjWi0xatog==
From: Thomas Gleixner <tglx@kernel.org>
To: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>,
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, Fil Dunsky
 <filipp.dunsky@gmail.com>
Subject: Re: [PATCH v3 02/11] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
In-Reply-To: <20261013-b4-cs75xx-s2-v3-2-181bb0d23f4c@gmail.com>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-2-181bb0d23f4c@gmail.com>
Date: Thu, 15 Oct 2026 14:32:06 +0200
Message-ID: <87tsmndu0p.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Oct 13 2026 at 09:07, Fil Dunsky via B4 Relay wrote:
> +static int __init cs75xx_intc_init(struct device_node *np,
> +				   struct device_node *parent)

No line break required. You have 100 characters. Please fix that all
over the place.

Other than that this looks good.

Thanks,

        tglx

