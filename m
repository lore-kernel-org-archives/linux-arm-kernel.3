Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4713BCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptBan/oDFwIr7VXZlN8TdNfSiKDV9ouul3U9bPm2km8=; b=aavtfKPOerMnECFsAKzMLzWJBQ
	aIEoAQgmVw+Ggu6OwT2xD44Rb0lTS4RKbqXRXwv3mnMlyw2V36L2l8t9MWm7YroZo2ssqeWtcSFRe
	KzryoO+CBb3mYvff59aTsbfC+hfD0I1pJhH719q5caVt8FS3Hc0CoEwfkbi+VoZnO9V7+BM7vg+HF
	BVkXDAHLAO7QOXyHEOKV6bqlt2tdXyGvWAQFDtjNgxIJ4fVFim6vt4f9MlORuhJhE8X5Z8QskFRBT
	+Zu1bMkkpkIxIvmGfognEQkB2sS8j/Wf6FKU4IIvkan69JOuh+9PrvhsQQ1js+7fOr6GFz02yMzyP
	+q1H8IFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlGf-0000000DD0P-3fuW;
	Sat, 23 May 2026 12:15:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlGa-0000000DCwf-2uWT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 12:15:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bcd730e090so66684365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538544; x=1780143344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptBan/oDFwIr7VXZlN8TdNfSiKDV9ouul3U9bPm2km8=;
        b=tLBQDF9hG759Q1hUZPmdMkCoTOl5wBzNstHLR1MRlj8RgFMn+IP8otUTCmmbVk6tKz
         rg9udD3M2mngGFbSczAO74s0qZa+WsIwn0CSL/5Z8yMVMx2sW4zuiRFNJgwePM8LCRNA
         Uh6jdX902H+zgyRP4PNCxaE5oGNrwILfGMRdo3bkdLtvTd9gs0zDXzt4HnAN9NeSBazl
         ACs/FxD+xdR8FrSiOSrmopJeXWTa5yORGRCfV1CqjWRFXQn+4/vh5CkkqHwtwO5PWL5Z
         pcoMicivJ3BkB8aWVJeHxosGVUi6PzDzBzMWjIv+yWLUHNWUrLALRuk42J/b3c94dCGB
         pakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538544; x=1780143344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptBan/oDFwIr7VXZlN8TdNfSiKDV9ouul3U9bPm2km8=;
        b=S/ySMokesHfUuZfLX8uC6QSq+5wV8h4Nf5TmIHsMys5H/Etuph7ajnz6aTj1cd9+qE
         pbM1rhgD7SXh6oRwAvyANuEkg1usyNms7dCuv0CRBjMwNGsbENKHmFz6VxbOoK4t3hyq
         /g5H473Ofw2buUobOR/SjFoiD2DVz2xj7yfuo0RjaGgmT1crgOzA++pTh5/3fJerTRZT
         n02Ir4tbXiS5K4TDEv84t8uB0h0E0DbMZVpbfgbMB2yY4mu8Zrqb2MCAeNUJZ7VlVTrk
         4axT2522FWDbu8xjm4t5Vw3r+oB2oBZ2596UzQYy2j+TPMt0GGOfDSmjHIJSGPqrTfZJ
         +PPA==
X-Forwarded-Encrypted: i=1; AFNElJ9uI/YQ+xkQM53i8ZXzTK3lELyLY/lhrcdGhh9N8MnMGAlfEkMKc4pjcFFhwU939Pkr/qQWO3+29A44eppwhrFo@lists.infradead.org
X-Gm-Message-State: AOJu0YwzI+Y9iWBSba9UAcZNNxKFuAG45iyikeNnTA5vtvXOuEy5HJ7Q
	ekb5UwSo69h9+AKL90sS+4TbFtbKQuDZ4z59vYhLCiOwonzUps/F6gqp
X-Gm-Gg: Acq92OFH51qmvMB5PLYCPC21tW+3Ez3ycy5UlGVLOFZOblRUbaVCTZxWTfBlTLeiQrh
	JXVWYnLKyZCYOtcKrfqNC2x7thxBwV7wBmXP9y3y+3fEORVid1VB90wO0PQk7Mv1a/h8LMnwjzT
	3bwTDu5ZWRlcc/H0NCXwNXZ5hoT1M0E29X2qoXhiZmCkah1PgFTZ+hSYk+MTuBH0BcFzYF0Q9rz
	lvyystS4vox/xaszMImwEqWIqkYE04yJWgA+uMklKQ/Hic3V0hT23kg6PJCuBpKPTrodFzveoYR
	f3MoNzUlY8NS+HeMHVOfeIWTc+5TAGBamr9Wj23/F9fIXCaVUAfTKjzWt/HbW+nlIVpMCs2H+bD
	BnAtU+tt5B9RVbvNjFoAYhPvAzMhbnbaFv2rKM465pYJP3oW5SswJ44X6sFVidvDcOSv2DUmiD9
	GTS55I9SkKfMpW0+fl3TyXNTqpUK3CuGuWjDw=
X-Received: by 2002:a17:903:3d10:b0:2bc:6784:5260 with SMTP id d9443c01a7336-2beb06eb0e4mr90794065ad.37.1779538543856;
        Sat, 23 May 2026 05:15:43 -0700 (PDT)
Received: from mincom1 ([125.149.177.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce4easm41746305ad.30.2026.05.23.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:15:43 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>
Cc: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH 1/3] xfrm: extend ESP offload infrastructure for packet engines
Date: Sat, 23 May 2026 21:15:20 +0900
Message-ID: <20260523121522.3023992-2-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523121522.3023992-1-hurryman2212@gmail.com>
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_051544_760824_3CAAC6C5 
X-CRM114-Status: GOOD (  21.18  )
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

Some ESP offload engines operate on whole ESP packets rather than the
generic software trailer layout. They can generate outbound ESP padding,
next-header and ICV bytes in hardware, and inbound decapsulation can
return an already-trimmed packet with the recovered next-header value.

Add a netdev offload callback for drivers to opt into hardware-generated
ESP TX trailers, carry the reserved ESP TX tail length in xfrm_offload,
and let ESP input skip software trailer removal when hardware has already
done it.

This keeps the default ESP offload behavior unchanged for existing devices
while providing the infrastructure needed by packet-mode ESP engines.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 include/linux/netdevice.h |  3 +++
 include/net/xfrm.h        |  8 +++++++-
 net/ipv4/esp4.c           |  6 +++++-
 net/ipv4/esp4_offload.c   | 29 ++++++++++++++++++++++++++++-
 net/ipv6/esp6.c           |  6 +++++-
 net/ipv6/esp6_offload.c   | 29 ++++++++++++++++++++++++++++-
 6 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 0e1e581efc5a..b6ff04c3df78 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1043,6 +1043,9 @@ struct xfrmdev_ops {
 				      struct xfrm_state *x);
 	bool	(*xdo_dev_offload_ok) (struct sk_buff *skb,
 				       struct xfrm_state *x);
+	/* Return true when the device generates the ESP trailer/ICV itself. */
+	bool	(*xdo_dev_esp_tx_hw_trailer)(struct sk_buff *skb,
+					     struct xfrm_state *x);
 	void	(*xdo_dev_state_advance_esn) (struct xfrm_state *x);
 	void	(*xdo_dev_state_update_stats) (struct xfrm_state *x);
 	int	(*xdo_dev_policy_add) (struct xfrm_policy *x, struct netlink_ext_ack *extack);
diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 10d3edde6b2f..160069901e0a 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -1141,7 +1141,7 @@ struct xfrm_offload {
 #define	CRYPTO_FALLBACK		8
 #define	XFRM_GSO_SEGMENT	16
 #define	XFRM_GRO		32
-/* 64 is free */
+#define	XFRM_ESP_NO_TRAILER	64
 #define	XFRM_DEV_RESUME		128
 #define	XFRM_XMIT		256
 
@@ -1158,6 +1158,12 @@ struct xfrm_offload {
 	/* Used to keep whole l2 header for transport mode GRO */
 	__u16			orig_mac_len;
 
+	/*
+	 * ESP packet engines can reserve tailroom in the generic ESP path and
+	 * generate padding, next-header and ICV bytes during device TX.
+	 */
+	__u16			esp_tx_tailen;
+
 	__u8			proto;
 	__u8			inner_ipproto;
 };
diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 6a5febbdbee4..f21c8f2e60f7 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -720,7 +720,11 @@ int esp_input_done2(struct sk_buff *skb, int err)
 	if (unlikely(err))
 		goto out;
 
-	err = esp_remove_trailer(skb);
+	/* Hardware ESP decapsulation can already remove pad/trailer/ICV. */
+	if (xo && (xo->flags & XFRM_ESP_NO_TRAILER))
+		err = xo->proto;
+	else
+		err = esp_remove_trailer(skb);
 	if (unlikely(err < 0))
 		goto out;
 
diff --git a/net/ipv4/esp4_offload.c b/net/ipv4/esp4_offload.c
index abd77162f5e7..f00fff98b69f 100644
--- a/net/ipv4/esp4_offload.c
+++ b/net/ipv4/esp4_offload.c
@@ -270,8 +270,10 @@ static int esp_xmit(struct xfrm_state *x, struct sk_buff *skb,  netdev_features_
 	struct xfrm_offload *xo;
 	struct ip_esp_hdr *esph;
 	struct crypto_aead *aead;
+	struct sk_buff *trailer;
 	struct esp_info esp;
 	bool hw_offload = true;
+	bool hw_trailer = false;
 	__u32 seq;
 	int encap_type = 0;
 
@@ -281,6 +283,7 @@ static int esp_xmit(struct xfrm_state *x, struct sk_buff *skb,  netdev_features_
 
 	if (!xo)
 		return -EINVAL;
+	xo->esp_tx_tailen = 0;
 
 	if ((!(features & NETIF_F_HW_ESP) &&
 	     !(skb->dev->gso_partial_features & NETIF_F_HW_ESP)) ||
@@ -303,13 +306,37 @@ static int esp_xmit(struct xfrm_state *x, struct sk_buff *skb,  netdev_features_
 	esp.clen = ALIGN(skb->len + 2 + esp.tfclen, blksize);
 	esp.plen = esp.clen - skb->len - esp.tfclen;
 	esp.tailen = esp.tfclen + esp.plen + alen;
+	if (esp.tailen > U16_MAX)
+		return -EINVAL;
 
 	esp.esph = ip_esp_hdr(skb);
 
 	if (x->encap)
 		encap_type = x->encap->encap_type;
 
-	if (!hw_offload || !skb_is_gso(skb) || (hw_offload && encap_type == UDP_ENCAP_ESPINUDP)) {
+	if (hw_offload && !skb_is_gso(skb) && !encap_type && x->xso.dev &&
+	    x->xso.dev->xfrmdev_ops &&
+	    x->xso.dev->xfrmdev_ops->xdo_dev_esp_tx_hw_trailer)
+		hw_trailer =
+			x->xso.dev->xfrmdev_ops->xdo_dev_esp_tx_hw_trailer(skb, x);
+
+	if (hw_trailer) {
+		int esph_offset;
+
+		/*
+		 * The device packet engine will write ESP padding, next-header
+		 * and ICV bytes. Keep skb->len unchanged here, but make sure the
+		 * later DMA writer owns enough linear tailroom.
+		 */
+		esph_offset = (unsigned char *)esp.esph - skb_transport_header(skb);
+		esp.nfrags = skb_cow_data(skb, esp.tailen, &trailer);
+		if (esp.nfrags < 0)
+			return esp.nfrags;
+		esp.esph = (struct ip_esp_hdr *)(skb_transport_header(skb) +
+						 esph_offset);
+		xo->esp_tx_tailen = esp.tailen;
+	} else if (!hw_offload || !skb_is_gso(skb) ||
+		   (hw_offload && encap_type == UDP_ENCAP_ESPINUDP)) {
 		esp.nfrags = esp_output_head(x, skb, &esp);
 		if (esp.nfrags < 0)
 			return esp.nfrags;
diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index 9c06c5a1419d..730588f8eaba 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -751,7 +751,11 @@ int esp6_input_done2(struct sk_buff *skb, int err)
 	if (unlikely(err))
 		goto out;
 
-	err = esp_remove_trailer(skb);
+	/* Hardware ESP decapsulation can already remove pad/trailer/ICV. */
+	if (xo && (xo->flags & XFRM_ESP_NO_TRAILER))
+		err = xo->proto;
+	else
+		err = esp_remove_trailer(skb);
 	if (unlikely(err < 0))
 		goto out;
 
diff --git a/net/ipv6/esp6_offload.c b/net/ipv6/esp6_offload.c
index 22895521a57d..d124493da40b 100644
--- a/net/ipv6/esp6_offload.c
+++ b/net/ipv6/esp6_offload.c
@@ -308,8 +308,10 @@ static int esp6_xmit(struct xfrm_state *x, struct sk_buff *skb,  netdev_features
 	int blksize;
 	struct xfrm_offload *xo;
 	struct crypto_aead *aead;
+	struct sk_buff *trailer;
 	struct esp_info esp;
 	bool hw_offload = true;
+	bool hw_trailer = false;
 	__u32 seq;
 
 	esp.inplace = true;
@@ -318,6 +320,7 @@ static int esp6_xmit(struct xfrm_state *x, struct sk_buff *skb,  netdev_features
 
 	if (!xo)
 		return -EINVAL;
+	xo->esp_tx_tailen = 0;
 
 	if (!(features & NETIF_F_HW_ESP) || x->xso.dev != skb->dev) {
 		xo->flags |= CRYPTO_FALLBACK;
@@ -338,8 +341,32 @@ static int esp6_xmit(struct xfrm_state *x, struct sk_buff *skb,  netdev_features
 	esp.clen = ALIGN(skb->len + 2 + esp.tfclen, blksize);
 	esp.plen = esp.clen - skb->len - esp.tfclen;
 	esp.tailen = esp.tfclen + esp.plen + alen;
+	if (esp.tailen > U16_MAX)
+		return -EINVAL;
 
-	if (!hw_offload || !skb_is_gso(skb)) {
+	if (hw_offload && !skb_is_gso(skb) && !x->encap && x->xso.dev &&
+	    x->xso.dev->xfrmdev_ops &&
+	    x->xso.dev->xfrmdev_ops->xdo_dev_esp_tx_hw_trailer)
+		hw_trailer =
+			x->xso.dev->xfrmdev_ops->xdo_dev_esp_tx_hw_trailer(skb, x);
+
+	if (hw_trailer) {
+		int esph_offset;
+
+		/*
+		 * The device packet engine will write ESP padding, next-header
+		 * and ICV bytes. Keep skb->len unchanged here, but make sure the
+		 * later DMA writer owns enough linear tailroom.
+		 */
+		esp.esph = ip_esp_hdr(skb);
+		esph_offset = (unsigned char *)esp.esph - skb_transport_header(skb);
+		esp.nfrags = skb_cow_data(skb, esp.tailen, &trailer);
+		if (esp.nfrags < 0)
+			return esp.nfrags;
+		esp.esph = (struct ip_esp_hdr *)(skb_transport_header(skb) +
+						 esph_offset);
+		xo->esp_tx_tailen = esp.tailen;
+	} else if (!hw_offload || !skb_is_gso(skb)) {
 		esp.nfrags = esp6_output_head(x, skb, &esp);
 		if (esp.nfrags < 0)
 			return esp.nfrags;
-- 
2.53.0


