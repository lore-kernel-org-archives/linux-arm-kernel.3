Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AC9FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 05:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9g/S0OEOJwZRklnQS9mgNU/TfpOQiBulDLxsxKRuhRw=; b=ss7/9jh/MKWUeTq5mMNfUFC3cj
	t61nmXWCX9hNDjCjKOYIyDlx2xtolbVrAEUfAK4tj14DjY9yOq5MB9CZyf/a6kCyk01fxgnG0Fe1c
	dnC6qDkIBgEDGSAfqRjbOAnl0vmA1TWNY0zd5tffA5z/MTU7zyqCqhhMhWAYcdMYrI0hC9EnmjYFM
	tTzxv0WdprYxAll2l7nUm8KO6pi+yV4LXj8V4zOeRoInT+1p/YFfJfOXlmMQRY68t345a9YPZduQG
	ZuFqKtESg6r/WieH9ploeP694KxywSuTL1mqqbsRld+Ql0N1QZUxKScKW093KdtSjFSFpSdZgtGfz
	xw4vTQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHajK-00000000Z55-1K5X;
	Tue, 28 Apr 2026 05:11:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHajI-00000000Z4X-1Z6e;
	Tue, 28 Apr 2026 05:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B38860141;
	Tue, 28 Apr 2026 05:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA3BC2BCAF;
	Tue, 28 Apr 2026 05:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777353087;
	bh=IDFwQPFCFY7/4FW3VjvftA4mwDxU7Q59AGp0SdwY1s4=;
	h=From:Date:Subject:To:Cc:From;
	b=F7Ao+7A+2rhkFm5z4VuffCL4G7falhApwqeyqYpddHvMKIOsLFOcqipD4n97hNCOy
	 bX+LWxzG8NhM14dvfnll/xRbKqLRCbUX8qCVucSBlwNaci+jcDt+J4XZTQ35bldTiw
	 B8+memv2e2OrY4KQi1B2viI+8yNJd7Vv65hLDa+0Dx0/lVNp48Cl1uRoeWkpEc1dZP
	 droQH0B49SK6n4Hg1MLDDww/oRH9+J1rusHYwwsL+q4NuyZU0IdHmvufcl9vFQ3PTv
	 afkRXd4DihjUSWeQk7wBuF/gW8vYW2ONgpthCUzlsmzShHPojc5k3SbTk0/fPZHTft
	 SNmVz4+7u+j3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 28 Apr 2026 07:10:53 +0200
Subject: [PATCH net-next] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-airoha_fe_get-airoha_qdma_get-v1-1-6cfbdeb42743@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXM0QpAMBSH8VfRuaZmhLyKtE78x7kwbJKSd7eUy
 199fTcFeEGgNrnJ45Qgq4vI04SGmd2ETMZo0kpXqtRNxuLXmY2FmXD82seFP9esmpp1wbAlxcf
 mYeX6/h25GDhcB/XP8wJ5Gp0ueQAAAA==
X-Change-ID: 20260428-airoha_fe_get-airoha_qdma_get-7a087a23aef4
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Add airoha_fe_get() and airoha_qdma_get() as utility routines for reading
a masked field from a specified register.
This is a non-functional refactor, no logical changes are introduced to
the existing codebase.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 13 ++++---------
 drivers/net/ethernet/airoha/airoha_eth.h |  4 ++++
 drivers/net/ethernet/airoha/airoha_ppe.c |  5 ++---
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2bb0a3ff9810..40b7a00c7d95 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -201,15 +201,13 @@ static void airoha_fe_vip_setup(struct airoha_eth *eth)
 static u32 airoha_fe_get_pse_queue_rsv_pages(struct airoha_eth *eth,
 					     u32 port, u32 queue)
 {
-	u32 val;
-
 	airoha_fe_rmw(eth, REG_FE_PSE_QUEUE_CFG_WR,
 		      PSE_CFG_PORT_ID_MASK | PSE_CFG_QUEUE_ID_MASK,
 		      FIELD_PREP(PSE_CFG_PORT_ID_MASK, port) |
 		      FIELD_PREP(PSE_CFG_QUEUE_ID_MASK, queue));
-	val = airoha_fe_rr(eth, REG_FE_PSE_QUEUE_CFG_VAL);
 
-	return FIELD_GET(PSE_CFG_OQ_RSV_MASK, val);
+	return airoha_fe_get(eth, REG_FE_PSE_QUEUE_CFG_VAL,
+			     PSE_CFG_OQ_RSV_MASK);
 }
 
 static void airoha_fe_set_pse_queue_rsv_pages(struct airoha_eth *eth,
@@ -227,9 +225,7 @@ static void airoha_fe_set_pse_queue_rsv_pages(struct airoha_eth *eth,
 
 static u32 airoha_fe_get_pse_all_rsv(struct airoha_eth *eth)
 {
-	u32 val = airoha_fe_rr(eth, REG_FE_PSE_BUF_SET);
-
-	return FIELD_GET(PSE_ALLRSV_MASK, val);
+	return airoha_fe_get(eth, REG_FE_PSE_BUF_SET, PSE_ALLRSV_MASK);
 }
 
 static int airoha_fe_set_pse_oq_rsv(struct airoha_eth *eth,
@@ -247,8 +243,7 @@ static int airoha_fe_set_pse_oq_rsv(struct airoha_eth *eth,
 		      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));
 
 	/* modify hthd */
-	tmp = airoha_fe_rr(eth, PSE_FQ_CFG);
-	fq_limit = FIELD_GET(PSE_FQ_LIMIT_MASK, tmp);
+	fq_limit = airoha_fe_get(eth, PSE_FQ_CFG, PSE_FQ_LIMIT_MASK);
 	tmp = fq_limit - all_rsv - 0x20;
 	airoha_fe_rmw(eth, REG_PSE_SHARE_USED_THD,
 		      PSE_SHARE_USED_HTHD_MASK,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index e389d2fe3b86..c81433d44e3e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -619,6 +619,8 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 	airoha_rmw((eth)->fe_regs, (offset), 0, (val))
 #define airoha_fe_clear(eth, offset, val)			\
 	airoha_rmw((eth)->fe_regs, (offset), (val), 0)
+#define airoha_fe_get(eth, offset, mask)			\
+	FIELD_GET((mask), airoha_fe_rr((eth), (offset)))
 
 #define airoha_qdma_rr(qdma, offset)				\
 	airoha_rr((qdma)->regs, (offset))
@@ -630,6 +632,8 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 	airoha_rmw((qdma)->regs, (offset), 0, (val))
 #define airoha_qdma_clear(qdma, offset, val)			\
 	airoha_rmw((qdma)->regs, (offset), (val), 0)
+#define airoha_qdma_get(eth, offset, mask)			\
+	FIELD_GET((mask), airoha_qdma_rr((eth), (offset)))
 
 static inline bool airoha_is_lan_gdm_port(struct airoha_gdm_port *port)
 {
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6bccd1..697af6fdd4c3 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -80,9 +80,8 @@ bool airoha_ppe_is_enabled(struct airoha_eth *eth, int index)
 
 static u32 airoha_ppe_get_timestamp(struct airoha_ppe *ppe)
 {
-	u16 timestamp = airoha_fe_rr(ppe->eth, REG_FE_FOE_TS);
-
-	return FIELD_GET(AIROHA_FOE_IB1_BIND_TIMESTAMP, timestamp);
+	return airoha_fe_get(ppe->eth, REG_FE_FOE_TS,
+			     AIROHA_FOE_IB1_BIND_TIMESTAMP);
 }
 
 void airoha_ppe_set_cpu_port(struct airoha_gdm_port *port, u8 ppe_id, u8 fport)

---
base-commit: 790ead9394860e7d70c5e0e50a35b243e909a618
change-id: 20260428-airoha_fe_get-airoha_qdma_get-7a087a23aef4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


