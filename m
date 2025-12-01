Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2ADD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTEiKyqnmpUyfKxvjtjoMwds4d2cP+VOremdDYjxN14=; b=SodxncP5zpMV38WJuK4fz44/C/
	rHjO53d/b9u1QUHRxADEOMuJQenn4e84A7/i5fJPAVw2F77A0Vpx5FwRS0H2eFxvrGwM8mKwgtUdK
	zWwRdjy+PtRR4oSJdGMa/7lwSe7K1TThJZyL+8yiDuU2GoVhzFJWD5PnP16if753Vi6V5GSvvUseY
	bRtIi6enpr6TgDHm9dLzABq0d2oMzAwpMuxNnbGE43+NWGFFCnZoEtnAB0T0qAagqgYayYaZex1tL
	MRUoBJxBqbmpdx345cvZd3nEbea0xxKpzshk5AsQC+QaF5p3KODVk3N6hONvnPYvrmjVtyMXcwZNd
	OdzsR9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6FU-00000004Dss-2gOe;
	Mon, 01 Dec 2025 15:55:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6FS-00000004Drn-1eDp;
	Mon, 01 Dec 2025 15:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VTEiKyqnmpUyfKxvjtjoMwds4d2cP+VOremdDYjxN14=; b=MJqNBU9jtl/amP4JSRy7O4++9+
	btazn7HSDXfN6POHrEsydPVxIK8vtRn/pcrN5i/818rW83TX8lk8E4U7PI0sIvcEm+rQzYvw6Mwfm
	eQj6EEWt9c7s0tnSNbBwr7BFCqAFh6VewGz7n7AFmAYjD6dhZGwPGL+J+PVN2UiqT1Vw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vQ6FF-00FaUH-DN; Mon, 01 Dec 2025 16:55:21 +0100
Date: Mon, 1 Dec 2025 16:55:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 00/15] net: stmmac: rk: cleanups galore
Message-ID: <05db9d3e-88fa-42db-8731-b77039c60efa@lunn.ch>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_075534_433421_643B894F 
X-CRM114-Status: GOOD (  14.82  )
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

> One of the interesting things is that this appears to deal with RGMII
> delays at the MAC end of the link, but there's no way to tell phylib
> that's the case. I've not looked deeply into what is going on there,
> but it is surprising that the driver insists that the delays (in
> register values?) are provided, but then ignores them depending on the
> exact RGMII mode selected.

Yes, many Rockchip .dts files use phy-mode = 'rgmii', and then do the
delays in the MAC. I've been pushing back on this for a while now, and
in most cases, it is possible to set the delays to 0, and use
'rgmii-id'.

Unfortunately, the vendor version of the driver comes with a debugfs
interface which puts the PHY into loopback, and then steps through the
different delay values to find the range of values which result in no
packet loss. The vendor documentation then recommends
phy-mode='rgmii', and set the delays to the middle value for this
range. So the vendor is leading developers up the garden path.

These delay values also appear to be magical. There has been at least
one attempt to reverse engineer the values back to ns, but it was not
possible to get consistent results across a collection of boards.

       Andrew

