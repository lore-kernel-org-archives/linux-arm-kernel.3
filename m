Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25212C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNs3c2BQgGrBERjspHFTVGdZ3eL3oKIO9/koiy0uNcM=; b=xGRQN2UUOMuD6FZkSkqyLpxfOh
	9tCTyiMra2NBSiB/QWlRuShnERlOSont3vy0Rknr4Zcbcys1aWsKypctHUZRfimS/ulvaT+zkWPm9
	4zR1M2nzz7XAiZuTniatEIoKemy5upr/3pPSvVhRBcZMPubLLd62lvn9qrAhh1dTUkMUaNmEcyK6A
	n+VK4ntxUjkUQvyxGSOXKr0YTUYzzMjJR9/Dzxk12UUzXFDHw4EFKPASQRNb+VKxJO0EHCLZI2Uvz
	GNwfgC3CQq/brDSZw2qrWTg7eT32iEgVuWgRqRb3sZ3wNwn8HziKV2XL4z0HW7ntHn0IhHLfZGKq/
	q0baYm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkEL-00000004HRU-1uZx;
	Wed, 05 Feb 2025 18:34:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk2c-00000004EcI-45Nd;
	Wed, 05 Feb 2025 18:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PNs3c2BQgGrBERjspHFTVGdZ3eL3oKIO9/koiy0uNcM=; b=qQ9i55hcg8N1fM9h24foio3SL5
	7cW11Vh6g1EqngvT1NMIPSx73kpalmeMigsGhUpkakpL5CHXfgdF/onsMQmxKccUzjikA2iduZQp4
	xoGIqUqLc5i3MZoVjuZS9th5YqIY8Oi6YjdZdJR/YEs7yQv42byNqfR8223J58vzNBm3wb0+Ft7KX
	Drae4EnkM9TINq1llQJ7fxrX+QyK9mWA1zVlHIauUR9n/C7LGbr+raJQh6r3GMy7yjwnp1fNdRoCy
	mcLk3ebNWgfWB4iV4DcLKHkf/BpQ8xxoYeRYuLhVxELRfmrK0Fy9jfPBA9OV5rQjjZgmvSWIUYvMb
	mpLsBo1Q==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfk2a-0000000Gl9U-0BDb;
	Wed, 05 Feb 2025 18:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90790A43906;
	Wed,  5 Feb 2025 18:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04AFC4CED1;
	Wed,  5 Feb 2025 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738779742;
	bh=WFtXkOHzpsVl/lSmvchFASlqyP6fybupy9T9sIM0y/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jvzI/B4/o3rR664OqP1QZ3awrF+0S2EZAl9U3ziymClJlMINKU/BpIblp4f5UlZoD
	 TTw7lgTd1aam/asxspB7ABtVABVko0WWFCNxOfwvjMBHaPSFy6sjBSUnkLNvUoOMG/
	 ATwq+tW9bOnfl6Lp2eoDCkg2iIMWSus6hEXmiaH0JlB+g8Ict2QvlU9jH1Dr0VSmn1
	 KTVJulY88M1OAmEfZKTHGwKGIiM1meV/g9ae+WFcevtDPfYOCD1yRF0ZQDfFrroW7x
	 lP3W4ZFDyM1zhGzHmP5lqlUofQBf4ujEh3czrQT/nLoLQ2APLaz11vrv8bFlIBqwn7
	 ryZ6tjUSpusIw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 05 Feb 2025 19:21:26 +0100
Subject: [PATCH net-next 07/13] net: airoha: Move REG_GDM_FWD_CFG()
 initialization in airoha_dev_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-airoha-en7581-flowtable-offload-v1-7-d362cfa97b01@kernel.org>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
In-Reply-To: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_182224_360155_DA953D5D 
X-CRM114-Status: GOOD (  10.84  )
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

Move REG_GDM_FWD_CFG() register initialization in airoha_dev_init
routine. Moreover, always send traffic PPE module in order to be
processed by hw accelerator.
This is a preliminary patch to enable netfilter flowtable hw offloading
on EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 42b5e0945fb8738f70d0b77bf597a7a04e5f0716..db75a9b1d5766bfaaa92312d625c395e19c88368 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -107,25 +107,20 @@ static void airoha_set_gdm_port_fwd_cfg(struct airoha_eth *eth, u32 addr,
 
 static int airoha_set_gdm_port(struct airoha_eth *eth, int port, bool enable)
 {
-	u32 val = enable ? FE_PSE_PORT_PPE1 : FE_PSE_PORT_DROP;
-	u32 vip_port, cfg_addr;
+	u32 vip_port;
 
 	switch (port) {
 	case XSI_PCIE0_PORT:
 		vip_port = XSI_PCIE0_VIP_PORT_MASK;
-		cfg_addr = REG_GDM_FWD_CFG(3);
 		break;
 	case XSI_PCIE1_PORT:
 		vip_port = XSI_PCIE1_VIP_PORT_MASK;
-		cfg_addr = REG_GDM_FWD_CFG(3);
 		break;
 	case XSI_USB_PORT:
 		vip_port = XSI_USB_VIP_PORT_MASK;
-		cfg_addr = REG_GDM_FWD_CFG(4);
 		break;
 	case XSI_ETH_PORT:
 		vip_port = XSI_ETH_VIP_PORT_MASK;
-		cfg_addr = REG_GDM_FWD_CFG(4);
 		break;
 	default:
 		return -EINVAL;
@@ -139,8 +134,6 @@ static int airoha_set_gdm_port(struct airoha_eth *eth, int port, bool enable)
 		airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, vip_port);
 	}
 
-	airoha_set_gdm_port_fwd_cfg(eth, cfg_addr, val);
-
 	return 0;
 }
 
@@ -177,8 +170,6 @@ static void airoha_fe_maccr_init(struct airoha_eth *eth)
 		airoha_fe_set(eth, REG_GDM_FWD_CFG(p),
 			      GDM_TCP_CKSUM | GDM_UDP_CKSUM | GDM_IP4_CKSUM |
 			      GDM_DROP_CRC_ERR);
-		airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(p),
-					    FE_PSE_PORT_CDM1);
 		airoha_fe_rmw(eth, REG_GDM_LEN_CFG(p),
 			      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
 			      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
@@ -1614,8 +1605,11 @@ static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
 static int airoha_dev_init(struct net_device *dev)
 {
 	struct airoha_gdm_port *port = netdev_priv(dev);
+	struct airoha_eth *eth = port->qdma->eth;
 
 	airoha_set_macaddr(port, dev->dev_addr);
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(port->id),
+				    FE_PSE_PORT_PPE1);
 
 	return 0;
 }

-- 
2.48.1


