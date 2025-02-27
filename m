Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F75AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZ0rC//sE06hPYVngKetF+Xs1DKrHPyHj2XylN4/E1I=; b=a1+tiDBQdnHGuBKdfJLaK8VQDZ
	BZMlCWo3fJSttcmsw2Uk4hD4aWIc3ymCJd6DEvI7fZ/APZ/SzgI0mIk6vB1Akr3ore2MO9Cv4sdra
	9jF7U/LT6KtNqIE0/KhlSfXJn+U1HCQEp+PDkOoD7F4/4F+iHUw88Hf1bpFk8N9p/5Co9hKQ2BlRW
	rFZmEL2QPQ2ekUr5C9cpBOpNBoCw4OVIgSRtg86OiGbc3egUvnTZLNOZwpFTqd3wmZzcEJ6yIpN6a
	Qux1DbbYK/3npWckNnrxFFKrVQpScyRz0mINgttjJXw9W60n1NajErNUKG4cL5n88z4vTGA6ZdYcG
	RKwo1uwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhI-00000008U1t-1j13;
	Thu, 27 Feb 2025 19:37:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfJH-00000007q4Q-1NGN;
	Thu, 27 Feb 2025 14:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JZ0rC//sE06hPYVngKetF+Xs1DKrHPyHj2XylN4/E1I=; b=ZH5nw2HmODeAQoGF5DwatfyRge
	+AUj4ZofsP5hrrQshUdx0NTfcOTcd0tqxPCrtp8XyTAidSTzSozayjo2LiC0BN9fB8BWk8CY8ZHKs
	11tHep8i8RET06cu+C1Bi7sMZ4F9/O2toXvO+0tdoGMg8QPJYBQOe1FYgQW3zvab1IPI363kK57TP
	kPC3nL/5VU1GGO8Ur+zAH0nT0pp3kB16gwYYMR2YEUHWeZalIO3BovKycBe+bkMg3XKVwynxoSw1v
	E+IAuGrytIT/0lY/KRfWfujqysevSnma6znK3JlmuO0u3z0kPf/CWLKPTpBHhN6DWuHYCmnEWKPJJ
	J6IIAaYQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57152)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tnfJ8-0007Un-1W;
	Thu, 27 Feb 2025 14:56:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tnfJ5-0008Dz-0M;
	Thu, 27 Feb 2025 14:56:11 +0000
Date: Thu, 27 Feb 2025 14:56:10 +0000
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
Message-ID: <Z8B9Cie3nFVY7mMS@shell.armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
 <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
 <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
 <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_065623_364007_4A083480 
X-CRM114-Status: GOOD (  21.01  )
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

On Thu, Feb 27, 2025 at 03:38:53PM +0100, Neil Armstrong wrote:
> On 27/02/2025 15:35, Russell King (Oracle) wrote:
> > On Thu, Feb 27, 2025 at 03:18:22PM +0100, Neil Armstrong wrote:
> > > Hi,
> > > 
> > > On 27/02/2025 10:17, Russell King (Oracle) wrote:
> > > > Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> > > > manage the transmit clock.
> > > > 
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >    drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
> > > >    1 file changed, 6 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > > > index b115b7873cef..07c504d07604 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> > > > @@ -22,9 +22,10 @@ struct meson_dwmac {
> > > >    	void __iomem	*reg;
> > > >    };
> > > > -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
> > > > +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> > > > +					phy_interface_t interface, int speed)
> > > 
> > > You can keep priv as first argument name and remove the next changes
> > 
> > I *can* but I don't want to. Inside the bulk of the stmmac driver,
> > "priv" is used with struct stmmac_priv. "plat_dat" is used with
> > struct plat_stmmacenet_data.
> 
> Right, it's still an unrelated change in this case.

This is a new method, even though it happens to have mostly the same
body. All instances of this new method use "bsp_priv" for this argument,
therefore it is consistent.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

