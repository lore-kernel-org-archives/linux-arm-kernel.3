Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DB2E9A745
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDTQ1Gt3uozCZwLuZf90CgPV5cm4b1e03TcvTltg1FA=; b=xgy1UZEgzf1sImJ0zUMbu/0aNY
	NMeTsPlnEDXxDf8r3q7BLdahv0XXR54NhMACRAD4DH919sqb1xjOWX5aEatyP0SS00BR6chj5Ndk8
	OPuu9mjtCEHS17yl6QLMQF3Y0YFXSPkuKs1fFnDujuU4LheaZAfoCjSN4lTC1tmFqRJA+rsjTyjcP
	U+pZ6DbkQSrjgwAw8wkfTtbLnHR9y6Q8ZKElNRTid7/5pUZuZhW+ZEp83Oy+XJt1eWXBfhAWuFdtA
	YQSPTqWLksyjkX4FSFAVKauk/xAO3eiqi5iXHGhTc4fjefFf8yFupoJdG3N9zrMXdbQH63kySHG2/
	9Xjdyb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xxH-0000000158V-486J;
	Tue, 24 Mar 2026 09:21:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx3-0000000152k-3Nlf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:21:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40CCA1A2FC3;
	Tue, 24 Mar 2026 09:21:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0185F6011D;
	Tue, 24 Mar 2026 09:21:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68E8510450A18;
	Tue, 24 Mar 2026 10:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774344085; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lDTQ1Gt3uozCZwLuZf90CgPV5cm4b1e03TcvTltg1FA=;
	b=hfX7WMvd3Fs12xUyTk1i+9Y/5nSUyw5ERcxx/XHj+AMiDa88uo4Zj38y5p4cUtBiNk+m5J
	MxBbrwhwuXnIILYpQBXdLdPzTkl5Htb/6+eYV7n3sbmdZG/h9ovWSUaMrM5eoSVNknrzHV
	8L1x8+b1Ia7I5KrvtjDUvpmvv9RYP3Ap6uSddTJQ76DM/tQVeUUhSy0NnlijXhU2oLSu4K
	CfdJj+vnamHCgx9C6zWEkLsf3ESSJj9gL58mDg1uwrsEAJdXqEJFLYFe3l57totM2GGA+D
	odlXnxThjOYvx+mGc9vJAqsk9NmlJtw0XU11edZi1mTlIMkjFG+daHVzUpNUmw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 2/5] net: stmmac: dwmac-socfpga: Use the socfpga_sgmii_config() helper
Date: Tue, 24 Mar 2026 10:20:57 +0100
Message-ID: <20260324092102.687082-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
References: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022129_975567_CE885A1A 
X-CRM114-Status: GOOD (  10.02  )
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

Use the existing socfpga_sgmii_config() helper in
socfpga_dwmac_fix_mac_speed(), instead of re-coding the register access.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 42da73b92ceb..ed6448c0ad2a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -95,8 +95,7 @@ static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
 	u32 val;
 
 	if (sgmii_adapter_base)
-		writew(SGMII_ADAPTER_DISABLE,
-		       sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
+		socfpga_sgmii_config(dwmac, false);
 
 	if (splitter_base) {
 		val = readl(splitter_base + EMAC_SPLITTER_CTRL_REG);
@@ -121,8 +120,7 @@ static void socfpga_dwmac_fix_mac_speed(void *bsp_priv,
 	if ((priv->plat->phy_interface == PHY_INTERFACE_MODE_SGMII ||
 	     priv->plat->phy_interface == PHY_INTERFACE_MODE_1000BASEX) &&
 	     sgmii_adapter_base)
-		writew(SGMII_ADAPTER_ENABLE,
-		       sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
+		socfpga_sgmii_config(dwmac, true);
 }
 
 static int socfpga_dwmac_parse_data(struct socfpga_dwmac *dwmac, struct device *dev)
-- 
2.49.0


