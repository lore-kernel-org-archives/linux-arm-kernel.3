Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC3C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UHYHoHYB3kC5RVvuD/SFjezcUsEDtCLBmv9TeE4pFp8=; b=br9+fsNdOJi1LXuMARprh16Xgs
	ke99hNmZoumEZ8XPz2CSQzSIk9GuzJnQoeKDndkrxNqUSO3yww/fTQx40ge5W+wFGjXFFX1v5gc4D
	Gb0kbkaCEsT1kiMbJKqCSRf/0nsN9DqUkl8iNkRraqxrhzYS+DXwS5u0KCXcD+9yPmtKePwPefgaV
	cYhkJZeXja+uijuCZGOViyKrW+Ln8G2cGl+ZUMeqQYrSI/7r4XhpovSibsNHIKxRtgw8v3+Srycw3
	g1Mwc2co5qIm2CABmSRWYwpICGJRUIypGvyjOiI8No5wMvgR+1qgvuZkLhFtEiOG+S9a7OXk5e+10
	Hhau1QYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Vvt-0000000FdGs-0IMg;
	Sat, 12 Apr 2025 08:09:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Vu4-0000000Fd7K-38vZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 08:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UHYHoHYB3kC5RVvuD/SFjezcUsEDtCLBmv9TeE4pFp8=; b=wuFfUaBq04t6k0J4ocBtzQaUo1
	/e1YBvGDsfOIgmtsvhQ8J94oQXM7aQbfVQ8z+Cd9BeDq5Q4c+FOOzEGYwQD2LOmj6wJq8QLcU8aLQ
	7yoMeW9SMZZnRqS9PY5FQIDzrxVRNbBGZV9MYBiFY2BmTddur76PVk27cBRE13a8QKe9hmf6Fb5k3
	fviD/akVGnAYlTgYKhBuCJOqSNQh9nMEPEoYuKuInV0pE1W27QaMUS5uwaaLe8qdram+JodPp/4eI
	OEpSoxjF/U49q/u25tE2lgYZc1p4xNrcqBXnw0Y2oe4AS9PRpLK7OZ3SON7Mcy3ucWUUZAbYOdzdI
	BkZ3KCLQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55788)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u3Vrx-0004LU-2T;
	Sat, 12 Apr 2025 09:05:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u3Vru-0005V8-06;
	Sat, 12 Apr 2025 09:05:38 +0100
Date: Sat, 12 Apr 2025 09:05:37 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next v2 0/5] =?iso-8859-1?Q?net?=
 =?iso-8859-1?Q?=3A_stmmac=3A_remove_unnecessary_initialisation_of_1=B5?=
 =?iso-8859-1?Q?s?= TIC counter
Message-ID: <Z_oe0U5E0i3uZbop@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_010752_789990_6A2C5A4A 
X-CRM114-Status: UNSURE (   7.46  )
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

Hi,

In commit 8efbdbfa9938 ("net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER
register"), code to initialise the LPI 1us counter in dwmac4's
initialisation was added, making the initialisation in glue drivers
unnecessary. This series cleans up the now redundant initialisation.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 24 +---------------------
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  9 --------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  8 --------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  1 -
 include/linux/stmmac.h                             |  1 -
 5 files changed, 1 insertion(+), 42 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

