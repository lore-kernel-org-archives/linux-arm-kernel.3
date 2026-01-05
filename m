Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7D0C2A07E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ig/vWXFcUVKiZg1ee3CIlPrClHBBtHZc594yyRiceVU=; b=UB047smmSCKaW4f/L3QPTF4CDA
	WaAbvuufjQEwWroXMv0uGg7D3GC35a4frQGkfTg7ZFKiGPZeKGxu9hsbr1TOZ/7iOTwK+xo91Nv0m
	JuA+gvO4098p0D639gpunMR6uF71Cg9yArhrULurS57p0WYv51q1ngwFmlSizAYEfB+B1B9HwmoxS
	VHLrgflYgiEde/M99YA8m1yzvdBoOffiY6UDqTiC5iFRs5lc7HSKYSQC7JN51xvZPCtfE0q+2A9MX
	4fEw7XkhFgeVEhLcYPFuBx/Gyq/GuU5V34SPRV8V+YA8pc8t+4vrToVjx6iGEIitC/llELFQoa4/7
	61X2meqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vch5I-0000000B4Z1-19Zs;
	Mon, 05 Jan 2026 09:41:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vch5F-0000000B4Yd-1hEk;
	Mon, 05 Jan 2026 09:41:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD26B42A88;
	Mon,  5 Jan 2026 09:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8F1C116D0;
	Mon,  5 Jan 2026 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767606064;
	bh=wlF4+QAOSqPBHkUCKYJlkeu9hVcfkDHErk2D6WLawpk=;
	h=From:Date:Subject:To:Cc:From;
	b=P21RtkAO1j7eYVquFmr318nf8lyAj6ygieaiD2X4FXbXNFHPy5MR+0TcKaum1EG9h
	 mN+663r+TiKiSX7ulbMbqX9Zg9SChdb8+QIo/cOTqtHtdxJ4ehdOKuEQxy0UZW8rko
	 Y19TO+HgeNbjX+zb/V9VATJHaFWUJrusseF6514t++f/8075gA7uiP3p3Hy7mDDvhc
	 +Di3FjEsgRW+4BFD0h1n3iHkiB+hu6oW/nMKFR8+avZyTK1OMdOp3BOpdzNUMNGMP0
	 Ml0OytGjPAtpNlhHwAHHQJ7bdyz4V9BnL+Hz1CT8T5SgNujbVesWnYbdseKz8yHK7A
	 TUWJEOnBZ7dEA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 05 Jan 2026 10:40:47 +0100
Subject: [PATCH net-next] net: airoha: Use gdm port enum value whenever
 possible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-airoha-use-port-idx-enum-v1-1-503ca5763858@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X27EKyVFv6K8VD1KfuoYlsqgjiv
 zd4HIaZkzJMkeldnWTYNWuKBXxd0bCEOIN1LEzipHXeCQe1tATeMnhN9iv6YMTty8NTXv7Ro0E
 QKvlqmPS415/uuv4aVegIagAAAA==
X-Change-ID: 20260102-airoha-use-port-idx-enum-c72814be5ea2
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_014105_490217_49A5C3A5 
X-CRM114-Status: GOOD (  10.87  )
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

Use AIROHA_GDMx_IDX enum value whenever possible.
This patch is just cosmetic changes and does not introduce any logic one.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 40 +++++++++++++++++---------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 315d97036ac1d611cc786020cbf2c6df810995a9..724904d08febdd88c1145da7531f012755412ec4 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -108,11 +108,11 @@ static int airoha_set_vip_for_gdm_port(struct airoha_gdm_port *port,
 	u32 vip_port;
 
 	switch (port->id) {
-	case 3:
+	case AIROHA_GDM3_IDX:
 		/* FIXME: handle XSI_PCIE1_PORT */
 		vip_port = XSI_PCIE0_VIP_PORT_MASK;
 		break;
-	case 4:
+	case AIROHA_GDM4_IDX:
 		/* FIXME: handle XSI_USB_PORT */
 		vip_port = XSI_ETH_VIP_PORT_MASK;
 		break;
@@ -514,8 +514,8 @@ static int airoha_fe_init(struct airoha_eth *eth)
 		      FIELD_PREP(IP_ASSEMBLE_PORT_MASK, 0) |
 		      FIELD_PREP(IP_ASSEMBLE_NBQ_MASK, 22));
 
-	airoha_fe_set(eth, REG_GDM_FWD_CFG(3), GDM_PAD_EN_MASK);
-	airoha_fe_set(eth, REG_GDM_FWD_CFG(4), GDM_PAD_EN_MASK);
+	airoha_fe_set(eth, REG_GDM_FWD_CFG(AIROHA_GDM3_IDX), GDM_PAD_EN_MASK);
+	airoha_fe_set(eth, REG_GDM_FWD_CFG(AIROHA_GDM4_IDX), GDM_PAD_EN_MASK);
 
 	airoha_fe_crsn_qsel_init(eth);
 
@@ -1690,27 +1690,29 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	/* Forward the traffic to the proper GDM port */
 	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
 					       : FE_PSE_PORT_GDM4;
-	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(2), pse_port);
-	airoha_fe_clear(eth, REG_GDM_FWD_CFG(2), GDM_STRIP_CRC_MASK);
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
+				    pse_port);
+	airoha_fe_clear(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
+			GDM_STRIP_CRC_MASK);
 
 	/* Enable GDM2 loopback */
-	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(2), 0xffffffff);
-	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
+	airoha_fe_wr(eth, REG_GDM_TXCHN_EN(AIROHA_GDM2_IDX), 0xffffffff);
+	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(AIROHA_GDM2_IDX), 0xffff);
 
 	chan = port->id == AIROHA_GDM3_IDX ? airoha_is_7581(eth) ? 4 : 3 : 0;
-	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
+	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(AIROHA_GDM2_IDX),
 		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
 		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
 		      LBK_GAP_MODE_MASK | LBK_LEN_MODE_MASK |
 		      LBK_CHAN_MODE_MASK | LPBK_EN_MASK);
-	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(2),
+	airoha_fe_rmw(eth, REG_GDM_LEN_CFG(AIROHA_GDM2_IDX),
 		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
 		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
 		      FIELD_PREP(GDM_LONG_LEN_MASK, AIROHA_MAX_MTU));
 
 	/* Disable VIP and IFC for GDM2 */
-	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(2));
-	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(2));
+	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
+	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
 	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
 	nbq = port->id == AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
@@ -1746,8 +1748,8 @@ static int airoha_dev_init(struct net_device *dev)
 	airoha_set_macaddr(port, dev->dev_addr);
 
 	switch (port->id) {
-	case 3:
-	case 4:
+	case AIROHA_GDM3_IDX:
+	case AIROHA_GDM4_IDX:
 		/* If GDM2 is active we can't enable loopback */
 		if (!eth->ports[1]) {
 			int err;
@@ -1757,7 +1759,7 @@ static int airoha_dev_init(struct net_device *dev)
 				return err;
 		}
 		fallthrough;
-	case 2:
+	case AIROHA_GDM2_IDX:
 		if (airoha_ppe_is_enabled(eth, 1)) {
 			/* For PPE2 always use secondary cpu port. */
 			fe_cpu_port = FE_PSE_PORT_CDM2;
@@ -3101,14 +3103,14 @@ static const char * const en7581_xsi_rsts_names[] = {
 static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
-	case 3:
+	case AIROHA_GDM3_IDX:
 		/* 7581 SoC supports PCIe serdes on GDM3 port */
 		if (nbq == 4)
 			return HSGMII_LAN_7581_PCIE0_SRCPORT;
 		if (nbq == 5)
 			return HSGMII_LAN_7581_PCIE1_SRCPORT;
 		break;
-	case 4:
+	case AIROHA_GDM4_IDX:
 		/* 7581 SoC supports eth and usb serdes on GDM4 port */
 		if (!nbq)
 			return HSGMII_LAN_7581_ETH_SRCPORT;
@@ -3132,12 +3134,12 @@ static const char * const an7583_xsi_rsts_names[] = {
 static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
-	case 3:
+	case AIROHA_GDM3_IDX:
 		/* 7583 SoC supports eth serdes on GDM3 port */
 		if (!nbq)
 			return HSGMII_LAN_7583_ETH_SRCPORT;
 		break;
-	case 4:
+	case AIROHA_GDM4_IDX:
 		/* 7583 SoC supports PCIe and USB serdes on GDM4 port */
 		if (!nbq)
 			return HSGMII_LAN_7583_PCIE_SRCPORT;

---
base-commit: c303e8b86d9dbd6868f5216272973292f7f3b7f1
change-id: 20260102-airoha-use-port-idx-enum-c72814be5ea2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


