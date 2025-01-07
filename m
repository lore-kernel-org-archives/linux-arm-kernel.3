Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB23E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrwgi24+JwpSHmI0m5MVBAM3u5qvCwn+TDjEgeV2UcI=; b=cWifbACtHPyp6qxzY40xwo7v+/
	TuQEFZHJ0D5qv8mcpjgbDog2TJJ85PYtz4KINgg3CDohayaBCQeoDD+uISJtoYSU+GFlu7nx1gRQw
	dCXYKh2gf6D2b9ipgPcBC+4dRqofRYqMv2jRmUh+wua5SXIRoUFhzq7Nx8fFz6QLfioBTUZvdqjPv
	Tjt4rOu1YWqz7dwdjZ+44UwjwCTnuI24xbr82I6p/hy/tLO5kKLp/wx5qTXtjXMvsWYoyEx2ie2rZ
	v3dHaZsUlqGsjuyKPfAi3NHv/YZwVmzTxxX3vU9WcHCJWDXCtIKRct2nXHjHfeN3I5Wo7bKCWey1v
	+f0I56Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5eL-000000044R9-34Ds;
	Tue, 07 Jan 2025 09:13:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XO-000000042YM-47oB;
	Tue, 07 Jan 2025 09:06:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so21924144a12.2;
        Tue, 07 Jan 2025 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240769; x=1736845569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nrwgi24+JwpSHmI0m5MVBAM3u5qvCwn+TDjEgeV2UcI=;
        b=Ld4S2bSOhxNVBAEUfZJmC6Wth4/2+2Mj3CjzgL+PKz84SEcddFpxeBywyeI1kEZaaL
         L/xmAGcu/hUBhGrglDbJ7DOcaaGduRkr5NnbHZ01p8aMtb/pvQVmaHzyzTJ0CpcCvWwT
         WoxuRq/vQ/r8tlmp+s1Awat9dFEKrTR4LoEazvGx9SwD7MfRb/4E8UFaq9KHE3f2tW9E
         710tOQuWfK1VdY85MEyBl6MAZaSNPSFi7Nx6hAzHyS2pLxZwXw7FszyEiwMZGg21iJ0R
         5GA/vQ6nhvXlUus+eIST7uv7yUr0dKSOOiVDFhLyOr9EAARVblbuTArF9KPe+Xc4tfVN
         /q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240769; x=1736845569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nrwgi24+JwpSHmI0m5MVBAM3u5qvCwn+TDjEgeV2UcI=;
        b=LWUuHr0ZFTNLiVctII4hqDR4KIj3BP8mQMSylmJFJPuDtU7GNxR/nav4EgXdUGEBWG
         zJYfA1rVzwwWrkfht4IHgq/K1BH057Eeax4yJgqeBgY4cJakXwVPkuKVqwsT8561/qd7
         mqsocVfaqisVFAxT2D1Q2ohglwZ4vVn+0MDgJ9+Ap0RWSt0al1NBkXUDK5SQMwbMeMsM
         anUI9XZzDB55rMsoyDtM7p9OS5eY7W/1iW/RFQ+gmRXS3Rpz6ryPY4UXeK0z07UjZ6PS
         s+/SXixbSwup0bCV5fwHuecuQKYHrrMPLkZuEpDQziGtraYPH3Cw3H0b/0jHpC7Hej3J
         ZtAg==
X-Forwarded-Encrypted: i=1; AJvYcCUfKLPQm1kWV6CL83QDoU4SW6z6NwAsD4FOIvyS4J20ZsmnCXVlun9gUFWdRoXgUaOGBR1fwojQ3Y0hDed8Yvun@lists.infradead.org, AJvYcCW/kpKoORxmfs3ZFHCDtDDr35UwXU6v5aghtU0V/ptshZ03TSbacy/gUYCt+BuE26tYSHgYKY1M2gvoHeZFIec=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjVsl1FXKXL3OMdyyw+vcjgkfNdFpzppFUsIoArR31vjeA8yjE
	PfIzq4XU8q8CkoVwcfoRctdRiR6bA3UvUTkkbXJMTpvmXeOeeYyA
X-Gm-Gg: ASbGncvedF3jsm7qhoMLG+x3KrwS77q37+f2zAXCLzE+q+XgWfEwuZ1NMemuULbVlOi
	VuT4owzcw3ZVeUQMpaaTRoC/T8wygWKzV9iuU/7RuaXzDWCXnMgu9zrSnNZDl/Nzx8Z322nKDln
	0aoGGOpyErI1/TAKlKt53O6+TspA5nU9ZgRyaA43JZlheNOZVQgCvUAvVfEymWZM2Xr4jdoq3HN
	J0YTV7U94oD0/b3/sdkSsJqT6Q/GY1cERZET162k46Wn/aZ1SDdeJDIC9dKQKJ0afOoD0AJ/GTU
	Ob0qneXMSq1B3U1Q7OMI2MYIsq0K/w5pQvuJSPojJDgiU4ujo1NQaRaMzXVRZ45fSGqMuXD0bQ=
	=
X-Google-Smtp-Source: AGHT+IGuixhYjL4SuyghMfzPKIs9WMN7N2be7FgjYC3LBKQ+ZlOzUPBDz9qqDNyF0KSv3KcGoiKbCA==
X-Received: by 2002:a05:6402:40c9:b0:5d1:1064:326a with SMTP id 4fb4d7f45d1cf-5d81ddbf672mr139428959a12.15.1736240768590;
        Tue, 07 Jan 2025 01:06:08 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:07 -0800 (PST)
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
Subject: [PATCH v4 net-next 05/13] net: core: dev: Add dev_fill_bridge_path()
Date: Tue,  7 Jan 2025 10:05:22 +0100
Message-ID: <20250107090530.5035-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010611_036263_48B7501C 
X-CRM114-Status: GOOD (  17.28  )
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
index 2593019ad5b1..7d66a73b880c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3187,6 +3187,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index e7223972b9aa..f41b159ee9c5 100644
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


