Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02877C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGHKkM4qxKd9EB0pt79Yst8lznP4qD+tbsrDkGhaAL8=; b=dZSMjrEt1shZS5FU2Jff75oHtp
	2gxMrygJLX5GJZW7s5m7tdRguMwIVfPF9OEd5xFb9jQFo539ATAOwGWceX1O5S6WNPEUxr99GpOM/
	i6AorrClXDe1hKwWX8ox8HC35jBY7KxtdtK/MySkRE6ZmWyd1FisctiiqGqRJIUTKaKgCdzdJQj4Z
	59+wD+UKdmipR9cKjHF0jRiByzXBa9OlOCNraX4TKyEM9BKZObPRNEtTN3K+TCD5NpHEWpucWCJhP
	zjl2fYI9UxDAHZIkHFDBXIpcjMNGA6lKZvhBa/vaibK/ex3SZ9vQ+GkQBessHeI6bbba7CzPFN/CA
	/jssOBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmsU-00000007qkI-22dc;
	Wed, 05 Mar 2025 11:25:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm19-00000007gX8-3CEt;
	Wed, 05 Mar 2025 10:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KGHKkM4qxKd9EB0pt79Yst8lznP4qD+tbsrDkGhaAL8=; b=naJ/Usc4Yrid4dtemwsw1We+Nq
	IFo2AngbAFd1cvoUQMEDalqu3vPs60ZVRyDlLWFchV7t89dTX1TYxu/Dwbij46gIlNbAueagertxA
	8mqgm0f4zFcyX9OvvSRwLWHRVkydMVOHKX7IBsVOBf+0xLSbpQPk1iploljStWgthC9wCeRMlhspT
	gdImShShw+UjgivkSMvHIGHqUdQe2UmNNo6MTVTBU8uWDC0y0raYDEPJQsWvbsGHSgwddeGZc1iOs
	/EmKQHh+nnk4a49iq1Uf3LQkalX3p6TOrjb9ecGHRVDz9ywsNs6QomFFRes++XJGJoMhy/WWiFWVV
	WkHMghJA==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm16-00000000TCW-3iMg;
	Wed, 05 Mar 2025 10:30:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abf518748cbso753690066b.2;
        Wed, 05 Mar 2025 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170619; x=1741775419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGHKkM4qxKd9EB0pt79Yst8lznP4qD+tbsrDkGhaAL8=;
        b=PvqhwzoEyhj7z7nYp+HL15TQC1mtLBAPe6sxMT1mEs1DJuWWaiuMwQpe7DSab52+r/
         MxftNmc0Skurjos9wTBQ23oUeZ00v9ZehHkAPefWG6FwuZXIdOJuB/OC/0Tp6gBhEWae
         y9B3Dxd115PKKmzyVWhWrtkAn3gF/nMk6mPdljLY5prDcmqy4f0Z3bZYNh2fvmhLUrX3
         3a+BUOIghaxh8nT1toDp2uZUoCTRMYXRUzQiU9UvKpCs27qy7fAVB71ikCOmv/xxLybr
         h02DMVg/uWCmsyOmXfECfYVrGOUeQcLCryeLL2qQiMsFxFo49VboOyT/lnI2PfTo6XSM
         hSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170619; x=1741775419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGHKkM4qxKd9EB0pt79Yst8lznP4qD+tbsrDkGhaAL8=;
        b=GEdpoYch19OCFBTvABimrdn6fmFlqjFh8MPnw0BCst90ytq2lCHMC5HI+x/zs3xHFO
         gzY/iGmq/7cp9od9eumuWczZreUI6/paOSisy20hbhYgyVUzXdR6zeOpd5/hwMKvTEXH
         AumZAWFsvNQLYXvouW83k4PLR3p7mzE6dYOvHLI6scR5g4z0X1lGg3LRc8ATty7Sq8ly
         00zAGWyPNSJqH7uzkdvHSxfxiYSuvO1B7LqWPzonSFELPvedgSbX8FO0DYOi7hD0a/qH
         vd+o6UATStVviVwc7cw7y6E4Wsx4HbUs1DMNy15kzvJtuD/fPZjY+ZV+dTRgYbAcCQ5C
         3aUg==
X-Forwarded-Encrypted: i=1; AJvYcCU1bYtGq9XwNqTSld8EcTlkfH3mrG+8GGAr7qJwVorAP2/W3gLiyMgFpDCj2xzCH1dv4j2b+aEgEA1qlJMXDa4=@lists.infradead.org, AJvYcCU4xCSCBdQ66FfZwUNZJ2s+fazz3lHxMRu3mcGff+haUlfqVCDpKYuWpXAMUz1nhcE73fSz/mOAOttwQDRwiFP0@lists.infradead.org
X-Gm-Message-State: AOJu0YwwB2FA5KtgyM8FXfKapOLbnGqm102HxqRSMzddzZZb2ph4vxaJ
	2uZ7hNSW+8PMvPb6ZK48xKG3mXV1n5L8c1ipW8EsQ1nkl4VlliN6
X-Gm-Gg: ASbGnctWh4iqa1VVu0QXA2bcIykDGv3dnE1MrPL13snIOE5WcqStsbqGUHcnHGK9B8n
	iYc8Z1Ehfpwt3CBh/AtvpKJYBl3k+NxhFDhSHG77hNNNncILBigjw2KWRpwUVZ5ku3KHEyRegb1
	p2ec7SiCol5/f1WK+qGzxiiQMX364CyZAIuqFsp8Y3wQ9nBCoSX4+oo1SNqJaBvuBFag6efAR8r
	5lHMEgbjrlqe2TTaaPmW5YwDgRwhiglSOScT0ISVmXRsjYkUdYm/h92bhqPN9K62O2M9bn93/r+
	QyDwYMwZKDM8MmbXm4KTvkDRHTjJSpsnh/ERS/ls3gVpR2JhxIA2jC7A3AZEk76jx2ccvOsDm4z
	nB3NE4eTHvutLwFKnfp3ORvD3UHqlAStzI1JdbwWULIbJaHMK+oEIJOqcM/LZpw==
X-Google-Smtp-Source: AGHT+IGoN/CtSWTsLPGno4XdCpNX/tKcNpIlnQot0PcYBnAP4+pW8eJWUnu6a4Iy0Es/1rYM255M5w==
X-Received: by 2002:a17:907:da8:b0:ac1:ebfe:fd90 with SMTP id a640c23a62f3a-ac20d845965mr280745166b.1.1741170619182;
        Wed, 05 Mar 2025 02:30:19 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:18 -0800 (PST)
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
Subject: [PATCH v9 nf 13/15] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
Date: Wed,  5 Mar 2025 11:29:47 +0100
Message-ID: <20250305102949.16370-14-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103021_059778_C6238752 
X-CRM114-Status: GOOD (  21.64  )
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

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/switchdev.h   |  1 +
 net/bridge/br_private.h   | 10 ++++++++++
 net/bridge/br_switchdev.c | 15 +++++++++++++++
 net/bridge/br_vlan.c      |  7 ++++++-
 net/switchdev/switchdev.c |  2 +-
 5 files changed, 33 insertions(+), 2 deletions(-)

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
index a0b950390a16..b950db453d8d 100644
--- a/net/bridge/br_private.h
+++ b/net/bridge/br_private.h
@@ -180,6 +180,7 @@ enum {
 	BR_VLFLAG_MCAST_ENABLED = BIT(2),
 	BR_VLFLAG_GLOBAL_MCAST_ENABLED = BIT(3),
 	BR_VLFLAG_NEIGH_SUPPRESS_ENABLED = BIT(4),
+	BR_VLFLAG_TAGGING_BY_SWITCHDEV = BIT(5),
 };
 
 /**
@@ -2184,6 +2185,8 @@ void br_switchdev_mdb_notify(struct net_device *dev,
 			     int type);
 int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid, u16 flags,
 			       bool changed, struct netlink_ext_ack *extack);
+int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid, u16 flags,
+					  bool changed, struct netlink_ext_ack *extack);
 int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid);
 void br_switchdev_init(struct net_bridge *br);
 
@@ -2267,6 +2270,13 @@ static inline int br_switchdev_port_vlan_add(struct net_device *dev, u16 vid,
 	return -EOPNOTSUPP;
 }
 
+static inline int br_switchdev_port_vlan_no_foreign_add(struct net_device *dev, u16 vid,
+							u16 flags, bool changed,
+							struct netlink_ext_ack *extack)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int br_switchdev_port_vlan_del(struct net_device *dev, u16 vid)
 {
 	return -EOPNOTSUPP;
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
index a18c7da12ebd..aea94d401a30 100644
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


