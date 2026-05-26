Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FA3CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuwiBHpuggaX5k2JJ629aa6RkZtKCXVzBVQgs0kIX5I=; b=sKJPRiapAVVHJO9E2oCzsfn87G
	u0Kj6zIMLPVcmptQYBKaRtBZ37hraZ0jHgstg4TglwmJQ/5UzXBCFQ0iEbxuwZgRXjW3ZXxgVHC69
	zBDRs7JnselIE6uJV2uP0dQ8NgxfRnfBfgdphSqT9pYCxEWUULwCeGAa/RE7tolVxSy4onNmDQj30
	/sh7CdQzBVtXWeC9Pc4fF1YCRMot9yDcZK3P4X+XmxfWXYLGW0Q+F1wWjhG61wZu4YqqQeYGO1CfP
	qFhj0aLhVz/shEWnuRqtTL7yXHgjisAdeaSlkc4RttN5GsBopcG058rjifNlziy5y1g9i2L1vM3Jw
	tSjnrEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtFq-00000002HUk-2p3A;
	Tue, 26 May 2026 14:59:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtFg-00000002HGK-47af;
	Tue, 26 May 2026 14:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779807567;
	bh=qDIKeceRZQi8Kht1iTmljrU4lnSxyn0oEHL2dPnESio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IBgymD9jo/vveamU7KQIQ/SPp78mS7Js7yWQRSQUAKFwMKjek1sPLKWJ5LbPDp0Ya
	 6mQ5QkKCWBxQzj1G3v4wOd0AMy+qjeUPnHGBVyj/8q3+ch77h8jtYmhbxZzhEP8Yhi
	 OeDD01C1+JkhvtGrrY1Qdsr9HLmE7f4rF7sQ5FbsARd6VlAe9Tx6zp/rnAZMDvGsvy
	 8hriMyGzR1KiOhKkoF+I71euLBo3Q0hEZJGVeLWdypiUrLNaM+IfaNOnLPX39Hlhdr
	 RQQ2vZIOUe0onX6EB2DI9ucKcpJjvRNL2fdrNajgRcZDHuJjWV/q7W5fGhNVX+8Bjy
	 P41cLMzcV1cAA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87E6417E0CF3;
	Tue, 26 May 2026 16:59:25 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 26 May 2026 16:58:11 +0200
Subject: [PATCH net-next v5 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-add-airoha-an8801-support-v5-6-01aea8dee69b@collabora.com>
References: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
In-Reply-To: <20260526-add-airoha-an8801-support-v5-0-01aea8dee69b@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com, 
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779807555; l=2209;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=qDIKeceRZQi8Kht1iTmljrU4lnSxyn0oEHL2dPnESio=;
 b=6olIzN9aEMnfSw8gvWsFpzgsQ2QyrEQpwURR/hnSZZuk3wyNrHv4JqSvAxvw44N9mUNGAoBQy
 3sADk+71SEUBD7gsGYrXKlLSRNBW+437hj52O6IomH+0DItxEgJ792M
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075929_326810_04726124 
X-CRM114-Status: GOOD (  14.28  )
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

To ensure that the Airoha AN8801R PHY uses the maximum available link
speed, an additional register write is needed to configure the function
mode for either 1G or 100M/10M operation after link detection.

So, in air_an8801 driver, implement a custom read_status callback, that
after genphy_read_status determines the link speed, sets the bit 0 of
the link mode register (REG_LINK_MODE) if the detected speed is 1Gbps,
or unsets it otherwise.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/net/phy/air_an8801.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
index aa24bb182d64..f97c78e43023 100644
--- a/drivers/net/phy/air_an8801.c
+++ b/drivers/net/phy/air_an8801.c
@@ -996,6 +996,41 @@ static int an8801r_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+static int an8801r_read_status(struct phy_device *phydev)
+{
+	int prev_speed, ret;
+	u32 val;
+
+	prev_speed = phydev->speed;
+
+	ret = genphy_read_status(phydev);
+	if (ret)
+		return ret;
+
+	if (!phydev->link) {
+		phydev->speed = SPEED_UNKNOWN;
+		return 0;
+	}
+
+	if (prev_speed != phydev->speed) {
+		/* Ensure that PHY switches to 1G speed when available,
+		 * by configuring the function mode for either 1G or 100M/10M
+		 * operation.
+		 * Therefore, set the link mode register, after read_status
+		 * determines the link speed.
+		 */
+		val = phydev->speed == SPEED_1000 ?
+		      AN8801_BPBUS_LINK_MODE_1000 : 0;
+
+		return an8801_buckpbus_reg_rmw(phydev,
+					       AN8801_BPBUS_REG_LINK_MODE,
+					       AN8801_BPBUS_LINK_MODE_1000,
+					       val);
+	}
+
+	return 0;
+}
+
 static int an8801r_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -1093,6 +1128,7 @@ static struct phy_driver airoha_driver[] = {
 	.suspend		= an8801r_suspend,
 	.resume			= an8801r_resume,
 	.config_aneg		= genphy_config_aneg,
+	.read_status		= an8801r_read_status,
 	.config_intr		= an8801r_config_intr,
 	.handle_interrupt	= an8801r_handle_interrupt,
 	.set_wol		= an8801r_set_wol,

-- 
2.54.0


