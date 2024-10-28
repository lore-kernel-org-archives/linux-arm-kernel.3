Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81159D5B146
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y0r11dhBVHxx2axl62CnIoQCz7zkssspEogqyd6qmc=; b=Hc6904nPIFN4Zjl9HHn4Ed84Zg
	Go0eR/7baydmLh/wOXmBjqmT7zq/gRObMYzLa/5LR20gjSry8NxEteKCxCUP7/IJh7dJgB0ZyA9ML
	vu/04eR8AAWs92UzVC+WEKKFI/8KYJRAkvWXfBRJ1bpSJnpg9/Cjl2BJ/xHMhsGAtX6dqKhF5Wgl4
	tAFDChaY97fnfbJA9q5gXPewdn0D43pa47EDG+unTOiZSUDUEbFxC+p7oMDj/Cgqc8VL18SVG9V7+
	mn3K0E3mv5OqptPtTEPhMx4I53plq800haxSWKmyBQoCMA+p68yvQH91hgmd+GbbA+WeO1XqhIJzM
	FyNk7/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WTS-0000000CCdO-11x1;
	Mon, 28 Oct 2024 20:36:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WIr-0000000C9BJ-3Jv9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7ED0A42A32;
	Mon, 28 Oct 2024 20:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 244E8C4CEED;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147128;
	bh=VSzM/Aqzd9ydOVExBs00GoWTm8h9XaWLXTka7dAqxhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ESbE2oFFZ4YC5RbGAWT9SmLuBvkOxsN+QoaMiUH0P2f/SH7IC20iwXZdcCi8teNlP
	 Kfo60LBlbDGtFJmZE0lpkYwKedm/pFM4TpSFtVymm6Mj8L9GOTi2PAlXEvkQSSUyoc
	 Q6844LUsb6sBYngqitm2an3qOxq9Myd0oVxdpT/RXd71TfrXyTWbK3m79zd15GVUSj
	 +M5FNVk2rXQbP8Et0PtZGilPz3dB54yzPALy3WWiDHnOeh/fyrCF4sccyOh8Az/dY4
	 4Gj4zM+4pWkn+8tZC3JTEaWtaXB0HnnR/8/940UfKGKnevqC67Q5dHegl9j3tlMOC6
	 FbxZ+Ht7cbSTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176BCD5B148;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:51 +0100
Subject: [PATCH v4 09/16] net: dwmac-starfive: Use helper rgmii_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-9-03618f10e3e2@oss.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1184;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=YVAUfNddfX6I63XBPKwqSvyB5DYz6NCjgmmbUf+1q5U=;
 b=BNQoqbyvZT9P3j86kVabLJTJzgQIuXduLBqYyOVc+Gr57eySX+k4bMLPlCea2Wnk0yTGB40XE
 Kpa0XUJEeEKCefuPgwqKRWjDXkRskERHGBHAu3AcDeKK9W3sxNzc0n6
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_132530_052644_5D624C2F 
X-CRM114-Status: GOOD (  11.04  )
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

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 4e1076faee0c..d80461a721c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -34,24 +34,13 @@ struct starfive_dwmac {
 static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct starfive_dwmac *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int err;
 
-	rate = clk_get_rate(dwmac->clk_tx);
-
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dwmac->dev, "invalid speed %u\n", speed);
-		break;
+		return;
 	}
 
 	err = clk_set_rate(dwmac->clk_tx, rate);

-- 
2.46.0



