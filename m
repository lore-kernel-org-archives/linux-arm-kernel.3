Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F1D75BB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrLmzUmm6ToQPoBGZOkQVodGHG3cbLJ24xAFO3b7XsQ=; b=JvdLbOzy76g1qFejOnXFYwSa2Z
	yIFlrME4N8oOVXbU+uN1wLgyACyZWs2W5HOGyQkVB3aLI/WYzdiYVe2D1WvYj279CltptAxp4rOhB
	6BCSi0vdNv4xSIsRM+ChYT676t3C9zRGSiqETMA8ZhGSp9pkwH0S0Dx01km8lXk9GlxwUKFYFhVGn
	HyCmo58ZH1o0K5XNgpGyktP4zfiXN+xdql7gpW1QzyO3AQl3cQn46+8CF3OMQK4xJw7d4g9vPgeH7
	7XXX4UxvRjxEVsTMN9m6TWO74NgVaL/2l4m5d+qgZvf3ZAsFTSREPV6HHOGezny9e1xl/RYIEvR+c
	CywfE/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyur-0000000Gntv-0mhp;
	Thu, 21 Nov 2024 04:35:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyoa-0000000Gmub-49Z5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1732163346;
	bh=mrLmzUmm6ToQPoBGZOkQVodGHG3cbLJ24xAFO3b7XsQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MEg8R2aItOCsozsPbMgwasrISoK1DySd0kmnMLuGcFIDVypoEzI9axv9SrQU8Bacl
	 w5oxEl18qmEgYoTTTbw0vFb5jkm7oQ/LfWr+PC8qj8RtpDCAzyeDNZVc4YlYRbcSBz
	 IbuOFKez76r76Sq2AIgWeWv4vpqwM3SatVCW5KMDcJQFP2ycHZEZJyNd8nWmOeVzcb
	 qWBenb9nhm9Z1W8cUi9gCX87Iib9fYctRMXeZeP7XBHkzM3c0bvGeGkDoewEwDLkqm
	 5E02JqnKZVzyZfiV2ihQ5/1ZkJd6FiuVuwpXInGUUYMZG5kbE1mXmFQSt0Ej/89sTT
	 tQhcWYvrwZzIQ==
Received: from [192.168.68.112] (ppp118-210-181-13.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.13])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9CEB16C2B6;
	Thu, 21 Nov 2024 12:29:01 +0800 (AWST)
Message-ID: <944951bb04506e6b131293d634ab7be7417d8827.camel@codeconstruct.com.au>
Subject: Re: [PATCH net v2] net: mdio: aspeed: Add dummy read for fire
 control
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>, hkallweit1@gmail.com, 
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org,  pabeni@redhat.com, joel@jms.id.au, f.fainelli@gmail.com,
 netdev@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Thu, 21 Nov 2024 14:59:01 +1030
In-Reply-To: <b6155c5f-3012-42d1-90dc-8ef39d1eef2d@lunn.ch>
References: <20241119095141.1236414-1-jacky_chou@aspeedtech.com>
	 <d28177c9152408d77840992f2b76efe3cb675b7a.camel@codeconstruct.com.au>
	 <b6155c5f-3012-42d1-90dc-8ef39d1eef2d@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202913_243213_6314F6B0 
X-CRM114-Status: GOOD (  24.25  )
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

On Wed, 2024-11-20 at 14:44 +0100, Andrew Lunn wrote:
> On Wed, Nov 20, 2024 at 03:13:11PM +1030, Andrew Jeffery wrote:
> > On Tue, 2024-11-19 at 17:51 +0800, Jacky Chou wrote:
> > > When the command bus is sometimes busy, it may cause the command
> > > is
> > > not
> > > arrived to MDIO controller immediately. On software, the driver
> > > issues a
> > > write command to the command bus does not wait for command
> > > complete
> > > and
> > > it returned back to code immediately. But a read command will
> > > wait
> > > for
> > > the data back, once a read command was back indicates the
> > > previous
> > > write
> > > command had arrived to controller.
> > > Add a dummy read to ensure triggering mdio controller before
> > > starting
> > > polling the status of mdio controller to avoid polling unexpected
> > > timeout.
> >=20
> > Why use the explicit dummy read rather than adjust the poll
> > interval or
> > duration? I still don't think that's been adequately explained
> > given
> > the hardware-clear of the fire bit on completion, which is what
> > we're
> > polling for.
>=20
> I'm guessing here, but if the hardware has not received the write,
> the
> read could return an indication that the hardware is idle, and so the
> poll exits immediately. The returned value of the first read need to
> be ignored. It is simpler and more reliable to do that with an
> explicit read, rather than try to play with the poll timing.
>=20
> AS i said, a guess. We need a good commit message explaining the
> reality of what is happening here.

I agree, the commit message needs to be more precise about the
interactions and effects.

Andrew

