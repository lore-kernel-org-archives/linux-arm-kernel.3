Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D42CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 04:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0IATkHfvMGoKoF4xWequDxul1RE/izmwmNlwAYw61M=; b=IcYuvpyv5FzGWwgksJj4pUh67N
	JOda5yW/4Kug0TwdA26N2v2qDO4R++DdHyXsE8RgKQ5HW12+kHWORGp6xHqzvLf97S1T7XbHzVIUF
	cpRdyIh2sqyZQbdbHtB5+aVt4F3psow+UYH9dJVPdeuziR4hWixeC3MNt3MNhIpLgwxat4hQS6bbM
	MqZTIRLJMzFnoT1dsagIOgITuJyioYsk+ruikz3RPwL5YDVDOGicaFvWvhG7iR0mxsSdeBokSBzph
	8luJMRmWWYB27ccqp1hT2+Ofkxal+DDj9Dp3fvMvcMve6U42a5YApphNesQ8aXC6yvj05VXxsAzPE
	Ml42+rKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeoo-0000000FTii-3qRV;
	Tue, 12 May 2026 04:34:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMeoi-0000000FTWn-3djf;
	Tue, 12 May 2026 04:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778560434;
	bh=zhnYMihbLOfkVEZ4q/kjQvAho+Gw9BO7XUM9RnKRnI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j8SrvDb5jKutc+aAOgfmB6DpL7/FAgUUqb2Ym+CI4pqEY+6fPvqju3LEDcROXR6c8
	 GhbwdMidkyNuvLF0kx7oo7Oe7E1y/NMQEpr7Sc16o1lyMtBzHxM/CcdqWfmzx9E6wN
	 X8/l9A8ACpqJZZar097p9p7zPiCPuOEv4Q9wYgh/YKgfURQvCNz6s9JhVMoAZKzzti
	 OAZ4Er/PMLtDh1S44tjRe7TG4wpmkzwEq3hkzYan/iTftYUoiBsBwGYjnq6zAkWLsn
	 Sk9k0jTeK8U6pulzV68NXw595XlzaSNEszybKKbzjCZCeuHfquF1uO/n8Ana5Ya4mH
	 2+StPZCfHecUQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1275917E38D0;
	Tue, 12 May 2026 06:33:53 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 12 May 2026 06:33:23 +0200
Subject: [PATCH net-next v3 6/6] net: phy: air_an8801: ensure maximum
 available speed link use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-airoha-an8801-support-v3-6-1edb34e363ae@collabora.com>
References: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
In-Reply-To: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778560425; l=2139;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=zhnYMihbLOfkVEZ4q/kjQvAho+Gw9BO7XUM9RnKRnI8=;
 b=d9T+rQISrxFOFaBe5BEpNIhybPQ7T/mE0r+jxzAnoMd/s5SMIVX9pDgBRUQduTC/sMI1uMTx0
 z1/pbJUG4CxAmJ3BnRae6UjsTcN/Lwq48VnZL74ZQIstjStA7rbhbbM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_213402_033217_18F6B8A0 
X-CRM114-Status: GOOD (  13.16  )
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
 drivers/net/phy/air_an8801.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
index a0f164cbf92b..af46951b1a33 100644
--- a/drivers/net/phy/air_an8801.c
+++ b/drivers/net/phy/air_an8801.c
@@ -964,6 +964,36 @@ static int an8801r_config_init(struct phy_device *phydev)
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
+	if (phydev->link && prev_speed != phydev->speed) {
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
@@ -1061,6 +1091,7 @@ static struct phy_driver airoha_driver[] = {
 	.suspend		= an8801r_suspend,
 	.resume			= an8801r_resume,
 	.config_aneg		= genphy_config_aneg,
+	.read_status		= an8801r_read_status,
 	.config_intr		= an8801r_config_intr,
 	.handle_interrupt	= an8801r_handle_interrupt,
 	.set_wol		= an8801r_set_wol,

-- 
2.54.0


