Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2213FD5323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MajI2INaGiZS8Z4dAUbnmtLgqBRNyA8jeruIw1WQWZ8=; b=mKl7PbDrssGv6a2zW72IdmjXgj
	rqBEF8beAYtXcNXfS6Gwyw0adbYV81wO4P/oYNZ6RNwVaMQ932bF3GDMJFKN/B6opJbvEh1dRK08m
	pWKuM/OU+5Vy7iHhLTQ1Stme8spHumV7POW1i8lb88zCmSfGcl6pwyJQm/ULXtFTXstxOQxmXYnx9
	6cE2Z3rYxvK3Jnon+eIUjAVHYsdu51t9pzs9lMMJQVvGDinvR1UgjtJJfCCVXpXfUbXct+hiU2IP0
	nxvD6OHwSzPIM9/01KRoTU2m8a0RQ8ZVxzRKybyNwpoe6l/SUKY60EaTJkpj1yqXy0Qivd/RbfRsF
	AgYWdTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXK-00000008B6H-09am;
	Fri, 27 Feb 2026 09:53:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuXH-00000008B3i-0FX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:53:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MajI2INaGiZS8Z4dAUbnmtLgqBRNyA8jeruIw1WQWZ8=; b=wY5ite8kqx5wlkeJQJDnVlllb1
	DyI2KVjDE8pIk+rzkIO2TbV0hNqgWeDgHz67LoZgMaz55JyKXrttA8sbPewy6MvXXnyUMNggmDlBp
	6M9V9+QtxcLYuIAy9F+cZLGd4iQk5a7nEl4SXL9n/qiypMqhNs1w1+jm8B5s7UfMrO1WcKY35qudU
	NEb8/V6hxUIzb6zzGJW9hfQsNLqjhjtxegfbrDv+92/xckys8id7veS2ndOv++3O0z7lFzDqSagVd
	i17VovN1Xsuu6qv9eMrPSGUemLhRwU/Yx3vnvMnq/EdfG05Ydl3+zZBSDt/kuxytH/kvWPU17weWp
	f4hk8k8g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43832 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vvuX9-000000000cM-3mHE;
	Fri, 27 Feb 2026 09:53:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vvuX9-0000000Avml-08Lo;
	Fri, 27 Feb 2026 09:53:19 +0000
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
Subject: [PATCH net-next 03/14] net: stmmac: remove .get_tx_owner()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vvuX9-0000000Avml-08Lo@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_015327_105093_B57038BB 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

No code calls stmmac_get_tx_owner(). Remove the macro, its associated
function pointer, and all implementations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 6 ------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 6 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 3 ---
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 6 ------
 5 files changed, 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index e226dc6a1b17..b8fe4ad883e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -176,11 +176,6 @@ static int dwmac4_rd_get_tx_len(struct dma_desc *p)
 	return (le32_to_cpu(p->des2) & TDES2_BUFFER1_SIZE_MASK);
 }
 
-static int dwmac4_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & TDES3_OWN) >> TDES3_OWN_SHIFT;
-}
-
 static void dwmac4_set_tx_owner(struct dma_desc *p)
 {
 	p->des3 |= cpu_to_le32(TDES3_OWN);
@@ -552,7 +547,6 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.tx_status = dwmac4_wrback_get_tx_status,
 	.rx_status = dwmac4_wrback_get_rx_status,
 	.get_tx_len = dwmac4_rd_get_tx_len,
-	.get_tx_owner = dwmac4_get_tx_owner,
 	.set_tx_owner = dwmac4_set_tx_owner,
 	.set_rx_owner = dwmac4_set_rx_owner,
 	.get_tx_ls = dwmac4_get_tx_ls,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 41e5b420a215..8bf373513930 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -45,11 +45,6 @@ static int dwxgmac2_get_tx_len(struct dma_desc *p)
 	return (le32_to_cpu(p->des2) & XGMAC_TDES2_B1L);
 }
 
-static int dwxgmac2_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & XGMAC_TDES3_OWN) > 0;
-}
-
 static void dwxgmac2_set_tx_owner(struct dma_desc *p)
 {
 	p->des3 |= cpu_to_le32(XGMAC_TDES3_OWN);
@@ -356,7 +351,6 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.tx_status = dwxgmac2_get_tx_status,
 	.rx_status = dwxgmac2_get_rx_status,
 	.get_tx_len = dwxgmac2_get_tx_len,
-	.get_tx_owner = dwxgmac2_get_tx_owner,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
 	.get_tx_ls = dwxgmac2_get_tx_ls,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 8f6993c8bcae..77b2cb34aa0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -277,11 +277,6 @@ static void enh_desc_init_tx_desc(struct dma_desc *p, int mode, int end)
 		enh_desc_end_tx_desc_on_ring(p, end);
 }
 
-static int enh_desc_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des0) & ETDES0_OWN) >> 31;
-}
-
 static void enh_desc_set_tx_owner(struct dma_desc *p)
 {
 	p->des0 |= cpu_to_le32(ETDES0_OWN);
@@ -448,7 +443,6 @@ const struct stmmac_desc_ops enh_desc_ops = {
 	.get_tx_len = enh_desc_get_tx_len,
 	.init_rx_desc = enh_desc_init_rx_desc,
 	.init_tx_desc = enh_desc_init_tx_desc,
-	.get_tx_owner = enh_desc_get_tx_owner,
 	.release_tx_desc = enh_desc_release_tx_desc,
 	.prepare_tx_desc = enh_desc_prepare_tx_desc,
 	.set_tx_ic = enh_desc_set_tx_ic,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 0db96a387259..50ca8dcea2fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -51,7 +51,6 @@ struct stmmac_desc_ops {
 			unsigned int tcppayloadlen);
 	/* Set/get the owner of the descriptor */
 	void (*set_tx_owner)(struct dma_desc *p);
-	int (*get_tx_owner)(struct dma_desc *p);
 	/* Clean the tx descriptor as soon as the tx irq is received */
 	void (*release_tx_desc)(struct dma_desc *p, int mode);
 	/* Clear interrupt on tx frame completion. When this bit is
@@ -116,8 +115,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, prepare_tso_tx_desc, __args)
 #define stmmac_set_tx_owner(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_tx_owner, __args)
-#define stmmac_get_tx_owner(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, get_tx_owner, __args)
 #define stmmac_release_tx_desc(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, release_tx_desc, __args)
 #define stmmac_set_tx_ic(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 859cb9242a52..e9face06b950 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -141,11 +141,6 @@ static void ndesc_init_tx_desc(struct dma_desc *p, int mode, int end)
 		ndesc_end_tx_desc_on_ring(p, end);
 }
 
-static int ndesc_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des0) & TDES0_OWN) >> 31;
-}
-
 static void ndesc_set_tx_owner(struct dma_desc *p)
 {
 	p->des0 |= cpu_to_le32(TDES0_OWN);
@@ -294,7 +289,6 @@ const struct stmmac_desc_ops ndesc_ops = {
 	.get_tx_len = ndesc_get_tx_len,
 	.init_rx_desc = ndesc_init_rx_desc,
 	.init_tx_desc = ndesc_init_tx_desc,
-	.get_tx_owner = ndesc_get_tx_owner,
 	.release_tx_desc = ndesc_release_tx_desc,
 	.prepare_tx_desc = ndesc_prepare_tx_desc,
 	.set_tx_ic = ndesc_set_tx_ic,
-- 
2.47.3


