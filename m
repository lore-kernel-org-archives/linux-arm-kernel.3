Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22827D75E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+01xzJeV3qRX2WUWGKaOOxbz2v9CPnb9VQR2tAoftiY=; b=aRKM8wB3X88tm2mnqSU0Y6/1kC
	nmsT9PZFoJ0iY8JUbcNyLLJShzC7ztKm4MqACerrGY1QfcB6u3ZZtU7KBvC/RwZ0i2zQukglISYoF
	2jJBQGhJ8QqrUbZCfozff7Q2ZUIA81v1QFIPky772NehC4K+nw+h0YGSx6B+SBDsOmaTbPPrZ+XOq
	KLw6KmOs/9O1Z1sOIpHSpVFCQRC+gWLn5RzOydqI1qJVSMqpFrPCXhRjj/EkrbwPu51niFccaSgIo
	B3ZWfO8HNaACeEvuQ05oTy2Ek3L7SZOOzop7sUGBy7UTSknDwfSYIp2YNi12Qh7ayxd/FXAWZ2cTl
	/hXKMB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUQA-00000002b6S-2aVw;
	Fri, 22 Nov 2024 14:14:06 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUPD-00000002avw-3Iiz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 14:13:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9B381BF204;
	Fri, 22 Nov 2024 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732284781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+01xzJeV3qRX2WUWGKaOOxbz2v9CPnb9VQR2tAoftiY=;
	b=EPxDcobPHDeJCBnjLXZtIBQaHN3OS6jpELxflv23dxJ/V44WfAMfNEUKav0FLPtpF0C2s7
	rKbYlya+ZEhOac2lw0RWwCdf6/Y9b6/LMgXWyvz7STEx7lCwbMzmMZPDUysI6HB/FbPM+1
	NMb5euWe1AY54iZoHTnqm4LACVr3Xohdk+Cl/1izvYTxbS2c07+4Je7B+4Utd/3yR33wm8
	paLh3eWkk4sBJtvGIQbQ4uXUdIzjZ8Qyy+gqCDtLPjYCR2YS2AlzmIHxvAChQ6Bvl2G1ek
	Tfycg8ero7EGeQFugWRS4PRZ9YgL0mA1QyUrjUcdkQNWQQaM6R52V9uuyK2xMA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as broken
Date: Fri, 22 Nov 2024 15:12:55 +0100
Message-ID: <20241122141256.764578-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_061308_125022_2C14B6E0 
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

On DWMAC3 and later, there's a RX Watchdog interrupt that's used for
interrupt coalescing. It's known to be buggy on some platforms, and
dwmac-socfpga appears to be one of them. Changing the interrupt
coalescing from ethtool doesn't appear to have any effect here.

Without disabling RIWT (Received Interrupt Watchdog Timer, I
believe...), we observe latencies while receiving traffic that amount to
around ~0.4ms. This was discovered with NTP but can be easily reproduced
with a simple ping. Without this patch :

64 bytes from 192.168.5.2: icmp_seq=1 ttl=64 time=0.657 ms

With this patch :

64 bytes from 192.168.5.2: icmp_seq=1 ttl=64 time=0.254 ms

Fixes: 801d233b7302 ("net: stmmac: Add SOCFPGA glue driver")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 248b30d7b864..16020b72dec8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -487,6 +487,8 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
 	plat_dat->has_gmac = true;
 
+	plat_dat->riwt_off = 1;
+
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
 		return ret;
-- 
2.47.0


