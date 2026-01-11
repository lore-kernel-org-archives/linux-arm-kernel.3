Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C59D25036
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WwF1Gcz9iHiKKMLX60wVzRv0f2xUV+Pl1/UTVZ/rgK4=; b=ILrHlo/o7/pszEzQyPbQXr79E9
	n9sZjDhqEFuvKANBpGtWbMdLf/Qmz5Z6zkY5W5Bd+GvMbxr1oJTb/FFB/YTARq2SaaU7YfL0CXHix
	gTwQG48998DZX46q2WnTxZeOhESG0cEBasRhWjbcldoUwxV0wIEgpljm5I/7ABN+U9R15d4myogiy
	cAFBbCuAcCj27kIJMSJhymlzu3G9uEOJkes0W4SVZbybSXsfoZmuQPaBih1Twmg+c5AmlT5gecwyw
	TnkX9Tqhs+5NBKF15oSM90AzPJRD8a+J/e2X4M/lGBn+yASBBE+HaZMc7Q3alespASZOg6EmXUHxb
	+FhGKY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevHO-00000004EtD-1xaq;
	Sun, 11 Jan 2026 13:14:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevHM-00000004Esr-0FSm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 13:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WwF1Gcz9iHiKKMLX60wVzRv0f2xUV+Pl1/UTVZ/rgK4=; b=zhbJvdFJG1xbOIX9EZGXofp/aF
	rxWWssHcKknP9f3JHVPxEbALA4S0VYbFmYEtV+ejzqo/eM67zYwcatMqzJq08FShind19kUKH7Etj
	z+3hQuL8knERabhXbKFS8HAkxa3DPC4fcIqXOQx7knNWXM3r9Ypuy/ufnio4KI2g2rjoR/EfJF5FK
	VKF1e0KaYlTMMhcudwvxKG95jMXiqLP8rD9it/vT1DJBfMXH1Nlnf5xE+eWCOKI8V4cBUoQJLS3LV
	ZNh3lAS2p0dSe1PJK7d7fj4wzuYUkZNsihJc5weoKfYeFg7mZqGO1misD/07jOy/23iPkfQKh80UG
	iI0/bZbg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33506)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vevHC-000000005Te-33S8;
	Sun, 11 Jan 2026 13:14:38 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vevH7-0000000078S-2Be3;
	Sun, 11 Jan 2026 13:14:33 +0000
Date: Sun, 11 Jan 2026 13:14:33 +0000
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
Subject: [PATCH net-next 0/5] net: stmmac: pcs: clean up pcs interrupt
 handling
Message-ID: <aWOiOfDQkMXDwtPp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_051448_101900_E150E5B8 
X-CRM114-Status: UNSURE (   7.39  )
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

Clean up the stmmac PCS interrupt handling:

- Avoid promotion to unsigned long from unsigned int by defining PCS
  register bits/fields using u32 macros.
- Pass struct stmmac_priv into the host_irq_status MAC core method.
- Move the existing PCS interrupt handler (dwmac_pcs_isr) into
  stmmac_pcs.c, change it's arguments, use dev_info() rather than
  pr_info()
- arrange to call phylink_pcs_change() on link state changes.

 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  7 +--
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  7 +--
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 22 ++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 62 ++++++----------------
 8 files changed, 53 insertions(+), 57 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

