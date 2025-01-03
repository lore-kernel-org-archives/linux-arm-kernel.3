Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C758E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KnnKr1tOZVG12cK+LLFuxnU9SlvnnOfbe1CXtqwo2co=; b=CLbwJmWrkODj07ksDjb5/GComd
	U1BzQ+kLhIOnsyPeTvmuhzpqaKLHBfmMvjYDANGWKa8k0aRKFiAGmJgfAwFry7QJZs82zSpU9oiym
	P6ZZVKqTvk3CMnRnpcnVOz8GEqRNcutqRWonKNKcPRa53dT5wjqqCcGhY7OEPJB/tt9PCcpRB1aLR
	IXMhlTLBprKhNwvsS3QYqTcUr/xy48g9c3iFrxuxc13qGcXqqfNwcT0kACRVyj8UW0GfLJ+SaYdy5
	TsxDw72bQ+8D/KsUm8J1JJEXdWHwUh5e3XURyz5MpVvzkBoPPLUMt26dQMCxgkDdW7FLzVLp9ArOe
	xQBwHxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfgX-0000000CoMu-12oK;
	Fri, 03 Jan 2025 11:17:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTffJ-0000000Co0s-3z3z;
	Fri, 03 Jan 2025 11:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KnnKr1tOZVG12cK+LLFuxnU9SlvnnOfbe1CXtqwo2co=; b=omu4oSb2n/Rx3anVtN7y8fsq6W
	ILbT06ESY8/18a0G6Ad4YiG8uXgbgd8tbeEuBBkTzg9YBJD6H/UkK/6vmh9BhGmWeWg5pDxeBoO+r
	EmcLWybCYb+EcQCxZKg0O/KOhAklMJgpzc7kc6eMm2yDrHmsLA6dWTJrQnmjhYFs0J7a3xkTp3v0b
	7ZwaxxwEJFfvNiD6ifORIUJnEUixetrKN8hGBATpO4Kk5ajHUf8lerm1RZMzyQ4y6Qs7v/u485vsS
	2phrRtLXhA8QRs9kPW4ke7a1I5gNa6M+icLSRRmZwdPF8Vh8d4vzqgXUrXJBK+ZglEUaE4H5ua5XA
	qmVOteUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38220)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTff2-0002zj-35;
	Fri, 03 Jan 2025 11:16:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTfew-0001H9-1H;
	Fri, 03 Jan 2025 11:16:06 +0000
Date: Fri, 3 Jan 2025 11:16:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/6] net: pcs: add supported_interfaces bitmap for
 PCS
Message-ID: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_031629_986739_2D6E6B91 
X-CRM114-Status: GOOD (  13.20  )
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

Hi,

This series adds supported_interfaces for PCS, which gives MAC code a
way to determine the interface modes that the PCS supports without
having to implement functions such as xpcs_get_interfaces(), or
workarounds such as in

https://lore.kernel.org/r/20241213090526.71516-3-maxime.chevallier@bootlin.com

Patch 1 adds the new bitmask to struct phylink_pcs, and code within
phylink to validate that the PCS returned by the MAC driver supports
the interface mode - but only if this bitmask is non-empty.

Patch 2 through 4 fills in the interface modes for XPCS, Mediatek LynxI
and Lynx PCS.

Patch 5 adds support to stmmac to make use of this bitmask when filling
in phylink_config.supported_interfaces, eliminating the call to
xpcs_get_interfaces.

As xpcs_get_interfaces() is now unused outside of pcs-xpcs.c, patch 6
makes this function static and removes it from the header file.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++++--
 drivers/net/pcs/pcs-lynx.c                        | 13 +++++++++++++
 drivers/net/pcs/pcs-mtk-lynxi.c                   |  4 ++++
 drivers/net/pcs/pcs-xpcs.c                        |  5 +++--
 drivers/net/phy/phylink.c                         | 11 +++++++++++
 include/linux/pcs/pcs-xpcs.h                      |  1 -
 include/linux/phylink.h                           |  3 +++
 7 files changed, 43 insertions(+), 5 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

