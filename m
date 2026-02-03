Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B7BE8782E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACroZsqXMIQuB0o6/1PDTEWKLpRas3S4wshE/11BH74=; b=S+G/Wt3wGvWm73/2L89Pz4CX77
	hSGnrFzdzEW7EqvBdrRPCv4Xl8mvyJUsOhWmAWrs7uNA5zt2l2FB+y90thffw1InA/+SKpiA5/v1J
	/lZEJHytneVayVDMr4RXRoY7Qp4L5FrHXTKqNg9b5p7U5Q1KLmm5S/vthydsfxj4J2IpW6xglUdRj
	bjHZ64ckttw67vGlviPjtg3k5wmv5ZB36EK4y4m6tf0bqWOlvbk7pYKJ+fiD5JCP2TW03EeRAIBY6
	1Gyt43QFa8LJHxrPhTp410GQskYa7LMPVSY8SHA+C8dn8sUSNERXn//OiJrhP7juJDhbLmY0M1Kfd
	LHH/LYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGhT-00000006hkX-2Rjm;
	Tue, 03 Feb 2026 13:44:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGhQ-00000006hjY-2GRL;
	Tue, 03 Feb 2026 13:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ACroZsqXMIQuB0o6/1PDTEWKLpRas3S4wshE/11BH74=; b=S3cuj6+IUGGz7JH99vQDmKZDwQ
	hmDuTS6+PmQeG/LKCVhnGJCxVERvugUKayj4rgPHPRv/ngKwo6Yv1zDD7AwmTNcLXiNWmAAh1otL6
	v6Sv7tbXkyt0v9ueQFJUcejs2eqjyTQx0V7/82pumEknpOZ+hzMpa+fSecpl/gqSv9SUzLoKbjrAU
	dk3/4vut5ZAQPOAGzQGDTckonZIt2Qjmp7PO8ROyGgDABf0k4IzfrZEfvPsNROEntktYSg4lrlJcq
	gRG+ROCg2aGf8fClskOvysa2J2EZq7ru2/0d5gZnD3+jMyzPu3+xhvoaV+JGaOxrlC3vyawBfK6ZB
	Zv3GxL9g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46718)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnGhF-00000000585-2kI0;
	Tue, 03 Feb 2026 13:44:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnGhC-000000004Qa-0ZFP;
	Tue, 03 Feb 2026 13:43:58 +0000
Date: Tue, 3 Feb 2026 13:43:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 09/10] net: stmmac: rk: remove need for
 ->set_speed() method
Message-ID: <aYH7nTGx474azyk-@shell.armlinux.org.uk>
References: <aYB2cKRu3DQh6yXK@shell.armlinux.org.uk>
 <E1vmqnM-00000007VD8-1xWo@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vmqnM-00000007VD8-1xWo@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_054412_576696_C124836D 
X-CRM114-Status: GOOD (  15.00  )
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

On Mon, Feb 02, 2026 at 10:04:36AM +0000, Russell King (Oracle) wrote:
> As we can detect whether the SoC provides the parameters necessary for
> rk_set_reg_speed(), we don't need to have explicit calls to this.
> Instead, we can move the contents of this function to
> rk_set_clk_tx_rate().
> 
> This remsoves all the .set_speed() implementations that merely go on to
> invoke rk_set_reg_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I notice that the AI review claims there is a problem with this patch,
where rk_set_clk_tx_rate() may return -EINVAL for id=1 on rk3328.

It claims:

  The new code in rk_set_clk_tx_rate() requires either
  gmii_clk_sel_mask for RGMII or rmii_clk_sel_mask/mac_speed_mask
  for RMII. For rk3328 id=1, rk3328_init() sets only clock_grf_reg
  without any clock masks, so the function falls through and returns
  -EINVAL.

It is correct that rk3328_init() doesn't set gmii_clk_sel_mask
nor rmii_clk_sel_mask/mac_speed_mask. However:

static const struct rk_gmac_ops rk3328_ops = {
...
        .clock.rmii_clk_sel_mask = BIT_U16(7),
        .clock.mac_speed_mask = BIT_U16(2),

which sets the default for these masks via:

static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
                                          struct plat_stmmacenet_data *plat,
                                          const struct rk_gmac_ops *ops)
...
        /* Set the default phy_intf_sel and RMII mode register parameters. */
        bsp_priv->gmac_grf_reg = ops->gmac_grf_reg;
        bsp_priv->gmac_phy_intf_sel_mask = ops->gmac_phy_intf_sel_mask;
        bsp_priv->gmac_rmii_mode_mask = ops->gmac_rmii_mode_mask;

        /* Set the default clock control register related parameters */
        bsp_priv->clock_grf_reg = ops->clock_grf_reg;
        bsp_priv->clock = ops->clock;

Thus the AI review is incorrect.

Not setting clock.gmii_clk_sel_mask is fine, because gmac2phy (id=1)
only supports RMII. That was documented in a later patch that, because
of the problem with AI reviews failing, is not part of this smaller
patch set:

	net: stmmac: rk: rk3328: gmac2phy only supports RMII

Given that there are sixteen Rockchip SoCs in this file, describing
in detail every change just in case AI spontaneously decides there's
a problem that doesn't exist doesn't scale.

Note that previous AI review of this very same patch but part of the
full patch series passed without issue:

https://patchwork.kernel.org/project/netdevbpf/patch/E1vkL2s-00000005uta-3W8V@rmk-PC.armlinux.org.uk/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

