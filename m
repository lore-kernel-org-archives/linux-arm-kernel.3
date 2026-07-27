Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04609C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9LHDNlHqE6dohf7NQwt3shVRUrKsU4ONudBOweUDy0=; b=xZlZ45nHKaDkD6FD/YRxcNe3Ue
	g4LPQUMpvDaXMGNE2H7gUAd68UZYaSGr4jL66e7ypseOlBPqZ9oQEXLixyIKBuFk+vRKZKbch8PG+
	rFkIUVXTUMgzLMp6ikOFSU0/KeSvM3a50sD7BdSNS/XWLq/SkVtb/RDTEbB6r4sO8EdwCvtRrbZ/U
	HrBOLg/tB9AA8hJk2hkAPuWVbljSNSbN3ISJTITUltNY2WLgI0zaz3idcHHqmHd7wVRerwLe+6om6
	o+dzsncFaxqI1ezjHnXKPuzKtbCtsRa0Aoy47cudKaVGek37gQCScjCxJ3e5dKYqSRxhjMVgzJ4XL
	hPZiwf9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3m-00000003I7T-3FNZ;
	Mon, 27 Jul 2026 16:20:10 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3f-00000003I4S-0xyE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:04 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-37fb1883f59so978120a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169202; x=1785774002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c9LHDNlHqE6dohf7NQwt3shVRUrKsU4ONudBOweUDy0=;
        b=nm4O/fsq7hSflVfoIZkBidJGPWzVABmDuPHRWjUc+pdPoRB6z4rDguK/1taDygoLQZ
         4yUUzVwhz5Mt1EG7Bfw46dkCaceDqbSckQxFmfz5VcyGKYy2ISwm/ugwkJmxFwonaWqt
         bFOQk4DQEIo0atX+g9ttqNx/I0HQyMLQMZamDkUiNeWnDmg+3rOJXctoDBPLo139Yd4U
         Icqesc9099DkNsJiRcE5ZGd6p+/ZzXZQzwna16eM9LOAjrmbGj2qrMx78TnZLbmX/LjG
         3yp2mrzZs7jIzrBNMBClYMXKHtP9T73Mz4fqDNVJr94lRaBNgW4A0cEoRGnvdPkpyjxj
         736A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169202; x=1785774002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c9LHDNlHqE6dohf7NQwt3shVRUrKsU4ONudBOweUDy0=;
        b=bD3vZeY5DRy9lHgF5ezq0QBIRC5yhyJtmpNyj2ljqvYyWFJeAq1aq5jCmLdOcSCqgT
         1Ndt1eYLQUnrz4iXFYlU0S+ox5lErW9wQjnBERZC9W3vvMttTWY0izyKi5piMwgscQMI
         vbjadk4zUKqDFjwuazaiToS05BS0uMOCFm2Ph5ZzTrMxVzTPDrdWtc7HR6NtFiNrkwpc
         /mGzbWwQB7a/akowvb+ogHMYV4tvcdJQEHAmw4kp+UVwBZvbNQEVGufI65cePOrwG5Ea
         vT+gY7GNIOTpqWYAkBAgoTV+B1BCe6Rcbu/1Lm3/2cJCB17gf8vLQjdVdhpQuQG9yr4W
         yyDw==
X-Forwarded-Encrypted: i=1; AHgh+Rrr71k1ID15Xjei28NoAcLuxsmQYpVmwCXSf2wUg7rmMBp1HEYqLdOP9S9kg+7TIUvYed+V0JbdBJXUdEe9mNrU@lists.infradead.org
X-Gm-Message-State: AOJu0YwqN+VDjN64Io+nixbXNaMw9YExOAFLXQwjPLfuFBDFVVOgIy+4
	lls2C5Xm6SBcMdB5Z1QUjjWb8cU3u7Hw7ALZi4IT11rPVMi388PkptJU
X-Gm-Gg: AR+sD12GMf4ba9jeRFlXljGaO2I6relHaoYeN3E/6nUdUlyi9f8wsBCS+DabhpGzqz4
	gbgJXenQYkxU9W+Iwej37CcAFzVtLF7x4bO8xmkBKfQTHcmccQ0gM6cBikcrZmPr2rKYDUI9kKG
	Ko3Yt5/OejgZ9eBZUQdCVDHOdiesVft5bNXTewiWCmxZ/WeG6U4/Q0lKUii316o+QQLxhK42WfJ
	iif4LulshjlnkPijYyNpFzJs8UvIWbmaPie+eXOmwsc5tsURajkYC4Wq09DWVmu025/0JHSiCYU
	zQgDneaAKK19ZHYA2SjmsPB7KcSZCxSr9YVNdA+62OjL5g3xisBCcM+d4mjYdyPAygAip2xi74p
	vyqeHNPu0F2XQ17zww4DWNdLvuFYLkJB5ZmE6OYjCDhhUJF1nzT6oocGTYajrPKU2mwc=
X-Received: by 2002:a17:90a:e7c2:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38f295bd06fmr8359252a91.23.1785169202185;
        Mon, 27 Jul 2026 09:20:02 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6411189bsm74325a91.3.2026.07.27.09.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:01 -0700 (PDT)
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
Subject: [PATCH net 2/6] xsk: pass TX metadata pointer by reference
Date: Mon, 27 Jul 2026 09:19:55 -0700
Message-ID: <20260727161959.885642-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
References: <20260727161959.885642-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092003_298955_85522457 
X-CRM114-Status: GOOD (  17.77  )
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

Completion handling needs to know whether a timestamp was requested when
the metadata was processed. Let xsk_tx_metadata_request() update the
caller's metadata pointer so that decision can be carried forward without
rereading user-controlled flags.

This only changes the interface; behavior remains unchanged.

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
Cc: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/intel/igc/igc_main.c          |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h       |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c   | 14 +++++++++-----
 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h   |  4 ++--
 .../net/ethernet/mellanox/mlx5/core/en/xsk/tx.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  2 +-
 include/net/libeth/xsk.h                           |  2 +-
 include/net/xdp_sock.h                             |  8 +++++---
 8 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 2c9e2dfd8499..5a18d00deb4f 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -3082,7 +3082,7 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
 		meta_req.tx_buffer = bi;
 		meta_req.meta = meta;
 		meta_req.used_desc = 0;
-		xsk_tx_metadata_request(meta, &igc_xsk_tx_metadata_ops,
+		xsk_tx_metadata_request(&meta, &igc_xsk_tx_metadata_ops,
 					&meta_req);
 
 		/* xsk_tx_metadata_request() may have updated next_to_use */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en.h b/drivers/net/ethernet/mellanox/mlx5/core/en.h
index d507289096c2..e12cb41c4b97 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en.h
@@ -483,7 +483,7 @@ typedef int (*mlx5e_fp_xmit_xdp_frame_check)(struct mlx5e_xdpsq *);
 typedef bool (*mlx5e_fp_xmit_xdp_frame)(struct mlx5e_xdpsq *,
 					struct mlx5e_xmit_data *,
 					int,
-					struct xsk_tx_metadata *);
+					struct xsk_tx_metadata **);
 
 struct mlx5e_xdpsq {
 	/* data path */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
index d8c7cb8837d7..dac5e9d4c8bd 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
@@ -452,11 +452,11 @@ INDIRECT_CALLABLE_SCOPE int mlx5e_xmit_xdp_frame_check_mpwqe(struct mlx5e_xdpsq
 
 INDIRECT_CALLABLE_SCOPE bool
 mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
-		     int check_result, struct xsk_tx_metadata *meta);
+		     int check_result, struct xsk_tx_metadata **meta);
 
 INDIRECT_CALLABLE_SCOPE bool
 mlx5e_xmit_xdp_frame_mpwqe(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
-			   int check_result, struct xsk_tx_metadata *meta)
+			   int check_result, struct xsk_tx_metadata **meta)
 {
 	struct mlx5e_tx_mpwqe *session = &sq->mpwqe;
 	struct mlx5e_xdpsq_stats *stats = sq->stats;
@@ -504,7 +504,10 @@ mlx5e_xmit_xdp_frame_mpwqe(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptx
 		 * and it's safe to complete it at any time.
 		 */
 		mlx5e_xdp_mpwqe_session_start(sq);
-		xsk_tx_metadata_request(meta, &mlx5e_xsk_tx_metadata_ops, &session->wqe->eth);
+		if (meta)
+			xsk_tx_metadata_request(meta,
+						&mlx5e_xsk_tx_metadata_ops,
+						&session->wqe->eth);
 	}
 
 	mlx5e_xdp_mpwqe_add_dseg(sq, p, stats);
@@ -535,7 +538,7 @@ INDIRECT_CALLABLE_SCOPE int mlx5e_xmit_xdp_frame_check(struct mlx5e_xdpsq *sq)
 
 INDIRECT_CALLABLE_SCOPE bool
 mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
-		     int check_result, struct xsk_tx_metadata *meta)
+		     int check_result, struct xsk_tx_metadata **meta)
 {
 	struct mlx5e_xmit_data_frags *xdptxdf =
 		container_of(xdptxd, struct mlx5e_xmit_data_frags, xd);
@@ -649,7 +652,8 @@ mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq, struct mlx5e_xmit_data *xdptxd,
 
 	sq->pc += num_wqebbs;
 
-	xsk_tx_metadata_request(meta, &mlx5e_xsk_tx_metadata_ops, eseg);
+	if (meta)
+		xsk_tx_metadata_request(meta, &mlx5e_xsk_tx_metadata_ops, eseg);
 
 	sq->doorbell_cseg = cseg;
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h
index 3c54f8962664..5b8f4094d553 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.h
@@ -114,11 +114,11 @@ extern const struct xsk_tx_metadata_ops mlx5e_xsk_tx_metadata_ops;
 INDIRECT_CALLABLE_DECLARE(bool mlx5e_xmit_xdp_frame_mpwqe(struct mlx5e_xdpsq *sq,
 							  struct mlx5e_xmit_data *xdptxd,
 							  int check_result,
-							  struct xsk_tx_metadata *meta));
+							  struct xsk_tx_metadata **meta));
 INDIRECT_CALLABLE_DECLARE(bool mlx5e_xmit_xdp_frame(struct mlx5e_xdpsq *sq,
 						    struct mlx5e_xmit_data *xdptxd,
 						    int check_result,
-						    struct xsk_tx_metadata *meta));
+						    struct xsk_tx_metadata **meta));
 INDIRECT_CALLABLE_DECLARE(int mlx5e_xmit_xdp_frame_check_mpwqe(struct mlx5e_xdpsq *sq));
 INDIRECT_CALLABLE_DECLARE(int mlx5e_xmit_xdp_frame_check(struct mlx5e_xdpsq *sq));
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c
index 8aeab4b21035..3d19dad8f868 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/tx.c
@@ -105,7 +105,7 @@ bool mlx5e_xsk_tx(struct mlx5e_xdpsq *sq, unsigned int budget)
 
 		ret = INDIRECT_CALL_2(sq->xmit_xdp_frame, mlx5e_xmit_xdp_frame_mpwqe,
 				      mlx5e_xmit_xdp_frame, sq, &xdptxd,
-				      check_result, meta);
+				      check_result, &meta);
 		if (unlikely(!ret)) {
 			if (sq->mpwqe.wqe)
 				mlx5e_xdp_mpwqe_complete(sq);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 151c77713025..3f5111969c41 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2747,7 +2747,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		meta_req.set_ic = &set_ic;
 		meta_req.tbs = tx_q->tbs;
 		meta_req.edesc = &tx_q->dma_entx[entry];
-		xsk_tx_metadata_request(meta, &stmmac_xsk_tx_metadata_ops,
+		xsk_tx_metadata_request(&meta, &stmmac_xsk_tx_metadata_ops,
 					&meta_req);
 		if (set_ic) {
 			tx_q->tx_count_frames = 0;
diff --git a/include/net/libeth/xsk.h b/include/net/libeth/xsk.h
index 82b5d21aae87..e2fa6bf6b1b3 100644
--- a/include/net/libeth/xsk.h
+++ b/include/net/libeth/xsk.h
@@ -205,7 +205,7 @@ __libeth_xsk_xmit_fill_buf_md(const struct xdp_desc *xdesc,
 	BUILD_BUG_ON(!__builtin_constant_p(tmo == libeth_xsktmo));
 	tmo = tmo == libeth_xsktmo ? &__libeth_xsktmo : tmo;
 
-	xsk_tx_metadata_request(ctx.meta, tmo, &desc);
+	xsk_tx_metadata_request(&ctx.meta, tmo, &desc);
 
 	return desc;
 }
diff --git a/include/net/xdp_sock.h b/include/net/xdp_sock.h
index 8b51876efbed..06c081feff42 100644
--- a/include/net/xdp_sock.h
+++ b/include/net/xdp_sock.h
@@ -153,17 +153,19 @@ static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
 /**
  *  xsk_tx_metadata_request - Evaluate AF_XDP TX metadata at submission
  *  and call appropriate xsk_tx_metadata_ops operation.
- *  @meta: pointer to AF_XDP metadata area
+ *  @pmeta: pointer to pointer to AF_XDP metadata area
  *  @ops: pointer to struct xsk_tx_metadata_ops
  *  @priv: pointer to driver-private aread
  *
  *  This function should be called by the networking device when
  *  it prepares AF_XDP egress packet.
  */
-static inline void xsk_tx_metadata_request(const struct xsk_tx_metadata *meta,
+static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
 					   const struct xsk_tx_metadata_ops *ops,
 					   void *priv)
 {
+	const struct xsk_tx_metadata *meta = *pmeta;
+
 	if (!meta)
 		return;
 
@@ -231,7 +233,7 @@ static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
 {
 }
 
-static inline void xsk_tx_metadata_request(struct xsk_tx_metadata *meta,
+static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
 					   const struct xsk_tx_metadata_ops *ops,
 					   void *priv)
 {
-- 
2.53.0-Meta


