Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F5DEFCD9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Gy9w1lMcCKC9bnL1+CEjLmpiBafBvfVDB4ZfurXfK8=; b=lL4BDSSDmtGVj1lHgA6EUVsJUg
	3AWuSDel+NA7aCGaNJ6TgxyM/HoHDy3z7GUQ71KmhRR6VwI6gV/HTpxpr8Dn/y/D0H93EKMhEbRsf
	dq7T3MHpMJFHS8UIpkNG8JCEtVyK7ZEq8BKuyVYDbUlEGpRxo1/+1vof3DJLuUu4C32Nk73R4UVfZ
	amwf9xlAZ4diQZSbBtUHvC42V5F27Eh+N/7uOxKaxmMV+sPldbESWPZaXxAErvT1Oi4O1BVr06JVT
	PW0DBD1950pp2LotrPCe2Of9NBFo0bP0JjzWG6lkm0G1K7pIg7EbpoTtpWBnLaedPup+GkO+mDz6A
	rD8CWHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYfb-00000007B1A-3KPs;
	Mon, 09 Mar 2026 11:21:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYfV-00000007Awe-3QQ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4Gy9w1lMcCKC9bnL1+CEjLmpiBafBvfVDB4ZfurXfK8=; b=E54wk/Vfw0r34vV19xxyTbdBIh
	I3aSfhzbQcnBMJZ3HV6wFJd4NhUB6CBUGtEYrLWqLt1YXpp5LgZFqZdnXmrAPw1SOIzY5Vtd+7Dxn
	t7l28k7+Ao4aygIqkIk80Z0QRC37+BS288NTXGg6BpxYi74mOXQIgpxm+gHCAZCONOWHIUKfh/orB
	D1KYL+g+n+ihNfXo9zgGp3uQ175BEfhvqgTvoSqtaH8PB5PrwYM3L8urkgT0v11HXIhPhEZD5hHMd
	yhWVOWj1rxp38trFKRiz+v0P21dk9WI+pBlUJmqyNfTwPb/Q2SB9Eb3kBWu04wmzHWu6JkIPV7Eys
	Ek/s5Drw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35272 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vzYfP-000000003h4-0719;
	Mon, 09 Mar 2026 11:20:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vzYfM-0000000CZz0-3HXq;
	Mon, 09 Mar 2026 11:20:52 +0000
In-Reply-To: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
References: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v3 6/8] net: stmmac: qcom-ethqos: enable inband
 mode for SGMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vzYfM-0000000CZz0-3HXq@rmk-PC.armlinux.org.uk>
Date: Mon, 09 Mar 2026 11:20:52 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_042103_517335_016BE53D 
X-CRM114-Status: GOOD (  10.21  )
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

qcom-ethqos is manually enabling the PCS ANE bit for SGMII modes while
phylink remains in outband mode. With support for SGMII inband mode now
supported by the stmmac PCS code, switch phylink to use inband mode for
SGMII. Phylink will switch back to outband mode for 2500BASE-X since the
PCS code reports no BASE-X AN support.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f4b63544895e..1f38e4ee0195 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -831,6 +831,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;
 	}
 
+	plat_dat->mdio_bus_data->default_an_inband = true;
+
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.47.3


