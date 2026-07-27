Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDDFC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nQzsLqBl8zE6x57DDhN2FKu5g/8XVApDzbXi1A1P1w=; b=bkvptTMLsjr5DgMM+2BsC8cx0Y
	05HsD75ilzW+otnyX0t/8lAdJkcyy5JgPn2ywVtILKrU7kHc48I0s4yIsmWmb1YBfinExMWyv7XLX
	o258RIwqrISzjFfbnxNAUqUDM6mPnu6d7E1ynyXIeYAhqqFx6WAu49vsfQ7C3dSzzu8teY8H5HFjj
	3Z0UyfkyPLbSZs4gx7ep7RQcvHO5v9iyFYFISfYi+FPvfhc/DNljaGqd8UU3gtlyCByV3CLRWoFUx
	xEb4gSQHBp2pmjx5ui1CLxuA0HH3nPa3pN674/bHE6TayZk4PHDh8LzyKuxbmWu+mYYlKokZpNjkQ
	EgGD+Fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3n-00000003I8w-1PBO;
	Mon, 27 Jul 2026 16:20:11 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3j-00000003I6T-0ExZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:08 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c888c001628so1740921a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169206; x=1785774006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nQzsLqBl8zE6x57DDhN2FKu5g/8XVApDzbXi1A1P1w=;
        b=O+RG5/Ige4OAY2CKVM3iNh7CnIbzWxGcthA5DFgj1t7UU+j7DqyiRfs+fpQqmM8EHe
         /ohkwEA8gh8EJbNfbFH0fS1V3JqO+ghvIqrVaaYktQnBeuy09mrW0IrOxrHiGPGs5es1
         bPtBoO8AcmkAk+eLAhdtRB45MvUxIf52yta4GEkp6YWtofpJ/s97SxWjQI3uuhsmbtpY
         rFt5URSxrc9W2MvI3FpCuUB/F36ZA5yco0piEZ89geDjxw/G+RMGbUXNA9wyMGJ9gWMQ
         ISa5+8NXWQ2cTC8twXSOf5yyEqAx/aErW9WkEgiDAMBZrvAY9KPtMQPYpOSTd8POT1H0
         VQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169206; x=1785774006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nQzsLqBl8zE6x57DDhN2FKu5g/8XVApDzbXi1A1P1w=;
        b=Sm2NXHdD6D9rM3W6KumI1FDimXlPghyTd3Yi93wptBjGUCP9ITatDDyKxHweQbuJlB
         bF7AQiREMZLXWriqN298PBWOJLJIL6dHmqlK5uMPmOYsunAo6u5ks9ttFVVu2enODpnn
         W5ONOlEDMP+HnTHeKBfYFWn0DCFtFOWmccnHMFeG3yLWolyJZqZgvIfbd0WvDJTTmB+N
         YO5Q6r2KkrpA5tt1/0L+Fk9PPwaSD7idHSMi5cQyGrg8NLYdNEVTYYilECaJpkpCSdll
         D/cQD8KrS6LDvY28V+dn6G9UQcjMpIyaLeKvqPHXJDgmFuLvPARmTZwXXaqq+YrlAmhu
         973A==
X-Forwarded-Encrypted: i=1; AHgh+RroygPOhm1U3c4rPfaFIJj5x94EK6iTH9SDQ6S0TX2DXa9jO23m9EB9S4AzjoHGOQZjregP8VmgQacpYCn7mz3j@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9zi/+POpOfVHccr3BGDOxN8+aLlsgqmTmYOhmCddLKzRTTPDk
	d9PZ+azQXerh2YHsIss7xXBdfDBoxhf6iIxdIlJwOOVWA5h7TCWabLPH
X-Gm-Gg: AR+sD12OHz+KJ2yAkaBiK4jmqV+io6VhQ0jrS7MDURIn4WiQcmuklB/+eht54yaPqnj
	fANPbNXlaOyiUal+t1vNWrhLoATaDP/T7YIPAwj8mld2P6C0kpzVeUFlHjl1Xqvxv+XI0y8dyDz
	MDK2rrZjdh4mWD9usR9tjut8dvNQRUmt2ERnMB11rTdyC3Nci8Q1nkN4EiskP8enBET3Kottp5W
	Dff6A8+aBKMVGhQdohMyGpgLhmyHesD5rfi0dBbWeVhLCHn8ERsEzbnUSjYY17x78whiR9fIvHp
	PTySfMx8H6rhvUadwS82olZuf5qvTGG8tybqKSyIYT/5GwiY3+qP7qNXxMxC36QKqUbHaT4ka1R
	+F61ZiqXD1kMJSmbgWwTUEP/xDGLBvDvT/daDXlMNT8v6MoUb6diVpOjlCrEydspAeXA+ZLQ=
X-Received: by 2002:a05:6a00:340b:b0:845:d286:1fa2 with SMTP id d2e1a72fcca58-84e5955e7c8mr7301859b3a.49.1785169206009;
        Mon, 27 Jul 2026 09:20:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:72::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532acee2sm3273714b3a.27.2026.07.27.09.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:05 -0700 (PDT)
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
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	witu@nvidia.com,
	alice.kernel@fastmail.im,
	dtatulea@nvidia.com,
	yoong.siang.song@intel.com,
	martin.lau@kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	leon@kernel.org,
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>
Subject: [PATCH net 6/6] xsk: validate metadata when processing requests
Date: Mon, 27 Jul 2026 09:19:59 -0700
Message-ID: <20260727161959.885642-7-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
References: <20260727161959.885642-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092007_104383_C98C9E95 
X-CRM114-Status: GOOD (  20.21  )
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

The zero-copy path validates TX metadata while obtaining the descriptor
context, then reads it again later when preparing the hardware request.
User space can change the metadata between those operations and bypass the
original validation.

Validate the metadata in xsk_tx_metadata_request() and use the resulting
flags snapshot for every feature check. Read request fields once so all
zero-copy drivers process only values observed after successful
validation.

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
Cc: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/intel/igc/igc_main.c     |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en/xdp.c  |  5 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +-
 include/net/libeth/xsk.h                      |  2 +-
 include/net/xdp_sock_drv.h                    | 51 ++++++++++---------
 net/xdp/xsk_buff_pool.c                       |  6 +--
 6 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 5a18d00deb4f..7b6cdc037c00 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -3082,7 +3082,7 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		meta_req.tx_buffer = bi;
 		meta_req.meta = meta;
 		meta_req.used_desc = 0;
-		xsk_tx_metadata_request(&meta, &igc_xsk_tx_metadata_ops,
+		xsk_tx_metadata_request(pool, &meta, &igc_xsk_tx_metadata_ops,
 					&meta_req);
 
 		/* xsk_tx_metadata_request() may have updated next_to_use */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
index dac5e9d4c8bd..77ea51bfbaae 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
@@ -505,7 +505,7 @@ mlx5e_xmit_xdp_frame_mpwqe(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptx
 		 */
 		mlx5e_xdp_mpwqe_session_start(sq);
 		if (meta)
-			xsk_tx_metadata_request(meta,
+			xsk_tx_metadata_request(sq->xsk_pool, meta,
 						&mlx5e_xsk_tx_metadata_ops,
 						&session->wqe->eth);
 	}
@@ -653,7 +653,8 @@ mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
 	sq->pc += num_wqebbs;
 
 	if (meta)
-		xsk_tx_metadata_request(meta, &mlx5e_xsk_tx_metadata_ops, eseg);
+		xsk_tx_metadata_request(sq->xsk_pool, meta,
+					&mlx5e_xsk_tx_metadata_ops, eseg);
 
 	sq->doorbell_cseg = cseg;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f5111969c41..eb666b0bcdd2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2747,8 +2747,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		meta_req.set_ic = &set_ic;
 		meta_req.tbs = tx_q->tbs;
 		meta_req.edesc = &tx_q->dma_entx[entry];
-		xsk_tx_metadata_request(&meta, &stmmac_xsk_tx_metadata_ops,
-					&meta_req);
+		xsk_tx_metadata_request(pool, &meta,
+					&stmmac_xsk_tx_metadata_ops, &meta_req);
 		if (set_ic) {
 			tx_q->tx_count_frames = 0;
 			stmmac_set_tx_ic(priv, tx_desc);
diff --git a/include/net/libeth/xsk.h b/include/net/libeth/xsk.h
index e2fa6bf6b1b3..5dcc0d7f65b7 100644
--- a/include/net/libeth/xsk.h
+++ b/include/net/libeth/xsk.h
@@ -205,7 +205,7 @@ __libeth_xsk_xmit_fill_buf_md(const struct xdp_desc *xdesc,
 	BUILD_BUG_ON(!__builtin_constant_p(tmo == libeth_xsktmo));
 	tmo = tmo == libeth_xsktmo ? &__libeth_xsktmo : tmo;
 
-	xsk_tx_metadata_request(&ctx.meta, tmo, &desc);
+	xsk_tx_metadata_request(sq->pool, &ctx.meta, tmo, &desc);
 
 	return desc;
 }
diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
index f87c4215673e..b344789f5df8 100644
--- a/include/net/xdp_sock_drv.h
+++ b/include/net/xdp_sock_drv.h
@@ -245,7 +245,7 @@ static inline void *xsk_buff_raw_get_data(struct xsk_buff_pool *pool, u64 addr)
  * details.
  *
  * Return: new &xdp_desc_ctx struct containing desc's DMA address and metadata
- * pointer, if it is present and valid (initialized to %NULL otherwise).
+ * pointer, if it is present (initialized to %NULL otherwise).
  */
 static inline struct xdp_desc_ctx
 xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
@@ -274,54 +274,56 @@ xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
 /**
  *  xsk_tx_metadata_request - Evaluate AF_XDP TX metadata at submission
  *  and call appropriate xsk_tx_metadata_ops operation.
+ *  @pool: pointer to AF_XDP buffer pool, used to validate the metadata
  *  @pmeta: pointer to pointer to AF_XDP metadata area
  *  @ops: pointer to struct xsk_tx_metadata_ops
- *  @priv: pointer to driver-private aread
+ *  @priv: pointer to driver-private area
  *
  *  This function should be called by the networking device when
  *  it prepares AF_XDP egress packet.
  */
-static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
-					   const struct xsk_tx_metadata_ops *ops,
-					   void *priv)
+static inline void
+xsk_tx_metadata_request(const struct xsk_buff_pool *pool,
+			struct xsk_tx_metadata **pmeta,
+			const struct xsk_tx_metadata_ops *ops, void *priv)
 {
 	const struct xsk_tx_metadata *meta = *pmeta;
+	u64 flags;
 
 	if (!meta)
 		return;
 
+	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags))) {
+		*pmeta = NULL;
+		return; /* no way to signal the error to the user */
+	}
+
 	if (ops->tmo_request_launch_time)
-		if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
-			ops->tmo_request_launch_time(meta->request.launch_time,
-						     priv);
+		if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
+			ops->tmo_request_launch_time(
+				READ_ONCE(meta->request.launch_time), priv);
 
 	if (ops->tmo_request_timestamp)
-		if (meta->flags & XDP_TXMD_FLAGS_TIMESTAMP)
+		if (flags & XDP_TXMD_FLAGS_TIMESTAMP)
 			ops->tmo_request_timestamp(priv);
 
 	if (ops->tmo_request_checksum)
-		if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM)
-			ops->tmo_request_checksum(meta->request.csum_start,
-						  meta->request.csum_offset, priv);
+		if (flags & XDP_TXMD_FLAGS_CHECKSUM)
+			ops->tmo_request_checksum(
+				READ_ONCE(meta->request.csum_start),
+				READ_ONCE(meta->request.csum_offset), priv);
 
-	if (!(meta->flags & XDP_TXMD_FLAGS_TIMESTAMP))
+	if (!(flags & XDP_TXMD_FLAGS_TIMESTAMP))
 		*pmeta = NULL;
 }
 
 static inline struct xsk_tx_metadata *
 __xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
 {
-	struct xsk_tx_metadata *meta;
-	u64 flags;
-
 	if (!pool->tx_metadata_len)
 		return NULL;
 
-	meta = data - pool->tx_metadata_len;
-	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
-		return NULL; /* no way to signal the error to the user */
-
-	return meta;
+	return data - pool->tx_metadata_len;
 }
 
 static inline struct xsk_tx_metadata *
@@ -520,9 +522,10 @@ xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
 	return false;
 }
 
-static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
-					   const struct xsk_tx_metadata_ops *ops,
-					   void *priv)
+static inline void
+xsk_tx_metadata_request(const struct xsk_buff_pool *pool,
+			struct xsk_tx_metadata **pmeta,
+			const struct xsk_tx_metadata_ops *ops, void *priv)
 {
 }
 
diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index a4089480b22b..78c14f106395 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -765,11 +765,11 @@ EXPORT_SYMBOL(xp_raw_get_dma);
  * @addr: desc address (from userspace)
  *
  * Helper for getting desc's DMA address and metadata pointer, if present.
- * Saves one call on hotpath, double calculation of the actual address,
- * and inline checks for metadata presence and sanity.
+ * Saves one call on hotpath and double calculation of the actual address.
+ * Metadata is validated later by xsk_tx_metadata_request().
  *
  * Return: new &xdp_desc_ctx struct containing desc's DMA address and metadata
- * pointer, if it is present and valid (initialized to %NULL otherwise).
+ * pointer, if it is present (initialized to %NULL otherwise).
  */
 struct xdp_desc_ctx xp_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
 {
-- 
2.53.0-Meta


