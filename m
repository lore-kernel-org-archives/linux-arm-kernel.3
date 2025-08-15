Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D13CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SDbLIaJdSHw36NzR0ioLCe3S12aekEVvio9d7DRkSBk=; b=VvI5y0UeGV1T5EcjwEgcMH9H45
	lhQGnWfGtkVBO2174Oht5bO67XgkZJuSHRCHFJAhVIY13dvuAav9yhoD/LeW+ssqj+VE4MkccOXOm
	EVbIAugrkMedXDO4m/wIfcyr54kLBdC3ZII05TGoPouJZz9CoL5y207k+Vbo2Iv40KVSoosrOWL97
	YSL1IolL3SY297yHuk7SdiJAa8np91bOzqEq0VL6kbQu1LLt90uZxu1NDhk8j0vol4jTaCdTEA4Jx
	lillGQugogNueIzBLQxvKphspmC7ga5++vHTi1VV5+8uyhPCtBHqHkkwEcOJV0Fle5b2tA9y5JHRL
	KCMJpN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvbb-00000002kBN-3rcW;
	Fri, 15 Aug 2025 14:40:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umshY-00000002L8o-3pmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SDbLIaJdSHw36NzR0ioLCe3S12aekEVvio9d7DRkSBk=; b=W68PAZaGAeBz/3ym5gAoNQAaTM
	sDyK+cs7pavgU7fpCosDe5zqrTuvLJ0OcoMxWpnn1tR5UG2PnEsWYGgTNxX6TiJ91mHwUqSHeb1pm
	eg1Awifi7syTFy9B/Uq5soq5MvrQ5jK5U+CKePQkVOUInRWeU/Lescw7kVNRDirKkcNyol2QhFYUL
	IjaCr7LUavhq49Ek6OHlJZ2fMITYfz+2yT5ROmGlihpmNBR3kd1JaeTe+VJbd4nExmFCWw8BD2Hzh
	OHrjGZw9UygsA4PIGxDhpDHibMu1DCS8+Qk9d9m20yge20B9znD5eym6mxqlnlNTkWJuRnK/fYeIY
	ulDUbeCw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51372)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umsfR-00010z-0c;
	Fri, 15 Aug 2025 12:32:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umsfM-0007mf-2I;
	Fri, 15 Aug 2025 12:32:12 +0100
Date: Fri, 15 Aug 2025 12:32:12 +0100
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
Subject: [PATCH net-next 0/7] net: stmmac: EEE and WoL cleanups
Message-ID: <aJ8avIp8DBAckgMc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_043428_950488_DC17F445 
X-CRM114-Status: UNSURE (   8.55  )
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

This series contains a series of cleanup patches for the EEE and WoL
code in stmmac, prompted by issues raised during the last three weeks.

Andrew's r-b's added from the RFC posting.

 drivers/net/ethernet/stmicro/stmmac/common.h       |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       | 11 +++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 31 +---------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 21 ++++++++-------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 +--
 5 files changed, 25 insertions(+), 43 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

