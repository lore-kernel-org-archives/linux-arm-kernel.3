Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AE9CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LyqkunqlwPyREzM/Ps1cP/Qnf7gUD00sr/ZoFVgZeU=; b=SvHZNhDhT1mPCW2K2RsrcxfVg8
	cMkHLNaNfl7DEwj1ea6HvP+Rfz/fi9HF/XMgdjmg9b6zrjL2S/YiG2f2scay/Ohs4Pd/awaxFCGX+
	h3rDhzh/Kawg+kHyt/vj8WMvU1GaQ7NkaWBQpcypEHSv3AIWY8IsF7/TgJkhLZla0OFUazpGzpBlh
	Cjmm1jqKZExqBVEK3slFr+H/laU5O89akSQCxIAaQq+f0lG3jAkoQUyHZm8cRTMiSB4ITBFvtfplZ
	XBp/o3tHyJAf3COQO0zqcMElBUwmmMOzlWpO3eAOcS9GQTpLkZZ0tNT76eOEgMqhfqcXz9HlGO4qP
	OQSp2VXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHq0-0000000GsJ5-1ja2;
	Fri, 07 Nov 2025 08:28:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHpy-0000000GsHV-2lyc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0LyqkunqlwPyREzM/Ps1cP/Qnf7gUD00sr/ZoFVgZeU=; b=zHDDpuhtzwTGjBaPDffscCbDYW
	LZW/ZqNMCUeCqxhsXX47JxOqD6u5TEbNm4pmmMBaU5wiXXrNYlXPauhXSbaqzHBpI0oMnU76wew6J
	v4xEJAMtDwMCnXseOMy5N7Vf2W2k4fLfYMzySkOLHeGONyEfgPB3cUjq6uUcaKqzshaJ/YrO84KcW
	T5cuX/qkkdWjFOp//0dvgpr1RhLStAWEi0LUaRcBcoSiegoQxpnrFaXAUHf5vq68zb0INX/8QpKP7
	zKccvnuuNWcwE3Ai6B2kW8pZLi5AXKo6nBC1qovfiDDHr5yspZ9x9nPYk1DtENsYqCr3cqDHNkdGb
	kpYEFj+A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35522 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHHpu-00000000697-073w;
	Fri, 07 Nov 2025 08:28:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHHpt-0000000Djr1-0wwr;
	Fri, 07 Nov 2025 08:28:45 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 03/11] net: stmmac: ingenic: use PHY_INTF_SEL_x to
 select PHY interface
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHHpt-0000000Djr1-0wwr@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:28:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002850_702235_E36F79C3 
X-CRM114-Status: UNSURE (   7.99  )
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

Use the common dwmac definitions for the PHY interface selection field.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index c6c82f277f62..5de2bd984d34 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -35,10 +35,10 @@
 #define MACPHYC_RX_DELAY_MASK		GENMASK(10, 4)
 #define MACPHYC_SOFT_RST_MASK		GENMASK(3, 3)
 #define MACPHYC_PHY_INFT_MASK		GENMASK(2, 0)
-#define MACPHYC_PHY_INFT_RMII		0x4
-#define MACPHYC_PHY_INFT_RGMII		0x1
-#define MACPHYC_PHY_INFT_GMII		0x0
-#define MACPHYC_PHY_INFT_MII		0x0
+#define MACPHYC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
+#define MACPHYC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
+#define MACPHYC_PHY_INFT_GMII		PHY_INTF_SEL_GMII_MII
+#define MACPHYC_PHY_INFT_MII		PHY_INTF_SEL_GMII_MII
 
 #define MACPHYC_TX_DELAY_PS_MAX		2496
 #define MACPHYC_TX_DELAY_PS_MIN		20
-- 
2.47.3


