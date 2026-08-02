Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A0AC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1U1AtcK16K4ZDhnzb8W6FriM/O+cMuIM/9uVsxCuh4=; b=qDNlvwSbxAEwVhHoHl2xBAqw6R
	PkGxn7KvOM1spxnscCUCEu8dQRancwrx288tR5g/tx4wmRu1S4ZLrKFruG5X7zO2XGo1qgY+/k3+e
	8erxuoo3nUz/Tgi6w4UAYilebcpwU6JBY3dTzVWfC4h53eP57fNr3LzX1Yb0JHgDmy/fdlXXkNaIN
	duYSFl2EU3nYdHVR0XPWFioGqfc64UYFoNh4gfImMoHLCNCVeR/td+hPKiabI/ofJ+ugs6Zi5OAbf
	BBkdoDPsTHQB+gTIeYE3XST7gR84OPCIfK39lPw8tazj0XPpKy7es/3ak8OAV1C55KOHF/DMCRosN
	ai1Aoo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqL1d-0000000FFQc-08iL;
	Sun, 02 Aug 2026 01:30:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqL1a-0000000FFPn-3VwH;
	Sun, 02 Aug 2026 01:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=i1U1AtcK16K4ZDhnzb8W6FriM/O+cMuIM/9uVsxCuh4=; b=PB3BuyjWCE4sq287tegfpOJ1UZ
	tRhEngfMmVJI6x8qTAGVrvuonUtnZUxkDXvluNybitc/70r7DpcgZA0iXAjEJYDQJzohJBTf/vpi6
	IC5FYvOuZZFWb5ZZSDTf/n4xEVDz4ZKN+hstQnN4p6Eiakd97zsIMgVnlbmKhlCirJcQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqL1D-00FRwx-29; Sun, 02 Aug 2026 03:29:35 +0200
Date: Sun, 2 Aug 2026 03:29:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
Message-ID: <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-9-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801142244.679437-9-coiaprant@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_182958_881169_1FC8BD8F 
X-CRM114-Status: GOOD (  15.88  )
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

On Sat, Aug 01, 2026 at 10:22:31PM +0800, Coia Prant wrote:
> The RK3568 SoC integrates a Synopsys DesignWare XPCS that is accessed
> via APB3 memory-mapped registers.
> This driver provides the glue logic to make the XPCS accessible to
> the generic pcs-xpcs core.
> 
> The XPCS block contains four MII ports (0..3), each of which can be
> routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
> The hardware maps these ports to different MMDs:
>   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
>   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
>   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
>   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)

Why is port 0 called ROCKCHIP_MMD_MII not ROCKCHIP_MMD_MII0 ?

> This driver creates a virtual MDIO bus that translates MDIO operations
> to APB3 register accesses, with proper address remapping for each port.
> The generic xpcs driver then creates a phylink_pcs instance on top of
> this bus, allowing the MAC to use the PCS via the standard phylink API.

I would put some of this into the driver itself, but reading the code
it is not so obvious.

> +static int xpcs_rk_read_c22(struct mii_bus *bus, int addr, int reg)
> +{
> +	struct dw_xpcs_rk *pxpcs = bus->priv;
> +	int dev;
> +
> +	if (!xpcs_rk_mdio_addr_validate(addr))
> +		return -ENODEV;
> +
> +	dev = xpcs_rk_mdio_read_remapping(addr, MDIO_MMD_VEND2, reg);

Does this mean C22 registers are mapped into the first 32 of C45
MDIO_MMD_VEND2?

> +static int xpcs_rk_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> +{
> +	struct dw_xpcs_rk *pxpcs = bus->priv;
> +
> +	if (!xpcs_rk_mdio_addr_validate(addr))
> +		return -ENODEV;
> +
> +	dev = xpcs_rk_mdio_read_remapping(addr, dev, reg);

Should it be returning an error for dev == MDIO_MMD_VEND2? Or at least
if reg < 32?

Andrew

