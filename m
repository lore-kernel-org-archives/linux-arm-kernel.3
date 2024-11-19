Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26BAD62069
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhjXvlF/z+0rM6u5ozJqSa6SbSygSBJ+zrfQOupSHO8=; b=aez83mIe4GDrgZKQpCMHhvlwDM
	UfqoQUslpIavq414eWcJ2QIgsJw5mQWxw0Jd1kV8knh3h/j/+Twu0/GDP2cwgKxPPYxfcFRsYCGZk
	4boyKG+3A8qbJSowutOkpCN3PtOPKVDem2QK6D9sHOkf98y2VST9W0f+w1AydPO4/lOZLoLub1mjn
	ctnq3wATS05tS1IxT7Sk9vExio4OnG/A8auARHrSnNmApYFR+XLUdcrjvr9Fvy4Oy30Xu07htSM2r
	sxeda1FADCIDuD9piP7lCvkm6KESOJVIVBt+9rtMGaMkWzfsEVioFv9ebx0Z4nhY+18umg9J4vFQ7
	pfEctNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLQk-0000000C2nJ-3cLC;
	Tue, 19 Nov 2024 10:25:58 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKS-0000000C11H-3xD1;
	Tue, 19 Nov 2024 10:19:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cfd2978f95so2085271a12.0;
        Tue, 19 Nov 2024 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011567; x=1732616367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhjXvlF/z+0rM6u5ozJqSa6SbSygSBJ+zrfQOupSHO8=;
        b=HbhDTOVIJZJciD0oy62pzhXsq4JNhhdrugmG3/0hqaayDOcVJIr/j2dqcprzWvnOHZ
         tapAZlaWrc2GiuQLkeNfgRWCuKRVY5i8/kFgb0IMxOoAb0cGkUNUqE/oQzRcUhcFklFS
         gZrRzIG7hL0v3C5uAXZMABSnGZ/CJBRFcaoBzwJHR3giNieRoBX63D0jDcYofEV2aoaF
         0lugt9PdFjbDwi4VmKunz0tKG2rBKZEcYkPRIHgpjLK4sf+nfHJX2d1afrFzOisEhvUL
         BkYdoqsFLTkThML8Z2DPyuQQ5VVqG1P4PgQzeoJaIhum6BZ14McvoI+nkCve3NZvYCiT
         pI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011567; x=1732616367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhjXvlF/z+0rM6u5ozJqSa6SbSygSBJ+zrfQOupSHO8=;
        b=PlsNLrZOHQVM7cE8LUYXf20vXkONgCh0oA7sMtkrsV4pnx3HC1PzNkSAyDchCCXA4b
         wM3B3bpxTHw3Rrmh0RaDKx36akuRY2q/IbChdhb2dzJiaYKgRTEXZRj/01EG0/YpbnAq
         eiptKA0flJ/j3IEm5LW0MUFdilnN+yQLSU3TPoixcRWu0SrXJjswKreg8R34omYwOHkV
         /ESJGTtrykQaDwL2/G8PizNshL3AkTnuRt1mWFeKBOw5JNOZSgcc3kBjMFVuZ2qcbdJj
         Co3O7mgh/kaG4rijGyL+S9H19/JNhaCPXJlBoOYd4Jbp5MCHB80oWibwsZmTxTxcG6m5
         ZJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGs7jsxM3/Ngyi6vZ3YbNaKna/k+HfWC2FXVkc62D3s913K285uJ4qMFlT1FF8r4/cH/dnhxDdPE4VGN6Xipk=@lists.infradead.org, AJvYcCUp3ur5dWDk5dSjMoiu0pQ25Oc9oTFXXK8V6CgpuMqxMxDHMGwjIm7Q6g19hlZ8ZtfKcOrISSucSpc8B6fV3WDd@lists.infradead.org
X-Gm-Message-State: AOJu0YwvVSyVb49OPIQh7QKaU3BGYqb9K2i9qJF/F9R8/omf744ac0Ca
	Rz5R/mYbK4kLMyFGqJBGJsctngoMlIu0kWjFTD9riatFZbFSqczf
X-Google-Smtp-Source: AGHT+IGzB93ZeO7pNN+fEomEYrj7b7jdCBNk8D+nmWW0jpw6ZssNgDprYV1yl7YzBLGgZvsa4c/n+g==
X-Received: by 2002:a17:907:9303:b0:a9e:d417:c725 with SMTP id a640c23a62f3a-aa4833e8fe9mr1613209266b.3.1732011566595;
        Tue, 19 Nov 2024 02:19:26 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:26 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 06/14] net: core: dev: Add dev_fill_bridge_path()
Date: Tue, 19 Nov 2024 11:18:58 +0100
Message-ID: <20241119101906.862680-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021929_026739_DFD68149 
X-CRM114-Status: GOOD (  17.67  )
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
index ecc686409161..15923d177f9e 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3143,6 +3143,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index 13d00fc10f55..f44752e916b0 100644
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
2.45.2


