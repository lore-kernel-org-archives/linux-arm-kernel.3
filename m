Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D51C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8u1HFNvQFj00JNaA7UaE7kZ0fKIp/C21Or6VG3Kq3c=; b=VEbLYkgDnbhHcvaoEgSMSH1crb
	v4Hynk5x+TbN9+nAWUlczxyVsUXfFgmy205qRfWvMG5UD0jCtK9si3Neke2j4isDmlrccQt3ko9CU
	gbeRN/FfJat27lUn3iTrJWcIf1rgScztwt37YBTC9tA6KrQmwNYoTWzcXR3mSSPZBhnpZImShHMNW
	vLHBirTtyLOyImO67ncSHg9HSEYJOjiFf9R9Z6D/CB5GDxSdsGHE7+HqjmY4tqPRD8JymIYvKb0+2
	N9J+rDUFVo0Dx21Ij1YykkUkQAjns6Z+ZIjVuV7MwvkP2YoqQZ3dcnG4J2JdGteOIx0Cx0H0NzKJ5
	DiGKKzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL6L-00000007p5B-172x;
	Tue, 18 Feb 2025 10:45:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL2Q-00000007oHg-0yxW;
	Tue, 18 Feb 2025 10:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z8u1HFNvQFj00JNaA7UaE7kZ0fKIp/C21Or6VG3Kq3c=; b=o6c4u2Hq6aOiw0zopooYt7wvcp
	E3+jJCUM7nHq46JD0aXLOfQ5Jm9ZhiuFSdXnxjiWn9cVMEovMxHN7TD4ujzEjPQEVc6txt7E4gDph
	BHWvbtGL9aaT4ZgG0CHp7d6oKKCXz32SmZ0jB9UccZ/92My6rP3+Y5OrkuvJ8ftIm4VjlE02Pbr4k
	nIrWR3UsptipUVbzuYoaJvi8ShzHrPLpO88aDnZusLz1wytWrp0eazSi9VGFBz9Pa7EZgViJT1rCI
	Ae0dUoitzhjc8huX/pRHtI95OX5/ZxGGj5lqlzmrV1FnqdO7uzbiTcQG61C0pcjWDafsPxQS+tWSX
	ji52VNQQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkL1a-0001bu-2a;
	Tue, 18 Feb 2025 10:40:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkL1S-0007CN-2u;
	Tue, 18 Feb 2025 10:40:14 +0000
Date: Tue, 18 Feb 2025 10:40:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_024114_278883_29D026B7 
X-CRM114-Status: GOOD (  34.42  )
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

On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > any platform with these clock can reuse it.
> > > > > 
> > > > > Great
> > > > > 
> > > > > The next problem will be, has everybody called it the same thing in
> > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > accident.
> > > > 
> > > > Tegra186: "tx"
> > > > imx: "tx"
> > > > intel: "tx_clk"
> > > > rk: "clk_mac_speed"
> > > > s32: "tx"
> > > > starfive: "tx"
> > > > sti: "sti-ethclk"
> > > > 
> > > 
> > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > extra calibration logic.
> > 
> > Yep, that's what I meant by "Tegra186" above.
> > 
> > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > that horse has already bolted.
> > > > 
> > > 
> > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > needs to take it, as this rx clock is also mentioned in the databook.
> > 
> > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > seems to be limited to RGMII.
> > 
> > This seems weird as the receive clock is supposed to be supplied by the
> > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > 
> > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > input on the DWMAC(4) core.
> > 
> 
> RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> follows this set rate logic. 

Sorry, I find this ambiguous. "This" doesn't tell me whether you are
referring to either what s32 does (setting the "rx" clock to 125MHz
only) or what RGMII spec says about RX_CLK (which is that it comes from
the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
and MII modes.

clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
tree is configured for RMII mode, the rate on clk_rx_i depends on the
MAC speed (10/100Mbps).

This suggests as far as the core is concerned, the clock supplied as
clk_rx_i isn't a fixed rate clock but depends on the speed just like
the transmit clock.

> For other things, I agree with you. A fixed "rx" clock does reach the
> limit of what I know. And the databook told nothing about it. As we
> can not determine the rx clock of s32 and it may be set for the phy,
> it will be better to not move it into the core.

I'm intending to leave s32's rx clock alone for this reason as it does
not match what I expect. Maybe on s32 there is a bunch of dividers
which are selected by the mac_speed_o signals from the core to divide
the 125MHz clock down to 25 or 2.5MHz for 100 and 10Mbps respectively.
As I don't know, it's safer that I leave it alone as that means the
"rx" clock used there is not clk_rx_i.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

