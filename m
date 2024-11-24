Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5682DD3B7C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 22:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4R9ZCznSvP7a9d+goJa7yTje1YRCtLV0iG5CivTw30=; b=maAtAmJ4BYRq6IK31UVQS57/GC
	weO745Cde6KsSsyGGASnIJtoRHaBSXtAm1cSnXZv38s4HKe3tefYmWaFwcNuT9bOiY3XTS59UQHmt
	xlNhocn/V+QPpICklZnF5k3oS/EgYXcWHEtNLOqkigltcYapr3QzSef9CFhX++6IW30+HK+s6nELD
	LMeTqCRjP6TFW17JJEycLMxzwcc1Cv08gZB1upbmfqBclwqMEVegRc9ghjVxn2I3WU0ukirE/thp4
	vZ9hyCkwtjHDfc0zvcoKfVXO+Lsy2hTLnRiJkP/j2ym6s2L8f53uaHokfiYVmJJrJ1D/6MXT+bOHn
	Qj67E3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFLWz-00000006lOO-2lSq;
	Sun, 24 Nov 2024 22:56:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFLK1-00000006j7b-3NYK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 22:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A85335C57EC;
	Sun, 24 Nov 2024 22:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D5F5C4CED6;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732488194;
	bh=AlRn+WZd6SfhWS2fa7bQSadmkZzrS2yhhKqX7aao6Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oDiF3Ax3dMJzSz3bQajOW+0GvBW7D9THUaJzsJvYz4CtA5sgYOG48c7qWY7cOVGN6
	 iPjEZXXHRQgKSgxUvcc2NNs+vz+ScXTZUyBrr77GJ6BooKsmWrxZ9Ob7Tb8f+iX0bz
	 XwMY/AbntIcrUpGhB+d65uTBrDNC1PzZXQvHuHkOm+WdUIg5/GuTkLQf6vcQEP9M3n
	 c9dKBhh3bDWBa2xd2G+Erd3+nM9eIxowkO3POPtx2zu7Hcm7agUXDCYjDC1QD2wp60
	 lIbt6rWXXoOS/N/oLsQihIDULXqEb3zIIUpgdb7RDXK7kuBhJm5n+vn5LeEWyKMNaw
	 RTD086adOVezA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63653D3B7C0;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:41 +0100
Subject: [PATCH RFC net-next v6 10/15] net: macb: Use helper rgmii_clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-upstream_s32cc_gmac-v6-10-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=1061;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=lqge0TxoQLFiynEUre89U7vm4A38Pvil86ayrYiUui0=;
 b=lusr+SunX8FEHrDCn/OhAZlRWJhhVkvMXNMoGacnnL3DrNAExtv9Iqr7zOzvc210K6D5c+eya
 fpXKu2rKHspAwPhJ8AFt0o3wJp08KYiRY8hv4sU7ieEvLlIPO+bQBle
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_144317_933623_36A4B4ED 
X-CRM114-Status: GOOD (  10.20  )
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
 drivers/net/ethernet/cadence/macb_main.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index daa416fb1724..640f500f989d 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -530,19 +530,9 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
 	if (bp->phy_interface == PHY_INTERFACE_MODE_MII)
 		return;
 
-	switch (speed) {
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0)
 		return;
-	}
 
 	rate_rounded = clk_round_rate(bp->tx_clk, rate);
 	if (rate_rounded < 0)

-- 
2.47.0



