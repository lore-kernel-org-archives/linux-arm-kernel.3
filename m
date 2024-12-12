Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1417BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZkrXX153lKu3k/l3jT/iu1cloY9TaUjnBUlB62dxb9w=; b=C3pI4XXWC8t7cE+vKNGzm0A7K4
	IV+n9fDz3ABCXl3OVsQmrU2zY6fX1QRKz7ppGTvuJ9mE9w5vjAbNQp7+unUOmfqoOiKwjLsluehSN
	wfrXLebKGre6n6Fhuz3bO5f/0UsrJW6u6MT0sqBAE7JhnHK80ifwI9eXbF2+kOIEZ92R1JFm8AfUy
	GRIwfoOOc9nZkpWssPoc19HsGSSOomlsWmc3eBuDVMRg9xME0eiCTyynnl3gd9rzZ53613y64LqhU
	/OUae1/Op8scL4odYXkOtf5DKoaYkFTLWjaWqMUpucfpqrHQ2tIptDgmiMyo8T6FhWG+5m2GMOcV8
	PD0rC2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkTQ-00000000f3y-2RXb;
	Thu, 12 Dec 2024 14:47:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkSL-00000000epW-3UNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 14:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZkrXX153lKu3k/l3jT/iu1cloY9TaUjnBUlB62dxb9w=; b=ZQWhfJRJtI5LqxCpw7MJ14SgcT
	vXk32dFCdmOPf+ZiAv1JAf0ZBJbhLG6BodeEN6UHNB5uBqDSjcZQdel0JS0QwAVCE1FaNIMEd8qvb
	KfpwjB7bwyrnKOm+DEY2f8xhcCaf2Qa4aEbj8MGY0WPYf7nqf3KwQ4cQqBIMXin0sAquDVB4tWmRD
	YBIO4h3SjY3LA5ft1qPdX9UqnlltVOZ73wqQIYg6UfdqzKVdQn/fXgHafIYqwk5J2hPgfJ+Y0BGQ8
	fSWJhhBWO4WqjnfWArVzmwB04MtzVvs25hjlIYAxHGlmKNq75f8w0FoVDmz0hPNl1q8l8PEeHZj7a
	tYIfrYsg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44810)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tLkSD-0005KA-0D;
	Thu, 12 Dec 2024 14:46:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tLkS9-0005PQ-1i;
	Thu, 12 Dec 2024 14:46:09 +0000
Date: Thu, 12 Dec 2024 14:46:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/7] net: stmmac: clean up and fix EEE implementation
Message-ID: <Z1r3MWZOt36SgGxf@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_064621_868020_AB3643F6 
X-CRM114-Status: GOOD (  10.42  )
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

This is a rework of stmmac's EEE support in light of the addition of EEE
management to phylib.

Patch 1 adds configuration of the receive clock phy_eee_rx_clock_stop()
(which was part of another series.)

Patch 2 moves the tracking of tx_lpi_timer to phylib.

Patch 3 makes stmmac EEE state depend on phylib's enable_tx_lpi flag.

Patch 4 removes redundant code from the ethtool EEE operations.

Patch 5 removes the driver private tx_lpi_enabled, which will now be
managed by phylib.

Patch 6 removes the dependence of EEE error statistics on the EEE
enable state, instead depending on whether EEE is supported by the
hardware.

Patch 7 removes phy_init_eee(), instead using phy_eee_rx_clock_stop()
to configure whether the PHY may stop the receive clock.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 -
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 25 ++------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 26 +++++++++++++--------
 drivers/net/phy/phy.c                              | 27 ++++++++++++++++++----
 include/linux/phy.h                                |  1 +
 5 files changed, 42 insertions(+), 38 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

