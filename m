Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E20EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uu5RM4d1V94/PPWT88IgE52BpBBsPP0bpENjQZ3Pp98=; b=WrLVgc9g1HJSvp4OwMCb8hEUg4
	aCXEAJUOAA6GNKRJDsKsMEbW3MiZcq2vbXzVCLsOlo2vktnLr63akhTGB1avH75L6gvZqolap1TvF
	Zx5VwhewJCf+1awYlOblj74l0HBwLOHL9k80T/xoU0RgrlSPEsWxaBWYgNwqeIUUaCzXAsrnpjp/i
	sFcYAF/FdP4tz3euIdsRT/6otFqhGQDnb4HzRjFnxm7uiE+ytm7+u4XwPLCA2cv/y8e+dTMPjjQQv
	4ZN2ZEisvTmwuJUTbp+2c3V2YsY/unHPEI/CtGA0BaT44JFamChDU3Hds9SMvz6xC+ylcL5T2ThPe
	9Kxksw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw68-0000000808I-3Xwg;
	Mon, 20 Jul 2026 22:04:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw63-0000000805i-2CvE;
	Mon, 20 Jul 2026 22:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AD2C43786;
	Mon, 20 Jul 2026 22:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976521F000E9;
	Mon, 20 Jul 2026 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784585063;
	bh=uu5RM4d1V94/PPWT88IgE52BpBBsPP0bpENjQZ3Pp98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MkGhsYiW1s12sYffPhLg+73t0v5d6FlfY6mmzcv9yjV14R5veT6tB8UD0w5OCBIoD
	 2vWQLQM5dJo8S1PK/btXlle2o1rWtcbj4Sxg/VCnlrHjYx0nim+cG0LQCWH1SRDWn4
	 b7DKqNRkOQeu1TXYrWkAUc4wZHZb9KLhAK02ra7kT28Jb78ywZDBBUpMQidwnmmQdI
	 uL3MvKDUD8j1v6cw1EcROh+yhQCVjKFTtqsyqVtHNBuoQ+eXR97wQ1y4f01yaHDsqi
	 mqw1cdrisfPJptG5UyleJHOu9UXD85B3+Dj1iEdV8NjFF7w7XHGHotuMrykaWK7NPK
	 FYI/gbwxLtuKA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 21 Jul 2026 00:03:35 +0200
Subject: [PATCH net-next v9 1/3] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-airoha-ethtool-priv_flags-v9-1-9c15d8b71a56@kernel.org>
References: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
In-Reply-To: <20260721-airoha-ethtool-priv_flags-v9-0-9c15d8b71a56@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
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

Rename the airoha_priv_flags enum to airoha_dev_flags and the
AIROHA_PRIV_F_WAN flag to AIROHA_DEV_F_WAN. The "priv_flags" naming
dates back to an earlier design that used ethtool private flags; since
this series switched to tc qdisc offload for LAN/WAN configuration,
align the naming to reflect that these are per-device flags rather than
ethtool private flags. No functional change.

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_eth.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..41c1a0ffbdd8 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2039,7 +2039,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		fallthrough;
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
-		dev->flags |= AIROHA_PRIV_F_WAN;
+		dev->flags |= AIROHA_DEV_F_WAN;
 		break;
 	default:
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f6d01a8e8da1..bf1c249255bd 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -543,8 +543,8 @@ struct airoha_qdma {
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
-enum airoha_priv_flags {
-	AIROHA_PRIV_F_WAN = BIT(0),
+enum airoha_dev_flags {
+	AIROHA_DEV_F_WAN = BIT(0),
 };
 
 struct airoha_gdm_dev {
@@ -667,7 +667,7 @@ static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
 
 static inline bool airoha_is_lan_gdm_dev(struct airoha_gdm_dev *dev)
 {
-	return !(dev->flags & AIROHA_PRIV_F_WAN);
+	return !(dev->flags & AIROHA_DEV_F_WAN);
 }
 
 static inline bool airoha_is_7581(struct airoha_eth *eth)

-- 
2.55.0


