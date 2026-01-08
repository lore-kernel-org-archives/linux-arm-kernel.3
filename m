Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AB6D1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9ytY5SO6rojaTZLuh5j4TbqDVjn27ssnPVjQGpWrlo=; b=P5fDJ9MK5o+OYotF8R+uOEjQci
	nQ0zlUFh1904NSSItt+rl+iRqTkABF23iBgPVTjwXMb/3tFZGSXUGnEtBLYHEu7GjTOcT+fUEdB9A
	04RrpHn6G4E9IVQO9K+EgfKyqEUskLxkG+4L+hMVkRTqC3LqJHcPy2zQu/g+bRy8RcS2XUoh52XQp
	1esybEE9pmTsQuNcUHIG90d8DMUYA2MFSit+MjUoRIct1GirE77vwRqGiZzqxY7dNsVn5B7sXiJwE
	xfvTxd9263CYoEEMnyJiBenKZfSxYo4rUUcyRKo5NDpcBkVAIAd4qViVLcy/mzvQUJ2Ksysh4CMND
	Yb+bSoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtwA-00000000S42-1tGe;
	Thu, 08 Jan 2026 17:36:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtw7-00000000RyM-0BhR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P9ytY5SO6rojaTZLuh5j4TbqDVjn27ssnPVjQGpWrlo=; b=wltS4vUUTjtUWLbRknKXN3wZsO
	oulb/7O8kjPTP+041lDfOdvLnAZs8p9JiTJBsyug0aXliN+2WGzRxuyYvFOOSgHZlcEL1t7o0YByf
	Vr9DkdPQWARutT9FuIAwmwJuFRZVN9N7sdH9ObRKy+8oMs3leVUmbnMfgOkJKf8KGYXuVtVm6B4tb
	KdlvOAtnxpECzU9NA7/+fCgl2ZHI3RO7On1BO+21GZThHsNMsV0jhDGtjGtSPSjU/yNqj96ICnUH0
	ZfTl8tyTWgsSe5FGGDvPRHpdRFlmTcIRTUyxCS1rBzbB/ARzAUEOG4JlSPlfZ6qm3kmmT8jsI7B1m
	XyGCTDEA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58294 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vdtvy-000000002zq-3azJ;
	Thu, 08 Jan 2026 17:36:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vdtvx-00000002Gth-32RU;
	Thu, 08 Jan 2026 17:36:29 +0000
In-Reply-To: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
References: <aV_q2Kneinrk3Z-W@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 5/9] net: stmmac: descs: use u32 for descriptors
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vdtvx-00000002Gth-32RU@rmk-PC.armlinux.org.uk>
Date: Thu, 08 Jan 2026 17:36:29 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093639_261458_40EB3D96 
X-CRM114-Status: GOOD (  12.46  )
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

Use u32 rather than unsigned int for 32-bit descriptor variables.
This will allow the u32 bitfield helpers to be used. Note, we use
__le32 for the in-memory descriptor structures.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    | 20 +++++++++----------
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 14 ++++++-------
 .../net/ethernet/stmicro/stmmac/enh_desc.c    | 10 +++++-----
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |  8 ++++----
 4 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index c84b26d51760..cdef27c8043f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -17,11 +17,9 @@ static int dwmac4_wrback_get_tx_status(struct stmmac_extra_stats *x,
 				       struct dma_desc *p,
 				       void __iomem *ioaddr)
 {
-	unsigned int tdes3;
+	u32 tdes3 = le32_to_cpu(p->des3);
 	int ret = tx_done;
 
-	tdes3 = le32_to_cpu(p->des3);
-
 	/* Get tx owner first */
 	if (unlikely(tdes3 & TDES3_OWN))
 		return tx_dma_own;
@@ -73,9 +71,9 @@ static int dwmac4_wrback_get_tx_status(struct stmmac_extra_stats *x,
 static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 				       struct dma_desc *p)
 {
-	unsigned int rdes1 = le32_to_cpu(p->des1);
-	unsigned int rdes2 = le32_to_cpu(p->des2);
-	unsigned int rdes3 = le32_to_cpu(p->des3);
+	u32 rdes1 = le32_to_cpu(p->des1);
+	u32 rdes2 = le32_to_cpu(p->des2);
+	u32 rdes3 = le32_to_cpu(p->des3);
 	int message_type;
 	int ret = good_frame;
 
@@ -255,9 +253,9 @@ static inline void dwmac4_get_timestamp(void *desc, u32 ats, u64 *ts)
 static int dwmac4_rx_check_timestamp(void *desc)
 {
 	struct dma_desc *p = (struct dma_desc *)desc;
-	unsigned int rdes0 = le32_to_cpu(p->des0);
-	unsigned int rdes1 = le32_to_cpu(p->des1);
-	unsigned int rdes3 = le32_to_cpu(p->des3);
+	u32 rdes0 = le32_to_cpu(p->des0);
+	u32 rdes1 = le32_to_cpu(p->des1);
+	u32 rdes3 = le32_to_cpu(p->des3);
 	u32 own, ctxt;
 	int ret = 1;
 
@@ -327,7 +325,7 @@ static void dwmac4_rd_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 				      bool csum_flag, int mode, bool tx_own,
 				      bool ls, unsigned int tot_pkt_len)
 {
-	unsigned int tdes3 = le32_to_cpu(p->des3);
+	u32 tdes3 = le32_to_cpu(p->des3);
 
 	p->des2 |= cpu_to_le32(len & TDES2_BUFFER1_SIZE_MASK);
 
@@ -366,7 +364,7 @@ static void dwmac4_rd_prepare_tso_tx_desc(struct dma_desc *p, int is_fs,
 					  bool ls, unsigned int tcphdrlen,
 					  unsigned int tcppayloadlen)
 {
-	unsigned int tdes3 = le32_to_cpu(p->des3);
+	u32 tdes3 = le32_to_cpu(p->des3);
 
 	if (len1)
 		p->des2 |= cpu_to_le32((len1 & TDES2_BUFFER1_SIZE_MASK));
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index a2980482fcce..b13d24c8b52a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -12,7 +12,7 @@
 static int dwxgmac2_get_tx_status(struct stmmac_extra_stats *x,
 				  struct dma_desc *p, void __iomem *ioaddr)
 {
-	unsigned int tdes3 = le32_to_cpu(p->des3);
+	u32 tdes3 = le32_to_cpu(p->des3);
 	int ret = tx_done;
 
 	if (unlikely(tdes3 & XGMAC_TDES3_OWN))
@@ -26,7 +26,7 @@ static int dwxgmac2_get_tx_status(struct stmmac_extra_stats *x,
 static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
-	unsigned int rdes3 = le32_to_cpu(p->des3);
+	u32 rdes3 = le32_to_cpu(p->des3);
 
 	if (unlikely(rdes3 & XGMAC_RDES3_OWN))
 		return dma_own;
@@ -114,7 +114,7 @@ static inline void dwxgmac2_get_timestamp(void *desc, u32 ats, u64 *ts)
 static int dwxgmac2_rx_check_timestamp(void *desc)
 {
 	struct dma_desc *p = (struct dma_desc *)desc;
-	unsigned int rdes3 = le32_to_cpu(p->des3);
+	u32 rdes3 = le32_to_cpu(p->des3);
 	bool desc_valid, ts_valid;
 
 	dma_rmb();
@@ -135,7 +135,7 @@ static int dwxgmac2_get_rx_timestamp_status(void *desc, void *next_desc,
 					    u32 ats)
 {
 	struct dma_desc *p = (struct dma_desc *)desc;
-	unsigned int rdes3 = le32_to_cpu(p->des3);
+	u32 rdes3 = le32_to_cpu(p->des3);
 	int ret = -EBUSY;
 
 	if (likely(rdes3 & XGMAC_RDES3_CDA))
@@ -162,7 +162,7 @@ static void dwxgmac2_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 				     bool csum_flag, int mode, bool tx_own,
 				     bool ls, unsigned int tot_pkt_len)
 {
-	unsigned int tdes3 = le32_to_cpu(p->des3);
+	u32 tdes3 = le32_to_cpu(p->des3);
 
 	p->des2 |= cpu_to_le32(len & XGMAC_TDES2_B1L);
 
@@ -201,7 +201,7 @@ static void dwxgmac2_prepare_tso_tx_desc(struct dma_desc *p, int is_fs,
 					 bool ls, unsigned int tcphdrlen,
 					 unsigned int tcppayloadlen)
 {
-	unsigned int tdes3 = le32_to_cpu(p->des3);
+	u32 tdes3 = le32_to_cpu(p->des3);
 
 	if (len1)
 		p->des2 |= cpu_to_le32(len1 & XGMAC_TDES2_B1L);
@@ -274,7 +274,7 @@ static void dwxgmac2_clear(struct dma_desc *p)
 static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 				enum pkt_hash_types *type)
 {
-	unsigned int rdes3 = le32_to_cpu(p->des3);
+	u32 rdes3 = le32_to_cpu(p->des3);
 	u32 ptype;
 
 	if (rdes3 & XGMAC_RDES3_RSV) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 937b7a0466fc..9263be969c36 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -15,7 +15,7 @@
 static int enh_desc_get_tx_status(struct stmmac_extra_stats *x,
 				  struct dma_desc *p, void __iomem *ioaddr)
 {
-	unsigned int tdes0 = le32_to_cpu(p->des0);
+	u32 tdes0 = le32_to_cpu(p->des0);
 	int ret = tx_done;
 
 	/* Get tx owner first */
@@ -117,8 +117,8 @@ static int enh_desc_coe_rdes0(int ipc_err, int type, int payload_err)
 static void enh_desc_get_ext_status(struct stmmac_extra_stats *x,
 				    struct dma_extended_desc *p)
 {
-	unsigned int rdes0 = le32_to_cpu(p->basic.des0);
-	unsigned int rdes4 = le32_to_cpu(p->des4);
+	u32 rdes0 = le32_to_cpu(p->basic.des0);
+	u32 rdes4 = le32_to_cpu(p->des4);
 
 	if (unlikely(rdes0 & ERDES0_RX_MAC_ADDR)) {
 		int message_type = (rdes4 & ERDES4_MSG_TYPE_MASK) >> 8;
@@ -181,7 +181,7 @@ static void enh_desc_get_ext_status(struct stmmac_extra_stats *x,
 static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
-	unsigned int rdes0 = le32_to_cpu(p->des0);
+	u32 rdes0 = le32_to_cpu(p->des0);
 	int ret = good_frame;
 
 	if (unlikely(rdes0 & RDES0_OWN))
@@ -312,7 +312,7 @@ static void enh_desc_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 				     bool csum_flag, int mode, bool tx_own,
 				     bool ls, unsigned int tot_pkt_len)
 {
-	unsigned int tdes0 = le32_to_cpu(p->des0);
+	u32 tdes0 = le32_to_cpu(p->des0);
 
 	if (mode == STMMAC_CHAIN_MODE)
 		enh_set_tx_desc_len_on_chain(p, len);
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 68a7cfcb1d8f..dbfff25947b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -15,8 +15,8 @@
 static int ndesc_get_tx_status(struct stmmac_extra_stats *x,
 			       struct dma_desc *p, void __iomem *ioaddr)
 {
-	unsigned int tdes0 = le32_to_cpu(p->des0);
-	unsigned int tdes1 = le32_to_cpu(p->des1);
+	u32 tdes0 = le32_to_cpu(p->des0);
+	u32 tdes1 = le32_to_cpu(p->des1);
 	int ret = tx_done;
 
 	/* Get tx owner first */
@@ -69,8 +69,8 @@ static int ndesc_get_tx_len(struct dma_desc *p)
 static int ndesc_get_rx_status(struct stmmac_extra_stats *x,
 			       struct dma_desc *p)
 {
+	u32 rdes0 = le32_to_cpu(p->des0);
 	int ret = good_frame;
-	unsigned int rdes0 = le32_to_cpu(p->des0);
 
 	if (unlikely(rdes0 & RDES0_OWN))
 		return dma_own;
@@ -178,7 +178,7 @@ static void ndesc_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 				  bool csum_flag, int mode, bool tx_own,
 				  bool ls, unsigned int tot_pkt_len)
 {
-	unsigned int tdes1 = le32_to_cpu(p->des1);
+	u32 tdes1 = le32_to_cpu(p->des1);
 
 	if (is_fs)
 		tdes1 |= TDES1_FIRST_SEGMENT;
-- 
2.47.3


