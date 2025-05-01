Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2394DC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jk5Z4QPc9J8CRieYaOp+Msl4krhLC3Zgsoyy7SV1l8k=; b=aqmMk0lBzuKvtyyvHHjRFPX47T
	3l3zaKrZvRSPesbpEr3w9mNzPvfU26DU/Vq3KuPw3l6fsVFEw8/NgkDWm8UJNErkf5ct4UzBZvsm/
	Dq26A8a+ABAA/DZ79jd55OsE3bVYlerk8FIUCuxEw5fV8agMJU3hxTKNIOPs9tAkzHTP67eOYYGzr
	Vm0TbaCfi89LoJH1BuRpHh1aOl8dGYmV3VR/arfBex7j+KwNr5l6/S1FSxF3EckQvnCWI9BZLxCMQ
	2HXbAiFahAuyypAxfpXCnfppx+F5DBpfmkhmgzs6jfal7ZPvEMYtDpu+P8kwi7KmH/CSxUTA1K0eH
	4jAugxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASYU-0000000FKZT-1vKc;
	Thu, 01 May 2025 11:58:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASMC-0000000FJM3-42v9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 11:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jk5Z4QPc9J8CRieYaOp+Msl4krhLC3Zgsoyy7SV1l8k=; b=hK1Y1QeCPApCKnF+ianQWZIXEC
	IHN3gx2RJrK2jKbMQ+4C+nZBiIoR/TszssSm6C0daW1H/8pZjRYR+/4n46MDB3CpWtkr02lXmEJe+
	C80HUytlH6LHmdjrMhtqNsNSAOWARB0rjVygCjLDJPcXxtcyP9TzMN/HkK7jHGp6AclCHlbgv8xHv
	kfR7bIskJRsM1sVLxGc52m1FnpHT3yvVmc5E4ii314vcbHWbP08ogWVJHEGA+6oVUWTBs0Z+23jfk
	OWnvEBtJMMKIajNtFCqtZU/l0ojlUPX1FWHsM2mW+wO69MrCLXhcHl/dswyqlxJLbTnqYukZZjcmr
	l3Fb5Tug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uASM1-0008WA-25;
	Thu, 01 May 2025 12:45:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uASLx-000865-3B;
	Thu, 01 May 2025 12:45:22 +0100
Date: Thu, 1 May 2025 12:45:21 +0100
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
Subject: [PATCH net-next 0/6] net: stmmac: replace speed_mode_2500() method
Message-ID: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044537_276854_102C24B8 
X-CRM114-Status: UNSURE (   9.34  )
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

This series replaces the speed_mode_2500() method with a new method
that is more flexible, allowing the platform glue driver to populate
phylink's supported_interfaces and set the PHY-side interface mode.

The only user of this method is currently dwmac-intel, which we
update to use this new method.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 33 +++++++------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.h |  1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 56 +++++++++++++----------
 include/linux/stmmac.h                            |  3 +-
 4 files changed, 49 insertions(+), 44 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

