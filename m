Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A482C28B21
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XruRHgHNa4U+aD5EhN/5bdzeM8wMLCsm+ZTeJKtfedw=; b=IP0Ammr8XEElaoWmVnkmPn1cTS
	rxac8a0s+Dx4ptUygtfz3U4x5a0JRu9FaX0IzWo2xv8CxSulurMQqzCZfXD4/Pjfs5nnIOmann3nh
	N7N0IG2Z/dgPbY/rif9OqrhZ74wFuNUqxoCPnftyKbvy8kizvRNilT2XZTnK8k2zUS2KgcrAttKJI
	jGcMT7BYXniv2yIiIrVdNUx75JHFqATwkKNo3OyQOovXq29jY3Blt+/wMOz1fnSdRjyMVZb27xFoZ
	QMetKdWx7LHkLEYaReVCkuhD5US2rSkiuGJ91lPSxFs55QuyKXR2sglF7STdAM0uH8OnPQgQkmmv0
	2YOdKITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmlq-00000007pW8-1EDd;
	Wed, 05 Mar 2025 11:18:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm14-00000007gUS-27Xe;
	Wed, 05 Mar 2025 10:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XruRHgHNa4U+aD5EhN/5bdzeM8wMLCsm+ZTeJKtfedw=; b=JdlTAMkNwgUrYAWaY29GMELe9Y
	85hNrSnj4qmy+9qDYZVJec4KL+NVyVoRfC/ecViJB+NLOzTNmXYJ9Isf0cXEVmPt1NE/VTjhZ9874
	+q089CdAya5HBY5+CazaEUk0n5lCB7pOUWqtvbLiWpzULlwFGJBgIy54gwoI61joNfRZNAHXMJCuR
	YzmvpDuVoqL6/Yx9mtrJA/6qXShF68rckdjcjM5K+EerJ/oFXnSByecdxHBs9B4BhHX9jzakMtOJB
	mg1hVueVFELT+eoTboFJdyXHvAc6ysLIZBYIMfRuwWsto5HPn6SnymS3bIvLuPvpaHsBXNuCh6sNq
	9+jH3VVQ==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm11-00000000TCD-2Vub;
	Wed, 05 Mar 2025 10:30:17 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so5637931a12.2;
        Wed, 05 Mar 2025 02:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170612; x=1741775412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XruRHgHNa4U+aD5EhN/5bdzeM8wMLCsm+ZTeJKtfedw=;
        b=KN/PZRYjktYFOocDouVhL53r3NlU3AoPlTJ5GTFCv8wrzkn/rJhgdJQR/7c5i7w35k
         JLWA/n4i6hv4vMz1iiAaLOCZEuxPTLlwSJvT3VMjPUexf8KxkZAkamwimDgWKOvoESC7
         wNVpliniW2qhser8gTECzw9l+kR5jwQv5NmCLSv0u/NzC+xHmR4m/zfagoxrANTJYnSs
         jq4/NTyNoV6C1sObrMTgCBr+NKSwlAEFtmeqdT9kk0qLQTnEJgdK7jsj9jCCZTApj1nr
         xF9dOQoMl/6YiABh6Esi3V3WRBPoEP4nP6r8ErfE8v7pUamPv4X7QFrhCOxFZxck8qTc
         jy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170612; x=1741775412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XruRHgHNa4U+aD5EhN/5bdzeM8wMLCsm+ZTeJKtfedw=;
        b=atzdBwEx9PVgiPeI5TCcot1oNXjjZYUYPZB0lg8o6W5FB9JQnzj8qMCuB73gd9VXC9
         TQSobYeZ1jXA3Q464o+MGH+mqyhYSLMKd4TvM+uJMbEX+KWY7l3z9S7SGoEFEn++0Y4f
         GdQq08Jn5aefdC8duzttgIEvSkAZOzLz0o+5yXKWKZEM2c2Oji2Jwb0Qq2IHyoi8DdRC
         pK1XHwrRq+CPzRJH+wmWot49KfF3Kqzb3R/GsLgOzXjzcZPB/QGq14uHDUVduKIIiXGW
         Pi4+NQgVACrievc241v60kREbKJK0Y6aLGpwiVMPRCmPhWPtKN4WpmE70dOvIXSuWQT+
         2AJw==
X-Forwarded-Encrypted: i=1; AJvYcCWdgxKrZcp9lVw7Dtu2zy1xc+AFBtoBJDh5DLybz0+FyUDZDB3EeHIfZrPJ9ogmDE/xVvyX7XzyiARuhWijLncp@lists.infradead.org, AJvYcCX/q2TX/qraa2fvT+W8I3ieZhEtlb9rk7wwPGslqPvDzV137Y1dpTKgu7z91MEUQ4fvbyou3e3TogRMVs42hCs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt8WY8+r6OwPmz9d9euJoCywK3M5Y/CRA/WJZ1js4Lpu10k9WS
	7ZdazVYEB63Si8T/fMnqmbNL63X+acLvhrdYKkgzpohJyot+brEn
X-Gm-Gg: ASbGnct6SOrO7072XSKBNtJhyleRLjfZOOEVA6g7PcaxmEEVlHHRLEyF4OMRAQUrPnD
	JEF2kMTLnkjFbJjeihTa3MC9gNFrgQ3CoWSWcsg5Bz7O3jr+ODynyOogi2QEEEisoHqwkgePJ8m
	LoV+SnixZe1ENRH8L8MaujokR5cWR4a5HegeBWL9mkWpndDv6IPUTtyMCHeDLX6L7xH09ymgUL2
	xiT850qcNMEco7hhjBo/ungZ+aTjjrrWrRx3w5M97I0pbg3dEVFSmjPZbuZxv5pxs/8jmoUIS3M
	rhvfNTVEerXxsgrBTS1kuouMHKgs9WZHGqcvzJQa9iSXkd6r3o4+c/EMI7et/hdhkYCGyFxj/yz
	Md/bOzKEKwf5GAbhj1obbCYZBDIjczc2L8vLb2CZ2g5Wxy4WyIx7eQ9SoKJB+FA==
X-Google-Smtp-Source: AGHT+IGWn08A2DSO8MVNqGyk+bS/v/k3a0mXwDhZkKNPGgmv7Ei/GzcOqONoOScVVDEII0Mp72AZ4Q==
X-Received: by 2002:a17:907:1c84:b0:ac2:473:7f35 with SMTP id a640c23a62f3a-ac20e03dcc8mr267370466b.55.1741170612157;
        Wed, 05 Mar 2025 02:30:12 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:11 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
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
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v9 nf 07/15] net: core: dev: Add dev_fill_bridge_path()
Date: Wed,  5 Mar 2025 11:29:41 +0100
Message-ID: <20250305102949.16370-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103015_732148_A82BAE73 
X-CRM114-Status: GOOD (  17.45  )
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

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h |  2 ++
 net/core/dev.c            | 66 +++++++++++++++++++++++++++++++--------
 2 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7ab86ec228b7..81cdad85d9f1 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3318,6 +3318,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index 2dc705604509..d0810f052d3a 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -714,44 +714,84 @@ static struct net_device_path *dev_fwd_path(struct net_device_path_stack *stack)
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
 
 /* must be called under rcu_read_lock(), as we dont take a reference */
-- 
2.47.1


