Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A913C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgmARS6iCi48GW/CgYcjmbFCRe8AS0AVo3at8RS+ydA=; b=Ad5+S6ip4RgCee8KlaHCLH35GI
	4l0dvTlryPaqHZqNOsJsv11dq4lsPbryzfyWsvZgP3stBCSA9/PufYTQyk/ndJ2g08Exx3ds3NPg2
	KKFulD7W5p+AE+L15MvtDaEHnfiRW3mnTq8NUdN0Ybzyw5D66hoQB/d6Arh95g7+LE7m/ltUIkovY
	h+9Zo+O0Rdm0a0HykV2/ul9bvkC7vJYsBYIUkv3rUAFsouN0J4gugnX8NIUzJF3Q3wmY86Vxasd4H
	npIgRaLgq78SDQVtNzFgoJTg2wgv5oC+seG0UcVuWFIzZ1OJargh+eTbQ5GYDrk/4vSbW4igRLiHv
	7BTzkikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIt-0000000249o-0KBS;
	Mon, 07 Apr 2025 21:46:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rNJ-00000001aT1-2mf5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vgmARS6iCi48GW/CgYcjmbFCRe8AS0AVo3at8RS+ydA=; b=CRVTW/L3XtBMiF8Z11Y9L+CIR6
	R1XFP5YVqcC3nQEgKZltrDV13hDyZQGSCRFh2Gf+AmwoQhRKDw7qwle1EmrzJ0eBMtaoUUVQZGp06
	GefWRU6uKmxH+hzPLypFvZsvuKc9wyy8QpFJPHek1Cc0fNFmc2jOLT8UMkvWaFpeqyzMennAav137
	KdqlJgNtBXAqGuWiS8wHQgIQy2SZnFc2nIlG/DphOOqFdY1NVI/stOXXHhiKR4pZ0ZX9MHRL0lZNT
	9AQP51iQHm19NNIJxeL2d5eZrXXWkiFqyupZgmjLc1hRp8CSDUXBb7Cm2dTUhvgG2qv93qiqXEqyF
	F29JhbTQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58606)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u1rN9-0005rO-1A;
	Mon, 07 Apr 2025 19:39:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u1rN5-0000cC-1Y;
	Mon, 07 Apr 2025 19:38:59 +0100
Date: Mon, 7 Apr 2025 19:38:59 +0100
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH net-next 0/2] net: stmmac: stmmac_pltfr_find_clk()
Message-ID: <Z_Qbw0tZ2ktgBf7c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_113913_699852_E51E08F2 
X-CRM114-Status: UNSURE (   8.32  )
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

The GBETH glue driver that is being proposed duplicates the clock
finding from the bulk clock data in the stmmac platform data structure.
iLet's provide a generic implementation that glue drivers can use, and
convert dwc-qos-eth to use it.

 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 14 ++------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h   |  3 +++
 3 files changed, 16 insertions(+), 12 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

