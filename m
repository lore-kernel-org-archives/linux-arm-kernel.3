Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAA8D3514C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJr+zxNTkFsfx9o5k7+T8EmJp6F15JaM8Pg5SgXjJzQ=; b=A3DKxgdDTQvr4CT3jCX8d/+1ZE
	6HWSSx+ERLR1Px4jvqSpfWm/Axdqo0GU7OspOWmVaty/6WgQVgyeD3gjkySjlQhD5ZUQjx1ImGKKx
	feSsRZyyoByQX286d9jNXwB9muDVzyaoghmDXbPDhfkBNDtlpF9iewA71NMRH+CYmJKvTCEbRMOtB
	6esNXA8CksbQJ3Cp+q81+wXtRXm6y+OUb8FmpLJGzm8YYbb5l5uGZ/7jRVcTTGGLjnYgxtVY2vjl5
	BpzGgLPiI50n8BNnFdxe6mI7nEMFBgPUPzaXx9lg0i9AuT5V+y2nPk5p8qXId6RqssTi8L8JRpEHR
	usBqP4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pZO-0000000E9d2-01JH;
	Wed, 01 Apr 2026 07:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pYt-0000000E9De-3Lam;
	Wed, 01 Apr 2026 07:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 081E64024A;
	Wed,  1 Apr 2026 07:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F828C2BCB8;
	Wed,  1 Apr 2026 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026822;
	bh=d7jwV4NmIZslEsfJD4wLprgivI7Ue+FGu8WLJId/xuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yxqp49XIIBlLWIlyM6vtMYIkqdZ5+Z7G+vBKWwqp16/Eo6fdCpXGI056CfvZa9FD0
	 rh6/YjPlsHy9wivAtJMj5LUtvgi72Ml74qYZZIwVTnADGCEajw/aV9AKCeRuHPZ8i7
	 HARDdcs4qPMerQtsx7eXcs+r6/byy0tFh/aXR4BWLoIgO5k9Ujf2vhWoGBtt63XOgr
	 DcuoKlM+RFE1mhVkGX8gsJbTRCCl3X1vCY0dhiR7ncUGiKrK0oaU8lTWC8+5+QfPa0
	 BLZkBCgl8H3tjti0+o7qnKOO6gQcoQ3JtgRPkXCx85SSqJcaBnfvMyRryZZwI1IOhg
	 Y7R3jjYDWNQYw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Apr 2026 08:59:26 +0200
Subject: [PATCH net-next v2 08/11] net: airoha: Rely on airoha_gdm_dev
 pointer in airhoa_is_lan_gdm_port()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-airoha-eth-multi-serdes-v2-8-ac427ae4beeb@kernel.org>
References: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
In-Reply-To: <20260401-airoha-eth-multi-serdes-v2-0-ac427ae4beeb@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_000024_751386_A84DDB88 
X-CRM114-Status: GOOD (  14.78  )
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

Rename airhoa_is_lan_gdm_port in airhoa_is_lan_gdm_dev. Moreover, rely
on airoha_gdm_dev pointer in airhoa_is_lan_gdm_dev() instead of
airoha_gdm_port one.
This is a preliminary patch to support multiple net_devices connected to
the same GDM{3,4} port via an external hw arbiter.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 6 ++----
 drivers/net/ethernet/airoha/airoha_eth.h | 4 +++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8a9d79afe48d636e17168d43ed152620ed661435..5e489e8593ba6ad3d5d9f6a383c827919153652e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -73,12 +73,10 @@ static void airoha_qdma_irq_disable(struct airoha_irq_bank *irq_bank,
 
 static void airoha_set_macaddr(struct airoha_gdm_dev *dev, const u8 *addr)
 {
-	struct airoha_gdm_port *port = dev->port;
 	struct airoha_eth *eth = dev->eth;
 	u32 val, reg;
 
-	reg = airoha_is_lan_gdm_port(port) ? REG_FE_LAN_MAC_H
-					   : REG_FE_WAN_MAC_H;
+	reg = airoha_is_lan_gdm_dev(dev) ? REG_FE_LAN_MAC_H : REG_FE_WAN_MAC_H;
 	val = (addr[0] << 16) | (addr[1] << 8) | addr[2];
 	airoha_fe_wr(eth, reg, val);
 
@@ -1785,7 +1783,7 @@ static int airoha_dev_init(struct net_device *netdev)
 	int i;
 
 	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
-	dev->qdma = &eth->qdma[!airoha_is_lan_gdm_port(port)];
+	dev->qdma = &eth->qdma[!airoha_is_lan_gdm_dev(dev)];
 	dev->dev->irq = dev->qdma->irq_banks[0].irq;
 	airoha_set_macaddr(dev, netdev->dev_addr);
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index b1e05cb67ce93640b25355106947ca2ab31f7235..c444ba7832dec356286e5dd2166aba792fdd2c5f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -632,8 +632,10 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 #define airoha_qdma_clear(qdma, offset, val)			\
 	airoha_rmw((qdma)->regs, (offset), (val), 0)
 
-static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
+static inline bool airoha_is_lan_gdm_dev(struct airoha_gdm_dev *dev)
 {
+	struct airoha_gdm_port *port = dev->port;
+
 	/* GDM1 port on EN7581 SoC is connected to the lan dsa switch.
 	 * GDM{2,3,4} can be used as wan port connected to an external
 	 * phy module.
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 6c55ffa40edad63ec135cd0c987b3bcac0b0fbf6..c86cbbfacc1e6e049ccac60d703edc8ca53eff9b 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -347,7 +347,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 			/* For downlink traffic consume SRAM memory for hw
 			 * forwarding descriptors queue.
 			 */
-			if (airoha_is_lan_gdm_port(port))
+			if (airoha_is_lan_gdm_dev(dev))
 				val |= AIROHA_FOE_IB2_FAST_PATH;
 			if (dsa_port >= 0)
 				val |= FIELD_PREP(AIROHA_FOE_IB2_NBQ,

-- 
2.53.0


