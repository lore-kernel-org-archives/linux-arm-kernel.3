Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A734CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CytaSTnftbEEyTDU2s+KGe4TAAN74Ksg7sEYbIARhBc=; b=AmknmkWa1z/3ct88cXqkhz1wbT
	1AE0iOMeijX88av0iDdPxiHAPj8CGBeXd0GpXaxzlP60/zjVLEXvUHRMah7saXX0oreSzAu5mIakD
	IoQz/rEZ9rOXqKfe7XUUkX67Od+t2jP3m9zflu7CKt8RLodxHUbwaJgyKZok7JWNfp+GLl0+Z2ESz
	b2aDES+VO6kxlKsxi6Y+Q3m/8XDZJkzSOX7XN49PDsvEVursBzq/i1tDNCyUkpfld/uNvZCIXY1zF
	iqD2cdwRU3Ay8etpZ2vGlSmbDEBSCKJgFOezN5BQCPnw0Ttr5S8tc/Kz1hFlaVjcf5u0LUyeTxDLq
	fhD+8png==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNRo-0000000HTm6-0P0y;
	Fri, 07 Nov 2025 14:28:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNRl-0000000HTko-3IWd;
	Fri, 07 Nov 2025 14:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CytaSTnftbEEyTDU2s+KGe4TAAN74Ksg7sEYbIARhBc=; b=XaZ8okrrSRuqlmq2Yy+4d4VNPe
	hLJsLKOOMg0xYmKiev4nUqSgPiZol6SnPBhuiRQlXg7+/cPmT8Zbf19VoaHoLVHIQ7RLQr1xjdmBG
	g+x2jVCWqwMA9drMFa4lPUlA0pq5Glf54sjlG9n6zOzI9oqBJnpw2yhp3QabSEmaPmqNJTaA6fkSt
	mKKHRFhvuZbaBCdMEgpnWncm4lPXcl4xUWnPA56Cgxobv4Efc/kMeJQZOY7c3Yo85553S6BdYo/+D
	cX3IsH0V1e5CJO3z4b9eyzjS34Zghwn6lmhTKLB9CSgGSJRn3hWWOsEq9aHGBg23TLwkynYX514T8
	rSoiJoXw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50548 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNRc-000000006ej-3hSr;
	Fri, 07 Nov 2025 14:28:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNRc-0000000DkRv-0FzL;
	Fri, 07 Nov 2025 14:28:04 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 01/16] net: stmmac: loongson1: use PHY_INTF_SEL_x
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNRc-0000000DkRv-0FzL@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:04 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_062813_821090_A53800E7 
X-CRM114-Status: UNSURE (   8.52  )
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

Use PHY_INTF_SEL_x definitions for phy_intf_sel bitfield.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 32b5d1492e2e..09e2af1d778a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -38,8 +38,8 @@
 #define GMAC_SHUT		BIT(6)
 
 #define PHY_INTF_SELI		GENMASK(30, 28)
-#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, 0)
-#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, 4)
+#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
+#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
 
 struct ls1x_dwmac {
 	struct plat_stmmacenet_data *plat_dat;
-- 
2.47.3


