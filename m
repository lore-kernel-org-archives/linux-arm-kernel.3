Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ACFC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OtjDlLbUztiJngJj615sfGvrPHCmRzt+Ij9++qW0iv0=; b=OUXiyDSFnPp2yrMgzvglM2F0jz
	UIvZJQhZyV6YXn/QJBvn5BXCZPhP+nrEajtX6xEb+F+IwHQxNFM/6eJSKRBBbwr8Y1tprEc86k6/o
	xhbKRrNaX0kHTOUT1sW4YxSLzhrLwGOllGm5vjzXFTBaFd9JJ77vQU6qjK/4onhhLm4y3ImsoNM/k
	1opeb3GiMx5Ecs0sDuIhebphAhk0eXnErgib1rSgilQQuEtrMNs4QfRE2Yn7ix2owUoMaUZISLxON
	XGqRhDUaD/qeb5oVyyUHZizxP2sc7EKKSliHqAu3nvNB0C0RpwpQBkpNcgKNe7pMjWa1G9Vl7EpfE
	hrs2Jw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bjP-0000000G0RX-22wD;
	Sat, 12 Apr 2025 14:21:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bff-0000000Fztk-0Bci
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OtjDlLbUztiJngJj615sfGvrPHCmRzt+Ij9++qW0iv0=; b=oLiq7EDTmcuh7vV+BKaStrDDI+
	6KczhnhqWmmOl5mf0KDMGjzKiKUtbq6DniZR4ZHsk3imdeKIZ4qyHXQpnJTTr0SxSs3zOrefBVFmH
	1evwFHWCYpVkMaySIeGh+t4E3+h+KSzbQvIdgMLc4f/uE6oMnkJnSSYq2hfXDFXfqzPxqZlxwKZ8B
	8a0YtQjCUzmQIIlZzszOvVt+MfG96xjdGMGOC03CyuUwBeS4AxUXSn4n1goYb+T5Mtryjxn09UE+h
	PQSicZcI2r1ZVR+we6ejQU+YvUn46F2h9yRv/QYbIj2pDhcf7bf5pfdZkIsqxtdPaUz1qMT8PJRPB
	FrR/K1vA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44230)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u3bfY-0004bl-34;
	Sat, 12 Apr 2025 15:17:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u3bfW-0005jD-2S;
	Sat, 12 Apr 2025 15:17:14 +0100
Date: Sat, 12 Apr 2025 15:17:14 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/4] net: stmmac: anarion: cleanups
Message-ID: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071723_087188_C64EE458 
X-CRM114-Status: UNSURE (   8.17  )
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

A series of cleanups to the anarion glue driver.

Clean up anarion_config_dt() error handling, printing a human readable
error rather than the numeric errno, and use ERR_CAST().

Using a switch statement with incorrect "fallthrough;" for RGMII vs
non-RGMII is unnecessary when we have phy_interface_mode_is_rgmii().
Convert to use the helper.

Use stmmac_pltfr_probe() rahter than open-coding the call to the
init function (which stmmac_pltfr_probe() will do for us.)

Finally, convert to use devm_stmmac_pltfr_probe() which allows the
removal of the .remove initialiser in the driver structure.

 .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 25 +++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

