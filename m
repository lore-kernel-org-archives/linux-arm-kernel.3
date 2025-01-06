Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25250E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFr9aVqtLCB1+vJB287VPT2vK1AUEy2cORlV5lLd8nU=; b=aiRWiF0c4ShBQCedZbBZellJ0s
	2GzFtbiajTWM2Ar4KbihiUZzsM41vgyQuPBjqTeEEAM4zkyn8CrEvnImHqQ8Y5mdp1dkzPXpgNX8S
	dWFX9MTv6UPLOy5Lzx6CE8yige/w3Zw8krdmT9Z3Fy7fPhTvkPgADljh/Br7HOi01KYiRu6GSt3Dt
	vnCE/7mlqxcFIo0YjM0jYUi2VqSrWFtFmrvhL4u+obwACf7EiymE1A1X28eMhP1DT6C68gZTszD6+
	8aXKxNxPcQnCzg7m0x93RVbNMHM5qhMt6gcMPrt0+3ryZwgVITUU4pF+BhXHoDW5P8kANVslqCEKy
	OX4MYqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUlov-000000017sl-1bYY;
	Mon, 06 Jan 2025 12:02:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUllX-000000017C5-1g6B;
	Mon, 06 Jan 2025 11:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EFr9aVqtLCB1+vJB287VPT2vK1AUEy2cORlV5lLd8nU=; b=WgrrSjPD74YNdTA8CMHeKfrAxC
	MsDhNcRI10VChUGPh65N6RLbRe9SO19PyZkVZGSz74Iijd5P8vh1azs9qQPYqDL+azErOGvT69NLN
	mKe5RhPXC21f40o7DPCA4KRCXmLnZPc81UV2/7vzMHeASAlSOCagWDT4zTtZBsjZ/1JYWNd4BHlj4
	/nrpA9rNp6Jmo8wyAZBHIoObHl9OjyzX6Dr6+YfihuYeXFQO/vGdK2RiYQ7XuJ0u9RruLn6hS5UoY
	ypfD7AJ0ZbR8kHgxi007J3mQGI2HetLxTDsvz2Vp7vsW2AYCh8g6BsY9fzO68Lh8sMO6ErxcJeIDY
	5Mi8qn+A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37120 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUllN-0005ll-1x;
	Mon, 06 Jan 2025 11:59:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUllK-007Uz9-D7; Mon, 06 Jan 2025 11:59:14 +0000
In-Reply-To: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
References: <Z3vDwwsHSxH5D6Pm@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 7/9] net: dsa: mv88e6xxx: remove
 mv88e6xxx_get_mac_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUllK-007Uz9-D7@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 11:59:14 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_035927_436359_ACC8BABC 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

mv88e6xxx_get_mac_eee() is no longer called by the core DSA code.
Remove it.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 570c8642d387..35ae084af166 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1513,13 +1513,6 @@ static void mv88e6xxx_get_regs(struct dsa_switch *ds, int port,
 	mv88e6xxx_reg_unlock(chip);
 }
 
-static int mv88e6xxx_get_mac_eee(struct dsa_switch *ds, int port,
-				 struct ethtool_keee *e)
-{
-	/* Nothing to do on the port's MAC */
-	return 0;
-}
-
 static int mv88e6xxx_set_mac_eee(struct dsa_switch *ds, int port,
 				 struct ethtool_keee *e)
 {
@@ -7100,7 +7093,6 @@ static const struct dsa_switch_ops mv88e6xxx_switch_ops = {
 	.port_max_mtu		= mv88e6xxx_get_max_mtu,
 	.port_change_mtu	= mv88e6xxx_change_mtu,
 	.support_eee		= dsa_supports_eee,
-	.get_mac_eee		= mv88e6xxx_get_mac_eee,
 	.set_mac_eee		= mv88e6xxx_set_mac_eee,
 	.get_eeprom_len		= mv88e6xxx_get_eeprom_len,
 	.get_eeprom		= mv88e6xxx_get_eeprom,
-- 
2.30.2


