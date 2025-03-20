Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA68C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o2gc0uIp20vFRrnjWwjQL7GVMAiQPOp+xknJd1vKRXg=; b=x6BFBAz6dAfIWRihrjjfH9MIKp
	OqGiC7yY9S2GoNhmN7J8GVN/nl1xJi/93OmWOOKh/mFNJA3hNGL7/K43A4F5L8syMXUvq+t3DQjie
	yJyHpmwvHw13ybW36fqueIhFQEVTe2hwnPPp8zS49sqUyhoed1TtTV9NpPO5dEjMw4uTgYmlQYshS
	jpKuL5pSHo8b+m1RfyMYPEQ7ZuKhPI5EriBfZMrCiSgLN32eEFpnc5iVQAWjVBP3Cprkwjg1z4+E0
	a4WpbQdqTxvYBjLWLcHAUckpeUf1JLM6hOh2ayLrWd9DUNzN3uQFg4gI9q1I0KOHK6WqnSFZzOdA0
	MK0XvRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO9G-0000000DKvz-3Ct9;
	Thu, 20 Mar 2025 22:13:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvO6f-0000000DKC3-3RYx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o2gc0uIp20vFRrnjWwjQL7GVMAiQPOp+xknJd1vKRXg=; b=zL/WnoNqfYWh3Mti5728U+lclE
	2m1aEpeUrW2f04ehkDtHsXEpjUzEhltqRDM5857u4bHpUaqps2fC02FG1C6QhAL23wyVfOeWfVQmq
	dQC/Od8YASee8xAGz7FH9fG6OBKSDSRu7OsJsr54PW2LJDYuiD6AJJWGilAvZkyvMyXasQ8xAh6xW
	H+KhiLVMAZurplAxKb+giGb+K6rlDPf15mSrZG/EA0x8GdBpDCBrUnMT64kd4ST4aNPrS+r8BPcM9
	P369Zlx4RLutSYU+sZjkoa+1E8SqxiWfEQurT9icE5zxEjfPVWY6P0S4B/hZep4BP8+E6WlJURFkk
	/5lLWd4w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56530)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tvO6Y-0008DL-1J;
	Thu, 20 Mar 2025 22:11:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tvO6V-0006z8-0N;
	Thu, 20 Mar 2025 22:11:07 +0000
Date: Thu, 20 Mar 2025 22:11:06 +0000
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
Subject: [PATCH net-next 0/5] net: improve stmmac resume rx clocking
Message-ID: <Z9ySeo61VYTClIJJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_151117_860054_6B08CD17 
X-CRM114-Status: GOOD (  19.27  )
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

stmmac has had a long history of problems with resuming, illustrated by
reset failure due to the receive clock not running.

Several attempts have been attempted over the years to address this
issue, such as moving phylink_start() (now phylink_resume()) super
early in stmmac_resume() in commit 90702dcd19c0 ("net: stmmac: fix MAC
not working when system resume back with WoL a ctive.") However, this
has the downside that stmmac_mac_link_up() can (and demonstrably is)
called before or during the driver initialisation in another thread.
This can cause issues as packets could begin to be queued, and the
transmit/receive enable bits will be set before any initialisation has
been done.

Another attempt is used by dwmac-socfpga.c in commit 2d871aa07136 ("net:
stmmac: add platform init/exit for Altera's ARM socfpga") which
pre-dates the above commit.

Neither of these two approaches consider the effect of EEE with a PHY
that supports receive clock-stop and has that feature enabled (which
the stmmac driver does enable). If the link is up, then there is the
possibility for the receive path to be in low-power mode, and the PHY
may stop its receive clock.

This series addresses these issues by (each is not necessarily a
separate patch):

1) introducing phylink_prepare_resume(), which can be used by MAC
   drivers to ensure that the PHY is resumed prior to doing any
   re-initialisation work. This call is added to stmmac_resume().

2) moving phylink_resume() after all re-initialisation has completed,
   thereby ensuring that the hardware is ready to be enabled for
   packet reception/transmission.

3) with (1) and (2) addressed, the need for socfpga to have a private
   work-around is no longer necessary, so it is removed.

4) introducing phylink functions to block/unblock the receive clock-
   stop at the PHY. As these require PHY access over the MDIO bus,
   they can sleep, so are not suitable for atomic access.

5) the stmmac hardware requires the receive clock to be running for
   reset to complete. Depending on synthesis options, this requirement
   may also extend to writing various registers as well, e.g. setting
   the MAC address, writing some of the vlan registers, etc. Full
   details are in the databook.

   We add blocking/unblocking of the PHY receive clock-stop around
   parts of the main stmmac driver where we have a context that we
   can sleep. These are wrapped with the new phylink functions.

   However, depending on synthesis options, there could be other
   places where the net core calls the driver with a BH-disabled
   context where we can't sleep, and thus can't block the PHY from
   disabling its receive clock. These are documented with FIXME
   comments.

Given the last paragraph above, I am wondering whether a better
approach would be to ensure that receive clock-stop is always disabled
at the PHY with stmmac. From what I can see, implementations do not
document to this level of detail, which makes it difficult to tell
which registers require the receive clock to be running to behave
correctly.

This patch series has been tested on the Tegra194 Jetson Xavier NX
board kindly donated by NVidia, with two additional patches that are
pending in patchwork - the first is required to have EEE's LPI mode
passed through to the MAC on this platform to allow testing under
PHY clock-stop scenarios. The second is a bug fix for PHYLIB and
makes "eee off" functional, but should not affect this series.

All patches on top of net-next commit f749448ce9f1 ("Merge branch
'net-mlx5-hw-steering-cleanups'")

https://patchwork.kernel.org/project/netdevbpf/patch/E1ttnHW-00785s-Uq@rmk-PC.armlinux.org.uk/
https://patchwork.kernel.org/project/netdevbpf/patch/E1ttmWN-0077Mb-Q6@rmk-PC.armlinux.org.uk/

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 18 -----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 46 ++++++++++--
 drivers/net/phy/phylink.c                          | 84 ++++++++++++++++++++++
 include/linux/phylink.h                            |  4 ++
 4 files changed, 129 insertions(+), 23 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

