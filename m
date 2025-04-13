Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321B1C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kXxKWG4xnX5hbgFzNzMCOzAiI2t1KSHm3OrucboMKI=; b=cqMB1kE/jC8vEIyjSFQSCoOaWO
	9yboAIJti0vSS3UJIH8R6RQUpzXuLbvcvBRA/YGxGGzJb915T1z5+Q88DMkWSrgm1vBUsJX0Uf+7n
	OnvlCR+WXWsIarDdoPCaGx8yX3oVvvv2D1mSks80DW579ei3rb/eytirMcm2ys96qIAuBAJ/PFm+7
	2z1gZQ0D0HDlel4buHfijRlpY4h+jEIx2jABJ2UnhXnTdnBtpzb3LJVZfq4HjvtkLM5Khh9rFVolx
	k5JPmVxWfB2eZkRb3GUfiUA8kQrDQBqMMgg2mdotIF0OWW8WcYt4ynHHTDrlOl6+/7Ik8RIwy2Tj+
	FNPdsUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44oR-00000000AsD-3xAd;
	Sun, 13 Apr 2025 21:24:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44bU-000000009AO-3aER
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4kXxKWG4xnX5hbgFzNzMCOzAiI2t1KSHm3OrucboMKI=; b=HtE2hq4wUD8Cedqn/0watg9XD0
	m1hv00N5hhgIS9i6yL0CBPklVuO7PalWSplRcwQflKmyTsRm51/IWjXFHx+YhDumsFwuhtbVNuK5a
	o7ixMxuvACbi9qMjLyjJ3GAWjj+GfLUzU8j5ZfPjDFdORhK87cRfxpZhMJqKrYvHwoFE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44bP-0096PC-M0; Sun, 13 Apr 2025 23:10:55 +0200
Date: Sun, 13 Apr 2025 23:10:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: imx: use stmmac_pltfr_probe()
Message-ID: <e4688664-7ebe-41a8-937b-5a308123fb39@lunn.ch>
References: <E1u3bfm-000Enq-MC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bfm-000Enq-MC@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_141100_895408_A4B75968 
X-CRM114-Status: UNSURE (   7.14  )
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

On Sat, Apr 12, 2025 at 03:17:30PM +0100, Russell King (Oracle) wrote:
> Using stmmac_pltfr_probe() simplifies the probe function. This will not
> only call plat_dat->init (imx_dwmac_init), but also plat_dat->exit
> (imx_dwmac_exit) appropriately if stmmac_dvr_probe() fails. This
> results in an overall simplification of the glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

