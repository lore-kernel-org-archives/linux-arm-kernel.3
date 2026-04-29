Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D2FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 10:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WqlsWZXRQIWWzfNJOLpX5udq2g9tw8JRh6i99gNGX4c=; b=zbZC6zz52JEDnrg7gOangcvczl
	qYPUt2M3/DgUdHo7HSuhRF+FNE0EHOwtEpdbFTYLvGPQZEZ71yuK+sbksSG7tdMYuO6+Dikune5Bk
	0CrDsyYR2Uw5oxyc1HAwAPn91eWzDzL0LZM9xKeEsOVMgqZpxQF6S6LG5rDLtggXKxlmLkiSW59Ns
	vLIT8jLwkH/h5+YZysoU84I7lPLIYLK1V6AB1c8LryZPT1v5xlombPQ+pyewb3IV3SYgBv9K6q1GJ
	LiaAb2rrvmaMOJsWUrEH8MujeVHPjnlGgHtuhiDkl0zLPtQRLz1QxQKQn+iSjyEG2aisVaFuDUTri
	nWUcTfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2ZB-00000003UKK-3svr;
	Wed, 29 Apr 2026 10:54:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2Z8-00000003UJw-2m8z;
	Wed, 29 Apr 2026 10:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2F7B405C3;
	Wed, 29 Apr 2026 10:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52051C19425;
	Wed, 29 Apr 2026 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777460089;
	bh=om1Fe7It+6J1z9grQKr36pV/sKz2OmpOHZfAVAT8vfU=;
	h=From:Date:Subject:To:Cc:From;
	b=CwijJHAhARN5SzP09kYc9FoF7yhLEfR4u/L1YPM0Tx8xoT9ZNWwzmjVfrXl3waY2H
	 XZ3sybKb3+VU5sw9h5RQD0hE8o8OXW1umNXFCBW19kkynkuOtUO99k8PFuYOzjUqdW
	 8X7N7/8P7nP0cHS9pB/5FJJ7VqG0MMuCHbi+GAKnev6SuVcw/fuw/JR5Tn1U/7SL0f
	 mFegwc2neebWMSVFT9ULuWOMUH+AXmCqR7C0aPBbKaRImuuKrqu7eBXpFZERH5PzPO
	 yLYesYkvYfoesZOHiD4GnIpMXi5RBoNEeE6hAHbFgFiot56iDFh0rv1aO8Yn2XSLlU
	 Mb63Twzlwo0vQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 29 Apr 2026 12:54:32 +0200
Subject: [PATCH net-next v2] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-airoha_fe_get-airoha_qdma_get-v2-1-909e791f1dc0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBBFryKzborGoNJV71FERp3o0DZpJyIW8
 e4Nge67fLzP+zsEEqYAl2wHoZUDexdBnzIYZnQTKR4jg851lRvdKGTxM3aWuomWH73HJyauMW9
 q1CWSNRAbLyHLW+rfwMWBo22BNpqZw+Llk47XIvk/P9ZCFaoabD9Sb3RtyuudxNHj7GWC9jiOL
 1izSnzVAAAA
X-Change-ID: 20260428-airoha_fe_get-airoha_qdma_get-7a087a23aef4
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_035450_746101_AA3E0C26 
X-CRM114-Status: GOOD (  10.24  )
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
Changes in v2:
- Fix typo in airoha_qdma_get() definition.
- Link to v1: https://lore.kernel.org/r/20260428-airoha_fe_get-airoha_qdma_get-v1-1-6cfbdeb42743@kernel.org
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
index e389d2fe3b86..eda888593f94 100644
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
+#define airoha_qdma_get(qdma, offset, mask)			\
+	FIELD_GET((mask), airoha_qdma_rr((qdma), (offset)))
 
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
base-commit: 09942ddedcb960f9e78fd817ec33f501d1040c5b
change-id: 20260428-airoha_fe_get-airoha_qdma_get-7a087a23aef4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


