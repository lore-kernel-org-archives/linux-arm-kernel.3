Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A46CD1BDD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDh3EdnrR/PCsOp5ZedOmai1CHRqkh3yfIKuvIijDks=; b=UAFXib6ZDCBtBAd49TT67j+cGC
	qrr0mfchtWIpQBVcPPFgQqyF+hEQiFsTcZEmeyJfAb9KVbzf+ha17w+8XIkJ+VOI4eK5pw4ZaFrjK
	UvD1IBcXjiSdJz1PuVMIdyoMHup0+IQ7au16aan+PeeBgwnxYUrNbVaGRgLZjWy9f1x8qsIQaIxgM
	uT8Os/SDgK0oOJrh2xJ1wZFbXb+4frElZ/zAytn7jYj4bRidPxHhilsyrUXTUUOGAz5c54nVZtOZm
	6qHT5ISld7u9/xpCmnw3e/P0wsi874sFc0Ap1+S8ZXfCgFxch/tTW3zd0MpIff8M/eNFwsupM/Au9
	b2/tjexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80wS-0000000EY0y-0uDG;
	Mon, 04 Nov 2024 17:32:40 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Tm-0000000ES1P-36JD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:03:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 273D46000D;
	Mon,  4 Nov 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730739780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDh3EdnrR/PCsOp5ZedOmai1CHRqkh3yfIKuvIijDks=;
	b=KrYfvu8UGeDJygxO2L11K7UVqHgApKJ6B5G0XrJMQIaknLfvN9O3oLj6VKn4iOwqPDa/uu
	EhN13ONnoDp3uK44HuLR8PjaIsGDhxayoGp6XlN6xWZ0vKUJlZmpk3Wef12J9DfQF4yL3o
	qM53QmE/Km5NHFcwl/T2SFrG/xo8XyMinYndAxh03PHlN/fEKtaNeL08f6hiXo0UjiniHJ
	g4rMCdzmBsX79GI2ttDupJSVo0MnV8gKUqaGKlmviuGke0jDKAJCEeZW2Jr6t66fK1lpPg
	g5r9NG9D0k7Xl4s93XjRSQ1xCkLM/8oVqsDF0yRDRzpeqQ8TVEheT5eXVlfauA==
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
Subject: [PATCH net-next v2 6/9] net: stmmac: Enable timestamping interrupt on dwmac1000
Date: Mon,  4 Nov 2024 18:02:46 +0100
Message-ID: <20241104170251.2202270-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
References: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090303_103572_F5C8DC78 
X-CRM114-Status: GOOD (  11.47  )
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

The default configuration for the interrupts on dwmac1000 have the
timestamping interrupt masked. Now that the timestamping has been
adapted to dwmac1000, enable the timestamping interrupt on these
platforms.

On dwmac1000, the external snapshot interrupt is configured through a
dedicated bit, that is set as reserved on other dwmac variants. The
timestaming interrupt is acknowledged by reading the
GMAC3_X_TIMESTAMP_STATUS register.

Make sure that this interrupt is enabled when snapshot is enabled, and
masked when disabled.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: Make that interrupt unmasked only when necessary

 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index dbbd834f9fc8..37374f5a15c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -595,6 +595,20 @@ void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv)
 
 /* DWMAC 1000 ptp_clock_info ops */
 
+static void dwmac1000_timestamp_interrupt_cfg(struct stmmac_priv *priv, bool en)
+{
+	void __iomem *ioaddr = priv->ioaddr;
+
+	u32 intr_mask = readl(ioaddr + GMAC_INT_MASK);
+
+	if (en)
+		intr_mask &= ~GMAC_INT_DISABLE_TIMESTAMP;
+	else
+		intr_mask |= GMAC_INT_DISABLE_TIMESTAMP;
+
+	writel(intr_mask, ioaddr + GMAC_INT_MASK);
+}
+
 int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 			 struct ptp_clock_request *rq, int on)
 {
@@ -628,6 +642,8 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 		ret = readl_poll_timeout(ptpaddr + PTP_TCR, tcr_val,
 					 !(tcr_val & GMAC_PTP_TCR_ATSFC),
 					 10, 10000);
+
+		dwmac1000_timestamp_interrupt_cfg(priv, on);
 		break;
 
 	default:
-- 
2.47.0


