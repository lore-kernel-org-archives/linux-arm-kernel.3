Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CA4D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sM3zD+mOnITtJ9F2JG0yeMKEXacWXE8JL0HxA96TrJI=; b=fEa/LPEeIo1R8tqYHBIOQ+14u9
	+kZ5wQIWW5XsWKSduXTJcAEea1uWpIR6YrUr3ZUYxB8fm7hNH+9UOghbm77DeM51Ltcz9LRvvyXm6
	Y352oiLLXRoq0lMJznGcTYi8MTyct0KyiqXc8iYG3Fwxn37Z9VxwnJm+iQaXpQfDaiUcgrrR9jVfm
	WL2g2v0d+fIG3IE8Gsi3CzDS6hvw46px01g1tL7epbVarYUx9+QHfb2NnedrSc9M1wkVp1uzgKhbN
	GI8txp9N8LPKsDN3zUhUtRA2bzXDY0ypst1DBcFrcposhAVLr0EFlCyALN1BWqtYYDTZJS6B4esjt
	ehXquZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOaz0-0000000GXLP-2oRs;
	Thu, 27 Nov 2025 12:20:22 +0000
Received: from flow-b6-smtp.messagingengine.com ([202.12.124.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOayo-0000000GXHN-2Vov;
	Thu, 27 Nov 2025 12:20:13 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id D324F13003D7;
	Thu, 27 Nov 2025 07:20:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 27 Nov 2025 07:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1764246005;
	 x=1764253205; bh=sM3zD+mOnITtJ9F2JG0yeMKEXacWXE8JL0HxA96TrJI=; b=
	az0Jui6SJVlGY1WQSktongf+DQpnFhjn5+MDJKbtn6yUmbdYYWjXaRed33+9SNKP
	YfPpU5/v60Ncn0T/CPmv9z0lwJrD/pcQ8sYrOyG+6kZu3LrIf4GdrrWOAdZHVlDq
	4uFgwwvA9ktHNIjIzbzdbLoq6Fu0Qb0e1m3I93J+wA9p+iuNOTx0Hbb+Zt9ahTB4
	1m6o92dI9fg2zcKaDqXUtrfYX38D+inI7FsW9FUhHST734Lmmg+HVk4T6ypHXzeU
	J113+bVZ7uyrVvybwlqYRveDtcMzzRJR1WPGw5Ka51n1WVwLK0K9fV0XxZwujeIv
	e1fnHB4tqTe5hMS/i31jtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764246005; x=
	1764253205; bh=sM3zD+mOnITtJ9F2JG0yeMKEXacWXE8JL0HxA96TrJI=; b=q
	k/pU+f8o2xuvEXHdHdJF/ptzEA56RCHHXJFuBExVSC8orUPlqJw/AIPLOFw8TBZJ
	/d4ZbTGl8TcQ4G26SeY2rd8ZrwiwnW8TuzkWDWtLFjrQLgatRFrn+bYpFWxLrNWC
	RRrGH/ccH5CeNPRZlYRoHB0mHLc60HXvrkIZ0QrecCPGC0ndV3RkN/jI3FIdzGaG
	QelOYE5w20xRoJO1Qba/AVOcH1lslfT6FBNw7AD14z6CjJg+99Dv6TsGVhVBwTz+
	nTS5Dfou2ALinWBhBKHYOn5qoRJLVR+d1mDQcYzNzM0HVUh1/sF8b61yzptpbKu5
	cpiM+onI2AczDgK7mtLlQ==
X-ME-Sender: <xms:9EEoaTOc2bZJ-bMzEJnVO9g6PT6lYvMPaH0WOzoto2IeFupDyHyxmw>
    <xme:9EEoaWyQwaC1VYn-V06WincYJzQ-kdxtwgiWCuzJmLzMwEpCWNWnXBatacX7AefDO
    vkqQrEKflhEKCGxw7ywfES45v9oad-dRZHiZTQ_7ShbiD-CHA>
X-ME-Received: <xmr:9EEoaYnOJLlI5EAeMtv8qMAs7sK02YvihQmnHSMGJvyu9PVcz5vBUisExBRccud3aK_QDJNZhQeMaJrKRNZhXb3Pam7YcA6ONqAP8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeejvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefhteefve
    dtvdfgkefhvedvvedvudefuedvueetueduteejgeekveegffekfefgkeenucffohhmrghi
    nhepsghoohhtlhhinhdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
    pdhnsggprhgtphhtthhopeefgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
    hutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgv
    ohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvhhkohhulheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhishhhohhnsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepfihulhhfse
    hrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehkvghvvghrrdihrghnghesrhho
    tghkqdgthhhiphhsrdgtohhmpdhrtghpthhtohepmhhinhgrshdrhhgrrhhuthihuhhnhi
    grnhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepshhtvghrnhesrhhofihlrghn
    ugdrhhgrrhhvrghrugdrvgguuh
X-ME-Proxy: <xmx:9EEoaeV7EwwzsZ2HQiAo2fEQpvlsJ1wGGAwchd69fZLf4ph6yCS7EQ>
    <xmx:9EEoaZ0ftNEmtV8XNHZl6FoPmPZ0kjOVy9fn2Ig4vUb-pQWdja5bpg>
    <xmx:9EEoaekYNad9XVy-y5CM2nw3630vz52mOwK6EVZIt6dlvXe1ZNYs8g>
    <xmx:9EEoaQEquoa2rwLVTrZyXXq93MF1NaDgoBkI5tDhXCeRP_-XFBG1XQ>
    <xmx:9UEoaUaKdpX-AbibV2W5OQy1HlJC2U05OYLnsD2QWCahwORmfif_J7oU>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Nov 2025 07:20:04 -0500 (EST)
Date: Thu, 27 Nov 2025 13:20:02 +0100
From: Greg KH <greg@kroah.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, William Wu <wulf@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
Message-ID: <2025112725-enviably-ground-9342@gregkh>
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com>
 <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
 <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com>
 <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com>
 <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
 <DEJEFLKA9IJR.237ZLV8HBD2VS@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DEJEFLKA9IJR.237ZLV8HBD2VS@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042011_169533_E7A6E457 
X-CRM114-Status: GOOD (  24.30  )
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

On Thu, Nov 27, 2025 at 11:18:45AM +0100, Luca Ceresoli wrote:
> Hi Théo,
> 
> On Thu Nov 27, 2025 at 10:48 AM CET, Théo Lebrun wrote:
> > On Thu Nov 27, 2025 at 10:22 AM CET, Luca Ceresoli wrote:
> >> On Tue Nov 25, 2025 at 4:28 PM CET, Théo Lebrun wrote:
> >>>> The code already checks for !rport->suspended, so add a guard for VBUS as
> >>>> well to avoid a disconnection when a cable is connected.
> >>>
> >>> Your commit message was clear but I was missing one key point: what
> >>> rport->suspended means. It isn't what I first thought. Instead it means
> >>> phy is powered off. Naming is bad but unrelated to your series. Maybe
> >>> add a comment to your commit message like the following?
> >>>
> >>>   The code already checks for !rport->suspended (PHY is powered on), ...
> >>
> >> You are right. I have added a slightly longer text:
> >>
> >>   The code already checks for !rport->suspended (which, somewhat
> >>   counter-intuitively, means the PHY is powered on), ...
> >>
> >> Still worth your Reviewed-by?
> >
> > Even more so.
> 
> Thanks, v2 on its way.
> 
> >> I also added the Cc: stable@vger.kernel.org line, which I noticed being
> >> missing.
> >
> > I never add that Cc trailer and only rely on `Fixes:`. I thought it
> > used to be documented as an alternative to that Cc trailer but it does
> > not show up in `git log -p Documentation/process/stable-kernel-rules.rst`
> >
> > There is one indirect mention of "scripts that look for commits
> > containing a 'Fixes:' tag":
> > https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/stable-kernel-rules.rst#L132-L134
> >
> > Anyway, you do right by explicitly tagging `Cc: stable@...`.
> 
> Theory says Cc: is needed:
> 
> > Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> > process nor the requirement to Cc: stable@vger.kernel.org on all stable
> > patch candidates.
> (https://docs.kernel.org/process/submitting-patches.html#reviewer-s-statement-of-oversight)
> 
> But in the practice I happened to forget Cc: stable in the past, the patch
> got applied and the Fixes: tag was enough for correct cherry-pick in stable
> branches.

That is never guaranteed, it is a "best effort only when the stable
maintainers are bored" type of thing.  Always be explicit, and use cc:
stable, as the documentation has stated for the last 17+ years :)

thanks,

greg k-h

