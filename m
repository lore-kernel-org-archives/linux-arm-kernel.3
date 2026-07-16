Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA5EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJR7gVJyRXrLY++XR9JQ1vCya65axpJvhZr2icFxhVk=; b=CWObH013oTgRug45ZF7ayB53wl
	4H5Bu+p5IGJE+U9IxYbQ281vNHONtd6xNdm701KJZlHnIPzwqcEpBwsDrYkBozpqfmFhVKDQJPLTK
	trgVdzDpMvbyG2oh8oVYYCf/5hW67PKc1P9U4oKzlO5W3mbxOkoUJyXfxJ24Q8kEzSsv6S7a8Co5W
	tIBrnIE5oQ6S16P9h4qOHQdj9C3rbQ1+XzMkLNJFvx+qkdcdmI2mvGBZkmAXBxzZ9iv8/65hmvNKb
	8IP0HXK+MbrWYG8Gs80WO8AUJpLTEY3Tz+VuafwDwVhdp1h6ahuq9CuIa/bcarBZsk0RXtTKnPAPA
	oKT2oPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM1x-0000000HNIH-1uTZ;
	Thu, 16 Jul 2026 13:21:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkM1u-0000000HNHL-2fR1;
	Thu, 16 Jul 2026 13:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GJR7gVJyRXrLY++XR9JQ1vCya65axpJvhZr2icFxhVk=; b=2Fzpmqp8ywnO6URqrTy6u4JIzf
	OMPPvpjpys6nhxarYYe5eQ+lpPjXkxevWd8sJ0Xr0R3tPb5S6cXGtggdQPZQR9UnzzxKtBAHFD5BJ
	BxsHEWZ6T79iKWrmfkewAEN8Ey+zPhVCcg3it8R+rAlE7ZDZ0HNjAwXz7IDgmOzd2+Tk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wkM1h-00CX7e-2J; Thu, 16 Jul 2026 15:21:21 +0200
Date: Thu, 16 Jul 2026 15:21:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, heiko@sntech.de,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: enable the reference
 clock for output mode
Message-ID: <dac6db00-b286-45d8-8ce4-ed76a7aa019a@lunn.ch>
References: <02ef3409-4078-4c3a-8c17-cb1a7f1f07e4@smtp-relay.sendinblue.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02ef3409-4078-4c3a-8c17-cb1a7f1f07e4@smtp-relay.sendinblue.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_062134_676760_EB26406F 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 16, 2026 at 06:56:06PM +1200, Jiaxing Hu wrote:
> 
> rk_gmac_clk_init() only requests the refout clock group for RMII. The
> ArmSoM CM5 has an on-module YT8531 RGMII PHY with no crystal that needs
> the SoC 25 MHz reference (clk_mac_refout), so in RGMII the clock was
> never enabled and the PHY did not respond on MDIO.

Since the PHY is the consumer of the clock, it would be better if the
PHY enabled the clock.

    Andrew

---
pw-bot: cr

