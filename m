Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F73C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3C4qr/FhtbdmuHtZf4xYJuWPpDOV55jd2UZ3CTOGfBc=; b=UV99XRl5BeXxR2IoxKBr3/eJB2
	NZjrXaVYOZMH5rnns8EpZxWhU1nE8NxYNwS+yVePoOU2XUo06X7SQr0s23G7ui55UUNgMjOrgcu4c
	qP0EWsYbEI1meQNYT7adH8elO0azLl9hoVIbe8hz74Jfi9iMXy+XPEML8gZqNcnYPWSeBA2ySuVgW
	d3rGT6J+FQ3Qdu6jXllxyzhogaIz1L/sHbNH6zcbulqvV3tvJN7oSn/i2vL1Zwp7FI28DMr6mB+Fd
	B6pHR79EXVngsXIuHnwekOplIlBEu69k9SHk7UGfHj9gqn8OmQUTX6mc+4+GGn+78bas88NxdFqzf
	Is7sToHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug5l6-0000000D2ku-2acX;
	Sun, 27 Jul 2025 18:06:04 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug5iY-0000000D2Pu-1PeE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 18:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1753639405;
 bh=3C4qr/FhtbdmuHtZf4xYJuWPpDOV55jd2UZ3CTOGfBc=;
 b=tPlwoUvEkcUYseKyG2xvdF020KyQtFVogedEq23KgflTbn0oDbKLcDx5PBmITEw8wE4vviyQG
 lcHkvQCuh66r+ytZDCDRUHj/sdij2p2q0QzTLrnc7jd0BoJ8B/TukA9Mh2+EcMLFchtWP2VD4sb
 OmiO40JnVErpFJyyztlnw8EVwUPAaVYlvpZxgzKN/s5WmX65t+wmKsMldWIpRzTa0gVQyhUFKkR
 WsFNhHGv/m2Y2RxjUkkQj4JrPBhRv97bbIaoFfUWyAX1/wnrQ0E+mAFRGKWcpMuaD3XvenW7Ste
 tbEZsYbki+bUQjeDrEGklS2A3AI5FTGU6hq6he2D4/5w==
X-Forward-Email-ID: 688669dfc509b9ee169cf2fc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Heiko Stuebner <heiko@sntech.de>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH net-next 0/3] net: dsa: realtek: Add support for use of an optional mdio node
Date: Sun, 27 Jul 2025 18:02:57 +0000
Message-ID: <20250727180305.381483-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_110326_709615_35002516 
X-CRM114-Status: GOOD (  11.41  )
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

The Radxa E24C, a Rockchip RK3528A based device, uses a MDIO-connected
RTL8367RB-VB switch to expose four Ethernet ports on the device.

Trying to describe this switch in the device tree in a way that makes
it work for the driver results in dtschema complaining that use of an
mdio child OF node is not allowed.

This series relaxes the realtek dsa drivers requirement of having a mdio
child OF node to probe and instead have it register a user_mii_bus to
make it function when a mdio child OF node is missing.

Another option could also be to adjust the dt-bindings schema to allow
use of a mdio child OF node for MDIO-connected switches.

With this series dtschema is happy and the switch can work:

  rtl8365mb-mdio stmmac-0:1d: found an RTL8367RB-VB switch
  rtl8365mb-mdio stmmac-0:1d: configuring for fixed/rgmii-id link mode
  rtl8365mb-mdio stmmac-0:1d: Link is Up - 1Gbps/Full - flow control off
  rtl8365mb-mdio stmmac-0:1d wan (uninitialized): PHY [stmmac-0:1d:user_mii:00] driver [RTL8365MB-VC Gigabit Ethernet] (irq=74)
  rtl8365mb-mdio stmmac-0:1d lan1 (uninitialized): PHY [stmmac-0:1d:user_mii:01] driver [RTL8365MB-VC Gigabit Ethernet] (irq=75)
  rtl8365mb-mdio stmmac-0:1d lan2 (uninitialized): PHY [stmmac-0:1d:user_mii:02] driver [RTL8365MB-VC Gigabit Ethernet] (irq=76)
  rtl8365mb-mdio stmmac-0:1d lan3 (uninitialized): PHY [stmmac-0:1d:user_mii:03] driver [RTL8365MB-VC Gigabit Ethernet] (irq=77)
  rtl8365mb-mdio stmmac-0:1d wan: configuring for phy/gmii link mode
  rtl8365mb-mdio stmmac-0:1d wan: Link is Up - 1Gbps/Full - flow control off

The device tree changes builds on top of the "arm64: dts: rockchip: Add
Radxa E24C" series at [1].

[1] https://lore.kernel.org/r/20250727144409.327740-1-jonas@kwiboo.se

Jonas Karlman (3):
  net: dsa: realtek: remove unused user_mii_bus from realtek_priv
  net: dsa: realtek: Add support for use of an optional mdio node
  arm64: dts: rockchip: Add RTL8367RB-VB switch to Radxa E24C

 .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 55 +++++++++++++++++++
 drivers/net/dsa/realtek/realtek.h             |  1 -
 drivers/net/dsa/realtek/rtl83xx.c             | 28 ++++++++--
 3 files changed, 77 insertions(+), 7 deletions(-)

-- 
2.50.1


