Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40A4CD8CB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=53i6hc89+8JoHFGdA82pjuxn/jNjJDmBPopxlzzO+wk=; b=v6q5lZZGCEi4r+ENlNxqb8HTy3
	Lo/I+40at6wsjBraDUBrX2sgGJGyRuiu+VRa7XFh6w5f255N0AgbnkYKz1Nn5F+lWJjy1jhgOpFvR
	eqTxkXIwTzxMXORKkssl4l6MbvOaNdsNvVJDXxwWfA1rQ9d1g9C4AF0bBr8o2RvHTwEDdx0dJDdFB
	99hqAvdzI6zCF+5WbJH6fLHyj541X9Jt9E6pUsiK+yTzyDtEMtjAbxmQp6xoJA/n3mxoK5nqeWsY1
	uDItsivSISCcw2aCn4smOlQmM7EbqUmHvfoc3RuxCXapAWNIFx8AxJX5y6t8GCse2r73J/PYEgGi2
	OE9bkR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbOx-0000000Askx-2Fbf;
	Thu, 13 Nov 2025 17:46:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbOu-0000000Asjy-3czC;
	Thu, 13 Nov 2025 17:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=53i6hc89+8JoHFGdA82pjuxn/jNjJDmBPopxlzzO+wk=; b=BQXc+IATtKi13BpTL1VZUnNd00
	IUzuiFdQYx4qHb8zBNfQNLj67X3MH9fiKJrtkNPxOFYFvsuycCvEs6fEnVglOXgG5IaOs2yDb4tps
	KvCdrjLgyqy5ZFVMWP29AeZNcwmthIYBTST/kIgZv+1K0lBLuZHUOcr9UdFM/5+FbK0xik8wKt67i
	vuPAv2hiuCozXVBtLNy2+1w4ETJCTiBh0seZcqqiWfY8TrZi63Ss0/mo9jWFGwR1Q2ukfqDrHoi8B
	d3ATVdcuYIq79P82rLC0Qud1oM/LdjIeaD4MlaDzanLR4YTwCZY09DyFZnN1CTNEjJfSs+P2r+xnF
	GXR5FMlg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40570)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJbOl-000000005nC-3xID;
	Thu, 13 Nov 2025 17:46:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJbOi-0000000053j-23CL;
	Thu, 13 Nov 2025 17:46:16 +0000
Date: Thu, 13 Nov 2025 17:46:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/4] net: stmmac: rk: use PHY_INTF_SEL_x
Message-ID: <aRYZaKTIvfYoV3wE@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_094628_900946_F64C9B3E 
X-CRM114-Status: UNSURE (   6.55  )
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

This series is a minimal conversion of the dwmac-rk huge driver to use
PHY_INTF_SEL_x constants.

Patch 2 appears to reorder the output functions making diffing the
generated code impossible.

 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 245 +++++++++++--------------
 1 file changed, 109 insertions(+), 136 deletions(-)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

