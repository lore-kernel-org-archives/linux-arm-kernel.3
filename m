Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A4D3E798
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YY/BFgC6bGU8aHXsQwu5u3ZdGvQcTEQGF6Gva3LQNL4=; b=MbXV3x2f2VNKBNb5EEoWjQokua
	MoxpG5YZXp5MCrn6UPYz7nDVxP8wQexA9ugDQeCcJPTRz+4Rnwk2QRUscksCbxNXhPYk8dlEuJUjN
	+BJJ+mQXivqNdyqThzRFbcpQRPoFPuqpi+ViB+hLP0flATsqiGumuhxWXg3RnwJ70G150qd9cKCbI
	HuBPPfn0DsniG0OH9KrY3yQR6FaC/6XtPakQxTt/N3W+gixI6IyF7LqKUsJ0srwfKRFyqosJ1e1II
	mAy4swPTHUAgGNH0ES1GK+DH/3mtBsuNYuApI9Zi+J6tsIDBjxj/G6EeJtFEcirOJcmIv/kTGq6h2
	1xw13qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cHu-00000002WVA-4Amc;
	Wed, 06 Nov 2024 09:25:19 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bx2-00000002OUJ-0jw7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:03:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09AC8C0005;
	Wed,  6 Nov 2024 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YY/BFgC6bGU8aHXsQwu5u3ZdGvQcTEQGF6Gva3LQNL4=;
	b=dMiJmSrzFewBNUuaWceqSLWR6fRO6pEH+oboc1R+HHxvzd0ut92rEWa4JprfE9CroX+2bp
	AsZpRjTE8mfc7mLFseC2uRnFeOcy/qsomBMgUmkICslYODjuq2OAxHR9dg15ulRAbVviV2
	yNaNBv6hX0o3IWdwqcmh9mM6RrZ94kvBWjAbirbiB3e1axiqrC4aIWjlLKtI+1G+GsMWSI
	0DlQ2v3IAjdilxUK69KzKqY4f2T5KCjpUS11BKogwZcwLHom+X0C+7CCQNvB+k1gYWw529
	irEZkMTrx9geAsaQgb9eFCaVG1py5MtwJp+QbA93GEr8DJprbcTB1IuJOCRcKA==
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
Subject: [PATCH net-next v3 8/9] net: stmmac: Configure only the relevant bits for timestamping setup
Date: Wed,  6 Nov 2024 10:03:29 +0100
Message-ID: <20241106090331.56519-9-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010344_504644_F3D83717 
X-CRM114-Status: GOOD (  13.25  )
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

The PTP_TCR (Timestamp Control Register) is used to configure several
features related to packet timestamping.

On one hand, it configures the 1588 packet processing, to indicate what
types of frames should be timestamped (all, only 1588v1 or 1588v2, using
L2 or L4 timestamping, on IPv4 or IPv6, etc.). This is congfigured
usually through the ioctl / ndo dedicated for such setup. This
configuration is done by setting some fields in that register, that seem
to behave the same way on all dwmac variants, including DWMAC1000.

On the other hand, and only on DWMAC1000 apparently, some fields in that
register are used to configure external snapshots (bits 24/25).
On DWMAC4 and others, these fields are reserved and external
snapshots are configured through a dedicated register that simply
doesn't seem to exist on DWMAC1000.

This configuration is done in the dwmac1000-specific ptp_clock_info ops
(cf dwmac1000_ptp_enable()).

So to avoid the timestamping configuration interfering with the external
snapshots, this commit makes sure that the config_hw_tstamping only
configures the relevant bits in PTP_TCR, so that the DWMAC1000
timestamping can correctly rely on these otherwise reserved fields.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index a94829ef8cfb..0f59aa982604 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -18,9 +18,22 @@
 #include "dwmac4.h"
 #include "stmmac.h"
 
+#define STMMAC_HWTS_CFG_MASK	(PTP_TCR_TSENA | PTP_TCR_TSCFUPDT | \
+				 PTP_TCR_TSINIT | PTP_TCR_TSUPDT | \
+				 PTP_TCR_TSCTRLSSR | PTP_TCR_SNAPTYPSEL_1 | \
+				 PTP_TCR_TSIPV4ENA | PTP_TCR_TSIPV6ENA | \
+				 PTP_TCR_TSEVNTENA | PTP_TCR_TSMSTRENA | \
+				 PTP_TCR_TSVER2ENA | PTP_TCR_TSIPENA | \
+				 PTP_TCR_TSTRIG | PTP_TCR_TSENALL)
+
 static void config_hw_tstamping(void __iomem *ioaddr, u32 data)
 {
-	writel(data, ioaddr + PTP_TCR);
+	u32 regval = readl(ioaddr + PTP_TCR);
+
+	regval &= ~STMMAC_HWTS_CFG_MASK;
+	regval |= data;
+
+	writel(regval, ioaddr + PTP_TCR);
 }
 
 static void config_sub_second_increment(void __iomem *ioaddr,
-- 
2.47.0


