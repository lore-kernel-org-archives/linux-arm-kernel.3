Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C1FD6101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdLx6MqvKMI7VkaiN5mQVnb2eVwGGL9NszyRmXRKFV0=; b=Dfo7393ctYZ/WF8IBiFGX5uYOn
	nNkF/Ti1gIcO07O28NaA97qi9v6D29W0AS55A02CTIklCQtlojetFt8XL1oFqrYoyoYy5VfrpRBCs
	Mx77lXHbNXAHlcP+kyGSL79k5M312QfBI6eu3SlwgDdDwFK7Oh4KUOO5cg10CEZZGg0h7NZjcXzls
	EHq1qadthyEpBSGAR/wEuU+Yz4uy8JX9mMrR1bV3HyEbnmzZRNZW5B34HDxTBRBUEBayR95P5C30i
	Rui/7c4i99hoMAc7dmxhteqtsN0454cSx8ZRjOHaftM6mLl2EUt3R4BX3sQDBMdoWh4DfvOKqvVww
	tC0ttG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlT8m-00000000Ekx-17ck;
	Thu, 29 Jan 2026 14:37:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlT8k-00000000EkO-0UCf;
	Thu, 29 Jan 2026 14:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gdLx6MqvKMI7VkaiN5mQVnb2eVwGGL9NszyRmXRKFV0=; b=IUnX78XxTN3897xqwPd6BmA4/H
	EZehdxzJc8Fh5T/UIyymImNbkf0vAUqODyrY9JCzG8ckyviD4xiKe93el/EoD3p1JLof6a0DC3GNf
	MDMz6/TSocUiQyJUxzcbH9Xd2R6QBCL1sJWpQ6DzeMm3du9sH/8YX4h8VC04CU7DgWI3x87nqo0Fv
	+svJ8AlhFIV696xHGY3F35RC+v2S0PNnxW/If7wMVr310KDQjvREKy30qgwj74Ld1VIoUlzxxcb6U
	X8GtPYmrW8kuWScU4XpHe004klCUsff/h6SR7Iekv9OzSEGaTRSe3g9jRbp7X+ShCqfegy8iiMosG
	lkey1yOQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37426)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlT8a-000000000BS-2Vfn;
	Thu, 29 Jan 2026 14:36:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlT8Y-0000000083Z-3wB7;
	Thu, 29 Jan 2026 14:36:46 +0000
Date: Thu, 29 Jan 2026 14:36:46 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vinod Koul <vkoul@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, neil.armstrong@linaro.org,
	Simon Horman <horms@kernel.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Frank.li@nxp.com
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
Message-ID: <aXtwfj1vqB1cXKFM@shell.armlinux.org.uk>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org>
 <aXsuRTZUUnw0kdzV@horms.kernel.org>
 <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
 <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
 <CAKfTPtCiJcNOdoddZN5N1dKHXfUJBe0=zeWfZ5uENoXDvbMnpQ@mail.gmail.com>
 <aXtl6eQ8zD_olTdc@shell.armlinux.org.uk>
 <aXtvDn_-pCuKPrnf@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXtvDn_-pCuKPrnf@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_063658_153202_A137856A 
X-CRM114-Status: GOOD (  20.31  )
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

On Thu, Jan 29, 2026 at 08:00:38PM +0530, Vinod Koul wrote:
> On 29-01-26, 13:51, Russell King (Oracle) wrote:
> > On Thu, Jan 29, 2026 at 02:36:01PM +0100, Vincent Guittot wrote:
> > > On Thu, 29 Jan 2026 at 14:23, Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Thu, Jan 29, 2026 at 02:01:13PM +0100, Vincent Guittot wrote:
> > > > > yes, the usual pattern is :
> > > > > - phy_set_mode_ext()
> > > > > - then phy_power_on()
> > > > > but I can add an additional check
> > > >
> > > > Please read Documentation/driver-api/phy/phy.rst section "Order of API
> > > > calls" which suggests phy_set_mode_ext() after phy_power_on().
> > > 
> > > Fair enough.
> > > That being said, all pcie drivers  that use phy_set_mode_ext(), call
> > > it before phy_power_on()
> > 
> > It looks like many ethernet drivers do the same, so I think maybe the
> > generic PHY documentation is incorrect or misleading, or is expressing
> > a preference that almost no one follows. Something for the generic PHY
> > maintainers to look at and/or comment on.
> 
> I would feel it makes sense to configure the mode first and then power
> the phy up. As commented above yes it looks like apart from one tegra
> driver rest seem to do it this way.
> 
> Lets update the documentation

Please also indicate in the documentation whether changing the submode
of the serdes (particularly for ethernet) is permitted without doing a
phy_power_down()..phy_power_up() dance around the phy_set_mode_ext()
call.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

