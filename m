Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B79D65553
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 20:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoKlEXtB3EjxHAoJcJGRZSerDnh1PQkKqKumRA/zpG8=; b=OwUlrj16e9jbZI7dxy2HcJf1/e
	4VCdxcbm46yCuEPDBr/f778whEhX9XWiYB7mEcXIwLyf97lC9VZyBUmCNnh5mrBBDfYLsXamN8r2Y
	lr++VNAJSIYyEU0D0jej07yYyhoYVBPosBiWP9P39MJO5ZqgzWL1fdCH6zm/JT+XOm+I6Ob3n3oKR
	0Rbe0T6/0F+6vJiNDHQM+C1vq+7I7bBaGJLli1q13JaqvauOl1Ng/qTdI9jrJLeI1xVbIBu7gAKdq
	ZSXjDr0t3+kxPk1H1pB9ZDut5tCUkDHQKXxub7Dc/5dMaAmEFI3drdCiROMfNAVdCBOF1q34tb2HI
	gbDf63XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1ms-0000000BaxN-3CkG;
	Tue, 26 Nov 2024 20:03:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG1lu-0000000BaqP-2AJh;
	Tue, 26 Nov 2024 20:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UoKlEXtB3EjxHAoJcJGRZSerDnh1PQkKqKumRA/zpG8=; b=YwDN2Z18k6aOPNYinbqdm6sTjE
	oUDLT6oVHw3lOnY4Dsh4fvBcGJ6RIx/wY0EMS8/nW1NIC0TK70N8vJHGjzjym0PFqIK7FVctV5ZcH
	Dx/t+LPf7GNz1kqHFkCQM/PA48J4dI0AKsGVxgD2BySaPs2dv5j/agR5YV5EK1uJ2Y+k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG1li-00EYa2-C8; Tue, 26 Nov 2024 21:02:42 +0100
Date: Tue, 26 Nov 2024 21:02:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 02/16] net: phylink: split cur_link_an_mode
 into requested and active
Message-ID: <d5ae164b-b167-4654-8c02-853b41fa71a2@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFro1-005xPk-O5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFro1-005xPk-O5@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_120254_553889_90E4C02A 
X-CRM114-Status: GOOD (  15.70  )
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

On Tue, Nov 26, 2024 at 09:24:25AM +0000, Russell King (Oracle) wrote:
> There is an interdependence between the current link_an_mode and
> pcs_neg_mode that some drivers rely upon to know whether inband or PHY
> mode will be used.
> 
> In order to support detection of PCS and PHY inband capabilities
> resulting in automatic selection of inband or PHY mode, we need to
> cater for this, and support changing the MAC link_an_mode. However, we
> end up with an inter-dependency between the current link_an_mode and
> pcs_neg_mode.
> 
> To solve this, split the current link_an_mode into the requested
> link_an_mode and active link_an_mode. The requested link_an_mode will
> always be passed to phylink_pcs_neg_mode(), and the active link_an_mode
> will be used for everything else, and only updated during
> phylink_major_config(). This will ensure that phylink_pcs_neg_mode()'s
> link_an_mode will not depend on the active link_an_mode that will,
> in a future patch, depend on pcs_neg_mode.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

