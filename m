Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CECC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgvvO4mRAt67HclOcho5/or4Z9zLgPRzxsVdNZtTjYg=; b=s1TQKT2V8fKyzkXwCPxv68IsES
	9QUKOttjmDT/SQV9L1ntYLqSXSbWQ4d7SjGiQwTgoIMVckDKjqs601C7PAmr5/Stll2fgcsIfyAmB
	A9Bv2yfhIIb2iIFr9p40W2ADioGgd1mLXFjdrxu2m2bACWg7xWQocKaETByN1IxdC4yBN7Gntxwwf
	VbZOD2cHOYjKkpDdH3yUlArda/4vsctDxQxIdoHk1br8r9KBj7TH5Sc5X9AU15SMDQUZMxOwFpZ6E
	1m4fLBXz7zj7dL6YhVDHv0LIu2KeMMyrEm16bu3noNHsEKPMH6WKw/aUcCQP0qbdmAy2lj57H6ket
	Nk5onbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1v4-00000001RHD-321e;
	Tue, 25 Feb 2025 20:52:46 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M2-00000001Keb-2544;
	Tue, 25 Feb 2025 20:16:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaec111762bso407720866b.2;
        Tue, 25 Feb 2025 12:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514593; x=1741119393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgvvO4mRAt67HclOcho5/or4Z9zLgPRzxsVdNZtTjYg=;
        b=NzHCu8xC0IDjTiRAOmyRT6bRgFBhHcNvk0r6f61qq3l3d2HKc0pedn3ZVyZD74nyJ6
         A+A0elDi2MaS58XM4/73Aacb3Eriz5h+ioJux7MM0ZiUoYGLdZJNT26QBRURrkiludFt
         Tjnhv6Z1JqPUXWty1RCHi9YR+DQgifVcGypc5E/3PvD3bL/NMcEuCKX7Yl1Bl9xJK87N
         FUFyTFl5yDYntuFB+9BXDSBvbu62ESzr4bJEmYMH42oWBRXwircixia5UuB2YV/LYz1C
         cSv/qhTNjvJXcpCMn0G9U7orwZhbladnA1OQPS5p48CluZPvTJivzIgxA6cE3BzJxXIY
         eMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514593; x=1741119393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgvvO4mRAt67HclOcho5/or4Z9zLgPRzxsVdNZtTjYg=;
        b=T2kNYu1hKQd8jGUyi48tDiGk5UdRREPoXMwoxD7syqvIgaDnNFZgp0NjtKpWwmLyrc
         tWYcf4krmBOLxYhnG9khtecdeSWMor4JW/PDPYuG3nNPqVDVjeMIOIVEji13BVjFG3Qg
         WDVVHbzC0bLX8ej6nnCEeT1zVzxDDF/zinwj+uEWGb5yoBJ4biO+Xt+bp7TK9HQet47A
         9/3v4dy4jFTsBZUmgeLIHFhsTw9xS222uiTiSKMylBoWI0y9NIe2EwZB2FfDlzPldaTE
         LTrNLwDIRZI2bM9bo4BQGVk3QlDlQPymYbGqsyOvMeevzr5X99XsMG28pKxAd9kyng5k
         IYUw==
X-Forwarded-Encrypted: i=1; AJvYcCVPTH1ZWT3467xytPF4WmnLgKcMYbW0HwWCGx5CR/b1ev/PuEUe5Xb4eDF21ZW+sPfBs2NvC6kvwzKGDr3MSHIL@lists.infradead.org, AJvYcCXQjKEAN8XasGYH/vSV3LqlB1zLMGCss+SOxsyjaxvBR6HAfzU/yzvn9fVejILe/z00wxRlj5JkgTXKeIWUesA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxytLnISVs53fTEl72FJASCS9V0LdE2afwxRNKQp8X7RwFjwEB5
	anUjGDLiL4eWsQjSBtNTTCrzlvW00Pf+d/93iDEGP3rloanoC7gK
X-Gm-Gg: ASbGncu1nGIBR7nHazIdwPIXVepSVVqnA1Brg0lMX/RfoZU4MutkS9S8QTwopuwSwue
	WLmmaNrt37px2vx+5Zz3Vz01rrgv2OsY02K+WhZSXQx8QGp1C+iqThxs8bHzLbgSwtC69G8/yG/
	dHngiBy8Aw7t3BsgqAoR/F14MyWQY9q/3IOlsAuBpyup6G4TVNbq3zEXsdRgLzteQAUZ8uTe2QA
	f4LR32hGzlKQRrDepJdpShFzCXX6kQFfoIaW/OuIMFWy5nUX0jw3ZWiIUwrv0c8zO8iA4s9mLKS
	xl7PpIu0ZGshdhwfgVNzpR36YCWmxOHbYBZptnYCotXdLh+QrlhTvU2tpFvf6BlBJyzoGQ+DuS3
	RXT2uf+bPEIavCkr4fEvPJYHLHOMCZIDqpm4dTnVXBxI=
X-Google-Smtp-Source: AGHT+IHYa/rnJMcG6bw4DaLIqU4PpMQ2X1tUCpndBeXitg+IOobUcH2l24ISv9vbXMdXY/Di07mP4g==
X-Received: by 2002:a17:906:31d1:b0:abb:e95e:f2c3 with SMTP id a640c23a62f3a-abeeef4216amr55910166b.41.1740514592646;
        Tue, 25 Feb 2025 12:16:32 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:32 -0800 (PST)
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
Subject: [PATCH v7 net-next 06/14] net: core: dev: Add dev_fill_bridge_path()
Date: Tue, 25 Feb 2025 21:16:08 +0100
Message-ID: <20250225201616.21114-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121634_534918_209E6F97 
X-CRM114-Status: GOOD (  17.66  )
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
index 9a387d456592..695445927598 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3289,6 +3289,8 @@ void dev_remove_offload(struct packet_offload *po);
 
 int dev_get_iflink(const struct net_device *dev);
 int dev_fill_metadata_dst(struct net_device *dev, struct sk_buff *skb);
+int dev_fill_bridge_path(struct net_device_path_ctx *ctx,
+			 struct net_device_path_stack *stack);
 int dev_fill_forward_path(const struct net_device *dev, const u8 *daddr,
 			  struct net_device_path_stack *stack);
 struct net_device *__dev_get_by_flags(struct net *net, unsigned short flags,
diff --git a/net/core/dev.c b/net/core/dev.c
index 18064be6cf3e..d5f4fae840a2 100644
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


