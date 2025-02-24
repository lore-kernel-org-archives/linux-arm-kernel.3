Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69BFC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lFkGKBdD4VnLbkUc7/FGnM7MAk1XYFqyTPVczEm7gA=; b=QtP8MK1BlUosiC5bDQixT7IUtS
	W49SO/mYVvwK+RNkECWAiMgsm5dCg9+bu0e9h6iGcH/25IoHeJgadHXEPZtUqxkw/86tZX84Bk1XA
	QQ5VqBIbT2w0zWmeS8pXl/DbutcJfcDEbxyVN2T/Di4viWLZjIP8TXUlQmSvxu0NfYLsx+g0olhD/
	py2YAcC8dfg10lmIdW0ebHlwWf91NL4Mk7ZGQPMhAbrrqqcCfcUa0pNpPv0BzqjfkRb2dYUSXoN/7
	mL3w3kwybVlojy9P5SNa11fReIjUY8lbGwKve95pfP9PcHAZz6u1xqB7Qi3UZwmORyerzJliper7n
	r1xdy/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWyp-0000000DW4d-0y2D;
	Mon, 24 Feb 2025 11:50:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWbF-0000000DMw9-0W45;
	Mon, 24 Feb 2025 11:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EEFC611A0;
	Mon, 24 Feb 2025 11:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF00FC4CED6;
	Mon, 24 Feb 2025 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740396372;
	bh=6eARzEIBu/2jwh2Kma2quUm3GdINk7WMypY4fV3bDNc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gjR7MSXvBEiGyb+gAXma0LHpTsP4RvkHVg4UjG0lcpPzPzL24nWuvKnKcM98RAdEq
	 ICNjkcvPkZwbt5cuIG2r8tA3kPNed1r6YSC1xmpmfMaRCade1intEWtxt4LzQqmPdZ
	 jTafOblqQNXXyXpHNkAj4j1NaSWjOHiBwmZwR0n+EfdgEA0w5zYzyEDhz/WSjQwCyM
	 YbyuGBoAqalDoTFmlxdZNvsdHo0AQEfU2i6wIhwGQTyLrqEdjwgU4sNONRnJGwbiTC
	 GEzjjSN+tQ1nzGZI/xbgZGqsjNH1p8Q0AUFSAV6VUHOmUNkLJ2zdN1WL3JQFPuQtKP
	 3Ikd9njlRThRg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 24 Feb 2025 12:25:29 +0100
Subject: [PATCH net-next v7 09/15] net: airoha: Rename
 airoha_set_gdm_port_fwd_cfg() in airoha_set_vip_for_gdm_port()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-airoha-en7581-flowtable-offload-v7-9-b4a22ad8364e@kernel.org>
References: <20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org>
In-Reply-To: <20250224-airoha-en7581-flowtable-offload-v7-0-b4a22ad8364e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
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

Rename airoha_set_gdm_port() in airoha_set_vip_for_gdm_port().
Get rid of airoha_set_gdm_ports routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 49 +++++++-------------------------
 drivers/net/ethernet/airoha/airoha_eth.h |  8 ------
 2 files changed, 11 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 0aead5e9a3f53104a5093e252d2fda7c399d6672..8564323f57fbdbd6e27714841cbcb2b0022aea94 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -105,25 +105,23 @@ static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
 		      FIELD_PREP(GDM_UCFQ_MASK, val));
 }
 
-static int airoha_set_gdm_port(struct airoha_eth *eth, int port, bool enable)
+static int airoha_set_vip_for_gdm_port(struct airoha_gdm_port *port,
+				       bool enable)
 {
+	struct airoha_eth *eth = port->qdma->eth;
 	u32 vip_port;
 
-	switch (port) {
-	case XSI_PCIE0_PORT:
+	switch (port->id) {
+	case 3:
+		/* FIXME: handle XSI_PCIE1_PORT */
 		vip_port = XSI_PCIE0_VIP_PORT_MASK;
 		break;
-	case XSI_PCIE1_PORT:
-		vip_port = XSI_PCIE1_VIP_PORT_MASK;
-		break;
-	case XSI_USB_PORT:
-		vip_port = XSI_USB_VIP_PORT_MASK;
-		break;
-	case XSI_ETH_PORT:
+	case 4:
+		/* FIXME: handle XSI_USB_PORT */
 		vip_port = XSI_ETH_VIP_PORT_MASK;
 		break;
 	default:
-		return -EINVAL;
+		return 0;
 	}
 
 	if (enable) {
@@ -137,31 +135,6 @@ static int airoha_set_gdm_port(struct airoha_eth *eth, int port, bool enable)
 	return 0;
 }
 
-static int airoha_set_gdm_ports(struct airoha_eth *eth, bool enable)
-{
-	const int port_list[] = {
-		XSI_PCIE0_PORT,
-		XSI_PCIE1_PORT,
-		XSI_USB_PORT,
-		XSI_ETH_PORT
-	};
-	int i, err;
-
-	for (i = 0; i < ARRAY_SIZE(port_list); i++) {
-		err = airoha_set_gdm_port(eth, port_list[i], enable);
-		if (err)
-			goto error;
-	}
-
-	return 0;
-
-error:
-	for (i--; i >= 0; i--)
-		airoha_set_gdm_port(eth, port_list[i], false);
-
-	return err;
-}
-
 static void airoha_fe_maccr_init(struct airoha_eth *eth)
 {
 	int p;
@@ -1539,7 +1512,7 @@ static int airoha_dev_open(struct net_device *dev)
 	int err;
 
 	netif_tx_start_all_queues(dev);
-	err = airoha_set_gdm_ports(qdma->eth, true);
+	err = airoha_set_vip_for_gdm_port(port, true);
 	if (err)
 		return err;
 
@@ -1565,7 +1538,7 @@ static int airoha_dev_stop(struct net_device *dev)
 	int i, err;
 
 	netif_tx_disable(dev);
-	err = airoha_set_gdm_ports(qdma->eth, false);
+	err = airoha_set_vip_for_gdm_port(port, false);
 	if (err)
 		return err;
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 74bdfd9e8d2fb3706f5ec6a4e17fe07fbcb38c3d..44834227a58982d4491f3d8174b9e0bea542f785 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -57,14 +57,6 @@ enum {
 	QDMA_INT_REG_MAX
 };
 
-enum {
-	XSI_PCIE0_PORT,
-	XSI_PCIE1_PORT,
-	XSI_USB_PORT,
-	XSI_AE_PORT,
-	XSI_ETH_PORT,
-};
-
 enum {
 	XSI_PCIE0_VIP_PORT_MASK	= BIT(22),
 	XSI_PCIE1_VIP_PORT_MASK	= BIT(23),

-- 
2.48.1


