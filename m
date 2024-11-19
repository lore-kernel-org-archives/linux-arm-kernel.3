Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797BDD44162
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atxOs4Z/04OaqmL8iL0lS7FhvPAv9v5sjxzWZJVGpP4=; b=ksS7P1P9W3sEMEiBrbMaWH6RIx
	PdL6hq82dXns/Wdd8w6LTvpq8ww2YqIMtK97BBGCd89A2SgukvPnI7nsgju0TrxNxDVIyBgq6Wq0d
	pWJT77j36T6vopTDOXLmUCeTPGxgpj91glszB5pYLE4jqKtgzNNyhpHEMYl//WYdVv9/XkcqsB8mf
	RKLUSonXn/6gEPReKBK0cLVQ41qnKdXpRreLgYiMyyG3ij3vCwrN15eUSBHLO6fUGThoJxeZttplV
	EaVTV6yVtup2cmHVeFkP6IizECUEnN0Ii7V83k9ND5Al4EBUKZymFtOhyV/077gdxuEjZ5orMjq/u
	0W7/4BIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPqY-0000000CnLa-440A;
	Tue, 19 Nov 2024 15:08:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPj0-0000000ClLC-0hE3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8C0E5C5559;
	Tue, 19 Nov 2024 15:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84D3BC4CEEB;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028464;
	bh=515UImMIUwY1iiiy/6ZmqrgD+7ijxpfASmzHkHswzhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jcav2wRAiavU678iNu9xPGuzu5a55RyALlwMuqhoGJ5NE3BLeX84JA6jmBH+w0Krd
	 CgoGM/Y6PHEZgLyvqpQ8WARACpXmi4sjYxNFLPCiYAVAlEi6thxBghV3qhJ5gBEHc1
	 4NIu3U4r9VmOYFM+qTlPoYe6A9Ovmwje7pZFeYitljflRBh7cFHl9KwV4a4gg74MDd
	 fPSngu9Dt3l2DdLdvvzRqBsQ7unhxHBDqeW1+tnU1V3cISYm76TD/ZesHU/Vl/h8+u
	 57koGWO1pm6ckIsqvqdxNNBx+hUGTpEte0ui9YTYQNZDs27+YcDlQ3IwxuKJAzZO85
	 hd/TeT7VeEXHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B802D44167;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:13 +0100
Subject: [PATCH v5 07/16] net: dwmac-intel-plat: Use helper rgmii_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-7-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=1227;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=slqRw7objjurz553hpNnHk7Oq3u52m0s/u20cRgTiOo=;
 b=X/dVu48GWo9o+7QqgePHJElMkzsTJa1PUZuhR9ytxNevODjPxQO/lj6gznC/I2xcocEtOv6kP
 +VdcspNoLSlCdmCkNPIdyCDtr+4lSb0R2aZ0D9qDZaqKCJnP0mJw4Zd
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_070106_299363_99D11DE2 
X-CRM114-Status: GOOD (  11.56  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c   | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index 9739bc9867c5..71dbb8031506 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -31,27 +31,15 @@ struct intel_dwmac_data {
 static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct intel_dwmac *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int ret;
 
 	rate = clk_get_rate(dwmac->tx_clk);
 
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-
-	case SPEED_100:
-		rate = 25000000;
-		break;
-
-	case SPEED_10:
-		rate = 2500000;
-		break;
-
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dwmac->dev, "Invalid speed\n");
-		break;
+		return;
 	}
 
 	ret = clk_set_rate(dwmac->tx_clk, rate);

-- 
2.47.0



