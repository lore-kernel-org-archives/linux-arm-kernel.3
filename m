Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B31F3ED7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 07:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q3WJNJGLuSLaMvFnrxZS6/2EtwZKMV4qjvCrPjl3n5I=; b=18dUIDPKi9OU7SWhua0V9rLgJO
	sVMDiIv/L9YYK6Opw6l5dLujnZwYNTGsoVnl15OfnGbomC5hrLxljCjHYaZCZkeX/iUtvwDIX+8Wl
	MMGX49DRNKbHVFtb8x13/z+VvoBsEAZvZrFdFtM1AFDppSwodN1cTArHa571pZYrR3KhgwLH2quVl
	cV3d7/Q+BzvggvGYSMePw2TlIkDfmajWz2lYLJIalLQlCgNEIHWlqSN6rhaxy1SCK5XfurcirDuo+
	7tW646VQHY8GJ1Gn7LkgAiwJDV31XsMfNTPBAKmHlz/Z7ZHp+bdEd1IUwf7z5dWSQCfsX90NNmNbx
	CY33MNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBphZ-0000000E8Or-3pJm;
	Sun, 12 Apr 2026 07:57:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBphY-0000000E8OT-0nsy;
	Sun, 12 Apr 2026 07:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76BA4439AE;
	Sun, 12 Apr 2026 07:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2214C19424;
	Sun, 12 Apr 2026 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775980670;
	bh=hEB/WlU+PuCaCCF9GLECeF0sJYz4vRrr9X6SysrwYrs=;
	h=From:Date:Subject:To:Cc:From;
	b=beWUfbwZJ/aZnitlU+tGPf3EwUUaWXXHhsD/6HTlEdiVAwMquibjyqFWH8ncjwEVx
	 tYreXdA6/ewOATjJKNItuVp+o/Yujw5uPPhjeY3LUsUBspEc2GLTS4Y49YYhegOcUp
	 ypp1aSdOLFxBD4PtSgDzK6IAHDQDLbR8Rq6W+Ch+pMcA/VrBipeeFOiLmakXa3r/KA
	 /9cNsQX4Y02vKQ+MnoomVLri3CJtmcmLfJUaUNOYecAG9qSSDQl1hkkJT2dt/yS7qL
	 sdFNpjQvf+se7slrz+R7NGL82tgpPEIfwlRE8Ae8FWs4y+0Eu6AcSSiFYZKtRQmVuC
	 JXazpXgmiRD3w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 09:57:29 +0200
Subject: [PATCH net] net: airoha: Fix VIP configuration for AN7583 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha-7583-vip-fix-v1-1-c35e02b054bb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqAIBAAfyX23IJZ2uNXooPZVntR0Ygg/Pek4
 wzMvJAoMiWYqhci3ZzYuwJNXYE9jTsIeSsMUkgtukai4ehPg70aWrw54M4PKqH0Olrd78JAKUO
 kov/rDI4uWHL+ALnhc0VqAAAA
X-Change-ID: 20260412-airoha-7583-vip-fix-5056b9c67f0a
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_005752_278513_4E149CD8 
X-CRM114-Status: GOOD (  14.61  )
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

EN7581 and AN7583 SoCs have different VIP definitions. Introduce
get_vip_port callback in airoha_eth_soc_data struct in order to take
into account EN7581 and AN7583 VIP register layout and definition
differences.
Introduce nbq parameter in airoha_gdm_port struct. At the moment nbq
is set statically to value previously used in airhoha_set_gdm2_loopback
routine and it will be read from device tree in subsequent patches.

Fixes: e4e5ce823bdd ("net: airoha: Add AN7583 SoC support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 66 ++++++++++++++++++++++++--------
 drivers/net/ethernet/airoha/airoha_eth.h |  2 +
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c14cdce588a7..b64667722d7f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -107,19 +107,7 @@ static int airoha_set_vip_for_gdm_port(struct airoha_gdm_port *port,
 	struct airoha_eth *eth = port->qdma->eth;
 	u32 vip_port;
 
-	switch (port->id) {
-	case AIROHA_GDM3_IDX:
-		/* FIXME: handle XSI_PCIE1_PORT */
-		vip_port = XSI_PCIE0_VIP_PORT_MASK;
-		break;
-	case AIROHA_GDM4_IDX:
-		/* FIXME: handle XSI_USB_PORT */
-		vip_port = XSI_ETH_VIP_PORT_MASK;
-		break;
-	default:
-		return 0;
-	}
-
+	vip_port = eth->soc->ops.get_vip_port(port, port->nbq);
 	if (enable) {
 		airoha_fe_set(eth, REG_FE_VIP_PORT_EN, vip_port);
 		airoha_fe_set(eth, REG_FE_IFC_PORT_EN, vip_port);
@@ -1705,7 +1693,7 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 {
 	struct airoha_eth *eth = port->qdma->eth;
-	u32 val, pse_port, chan, nbq;
+	u32 val, pse_port, chan;
 	int src_port;
 
 	/* Forward the traffic to the proper GDM port */
@@ -1735,9 +1723,7 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
-	/* XXX: handle XSI_USB_PORT and XSI_PCE1_PORT */
-	nbq = port->id == AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
-	src_port = eth->soc->ops.get_src_port_id(port, nbq);
+	src_port = eth->soc->ops.get_src_port_id(port, port->nbq);
 	if (src_port < 0)
 		return src_port;
 
@@ -2946,6 +2932,8 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	port->qdma = qdma;
 	port->dev = dev;
 	port->id = id;
+	/* XXX: Read nbq from DTS */
+	port->nbq = id == AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
 	eth->ports[p] = port;
 
 	return airoha_metadata_dst_alloc(port);
@@ -3147,6 +3135,28 @@ static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
 	return -EINVAL;
 }
 
+static u32 airoha_en7581_get_vip_port(struct airoha_gdm_port *port, int nbq)
+{
+	switch (port->id) {
+	case AIROHA_GDM3_IDX:
+		if (nbq == 4)
+			return XSI_PCIE0_VIP_PORT_MASK;
+		if (nbq == 5)
+			return XSI_PCIE1_VIP_PORT_MASK;
+		break;
+	case AIROHA_GDM4_IDX:
+		if (!nbq)
+			return XSI_ETH_VIP_PORT_MASK;
+		if (nbq == 1)
+			return XSI_USB_VIP_PORT_MASK;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const char * const an7583_xsi_rsts_names[] = {
 	"xsi-mac",
 	"hsi0-mac",
@@ -3176,6 +3186,26 @@ static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
 	return -EINVAL;
 }
 
+static u32 airoha_an7583_get_vip_port(struct airoha_gdm_port *port, int nbq)
+{
+	switch (port->id) {
+	case AIROHA_GDM3_IDX:
+		if (!nbq)
+			return XSI_ETH_VIP_PORT_MASK;
+		break;
+	case AIROHA_GDM4_IDX:
+		if (!nbq)
+			return XSI_PCIE0_VIP_PORT_MASK;
+		if (nbq == 1)
+			return XSI_USB_VIP_PORT_MASK;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct airoha_eth_soc_data en7581_soc_data = {
 	.version = 0x7581,
 	.xsi_rsts_names = en7581_xsi_rsts_names,
@@ -3183,6 +3213,7 @@ static const struct airoha_eth_soc_data en7581_soc_data = {
 	.num_ppe = 2,
 	.ops = {
 		.get_src_port_id = airoha_en7581_get_src_port_id,
+		.get_vip_port = airoha_en7581_get_vip_port,
 	},
 };
 
@@ -3193,6 +3224,7 @@ static const struct airoha_eth_soc_data an7583_soc_data = {
 	.num_ppe = 1,
 	.ops = {
 		.get_src_port_id = airoha_an7583_get_src_port_id,
+		.get_vip_port = airoha_an7583_get_vip_port,
 	},
 };
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index a97903569335..8bcd809e6f53 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -536,6 +536,7 @@ struct airoha_gdm_port {
 	struct airoha_qdma *qdma;
 	struct net_device *dev;
 	int id;
+	int nbq;
 
 	struct airoha_hw_stats stats;
 
@@ -576,6 +577,7 @@ struct airoha_eth_soc_data {
 	int num_ppe;
 	struct {
 		int (*get_src_port_id)(struct airoha_gdm_port *port, int nbq);
+		u32 (*get_vip_port)(struct airoha_gdm_port *port, int nbq);
 	} ops;
 };
 

---
base-commit: 02f72964395911e7a09bb2ea2fe6f79eda4ea2c2
change-id: 20260412-airoha-7583-vip-fix-5056b9c67f0a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


