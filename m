Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9185FCF3187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LMZKxwd8PgRgdlMYw+yU7jfS7/uNgOpqzYUC5NJ6D7g=; b=LLsSXNIg4ITgjkjV090uLK4g0j
	BaiiL1ydMSznrLrSNU3vz9GV3IaStXfWdE0fcDuX2vLdwuiJfxsCBc1yhyHt6kMUoD5aY2Yz14I2S
	h0NikSinv1gwy/2+lI5C5j1vvjPdngJh2JxHGx1TShQOdw0Hyz2g7vn9iP/CMg4Zp8/uCHD7uxzqk
	R1hazTSeY2zfk2OjQXg0CygNaxTzbIZbloFoLI4P1mifEx8asy3iRJG8osaODJ4RKrLhs6spn38Ot
	9+Z9IKC7QPMbnbfUvBH5ARNJaXC/AuOrunCZuOwpHl4M/OFm4sNKg41Kb1gyp/tq0c7mTAII7VMoK
	kBTTUVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfKl-00000002xCs-2W2r;
	Wed, 19 Nov 2025 10:22:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfKi-00000002xC5-3TU3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 10:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LMZKxwd8PgRgdlMYw+yU7jfS7/uNgOpqzYUC5NJ6D7g=; b=HXCIUPUXfM62CSAW1aJvwbDwB3
	aSoqI0m9DNDhLlwWq6Uwm7uDSuRdNxrSBIcoe3vWvSBHe9xxpwQpq+oDFoXRInYo/DWmxHLyWLmld
	krl2JNELKSeeXVzjxKevQKJ8y8J4iTqYo4ipj6/P8e8zu/zJNa+U8Yjj+47k62uIz958c6uVgQ/DH
	MVpRIaHjeaE5RItgyiCG68e7gGa+IMiWtmDhGA35ZpZLxGMwpVbxRTNj8n2oXbSb2FXBH+PVH5Uk8
	aM553oIH7JGa9rJUGPy8+QBA4c98zKVlcl5lPqj8ZarJiS908x4Vefkp9i6GauOiFAft0SFcCDJSE
	HsQ5Nqqg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38790)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLfKc-000000004UL-48D8;
	Wed, 19 Nov 2025 10:22:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLfKa-000000003L2-1t19;
	Wed, 19 Nov 2025 10:22:32 +0000
Date: Wed, 19 Nov 2025 10:22:32 +0000
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
Subject: [PATCH net-next 0/6] net: stmmac: simplify axi_blen handling
Message-ID: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022240_869682_64B7F792 
X-CRM114-Status: UNSURE (   9.92  )
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

stmmac's axi_blen (burst length) handling is very verbose and
unnecessary.

Firstly, the burst length register bitfield is the same across all
dwmac cores, so we can use common definitions for these bits which
platform glue can use.

We end up with platform glue:
- filling in the axi_blen[] array with the decimal burst lengths, e.g.
  dwmac-intel.c, etc
- decoding a bitmap into burst lengths for this array, e.g.
  dwmac-dwc-qos-eth.c

Other cases read the array from DT, placing it into the axi_blen
array, and converting later to the register bitfield.

This series removes all this complexity, ultimately ending up with
platform glue providing the register value containing the burst
length bitfield directly. Where necessary, platform glue calls
stmmac_axi_blen_to_mask() to convert a decimal array (e.g. from
DT) to the register value.

This also means that stmmac_axi_blen_to_mask() can issue a
diagnostic message at probe time if the burst length is incorrect.

 drivers/net/ethernet/stmicro/stmmac/common.h       | 13 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 28 ++--------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  5 ++-
 .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    | 30 ++---------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   | 30 ++---------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   | 11 +------
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    | 13 ++------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     | 11 ++-----
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 33 ++++---------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 38 ++++++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   |  6 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 ++-
 include/linux/stmmac.h                             |  2 +-
 13 files changed, 78 insertions(+), 146 deletions(-)

- 
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

