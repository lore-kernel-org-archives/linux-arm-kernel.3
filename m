Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B32C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4h2lDbuS6wgFYWmNXWGo5hdv7x4F0DvuiMCZt9z600A=; b=Tz3vY4/URdbVxMgbCb1p5igyxa
	hzcOrczHLAtJQPjrg93aS/lkscpX/0rVg/SAZumNM6eYyKzU7tgqpMMnTACAI0dwwiiFfA/eecvcD
	rg/uFrEko8UdCRzX3UyXeqn7USzT3nh5ocyvN1mYELQ0A3WuLYc3MQaIYpjBpj9pefB2xguiJ8INp
	HmpRE0cwuFEUOte02+4a3kHxhqpFrc+JkJfl9hTGuAgyXsWAF9Cxq31OZRPQ5xGpcDMNgb3VpwGXP
	Pv1ml1hKUXtdSvdBHGq6rTF5UomnnVDpnzsEyDCVL2maisG68Jb3OrzEok9Q0LB1YME8ezag6rQ80
	72VvAq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3n-00000003I87-0DPk;
	Mon, 27 Jul 2026 16:20:11 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3g-00000003I5N-2lnU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:05 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc2c6e0688so23969045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169204; x=1785774004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h2lDbuS6wgFYWmNXWGo5hdv7x4F0DvuiMCZt9z600A=;
        b=Fm/5gg+Q9GEoJfgRanbyPeh/hZg65AcBeco5L+MriPW9jsqv7hLuPBG1v6G1EOvwQv
         IxaSh2ausnhEqo0EYNjanjYgjFukMnhzGdmjlXROFs6SmTIfUe1nYZNh/lMZJQ4rJ4RL
         nDl0NKlNmzXcl0V5/9UhqLGpj+OnT1aKGkeeSo/OU1JjhhxMw2af2XPpM0sRX+LuW176
         29jRxMsQuWRhQ7kHQe/peLIJSuR1Oucsd5YqqPmaD77PDVm62ooPQwzjlLgDOJii1XOU
         zWF1qipLpmSzYNrT7PKvs6vrpMfE08BHfKEowqlo/hhWOOQCC0pVwemzCHh3YEknodyC
         A0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169204; x=1785774004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4h2lDbuS6wgFYWmNXWGo5hdv7x4F0DvuiMCZt9z600A=;
        b=TgPO6fX4kOId4QUwDjKMmsS+qBgWgke9SpqOZHxhiZq6uaHwDfQsiVb21R2tC62Rbw
         05ls6LbxnXDe9QGK3vyht/9lmIUIcnmFIUIaFDAtx6Gxscr3pwzqIz3fzvJ9vW4QZPXk
         uznoF+pkPn7VRKOO0e7BaomN/TCzWdV0oO1QxgVZdE9WAWimoVKr45RFFKY3I5W91Cpk
         8/sY8AguVTKih97CWz4MAd85od57G+RKufTndrY1rXh4rZQ0fldlGB6VDun/RUUbmRym
         YQV9PYk7aFS1d7YOftcAo/4xfbI8f3Kw8K54zyTX/aGlKMw5B/vHEK5ZXygW+pvV2iGO
         1lOg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2PT9gEqKELmhwqqjP89rK7Abn7X5Ho9mpMZZuFlrRiftaAVLhGOtVdb5e3ih2JunShS+ugHDp+yKioomJGVTu@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxsQw0vuG7va8iyawxrAuLeZLqfT6BPylHGi5RPeDtGBG1Vym
	BGjgQX7iYbCARDmdoQlqm4k/+bY3jQVQPht5+lfQs8bJVnoN9KueiICQ
X-Gm-Gg: AR+sD12Uy7jgzl9XtO616UsMd3Zo43cribFOffmFrfMTNQbOO45uEweBVC+F/OQ8zCf
	Ydjf2m4uW4uafQblWqwU/WD+rcMZtdl7vVDbgkYZY9U7+Gr72Zu5BznJj3KNLqx3p9gup/CMSOj
	Z/ur+kX5MeG5Rd8eaLCmlfVyHrh+oVVOC9KUCDEBCbed3CQq6mRIXmfMXBpGZpoNME2v/1fs39H
	/dy2oi5TbLRbRZqhEx7/eK4XJ6Hr+oUl9DDAPqKE3KoIgpM/rz0759KHdqkkOhQ6NVkzlvGSPaI
	EhfhSvolJX8Zi/hk31Z6vKLYUnzAc7CoNXiPsG1PVPbKwowQdkOQLJhBaL+06phwn4MHmDhEsB8
	k2t9cs/bjn669uS3yoT+TGP1+ErRM2SJFp2bE5rLyeO/klQ1TMZHBghOdEK9xUUbOODB2U+yUSK
	Z+YNoU
X-Received: by 2002:a17:903:3b88:b0:2ce:ceef:661b with SMTP id d9443c01a7336-2cfde8473c9mr75552645ad.29.1785169204004;
        Mon, 27 Jul 2026 09:20:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b8cbsm37712705ad.11.2026.07.27.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:03 -0700 (PDT)
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
Subject: [PATCH net 4/6] xsk: validate launch-time metadata size
Date: Mon, 27 Jul 2026 09:19:57 -0700
Message-ID: <20260727161959.885642-5-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
References: <20260727161959.885642-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092004_701122_58D14CE8 
X-CRM114-Status: GOOD (  16.42  )
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

Launch-time metadata extends beyond the first 16 bytes of struct
xsk_tx_metadata. Reject the request when the registered metadata area does
not contain the complete field.

Snapshot the validated flags for the generic transmit path and use that
snapshot for request and completion processing, avoiding inconsistent
decisions if user space changes the flags concurrently.

Note that only xsk_skb_metadata is properly using the flags,
__xsk_buff_get_metadata ignores them. Next commits address that.

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
Cc: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/net/xdp_sock_drv.h | 17 +++++++++++++----
 net/xdp/xsk.c              | 11 ++++++-----
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
index 46797645a0c2..68a787601357 100644
--- a/include/net/xdp_sock_drv.h
+++ b/include/net/xdp_sock_drv.h
@@ -260,21 +260,28 @@ xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
 	0)
 
 static inline bool
-xsk_buff_valid_tx_metadata(const struct xsk_tx_metadata *meta)
+xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
+			   const struct xsk_tx_metadata *meta, u64 *flags)
 {
-	return !(meta->flags & ~XDP_TXMD_FLAGS_VALID);
+	*flags = READ_ONCE(meta->flags);
+	if (*flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
+		if (pool->tx_metadata_len <
+		    offsetofend(struct xsk_tx_metadata, request.launch_time))
+			return false;
+	return !(*flags & ~XDP_TXMD_FLAGS_VALID);
 }
 
 static inline struct xsk_tx_metadata *
 __xsk_buff_get_metadata(const struct xsk_buff_pool *pool, void *data)
 {
 	struct xsk_tx_metadata *meta;
+	u64 flags;
 
 	if (!pool->tx_metadata_len)
 		return NULL;
 
 	meta = data - pool->tx_metadata_len;
-	if (unlikely(!xsk_buff_valid_tx_metadata(meta)))
+	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
 		return NULL; /* no way to signal the error to the user */
 
 	return meta;
@@ -469,7 +476,9 @@ xsk_buff_raw_get_ctx(const struct xsk_buff_pool *pool, u64 addr)
 	return (struct xdp_desc_ctx){ };
 }
 
-static inline bool xsk_buff_valid_tx_metadata(struct xsk_tx_metadata *meta)
+static inline bool
+xsk_buff_valid_tx_metadata(const struct xsk_buff_pool *pool,
+			   const struct xsk_tx_metadata *meta, u64 *flags)
 {
 	return false;
 }
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index fcc6f17f3576..7855ee09c4b6 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -967,15 +967,16 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 {
 	struct xsk_tx_metadata *meta = NULL;
 	u16 csum_start, csum_offset;
+	u64 flags;
 
 	if (unlikely(pool->tx_metadata_len == 0))
 		return -EINVAL;
 
 	meta = buffer - pool->tx_metadata_len;
-	if (unlikely(!xsk_buff_valid_tx_metadata(meta)))
+	if (unlikely(!xsk_buff_valid_tx_metadata(pool, meta, &flags)))
 		return -EINVAL;
 
-	if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM) {
+	if (flags & XDP_TXMD_FLAGS_CHECKSUM) {
 		csum_start = READ_ONCE(meta->request.csum_start);
 		csum_offset = READ_ONCE(meta->request.csum_offset);
 
@@ -996,9 +997,9 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 		}
 	}
 
-	if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
-		skb->skb_mstamp_ns = meta->request.launch_time;
-	if (!(meta->flags & XDP_TXMD_FLAGS_TIMESTAMP))
+	if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
+		skb->skb_mstamp_ns = READ_ONCE(meta->request.launch_time);
+	if (!(flags & XDP_TXMD_FLAGS_TIMESTAMP))
 		meta = NULL;
 	xsk_tx_metadata_to_compl(meta, &skb_shinfo(skb)->xsk_meta);
 
-- 
2.53.0-Meta


