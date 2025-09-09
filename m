Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4FFCAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaUF+1oxIqM7igBk06+HqVf5uJg2gaKGvEQOVxo6dq4=; b=dV5YKYaTQw3j3xg+i7D1tU9+kG
	rEdMaVEcFiOdT5jigCWlesg0Zso0FDH2J5Kk3rWfs4jKM4RBmwAD+EhUWWK6ZkTFwin5ctUEEG/+X
	eSvpIA5K2ME3WXP9J1rUfQ0U2fYhTWXyxJXdI2A1GqknB6geEQJXR5YiXx1EExtNOJ5zv3aPaXeBH
	owITVYuqcvKBG0Jxnqdeq1JHDGvyxNany0Pm5RjhFUBgvFk91IC45Jp8v44CgTy4woGOwUD3cObEd
	LoP6DhDqVwiyi5qoOafDSoPcbLPWLXEmP4Dwf6naokKUr2k5VLAM/LVsF3miMk7PjWSVaGqAcEw2Z
	8G4ZobRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27A-000000096D1-3YL3;
	Tue, 09 Sep 2025 17:26:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1WC-00000008e49-0uF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UaUF+1oxIqM7igBk06+HqVf5uJg2gaKGvEQOVxo6dq4=; b=nUtHSeUf7l4sG4SOGmy8VoEo2f
	hRQc/Ad7ym+SmzceejGM2JeV4U4zNQXktMvI70CwGMVoLRrQ43hJQlHDeLtlBrcPUNw8nxQAW846G
	dpUt4qZiUc534f98ndmRdogzHd6vo0v9WNUqSwAInqXUxlrNbhrEuJa1elaT/0wHZx8m1aYfcszT7
	gDnsWfcwezLn3LMhA6wN6bmFSXPNNtXP8DysI6Z1PICrDrLE8t3xsae1l91njO77Jzj/JRREzqrdF
	OMezn41+fseRYqjA9d9VhI09+ughH6OHH45X4ldWjE/LNG4a56eGZ503HS9CCb+/rbcEE+5z+FYDP
	ZHHVtWBA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43476 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1Vx-0000000005x-39NK;
	Tue, 09 Sep 2025 17:48:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1Vu-00000004MCj-44TY;
	Tue, 09 Sep 2025 17:48:14 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 10/11] net: stmmac: move PTP support check into
 stmmac_init_timestamping()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1Vu-00000004MCj-44TY@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:48:14 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094832_254282_CC408BB4 
X-CRM114-Status: GOOD (  11.66  )
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

Move the PTP support check from stmmac_init_tstamp_counter() into
stmmac_init_timestamping() as it makes more sense to be there.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ea2d3e555fe8..ff12c4b34eb6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -734,9 +734,6 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 	u32 sec_inc = 0;
 	u64 temp = 0;
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
-		return -EOPNOTSUPP;
-
 	if (!priv->plat->clk_ptp_rate) {
 		netdev_err(priv->dev, "Invalid PTP clock rate");
 		return -EINVAL;
@@ -787,12 +784,14 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	if (priv->plat->ptp_clk_freq_config)
 		priv->plat->ptp_clk_freq_config(priv);
 
+	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
+		netdev_info(priv->dev, "PTP not supported by HW\n");
+		return -EOPNOTSUPP;
+	}
+
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE);
 	if (ret) {
-		if (ret == -EOPNOTSUPP)
-			netdev_info(priv->dev, "PTP not supported by HW\n");
-		else
-			netdev_warn(priv->dev, "PTP init failed\n");
+		netdev_warn(priv->dev, "PTP init failed\n");
 		return ret;
 	}
 
-- 
2.47.3


