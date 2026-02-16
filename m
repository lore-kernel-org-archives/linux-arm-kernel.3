Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CE1E81A3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSeE11hwULDq1Qr2S0vwgJhcVhLNVAv9uROXpPzDh+s=; b=x8TWPW5BwxFOKRyTXUXtQapqko
	BwgKb4eey3JItP0ELxhfbDdfuu2kqdmp73am6+YJPi3FAFyUOVbHSWt3hDzNo6pYnNiVv/z+jo+T+
	t3up0FhHcngQJpssjc7cvxSSNsAwYAmZiQr6eemwWbHu3sRPOaMtO/vgkFxk0/iIUAmUN//9+uk0L
	fKCUmTgnu4TppBUJthMwwRDRe5jUzzvzzkQ43dwGadycxd9z/8LJ2AiVD5kz8nWHOlCPxhNShD1nI
	U0/4+dasH5loWGDxZXMhL1KZ760BqXfr8c0+95XTQUfWyJU/WeIlhLixD3PogG4rfN0huQgjHt3E/
	PBNH2wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0q8-00000006vtE-1jWg;
	Mon, 16 Feb 2026 15:48:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0q6-00000006vsm-1qsc;
	Mon, 16 Feb 2026 15:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aSeE11hwULDq1Qr2S0vwgJhcVhLNVAv9uROXpPzDh+s=; b=rI2tUXyeeBZZjXVwiBZvt4GiGS
	02n4dK2eJnvWLYlxm+8UAkFMSvbiWu6+T4X/3ciBZffmyv4uSsDAKpZ9f38wk6Ekh2W+Eq7Dr3Q9O
	jB8chtJY7vZyeWSFNvkSI5jH+oja7Ezy1kh8GvNBVAIg5CuLUQvz44VQkksjdepKlttM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vs0pp-007Vn1-VN; Mon, 16 Feb 2026 16:48:29 +0100
Date: Mon, 16 Feb 2026 16:48:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yao Zi <me@ziyao.cc>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: Problematic understanding of phy-mode in Rockchip DWMAC driver
Message-ID: <90322c98-802f-4c88-8684-568f352d424f@lunn.ch>
References: <aY9s5PXP4zZ7R6fa@pie>
 <aY9xsslT56D9LGLe@shell.armlinux.org.uk>
 <aZKgq0-aptu-PnsB@pie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZKgq0-aptu-PnsB@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_074846_482167_D094CB93 
X-CRM114-Status: GOOD (  20.40  )
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

On Mon, Feb 16, 2026 at 04:44:27AM +0000, Yao Zi wrote:
> On Fri, Feb 13, 2026 at 06:47:14PM +0000, Russell King (Oracle) wrote:
> > On Fri, Feb 13, 2026 at 06:26:44PM +0000, Yao Zi wrote:
> > > Hi folks,
> > > 
> > > I was looking through the RGMII delay setup logic found in
> > > rk_gmac_powerup() of dwmac-rk.c, and found its behavior is strange,
> > 
> > dwmac-rk is very broken and is unfixable thanks to Rockchip not
> > understanding the RGMII interface modes used by the kernel.
> > 
> > It is what it is, we can't change it without causing regressions.
> > Please do not try to fix it.
> 
> Thanks for confirming. I understand concerns about regressions and
> agree keeping the driver/dts as-is is better.
> 
> However, should we mention the difference between "phy-mode" defined
> ethernet-controller.yaml and "phy-mode" understood by dwmac-rk
> driver in rockchip-dwmac.yaml to avoid confusion in the future?

I've been telling DT developers to set the correct phy-mode,
'rgmii-id', and the vendor properties for MAC delays to 0. That works,
and it consistent with the documentation.

As far as i know, dwmac-rk only gets things wrong when you try to get
the MAC to add the 2ns delays. And that is not a recommended
configuration. So i don't think it is too important to document a not
recommended configuration is broken.

	Andrew

