Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF7CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i8hy4I4lhZmL+EEXM3yS2UscyTn4FYoKIxBvgeZOabU=; b=ghEHjSfbs4u1QYXWwyDaQ8aogi
	lsChr9Q23Bg24EG8iv2xTMhOo6oKIOvYrmdyRlBEwrw8zbglQS6TjEc4kbhQsXsOYTGjlqj4q0oyk
	6c2AngzgyjmW8CRTqafwhIxP3ot38jOwa0ZGsd5s9CefrvFca9bCdiew8DZgD644nfwEKNDm4Vgpg
	EDX/eYm4hKAjMJoVYpuMcHMN9slDQ1MTauxaEbPP49fRh9pHEZ3WRyp0vUPcFMnDq6Ni0O/hFWy8h
	XimOO/3/wC+rqQAYBCoXEPgkirU1yQIimcLQv7ghz4KYHMwybvaJ5+vbyuMhv6jB/A+qZJ1ECmr3T
	0xJOw0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jC1-00000007klP-0JAk;
	Fri, 17 Oct 2025 12:04:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jBy-00000007kkU-3rcz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 12:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=i8hy4I4lhZmL+EEXM3yS2UscyTn4FYoKIxBvgeZOabU=; b=FsmXXUwEUI73GcGhA93kBRoK8V
	U9jQNfasyde8W/NscjXd2coVccGNMYG3n5x/u/akeQ76qfXEt605no2ztZKiVPhGHFAzWWxZkTf0v
	3+AoJK+hdMsRagq5R3hlP6qw+0/410UJMJ0ZrdD7vnpYeAbyBNeYss6iecCl8wY4ENigziqmmxAQH
	HCzH86NtMvtQl7OFOJE29kup8YjQE2cIPv1RImRdH0ctOkUNe2UkN7EUsIryvjJT3Kdr25NaqNmL0
	GfcjR8bxP8GHO2f3Bya5IeMrczeeHu8C0KBR62NGWmlMGiGA5oC9C1IvnaDmlbpRwMeqcNQFoVBIA
	X9K2p9UA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jBv-00000007Yad-3CcE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i8hy4I4lhZmL+EEXM3yS2UscyTn4FYoKIxBvgeZOabU=; b=tZTlu/6OIKaBb+A4VKrWCxXjZN
	5Rs9ynrQsIONsvNEONgyNruAKzRbBFv6WoMND58aJn4jL2jAv74EzvmPwDUrClpQYNrzJ5W511CV6
	cDhA4z+jmMNUOZYiLmRYJbqX1CVuV2Kyhf7eakaJ6+9Hnf4aaQ4OkI7KkhD8J2eLeMjYkgUXgXDoS
	WMzE0zgQ5Pc59xxud7RL03vGiRRfPoCMBopvHFg+lZcsC2wo7wuT4brmhGDHhpT/+qqzqsiOZKvKy
	xfU3WQLMIZ+EBRMTx7F51cNoLQz0blIHPVFaSjwFT75EErV1sdwC3z46KSHHPTToSZ7WCCAFwpLL5
	8v5APkNw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40520)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v9jBf-000000007op-1gwt;
	Fri, 17 Oct 2025 13:03:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v9jBa-000000004Hj-2XOP;
	Fri, 17 Oct 2025 13:03:54 +0100
Date: Fri, 17 Oct 2025 13:03:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>
Subject: [PATCH net-next 0/6] net: add phylink managed WoL and convert stmmac
Message-ID: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_130415_996311_2EB19DC0 
X-CRM114-Status: GOOD (  19.05  )
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

This series is implementing the thoughts of Andrew, Florian and myself
to improve the quality of Wake-on-Lan (WoL) implementations.

This changes nothing for MAC drivers that do not wish to participate in
this, but if they do, then they gain the benefit of phylink configuring
WoL at the point closest to the media as possible.

We first need to solve the problem that the multitude of PHY drivers
report their device supports WoL, but are not capable of waking the
system. Correcting this is fundamental to choosing where WoL should be
enabled - a mis-reported WoL support can render WoL completely
ineffective.

The only PHY drivers which uses the driver model's wakeup support is
drivers/net/phy/broadcom.c, and until recently, realtek. This means
we have the opportunity for PHY drivers to be _correctly_ converted
to use this method of signalling wake-up capability only when they can
actually wake the system, and thus providing a way for phylink to
know whether to use PHY-based WoL at all.

However, a PHY driver not implementing that logic doesn't become a
blocker to MACs wanting to convert. In full, the logic is:

- phylink supports a flag, wol_phy_legacy, which forces phylink to use
  the PHY-based WoL even if the MDIO device is not marked as wake-up
  capable.

- when wol_phy_legacy is not set, we check whether the PHY MDIO device
  is wake-up capable. If it is, we offer the WoL request to the PHY.

- if neither wol_phy_legacy is set, or the PHY is not wake-up capable,
  we do not offer the WoL request to the PHY.

In both cases, after setting any PHY based WoL, we remove the options
that the PHY now reports are enabled from the options mask, and offer
these (if any) to the MAC. The mac will get a "mac_set_wol()" method
call when any settings change.

Phylink mainatains the WoL state for the MAC, so there's no need for
a "mac_get_wol()" method. There may be the need to set the initial
state but this is not supported at present.

I've also added support for doing the PHY speed-up/speed-down at
suspend/resume time depending on the WoL state, which takes another
issue from the MAC authors.

Lastly, with phylink now having the full picture for WoL, the
"mac_wol" argument for phylink_suspend() becomes redundant, and for
MAC drivers that implement mac_set_wol(), the value passed becomes
irrelevant.

Changes since RFC:
- patch 3: fix location of phylink_xxx_supports_wol() helpers
- patch 3: handle sopass for WAKE_MAGICSECURE only when the MAC is
  handling magic secure.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 11 +--
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 31 +-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 45 +++++++----
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 +-
 drivers/net/phy/phy_device.c                       | 14 +++-
 drivers/net/phy/phylink.c                          | 92 +++++++++++++++++++++-
 include/linux/phy.h                                | 21 +++++
 include/linux/phylink.h                            | 28 +++++++
 8 files changed, 182 insertions(+), 64 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

