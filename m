Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF22FD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31vJg1g4NNHGSCqJsTr8a5NJoJSqe19lfVdZJfDeVP0=; b=Wttf83Ayr/aM6UOUk+4mbgjrc4
	w9qX3qxxMYyc0Jl6F5E4+oDQBDnD0okXgqhatyhQM6xRCql+k9kegTzv+P10/O3UQ6dae2pZ9hckx
	e813VOjr/TRGQnU4O5Iid+TBoQyQ3PGRzmj8wN+AunFAIrlNlQn+2EHupTgOlChKxXTspvI+ZGOC5
	d95m0lsLqdu/kH6G/84emLZm3qUBy9hJIx2Nh6FGqou2oui9SWTzfy6YzLKJoC9MgU8D0Mm97Df1k
	psoVGssfRLwLMFxzKRomxKtoOMMhBNQRx20wOcVH5k8aXQnSWbMcyhGSgKee55x9w52biAS166aCl
	6AtZ85KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXX-00000008BEO-2B5i;
	Fri, 27 Feb 2026 09:53:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXV-00000008BBO-1K71
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=31vJg1g4NNHGSCqJsTr8a5NJoJSqe19lfVdZJfDeVP0=; b=A2JgBqgM8+w7rRpLwmo3/O5YZ0
	P92XmDcyKfzR6U7mCIjvSwi0Oz7sBIZwZBfHkKNf1Cv1zKR5alDBnBzvDXHpM0fzCX+p/OmkAjJlu
	8G3fmHSDvYOfd7wZGY11E8Tzr2AUx0fTOAlX9y8IdriJQpZbQr2pT8ozupOTyfnbfGhQGZ/D77LXp
	09/Yno+SIC7EmU7ZVCgnH8rU52nQbkfvt2LW94d+LiJuswTXku54LK2zUbnhBH6VpitAa0+5esJ4u
	6DszAZQefnGkGY1wyV79V/lMjo/kaX/Re9IaUU2XiC52SxWDenLOrmwCRwpjLJvbOLzYqLRh2bC3Y
	KivLqe+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43978 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXL-000000000cw-0U34;
	Fri, 27 Feb 2026 09:53:31 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXJ-0000000Avmx-1B8Y;
	Fri, 27 Feb 2026 09:53:29 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 05/14] net: stmmac: remove .get_tx_len()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXJ-0000000Avmx-1B8Y@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015341_356640_9161688E 
X-CRM114-Status: GOOD (  11.99  )
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

No code calls stmmac_get_tx_len(). Remove this macro, its associated
function pointer, and all implementations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 6 ------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 6 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 4 ----
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 6 ------
 5 files changed, 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 56a88b71def9..1bbf02504dad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -171,11 +171,6 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int dwmac4_rd_get_tx_len(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des2) & TDES2_BUFFER1_SIZE_MASK);
-}
-
 static void dwmac4_set_tx_owner(struct dma_desc *p)
 {
 	p->des3 |= cpu_to_le32(TDES3_OWN);
@@ -540,7 +535,6 @@ static void dwmac4_set_tbs(struct dma_edesc *p, u32 sec, u32 nsec)
 const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.tx_status = dwmac4_wrback_get_tx_status,
 	.rx_status = dwmac4_wrback_get_rx_status,
-	.get_tx_len = dwmac4_rd_get_tx_len,
 	.set_tx_owner = dwmac4_set_tx_owner,
 	.set_rx_owner = dwmac4_set_rx_owner,
 	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index f5deceb052d7..1009ef436a1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -40,11 +40,6 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
 	return good_frame;
 }
 
-static int dwxgmac2_get_tx_len(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des2) & XGMAC_TDES2_B1L);
-}
-
 static void dwxgmac2_set_tx_owner(struct dma_desc *p)
 {
 	p->des3 |= cpu_to_le32(XGMAC_TDES3_OWN);
@@ -345,7 +340,6 @@ static void dwxgmac2_set_tbs(struct dma_edesc *p, u32 sec, u32 nsec)
 const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.tx_status = dwxgmac2_get_tx_status,
 	.rx_status = dwxgmac2_get_rx_status,
-	.get_tx_len = dwxgmac2_get_tx_len,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
 	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 3c241c5699ed..ead468f4b645 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -76,11 +76,6 @@ static int enh_desc_get_tx_status(struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int enh_desc_get_tx_len(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des1) & ETDES1_BUFFER1_SIZE_MASK);
-}
-
 static int enh_desc_coe_rdes0(int ipc_err, int type, int payload_err)
 {
 	int ret = good_frame;
@@ -435,7 +430,6 @@ static void enh_desc_clear(struct dma_desc *p)
 const struct stmmac_desc_ops enh_desc_ops = {
 	.tx_status = enh_desc_get_tx_status,
 	.rx_status = enh_desc_get_rx_status,
-	.get_tx_len = enh_desc_get_tx_len,
 	.init_rx_desc = enh_desc_init_rx_desc,
 	.init_tx_desc = enh_desc_init_tx_desc,
 	.release_tx_desc = enh_desc_release_tx_desc,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e317f64a0fcc..374f326efa01 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -63,8 +63,6 @@ struct stmmac_desc_ops {
 	/* Return the transmit status looking at the TDES1 */
 	int (*tx_status)(struct stmmac_extra_stats *x,
 			 struct dma_desc *p, void __iomem *ioaddr);
-	/* Get the buffer size from the descriptor */
-	int (*get_tx_len)(struct dma_desc *p);
 	/* Handle extra events on specific interrupts hw dependent */
 	void (*set_rx_owner)(struct dma_desc *p, int disable_rx_ic);
 	/* Get the receive frame size */
@@ -123,8 +121,6 @@ struct stmmac_desc_ops {
 	stmmac_do_callback(__priv, desc, get_rx_vlan_valid, __args)
 #define stmmac_tx_status(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, tx_status, __args)
-#define stmmac_get_tx_len(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, get_tx_len, __args)
 #define stmmac_set_rx_owner(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_rx_owner, __args)
 #define stmmac_get_rx_frame_len(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 621bc1deb4e5..7c3a818c33c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -55,11 +55,6 @@ static int ndesc_get_tx_status(struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static int ndesc_get_tx_len(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des1) & RDES1_BUFFER1_SIZE_MASK);
-}
-
 /* This function verifies if each incoming frame has some errors
  * and, if required, updates the multicast statistics.
  * In case of success, it returns good_frame because the GMAC device
@@ -281,7 +276,6 @@ static void ndesc_clear(struct dma_desc *p)
 const struct stmmac_desc_ops ndesc_ops = {
 	.tx_status = ndesc_get_tx_status,
 	.rx_status = ndesc_get_rx_status,
-	.get_tx_len = ndesc_get_tx_len,
 	.init_rx_desc = ndesc_init_rx_desc,
 	.init_tx_desc = ndesc_init_tx_desc,
 	.release_tx_desc = ndesc_release_tx_desc,
-- 
2.47.3


