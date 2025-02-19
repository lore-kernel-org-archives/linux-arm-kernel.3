Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E67C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XNjSxYshEtTvXChmY5fi80Lo+W2gHUxjNLerZH4GJI=; b=iX/XFZFx0oyodYSexybPGgaeN4
	CfNnwYfsFwZP4hE2mzCx7KkEcoFbJsfaV0l7jngCgXtbchSJEnPNepgS7o5WZVg/cWsvqDnPDe+Vc
	tT/2ixW/So1EVYm1RsceL+DtKNvMABVwt13SV//UUBSm/9n+HtYBx2sbuYRcqgqpXX0ld3p4Ze43T
	AoEfwS9+pyyCapGzvOKt+E9QI2TG0R6PwKNy4nDgWop7rkL3t8SMy1EjJ1RLxxg1SQE9M7ONCO8Z2
	1UfDNpPVio7ZykHQ/Co3fvqmKYz5DrU52L0rWz9ImWInwe7rNqzxwtnAxN+/L67HCEH6ZNtRxZGPU
	Qe+XCL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklqI-0000000DVCy-1hJd;
	Wed, 19 Feb 2025 15:18:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklop-0000000DUpd-3Lhs;
	Wed, 19 Feb 2025 15:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7XNjSxYshEtTvXChmY5fi80Lo+W2gHUxjNLerZH4GJI=; b=Q/kZ8Cs2dQpv5y453/f5IDVBW8
	HTgDDWhwH5/3fO5uPGDNt7G0sWYNfvOBjHdfs40y/CWdxtP/QSgL7TcTEuxFn9yO1k3RsOS8qOHCQ
	n4lrYmU+gsvecxzwIqqRT0q0wncFIU2St/ywIoU8pdCi4eqBSW+eOTjFNd7AdxkzWKgJwf0pMeWyX
	rSRpSUvhQ192LcvK8DcmKuR9pb5o/QhWTnZtxsb2BXvb0DFi6FoW4zLXcY/ZOO3cZImBWl+WVmtXn
	5gJ8ka8qI4rixtVp0eEsFMELojqUWe9N8gZDzOcBhKMd89zuJ1796H3aooCo2DlKt7zEPVgFVhGyr
	mRQTmr7Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklon-00000006KBk-0KkE;
	Wed, 19 Feb 2025 15:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7XNjSxYshEtTvXChmY5fi80Lo+W2gHUxjNLerZH4GJI=; b=bIAHbkQx/aLzCkOW+Qx6j602+6
	jT/V4PkuU1d6zs7eKtMXRUOb6gdGaIfV4qRrQ5epDKETwTLsmhoBmmt0T1wLlJwdRdKqSm7taSVl1
	1sB4TukoM31nqxr6hwYyLyzN/QCjb1U9zXw7AF+WAxbee+3SBON7Z9x9bRjOXT171Yw8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkloO-00FfIt-1k; Wed, 19 Feb 2025 16:16:32 +0100
Date: Wed, 19 Feb 2025 16:16:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Message-ID: <87318b5f-e67d-417d-8149-e1d918b23568@lunn.ch>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
 <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_151657_127479_A981CEF3 
X-CRM114-Status: GOOD (  13.21  )
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

On Wed, Feb 19, 2025 at 09:33:44AM +0000, Russell King (Oracle) wrote:
> On Wed, Feb 19, 2025 at 04:39:10PM +0800, Sky Huang wrote:
> > +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> > +{
> > +	struct pinctrl *pinctrl;
> > +	int ret;
> > +
> > +	/* Check if PHY interface type is compatible */
> > +	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
> > +		return -ENODEV;
> > +
> > +	ret = mt798x_2p5ge_phy_load_fw(phydev);
> > +	if (ret < 0)
> > +		return ret;
> 
> Firmware should not be loaded in the .config_init method. The above
> call will block while holding the RTNL which will prevent all other
> network configuration until the firmware has been loaded or the load
> fails.

The aquantia and qt2025 drivers are good examples to copy.

	Andrew

