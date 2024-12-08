Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E35BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8OK8knLfdvUAL608L+NqsoFFkIWemXmAfHLj7NzNMU=; b=FRAAH8ShleFj2DEbPJkKoIJKPQ
	ssUpnPSnJJwCd6m/KAZvppdJ774OFWYn4LseGlDKmpsI8JeTWYYrm9o4/rWs9Av+7HRWqSbdYhSwB
	6hr5K1teQezYK5O0wEZMcL9+aJYk5T7Dx7DO+ce0e85OAp/77t/b9bsLOMCVbLqaOifF156y725TZ
	buuJjyyVgtP/B5MBE2/wMzZkWrhKi+1h+G1OOAP4tkfPxgUCjhLdm0b6FU6jhYhfBUZ53SqE3nVuW
	oirplqSfNNIebgtqZr8rAkfFWJopMtLQ0A9If4ZFQyrDgsCn9WzxtNW+5toosMpvUKlYin8+dDHJ9
	hhVzuLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKDNB-000000054Ae-3Hxd;
	Sun, 08 Dec 2024 09:14:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKDM9-00000005446-1HW9;
	Sun, 08 Dec 2024 09:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e8OK8knLfdvUAL608L+NqsoFFkIWemXmAfHLj7NzNMU=; b=FCa9oBeQDol/UjpKrgK2Wh14Xn
	cfjEmozeyf5yDFgIEwndXBhNfIcmKNmBodIKz4tmMJVx2/Sxqv8nzp0KNBhZkTQeiHy7V022X8juf
	pOKnW56mphlgVc0VEX6gtPNStKIWMOjcHR4rLcaqoYu2xg28qlottDx4+wDzT/s1ZgIV3zXilavOT
	l7iUGxeH275ih97A9L1d+eNxnfRLx9/+I61Tq7NR1/iRPjKR3gGt4HNkD4rJB51bY1GNX/f+Bwbjh
	ch0tq1LUpIKLUIvqKXVuvm80FxuPuwd4R2G8SnGvCzJNYMHetNiuC36Gu8NXrOmSHAGFLCiXWaU1h
	IIA4OQQQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40238)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tKDLp-0007zK-05;
	Sun, 08 Dec 2024 09:13:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tKDLj-0000vv-29;
	Sun, 08 Dec 2024 09:13:11 +0000
Date: Sun, 8 Dec 2024 09:13:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <Z1VjJ8ago-HetCxi@shell.armlinux.org.uk>
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
 <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
 <Z1UMEnlZ_ivTsru5@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1UMEnlZ_ivTsru5@pidgin.makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_011337_754732_03164FCD 
X-CRM114-Status: GOOD (  20.28  )
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

On Sun, Dec 08, 2024 at 03:01:38AM +0000, Daniel Golle wrote:
> On Thu, Dec 05, 2024 at 09:42:29AM +0000, Russell King (Oracle) wrote:
> > Report the PCS in-band capabilities to phylink for the LynxI PCS.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > index 4f63abe638c4..7de804535229 100644
> > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > @@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
> >  	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
> >  }
> >  
> > +static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
> > +					      phy_interface_t interface)
> > +{
> > +	switch (interface) {
> > +	case PHY_INTERFACE_MODE_1000BASEX:
> > +	case PHY_INTERFACE_MODE_2500BASEX:
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +	case PHY_INTERFACE_MODE_QSGMII:
> 
> QSGMII is not supported by this PCS.

Well...
- lynx_pcs_get_state(), lynx_pcs_config(), and lynx_pcs_link_up()
  include QSGMII in their case statements.
- lynx_pcs_config_giga() refers to QSGMII in a comment, grouping it
  with SGMII configuration.

I think if the hardware doesn't support QSGMII, these references to it
should be removed?

I also think that adding a .pcs_validate() method would be a good idea
to reject interface modes that the PCS does not support.

> Apart from that looks good to me.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

