Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C415C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9V6cBq+TtwXJYqhnu6T1q5wgsLXdHrhThBITkOay1U=; b=iqSIkGa+KyVtImbikNapygnNqK
	1sYcQeNQSTiQlPOouYcuhsdgIyttny7NXHLTBEIFIlNS+Bn/WgVXzi6lymKovgucrG/Wg3sRe+Dxe
	AL+zqzCZGo6NETJ25KBaepMjsnPfHAayuRvQW4kmVd/mrXGYCmfIhtuejB/ebl5ge7VsNNLL2ZvRA
	tvKvmJVMtAvDxDh2+zIIvE6hSOcXL973MJDQou7v5+I4ljdkPxHQ8xli2O0JNNZ5Ki7xPLY088Pn1
	oxc3T+9cLVsJRU///cG83WMt0/kBPy19n40LxBJrKQGQRlHkXfVNBSb6WMhSnpIqYlK1FSsZbLmae
	PFiDZ2kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl6C4-00000004Apq-3sS3;
	Sat, 18 Jul 2026 14:39:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl6By-00000004ApN-2gn1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 14:39:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B90F4E40E42;
	Sat, 18 Jul 2026 14:38:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07D3960363;
	Sat, 18 Jul 2026 14:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1D8211BD0158;
	Sat, 18 Jul 2026 16:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784385535; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=x9V6cBq+TtwXJYqhnu6T1q5wgsLXdHrhThBITkOay1U=;
	b=O2PCNXAzjDUrE5AmaW/q2eCL+nLSBYwFFKEWvlyvm+Y+GElh/6Y+NNsT1xBrUUMgFOAO9l
	sowywpbcNketelv260cm8YiILm5yo+rjCmXvNQi1MdB9p7b2KhMbz2IzRahNTQxKUp7VdE
	qZ1Iiu31ZZzwffSLcUaxraJX7ngXNYC54lNClCHis/OQH/ebGYxxYV2+ZBdseMsIcv8pB2
	WbTtSOTST/T8lT1of7CTBQ90w/vq3Rmz4N+BZHukMAJoH/DI9SkM291BSfJtqlLLOm4R0n
	wtyR76iPOdtTIwuBb1Z+Po0Ee2xZgswjDwrTt+e8Tjc0RJDUPMm6wBUQQpXUvw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next] net: stmmac: Simplify ioctl handling
Date: Sat, 18 Jul 2026 16:38:47 +0200
Message-ID: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_073902_818755_665D6109 
X-CRM114-Status: GOOD (  10.51  )
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

Now that timestamping is controlled through an NDO, we can simply
call phylink_mii_ioctl() to handle ioctls.

The only functional difference is that phylink_mii_ioctl() ->
phy_mii_ioctl() can handle SIOCSHWTSTAMP, but this no longer happens
as this ioctl is not longer dispatched to the ndo_eth_ioctl().

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---

Looking at this, I'm wondering if we can't just get rid of SIOCSHWTSTAMP
handling in phy_mii_ioctl(). Looks like we can ?

 .../net/ethernet/stmicro/stmmac/stmmac_main.c   | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3..562d20830b94 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6371,28 +6371,17 @@ static irqreturn_t stmmac_msi_intr_rx(int irq, void *data)
  *  @rq: An IOCTL specific structure, that can contain a pointer to
  *  a proprietary structure used to pass information to the driver.
  *  @cmd: IOCTL command
- *  Description:
- *  Currently it supports the phy_mii_ioctl(...) and HW time stamping.
+ *  Description: Forward the PHY ioctls to phylink
+ *  Return: Zero on success or negative error code.
  */
 static int stmmac_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
 	struct stmmac_priv *priv = netdev_priv (dev);
-	int ret = -EOPNOTSUPP;
 
 	if (!netif_running(dev))
 		return -EINVAL;
 
-	switch (cmd) {
-	case SIOCGMIIPHY:
-	case SIOCGMIIREG:
-	case SIOCSMIIREG:
-		ret = phylink_mii_ioctl(priv->phylink, rq, cmd);
-		break;
-	default:
-		break;
-	}
-
-	return ret;
+	return phylink_mii_ioctl(priv->phylink, rq, cmd);
 }
 
 static int stmmac_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
-- 
2.55.0


