Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57249CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NgpAa3vCXF8Kyi2ufZqWKX+aesmDKAy5CtUjQRUQIQ0=; b=T5pY3yGv3UYb9zMobFcPvlzHjZ
	aN03BPUavWUDICpzDX8clT9UU8JHreoQJEyNnTvNKEFvAYyGiYtpSK+XNzlyfFb7GU4DNvqJjr/iy
	bVIl0AE7J3pWSDtRwFaS4TWGQ+R9jaK/br7x22PuCTObB4b5TzIMSnvjc64ItXDb0W3xfrI5abLCc
	Y3xhQp9I1EJcpbWvX9dnvv5gcP5PMQBi0wQVOyF85nZ+Q626Kp/4rBfmGe+iWaZL2SnhNmWKe1zLk
	wzv0nssamvlhKkwtBN0FIqxE9Z1Y/yJKon7TPbO1AtwF4le94bFt6PxSbwmCalGxgAl7AT7SJzbea
	HcfTifiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrtk-00000005mo5-1AKF;
	Thu, 23 Oct 2025 09:46:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBrth-00000005mnZ-1CDm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 09:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NgpAa3vCXF8Kyi2ufZqWKX+aesmDKAy5CtUjQRUQIQ0=; b=VeFnkdn79Q2P2HP9G4RpPb58FR
	VKZ98Er/W8oLcJsbPdOrkvVY4udncaY1U7sFVyJu1kffwcnHW56FH9qe9Hma/z2g3/cvmIDuK7e/4
	Jzw/At4CH2AbDMnNoPVzoj9zo8FvOe+gwvJwByXqcSrV80Z0DPe4WapqqHGm+rNLtXjkeoV6FEA/Z
	7XIvysR95b+ZsqxwCldkVlb5dI1Rnr/+geCaJHR5xOJ4EOFQC3X/8XwyN93XRR5jKVUKvKeR3/hfv
	UTlsjF2/n2s3EiHIIPiCC5aKlhSuBvDKcWDltQTbVTWTtXl3MCvLFLw7MbadrXJd3rWvORUKo/vQu
	5fz6MKCg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36838)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBrtb-0000000068L-2tsr;
	Thu, 23 Oct 2025 10:46:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBrtZ-000000001aN-2Di5;
	Thu, 23 Oct 2025 10:46:09 +0100
Date: Thu, 23 Oct 2025 10:46:09 +0100
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
Subject: [PATCH net-next 0/2] net: stmmac: pcs support part 2
Message-ID: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_024617_323697_83896D21 
X-CRM114-Status: GOOD (  13.96  )
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

This is the next part of stmmac PCS support. Not much here, other than
dealing with what remains of the interrupts, which are the PCS AN
complete and PCS Link interrupts, which are just cleared and update
accounting.

Currently, they are enabled at core init time, but if we have an
implementation that supports multiple PHY interfaces, we want to
enable only the appropriate interrupts.

I also noticed that stmmac_fpe_configure_pmac() also modifies the
interrupt mask during run time. As a pre-requisit, we need a way
to ensure that we don't have different threads modifying the
interrupt settings at the same time. So, the first patch introduces
a new function and a spinlock which must be held when manipulating
the interrupt enable/mask state.

The second patch adds the PCS bits for enabling the PCS AN and PCS
link interrupts when the PCS is in-use.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  7 +++---
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 26 +++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 27 ++++++++++++++++------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 16 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 22 +++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  4 +++-
 11 files changed, 96 insertions(+), 22 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

