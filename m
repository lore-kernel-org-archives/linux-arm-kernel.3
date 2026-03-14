Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CEB107BCF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G7QiHXpxmHH4C6Nxml7OsvQ5dLKhj3eSSSnkxHngmw=; b=ZSB5bUcSFFzmH45U+/UdlCCLom
	0x+UoWoPZC8XLY2qpC1xhH4BWXWNIJhzoi/w36pABoI6mhl4EQhy//lABgXI2MRzR26J8ZzC/NOAh
	gYHN0X3yKwNMvXM/c3wqeDLNgOcKlwqNsUK7oMPAmSqGmRa4qK4MHnmY+Ua3ZyTRKTFyUvBwEOfmI
	7EdLrQP5kAxYDpxkhSYWDWSZZCV0zWIIlvDhSasH9F0iJ9/4MkVV0cV4s+rV7rvZ6zHcXeWzwMMh6
	e+c8WW2rTzPHiPLL5vIouLxzJT5thmdbXMGEc19Af46b93PVMeECW8mQra0Om2CQ31jdA2ZL85K/H
	ZQbdqTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KdF-00000001e4S-2P5y;
	Sat, 14 Mar 2026 08:46:01 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Kd8-00000001e3G-4690
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 08:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9G7QiHXpxmHH4C6Nxml7OsvQ5dLKhj3eSSSnkxHngmw=; b=Mt5lNKJeYn3j4izThdejaY9AVb
	Bpjbj2BpETkq0aglrJT8DDAAOmq+3HELbFsj6qUaZREMWwjiIOl7JcKa7lAy4d6beYxT5PK004dSS
	L9rmi4oED2kAfE3B0ZGZ9MpGhVROfQHCef+duccDykZQVHKSnVVrnNkdpsVXBTTCelS5Z1r7mp6tN
	ajJxm4AOeQgsfRBzbgPN7u2XxbyvflOFFnbC9pVr0SZcsdYvuzQ5tDMfFnS3O/0BlHUMNSz9fgaw1
	0qUdxHBh+wYFrvf7OlL9GAuedGpJbaIvKyg6QuKvx6ydBRLapCK2eaXlDzfMdKceOi2m937QXauPK
	cqcGflqw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w1Kd6-0000000Eq3d-1G9O;
	Sat, 14 Mar 2026 09:45:52 +0100
Date: Sat, 14 Mar 2026 09:45:51 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <wil4524ca35bcrqutlip7mzi7xlwa3xrauym2pi5a73vlkohcl@zhd3hczj6e4u>
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_014557_254664_A367EC35 
X-CRM114-Status: GOOD (  14.78  )
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

On Sat, Mar 14, 2026 at 04:23:11PM +0800, Chen-Yu Tsai wrote:
> On Sat, Mar 14, 2026 at 4:10 PM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> >
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> >
> > The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> > is in unitialized state.
> >
> > Solution is to set pinmux to GPIO INPUT in
> > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > earlier.
> >
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> 
> Interesting solution, not at all what I had in mind. :D
> This fixes things immediately for sunxi, and keeps proper pin lockout,
> i.e. one can't use a pin muxed for other uses as a GPIO interrupt pin.
> I was hoping that the maintainers could provide some guidance as to
> whether the core could provide helpers for this, but for now:
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thank you.

