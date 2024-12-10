Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4133EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVgPo7GP+w/iXTNTv43Xh832Ytqh3LElKKcl5avl2EQ=; b=pI8Ii1oX7a8JuAoo1hk7V12xmY
	wmFleCAv6YZbxY97PPuhZs0UEIrXy8LLrvsUitymZVqhRQXrWfF2AK/mk3bNet4seZ207uD3sfzqC
	dt1Lv4z9pUj96VwJoqJnVuwuiqs7pRw7wWXuGhSIW7v8sFWVb4Lv/uS1RNYu6Sy2uHGWWSsjzVnDQ
	tKgnpwK6oaugpp4uYYnhUTdhs6IHRdmCM02WLqJqqxA49G/xPFid7zOV1eCyEUgWRk7vZr/OgO9iN
	GEBrt9o8ktaoNXgf/X/G3XoRpEh5/nYRqfXahpSTwlISWpaI3qXCkfKLyuRO5C5wKE8yC2sxs9egn
	ulYSEM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx1D-0000000B2sB-1pyi;
	Tue, 10 Dec 2024 09:59:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwp6-0000000AzJ4-1yUU;
	Tue, 10 Dec 2024 09:46:33 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so4005641a12.1;
        Tue, 10 Dec 2024 01:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823990; x=1734428790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVgPo7GP+w/iXTNTv43Xh832Ytqh3LElKKcl5avl2EQ=;
        b=XIu2xepYSooe82OqL1MxlT8nh/Icog82GMRyVXKNGHJP+fgeM8irw88LqxgeuZJUo6
         XKvYIsbEvtVlJSgPwDhTlr1rh3SNRF+SInoO4MYuibnxC8GuCfITK9u6CQRxmWVLb4x9
         2xH9DsQIyrmWoiNauISWY8VF8OvGQHmLMQ1GbkIxvLnUnPIrLkf2AJp/fMSlM6jpExgk
         he5nzpasYJVHY6+zMNMHIZ0nvA5E+fqqkaCTd0HV8Mm5+w6eIyAPKsbuVdzHYHSfW4sG
         Lh7DFippekJ2ZZfIB8+GockKaY2CQN9dXduie7qNecUUKayRXtvNGB4iyqz4t98zJ8ER
         BCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823990; x=1734428790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVgPo7GP+w/iXTNTv43Xh832Ytqh3LElKKcl5avl2EQ=;
        b=Ls3Fnut87CUG0ljbxjB5fLMyYcSBR0EU7hwopFhUL2VXQs4GRygrXD8q+REyxgZ3WW
         i3iH2K28fUDcbuLutTZ7RA8BNdmuBS7F0hb7sTbX3tVwRS+pS0izh8RCNI703RGZ1bbX
         FSobciLIV2B2Ol4tDpSQCPNQch1tkWBz6je2UX5xcM/hpxeKElgFfftU7zaZNTz8OPbQ
         QAqL7Z7stf6/mag4AVkWnQ4hoz3z56eNoX5YydHkeuEIGrWQVjFvQW4jRJXwmYEy5h8t
         OBBrUXmK1fWWcPfYHP/okvfOXaKWILheHS/mK0uCtL//NuH714Wv+R+YOePDqQ2vV/LD
         ec8A==
X-Forwarded-Encrypted: i=1; AJvYcCUBPs3T9zjnn48PSysdZDiZRiSe61jclfHQSmKAMDlOTg776JWBULnyh9p6h/8dOGtYEZYr//yV3ef1RadEMPk=@lists.infradead.org, AJvYcCUndFnuLvTnVkNeenhgEyv5eIW6KIxavZ8ApoAQDKIQ/XSHuHIsXnli0r8uQluRkOmX9MCyMqPeS9yTN7mJi/fz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmmhl8dLV4auXxiYnyr15JMI4mQjQYP1+0ufxENCUOlWK+PF1U
	JYuyYzyyXNDurgbznn08cyj4MG7s2aojrGf2Zg7j1+BrdivN6bCf
X-Gm-Gg: ASbGnctnQIP0q+BDRyIFPwLI4wTYSoU3nRPs8nKVxTh0oNlToYenOiLE4LWgLR3Xorf
	NsK6ehUwflnmA9/eZT9kAVhP3UvxH1RZtxR/B9rfTydy/Vld63xlzRBMR7rgkudk7pNmr7Klta3
	yNNhlywhrODb7HuCTdYNmriKTJChmRLt64eVtQ2Z8hnM4DoRmCyLaguK4Lm59ybwBdnhTsOfaNH
	ySmb34gCh8eJqNdawWQj+UtuCA9Uyl+GHtUl/B4YTMug86skiRBEhNndE53HFPm/6sYs8SdOMi4
	0ppZSVLEOXG+8lXohRXHJga58xvVhKzTs9NDjwHP5ViXcYx+Zd7wUcAqvWxYcxET24bH5Uw=
X-Google-Smtp-Source: AGHT+IG1ns72s5lAxuFqutU6jXgQGW+b3pj0eqZhJSim1Ie1bmEH6QQg6S3iFkPF3upMCtFud8XANA==
X-Received: by 2002:a05:6402:51d1:b0:5d2:723c:a559 with SMTP id 4fb4d7f45d1cf-5d418531cf1mr3562560a12.10.1733823990457;
        Tue, 10 Dec 2024 01:46:30 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:30 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 11/13] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
Date: Tue, 10 Dec 2024 10:44:59 +0100
Message-ID: <20241210094501.3069-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014632_514728_60D60298 
X-CRM114-Status: GOOD (  22.07  )
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

In network setup as below:

             fastpath bypass
 .----------------------------------------.
/                                          \
|                        IP - forwarding    |
|                       /                \  v
|                      /                  wan ...
|                     /
|                     |
|                     |
|                   brlan.1
|                     |
|    +-------------------------------+
|    |           vlan 1              |
|    |                               |
|    |     brlan (vlan-filtering)    |
|    |               +---------------+
|    |               |  DSA-SWITCH   |
|    |    vlan 1     |               |
|    |      to       |               |
|    |   untagged    1     vlan 1    |
|    +---------------+---------------+
.         /                   \
 ----->wlan1                 lan0
       .                       .
       .                       ^
       ^                     vlan 1 tagged packets
     untagged packets

br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
filling in from brlan.1 towards wlan1. But it should be set to
DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
is not correct. The dsa switchdev adds it as a foreign port.

The same problem for all foreignly added dsa vlans on the bridge.

First add the vlan, trying only native devices.
If this fails, we know this may be a vlan from a foreign device.

Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
is set only when there if no foreign device involved.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/switchdev.h   |  1 +
 net/bridge/br_private.h   |  3 +++
 net/bridge/br_switchdev.c | 15 +++++++++++++++
 net/bridge/br_vlan.c      |  7 ++++++-
 net/switchdev/switchdev.c |  2 +-
 5 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/include/net/switchdev.h b/include/net/switchdev.h
index 8346b0d29542..ee500706496b 100644
--- a/include/net/switchdev.h
+++ b/include/net/switchdev.h
@@ -15,6 +15,7 @@
 #define SWITCHDEV_F_NO_RECURSE		BIT(0)
 #define SWITCHDEV_F_SKIP_EOPNOTSUPP	BIT(1)
 #define SWITCHDEV_F_DEFER		BIT(2)
+#define SWITCHDEV_F_NO_FOREIGN		BIT(3)
 
 enum switchdev_attr_id {
 	SWITCHDEV_ATTR_ID_UNDEFINED,
diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
index 046d7b04771f..977285925422 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -180,6 +180,7 @@ enum {
 	BR_VLFLAG_MCAST_ENABLED = BIT(2),
 	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
 	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
+	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
 };
 
 /**
@@ -2175,6 +2176,8 @@ void br_switchdev_mdb_notify(struct net_device *dev,
 			     int type);
 int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid, u16 flags,
 			       bool changed, struct netlink_ext_ack *extack);
+int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid, u16 flags,
+					  bool changed, struct netlink_ext_ack *extack);
 int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid);
 void br_switchdev_init(struct net_bridge *br);
 
diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
index 7b41ee8740cb..efa7a055b8f9 100644
--- a/net/bridge/br_switchdev.c
+++ b/net/bridge/br_switchdev.c
@@ -187,6 +187,21 @@ int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid, u16 flags,
 	return switchdev_port_obj_add(dev, &v.obj, extack);
 }
 
+int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid, u16 flags,
+					  bool changed, struct netlink_ext_ack *extack)
+{
+	struct switchdev_obj_port_vlan v = {
+		.obj.orig_dev = dev,
+		.obj.id = SWITCHDEV_OBJ_ID_PORT_VLAN,
+		.obj.flags = SWITCHDEV_F_NO_FOREIGN,
+		.flags = flags,
+		.vid = vid,
+		.changed = changed,
+	};
+
+	return switchdev_port_obj_add(dev, &v.obj, extack);
+}
+
 int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid)
 {
 	struct switchdev_obj_port_vlan v = {
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index 2ea1e2ff4676..0decce5d586a 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -109,6 +109,11 @@ static int __vlan_vid_add(struct net_device *dev, struct net_bridge *br,
 	/* Try switchdev op first. In case it is not supported, fallback to
 	 * 8021q add.
 	 */
+	err = br_switchdev_port_vlan_no_foreign_add(dev, v->vid, flags, false, extack);
+	if (err != -EOPNOTSUPP) {
+		v->priv_flags |= BR_VLFLAG_ADDED_BY_SWITCHDEV | BR_VLFLAG_TAGGING_BY_SWITCHDEV;
+		return err;
+	}
 	err = br_switchdev_port_vlan_add(dev, v->vid, flags, false, extack);
 	if (err == -EOPNOTSUPP)
 		return vlan_vid_add(dev, br->vlan_proto, v->vid);
@@ -1491,7 +1496,7 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 
 	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_ADDED_BY_SWITCHDEV)
+	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
 	else
 		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
diff --git a/net/switchdev/switchdev.c b/net/switchdev/switchdev.c
index 6488ead9e464..c48f66643e99 100644
--- a/net/switchdev/switchdev.c
+++ b/net/switchdev/switchdev.c
@@ -749,7 +749,7 @@ static int __switchdev_handle_port_obj_add(struct net_device *dev,
 	/* Event is neither on a bridge nor a LAG. Check whether it is on an
 	 * interface that is in a bridge with us.
 	 */
-	if (!foreign_dev_check_cb)
+	if (!foreign_dev_check_cb || port_obj_info->obj->flags & SWITCHDEV_F_NO_FOREIGN)
 		return err;
 
 	br = netdev_master_upper_dev_get(dev);
-- 
2.47.1


