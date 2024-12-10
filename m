Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9ADE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgr56AJOAsne10L7JfWzoylFaIhH9l45zqgX/3P/NmA=; b=WSb/BgDlKYheQbP0RbHirEnnS6
	92eyKzUf2TU6xGF6rE4NGHeObWDm/aQ+iDGa2p8Z3TxOV9JWJmbwDJg6dmtSEIUFB1v9DFHYVIMtb
	vgWjFA9DJk1rTSunl+ztcqoO4Ok5iii9yl9wzAVzY+zJzF41a7ZYq/6OSOFFDmNjv6PG/rxdWi7DM
	N5+1abOGm4Q5YmJ0GowK/4JSQLv2KdlL87a8KlN8TeogAQ6KlkK1YRLms9ExNNXP8jY9h4YGsBxhS
	AQ+o1HFRK9cSRK3rj/FAJncdY3Q1NgFUzhYgws2gk4Ea1JEtJ1DuErCybPTTc/ZE//HWn0sz85rSE
	auNqunNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwv1-0000000B0yO-3r41;
	Tue, 10 Dec 2024 09:52:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwov-0000000AzFv-1Fij;
	Tue, 10 Dec 2024 09:46:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so7105960a12.1;
        Tue, 10 Dec 2024 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823979; x=1734428779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgr56AJOAsne10L7JfWzoylFaIhH9l45zqgX/3P/NmA=;
        b=AxnfofQ8m0LjEcHIYR6VmEaiXDXQxPYifCXyC3YrQH9Lk43haXIuIPYJEbWDmKSCpG
         SFnQCk2EKsoNf+LsRIIW72EpJrxqPiEYDeOPYVCKMuyBbzbhgU2UzFumdV0CUUgeMddr
         qThNMKjUAsOn6Qg5k39wtuxB2OIAiF4x1vxBa1CgwfN5w+eZeTkIIfPog3FCMC+OKloP
         y6OdSKY9vLUXPUGUGdeFzvDJF9m3ouq9eHdXQ4i8/xlcxXjFK7TGmBPxAqRfuRgjw0Xf
         /svLgVsaiA6EVG0O+P+d+7fmVIaLd0PK0M7QZFMCc743uZiw+jehK+CQs3d/S9v+5Sca
         LsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823979; x=1734428779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgr56AJOAsne10L7JfWzoylFaIhH9l45zqgX/3P/NmA=;
        b=aPKi5t9cxEW5bTGkdnaB1e2LFR0xzjHp2GJ5j1v6WBfNIsnWos/Ok3s2f6oZaNtg/2
         5KOEmO384Jglo4v5+jJlE8ktF6wygjiHqDpLhMGBoDApdY4CZuqhEcvcYC+mOrrOlnCG
         HYMn7jELoAoRbk+/NjqyB33VjuwHEgS7K4e5gaknaIv/FIwn7FSXvL55zxeUzNEQ32mQ
         tkxKDoh4KXpTkMpRbc2eM70gNq1+ILQmgyGpUQUyfGhFgn9Fxc+pApikUIrtIPqb/1CU
         VcPDFyzRoKa5MwGZ2ya7WLtlMUb13Gxj/ZIWUUI1Kx0gAQkvUNINGF+b+JKnqhn/IwLM
         AD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLpFTogYG1ygXZrd518+ftgty9ldu2/cuFX41d9cYV3MI5up+6ZVG1YLTuw9DeDaESnjQQD4X7s2Xbw4v1V4m2@lists.infradead.org, AJvYcCWvlVQ8/tJDMQbl0gWg249RGkIIMkkbhYkwdcQ1GtFyRHQTgdpXxWvIqiohH5MyU65YZIM7wk1+6N1wWPi1xwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEtyerFftVrPGuIl8EbydjdaH35nv4PB9m8etIK/2eKJMQQ+dq
	Weze59fu9FGZ1wGaiiSsDHs/n3BzRtHkqsZD3GkS8HYnab1VV1hW
X-Gm-Gg: ASbGncuGGjhuE9yNe0r5J5R8vNGC9Aw5Rn1Ej9tdqzowD8uv1nUGYiuQHYuhK2jX0OQ
	pc/7yiSPFiytgp+PeQIkizrXJ0iJ7vgOXEDLp0zqdA8g91fMnAUQ+MnXMJoWvh1M7CKJDvDVhKM
	7rycaXlXr9S4v5gScOJqDCjvLQ/RWEEfso8i/eeXQw+0X0+w0JCfcqUmBP+TgQw20SE8qsrNlEP
	hwqLkYeTEn1qhitFtFW2Ff7P8H5b3RCbgaz/Ot0lmREX/ZLE2DArbeeWg0uFTnIvn8BYB9OvLms
	3LVTSTudc0681hJKn2LeEn4pCN3xTbWWbdcLNaorusLmp5BfiQgFCkiKGCP3sLIszkZaMzI=
X-Google-Smtp-Source: AGHT+IGZmVUxUDExEwI2I/Wt1QDwE1SDwE0IGYTeBPK1ELBKPlastjt+1dn458EDLOHgXMoYKOhzNA==
X-Received: by 2002:a05:6402:3484:b0:5d1:2440:9b05 with SMTP id 4fb4d7f45d1cf-5d41862e405mr4691296a12.28.1733823979183;
        Tue, 10 Dec 2024 01:46:19 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:18 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Ahern <dsahern@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH RFC v3 net-next 05/13] net: core: dev: Add dev_fill_bridge_path()
Date: Tue, 10 Dec 2024 10:44:53 +0100
Message-ID: <20241210094501.3069-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014621_344722_D8BC6104 
X-CRM114-Status: GOOD (  16.85  )
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

New function dev_fill_bridge_path(), similar to dev_fill_forward_path().
It handles starting from a bridge port instead of the bridge master.
The structures ctx and nft_forward_info need to be already filled in with
the (vlan) encaps.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 66 +++++++++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 135105441681..6dbc442f9706 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3183,6 +3183,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index c7f3dea3e0eb..01dc51abe7e8 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -713,44 +713,84 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
 	return &stack->path[k];
 }
 
-int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
-			  struct net_device_path_stack *stack)
+static int dev_fill_forward_path_common(struct net_device_path_ctx *ctx,
+					struct net_device_path_stack *stack)
 {
 	const struct net_device *last_dev;
-	struct net_device_path_ctx ctx = {
-		.dev	= dev,
-	};
 	struct net_device_path *path;
 	int ret = 0;
 
-	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
-	stack->num_paths = 0;
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
+
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack)
+{
+	const struct net_device *last_dev, *br_dev;
+	struct net_device_path *path;
+
+	stack->num_paths = 0;
+
+	if (!ctx->dev || !netif_is_bridge_port(ctx->dev))
+		return -1;
+
+	br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
+	if (!br_dev || !br_dev->netdev_ops->ndo_fill_forward_path)
+		return -1;
+
+	last_dev = ctx->dev;
+	path = dev_fwd_path(stack);
+	if (!path)
+		return -1;
+
+	memset(path, 0, sizeof(struct net_device_path));
+	if (br_dev->netdev_ops->ndo_fill_forward_path(ctx, path) < 0)
+		return -1;
+
+	if (!ctx->dev || WARN_ON_ONCE(last_dev == ctx->dev))
+		return -1;
+
+	return dev_fill_forward_path_common(ctx, stack);
+}
+EXPORT_SYMBOL_GPL(dev_fill_bridge_path);
+
+int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
+			  struct net_device_path_stack *stack)
+{
+	struct net_device_path_ctx ctx = {
+		.dev	= dev,
+	};
+
+	memcpy(ctx.daddr, daddr, sizeof(ctx.daddr));
+
+	stack->num_paths = 0;
+
+	return dev_fill_forward_path_common(&ctx, stack);
+}
 EXPORT_SYMBOL_GPL(dev_fill_forward_path);
 
 /**
-- 
2.47.1


