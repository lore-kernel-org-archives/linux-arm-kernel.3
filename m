Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047AB1090233
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6ZSSOI4yJhl+4f0AE9nL59GXw0oE7fpDku5quh/0/w=; b=oDAQk8qCdpZxsGxotXIOF1Osou
	4TR2emSBmplbJMEM2wcBlBGCPnr0UN+a7fH/4D5WuvCthpFhO1A6X9G7bgrbrB6YL0514Vj40HUSD
	kXBPv+3AQpVz9g2JEzu4thLNzqcpDfnOfJ+v74kp5TCXxkic/lC1yPtWDFsZmEWGEa9lDoe8dDXzQ
	XDQdMGQUNtXl9Wx90tUewIceKLTtzpjO2sWx2QjPWw0K2lA9//IQizMJ3a+BVrTnGP6nwdiQdRwgS
	EpBHnEZzEAC2i7dngyoSYrkMe6iOe6npz0UH2x4Zj2W5plz6qR6kmCNmcnGBo3L+exAKY78yY+DZd
	HjBqOVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EKf-0000000AnMV-2Kbx;
	Thu, 19 Mar 2026 14:26:41 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3EKb-0000000AnMA-2T0C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k6ZSSOI4yJhl+4f0AE9nL59GXw0oE7fpDku5quh/0/w=; b=AR2NNjLlxGSAC+wMCQn7l/NZRX
	jRA0p8Ncb/v1mkoW7rOY/I0kUYncbtWBbM3Ky7kXXHBt0SCsnbI0m1VsZ+ldINQryziZcmyhvypTU
	9Mjdpd3zb8JwipnN9wJg5sMV//ILZPU14JQLXR23cg38WTl6xwzuilVhdDtcNiHVIBf840NVF0yE1
	BG4XhM3oWt4+uc+z1F9z05QRHi3h9AJgGNC3XCp5evSEXoMVt0mfRnRw2VZqB0iw1yXQNncYLy+KD
	8dttjSX4MywxPY7A4qUu65NmsLmNC1bsViycoCEl0b5/EPhoINfjGkBFZQZqlLTmK5p8SsUyDUOui
	0OYPUUWg==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w3EKZ-0000000Cy3l-1Cux;
	Thu, 19 Mar 2026 15:26:35 +0100
Date: Thu, 19 Mar 2026 15:26:01 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <dkbfvbfislhlh6ft4gctqt5c5tcquof657ons2qkvnclm3eppf@m5krax66ov2n>
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
 <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_072638_125194_2E6A0B3C 
X-CRM114-Status: GOOD (  23.01  )
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

On Thu, Mar 19, 2026 at 10:06:55PM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 19, 2026 at 9:46 PM Linus Walleij <linusw@kernel.org> wrote:
> >
> > On Sat, Mar 14, 2026 at 9:10 AM Michal Piekos
> > <michal.piekos@mmpsystems.pl> wrote:
> >
> > > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> > >
> > > The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> > > is in unitialized state.
> > >
> > > Solution is to set pinmux to GPIO INPUT in
> > > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > > earlier.
> > >
> > > Tested on Orange Pi Zero 3.
> > >
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > Should this have a Fixes: tag and should it be applied as an urgent fix?
> 
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")
> 
> > Tag for stable?
> 
> The original patch wasn't tagged for stable. And it doesn't seem like it
> was auto picked.
> 
> > Also: is there consensus with Andre that this is the way to proceed?
> 
> As Andre mentioned, the mux value for "disabled" is different between
> generations. So we likely need to make the value part of
> |struct sunxi_pinctrl_desc|.
> 
> Michal, can you respin a version so that we can get this fixed in the
> same release?
> 

Yes but I am quite new to this so it might take me few hours to
understand the proposed solution and implement it.

> 
> ChenYu

