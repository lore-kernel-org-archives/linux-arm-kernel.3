Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B4C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1N7qzwT6+40rnFu9DeSjSQxLuS7bQdCcDSHTwobr1Y=; b=o+v5zW4Qd1NZ+U/ibkxZCL+4KD
	yiH2/aYDbICLGWLnk7lLdLd68kbexWVAqIYEmE1DFq/JPVCxM6/4+Ut0MbKqHftEobiYyhYJsZY6q
	XL7aNhOp5Vy8VN7V+U/0O2dvNcSHk6C/G2c9m3MGfOOPXXv+owbLVqeD5aNEskNYJRyz4GzJyB5IC
	X2MaI93ATSFf80jteLkTQK9R+y9Of7/t6fmcmbiegLx1OXqZ+Fw1QPn1luaSXKtvLd1Bb23F+J1fq
	hZxV383piQgJVmJdyQnKXZdzNWXG0rTIRS3Aav2iqz6KpufWbL+mRXg/0TYTTj1Es2d3PPIY0HqdJ
	ChIZ6qXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpD-00000005CIr-0sKv;
	Tue, 28 Jan 2025 15:48:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnnJ-00000005Bme-3JBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q1N7qzwT6+40rnFu9DeSjSQxLuS7bQdCcDSHTwobr1Y=; b=YBne8JSnNFEQ5vmyGtxUZjf/O9
	eoak2EnTVv8J9FenJUtjEDH0bbpLkrjKyGmcj/R2Az2BaoOsIdQnBf7y5hgzlDgBrkzHNzLSn7TYG
	omjEd4P5tkGiyQn8j5pLqd2HPZcHLajM95Albzv94vT0poxLvnb8b7ceCl//7vUa/fPnJVvGTRWt3
	ABQQWZOilVMz6fPK2WitGRaOxGw7LZXrl1SJ5hC4tVkaOFtMDQCZr53xYAsQrjIgH09hUdrBJrjfB
	cFL0WFjJf4cfC0975yK97Ub/xuk5Vg0sHNCBhHHW2gewqyluLH1ptcPkosyj6REAwxg0UVXMjMLOq
	I+MdaAUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tcnnB-0007ST-24;
	Tue, 28 Jan 2025 15:46:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tcnn7-0002lc-00;
	Tue, 28 Jan 2025 15:46:17 +0000
Date: Tue, 28 Jan 2025 15:46:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH RFC net-next 00/22] net: stmmac/xpcs: further EEE work
Message-ID: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074629_825522_A8E59547 
X-CRM114-Status: GOOD (  17.52  )
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

This series is a preview of the further work I wish to merge during
the next cycle for EEE in stmmac and XPCS drivers.

The first 14 patches target stmmac's EEE implementation, which I believe
to be buggy such that it does not disable LPI signalling immediately
when ethtool settings change, but instead in effect waits until the
next packet is sent. This is a relatively minor bug, so isn't high
priority.

However, what the first set of patches are doing is continuing the
cleanup of the stmmac implementation and making things consistent and
readable.

The following patches are aimed at eliminating the xpcs_config_eee()
direct call between stmmac's EEE code and XPCS, and present a way to
do this. Sadly, it doesn't reduce the number of direct calls between
these two drivers as we need to implement a new call to configure the
"mult_fract" parameter in the XPCS EEE control registers, which is
supposed to be derived from the speed of an EEE-specific clock.

However, I remain unconvinced whether it is necessary to enable and
disable the EEE controls at the XPCS with LPI being enabled/disabled
at the MAC. Could many or all of these settings be configured as part
of the creation of the driver instance instead?

Without knowing that, the only real way to clean this up is the one
I've taken - which is the principle of preserving the existing
behaviour.

Sadly, the entire series doesn't lead to a great reduction in LOC,
however, the initial 14 stmmac patches leads to a reduction of 71
LOC.

My plan is to send the first 14 patches shortly after net-next opens.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  14 +++
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  13 +--
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  30 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  12 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  96 +++++++---------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   9 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  49 ++++----
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  21 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 126 +++++++--------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |   2 +
 drivers/net/pcs/pcs-xpcs.c                         |  89 ++++++++++-----
 drivers/net/pcs/pcs-xpcs.h                         |   1 +
 drivers/net/phy/phylink.c                          |  25 +++-
 include/linux/pcs/pcs-xpcs.h                       |   3 +-
 include/linux/phylink.h                            |  22 ++++
 15 files changed, 253 insertions(+), 259 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

