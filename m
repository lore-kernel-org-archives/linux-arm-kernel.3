Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393FCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0S0cdLQ9gUnRSIENZJ0gUiEWIZ50LEfX82jm6x9CLLw=; b=2q6cVydwEKK0S2Qy86vwklbES5
	Sbx/y38ByIqX04uTrjkSXwwqTNJqu66mxM6NgdIMP5TQRoJwq00UrcAHZ47CfgrCHEFItcttogn4v
	l3dX1sPSeyqF1N6gMknT6oTlH1aGhNd9h1CgACUAclxwXEqp7o1MPZ6E9FiXzXabx+lNYIWC+LVcn
	0qneZzEwbU9mXWh/T0pQfyiJimO8q9YeGc+XQ+zA4ap7WCvJPOQ3S6klhio/C13Yi3NX8eM+S0kIW
	8bKF9vWamNi3MCgce+Oa4UYnNrAN2SyWoWuZLVRNnfJJqVVIXoXMly/KZDJ5hz+KPhKldorzzi2iG
	HjFGHREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Ou-0000000Bnvl-2l3E;
	Tue, 10 Dec 2024 14:39:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL14k-0000000BixX-0YlS;
	Tue, 10 Dec 2024 14:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0S0cdLQ9gUnRSIENZJ0gUiEWIZ50LEfX82jm6x9CLLw=; b=A84AYt4uGPMNGxvKBUST7flKVc
	WKcwVi/grcRjRuZJaBYQU/pFvxNQSLp+8YQ7A90c+++ZId80t7jy8/Sit/JZOTpHICPJGbBHfzZiZ
	nks5fJ98btK3MSyOes/pH2yUnSemSmjjh55kpZnf1GV4houJfHVbZ9SS+W+aNnRa0rKddWQgkPKQo
	+hToZ54IlMBETqapm3OtHk2kMcfl6IK8SGNbcbOS33l5oqPhf3MOfZi/KvimqhQvZ2hoc6coIVjXj
	qBYByUOiJrfQxR87NfKyhwzyr6hkzox+q0X5pT2LucvmyoDdj04oVH9ZqMaezUBuA+5UCXskcf0uW
	MjZrBW+Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34132 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tL14a-0002Uq-27;
	Tue, 10 Dec 2024 14:18:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tL14Z-006cZs-6o; Tue, 10 Dec 2024 14:18:47 +0000
In-Reply-To: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 8/9] net: dsa: ksz: implement .support_eee() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tL14Z-006cZs-6o@rmk-PC.armlinux.org.uk>
Date: Tue, 10 Dec 2024 14:18:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061858_170589_22D77A0F 
X-CRM114-Status: GOOD (  11.46  )
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

Implement the .support_eee() method by reusing the ksz_validate_eee()
method as a template, renaming the function, changing the return type
and values, and removing it from the ksz_set_mac_eee() and
ksz_get_mac_eee() methods.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/microchip/ksz_common.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index f5822c57be32..94f9aa983ff6 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -3454,12 +3454,12 @@ static int ksz_max_mtu(struct dsa_switch *ds, int port)
 	return -EOPNOTSUPP;
 }
 
-static int ksz_validate_eee(struct dsa_switch *ds, int port)
+static bool ksz_support_eee(struct dsa_switch *ds, int port)
 {
 	struct ksz_device *dev = ds->priv;
 
 	if (!dev->info->internal_phy[port])
-		return -EOPNOTSUPP;
+		return false;
 
 	switch (dev->chip_id) {
 	case KSZ8563_CHIP_ID:
@@ -3471,21 +3471,15 @@ static int ksz_validate_eee(struct dsa_switch *ds, int port)
 	case KSZ9896_CHIP_ID:
 	case KSZ9897_CHIP_ID:
 	case LAN9646_CHIP_ID:
-		return 0;
+		return true;
 	}
 
-	return -EOPNOTSUPP;
+	return false;
 }
 
 static int ksz_get_mac_eee(struct dsa_switch *ds, int port,
 			   struct ethtool_keee *e)
 {
-	int ret;
-
-	ret = ksz_validate_eee(ds, port);
-	if (ret)
-		return ret;
-
 	/* There is no documented control of Tx LPI configuration. */
 	e->tx_lpi_enabled = true;
 
@@ -3501,11 +3495,6 @@ static int ksz_set_mac_eee(struct dsa_switch *ds, int port,
 			   struct ethtool_keee *e)
 {
 	struct ksz_device *dev = ds->priv;
-	int ret;
-
-	ret = ksz_validate_eee(ds, port);
-	if (ret)
-		return ret;
 
 	if (!e->tx_lpi_enabled) {
 		dev_err(dev->dev, "Disabling EEE Tx LPI is not supported\n");
@@ -4651,6 +4640,7 @@ static const struct dsa_switch_ops ksz_switch_ops = {
 	.cls_flower_add		= ksz_cls_flower_add,
 	.cls_flower_del		= ksz_cls_flower_del,
 	.port_setup_tc		= ksz_setup_tc,
+	.support_eee		= ksz_support_eee,
 	.get_mac_eee		= ksz_get_mac_eee,
 	.set_mac_eee		= ksz_set_mac_eee,
 	.port_get_default_prio	= ksz_port_get_default_prio,
-- 
2.30.2


