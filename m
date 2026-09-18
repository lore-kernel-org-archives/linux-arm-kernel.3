Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5CC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co3xVIDXNLBJrFTLjjbjwYnTnYTLOg/RMWAScp3+boQ=; b=oKTy20BJAg5amU+h7GJ7LNXL+w
	IiLPaOoacH1dH/fD8cCpiRHHTexQK5ADQOCR9d3p0CYeoIttHIusgQE7qk8jrCt9kwE+kfbNs/tr7
	W21RC6ZcBNpvv6B0SR3nLo4748I+mBmt9TGf9k5ijZKe5arxtVbYSvk+MUXQ3UpR9TsrKL1TB2IFW
	xgarWlbjzZSFCD3sfhPRdyDoBcCX07gw6/bF0yfCEJwigT3yo/ENwGga/JPvQ+doBOK438vfF4FbY
	uNzBNtKiUYKcTKy6ZS/pzc3cJuATJpor6vfAK+l27c+6o1nXhMZDFZPnB6cmkFZrXNGn7UuUjQeWp
	e0Cdc7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bTo-0000000F2c5-1ezv;
	Fri, 18 Sep 2026 16:30:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bTm-0000000F2bN-0dEQ;
	Fri, 18 Sep 2026 16:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Co3xVIDXNLBJrFTLjjbjwYnTnYTLOg/RMWAScp3+boQ=; b=TP4ufNAbqFlNPjN2V0G7gQeang
	VUuchqOV31oH2h7zhcLaiHIyfwMELf0aCS/Lsi1Dyti/hWKD+hIbp41j7b2BWPz9epJQBENDLmSgL
	dvdYL9E91EC7LtIBER7lt/edWqjr/sWlFqyl9A1i44o4xaJVdpR6MEhly2WwnXMoqXno=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x7bTK-005ts4-4w; Fri, 18 Sep 2026 18:29:58 +0200
Date: Fri, 18 Sep 2026 18:29:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
	SkyLake.Huang@mediatek.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: mediatek: do not match MT7530 PHY if
 10/100 only
Message-ID: <4fe68c4b-b72e-4cbb-9a0e-2731ec68888c@lunn.ch>
References: <20260918161156.377822-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161156.377822-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_093026_190102_2B929644 
X-CRM114-Status: UNSURE (   9.02  )
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

On Fri, Sep 18, 2026 at 04:11:56PM +0000, Caleb James DeLisle wrote:
> An EcoNet SoC 10/100 PHY uses the same ID as the MT7530 PHY, but a true
> MT7530 PHY always has gigabit support so they can be distinguished by
> the presence of the ESTATUS_1000_TFULL flag. Add a match_phy_device
> which refuses to match if the PHY is not gigabit.

Don't you also need the opposite in mtk-fe-soc.c? Otherwise don't you
rely on the load order of the PHY drivers?

    Andrew

---
pw-bot: cr

