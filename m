Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07639C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f3zqw2rI6Ot+kpRpJsM9K8AbmzF/0A2htE0cEidTpwI=; b=BgnxJwcnAqSUBufsIpsVaSEZ/V
	NMGEBzyxFsIMXhkcAXyDh20Q9DbolAcLWf9cTatzYWN2ymJxdOjNtXRcZUheGDCshrdZPzDvsbx6D
	kDs0VEG3rxS/f9n8d9miXjytFZGWema22oioh17wJnYc0SP4lABsXu4i2omjGq7Va4eLJwL8Bn/yv
	pIApreHxyHeOtVy6Kr61SCD9B+LgRLPXhKYxR7Ov+t22cOq+gOqmq+MeJHdttZQsKEBeCxnQSQK+u
	EgyQToy1/oKhuQIbhQlzs5G919rzQ6MHz+SkQtWGekNSywZBTY6PXwUym2iU7p/jP+KbzINk/jcg2
	ebE+UqkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt5A-00000008rsD-41K2;
	Wed, 05 Mar 2025 18:03:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpszC-00000008qnB-0Sz3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f3zqw2rI6Ot+kpRpJsM9K8AbmzF/0A2htE0cEidTpwI=; b=BRg5SuOYfwKsjDO94VckjEKjz5
	Ix65H73pJlKNe7luPxaNcX4eqWu7crJuCOa07l32YnztoTnFcszvQF799kmicI6+LVlKjCd/qS8l/
	6vPFgHs8ibT5mX+HA6VCN022smM4U44xs11Nhw8krI5dSGCslmHUbAv8GuRPml///U4sGXRJLENbK
	TT39/QO57epGGhM4P7WURBqh+LKTVULrRNr6Pt3ZJam02MNMB2Hyz2p0QXu9Q5rA3ivWR+70YOBn2
	6YryLZLlFlL2pSzlqEdtyMO47+H0M1GCcp4Ogn//lMZ4YyyRcfTemLukqJ7//+h3LLfgKaUWNfPZJ
	dwROq5Ow==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51332 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tpsx8-0004ff-09;
	Wed, 05 Mar 2025 17:54:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tpswn-005U6I-TU; Wed, 05 Mar 2025 17:54:21 +0000
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
Subject: [PATCH net-next] net: stmmac: mostly remove "buf_sz"
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
Date: Wed, 05 Mar 2025 17:54:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095650_143517_997C05C8 
X-CRM114-Status: GOOD (  13.00  )
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

The "buf_sz" parameter is not used in the stmmac driver - there is one
place where the value of buf_sz is validated, and two places where it
is written. It is otherwise unused.

Remove these accesses. However, leave the module parameter in place as
removing it could cause module load to fail, breaking user setups.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cb5099caecd0..037039a9a33b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -101,6 +101,7 @@ static int tc = TC_DEFAULT;
 module_param(tc, int, 0644);
 MODULE_PARM_DESC(tc, "DMA threshold control value");
 
+/* This is unused */
 #define	DEFAULT_BUFSIZE	1536
 static int buf_sz = DEFAULT_BUFSIZE;
 module_param(buf_sz, int, 0644);
@@ -218,8 +219,6 @@ static void stmmac_verify_args(void)
 {
 	if (unlikely(watchdog < 0))
 		watchdog = TX_TIMEO;
-	if (unlikely((buf_sz < DEFAULT_BUFSIZE) || (buf_sz > BUF_SIZE_16KiB)))
-		buf_sz = DEFAULT_BUFSIZE;
 	if (unlikely((pause < 0) || (pause > 0xffff)))
 		pause = PAUSE_TIME;
 
@@ -4018,7 +4017,6 @@ static int __stmmac_open(struct net_device *dev,
 		}
 	}
 
-	buf_sz = dma_conf->dma_buf_sz;
 	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
 		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
 			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
@@ -7973,9 +7971,6 @@ static int __init stmmac_cmdline_opt(char *str)
 		} else if (!strncmp(opt, "phyaddr:", 8)) {
 			if (kstrtoint(opt + 8, 0, &phyaddr))
 				goto err;
-		} else if (!strncmp(opt, "buf_sz:", 7)) {
-			if (kstrtoint(opt + 7, 0, &buf_sz))
-				goto err;
 		} else if (!strncmp(opt, "tc:", 3)) {
 			if (kstrtoint(opt + 3, 0, &tc))
 				goto err;
-- 
2.30.2


