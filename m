Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8E0C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KJDSnN54e6nHoVHI3hmkPcATaJ7eX7EbuynT3I/CgVs=; b=QyUEboP7KftbWcaeU0z7gOo1q+
	IhqWT2sIzO4cdwUcdj9mMfTE+fiAVg/TdC7KcydbT7xSXt2Fq5eTAewP2znh4JVTBAzwTDUc4XtiI
	26zzVIv2cbIikKY6NlVP62O4vFvaCbntFoXugnSt5l+cpUI870h2fPjoktH0RSu8T54ipl3WsiqOQ
	oTkDiQiBpEz0aRrewh1qi56uM15oypPIckpc0fQN1T74SZbj6/cjgkGeGWvucPpiAk+g8o/8yf5QP
	yv61pprUbnyMOLchhCRM8Nh9TpR80qZcgnAP9/1E8Vf6zlKMvjNxMJLaQ0NnLnR8kzqN5dCR3Z85g
	rBRe/gRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bCJ-0000000Eyax-0R6R;
	Fri, 18 Sep 2026 16:12:23 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bCG-0000000Eya0-3v7E;
	Fri, 18 Sep 2026 16:12:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC9FD4E2396;
	Fri, 18 Sep 2026 18:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789747932; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=KJDSnN54e6nHoVHI3hmkPcATaJ7eX7EbuynT3I/CgVs=;
	b=IU+Sa0SC7beHmdw2MSK4P/O7aAu25uLSTXaSTrVN+eAouJYEIgoffuEjLOBxEzfFzK81rW
	7mZU+yb8cGTbqN0Zz1aeJP161GroHj4nEUvB8Pu26vWvx6dKpi/lNH8u25r/31rbp5/WS3
	Z2FlBKJhvmGQjt4M9hF7OiM/agJ3GnG7CKx0cknRfz7RTXB0GPXWhJnkJDmeSpfB/ZaAU9
	fukxQSqr5y1FTtsWZcz4MAiYX3RJpLV2ZdaguX+C5wD0GeBkn5bwc/WhnaktDpNslUxV1t
	ZmX0dfXfqP8A7t6y37nCA1L87ocdywUK6GV4STg2InvTf7jZ4iHzqUidNcq42Q==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: daniel@makrotopia.org,
	dqfext@gmail.com,
	SkyLake.Huang@mediatek.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH net-next] net: phy: mediatek: do not match MT7530 PHY if 10/100 only
Date: Fri, 18 Sep 2026 16:11:56 +0000
Message-Id: <20260918161156.377822-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_091221_158754_2490E4AA 
X-CRM114-Status: GOOD (  11.92  )
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

An EcoNet SoC 10/100 PHY uses the same ID as the MT7530 PHY, but a true
MT7530 PHY always has gigabit support so they can be distinguished by
the presence of the ESTATUS_1000_TFULL flag. Add a match_phy_device
which refuses to match if the PHY is not gigabit.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
This supercedes [PATCH v6 net-next] net: phy: mediatek: support MT7530 PHYs on EN71221 MCM
Link: https://lore.kernel.org/netdev/20260917130534.297930-1-cjd@cjdns.fr
Because after the recent EEE disablement in the driver, it is found
that the default MT7530 PHY driver does apparently work with the EcoNet
MCM MT7530.
---
 drivers/net/phy/mediatek/mtk-ge.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 96d8ac5154e5..f801966bb4ee 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -101,6 +101,18 @@ static int mt7530_phy_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+/*
+ * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
+ * does not advertise ESTATUS_1000_TFULL. Match this driver only if the PHY
+ * advertizes gigabit capability.
+ */
+static int mt753x_gphy_match(struct phy_device *phydev,
+			     const struct phy_driver *phydrv)
+{
+	return genphy_match_phy_device(phydev, phydrv) &&
+	       (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0;
+}
+
 static int mt7531_phy_config_init(struct phy_device *phydev)
 {
 	mtk_gephy_config_init(phydev);
@@ -135,6 +147,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 		 */
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.match_phy_device = mt753x_gphy_match,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
 		.read_page	= mtk_phy_read_page,
-- 
2.39.5


