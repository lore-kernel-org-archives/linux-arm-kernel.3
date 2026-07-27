Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988DC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XKcSH10NxhyObCdsXRn5dtH9ICKV5W4CaAB3/o++lY=; b=CkS6B92mXu+tTmD31q8p7++990
	2CApgNqhEDtQLw8KcVp1oYwzmKRV9HlEw1qvp0cj3JOFDMAboJ7VyzOnLGNP9qQlQiPTuWhNIo4oC
	IUUPqKxEDKAUwIIJB35cmPSJHHXfpps08cVgkH/lVeEV6lxuYxueOgwjec1aZDQKrxetgknIX0O7v
	G/tpj87oSf7bxJYh+hZSWzGCv+mFSTKljNXCWpW10kInwiMl/gQ6gT+PwEMWGnRBUz10VA4MZuhu7
	phdLenWCQrPwa6tVMAQogzsw1XiPDklPGNeFRgXe1FpnQBGtiPxDAkVpwChCGhX2y9lzWuuQ35H8Y
	Ix007Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3m-00000003I7j-3lHn;
	Mon, 27 Jul 2026 16:20:10 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woO3f-00000003I4q-3QT1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:20:04 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2cf49dc298bso28700215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785169203; x=1785774003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XKcSH10NxhyObCdsXRn5dtH9ICKV5W4CaAB3/o++lY=;
        b=fe9YxFvyKrhBjUExfQ8Jxp/dxOnfT2GKi5yRVWzBQ7T6GWdnhwAnfi3rOgJTr77ZtN
         wC8Lklu4eW6GqVPH4qAtRIHARR9RYUHFRjA5saojkm3VsYFzG1/eCCJJWK2We+E1mEey
         BY/LReWx98OtP4/r9S//5OS/DCYG+THb4hHMnaR/1JyZDx17nY8oH/YYLDWksIZdobfY
         vwA5dgbswh+wiEF6rNrHBRn2n54WZHUO9qhusXU8onl4WQNGqQCOKh3KeQtMD/QPwcKu
         +/QNRnygOutwD4YLHfzyA72lh/hWvKZ/c8YKf6Jl0dvgSp55KpPAO+fN7N6g+qkSxYTk
         Mo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169203; x=1785774003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1XKcSH10NxhyObCdsXRn5dtH9ICKV5W4CaAB3/o++lY=;
        b=s70mEMufKMd6jVFpwsj9ORFnbwNr7WkiRrwgnzLOi0qYjTeHtx0VPyVPn+77ln0hxL
         5rKgGBe05U7SJ+21310upLx+o7a4/QvRSZ9gJzdo8Y69JN27sDMcvkFFpVmrgrN8o6HP
         2BYCCGFDx3MLzmtYFCxG6DpAMP261Y37a3AozE1ppd0LzQRzwZYFobgRTIrBvw0F8Ksn
         QQfJceBkUOaONdCZ3i7zjphrI3UlCaOUchMVIaXsomJYsyduZ8FV1jW6y+97C3ANHnHC
         qaSN8u4ctLMzZVwJEnJTkqEXJSK1qizgmrXhLCfs8ECQyZtyT+e3ZPBJu/6HEzeHNX0f
         nD7w==
X-Forwarded-Encrypted: i=1; AHgh+Rr63UIMqlo/EyvinOCKOA4Zo3tu8L2q2BoPBMx9+1rEY7nRwE+HVb7mqziwpAoaX0U37cgpNZuEIkHGrBWYKegI@lists.infradead.org
X-Gm-Message-State: AOJu0YxZggA6gQJWKvzxowysHg9VEI3kQqH7YCwCi/su9IPq3JHsu/+d
	N6A1KcWnuefLP3V1SJd5ivuxjYZC11tzvWpFYyOdduBFhK/Xey+Yt2ig
X-Gm-Gg: AR+sD11dDIjmMZrJTvr1A4EIIo1/62G0JBuBBYlt59m1kzTPgI/TXG6y+6rvYnuUzLW
	+MVgC3ucwfPWhtBVFubX47wH9L37f7nfiTO0c0eTBlPUc2/4Ih8iP3yRFTCfKKmqV46VimrS0iI
	AIM6RwM9BVdvl0D/nYffBIwOlP33lA4l3LHFcRXyUuOYggH16MHqmxfebd9a9q2vttP2f5vB59a
	1X6abWdUpr8xJjfENucNSFf6L4GC4PiFOuFiAqz56IvR+PZq+N4f6C4+ZnWsYiAqhJahSYgZxtd
	3f4MdD6rr+SHaEbkIW+oFmIcDbM/zAwi8TiY0mDuJGh6pkkD6eVfgFY2ipenQvrxiUQYEK9hyVg
	7S7Zxw+zJpjS0G0FHVJ3ow6jNGRw5zCWHwtdW0xPBuWl+vdBZqzRmLbdA5Pe878qXzSmnjvjyCo
	hI8PKl
X-Received: by 2002:a17:903:3808:b0:2ce:9439:59a5 with SMTP id d9443c01a7336-2cfde878665mr86179875ad.36.1785169203061;
        Mon, 27 Jul 2026 09:20:03 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d00599b631sm8906615ad.42.2026.07.27.09.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:02 -0700 (PDT)
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
Subject: [PATCH net 3/6] xsk: clear metadata pointer when no timestamp is requested
Date: Mon, 27 Jul 2026 09:19:56 -0700
Message-ID: <20260727161959.885642-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727161959.885642-1-sdf@fomichev.me>
References: <20260727161959.885642-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092003_868299_1D17BBDA 
X-CRM114-Status: GOOD (  16.58  )
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

User space can change metadata flags after request processing. Rereading
them during completion can therefore make the kernel write a timestamp
that was not requested when the packet was submitted.

Clear the metadata pointer during request processing unless timestamp
completion is requested. Completion handling can then use the pointer
itself instead of rereading the flags.

On the mlx5 multi-packet WQE path metadata is evaluated per batch:
xsk_tx_metadata_request() runs only for the descriptor that starts a
session, just like the checksum offload that is applied once through the
shared WQE. Only that descriptor's pointer is reset, so completion
handling can record a timestamp for the other descriptors of the session
regardless of their own XDP_TXMD_FLAGS_TIMESTAMP bit. The write stays
inside the metadata area; the single-WQE, other zero-copy, and generic
paths reset the pointer per descriptor and are unaffected.

Fixes: ca4419f15abd ("xsk: Add launch time hardware offload support to XDP Tx metadata")
Cc: Cen Zhang (Microsoft) <blbllhy@gmail.com>
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 include/net/xdp_sock.h | 14 ++++++++++----
 net/xdp/xsk.c          |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/net/xdp_sock.h b/include/net/xdp_sock.h
index 06c081feff42..2b2eb9b9d580 100644
--- a/include/net/xdp_sock.h
+++ b/include/net/xdp_sock.h
@@ -141,13 +141,16 @@ INDIRECT_CALLABLE_DECLARE(void xsk_destruct_skb(struct sk_buff *));
 static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
 					    struct xsk_tx_metadata_compl *compl)
 {
+	compl->tx_timestamp = NULL;
+
 	if (!meta)
 		return;
 
-	if (meta->flags & XDP_TXMD_FLAGS_TIMESTAMP)
-		compl->tx_timestamp = &meta->completion.tx_timestamp;
-	else
-		compl->tx_timestamp = NULL;
+	/* we can only arrive here if the completion timestamp has been
+	 * requested via XDP_TXMD_FLAGS_TIMESTAMP, see xsk_tx_metadata_request
+	 */
+
+	compl->tx_timestamp = &meta->completion.tx_timestamp;
 }
 
 /**
@@ -182,6 +185,9 @@ static inline void xsk_tx_metadata_request(struct xsk_tx_metadata **pmeta,
 		if (meta->flags & XDP_TXMD_FLAGS_CHECKSUM)
 			ops->tmo_request_checksum(meta->request.csum_start,
 						  meta->request.csum_offset, priv);
+
+	if (!(meta->flags & XDP_TXMD_FLAGS_TIMESTAMP))
+		*pmeta = NULL;
 }
 
 /**
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index f906d51b6699..fcc6f17f3576 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -998,6 +998,8 @@ static int xsk_skb_metadata(struct sk_buff *skb, void *buffer,
 
 	if (meta->flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
 		skb->skb_mstamp_ns = meta->request.launch_time;
+	if (!(meta->flags & XDP_TXMD_FLAGS_TIMESTAMP))
+		meta = NULL;
 	xsk_tx_metadata_to_compl(meta, &skb_shinfo(skb)->xsk_meta);
 
 	return 0;
-- 
2.53.0-Meta


