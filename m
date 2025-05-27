Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63025C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=euunGcq8DLOCyDVehWYbTzO5oaA5fjNxY0RezzYXP/w=; b=k1/gs1f/0M9XbpNOfUZdco3qDj
	G0OdZ0pC8ReIifEpwjjxe05E8pvKKnq9WEDxZoSKFO0aXvyaRpTmZ98aqTidLfKR7sHi3RojQV3PN
	Y45a+e0KxhnuL41jZQIQlCRXhc/BRh8hgSUnVK/gIwSVUKBrcANIvEVVAruIQjEL00dDM1PAlcjgk
	pG7/aSr/NRx2M8mLOmVD0u1VIprw6cl8OQDLlSJARcIsznL3hzR7PJ36VRl+JUcqkry78MVq2XfYn
	7xTLJdvG5+Rrhq1VVKPZC2BfJo61yKmXmwBk+BkTGgTdAzN3lGe9HwEJb2N3YF9gZ8hqAWU4Nw4d+
	Rr4r1+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsxT-0000000AdNj-3GGJ;
	Tue, 27 May 2025 11:59:03 +0000
Received: from smtp-bc0a.mail.infomaniak.ch ([45.157.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsvJ-0000000Aczn-21fB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 11:56:52 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4b6B1p536tzjYD;
	Tue, 27 May 2025 13:56:46 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4b6B1m5HnLzfFg;
	Tue, 27 May 2025 13:56:44 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 27 May 2025 13:56:23 +0200
Subject: [PATCH net v2] net: stmmac: platform: guarantee uniqueness of
 bus_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-stmmac-mdio-bus_id-v2-1-a5ca78454e3c@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGaoNWgC/32NQQ6CMBBFr0Jm7RimlSCuvIchprSDnUXBtJVIC
 He34QAu3//572+QOAonuFUbRF4kyTwVUKcKrDfTi1FcYVC1aupGEaYcgrEYnMw4fNJTHGrSQ3u
 xbdtpDWX4jjzK95A+YOIMfQm9pDzH9Tha6Kj+ORdCwo6uRluiYVT2bj3HuJ4dQ7/v+w+TF1Rru
 QAAAA==
X-Change-ID: 20250521-stmmac-mdio-bus_id-313b74c77933
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_045649_669263_29FA599F 
X-CRM114-Status: GOOD (  18.53  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

bus_id is currently derived from the ethernetX alias. If one is missing
for the device, 0 is used. If ethernet0 points to another stmmac device
or if there are 2+ stmmac devices without an ethernet alias, then bus_id
will be 0 for all of those.

This is an issue because the bus_id is used to generate the mdio bus id
(new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
stmmac_mdio_register) and this needs to be unique.

This allows to avoid needing to define ethernet aliases for devices with
multiple stmmac controllers (such as the Rockchip RK3588) for multiple
stmmac devices to probe properly.

Obviously, the bus_id isn't guaranteed to be stable across reboots if no
alias is set for the device but that is easily fixed by simply adding an
alias if this is desired.

Fixes: 25c83b5c2e82 ("dt:net:stmmac: Add support to dwmac version 3.610 and 3.710")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Unsure if I should cc stable since people who encountered that issue for
sure had to add an ethernet alias to make things work with their DT so
shouldn't be too much of an actual issue?

Based on Paolo's feedback, have a Fixes tag regardless of the answer to
the above question.
---
Changes in v2:
- added Fixes tag,
- Link to v1: https://lore.kernel.org/r/20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b87a3783c91b2ffbf5807a27df303f..15205a47cafc276442c3759a36d115d8da1fe51d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -430,6 +430,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	struct device_node *np = pdev->dev.of_node;
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_dma_cfg *dma_cfg;
+	static int bus_id = -ENODEV;
 	int phy_mode;
 	void *ret;
 	int rc;
@@ -465,8 +466,14 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	of_property_read_u32(np, "max-speed", &plat->max_speed);
 
 	plat->bus_id = of_alias_get_id(np, "ethernet");
-	if (plat->bus_id < 0)
-		plat->bus_id = 0;
+	if (plat->bus_id < 0) {
+		if (bus_id < 0)
+			bus_id = of_alias_get_highest_id("ethernet");
+		/* No ethernet alias found, init at -1 so first bus_id is 0 */
+		if (bus_id < 0)
+			bus_id = -1;
+		plat->bus_id = ++bus_id;
+	}
 
 	/* Default to phy auto-detection */
 	plat->phy_addr = -1;

---
base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
change-id: 20250521-stmmac-mdio-bus_id-313b74c77933

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


