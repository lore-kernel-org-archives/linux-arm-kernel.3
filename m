Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A29E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFNROVzPiBTZyVVUJmIxiKujmgCuTGia69D/U8CcyUs=; b=wkRJLRABCEcf1xybl1ZalntzWB
	8fjZ0R/HL/XpI4FL8eOpJ9QBg0O7mMFW8YN93QyLGF2P7/VqhrHBtJkQCCPxHdtN7gQTx2x/7gm+U
	lNBTTnnGnIbyGWLL8K+LqkkhtJW4JFWWr3kYux7X4+SfCwn2RaH3VuYxcGcGOPXTZ8m2OXnRQW73a
	wsqp4hWzMbSJfm/sDx0eUUTUsk+ke0OgQsvRfl4i0FzRLEVVZvKiPKCss+t5Wd4BVdLIXBgxzPoWm
	Ot+oa4mDU1/zpzKLads78PCxicpB6AT+DkBGymrXYRCGgUMtzJMHIYyn2KW7lCNOi3sOb2RZ5PARd
	wMB5S4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwtz-0000000B0jh-2z3Q;
	Tue, 10 Dec 2024 09:51:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwot-0000000AzEy-3vbD;
	Tue, 10 Dec 2024 09:46:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa5325af6a0so855694366b.2;
        Tue, 10 Dec 2024 01:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823978; x=1734428778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFNROVzPiBTZyVVUJmIxiKujmgCuTGia69D/U8CcyUs=;
        b=bL3K+RmJuhevP0Zt3yeb9KpFbvLwDmdOQxYEezCg2yiTVGPhWC7VinPLNKR+t6CdH3
         Rx9+tRlSa7DGhp/yFgECOeho6fFB0sb5Kj7rgS3BAt28E7TJSJLoVFj2O1syx0NaS9re
         JVzktMOfTTlC4bQu06aEi3mU45t2QK662z0Dr4oTtdnNTxLveYGsAW7KpwABX+MrJRzB
         Yb3Yef5qZf+zW7+iH2FH1Bm153RibpNLc+KeRs7BslV7ivfrn2hoWuqXU9o6AM6SfBU7
         f+mv7EFCpwCbKj+tkwQ4r+t2DAYXKaq9McdMVgWvink9GH4A4vNByKdshKLpMURUVYDM
         k7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823978; x=1734428778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFNROVzPiBTZyVVUJmIxiKujmgCuTGia69D/U8CcyUs=;
        b=CY6cVGh2FAaUnzWmRTjla3xes9/1GVPz8b/v1dLayL0nYzT9J3TETKfj0phwR/bUIb
         Rz0AxKVuaRq6lyQDU7yNJH5bbRWF0ElKYLzwmNHGYDy3DQ9SAn2agUWIBY1qe3ZhBfy1
         P/cVMuWTcqBuc4OwzxGwDS2AHQ73sEhZ1+8kcfBG8m5Th6sc+m2gBt1/pNLMhXDenpmh
         s+4skfAm+X16KWhzwUqEYRMbTPE+yVXYfy4wvtdqSUkXt+vqeEx8hqLx1ct8TASFLC79
         e1SMkFLQa7MmRqz0B2HF9LAppzs39Fr62LwyvscQ+TNMjDg8DoqdiiUjqrpgB+Oy0jwJ
         F6eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQAT1aHbzZpyM6KOaX1H6FCTysQKBo+SEVT6OHibbEVlvcJCUz8r2rpzhRDS5TZVjcfIp+wP1kj91dRAS0HGtq@lists.infradead.org, AJvYcCVpNOVm0MxXpfNogazlgKzzOElA1axnw32J0SHjDolMfDqK38qtoi+G4g2zBE6d/T63rWEIJFDg9qoy2agrYC0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYZWrS4G4AieUaRzzGnhseZO6uuHEAgkGf4tQLe2keCfE0o94
	ZtnOIyHMo/+epw6KwUtSCeQN1uj18++B/rirjwOrJayRH0WpnkCe
X-Gm-Gg: ASbGncsrZ4yDhvySHQF/rQgeHCqYsqJ1QBFqRxB0h8F81OwBdapHb9m2mVrP3oq1FS9
	93nNP4NTu4fp7HpSRxdi//gJHUggf+MnP0AV5L+xw3j3Fe7T+/56dGvYSBIwaIDwk4Pi2e1q8Pu
	Q6/a2KtT6fkzY5awQAfgzDa2ZLik8un+pI9NK6L2xGFxPqUOMYipKw5PEs/2ZW4wcQ9EPu2KcCy
	rkQ/J11GbsRH4FUlG72/GU0MnPdEFSd1QthMq7w97oXkIlUVLi8DXXco+rO8KCwWkh7uycX5Qt0
	DK9Ew6PsmzMZLbf/bWn04BQv5loSXETXQoDAVfpQyJK4o1W5uS2AnKisvhv4DnfzwP4FASA=
X-Google-Smtp-Source: AGHT+IFck8FUe0I7ZA5vL7ViiiUaUyfpC35SDzrKqWUIlH6m1Fs13klQNmleCULSsIKK4sGjlxJe1g==
X-Received: by 2002:a17:906:3292:b0:aa6:967c:9aaf with SMTP id a640c23a62f3a-aa69ce44445mr361784266b.50.1733823977712;
        Tue, 10 Dec 2024 01:46:17 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:17 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 04/13] bridge: Add filling forward path from port to port
Date: Tue, 10 Dec 2024 10:44:52 +0100
Message-ID: <20241210094501.3069-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014619_998782_B7B81862 
X-CRM114-Status: GOOD (  16.27  )
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

If a port is passed as argument instead of the master, then:

At br_fill_forward_path(): find the master and use it to fill the
forward path.

At br_vlan_fill_forward_path_pvid(): lookup vlan group from port
instead.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/br_device.c  | 19 ++++++++++++++-----
 net/bridge/br_private.h |  2 ++
 net/bridge/br_vlan.c    |  6 +++++-
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 0ab4613aa07a..c7646afc8b96 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -383,16 +383,25 @@ static int br_del_slave(struct net_device *dev, struct net_device *slave_dev)
 static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 				struct net_device_path *path)
 {
+	struct net_bridge_port *src, *dst;
 	struct net_bridge_fdb_entry *f;
-	struct net_bridge_port *dst;
 	struct net_bridge *br;
 
-	if (netif_is_bridge_port(ctx->dev))
-		return -1;
+	if (netif_is_bridge_port(ctx->dev)) {
+		struct net_device *br_dev;
+
+		br_dev = netdev_master_upper_dev_get_rcu((struct net_device *)ctx->dev);
+		if (!br_dev)
+			return -1;
 
-	br = netdev_priv(ctx->dev);
+		src = br_port_get_rcu(ctx->dev);
+		br = netdev_priv(br_dev);
+	} else {
+		src = NULL;
+		br = netdev_priv(ctx->dev);
+	}
 
-	br_vlan_fill_forward_path_pvid(br, ctx, path);
+	br_vlan_fill_forward_path_pvid(br, src, ctx, path);
 
 	f = br_fdb_find_rcu(br, ctx->daddr, path->bridge.vlan_id);
 	if (!f)
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 9853cfbb9d14..046d7b04771f 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1581,6 +1581,7 @@ bool br_vlan_can_enter_range(const struct net_bridge_vlan *v_curr,
 			     const struct net_bridge_vlan *range_end);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path);
 int br_vlan_fill_forward_path_mode(struct net_bridge *br,
@@ -1750,6 +1751,7 @@ static inline int nbp_get_num_vlan_infos(struct net_bridge_port *p,
 }
 
 static inline void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+						  struct net_bridge_port *p,
 						  struct net_device_path_ctx *ctx,
 						  struct net_device_path *path)
 {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 89f51ea4cabe..2ea1e2ff4676 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1441,6 +1441,7 @@ int br_vlan_get_pvid_rcu(const struct net_device *dev, u16 *p_pvid)
 EXPORT_SYMBOL_GPL(br_vlan_get_pvid_rcu);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path)
 {
@@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
 	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
 		return;
 
-	vg = br_vlan_group(br);
+	if (p)
+		vg = nbp_vlan_group(p);
+	else
+		vg = br_vlan_group(br);
 
 	if (idx >= 0 &&
 	    ctx->vlan[idx].proto == br->vlan_proto) {
-- 
2.47.1


