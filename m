Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F59D1BDD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42kxzvTWuXxqunQIkofuM5yI8E9ydjyRl0t7IPFnnsE=; b=RKgCx7FADdFJNVO6PaRKm4rBjZ
	d4iT92BvlIDsXRu6IyX2kNXRf4jPW2v5nycC0nHb1t9weWGURTuHMUxdZnPCjTTwhQzorAw4+nWJY
	3JvsXrKKeDADuseeTmSEsy0cXDmhaF6t3Bwxz84+Pg2YhfSQqJ+5ZUtkzqr52bo1kZbpbPwU1Yn84
	fO+ljgIZwpTri05DPdN9svFA7rMV+54t08S/OAou2dM41G59dWc3UpXpYT/zf+yKy4puDVXagnGbG
	SweYxaNSIXevNrJn4KAdaID2ugj6RMcJxx8BCbKf45qGLJPaiVxcEDjhnzqJjzkIvDckSsMszLde8
	SI81UJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t811S-0000000EYmJ-1AwW;
	Mon, 04 Nov 2024 17:37:50 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80To-0000000ES2s-4A8j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:03:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA89B60011;
	Mon,  4 Nov 2024 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730739783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=42kxzvTWuXxqunQIkofuM5yI8E9ydjyRl0t7IPFnnsE=;
	b=LzD3z90R2ZmbkZFhVPMAW0gFfa9+bUK16e+zoEJoUBBvhtWJPhZcznkicbtoAdTxMZrVix
	xLZJ952dU70MPKkt74w4plYF1NWSGl1mryyakbyJM9kKdBOvJYL3k24voD5zOSexzFIJdd
	UcWxH3vg5UC/a6yek1Fb2zGqahRyBZcXbctWPyaE7aq4Bm24IpEQzeUun7ep81+Ml1wFHr
	CuJbpYp6xqa36dUYYxjkkQBNR1Uwx3z9MRLAWkzqgoRt5BcjFnFVFSenBDrvAcMYxiOVIR
	FmDI5xqlgJZcG69FqRrXkwsDCpyk+yhbyXkUOdLtWptTGkk3Ou2rZONsxtvf4w==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 9/9] net: stmmac: dwmac_socfpga: This platform has GMAC
Date: Mon,  4 Nov 2024 18:02:49 +0100
Message-ID: <20241104170251.2202270-10-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090305_266801_DF87549A 
X-CRM114-Status: UNSURE (   8.81  )
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

Indicate that dwmac_socfpga has a gmac. This will make sure that
gmac-specific interrupt processing is done, including timestamp
interrupt handling. Without this, the external snapshot interrupt is
never ack'd and we have an interrupt storm on external snapshot event.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: new patch

 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 0745117d5872..248b30d7b864 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -485,6 +485,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
+	plat_dat->has_gmac = true;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.47.0


