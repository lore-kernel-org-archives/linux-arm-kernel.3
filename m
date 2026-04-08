Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7E0105D9B4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymap6qnTrcZjA2wjOv/aJIypsrfZm0ThDKHwcJw6fQA=; b=av+RvDGdQ8qIoFJOI99KKBvCCM
	kxLO82sulaAeK/XgC72mkN1wWnvXyh5vM55VioYr91pUSEqcNuuxOSLNjCqTby7u1jfRUNEYpSuCL
	ai5bZ65Y4U+mOELCM24T+JzJb7Lmla5ixpWc9utvm5D8WCqPJCtVIVrLp8c+k+qhpr1HGJjDhbGug
	diGpm3AukMyYNr75d7YnrkA5mqvQBLI5r39Cxvmo5mzG9C8m2V6jjxzQmdXt512mlsls+S45FFyu4
	sQ/EZQH41/p2tTNE5M0RB72AgXqRp+adHr7ETC/qTvQWcGtysiMa28nFrJXE9R7nXDLT5u774BVGE
	37dlReeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPPn-00000008czm-04KV;
	Wed, 08 Apr 2026 09:41:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPPl-00000008czB-0RWH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ymap6qnTrcZjA2wjOv/aJIypsrfZm0ThDKHwcJw6fQA=; b=KBRtZISkGajYEF77tW0PaVeWQX
	cPZnzgBxvtuhhdl0AWKtISEgdRk5ygONloyCeyvc7bShsFUU291gw31NnmZThiKumCavoDUxWZ7ht
	cVFxKfusOkbLHw7diDcG/m/WO3KmVv7Y38vbfzTiDlCH3hIE7MQt+BAIhGaN+SOZknZvPt/nDFVer
	nX9Wo9T5rTYa1vxaHQ/lmKiB9p4+CfBiZll05OfJ9M7/jxzZGMStDbGxzi0qdRsZw0SJavADbkyRZ
	OUT8++lqg326oe/ePFqZ6aNhK2gp3lxLY6XKiSo7EBlX3bdqQV2MVuRQa7MzXTkTRzYo9u5SC8NNU
	w5ecUjoQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36872 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1wAPCB-0000000024F-27WA;
	Wed, 08 Apr 2026 10:27:35 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1wAPC6-0000000F7kr-1b7i;
	Wed, 08 Apr 2026 10:27:30 +0100
In-Reply-To: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH RFC net-next 10/10] net: stmmac: only print receive COE type
 for GMAC cores
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1wAPC6-0000000F7kr-1b7i@rmk-PC.armlinux.org.uk>
Date: Wed, 08 Apr 2026 10:27:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_024137_146791_7B3FABBF 
X-CRM114-Status: GOOD (  12.33  )
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

As identified in the previous commit, only GMAC cores have a COE type,
but priv->snpsver's numberspace is core specific. Change the test for
printing this to check the core type instead of checking for the
Synopssys IP version being < v4.0, which will incorrectly match XGMAC
cores.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 93c031b3cfd5..f5fe97c1abd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7461,7 +7461,7 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 	if (priv->plat->rx_coe) {
 		priv->hw->rx_csum = priv->plat->rx_coe;
 		dev_info(priv->device, "RX Checksum Offload Engine supported\n");
-		if (priv->snpsver < DWMAC_CORE_4_00)
+		if (priv->plat->core_type == DWMAC_CORE_GMAC)
 			dev_info(priv->device, "COE Type %d\n", priv->hw->rx_csum);
 	}
 	if (priv->plat->tx_coe)
-- 
2.47.3


