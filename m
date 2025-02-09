Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EF3C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4xHwXg6EmPjQs4unBR1swhwZyfltEqvFEeKEtV+1dA=; b=Eq37ShA6pddxw10WKxhazDhWI2
	M+kwCLa2Bes7+8UE1E1xoRjlRUPiuwsX2Q2GxYAvR9afT399irRWNghIV+hNx9VeqZNedIW1uNrRk
	VydzAIAtOoT6mQPiqGR4ugTEeS/6ZUHPh1iJV5qUyKLcTdB6FATi14Hlszq9nFeaPSoPLgVQdgpsT
	c71O/8427Oao0gBKOABjUGZi88GjJ+f0V57FQysU84UTBBkwdx7JdocO5/20XIZcc217uG9a7ZHcD
	+Hggt+ROEmpVpAFQriwDJXdZf+9pwqW7IYkxgHtJDDC7kNSrx9oc/OOmSVwAb9vlxl0wz+fnb7OWX
	ijI/wuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5Le-0000000Eiia-3ged;
	Sun, 09 Feb 2025 11:19:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5DB-0000000EgZY-0PCM;
	Sun, 09 Feb 2025 11:10:54 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5de4d4adac9so3861346a12.3;
        Sun, 09 Feb 2025 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099451; x=1739704251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4xHwXg6EmPjQs4unBR1swhwZyfltEqvFEeKEtV+1dA=;
        b=bI0Cj4thg68qVTxEgzZGDn7DdLdqA/RfEqejaMCPEyf9KKBlPt2n6wj7AEIomJaRDZ
         dj7WYvjN3YBdZbEckhh6fYAMenDcMr/YJM1apP15uVsFH51A4VDe/jo0BaDefprUwQ6Y
         W6K615HjnCrIpsehVSm1Ziw3AQ8p+HT+YIYiwCbeP95qUZqwQQ/QUEUCfci7sbtvpCDB
         fPfmgjgNOI46yNzyPF0QbXyLrfLrNxFWMi5fx6HFbmUo0H5KJ939rcJ4zQc7LtwIU9R3
         l6THxhSaCUDY8DNJma3bQHvtVRD/g9cSF7XNLxqFYbnZgmWY3bztQ+VKwj047B/LJzPL
         x4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099451; x=1739704251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4xHwXg6EmPjQs4unBR1swhwZyfltEqvFEeKEtV+1dA=;
        b=B92bWcaQtksQSyWqewrYnZ+14Nyyp7D3pnIr2faWd4p/XlN3MLX9nm2t3vRpN2hmA6
         VIhvp7tE4oXfc9rLvKRagJ4M5IPTVVqQd/PkQF8OxMbXoohD0sH/PuvxeDc/WkwYwrsU
         w3zfn3qu+C/4Ap61i+jAzg+3qggBDGrtPVVJ6cSoEMCL/SVvdR0DmbQSoO6gBlMwzsIn
         NtnUnRbSrk+rwU4dMZA9TWQIhjR0g/yS2A/pU63WBGAeL1FCgJOzzCW3CwF4v57FX1nm
         tPfEiF7CCHgaM58lNCOTdHTmQT7t4N/mpgjovAj8pWpRm2vHZPgUFz6/seMIxdmX0UlM
         thGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDq821hGobFbWD/dIVpCVIIXLHenvTBUR+XHTWaRHnc612TKm+xf/Vhp8RG89Odqou7/as8maHkzCEtK2MX4A=@lists.infradead.org, AJvYcCViL3E+31ofwhBPXUEyo03H6GCm8hXtTlM3ppTCWl5ARBCxUvdU3bI6thTD7NXzgaSlu9VbIvILSOKQMyc4k3u6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg4IO8LhC9AP9U2T9al3df5S73iv/guIrmHxYEeJdkzG/yqSiQ
	Xg5b4MNW+ZT8o5aeI/gAghQjOM3ByaXj3AOFx3iN6oxvRkfkGGpu
X-Gm-Gg: ASbGncsMhBkuQ/OiY6yfkBXT52UFchC6AhctuyTR6uKUKU7JBQGhgjvPZY+KM3sHDMy
	1dwkSJ7/gvhsanshdJSIAQJai0N05l1y7mDLHBx9K7rZtL45ZbZg2Z8aWH/OZqsSqUeYD+41BZR
	NdSW/v/ja2o1FoL7RIwtd0QqkIA2/TLJMpH0fjc2aCX20mLzhUg2xiI6UUGQxy5XRAb9bLxARIV
	/VPC2zu4RdDC/Vw/TDAGBG1S1gCGQ1Aj5Kk6O7hFOcN8hUZ1MdTmPcBPI4KhMIq/wQJUYXNsPEF
	DKU67uJWiHDhA7b6k+QvvAj8vG1JAlRo4Q1C+NfVpVR03dE4E/4qKleNJGt+ZSoQSJeW4fbPXZz
	Y+NZd0CR4+QzXYSW9hDNqh1JYBDJ/0YCv
X-Google-Smtp-Source: AGHT+IGqAcPNkOC3T2w/JTV+drwdUFB600X7DdmAkY02Ru++v+0yQjzJWGShHhhfTBkgM87Q9bKjbw==
X-Received: by 2002:a17:907:3da4:b0:ab7:b422:c075 with SMTP id a640c23a62f3a-ab7b422d13fmr154639366b.23.1739099451247;
        Sun, 09 Feb 2025 03:10:51 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:50 -0800 (PST)
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
	Kuniyuki Iwashima <kuniyu@amazon.com>,
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
Subject: [PATCH v6 net-next 05/14] bridge: Add filling forward path from port to port
Date: Sun,  9 Feb 2025 12:10:25 +0100
Message-ID: <20250209111034.241571-6-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031053_133744_7E5967B9 
X-CRM114-Status: GOOD (  16.35  )
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
index d9a69ec9affe..07dae3655c26 100644
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


