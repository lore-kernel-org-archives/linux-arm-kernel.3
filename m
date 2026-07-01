Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E808BC44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRmRx3E2TRD6nMHlslynO/JAwSkEz+lHHJvdgNM8QVs=; b=UUSj8tF3DINcn5ysj+NyqaIrA2
	mgGQ8/yvqpfcfDbYAUUHUFpSyA6cgmvmwOkX2HRuzuNXYytZDQlBsLohe76fNSV/0qvhT+GL9/5nL
	DqAP2JCFCjntx3tV8cyEKGNnkNMRhEoKXz8Dwz1G5tRRpzduzHE9Uhif7L/FQmAZYAc+3rXMIugx2
	bh6za3kh1+RcEetXAdOjW/Zk/3sv3Ma3yS+IUCjxyVGrALsQtaPUXkCqYzgJjvHd0QRH7m/MaOUdM
	NY2blIuQpcpvbTt7IMWH5KzKL8ZLU9mXsRnB9i42xlIJ62ko8R59YK/VgxsRdM23J1wJN/Nk8uiML
	o8nRXtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq1G-00000000zDU-3xdN;
	Wed, 01 Jul 2026 08:10:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq1F-00000000zCm-1vGZ;
	Wed, 01 Jul 2026 08:10:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DBBF1600AB;
	Wed,  1 Jul 2026 08:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170A91F000E9;
	Wed,  1 Jul 2026 08:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893404;
	bh=lRmRx3E2TRD6nMHlslynO/JAwSkEz+lHHJvdgNM8QVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DkRC/j6P5kB3e9+MoIo7spZkiEMR4v/KTOdKZ8o6f6Yk+8zwinsjmbDAN0Qy8P8G1
	 LhCOqGdjd0iubyi5B+VcGiRlxc03k+GM9YZpccVQ+o9uEhV01698TlzqIfOgx8yslb
	 50VYq9nBmtP7NzRUuog9X4vygxDHtjlR9KjdIIDsiB6FZUB+NFrv6CTBTfCy+fkV8R
	 mR/Kopr9mUbxcVRtC19qyY2UG6OwfXo+31tU8hiqsQb+kokSHEWYy9G1ln8RNHVNaC
	 rJbYfAUGLrrYaknHIiO9EIzNJkXVcXpS0ZO/gfc2VStukvCc2Fp0IEz8vWKJSzg27c
	 qYqYUeQgSrFAQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 01 Jul 2026 10:09:25 +0200
Subject: [PATCH net-next v7 1/3] net: airoha: rename airoha_priv_flags to
 airoha_dev_flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-airoha-ethtool-priv_flags-v7-1-b4153bd44428@kernel.org>
References: <20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org>
In-Reply-To: <20260701-airoha-ethtool-priv_flags-v7-0-b4153bd44428@kernel.org>
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

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_eth.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 932b3a3df2e5..8bba54ebcf07 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2048,7 +2048,7 @@ static int airoha_dev_init(struct net_device *netdev)
 		fallthrough;
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
-		dev->flags |= AIROHA_PRIV_F_WAN;
+		dev->flags |= AIROHA_DEV_F_WAN;
 		break;
 	default:
 		break;
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index d7ff8c5200e2..87ab3ea10664 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -535,8 +535,8 @@ struct airoha_qdma {
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
 
-enum airoha_priv_flags {
-	AIROHA_PRIV_F_WAN = BIT(0),
+enum airoha_dev_flags {
+	AIROHA_DEV_F_WAN = BIT(0),
 };
 
 struct airoha_gdm_dev {
@@ -659,7 +659,7 @@ static inline u16 airoha_qdma_get_txq(struct airoha_qdma *qdma, u16 qid)
 
 static inline bool airoha_is_lan_gdm_dev(struct airoha_gdm_dev *dev)
 {
-	return !(dev->flags & AIROHA_PRIV_F_WAN);
+	return !(dev->flags & AIROHA_DEV_F_WAN);
 }
 
 static inline bool airoha_is_7581(struct airoha_eth *eth)

-- 
2.54.0


