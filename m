Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D613FFD5327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpbjwxiELUOxPGAuBvAylWWMUmFWvkZ3ZUdWMaGoq20=; b=EHip94/BOO4Q2N6OWAAKdDEWTW
	nerjDbRrLtx0AWwaGoZnSFvIv2Q4YImEnXbgMqYOhiNDjSkxHOm0Xx5He9QJJ5rNRjHh3thwo+FS2
	4RPg2/qz1yA3VaCJ5XnV6BwZnhqiRFQnlMLYmw3LF2Q3VKX8rIrvRzfXbjV3Z4BO5OLrqo0N7EAD4
	yrFVn133XpvPFFzV9XZKIjIJhQiQo4gIvJOiBVTzyQJwkcEO5c19fwQmDp34x6IUTdin4dwSrlhAT
	FGnAdRTnpnYGEXJA0RsYP9IHiWWV4y/2Nl6D+G54ZXK8VugdO3XvzwVaGOpN0nqur3BX0r/WEt2nE
	Boy+2DUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXX-00000008BDz-0oFn;
	Fri, 27 Feb 2026 09:53:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXP-00000008B8A-3tC4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HpbjwxiELUOxPGAuBvAylWWMUmFWvkZ3ZUdWMaGoq20=; b=eldennK8xmhR/G1rhdaVlU1iJp
	E1RgEodT8Zl8VOw8xFedxN7SSIvTvbDRvElc0u/+edz/wVN2Q1S0h/EE5JLSUSTh14zmBSg0WXuFR
	v/d6bhZuOrSB8ZtuQG+MHM2dfgFIiWQdfYwt386Sxr6FrDbWj7dXkXVr+P/DqNTL6x4jwth+ewhqC
	yxPMRbUSLu31zeJ6JIXNAjbt4LgPGEmEPZS7cO6dPVxIytcNZhu2MTkDqOtZqxUYh1vdHwCQKUU7u
	OuqEuCO7nO32wRjy5TtHJ7LN8SKEQf+00NHzVoGUWMyKwfY0rL7QsfkP7Z4CX6LtpX5nMYTz4f3/k
	un0sENcQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43848 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuXG-000000000cf-09tT;
	Fri, 27 Feb 2026 09:53:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuXE-0000000Avmr-0eB0;
	Fri, 27 Feb 2026 09:53:24 +0000
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
Subject: [PATCH net-next 04/14] net: stmmac: remove .get_tx_ls()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuXE-0000000Avmr-0eB0@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015335_973402_DFE98F63 
X-CRM114-Status: GOOD (  10.60  )
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

No code calls stmmac_get_tx_ls(). Remove this macro, its associated
function pointer, and all implementations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 7 -------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 6 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 4 ----
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 6 ------
 5 files changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index b8fe4ad883e5..56a88b71def9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -191,12 +191,6 @@ static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des3 |= cpu_to_le32(flags);
 }
 
-static int dwmac4_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & TDES3_LAST_DESCRIPTOR)
-		>> TDES3_LAST_DESCRIPTOR_SHIFT;
-}
-
 static u16 dwmac4_wrback_get_rx_vlan_tci(struct dma_desc *p)
 {
 	return (le32_to_cpu(p->des0) & RDES0_VLAN_TAG_MASK);
@@ -549,7 +543,6 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.get_tx_len = dwmac4_rd_get_tx_len,
 	.set_tx_owner = dwmac4_set_tx_owner,
 	.set_rx_owner = dwmac4_set_rx_owner,
-	.get_tx_ls = dwmac4_get_tx_ls,
 	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwmac4_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwmac4_wrback_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 8bf373513930..f5deceb052d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -60,11 +60,6 @@ static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des3 |= cpu_to_le32(flags);
 }
 
-static int dwxgmac2_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
-}
-
 static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
 {
 	return le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK;
@@ -353,7 +348,6 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.get_tx_len = dwxgmac2_get_tx_len,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
-	.get_tx_ls = dwxgmac2_get_tx_ls,
 	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 77b2cb34aa0e..3c241c5699ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -287,11 +287,6 @@ static void enh_desc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des0 |= cpu_to_le32(RDES0_OWN);
 }
 
-static int enh_desc_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des0) & ETDES0_LAST_SEGMENT) >> 29;
-}
-
 static void enh_desc_release_tx_desc(struct dma_desc *p, int mode)
 {
 	int ter = (le32_to_cpu(p->des0) & ETDES0_END_RING) >> 21;
@@ -446,7 +441,6 @@ const struct stmmac_desc_ops enh_desc_ops = {
 	.release_tx_desc = enh_desc_release_tx_desc,
 	.prepare_tx_desc = enh_desc_prepare_tx_desc,
 	.set_tx_ic = enh_desc_set_tx_ic,
-	.get_tx_ls = enh_desc_get_tx_ls,
 	.set_tx_owner = enh_desc_set_tx_owner,
 	.set_rx_owner = enh_desc_set_rx_owner,
 	.get_rx_frame_len = enh_desc_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 50ca8dcea2fd..e317f64a0fcc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -56,8 +56,6 @@ struct stmmac_desc_ops {
 	/* Clear interrupt on tx frame completion. When this bit is
 	 * set an interrupt happens as soon as the frame is transmitted */
 	void (*set_tx_ic)(struct dma_desc *p);
-	/* Last tx segment reports the transmit status */
-	int (*get_tx_ls)(struct dma_desc *p);
 	/* Get the tag of the descriptor */
 	u16 (*get_rx_vlan_tci)(struct dma_desc *p);
 	/* Get the valid status of descriptor */
@@ -119,8 +117,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, release_tx_desc, __args)
 #define stmmac_set_tx_ic(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_tx_ic, __args)
-#define stmmac_get_tx_ls(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, get_tx_ls, __args)
 #define stmmac_get_rx_vlan_tci(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, get_rx_vlan_tci, __args)
 #define stmmac_get_rx_vlan_valid(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index e9face06b950..621bc1deb4e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -151,11 +151,6 @@ static void ndesc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des0 |= cpu_to_le32(RDES0_OWN);
 }
 
-static int ndesc_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des1) & TDES1_LAST_SEGMENT) >> 30;
-}
-
 static void ndesc_release_tx_desc(struct dma_desc *p, int mode)
 {
 	int ter = (le32_to_cpu(p->des1) & TDES1_END_RING) >> 25;
@@ -292,7 +287,6 @@ const struct stmmac_desc_ops ndesc_ops = {
 	.release_tx_desc = ndesc_release_tx_desc,
 	.prepare_tx_desc = ndesc_prepare_tx_desc,
 	.set_tx_ic = ndesc_set_tx_ic,
-	.get_tx_ls = ndesc_get_tx_ls,
 	.set_tx_owner = ndesc_set_tx_owner,
 	.set_rx_owner = ndesc_set_rx_owner,
 	.get_rx_frame_len = ndesc_get_rx_frame_len,
-- 
2.47.3


