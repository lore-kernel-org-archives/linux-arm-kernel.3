Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90FFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEOZUQBAeR0NI122BFz/mJHucRqEfhdt0VkEFkj2sW4=; b=JkThjx6x8Y8pumdO6KrqTSGL//
	kTpCxCtH+FvEoTT147AJh4ahW5u/Fv/oE4JtYyE4hngtFVFL4AM38sxJkVt1atFHDuLW6adRbvJAs
	Ab/HPtKj6ne0dT2K376ivl5nLmi7o780bVoGmJzQEKUudwbqzqIq3VjAi59cIXTeiu2TqnT5mk+Tj
	5z61Ug59JX269suUh1iC0aejI0wzT8rKhlILYviTJqmrzwsai4K0EyM7lrvJ235MDuM6veoaCNGEy
	F4qUnfXu3ZBK7mHgfImboFMjgA+RGUlbIcwwXsrjILLU7D1fpBm/rUo0iDw3wuRIXSeobp3hNPUjp
	9TpzFZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibUI-0000000Bcjq-2kM7;
	Thu, 13 Feb 2025 15:50:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibFD-0000000BYmI-0PYE;
	Thu, 13 Feb 2025 15:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F028CA426CC;
	Thu, 13 Feb 2025 15:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C4CC4CEE4;
	Thu, 13 Feb 2025 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739460914;
	bh=bKwaKtekWr7M03OSmAw2n+nPB23T8n8mEzDPoJBQF1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=drPUIfterHYFy2CUS2NwRH6wSpehP65E7TD8Y+Gcg6m6a7foSPm4E1tAY0H7x0IsW
	 /mQ+jFEwkin3FzegoyMH/dpBN+zzr2ZYftEJ51nbshQR4CyyKuErpcP/OL5/3bXVTE
	 UbrwrkUJ0P5D84xDvrNTp/1nmRj7kr1NyfAIFg0Ip4XJUIho0zfeUOzckwcYQHB4q8
	 H2GLwVJ5ErtQWsgCXwVFoJ7eqX80NKkwxOCyChEt8K0Usw1BMFA9/zIwHXrFwd0FTJ
	 5DquaKeC/B07naQB9QSMD+Zjkqf7oFNobvN+9TCwGtoijEkeckJQroyGeqTok6zmiT
	 gnj8Nrm1vJt0A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 13 Feb 2025 16:34:29 +0100
Subject: [PATCH net-next v4 10/16] net: airoha: Rename
 airoha_set_gdm_port_fwd_cfg() in airoha_set_vip_for_gdm_port()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-airoha-en7581-flowtable-offload-v4-10-b69ca16d74db@kernel.org>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
In-Reply-To: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_073515_264605_34273F3B 
X-CRM114-Status: GOOD (  13.81  )
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
index 6c899358c086e6eb1de3ed25f625e48db129888f..31e5f0368faa13a120ba01f7413cf5c23761c143 100644
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


