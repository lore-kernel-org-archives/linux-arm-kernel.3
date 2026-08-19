Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DC6C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knHPZ2hqDlF6r7lICpyiSankCSnQUl1ZecmnK0yjr1w=; b=tizIvRbVKCHSJ34XRf1CaHHDaM
	BnSK+lZzSrog462aQTsMUfaPmUa16HPciLg3PsOiktpBnuRFq0nmaALAqy8CPzwERO94WUUM9CY2E
	taQ6K3ctf025B2ZqkcEheGG0WRumizKjErSB7O1XJhczU4vGge65pSOmHf/2ZMq7VZPKSapEYNZXJ
	nKGWuZ9XXgmm3iKfXYWYEooUmlwltAWj/CNM7gWQNuW1pvZyyIBX67qW1buy9nuQkWcvdWO695wLp
	nJ0Wu9dobJn7jWuWQSekkEknLf6IlSj0tcRygcM/DOvcP90hqO7iGwgg5x2cgPU80F15ag4Nqvzw4
	kMCcJy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwioF-0000000A94W-1BMl;
	Wed, 19 Aug 2026 16:06:35 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwinN-0000000A8vr-1DSN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:06:28 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so388106a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787155540; x=1787760340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knHPZ2hqDlF6r7lICpyiSankCSnQUl1ZecmnK0yjr1w=;
        b=et805z8oD/SZgv6v4apMEiJUQ5ia/JRzNTljC0OEktJ+/m/QNkGAaNx48U43X78Rq7
         nX6IU/tsM2etvfgF0dZebWAjlty3C47lGk0qAQOJySC4o49Ga28VPa/v8k7ERgowDrAa
         tGCmMbXdeLYCPKo2PSAJddDweaFFrp3M0rjqMeiX94sL/i+dVjug/YYBhmfDdQtJxAfT
         gFeEHnXTqhGZZcKsaKleWWiVMhXRFQrn0crN+Msbsoha67uRKOzD/ijkYLmj2PNuO8bP
         dYopEfMPC8IrpJ9x7MUPfMzAwEzzIZc/23yeOBILEwh2OkB732j5V/hvbNaMHDlGmNYl
         7sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155540; x=1787760340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=knHPZ2hqDlF6r7lICpyiSankCSnQUl1ZecmnK0yjr1w=;
        b=ZQGEjX2JCEnxDbyCJDoCSncXE/xF40YsMvIDW/Nucq6QCXlb7z/Jpj8UOGPQekD8Ss
         orIwbOh3rwd6Qy6FcU5wgGVSIXBcClK3yjev+Y1fbhwrow4blUZe/DO5Njj7Y6ocozdL
         Re0Vw73L4sHBHcT3JXQjM8AwTN1B4Wo2kqvr5nviMsYqoSXm24CV3RNKskC7dBjp5zUk
         tL6LwrHQa6fZuy2swe0qY39u21jjRYpImJsKknbaIqmNDzBxVz70kWykwpyRDZ5rHdkm
         2SW47zq6Gw9z+oWLJrTQj8HlqA4NPlnRdlVUgl9EZICtASZESWoKpvKby2MjJOlc3mXP
         tRnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoDPVifLW10ffrkXSu6ourPp6DsDhPkhDEX9uMJ7AoseTS4tYqBNwWj1B8BImLkA/0z5HMGJVp4xSgFpHX2mBE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8pbTUEIo9MDlsN1paLALzv8nbTRoCMrj6bqSsBL8MjMMl6YJW
	mQ9Q4PvOZiyK/y3fAt/r50WtlW/LhRZBrUj9yvGPCSl+CS7Y+sb1QoxD
X-Gm-Gg: AR+sD115dHM0TygmcPX0WZxDJM6siWFHuDqT/HoVkPzFWoTfpOJ9UP3nzp2LHbMLR0F
	b2+2hBm9qfVuAAmH1j90IMhyClYOA0eCZe8oL2Jw9UOGlE5fvdfX1TMjKvDrQyHM3l8iDpjc9KS
	HWG3AsNxFSsW0lZpvHWl+qTzbwvoGFfkIi0T22gQX89V9g0S9flsbLAuUipnSkngmMx6LdERyxP
	gHqhDVR7FqbXyy2yGaIcimlG4V3JBqAVO5Kor9bvJ5/UKENUSrswzN2GyRhhCFnB5KHNqWhYv06
	q2wNwdL39Xb0MrC2ONomzt5sbDOlZV80l0MpmkENtAO280uHtwbeTFRhF2psrsCx0AzXwEXlI6V
	N1u4llv41YgFZKNP4hJsxN+s4IaVRzQdDKokc+4s7Chkvtl1rTPVIccWpV9Sx/qZrAiyQKKlT4V
	DCyZjlLORpdWtXNI45K+44lDlBVeOVPa/n+Qs/ZbM0G4uFI7U5zUbOuB6d6sqTNYZT
X-Received: by 2002:a05:6a00:bd90:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-851d3481104mr8568063b3a.0.1787155540004;
        Wed, 19 Aug 2026 09:05:40 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:46::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d33b82bbsm857116b3a.24.2026.08.19.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:05:39 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	guoren@kernel.org,
	dtatulea@nvidia.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-csky@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v3 2/3] xsk: honor XDP_TX_METADATA in zero-copy path
Date: Wed, 19 Aug 2026 09:05:34 -0700
Message-ID: <20260819160535.1472459-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819160535.1472459-1-sdf@fomichev.me>
References: <20260819160535.1472459-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_090541_360028_C8E86E50 
X-CRM114-Status: GOOD (  16.89  )
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

The zero-copy path reads TX metadata whenever the UMEM has metadata space,
even if the descriptor does not set XDP_TX_METADATA. Pass descriptor
options through the metadata helpers and ignore metadata unless the option
is set.

This does not fix the existing per-WQE metadata handling for mlx5 MPWQEs.
Only the descriptor that starts a session passes through
xsk_tx_metadata_request() and configures offload state shared by the batch.
Metadata on descriptors joining an open session is therefore not validated
and does not configure its requested offloads. In addition, a non-NULL
metadata pointer from such a descriptor is treated as a timestamp
completion request even when XDP_TXMD_FLAGS_TIMESTAMP is not set, so its
metadata union can be overwritten with an unrequested timestamp. Fixing
mixed metadata states within one MPWQE requires a separate change.

Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/intel/igc/igc_main.c     |  3 ++-
 .../ethernet/mellanox/mlx5/core/en/xsk/tx.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  3 ++-
 include/net/libeth/xsk.h                      |  2 +-
 include/net/xdp_sock_drv.h                    | 22 +++++++++++--------
 include/net/xsk_buff_pool.h                   |  3 ++-
 net/xdp/xsk_buff_pool.c                       |  7 ++++--
 7 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 39043d8ca1bf..59067939a586 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -3074,7 +3074,8 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		olinfo_status = xdp_desc.len << IGC_ADVTXD_PAYLEN_SHIFT;
 
 		dma = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
-		meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
+		meta = xsk_buff_get_metadata(pool, xdp_desc.addr,
+					     xdp_desc.options);
 		xsk_buff_raw_dma_sync_for_device(pool, dma, xdp_desc.len);
 		bi = &ring->tx_buffer_info[ntu];
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c
index 3d19dad8f868..d194eeddd7b5 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c
@@ -99,7 +99,7 @@ bool mlx5e_xsk_tx(struct mlx5e_xdpsq *sq, unsigned int budget)
 		xdptxd.dma_addr = xsk_buff_raw_get_dma(pool, desc.addr);
 		xdptxd.data = xsk_buff_raw_get_data(pool, desc.addr);
 		xdptxd.len = desc.len;
-		meta = xsk_buff_get_metadata(pool, desc.addr);
+		meta = xsk_buff_get_metadata(pool, desc.addr, desc.options);
 
 		xsk_buff_raw_dma_sync_for_device(pool, xdptxd.dma_addr, xdptxd.len);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a71f0df26378..62de03e65a90 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2719,7 +2719,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 		tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
-		meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
+		meta = xsk_buff_get_metadata(pool, xdp_desc.addr,
+					     xdp_desc.options);
 		xsk_buff_raw_dma_sync_for_device(pool, dma_addr, xdp_desc.len);
 
 		/* To return XDP buffer to XSK pool, we simple call
diff --git a/include/net/libeth/xsk.h b/include/net/libeth/xsk.h
index 5dcc0d7f65b7..a452b7828ce4 100644
--- a/include/net/libeth/xsk.h
+++ b/include/net/libeth/xsk.h
@@ -196,7 +196,7 @@ __libeth_xsk_xmit_fill_buf_md(const struct xdp_desc *xdesc,
 	struct libeth_xdp_tx_desc desc;
 	struct xdp_desc_ctx ctx;
 
-	ctx = xsk_buff_raw_get_ctx(sq->pool, xdesc->addr);
+	ctx = xsk_buff_raw_get_ctx(sq->pool, xdesc->addr, xdesc->options);
 	desc = (typeof(desc)){
 		.addr	= ctx.dma,
 		__libeth_xdp_tx_len(xdesc->len),
diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
index b344789f5df8..d94aeb506379 100644
--- a/include/net/xdp_sock_drv.h
+++ b/include/net/xdp_sock_drv.h
@@ -240,6 +240,7 @@ static inline void *xsk_buff_raw_get_data(struct xsk_buff_pool *pool, u64 addr)
  * xsk_buff_raw_get_ctx - get &xdp_desc context
  * @pool: XSk buff pool desc address belongs to
  * @addr: desc address (from userspace)
+ * @options: desc options (from userspace)
  *
  * Wrapper for xp_raw_get_ctx() to be used in drivers, see its kdoc for
  * details.
@@ -248,9 +249,9 @@ static inline void *xsk_buff_raw_get_data(struct xsk_buff_pool *pool, u64 addr)
  * pointer, if it is present (initialized to %NULL otherwise).
  */
 static inline struct xdp_desc_ctx
-xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
+xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr, u32 options)
 {
-	return xp_raw_get_ctx(pool, addr);
+	return xp_raw_get_ctx(pool, addr, options);
 }
 
 #define XDP_TXMD_FLAGS_VALID ( \
@@ -318,18 +319,20 @@ xsk_tx_metadata_request(const struct xsk_buff_pool *pool,
 }
 
 static inline struct xsk_tx_metadata *
-__xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
+__xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data,
+			unsigned int options)
 {
-	if (!pool->tx_metadata_len)
+	if (!pool->tx_metadata_len || !(options & XDP_TX_METADATA))
 		return NULL;
 
 	return data - pool->tx_metadata_len;
 }
 
 static inline struct xsk_tx_metadata *
-xsk_buff_get_metadata(struct xsk_buff_pool *pool, u64 addr)
+xsk_buff_get_metadata(struct xsk_buff_pool *pool, u64 addr, u32 options)
 {
-	return __xsk_buff_get_metadata(pool, xp_raw_get_data(pool, addr));
+	return __xsk_buff_get_metadata(pool, xp_raw_get_data(pool, addr),
+				       options);
 }
 
 static inline void xsk_buff_dma_sync_for_cpu(struct xdp_buff *xdp)
@@ -510,7 +513,7 @@ static inline void *xsk_buff_raw_get_data(struct xsk_buff_pool *pool, u64 addr)
 }
 
 static inline struct xdp_desc_ctx
-xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
+xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr, u32 options)
 {
 	return (struct xdp_desc_ctx){ };
 }
@@ -530,13 +533,14 @@ xsk_tx_metadata_request(const struct xsk_buff_pool *pool,
 }
 
 static inline struct xsk_tx_metadata *
-__xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
+__xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data,
+			unsigned int options)
 {
 	return NULL;
 }
 
 static inline struct xsk_tx_metadata *
-xsk_buff_get_metadata(struct xsk_buff_pool *pool, u64 addr)
+xsk_buff_get_metadata(struct xsk_buff_pool *pool, u64 addr, u32 options)
 {
 	return NULL;
 }
diff --git a/include/net/xsk_buff_pool.h b/include/net/xsk_buff_pool.h
index 2bb1d122b1bc..a7df573784fd 100644
--- a/include/net/xsk_buff_pool.h
+++ b/include/net/xsk_buff_pool.h
@@ -154,7 +154,8 @@ struct xdp_desc_ctx {
 	struct xsk_tx_metadata *meta;
 };
 
-struct xdp_desc_ctx xp_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr);
+struct xdp_desc_ctx xp_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr,
+				   u32 options);
 
 static inline dma_addr_t xp_get_dma(struct xdp_buff_xsk *xskb)
 {
diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 78c14f106395..9d2d94f1fb75 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -763,6 +763,7 @@ EXPORT_SYMBOL(xp_raw_get_dma);
  * xp_raw_get_ctx - get &xdp_desc context
  * @pool: XSk buff pool desc address belongs to
  * @addr: desc address (from userspace)
+ * @options: desc options (from userspace)
  *
  * Helper for getting desc's DMA address and metadata pointer, if present.
  * Saves one call on hotpath and double calculation of the actual address.
@@ -771,14 +772,16 @@ EXPORT_SYMBOL(xp_raw_get_dma);
  * Return: new &xdp_desc_ctx struct containing desc's DMA address and metadata
  * pointer, if it is present (initialized to %NULL otherwise).
  */
-struct xdp_desc_ctx xp_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
+struct xdp_desc_ctx xp_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr,
+				   u32 options)
 {
 	struct xdp_desc_ctx ret;
 
 	addr = __xp_raw_get_addr(pool, addr);
 
 	ret.dma = __xp_raw_get_dma(pool, addr);
-	ret.meta = __xsk_buff_get_metadata(pool, __xp_raw_get_data(pool, addr));
+	ret.meta = __xsk_buff_get_metadata(pool, __xp_raw_get_data(pool, addr),
+					   options);
 
 	return ret;
 }
-- 
2.53.0-Meta


