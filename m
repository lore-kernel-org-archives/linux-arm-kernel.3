Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318A0C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOKl9cuatMBwnsyU1wJ+nM+sSfz+zrZVzuTsvqWf2Wk=; b=WUWxXmHpNZ6saMWOOWBLNksOI9
	R8e6fWMNFmC9EX8RCaymJW7jTwBjanRaxPxgcCMDVCkHLg9kr6voOhUnYcMDRIMriv3ogBnMC0MUK
	XnhASKOspw2THRVP5OefXxNWBm1ekt8ZjlLnh/C3IY5XhCiNHr+rWfCtp91pkgsACqeaHCtpxix3H
	jMkt1+zS/i967lNLlDSToWWxZjTAlC0L6K1h9wmGXh+xnaFkvGRytjGYCSa2qgFVw6F+RRv+jR7g1
	9nV1sdYOcP767XlEnp6VXtnVBjMwazDGqKkeV6jFHRFG3xe5l6qciq+vWFs/41x6UdCVZlKhILJmn
	ecj//8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3n-00000003I8U-0jbv;
	Mon, 27 Jul 2026 16:20:11 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3i-00000003I5z-00Ua
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:07 +0000
Received: by mail-pj2-x02.google.com with SMTP id 98e67ed59e1d1-3896ccc93b5so1063388a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169205; x=1785774005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOKl9cuatMBwnsyU1wJ+nM+sSfz+zrZVzuTsvqWf2Wk=;
        b=V+j4erGa5jtwI9oichP66RzOmFMvXQtVsvlg/ZyJdTV4OL0twj/b/FMNaZU2ixKRw4
         YvABcwHNJpNCgbpMJ89D1zkgjlG16OciCW5HxJ/ccppiS6y1mRG32OLflaJK0voG+ts3
         kjuOfPfwake6PqM0jRVoW7BxOL5MRAkqVR/VXoGXiLCbfGtDj1r08DtejEN9TElB83Mi
         0vEpMKEnYG+cTPputBgF7qvfPXmNKkoOEVoHfvtbz/cn7CIZYSAOF/V4+SbKSzXuo+cO
         sS/5gTXe2wfbkWrBAp+hX1EtLR0BJgpMAiCa+U0IzFD0NoIXNdLlT+ubbIiREWK8l9ts
         lbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169205; x=1785774005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOKl9cuatMBwnsyU1wJ+nM+sSfz+zrZVzuTsvqWf2Wk=;
        b=efYXMS3obc3ldY5UWJMkgbT10uV+8lD9S3S0WLWuDpwO6lmelwtYaascnx3w5bKUwd
         71dBFOfRwzvH0oSuSKayjPYo9QPfg8pSd5Z6LWprpRf8NaLFEvxhPJy+II2BjAoieYUZ
         o/pqPUiKb1GuxRrfisNaXtVX0f1CqidwutiNeYQDe3OfzPDLl1MxMaRzKvqpVLFa97bp
         84jNtBPkRKP/yof8GDK2ONM89Bbq4dI4uU8polx/EtioQT+iErSJ87tKGg7TKG60lXux
         r6fqw1ji14qHdwQ+DHdNa+rBpR9LtTxX4D1P0Fo4rSTYAH9MijzS8FGkRD3RwPh+jFQL
         TXDw==
X-Forwarded-Encrypted: i=1; AHgh+RpG0ZOVNmgiHgNCQ3a9Ypsd7suMi6rQxsg/pj7OcSO4HW+FMIFjdutIi+pjsMGbpA+gjE4+KY+vInCkZ5C9zrcD@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHNOhBWQI5SGJ3cbu7c6jxJTm3q/aghN/WfLXlEaTiUK1f7ux
	DYpPc5VSiCJuhERrQq+VSMlbl65FKoThsoC3gmDYp+sal7v37b7Hxom4
X-Gm-Gg: AR+sD10ayrDHrfCy3xgprClSK7sU/GlX4dVgY7m0CQE7Ph/u17z4YLeGPgvnthrbsGO
	nUHpqeoMjTIAOuDRIBpzvvP+KKwQwbwO1yOQP02bB/cWhtzgopVLIdfA+6a90ZP6N5LaCD+Og6U
	vOLmPsWjV8zVBx9eB0627CSiR+zXezIx+1Q31BLq+Z+9pdzTnmZL8XUjiMpCJqEXYM3UGfxnGeu
	h/FXmu6rVK9rKts4nIXs3S7SKkowE3ck0yCl+4j2jMBV5WXAC4SHEzASl6YID+dFT4lMWnjx8wX
	KqQ4SfR9D+e0Ncn5L4x/KQOsV9tpGTk5j3JKWzUwJRf65Ub1lm6Afp3qVS6xZEvhk1X9G6XeFuD
	otYnZ+EL2Qxs3rI9WtM4K6OJNMll7BvEiCAdPymkVQAJsxbQdpreNQ2jF+8+dR4gKeGQNYIQ=
X-Received: by 2002:a17:90b:5826:b0:38e:7268:220c with SMTP id 98e67ed59e1d1-38f2966033emr8517144a91.32.1785169204964;
        Mon, 27 Jul 2026 09:20:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64150874sm75066a91.16.2026.07.27.09.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:04 -0700 (PDT)
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
Subject: [PATCH net 5/6] xsk: move xsk_tx_metadata_request() to xdp_sock_drv.h
Date: Mon, 27 Jul 2026 09:19:58 -0700
Message-ID: <20260727161959.885642-6-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
References: <20260727161959.885642-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092006_045630_127D7730 
X-CRM114-Status: GOOD (  14.31  )
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

xsk_tx_metadata_request() must validate metadata with
xsk_buff_valid_tx_metadata(), which is defined in xdp_sock_drv.h. Move the
helper there before adding that dependency. All callers already include
the destination header, so this has no functional effect.

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
Cc: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/net/xdp_sock.h     | 43 --------------------------------------
 include/net/xdp_sock_drv.h | 43 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/include/net/xdp_sock.h b/include/net/xdp_sock.h
index 2b2eb9b9d580..6e70b320b399 100644
--- a/include/net/xdp_sock.h
+++ b/include/net/xdp_sock.h
@@ -153,43 +153,6 @@ static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
 	compl->tx_timestamp = &meta->completion.tx_timestamp;
 }
 
-/**
- *  xsk_tx_metadata_request - Evaluate AF_XDP TX metadata at submission
- *  and call appropriate xsk_tx_metadata_ops operation.
- *  @pmeta: pointer to pointer to AF_XDP metadata area
- *  @ops: pointer to struct xsk_tx_metadata_ops
- *  @priv: pointer to driver-private aread
- *
- *  This function should be called by the networking device when
- *  it prepares AF_XDP egress packet.
- */
-static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
-					   const struct xsk_tx_metadata_ops *ops,
-					   void *priv)
-{
-	const struct xsk_tx_metadata *meta = *pmeta;
-
-	if (!meta)
-		return;
-
-	if (ops->tmo_request_launch_time)
-		if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
-			ops->tmo_request_launch_time(meta->request.launch_time,
-						     priv);
-
-	if (ops->tmo_request_timestamp)
-		if (meta->flags & XDP_TXMD_FLAGS_TIMESTAMP)
-			ops->tmo_request_timestamp(priv);
-
-	if (ops->tmo_request_checksum)
-		if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM)
-			ops->tmo_request_checksum(meta->request.csum_start,
-						  meta->request.csum_offset, priv);
-
-	if (!(meta->flags & XDP_TXMD_FLAGS_TIMESTAMP))
-		*pmeta = NULL;
-}
-
 /**
  *  xsk_tx_metadata_complete - Evaluate AF_XDP TX metadata at completion
  *  and call appropriate xsk_tx_metadata_ops operation.
@@ -239,12 +202,6 @@ static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
 {
 }
 
-static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
-					   const struct xsk_tx_metadata_ops *ops,
-					   void *priv)
-{
-}
-
 static inline void xsk_tx_metadata_complete(struct xsk_tx_metadata_compl *compl,
 					    const struct xsk_tx_metadata_ops *ops,
 					    void *priv)
diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
index 68a787601357..f87c4215673e 100644
--- a/include/net/xdp_sock_drv.h
+++ b/include/net/xdp_sock_drv.h
@@ -271,6 +271,43 @@ xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
 	return !(*flags & ~XDP_TXMD_FLAGS_VALID);
 }
 
+/**
+ *  xsk_tx_metadata_request - Evaluate AF_XDP TX metadata at submission
+ *  and call appropriate xsk_tx_metadata_ops operation.
+ *  @pmeta: pointer to pointer to AF_XDP metadata area
+ *  @ops: pointer to struct xsk_tx_metadata_ops
+ *  @priv: pointer to driver-private aread
+ *
+ *  This function should be called by the networking device when
+ *  it prepares AF_XDP egress packet.
+ */
+static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
+					   const struct xsk_tx_metadata_ops *ops,
+					   void *priv)
+{
+	const struct xsk_tx_metadata *meta = *pmeta;
+
+	if (!meta)
+		return;
+
+	if (ops->tmo_request_launch_time)
+		if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
+			ops->tmo_request_launch_time(meta->request.launch_time,
+						     priv);
+
+	if (ops->tmo_request_timestamp)
+		if (meta->flags & XDP_TXMD_FLAGS_TIMESTAMP)
+			ops->tmo_request_timestamp(priv);
+
+	if (ops->tmo_request_checksum)
+		if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM)
+			ops->tmo_request_checksum(meta->request.csum_start,
+						  meta->request.csum_offset, priv);
+
+	if (!(meta->flags & XDP_TXMD_FLAGS_TIMESTAMP))
+		*pmeta = NULL;
+}
+
 static inline struct xsk_tx_metadata *
 __xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
 {
@@ -483,6 +520,12 @@ xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
 	return false;
 }
 
+static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
+					   const struct xsk_tx_metadata_ops *ops,
+					   void *priv)
+{
+}
+
 static inline struct xsk_tx_metadata *
 __xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
 {
-- 
2.53.0-Meta


