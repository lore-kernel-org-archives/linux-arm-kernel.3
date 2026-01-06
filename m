Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1AACEFD01
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MYmLW8OPn5DDDEC1Qcm8Gzm4mAIPon676SwHF+5AD8=; b=hk2whpTF5NJLTkLW3YdYS/T0od
	uYeii7RI/3jR2vAnQwyvMi7pNDUCNaKEDB9bGBW/ZOWmC45XtA8XeN2ltGDi6EblvYTLITbrO1rbF
	Oc3iZDvh15ToXaQQDWk9W6QjQL8kjNM0GPRdnNQJA/gQ3cfSati9+NhKJWtVC4CISK3nvNhhM9iOT
	6Rr/VfIYxGZ50KAXaQ5AwIRZZIeHiagwJj9T2qArVF765rKqHJcIqpET+6aJA3yDNjmOW6gIJb8wi
	ejxqQEQI5vW89Iac8kndUpjA5e0AJOpl84U85TIhsFwaIFTZM6X1Sf8S1l5Kt+1qWQFfAA6+U8axM
	EI3MNrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDiC-0000000Dotk-0koy;
	Tue, 06 Jan 2026 20:31:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdDi9-0000000Dosl-4BoG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 20:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8MYmLW8OPn5DDDEC1Qcm8Gzm4mAIPon676SwHF+5AD8=; b=T5/XHraFUsjxW6fVsN2vl2Wi2p
	Sq0uVlFi6IrEP2AkGn7cjA9I7rKsE2peOXXZj2d07sqO10TDNdnaDKWo9b7jn44L9ApcpfEFEn/Yk
	BfsxJd1xyRRXMZuK5rnnJkzds0UsPUZ0Nc6GS6iFFrYqx86yMZBuyzFgrQwRqCUMMukoYQyN5TsKH
	Ts32fyreLmXvTTIyy3maMfkr9pJpGEprOkFouVfC2uJvaBqxHzGZL4JAeds1cru4tNyggTiZsyMvd
	Bc8IvwnkC/Rg82YAGzRFifhnUt5dFqAhZthyTNYQXMJwvCNg6q+3bvwHWU6wigJBlfFaM3fRVIFrj
	dXIA22Iw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37452 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vdDi1-0000000010a-14KJ;
	Tue, 06 Jan 2026 20:31:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vdDi0-00000002E1J-1SNG;
	Tue, 06 Jan 2026 20:31:16 +0000
In-Reply-To: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/9] net: stmmac: dwmac4: remove duplicated
 definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vdDi0-00000002E1J-1SNG@rmk-PC.armlinux.org.uk>
Date: Tue, 06 Jan 2026 20:31:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_123126_039486_D7E8BF28 
X-CRM114-Status: UNSURE (   7.87  )
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

dwmac4.h duplicates some of the debug register definitions. Remove
the second copy.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h | 29 --------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 3cb733781e1e..fa27639895ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -485,35 +485,6 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 /* To dump the core regs excluding  the Address Registers */
 #define	GMAC_REG_NUM	132
 
-/*  MTL debug */
-#define MTL_DEBUG_TXSTSFSTS		BIT(5)
-#define MTL_DEBUG_TXFSTS		BIT(4)
-#define MTL_DEBUG_TWCSTS		BIT(3)
-
-/* MTL debug: Tx FIFO Read Controller Status */
-#define MTL_DEBUG_TRCSTS_MASK		GENMASK(2, 1)
-#define MTL_DEBUG_TRCSTS_SHIFT		1
-#define MTL_DEBUG_TRCSTS_IDLE		0
-#define MTL_DEBUG_TRCSTS_READ		1
-#define MTL_DEBUG_TRCSTS_TXW		2
-#define MTL_DEBUG_TRCSTS_WRITE		3
-#define MTL_DEBUG_TXPAUSED		BIT(0)
-
-/* MAC debug: GMII or MII Transmit Protocol Engine Status */
-#define MTL_DEBUG_RXFSTS_MASK		GENMASK(5, 4)
-#define MTL_DEBUG_RXFSTS_SHIFT		4
-#define MTL_DEBUG_RXFSTS_EMPTY		0
-#define MTL_DEBUG_RXFSTS_BT		1
-#define MTL_DEBUG_RXFSTS_AT		2
-#define MTL_DEBUG_RXFSTS_FULL		3
-#define MTL_DEBUG_RRCSTS_MASK		GENMASK(2, 1)
-#define MTL_DEBUG_RRCSTS_SHIFT		1
-#define MTL_DEBUG_RRCSTS_IDLE		0
-#define MTL_DEBUG_RRCSTS_RDATA		1
-#define MTL_DEBUG_RRCSTS_RSTAT		2
-#define MTL_DEBUG_RRCSTS_FLUSH		3
-#define MTL_DEBUG_RWCSTS		BIT(0)
-
 /* SGMII/RGMII status register */
 #define GMAC_PHYIF_CTRLSTATUS_TC		BIT(0)
 #define GMAC_PHYIF_CTRLSTATUS_LUD		BIT(1)
-- 
2.47.3


