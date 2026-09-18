Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CCBC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K8Iq73fzmMlqTsh2CJ5HJ1Gr7k25mdx85nm05tpVr8=; b=uwUabRDsyxSxjJtPfC94LH5YJo
	gCyeXZEYPqEVPFGXT50lstcwBHmCIrY9q9KcVL9sFFhVIDxZ0+URDOs3z70+89YecG1BolUnY03Mn
	swQS/sfY/S+y5G5h1LRKwXcXYDNC01sdFEOqLwQnvUmui880ctN49ne+OZjEKeXNVXjtIJNRVtSpf
	RfrWbBfk3PJq2kQcSkn0/9++bucCmb0Aejpb2fAvaL9fp2WEZqBFsl44vBZSu+ECG4YYLEov7itj3
	tDI6sYgOcw1IbcXe4lKpMyfOmTKaskjrKZMaV+Vgv0x16s67d0Uhk/0vNOM3SJgW5FSBALb56dTcV
	b2NB2dfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bvV-0000000F7hs-487Y;
	Fri, 18 Sep 2026 16:59:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bvT-0000000F7gK-0mR2;
	Fri, 18 Sep 2026 16:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3K8Iq73fzmMlqTsh2CJ5HJ1Gr7k25mdx85nm05tpVr8=; b=xH+yP9SV05DdBY/JrZ4TeBp0qa
	/QV5tyQshBb7qPQfOX9amtOgDIr2HtilHxkq3+DuuSsB/i7+dkppTSYa6DNOC/N4fvvGSXXi6U9xK
	wvzrJ5M1xda7d1knjM61cgt6LOIC82l465loAXG8ZSdcnuJrreqG2lEjsOROJj48sKgQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x7bvB-005u5E-Sa; Fri, 18 Sep 2026 18:58:45 +0200
Date: Fri, 18 Sep 2026 18:58:45 +0200
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
Message-ID: <c45590b8-91a0-4499-b613-df1ace5acc0c@lunn.ch>
References: <20260918161156.377822-1-cjd@cjdns.fr>
 <4fe68c4b-b72e-4cbb-9a0e-2731ec68888c@lunn.ch>
 <accc40a4-f447-498c-ab45-96d1f2d2cc33@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <accc40a4-f447-498c-ab45-96d1f2d2cc33@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095903_222840_05EED06F 
X-CRM114-Status: GOOD (  17.28  )
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

On Fri, Sep 18, 2026 at 06:47:02PM +0200, Caleb James DeLisle wrote:
> 
> On 18/09/2026 18:29, Andrew Lunn wrote:
> > On Fri, Sep 18, 2026 at 04:11:56PM +0000, Caleb James DeLisle wrote:
> > > An EcoNet SoC 10/100 PHY uses the same ID as the MT7530 PHY, but a true
> > > MT7530 PHY always has gigabit support so they can be distinguished by
> > > the presence of the ESTATUS_1000_TFULL flag. Add a match_phy_device
> > > which refuses to match if the PHY is not gigabit.
> > Don't you also need the opposite in mtk-fe-soc.c? Otherwise don't you
> > rely on the load order of the PHY drivers?
> 
> The collision is in econet-fe-soc.c of
> https://lore.kernel.org/netdev/20260827065930.2618729-3-cjd@cjdns.fr/

Ah, you have a similar match function there. Good.

> And I notice now that I did add it in that patchset as well, but this
> implementation is better done.

Yes, the one here is nicer. It would be good to use the same idea in
the econet-fe-soc.c.

     Andrew

