Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26139E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czEMZ2LYZ7yn4W/XpL9xxgwSyAv54G8CxWzNOcpEJ10=; b=XRORcSSC754Ne+XzeOFvNRFE6m
	qR3AkrRvBYd2atoolRYQNRcpGvUGlWRcZ1iXjczJOII+Ull2TDWp8DZ+3RgMrOGUNe1qfn+HE+v9I
	x3+vdsuy6EdyH3Mb5R7DgKR+PqO7P2cX1bwguMqCBq8lD2zh435lQh3eNO3gvSyIQ3bwS2JWmD7Fa
	BV8B4HFAWJTsGMNdMTYSFUZq3q2xlpE6O5ER2Oru9uyrtezJPL9OweT3Q/EwZiI90wkmdSr0zEZ4p
	OKXGbmtpXXF6NCNCE8UPAHg/nqZW5X0g6XGiu1sUna5LoJtmIUQzQ1kUT8ar8AD4d03Jv3YfFYA6N
	5dExirLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJF1w-0000000Gog6-1iTK;
	Thu, 05 Dec 2024 16:48:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEww-0000000Gn6P-0a11
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DCD55C6675;
	Thu,  5 Dec 2024 16:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EA45C4CEF0;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417012;
	bh=cDLcuBxu4MlG3S8lQE9mNu4I9S677lFh6lW7mFum0/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K8RWg/DlsQu66Ixs0wzjrqSpU9Jr6xPatWib64QGnMyRFeS8ZPmAjK35+CikrSGwT
	 Z+X6J0bb07bGRg1a2aNjnbwpRmS4GWVmkxqtSPdQ2zrDjaUWR1Syrp3MYBc7juKLi9
	 DMj7yM38/wb/YB0WFMt7UhXjW+UDLJtDMj1Ag+xTRWWBdduTDiiy/DPAJgP7+6JCki
	 KnDE3hKhtGkHf5SwVlWgvT/dB+OZceUVXDmr/rmWir34WvScQ6+Hb57wBkGACPUBlV
	 RQd/Z6iT+0LXzgd0RIIwY1ECNNfvLqBVT/isQKZv4RPRR+ADr7ZCZu2OsIa9ewXIKh
	 RYlSnSXNbS6AQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA55E7716C;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:43:02 +0100
Subject: [PATCH net-next v8 05/15] net: dwmac-dwc-qos-eth: Use helper
 rgmii_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-5-ec1d180df815@oss.nxp.com>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=1290;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=ZX+NwH2HQko3cIWDQjmmck130Lb3TijMXiPn59w6r/U=;
 b=PiP3f5Y7IK9B/J+oX/VL3ObtYifBhcxhpwIqRynudDjaaEIP00vQhJrkSe7I9cyTonjDFywbU
 oDNtZ0epzAGC7ZXXBTUXFmG8kC1MhnkYuy68W5hG3JFBtKBuNHAdjl+
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084334_291056_BA8551E1 
X-CRM114-Status: GOOD (  10.59  )
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
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 83290e707df5..bd4eb187f8c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
 static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = priv;
-	unsigned long rate = 125000000;
 	bool needs_calibration = false;
+	long rate = 125000000;
 	u32 value;
 	int err;
 
 	switch (speed) {
 	case SPEED_1000:
-		needs_calibration = true;
-		rate = 125000000;
-		break;
-
 	case SPEED_100:
 		needs_calibration = true;
-		rate = 25000000;
-		break;
+		fallthrough;
 
 	case SPEED_10:
-		rate = 2500000;
+		rate = rgmii_clock(speed);
 		break;
 
 	default:

-- 
2.47.0



