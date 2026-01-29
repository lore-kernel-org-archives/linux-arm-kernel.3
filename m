Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74396D6101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtKMtdsEWH6elbPNi7/jK8OWRuwYl8jnS6+nkW0Vy18=; b=DFFtpoUH6vtEkM2UFC2Ecuq0ct
	5yE+WVbdSleHQFGnUIiMoMdBnEw0gh0KutaTJv1kEzxSEzMV8ZEtMM949BswS1KBaQfHiemMfXUzi
	0ENLUR4XMZvV+fcAYhBr0BQKlke9yiLKBWCTO0h5jW/VNSzJ9HBtX/RkN02mq2wOzMsKT4mzT74g3
	yQ3ljeM/pRGULYM2Ix1I4HXF1siuAcS/urV+bTcvhHo3vMIbjnql91X9h6oI9G2pijhgLZGN6QVLo
	ewCB14F/FmeFNVtDOWuvOJtfZou0svrZFxTUtJ6XMQ1hpMpame21o1C7CJeW8ARTZbbvsL1FhsYyS
	bx/X0rkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlT2j-00000000EPO-2emz;
	Thu, 29 Jan 2026 14:30:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlT2i-00000000EOz-0X4x;
	Thu, 29 Jan 2026 14:30:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0FD742B7E;
	Thu, 29 Jan 2026 14:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA413C4CEF7;
	Thu, 29 Jan 2026 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697042;
	bh=R8m7a1FGKdQNUJUMAWJS1FeEHbADDyjLfJT3bxHHWNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJnkmjiGkCFrF4qvF3ug5n40EZjp/rJM3B7h/L+DUXojjYQUAHYYQElxUKSXiXbe4
	 AcrFePyw47VS0dabq3cpyn9Nk/Wc2kgbScqHhqzVTpONzQOO8zf21r5DkmGyFOa/E6
	 n1tr7Ycv5asJd6B4F9d5D+Y80dNqUTJc/v4/TG2U+uCPcE1tjdhpxifXxWORBC/OxN
	 s8xJ1UTQ6BlqjKXrzhzos3DwskpOfPcX5nuFbhgVzdCYw2T9s1RHeG8JBqQQfH6tyK
	 ySkrzRt0VpcPDAWbLtDHSbITuhVkXCtQ0D7q3gDyiMj6Q7OUESbTS2SUyMv+bIGwZ7
	 yWuSLmupGl95A==
Date: Thu, 29 Jan 2026 20:00:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, neil.armstrong@linaro.org,
	Simon Horman <horms@kernel.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Frank.li@nxp.com
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
Message-ID: <aXtvDn_-pCuKPrnf@vaman>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org>
 <aXsuRTZUUnw0kdzV@horms.kernel.org>
 <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
 <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
 <CAKfTPtCiJcNOdoddZN5N1dKHXfUJBe0=zeWfZ5uENoXDvbMnpQ@mail.gmail.com>
 <aXtl6eQ8zD_olTdc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXtl6eQ8zD_olTdc@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_063044_206325_753C1336 
X-CRM114-Status: GOOD (  16.18  )
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

On 29-01-26, 13:51, Russell King (Oracle) wrote:
> On Thu, Jan 29, 2026 at 02:36:01PM +0100, Vincent Guittot wrote:
> > On Thu, 29 Jan 2026 at 14:23, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, Jan 29, 2026 at 02:01:13PM +0100, Vincent Guittot wrote:
> > > > yes, the usual pattern is :
> > > > - phy_set_mode_ext()
> > > > - then phy_power_on()
> > > > but I can add an additional check
> > >
> > > Please read Documentation/driver-api/phy/phy.rst section "Order of API
> > > calls" which suggests phy_set_mode_ext() after phy_power_on().
> > 
> > Fair enough.
> > That being said, all pcie drivers  that use phy_set_mode_ext(), call
> > it before phy_power_on()
> 
> It looks like many ethernet drivers do the same, so I think maybe the
> generic PHY documentation is incorrect or misleading, or is expressing
> a preference that almost no one follows. Something for the generic PHY
> maintainers to look at and/or comment on.

I would feel it makes sense to configure the mode first and then power
the phy up. As commented above yes it looks like apart from one tegra
driver rest seem to do it this way.

Lets update the documentation

-- 
~Vinod

