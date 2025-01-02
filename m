Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F273E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oREWulUgyqg3vsvhdUas7RQtfe+euXkZf+E/x2CYhU8=; b=r6adw9wSD8nvMROPICzEJ699UU
	ZVzV5EYNx6SYeWKH33+412anso6qliDxYoSOrEBFDsP/S+857znenoY4qjRnxCI9UBdp96e6+hZey
	MBDn6W5odkF2XUpP4/GMASaSWx8B5QWMkxvVKst1YOOCINeZRVlx+rAzj3jANOfxmhQuStX6+cU+6
	g/uuyE6BZtEjpox0LiBP3bf41yosQM1X4RD6lIX/PuflsSgzNjASDNx3A+p52T3dXMarPfFNmwvBI
	PgzCb6C/rtcUCS4FNFTVFds8baKDTi1jQtLI32UVxrrQMW6wn2db0Y5rC8epG7qfUi4PjhzAQnUuH
	zR0TW9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKJW-0000000ALiQ-1PC6;
	Thu, 02 Jan 2025 12:28:34 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKIM-0000000ALek-1rY4;
	Thu, 02 Jan 2025 12:27:23 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tTKI6-000000007DY-3PLl;
	Thu, 02 Jan 2025 12:27:06 +0000
Date: Thu, 2 Jan 2025 12:26:52 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/3] net: pcs: pcs-mtk-lynxi: implement
 pcs_inband_caps() method
Message-ID: <Z3aGDHU2TLV_YtZW@pidgin.makrotopia.org>
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
 <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
 <Z1UMEnlZ_ivTsru5@pidgin.makrotopia.org>
 <Z1VjJ8ago-HetCxi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1VjJ8ago-HetCxi@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_042722_479387_8BA9A42F 
X-CRM114-Status: GOOD (  24.58  )
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

On Sun, Dec 08, 2024 at 09:13:11AM +0000, Russell King (Oracle) wrote:
> On Sun, Dec 08, 2024 at 03:01:38AM +0000, Daniel Golle wrote:
> > On Thu, Dec 05, 2024 at 09:42:29AM +0000, Russell King (Oracle) wrote:
> > > Report the PCS in-band capabilities to phylink for the LynxI PCS.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > > index 4f63abe638c4..7de804535229 100644
> > > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > > @@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
> > >  	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
> > >  }
> > >  
> > > +static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
> > > +					      phy_interface_t interface)
> > > +{
> > > +	switch (interface) {
> > > +	case PHY_INTERFACE_MODE_1000BASEX:
> > > +	case PHY_INTERFACE_MODE_2500BASEX:
> > > +	case PHY_INTERFACE_MODE_SGMII:
> > > +	case PHY_INTERFACE_MODE_QSGMII:
> > 
> > QSGMII is not supported by this PCS.
> 
> Well...
> - lynx_pcs_get_state(), lynx_pcs_config(), and lynx_pcs_link_up()
>   include QSGMII in their case statements.
> - lynx_pcs_config_giga() refers to QSGMII in a comment, grouping it
>   with SGMII configuration.

These functions are in pcs-lynx.c and not in pcs-mtk-lynxi.c.
There is no reference to QSGMII anywhere in pcs-mtk-lynxi.c, what made
you assume it would be supported?

> 
> I think if the hardware doesn't support QSGMII, these references to it
> should be removed?
> 
> I also think that adding a .pcs_validate() method would be a good idea
> to reject interface modes that the PCS does not support.

I can add the pcs_validate function and send the patch doing that to be
included in net-next.


