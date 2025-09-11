Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB73CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaUF+1oxIqM7igBk06+HqVf5uJg2gaKGvEQOVxo6dq4=; b=PpkUHa+R4TM5Rs5W3AXjE+F0Ar
	lCI4arN/5PlPNtU+42hfRaSkXEGwIG4dilFjTUBgwnlxdHwU8EK+vc9f0GogwCmU/fQfRuqqMuSCP
	jVojnfOjxW2xWXZicJ+7XUN2ICaNFsznLL4Px5RS6/rL5tirEDoySlA2tIVhm5NKZhtFWjWaB4Xam
	0iBdC0oQ+Y4cMr7YG+hNSLC1VaG1q9eJ1PUQsVLBoQc+vxS1HutT3aPsABaHNHqdGIMDh4kMwnEG5
	5ClLKk9WTs7slOISYC7Lv4G9y+Dg3ogfEoH8YPZBSNW5ZoHX5Of2eVS31DOlBLAEtABbMxUoLNirR
	a5AmKHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCQ-00000002ZbK-16w8;
	Thu, 11 Sep 2025 11:10:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfCM-00000002ZVT-1TOL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UaUF+1oxIqM7igBk06+HqVf5uJg2gaKGvEQOVxo6dq4=; b=TDrtjxR8cr4gIanNuib9opbkK1
	A1ITI+7FoIy6Nzqjr2TtFDwMWRn6g5PwvLolGtTUBxuiI/8cq7GD6i1w7o2j0moHYHR40vZTNj18j
	v9xK4nGXUCi0O+6hZ0eRS6CpvJu51nxgkAqIwO2d2TIFx3JboLBo6pVrpQzlgrTgjO8FraDcjGbck
	2ufXz2LEn69TctjNjdHFBEQ0xTdHlKsWrX16AsomlDY9x4fhLm6KxSUGouCx5PC8jPNUghoRrUNHA
	6pahBKiFozMJ+UpWBGGqxsrNxssMqqdzKB2s3mjQjzFaRuz4gHyg/uw+xckbWUL2yrLGoclop80T0
	HUCn2IEQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53532 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uwfC5-000000002uq-1aUP;
	Thu, 11 Sep 2025 12:10:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uwfC3-00000004j9K-1HjH;
	Thu, 11 Sep 2025 12:10:23 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
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
	Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
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
Subject: [PATCH net-next v2 10/11] net: stmmac: move PTP support check into
 stmmac_init_timestamping()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uwfC3-00000004j9K-1HjH@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:10:23 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_041042_657574_2ABB7A09 
X-CRM114-Status: GOOD (  11.57  )
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


