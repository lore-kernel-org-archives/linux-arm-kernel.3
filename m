Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE09C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=; b=M2mY/bihpN0yJdUChpspoA+Mmd
	Gg0JC1lriUDzji4zsSPbeMq/HG+S67v9PVj0l8qRx6plJq6DZ8jk0aAKvD4ZFfvDLgWslLRigAe3I
	eLoKxIxKcww8LA2fVocg6EuH3SnGema1OeqS+VgrQWJ+uktjxf6GVd97HPCrcb2PJM61vBhZbyPgw
	n3pRAuM9uY1CBUepm7EhtfJ/TZdnQn3HW8FTWXr+T+YCrPPkL+KlaOwzfNd8zjGdTFWlXT8lEo5R1
	jhvmibP535mSJOzQ3NvPrr8HtKcTYCv+TDoghdQ4ywjJYFPbzfLfE21YaOiEero1aGIVz4kQmhZN9
	WzbgSSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAr-0000000EZ5d-3OZP;
	Mon, 29 Jun 2026 12:33:17 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAp-0000000EZ3d-1Geo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:16 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1274bedebfso67295666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736394; x=1783341194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=EAaGjOoddTSMf0yva/EnSZ3dm0n7tg/KD0zy+EBYokV6vczoGBqZpxdHsxRurhxvhs
         aiw6TxPHaZ+mKrbxQs+PyxjLTRPzp7yHKu2LHiYwwnGvA7TKDkFkpAWlcM0DgOEx4i1k
         N2pqH3EbKLLA2lpEfqZ2sVjpYInWElo0PQcNd23VDT/FKjWoTMFuQyhyJlbbIE/vDr7A
         lrx1jGU/8JcHY3B78C7oWNjL/LOqDxAAMhEcxTXotegH9zmmnGX3AcvmfsPQwlLBkMwF
         zodR128wJeeVg3cefAKhtojYWJrpsMs/TSD7rbR/SrwahCfTF05TEXCaeYHH06jaxMJM
         8mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736394; x=1783341194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0NF38joMTzvz8Moy3DTutVlP+ZtXdrf3nZbhlmDRZw=;
        b=iuiGR316+nNa2YF4NdQuATMFnHvvF1sFdebZRMEJefu8DQHDrhj/h7pqL8lLGAN+AB
         ubtBShX5TvjNUIrhwPOSUU1igPco/Pv2feSNUjBzLCm6RnVpkzirxMZAW9wLUqpBDwo3
         Hyixnz0SDmMQp3D9T39uV3VlS+Ycm3ac7KbLersssoC4F+cs58Wh3uJpf3Lav6iZ8PI8
         W/d3vXhfgFnIgZyxxvdwAFey+lu+mcuIOSEL/Lbm85pN1magPtxKcnHR7xQnCXP2e1bS
         +zq0PGOLjt2g3gJ9y+BRW9Ptd/VUHHMmYd8WneDreGIncdAN2IIkE9031d0KkX//qKN4
         7cMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrO1wTF+q3Q7lZUVhw4R8kd3l8GAsrZJL1oU0N1KVTYC6hMO53pNC7BRmW03bQau9AghZZBDTi/i1zpDFNpqnii@lists.infradead.org
X-Gm-Message-State: AOJu0YwaqMpmlMlZ257fc/sd2ml/Y9bErbbbjLcFBqERwb357P6A7Hkb
	dJoVMwNdw43xfRMU9x8y8sfbUSvNfcha7N55aKsV1uN/UTJP57lyV4WX
X-Gm-Gg: AfdE7clu7ZANf8cjVwxRUjf1EO3vhcX1NU/SLTf2YSWoljirOQk+xaj4ZKnbMD0QnNT
	azw+PeYbniYXQdEfOOSWwseifF0jZAr3DDGK/x0Hwe8xHUQrmD0JZE0DYzk1Epqn3VG7Rwj6Jdq
	kT8V1yJVkJNzka0HvXHJQaphQ6SuDLT3NBPvXVqjvjvRo6bPAwVoJvjyKWevGy8cvIvFQays60t
	DNkik4PGOvzXvqzHfqDV7Ee9O3QN7ikEWW+KSzZ9fTTpkwyBRA161rm3vTxOH8jsvHCbRtkKaAM
	T3/i/FloKe1HdNOCZxrX2yI4MQWJP6ylJrB42P67hT7kmKbJ6bNk1RYEMkFxn3GKZNCHaon+SB0
	Ksz5tw3EGsNpuvsOBAZpgAWc9B0ESkhm8FcoLzGmEpW5klEpYIUD/W0Jkn2GD03R8cWgRjqlhlu
	Eqzor1EDs=
X-Received: by 2002:a17:906:fd86:b0:c12:717a:1d79 with SMTP id a640c23a62f3a-c12813744d6mr19854666b.5.1782736393241;
        Mon, 29 Jun 2026 05:33:13 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:10 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 1/5] net: export __dev_fill_forward_path
Date: Mon, 29 Jun 2026 14:32:49 +0200
Message-ID: <20260629123253.1912621-2-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053315_362607_04EC3E5F 
X-CRM114-Status: GOOD (  15.62  )
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

From: Ryan Chen <rchen14b@gmail.com>

Export __dev_fill_forward_path() which accepts a caller-supplied
net_device_path_ctx, allowing callers to pre-populate context (e.g.
VLAN state) before the forward path walk. The existing
dev_fill_forward_path() is refactored to call it.

This is a prerequisite for nft_flow_offload bridge offload, which needs
to supply a pre-populated ctx for bridge port devices.

Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 32 ++++++++++++++++++++------------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 9981d637f8b5..c1d0b897de95 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3422,6 +3422,8 @@ int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
+int __dev_fill_forward_path(struct net_device_path_ctx *ctx, const u8 *daddr,
+			    struct net_device_path_stack *stack);
 struct net_device *dev_get_by_name(struct net *net, const char *name);
 struct net_device *dev_get_by_name_rcu(struct net *net, const char *name);
 struct net_device *__dev_get_by_name(struct net *net, const char *name);
diff --git a/net/core/dev.c b/net/core/dev.c
index 4b3d5cfdf6e0..62f1d0b64c76 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -750,44 +750,52 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
-			  struct net_device_path_stack *stack)
+int __dev_fill_forward_path(struct net_device_path_ctx *ctx, const u8 *daddr,
+			    struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
+	memcpy(ctx->daddr, daddr, sizeof(ctx->daddr));
 	stack->num_paths = 0;
-	while (ctx.dev && ctx.dev->netdev_ops->ndo_fill_forward_path) {
-		last_dev = ctx.dev;
+	while (ctx->dev && ctx->dev->netdev_ops->ndo_fill_forward_path) {
+		last_dev = ctx->dev;
 		path = dev_fwd_path(stack);
 		if (!path)
 			return -1;
 
 		memset(path, 0, sizeof(struct net_device_path));
-		ret = ctx.dev->netdev_ops->ndo_fill_forward_path(&ctx, path);
+		ret = ctx->dev->netdev_ops->ndo_fill_forward_path(ctx, path);
 		if (ret < 0)
 			return -1;
 
-		if (WARN_ON_ONCE(last_dev == ctx.dev))
+		if (WARN_ON_ONCE(last_dev == ctx->dev))
 			return -1;
 	}
 
-	if (!ctx.dev)
+	if (!ctx->dev)
 		return ret;
 
 	path = dev_fwd_path(stack);
 	if (!path)
 		return -1;
 	path->type = DEV_PATH_ETHERNET;
-	path->dev = ctx.dev;
+	path->dev = ctx->dev;
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(__dev_fill_forward_path);
+
+int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+			  struct net_device_path_stack *stack)
+{
+	struct net_device_path_ctx ctx = {
+		.dev	= dev,
+	};
+
+	return __dev_fill_forward_path(&ctx, daddr, stack);
+}
 EXPORT_SYMBOL_GPL(dev_fill_forward_path);
 
 /* must be called under rcu_read_lock(), as we dont take a reference */
-- 
2.54.0


