Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDEBC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glD7coNk2GO9/l1adKLN+uo1Xfh2D3YWudU7CjoMsSA=; b=JNjPwiHRP3vlijc2AcGCqjQPdN
	AdorW0AE75HZYMwL/chVt2TnQchI/vh9kt/KA7hKVfbwp+Mv69s/0145629MwXObANsbddWzQsVCF
	bSg8SCZ0o1yqy1Oh573PWsa+MJPFyR9J8aRNArjHn1pDKTyAwXqI0J4L+gQArEjR3nIbiIme8qsy1
	bLyUL9X+r4WyRQfEAC3/DM60pgzSUMkY4LABx2mMUUdbMIoyEAh/LW0YW6cPhxJhrWuWFSxTzBUTQ
	X5UARco8YHLKAMPZyGIj3NyMUG8YGBhTc/+kGd/WRKLTyWZ2yNG6qOnXPpdUGtvIHHsuAYj4PKpDx
	StHASdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7Lv-0000000CetO-3Vna;
	Fri, 28 Feb 2025 20:52:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mX-0000000CYJg-3waD;
	Fri, 28 Feb 2025 20:16:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaecf50578eso481652366b.2;
        Fri, 28 Feb 2025 12:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773784; x=1741378584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glD7coNk2GO9/l1adKLN+uo1Xfh2D3YWudU7CjoMsSA=;
        b=W2DJw3C0FKfg6dadBoiwvVUCnY4VYmX2SUn4+32/roD2pXdczqSv4Omr1DtLLTDT/F
         36agXKuw2DltPYYEf6DYnLumSV2xJxcZvwdeVMZq/cyLzap6MyfJ6nQRnmorgJff+ycH
         nmfy6xUTgVx3se5YcDae5EVK9F08ES0jABvUHusSX5FstVeBO/b23k9wqQ4RIwD6Rcsx
         /QUvc5T8p1U+vxB8Fab3o/PnX3h+X971sPwNIXrEAvkv0s3DIjimGqQoOSF4c4UYxYxy
         XWo+YSFdvZ6+QFJq+4HvoD3X0NjPYX4PFYmDRqWJft4Z5KZIsKHnMIrpvNXs0KBGsLbN
         +RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773784; x=1741378584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glD7coNk2GO9/l1adKLN+uo1Xfh2D3YWudU7CjoMsSA=;
        b=QoVnbWlqpa4vnxbUJ+bLwwi6tBdiqlvTuEEFa3sB+7YIDhE+E0puFtGyyBxC2/W7kV
         7hvHiI529gIIlZGxjFUc/NLSxJhtWa+NTtlJpEoOED+sbBxM0VVShMu5hIqyUZlfe2sn
         0W1yi6rX0AOe1oi/a6cqXEbUHdlcnvs1ErHz7+TG32N3wG/IGhIEwMTXwwyRy5my3xYk
         /kKdaRRW2rAmGXlVx4aifMm3u+hUds6XjDBdI25FHlf5RWFmsOvNGkCBKBFjExn7G0+B
         ACTH5z3mFtVYQehxFEIgVDaVNmVWPDRzOje3duwA4n5Ju4xCXOcY0KflgyLoJLIXn1Pd
         IT3g==
X-Forwarded-Encrypted: i=1; AJvYcCWHbzyDR7DDH0loDA/CbglfBgkr7k3x1QezHuJXzwfMOykXKlqI5iP35eppO8oB/yGZ4W4bunzjpstjSNtsZqw=@lists.infradead.org, AJvYcCXicJSvslCtJ9gFLw7Un2z9pqTxGKsK9f2vMuPRmpYFEYGqVZjW2NEQU7dbRZ9fns60sIK003GRhV1XXdpXxctj@lists.infradead.org
X-Gm-Message-State: AOJu0YxGFRcGwEQvj7/HXFgVc1Y+FDejwPyWhn/ispH5inOCN7A5uB7m
	Vd5J4r2GUQzwEnWA0SaIuuDx0aOExCHYFLXqO+0ySLKwAG4ZQ+Ur
X-Gm-Gg: ASbGnctBA3hAWm4+VjXrl0JFsrQyZF/m4Qrx8Cz9xIJIubRjseMZ4KEAeRhUQJa4BL8
	BNZ2CdhzLttZ6igh22lfFhO2ET9N3onZyoqXU8qq/OrV4WenIbyhSSNc/f+tgFpVfqU8/73SGAF
	TspR4iMKQ2ZEhVKV+jBq9K/c8HotpLIV1H8DAGqxddcOL1UsICsJ167jpFOy5ZcpQpAebAZSnxa
	PH6w6lQrZAKYLkZldS+T9xNS+B1abe1eqp2sb6lIgnSm7Sbbb+tm6vNFBFxZjIhJ9EnsbNPJtme
	9X1RPzp47JqKsA6VfCo+/whzE7Y/4RzcxRIeY9FLZVgAKkalzr7NxKgBPOLhPSiLGLVua6ugqVi
	1g8B2VOdR3QTMzOnZN55Xf7GcKwfjkDHTyFeAdHqlCa0=
X-Google-Smtp-Source: AGHT+IEkD4+S63CdkvFhMcDqcuwDe3gQEzkaBi0DoNz6EL4MylQGJKFnzY2Wc6+ZXTl1u9JBQtGaYA==
X-Received: by 2002:a17:907:7f27:b0:abe:fa17:12e0 with SMTP id a640c23a62f3a-abf25f8dd1dmr472704766b.11.1740773784160;
        Fri, 28 Feb 2025 12:16:24 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:23 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH v8 net-next 06/15] bridge: Add filling forward path from port to port
Date: Fri, 28 Feb 2025 21:15:24 +0100
Message-ID: <20250228201533.23836-7-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121625_978502_FBE462E5 
X-CRM114-Status: GOOD (  16.39  )
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

Changed call to br_vlan_group() into br_vlan_group_rcu() while at it.

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
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
index 1054b8a88edc..a0b950390a16 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -1584,6 +1584,7 @@ bool br_vlan_can_enter_range(const struct net_bridge_vlan *v_curr,
 			     const struct net_bridge_vlan *range_end);
 
 void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+				    struct net_bridge_port *p,
 				    struct net_device_path_ctx *ctx,
 				    struct net_device_path *path);
 int br_vlan_fill_forward_path_mode(struct net_bridge *br,
@@ -1753,6 +1754,7 @@ static inline int nbp_get_num_vlan_infos(struct net_bridge_port *p,
 }
 
 static inline void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
+						  struct net_bridge_port *p,
 						  struct net_device_path_ctx *ctx,
 						  struct net_device_path *path)
 {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index d9a69ec9affe..a18c7da12ebd 100644
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
+		vg = nbp_vlan_group_rcu(p);
+	else
+		vg = br_vlan_group_rcu(br);
 
 	if (idx >= 0 &&
 	    ctx->vlan[idx].proto == br->vlan_proto) {
-- 
2.47.1


