Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7F0CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qPLeY0wB6z4SlQ2CixKExblEbsAtiEDVJ4XyqUTfJA=; b=L6QTCRsV2kE1zkfKK7xzygpUWV
	8tqr2pxsx0Us1jqJuPkEvxSqgCePWlcB/0qiI4a3jTTv0vfQM9v8DY7+WRpw2cWlGcNRyuKf+00dv
	mm/K5OeejbW+3K474yYvmjNaCSO/E/tBS4c3puL/jziiULYjTe1xiT+xBs+acfvxFE5v/+Jt4rXJm
	ANR7wNLiNNi1kLJ8it94oLEnZrihURxhaosU2hB0ybX3cvaD8RB8aSEa4CgaWysLs3wTeJqG7K2L+
	Af8vcWgqMrt2tGRf8mE6iX5kR3cqcFBxHyEn8lqydHrgcyBCAMojh99dX2z7GiuV1H34Vl7lBHmND
	kaG9LuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPygT-000000077Ri-2vJh;
	Thu, 21 May 2026 08:23:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPyg0-000000076y5-0kn4;
	Thu, 21 May 2026 08:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779351762;
	bh=CWjNHp3lVq1P1BWK7ilWt1phFCJ5rYaKgQ1jBzqDdC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eYn7FEC4jU99Os15lM7ysV8MVNZ5cDHrPV2RrLJtQyJZNSfSx/3nLbeQgY1RQY7LK
	 9cRRM3OJ/cBeavnPMiX0r6yQoePltpsfq9TmBRiUXrX4RtGhi45b5Ft/GkcarK1cO2
	 TcXKgQWdUV87RHJ+Kp12fnCFlWTiEudDkB4gFFDkrw97reER9a64jHA+FOwPNTxgVt
	 FA4lE+zLw+ecA3oM8Il7MHo0htM6qZek0vj31XvRCVDf8OyUEGXX6IMRIzD+qbAz+L
	 fY3q9HbPVCXJRbvlpfQAiSYLKFgj7jLBLTB8i9dk9GpQ1Swo7j/rWs9P/rcPFhp+mo
	 /ikV7Mg9pt15Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CADAE17E132E;
	Thu, 21 May 2026 10:22:40 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 21 May 2026 10:21:59 +0200
Subject: [PATCH net-next v4 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-airoha-an8801-support-v4-6-1e4837d30ef4@collabora.com>
References: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
In-Reply-To: <20260521-add-airoha-an8801-support-v4-0-1e4837d30ef4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351750; l=2402;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CWjNHp3lVq1P1BWK7ilWt1phFCJ5rYaKgQ1jBzqDdC4=;
 b=VyzIoCdpeWn8XvAgkZ+U0CxFZMGW7ROgymrXgmziebcmXzI3bFPS7IqXSmZswrGGXY0MFsfe6
 dQXDwoabVL4DJO8krNlUYO3VktXt3im52mbwf5gN+b3TNutVvD0dUPM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_012244_379760_96BE4899 
X-CRM114-Status: GOOD (  14.75  )
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
 drivers/net/phy/air_an8801.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
index 73f94e84da07..c64fa153b738 100644
--- a/drivers/net/phy/air_an8801.c
+++ b/drivers/net/phy/air_an8801.c
@@ -977,6 +977,48 @@ static int an8801r_config_init(struct phy_device *phydev)
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
+		ret = an8801_buckpbus_reg_rmw(phydev,
+					      AN8801_BPBUS_REG_LINK_MODE,
+					      AN8801_BPBUS_LINK_MODE_1000,
+					      val);
+		if (ret) {
+			/* Restore previous speed on failure to ensure this
+			 * register setting is retried on the next poll
+			 */
+			phydev->speed = prev_speed;
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int an8801r_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
@@ -1074,6 +1116,7 @@ static struct phy_driver airoha_driver[] = {
 	.suspend		= an8801r_suspend,
 	.resume			= an8801r_resume,
 	.config_aneg		= genphy_config_aneg,
+	.read_status		= an8801r_read_status,
 	.config_intr		= an8801r_config_intr,
 	.handle_interrupt	= an8801r_handle_interrupt,
 	.set_wol		= an8801r_set_wol,

-- 
2.54.0


