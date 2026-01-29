Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC859D61017
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lcXkV7KcZEtUSZxPr/UJgAxOsEp8lMqEuRz2Y1R0vE=; b=jCtTQxxQXPg4ugfgEQsg9wzAXq
	u/dLCCA/vIzsrj6qp2ZNLUn2jIuPPxiLtUHwaJGxSxYnln/dHtGX4riCSX3db9+TkgFQ5efUctrBK
	98haZdqyfpK32V1aQtkTP/AHZkrvvtGv4wgVslux8brZaG8l0OwaGQe66ZHmnroscZUR9gu1hlCRs
	CgTTFZjp2+Wphcg2eNDoZtmyBZH+ivf7rIjuP6WP5kGgBcPzw9XgjHFcHsYiEcveApF0hdWhsgdGZ
	O+b5z8ZzV8PR/GHvM20lMNIORA6eY7ci5e1G4flQIPznbWcSRHonAzmhIx+zGBgiopVc+eNb8npTo
	D8kJhfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSR7-00000000BVX-03wd;
	Thu, 29 Jan 2026 13:51:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSR4-00000000BTh-0k09;
	Thu, 29 Jan 2026 13:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1lcXkV7KcZEtUSZxPr/UJgAxOsEp8lMqEuRz2Y1R0vE=; b=hwVisHL7Uv8FLJ6eYfbkDJLMes
	GBpeZ08yNuWS77zXJljq9XMAhSSFNHaHoei6AivyUM6YSNcq84R2uyvavYuxP7zKiT5ycYZo0dBuQ
	FYliR8wtdTW7armfsbiZxETCMctIX5SocC+PdGwY/e92ftMUEia4kZKHjir/08z1Fnk3mDTPeGD6q
	dKQlnS5gG450UOSdUTC8Hg5Kg858ej0EejX/vHVk7O6OqadCOKasEBuvar9VTs+V7NZjUn1HaYTS1
	EAQWTr6cSKQg9+5R0gcUZZY9WRJA0KdhprDe6RY0e0kmn5suVKf0DEkKcUhOyhd5ODY/d1yyyO1E9
	F7cjFp5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43926)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlSQt-0000000008s-36KN;
	Thu, 29 Jan 2026 13:51:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlSQr-00000000822-21Fq;
	Thu, 29 Jan 2026 13:51:37 +0000
Date: Thu, 29 Jan 2026 13:51:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vincent Guittot <vincent.guittot@linaro.org>, vkoul@kernel.org,
	neil.armstrong@linaro.org
Cc: Simon Horman <horms@kernel.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Frank.li@nxp.com
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
Message-ID: <aXtl6eQ8zD_olTdc@shell.armlinux.org.uk>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org>
 <aXsuRTZUUnw0kdzV@horms.kernel.org>
 <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
 <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
 <CAKfTPtCiJcNOdoddZN5N1dKHXfUJBe0=zeWfZ5uENoXDvbMnpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtCiJcNOdoddZN5N1dKHXfUJBe0=zeWfZ5uENoXDvbMnpQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_055150_215196_07C06960 
X-CRM114-Status: GOOD (  12.69  )
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

On Thu, Jan 29, 2026 at 02:36:01PM +0100, Vincent Guittot wrote:
> On Thu, 29 Jan 2026 at 14:23, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, Jan 29, 2026 at 02:01:13PM +0100, Vincent Guittot wrote:
> > > yes, the usual pattern is :
> > > - phy_set_mode_ext()
> > > - then phy_power_on()
> > > but I can add an additional check
> >
> > Please read Documentation/driver-api/phy/phy.rst section "Order of API
> > calls" which suggests phy_set_mode_ext() after phy_power_on().
> 
> Fair enough.
> That being said, all pcie drivers  that use phy_set_mode_ext(), call
> it before phy_power_on()

It looks like many ethernet drivers do the same, so I think maybe the
generic PHY documentation is incorrect or misleading, or is expressing
a preference that almost no one follows. Something for the generic PHY
maintainers to look at and/or comment on.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

