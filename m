Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC168FF495F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+00/N6Iiq7zZCTpW1IjHPEIzUsAR2uRW3G67NeHYZw4=; b=vHotJv1aC7dsF3nQ4ZU2h2n3UG
	aoNVNLhqoEZxJ2PTbf4J68WniZU2r3dglyuueKs1a6SIn46tu7mShG87afIyTZPn3dyUsCi1MAYda
	J0IRUbknZPy9ve3qrMwuLNYRs2WJMLT7R4pPnQJ33mGDdar2sFVOw3Wd6fkU+hvuEpLBU1LKKB/l2
	ye8iebaB3+Q/OEi3BxqO3ZNWbtXPbumkW7RFw5wnlGA1clbUnPuIqQFRf5QWZZb2+qmEL3QkfhYQg
	9qHJO4y8S/MDaurT/GJSmPpgmM4sc69RUNxoyq+h7R3oy0i4mFVgPoBIjFZPelLCWe/57OAddI1Tk
	tKxBN5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77nt-0000000Apr5-3qA1;
	Mon, 30 Mar 2026 08:16:59 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77nq-0000000Apq5-2CdZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:16:56 +0000
Received: from ubuntu.. (unknown [202.112.113.208])
	by APP-05 (Coremail) with SMTP id zQCowAAntwplMcppbLvrCw--.46728S2;
	Mon, 30 Mar 2026 16:16:46 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] net: lpc_eth: Fix a possible memory leak in lpc_mii_probe()
Date: Mon, 30 Mar 2026 16:16:36 +0800
Message-ID: <20260330081636.2887980-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAntwplMcppbLvrCw--.46728S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWUAw1DXr4rZF47Jw1fZwb_yoW8ZF4xp3
	y3CFWfGFykGr17Wwn5ZayDAFyayw4Iy3yrKFW2ya90g3WrXryrA340y34aqr45CFWkWF47
	XrnIyFy7Za1kXF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [202.112.113.208]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_011654_948120_868CE838 
X-CRM114-Status: GOOD (  11.88  )
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

lpc_mii_probe() calls of_phy_find_device() to obtain a phy_device
pointer. of_phy_find_device() increments the refcount of the device.
The current implementation does not decrement the refcount after using
the pointer, which leads to a memory leak.

Add phy_device_free() to balance the refcount.

Found by code review.

Signed-off-by: Ma Ke <make24@iscas.ac.cn>
Cc: stable@vger.kernel.org
Fixes: 3503bf024b3e ("net: lpc_eth: parse phy nodes from device tree")
---
 drivers/net/ethernet/nxp/lpc_eth.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
index 8b9a3e3bba30..8ce7c9bb6dd6 100644
--- a/drivers/net/ethernet/nxp/lpc_eth.c
+++ b/drivers/net/ethernet/nxp/lpc_eth.c
@@ -751,7 +751,7 @@ static void lpc_handle_link_change(struct net_device *ndev)
 static int lpc_mii_probe(struct net_device *ndev)
 {
 	struct netdata_local *pldat = netdev_priv(ndev);
-	struct phy_device *phydev;
+	struct phy_device *phydev, *phydev_tmp;
 
 	/* Attach to the PHY */
 	if (lpc_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_MII)
@@ -760,17 +760,18 @@ static int lpc_mii_probe(struct net_device *ndev)
 		netdev_info(ndev, "using RMII interface\n");
 
 	if (pldat->phy_node)
-		phydev =  of_phy_find_device(pldat->phy_node);
+		phydev_tmp =  of_phy_find_device(pldat->phy_node);
 	else
-		phydev = phy_find_first(pldat->mii_bus);
-	if (!phydev) {
+		phydev_tmp = phy_find_first(pldat->mii_bus);
+	if (!phydev_tmp) {
 		netdev_err(ndev, "no PHY found\n");
 		return -ENODEV;
 	}
 
-	phydev = phy_connect(ndev, phydev_name(phydev),
+	phydev = phy_connect(ndev, phydev_name(phydev_tmp),
 			     &lpc_handle_link_change,
 			     lpc_phy_interface_mode(&pldat->pdev->dev));
+	phy_device_free(phydev_tmp);
 	if (IS_ERR(phydev)) {
 		netdev_err(ndev, "Could not attach to PHY\n");
 		return PTR_ERR(phydev);
-- 
2.43.0


