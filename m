Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E614C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=goozUNnJLLkrSorBmN4CSjqgYHxzSyfaXsVrvCrQJa4=; b=mWKnL9TjbIbgjjhbn4c4zV2KN8
	MED6Qk52oo+762Gna+mV/kccDXBllwJC3TIJNiDsYR5oVU3axbo8coNTArlnjcWc9JgxLuG3+RTKC
	9HymcWlVMKdtdseXpIgeoB1TlpTUC40T4WlsZn+JMkIDUvF+nr47ggFAq5EX55mTjjzsh6olf2J3K
	s09PcxmdlmKCgawRfP59V0q/jWcRDaJ8FctV/BK4r1qu3BPl6UQQcUF/kyU1e/sAo0pJDu5lpbTpE
	J35+r2qXn3wceQnUxddzUrqffjGSMo9OTh7JPw8o3m7BRSu+r9aPn/BC9B3TRq0Op1pX6AoRvKULa
	e/UrbJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLaV-00000007uXK-0TCp;
	Tue, 18 Feb 2025 11:16:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLZ1-00000007u4M-3xzg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 11:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=goozUNnJLLkrSorBmN4CSjqgYHxzSyfaXsVrvCrQJa4=; b=VBnSLYdEwASJZI+Z1Kv8WaqVUj
	Gu1Tah9MVvryFRKBG2JxPljesgrEr0NiylzHcyGbSkupA97NOevzP68oL884NugEsBs15/E/eSgar
	pNC/xNuhPK3r9JnPzndMZ9oTPjU+4Hn/cv283WqtPJLFn3soXzRVappfV0arMsxtWs+BfkrRpKYni
	tt3eskO9YIk5T8Ikk5aU6pVa7+uzAV9Kzer3jQcSpbdTpHpugb17KVJR/gfw4lZOpqwTqRxOe1Wru
	YMPm06bYKyELzNlxSc9sb84+KaYUvqjmTW+g29Ce/s7mWn1KzQkuW0Mt/V76Qqt9PjRgw7tlBvmZ+
	b0GG4ECg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58960)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkLYp-0001hN-3B;
	Tue, 18 Feb 2025 11:14:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkLYl-0007Da-2g;
	Tue, 18 Feb 2025 11:14:39 +0000
Date: Tue, 18 Feb 2025 11:14:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 0/7] net: stmmac: cleanup transmit clock setting
Message-ID: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_031455_980605_50727230 
X-CRM114-Status: GOOD (  10.65  )
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

A lot of stmmac platform code which sets the transmit clock is very
similar - they decode the speed to the clock rate (125, 25 or 2.5 MHz)
and then set a clock to that rate.

The DWMAC core appears to have a clock input for the transmit section
called clk_tx_i which requires this rate.

This series moves the code which sets this clock into the core stmmac
code.

Patch 1 adds a hook that platforms can use to configure the clock rate.
Patch 2 adds a generic implementation.
Patches 3 through 7 convert the easy-to-convert platforms to use this
new infrastructure.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 +----
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  5 ++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 24 ++----------
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    | 22 ++---------
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   | 26 ++-----------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 43 ++++++++++++++++++++++
 include/linux/stmmac.h                             |  4 ++
 8 files changed, 65 insertions(+), 71 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

