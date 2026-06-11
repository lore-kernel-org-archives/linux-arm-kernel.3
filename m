Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445A0CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+jOyHqba0rH4zTadn64tIUKChLC1NBW+TRedVk1PYw=; b=jiFHN3CybiLeOCwfShVO0aOO2D
	1G9CxI4T8LxSFUP62mlt17PN7iQ89TUOLPrte0Hq/ZjzHzPfuP7UMb9KIMVLzQYUcha0qmIMLnmM2
	z+DaRlZvpcOefiAr6+bYIFPGoD4JDyw5JGcDiUJY+NjBw26AS+/9CRcd9dhsVXTI9MKCiFPUs9RoR
	+l5g/b4dWYAe5pgxkrTgvY8bV9C9QErbAi3ubFlr+bkEZztxJJmF+ojJ4hZgfv5xhx6+mjFessTQI
	sYzY1wONAnEAqzBB2XT+BoOpib4hN8nvn99QUWh72YNi9xEOmW634xqbp3yTxXpWTTnynjAeXsAd+
	E/WlCRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnNu-0000000A73J-0gN7;
	Thu, 11 Jun 2026 21:56:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXnNt-0000000A728-0Ima;
	Thu, 11 Jun 2026 21:56:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77296416FA;
	Thu, 11 Jun 2026 21:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CDA1F000E9;
	Thu, 11 Jun 2026 21:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781214979;
	bh=h+jOyHqba0rH4zTadn64tIUKChLC1NBW+TRedVk1PYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=oK6SGaPsDW2j6XlmDQWopczaVXcGFJQWR2fciWSwg2Tv2gnevmhyKkvfnlACXLg8C
	 NvIz08p676br/fm4E2J3Ddo49dbCefLF0syUTK4dJnDuyEt0XqxlU4KIz5cNOpe7T8
	 jvknULHppaco6gmFxYYhAoXQBsAtR8XtC0kVfWEsCByUsf370wdAD2ymeIgKLkqoBN
	 AnrBA8LU9AABYtNhLzT63rc2OtujdBH2k/1fT/sc90onQFKFPQsb6g4CEZioIuvtf3
	 nw7t+7bsTxsPSuyCUqbnXs/OOWqyU24hBbYf2oY8mWJv/EYYZDKYnYVA/98HnBaJWL
	 7UgN3i0U7PIFw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 11 Jun 2026 23:55:51 +0200
Subject: [PATCH net-next v5 1/3] net: airoha: use int instead of atomic_t
 for qdma users counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-airoha-ethtool-priv_flags-v5-1-c11de08486d1@kernel.org>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

QDMA users counter is always accessed holding RTNL lock so we do not
require atomic_t for it.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 4 ++--
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 504247c8bae9..9eb9b6a139b3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1812,7 +1812,7 @@ static int airoha_dev_open(struct net_device *netdev)
 	airoha_qdma_set(qdma, REG_QDMA_GLOBAL_CFG,
 			GLOBAL_CFG_TX_DMA_EN_MASK |
 			GLOBAL_CFG_RX_DMA_EN_MASK);
-	atomic_inc(&qdma->users);
+	qdma->users++;
 
 	if (!airoha_is_lan_gdm_dev(dev) &&
 	    airoha_ppe_is_enabled(qdma->eth, 1))
@@ -1866,7 +1866,7 @@ static int airoha_dev_stop(struct net_device *netdev)
 					    REG_GDM_FWD_CFG(port->id),
 					    FE_PSE_PORT_DROP);
 
-	if (atomic_dec_and_test(&qdma->users)) {
+	if (!--qdma->users) {
 		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
 				  GLOBAL_CFG_TX_DMA_EN_MASK |
 				  GLOBAL_CFG_RX_DMA_EN_MASK);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 8f42973f9cf5..24fd8dcf7fca 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -526,7 +526,7 @@ struct airoha_qdma {
 	struct airoha_eth *eth;
 	void __iomem *regs;
 
-	atomic_t users;
+	int users;
 
 	struct airoha_irq_bank irq_banks[AIROHA_MAX_NUM_IRQ_BANKS];
 

-- 
2.54.0


