Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74E4D3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsLQRHH9qcfVm0KFq9nbu7CAMOKMnDfpEsC1vjJ0/qg=; b=N9vqfJ8DzRJsxIl3i4+hin329P
	N+FqzSXR6W+LgAtY7a4PmPPLgkuDKCeFtDS1jKeib112vqlQ650MQUB27E0H8vRFKBzMsw7cl2+yg
	6s6uwNIj7aPTFXA5CgyRLEr0wIOXyMB+mEfRZ6owq4J8ry05/YqRtkDRMKGS8s1T2G2C0j1kfrvPd
	ETLBwoGGXXLQBLvLgCbFvvw4FpzAI83C9pL4PhSiBJvpN8xRUtUESWt0l4z6Ar9ziO6NgYpGjX6+w
	elOMu+f4pAgXZ3VkRfiAI/EoypKhMANifCa1Sas/0EDBVv6o8nf79iCWHwzpevATovdHR2cAi9pBH
	zJhvitaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cEK-00000002V0M-04k5;
	Wed, 06 Nov 2024 09:21:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bx0-00000002OTe-1v8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:03:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AC37C000E;
	Wed,  6 Nov 2024 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsLQRHH9qcfVm0KFq9nbu7CAMOKMnDfpEsC1vjJ0/qg=;
	b=XUpUb+JT6rjH1kpItlNyHplkrG9yd0WFPn/4A272FO38lRygb+7vRZeZF87FVMA1+KVHuP
	9d7x0xGXW4XOMxQBvhpZEoYOLcUYrK8V3DXejJil2BlVTG3Z5VU5gMGmFbRv66lyBTWUW4
	RjN7z5G02uX7prPHiOjVQNrTw98Se6eDYNCjBOzxQi93xpFREQaJyzXNqm7F1bfjZCdW5X
	nUx2gaw4YiQXqwJBPJprBfY4wr1XaR68ftcIqs+IREamQgBcviKsDuGYcihuvzxYt8jSLq
	oH/tr8EnhdN0x00dELjl7FqKL8TYKw7CY5CVs5FNtHRDbkV6S0ewPEE2jM+iGg==
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
Subject: [PATCH net-next v3 6/9] net: stmmac: Enable timestamping interrupt on dwmac1000
Date: Wed,  6 Nov 2024 10:03:27 +0100
Message-ID: <20241106090331.56519-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010342_688201_E022B471 
X-CRM114-Status: GOOD (  11.41  )
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


