Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25788C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9wElEWBovJvOOf1DvUI+RjsvvE8ShscrWbjfNUv3Nk=; b=ngqvuXlk/uGehNhX8KMW0QKjW5
	l0AiPR2t2PwTxxX35vQHPQRKg2MKonxhNd8o96VeAnYRscpbeVOVrMFZzcs3qrO08NE3c6BnWWns7
	rlKJxFNCkKMcvpvAyXg/+9xGNakzQnFaX78OJRD5hAtOtKPxWAsmPmgvuhki5WTag20dd/SUE5SUP
	b6epOccr2J5qKJXNE1XPLaCfTdTOC2KGiYeEu+HSw1PUVt6udc7oh+jXZ1uFebotrJPtcwBIM5nrM
	SSkYdvtmLAuZNxH34Ssimn2kOeLLD7Rw2hLe1RAnJ1xeVQwBao9QvMo6DUDdD240lkgo+yJ/zsRYM
	6SG59s1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfKE-00000007qGl-1nFA;
	Thu, 27 Feb 2025 14:57:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1U-00000007lQr-2S55;
	Thu, 27 Feb 2025 14:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o9wElEWBovJvOOf1DvUI+RjsvvE8ShscrWbjfNUv3Nk=; b=OXyIHZZ1tvXrCa/km8v0YugEF7
	7sxCJ7vowrI5syXgBcWaFTqrJ9q/aT2FK9vCYrEk1z6Xu/5wZJtAd8FaWmafkWj6oJe84We/y2KqB
	1pc17m/vU28WWvxmUq3bL53+weTYXOsE/xydJhWA91Lw5oq9wjutJw0o0G/MjWWtSxEOYWEpa5tqB
	FkOsRQ7p6OI1YP3KhD/nyFYNp8xLEYWWjrSiyX3qGKAENd9V0adgo9nCXgFRyp4gpwohVFLflHQ+h
	xncchPy0qPW8JbVMLUlik+hixocjjq8nCtqrKI3g1tcxoBrMAJwg+BqQpMbx6brIdnrnW3Eo001YB
	iiWgR/Yw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1R-00000003oKi-1vXC;
	Thu, 27 Feb 2025 14:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o9wElEWBovJvOOf1DvUI+RjsvvE8ShscrWbjfNUv3Nk=; b=EUBjmHVycWo358s88/CMaHaIer
	03vE5WlQfhXVEt9GP/CTjr8AI/Mx0NieqpqmHndaK8PVimd4ABy/Msw8Wj+xZ5GIeb00TWp5CPG0T
	E0Eku+bOI/E7I+Ksbxi25HhMETqDi7FPNuxYfol6DySV97otcVlQ1Oc/XMxWi5EKGbgBAbMHh3sJ6
	pg4+VHeZQO0++SQqOLVeKKKeBYPz5xRgbw3p9AJVcBEZ5fw5eKs6CoUA1m8sMcsxh90MrFTRxaPp6
	9TGnDSYrxp9APRvo8mI2RLY9yGBawG0FbVfVKXvzeF9YQrp7H28U+hPX2zWI2lkjrTXI/trTHnnXl
	BR+XUHsw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38678)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnezF-0007PU-0U;
	Thu, 27 Feb 2025 14:35:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnezB-0008CU-1N;
	Thu, 27 Feb 2025 14:35:37 +0000
Date: Thu, 27 Feb 2025 14:35:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 10/11] net: stmmac: meson: switch to use
 set_clk_tx_rate() hook
Message-ID: <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
 <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143757_845569_6D02EB0D 
X-CRM114-Status: GOOD (  18.16  )
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

On Thu, Feb 27, 2025 at 03:18:22PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 27/02/2025 10:17, Russell King (Oracle) wrote:
> > Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> > manage the transmit clock.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > index b115b7873cef..07c504d07604 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > @@ -22,9 +22,10 @@ struct meson_dwmac {
> >   	void __iomem	*reg;
> >   };
> > -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
> > +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> > +					phy_interface_t interface, int speed)
> 
> You can keep priv as first argument name and remove the next changes

I *can* but I don't want to. Inside the bulk of the stmmac driver,
"priv" is used with struct stmmac_priv. "plat_dat" is used with
struct plat_stmmacenet_data.

Having different parts of the driver use the same local variable
name for different structures is confusing, and has already lead to
errors. Consistency is key. This is called "bsp_priv" in
struct plat_stmmacenet_data, and therefore it should be referred to
as "bsp_priv".

I am not yet going to be doing a big rename, but it *will* come in
time.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

