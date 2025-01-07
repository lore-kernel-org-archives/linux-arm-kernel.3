Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FA4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inK7YfAKbOx/gvsqH8JrlXFRxeSCmPFOnUoO4T3PkD0=; b=qS9l43pPHUG/+TnkCxgsIWaNZR
	Br0IP0URMNyU2kzoEN4cXByo23nWAW+n3mWpov9vClzhrZC6yaUZTaX1RXvbxKZkm14MQk/U8eO/X
	if+yklxqPyEwc0viDMvcxogab5BReewgPEKbK94uh7hGEAr6L3PHy48M4JOEpLDB1cY+WKbLvT6E2
	R7q2gigEg74GZoZFn6xmLMmv+fQt1/l9raYYSC3cNfVYPjA8l4hQrgnydzEl+ndltN6SRYptSneot
	arK71+hs+bUKcMME4kD4yB9JmnsqUv1q0n01xeD7l82bLjHR6Kd8Iwz+xh6JhIWZd/5doeCGguUvQ
	rgVTZivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5c1-0000000442P-2IXP;
	Tue, 07 Jan 2025 09:10:57 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XM-000000042Wt-3XZG;
	Tue, 07 Jan 2025 09:06:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaeec07b705so1745660266b.2;
        Tue, 07 Jan 2025 01:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240767; x=1736845567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inK7YfAKbOx/gvsqH8JrlXFRxeSCmPFOnUoO4T3PkD0=;
        b=BkBxx+ve8Vs2CXi7vI6FEJyIUSpnSwXBIVOwEfObaEdXdAP1culrkTAAGrI9ZgCpHw
         sOgSQ8RQGluySD0pnnvzFds/K7dG/SWjrKambEJRLea8ZNyHSAKQMEWQdmq4P487i6Qv
         SQM1N9bM24usZPWMdgizE8cRgv0fo8m3wSHhjujpL6g9nrjo0tQKt4GKBc/Xrj1B04Fo
         7fB3pNBYtn891DPorEKYnx4lzV/ttvhCG0GM7k6VmuUiheEi89nVBnVoQr/BQ0tehZG5
         /g1N1Iw6KQJcqH/6coWDwqXDtiI1WmqFQ5OYGOWbloPq8LLQ/GOr9cOsZo4YIHxqr3Gt
         vctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240767; x=1736845567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inK7YfAKbOx/gvsqH8JrlXFRxeSCmPFOnUoO4T3PkD0=;
        b=QOGB9zqD9JJdPWz7KfAoYdqVdRDRYk5/mO2U54rKb3yC/JSF1sY0Kc9krqcZRV3JgT
         sXYxVr1i8wsPwxxGJS86m1KfYrxASvfKc9LtQW3Gp359JH6AbngvtHikJzmelPEkOvXc
         QIcdISef1E4PCPOtTew5OZzQW+rLGbxSCyDsd3lGhPbPfiEn9LhZ/R0WPh13PLRMmy+L
         9VV1az7xet9dzSx2BF9xdcMcADW2iHQp4NlYo+z0ZBvK0CDgtfRZqwbVJfuadGN2/FwY
         uhJ6uZJzBg3PqyKdRP0854lgGSVSRd8IwUU+1qwLqiaYMwfX6HiNabocFghySpjKd7Ah
         9x9g==
X-Forwarded-Encrypted: i=1; AJvYcCUv0oCp1H4Zfhja7Rv6SrmvadznMQy2XkgyN7HsvlEdLi+1OhIAIggFcwdo6Zj3M5sCou8TzxAQH1eLMeAp23w=@lists.infradead.org, AJvYcCV2CH0T+OiqCzH+X4MZ3B5MLVmO1ojxGCVzKllIpwZbL1VGDQK6zHf97A6zKE2G9wtuAsaUIlT933beUg7ZCiK1@lists.infradead.org
X-Gm-Message-State: AOJu0YzB5sK2bzWxV1avnAhAJQTKM6mnRFuesenHYdYhS+uojE/p5muj
	GNg2TW5F8EWy+sL7ZfY54MERj4Nl5fvyI7SL/mCTdXVPTAKo6h0Q
X-Gm-Gg: ASbGncs7FO/nAi+hGi1lX1KxdKuk3CtQzAc6lXAXfCIy4IJII2LZDUPuoYlr1YLjhK4
	Oh0kFuxfdoy1MubruCTWzzQyfWlfVomijJPujoOfK62T555gz3e+5DLzoZz/1uqvwtYAtS15ZDG
	5DpSdNqpGkzl6q+Vrj1J+elXbspmCyYHh0gMfmBWdsPaUY9V4fMQfCI0nldgY5eGVaExLx8tOj8
	un53BvTuE2BrMoeEWEy9cmqTsJcuFuI0vca9Mnr+5+EsE8KmFnIFROTVm4xFEePFsRD/rhyBQ3N
	ByiTaRi695d4snBSBJWEzx50HcOYL7VCVFa60H0ZWmPwoQraPKWDE35cUswoikaddAMykch+Nw=
	=
X-Google-Smtp-Source: AGHT+IHrdDy9A9gTXFzVem5TTKGvqrwcwaAGIG1kmAOtqGfBDbimoZPMTBSrG7qD5IXkUnDJ5cWKBA==
X-Received: by 2002:a17:907:1c1e:b0:aab:9268:2626 with SMTP id a640c23a62f3a-aac2cf5063fmr6251574966b.25.1736240766425;
        Tue, 07 Jan 2025 01:06:06 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:05 -0800 (PST)
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
Subject: [PATCH v4 net-next 04/13] bridge: Add filling forward path from port to port
Date: Tue,  7 Jan 2025 10:05:21 +0100
Message-ID: <20250107090530.5035-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010608_880034_92F835DA 
X-CRM114-Status: GOOD (  16.54  )
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
index 29d6ec45cf41..94603c64fb63 100644
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


