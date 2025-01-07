Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B4DE7719B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkTBPMcZKmbWcBpdJkI4VttrnEz5cM46TWHXsBHT878=; b=NQWHChuzFLQ0Ip+BbJMHXCTR32
	6cv2Tct4uPqiWabM/c3lwnsFQmqRmAeeEPJhT0SOLA1fqsgDBsz3ajidqxVYnIEq890swOtZ/fqO0
	cPIERnIQlFqx9eZa2SPwUlCezk5i2XWLA9QsvFl37r7F8XWJl2B6/PGC3Q5CnJmDq6Bo+5k10R5Em
	kP4uQeRSTlOsfF0WGLvBhdMMepXcOzjEDMu9L4GnkgroOYEBt4+yWmyevgh0XiztljdmdUYOrN3cu
	U32JJgbz9WsZ7Nj0Y3CkaZkrFUc6vas7uM/i1yRKdtxPJFLle66ynmTHqeizWRxwCJZSSmVk74LtZ
	XbjhqciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9en-000000050PN-2haT;
	Tue, 07 Jan 2025 13:30:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Vm-00000004z3N-1XcB;
	Tue, 07 Jan 2025 13:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nkTBPMcZKmbWcBpdJkI4VttrnEz5cM46TWHXsBHT878=; b=pz4PE7Ki70rYKiXGmBZZ4+NDWP
	/Sw6LCV5/TgZpJgqhxM6DEoYZwwM1KWDP0MNGITFsM0jmpjK770DuMOWuI1BDxdoUmmGkJVbEWbij
	DxvVGh7ATOPSCbLex2I7X5gzKt8ezmZzLE3WvXX7y/kmLjL5DRSDGiY75k5FO2sT5rXI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tV9VX-002Eki-8i; Tue, 07 Jan 2025 14:20:31 +0100
Date: Tue, 7 Jan 2025 14:20:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <ed29e632-332b-4af1-bf7f-97498297e731@lunn.ch>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_052046_404278_C52141C5 
X-CRM114-Status: GOOD (  13.24  )
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

> I think it is because pl->act_link_an_mode stays at MLO_AN_INBAND, but
> it needs to be set to MLO_AN_PHY, so that only the phy determines the
> link state:
> 
> phylink_resolve() {
>     ...
> 	} else if (pl->act_link_an_mode == MLO_AN_PHY) {
> 		link_state = pl->phy_state;
>     ...
> }

phylink tries to determine the whole chain is up. As Russell says, it
could be the PCS has not got sync with the PHY for some reason. So
even if you ignore the PCS state, it might not work. This is actually
a useful pieces of information. Does the link actually work end to end
if you only look at the media state? If it does, that would indicate
the PCS is maybe missing an interrupt, or needs polling for change in
state.

	Andrew

