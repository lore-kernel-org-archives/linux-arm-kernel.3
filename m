Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45528C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGr0DGFtdF9vUQZNuQxbjKzErqMA9pCa8F2vVWAZr6U=; b=LGT0TSaS3AZOgcFIyQekoAv0sC
	K1vLOJzJihtkcXXInvqNnE54raJcLQlEb+z/URP/wt7kWW1T/HAFJNyfgNAgky2jQBDuHNKhaDpAE
	c/dKZbdwpUH8xSiKWzaUYpInxkNntx+Es1ucuOBGa30umXsOBZKIHZyO8l9i4dr4llXVCVwGbSsM6
	vK4DuHv/H56lEEE+0G91dMq3EjXeAALjq8oWWGeXVqLjKQsDj30Z2BlRVOehJF5LIFXg3pq6vBi+J
	yHdHUZqfUC6b7JRAxub1Huqno2qDR1WDdtK2vFDIe3X0PBOZM4inIISeAyGBP27WBGbU6vdzZ9QCK
	/IbTN2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1nb-00000001QJQ-1HZ2;
	Tue, 25 Feb 2025 20:45:03 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Lw-00000001Kc0-3XeP;
	Tue, 25 Feb 2025 20:16:30 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso874429366b.1;
        Tue, 25 Feb 2025 12:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514587; x=1741119387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGr0DGFtdF9vUQZNuQxbjKzErqMA9pCa8F2vVWAZr6U=;
        b=Zo10iyH8cbq2IRz3rSsd3v5Vk8pASG9C5s1zi/mxwcgKtV/LGhrl7yWWo3SkWbjVHp
         xBkOt5mGdz3ePD05v45b7tcJhaWx0e6tE9UsAl+bllj58WUPiiVvTrWZnS9/Cg/dByt/
         Ymqu5uUKP3C/9bHD/qB5aVxcCizuoCkIHGampxzuNJlZ3UMAru+8NK9ezAEek4nTdPeJ
         ilA3Pn6FmZMqbEKP1W4l2vGdszwlecIJ/WcQgX/27mnbOazM14P1Yqe4Rg3rc+AlnJCn
         q4vsTCblNOIoJxsfVSZpJUu2TcXQa/3Sq8h6/2XevmCpdxvtQSfnmUkoJFOvOrvBnAYc
         /uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514587; x=1741119387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGr0DGFtdF9vUQZNuQxbjKzErqMA9pCa8F2vVWAZr6U=;
        b=RAoiZQG6shhH4bxGsNUztonpQdza9Ofod6C5tzwSKjKJ4/R+dWpTtLDkUM9K1Oeuxk
         yU9M1uWLVrlcmtadun5f+pfVIFL9h3hIMBoL9/DmB0NJoClxDtS2TeMHkPklBQpDAje5
         1N1a3Ajw+3UdASriJsaVYGw/LKy4Mi0IqcnvBPpJ+W//OYOtmU80ftdzyflp/iiF5rEK
         bZelC3JoXeW1IRv9Z7gHF+XisjZuOykusn1aRGIBQNBkEVoMiMP/eRigE/XjMGKJOaTF
         psEKULIl6d+Sep2IsbHjRHEFErcC7h/QGrNJTk/c/9KDh0pZjOqqFKW6TYNblnd88ZzM
         V1eg==
X-Forwarded-Encrypted: i=1; AJvYcCV8z+NFuP1OgYGkC/nx9Uo7W2L8yji4XpRtoyYamSY/4xpVYwp5TWYQDUnNafF3ogSguIO2wXeXI2zK8aKgfBg=@lists.infradead.org, AJvYcCVQHy8VzujWK0SQplkq83NslHjuBnj6q2H4CnsVfZtF6LVzADfpGNaBrwnTq576gzGMhFU5J6ZekDpmWnDdXuFC@lists.infradead.org
X-Gm-Message-State: AOJu0YzC0mCWpVjtfZ/oMojit913C5OLIaziQ18yvyjz+ovWVRg0fTRT
	3OW+YNoQcT6/qtrZzZTVLhLTyhiPkkFMQQvXdSrJdrpmnudMLhC+
X-Gm-Gg: ASbGncseOMdVZgUGzETv7h0zBtN4Z7SgsZvFcVKqbTgn5DV3VZeQ5mRCpFA+THdUd6M
	NLzclvWCi82vF33+F/XS+upfS1RbtOuMQTgjd2fsJmDzZBSEY9gZ44BhWgnFQ0GnLpYg5mmP+3s
	aMnMKj9kSZ3FEpFDhvYgAlEZ2YeqdPDXU0OVl17dNiF06pW50EFXD5eStfcrhgvrwp3ommhKuhk
	vH0uE7fTjZZVojWxfJl6bvsK2TiBO0GXHf8YF9EvGUrW/jFPFtC5LOLmf9KTLmVPL7Oi40eebq6
	rt9oivPhTVDC3mz2+SCgPmBhZlrKa5eIPVPLcsqYgqePWFLYW20UYtp0iTXkHACzu3d/XL8UYdP
	dJAij80juMghXlPrDQmktDN87XxRzGDdcAVOPJoETTIQ=
X-Google-Smtp-Source: AGHT+IG7sLxHYiybRWl9YJCo5iA5Z9C/AE9Kvx3ntJoO+nw0ZthDGzLRup7krhlAo4HpsCIa/bhOBA==
X-Received: by 2002:a17:906:30d4:b0:ab7:e3cb:ca81 with SMTP id a640c23a62f3a-abeeee9faefmr52882166b.30.1740514586548;
        Tue, 25 Feb 2025 12:16:26 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:26 -0800 (PST)
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
Subject: [PATCH v7 net-next 01/14] netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit direct
Date: Tue, 25 Feb 2025 21:16:03 +0100
Message-ID: <20250225201616.21114-2-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121628_919006_7C1063BC 
X-CRM114-Status: GOOD (  20.08  )
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

Loosely based on wenxu's patches:

"nf_flow_table_offload: offload the vlan/PPPoE encap in the flowtable".

Fixed double vlan and pppoe packets, almost entirely rewriting the patch.

After this patch, it is possible to transmit packets in the fastpath with
outgoing encaps, without using vlan- and/or pppoe-devices.

This makes it possible to use more different kinds of network setups.
For example, when bridge tagging is used to egress vlan tagged
packets using the forward fastpath. Another example is passing 802.1q
tagged packets through a bridge using the bridge fastpath.

This also makes the software fastpath process more similar to the
hardware offloaded fastpath process, where encaps are also pushed.

After applying this patch, always info->outdev = info->hw_outdev,
so the netfilter code can be further cleaned up by removing:
 * hw_outdev from struct nft_forward_info
 * out.hw_ifindex from struct nf_flow_route
 * out.hw_ifidx from struct flow_offload_tuple

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nf_flow_table_ip.c | 96 +++++++++++++++++++++++++++++++-
 net/netfilter/nft_flow_offload.c |  6 +-
 2 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 8cd4cf7ae211..d0c3c459c4d2 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -306,6 +306,92 @@ static bool nf_flow_skb_encap_protocol(struct sk_buff *skb, __be16 proto,
 	return false;
 }
 
+static int nf_flow_vlan_inner_push(struct sk_buff *skb, __be16 proto, u16 id)
+{
+	struct vlan_hdr *vhdr;
+
+	if (skb_cow_head(skb, VLAN_HLEN))
+		return -1;
+
+	__skb_push(skb, VLAN_HLEN);
+	skb_reset_network_header(skb);
+
+	vhdr = (struct vlan_hdr *)(skb->data);
+	vhdr->h_vlan_TCI = htons(id);
+	vhdr->h_vlan_encapsulated_proto = skb->protocol;
+	skb->protocol = proto;
+
+	return 0;
+}
+
+static int nf_flow_ppoe_push(struct sk_buff *skb, u16 id)
+{
+	struct ppp_hdr {
+		struct pppoe_hdr hdr;
+		__be16 proto;
+	} *ph;
+	int data_len = skb->len + 2;
+	__be16 proto;
+
+	if (skb_cow_head(skb, PPPOE_SES_HLEN))
+		return -1;
+
+	if (skb->protocol == htons(ETH_P_IP))
+		proto = htons(PPP_IP);
+	else if (skb->protocol == htons(ETH_P_IPV6))
+		proto = htons(PPP_IPV6);
+	else
+		return -1;
+
+	__skb_push(skb, PPPOE_SES_HLEN);
+	skb_reset_network_header(skb);
+
+	ph = (struct ppp_hdr *)(skb->data);
+	ph->hdr.ver  = 1;
+	ph->hdr.type = 1;
+	ph->hdr.code = 0;
+	ph->hdr.sid  = htons(id);
+	ph->hdr.length = htons(data_len);
+	ph->proto = proto;
+	skb->protocol = htons(ETH_P_PPP_SES);
+
+	return 0;
+}
+
+static int nf_flow_encap_push(struct sk_buff *skb,
+			      struct flow_offload_tuple_rhash *tuplehash,
+			      unsigned short *type)
+{
+	int i = 0, ret = 0;
+
+	if (!tuplehash->tuple.encap_num)
+		return 0;
+
+	if (tuplehash->tuple.encap[i].proto == htons(ETH_P_8021Q) ||
+	    tuplehash->tuple.encap[i].proto == htons(ETH_P_8021AD)) {
+		__vlan_hwaccel_put_tag(skb, tuplehash->tuple.encap[i].proto,
+				       tuplehash->tuple.encap[i].id);
+		i++;
+		if (i >= tuplehash->tuple.encap_num)
+			return 0;
+	}
+
+	switch (tuplehash->tuple.encap[i].proto) {
+	case htons(ETH_P_8021Q):
+		*type = ETH_P_8021Q;
+		ret = nf_flow_vlan_inner_push(skb,
+					      tuplehash->tuple.encap[i].proto,
+					      tuplehash->tuple.encap[i].id);
+		break;
+	case htons(ETH_P_PPP_SES):
+		*type = ETH_P_PPP_SES;
+		ret = nf_flow_ppoe_push(skb,
+					tuplehash->tuple.encap[i].id);
+		break;
+	}
+	return ret;
+}
+
 static void nf_flow_encap_pop(struct sk_buff *skb,
 			      struct flow_offload_tuple_rhash *tuplehash)
 {
@@ -335,6 +421,7 @@ static void nf_flow_encap_pop(struct sk_buff *skb,
 
 static unsigned int nf_flow_queue_xmit(struct net *net, struct sk_buff *skb,
 				       const struct flow_offload_tuple_rhash *tuplehash,
+				       struct flow_offload_tuple_rhash *other_tuplehash,
 				       unsigned short type)
 {
 	struct net_device *outdev;
@@ -343,6 +430,9 @@ static unsigned int nf_flow_queue_xmit(struct net *net, struct sk_buff *skb,
 	if (!outdev)
 		return NF_DROP;
 
+	if (nf_flow_encap_push(skb, other_tuplehash, &type) < 0)
+		return NF_DROP;
+
 	skb->dev = outdev;
 	dev_hard_header(skb, skb->dev, type, tuplehash->tuple.out.h_dest,
 			tuplehash->tuple.out.h_source, skb->len);
@@ -462,7 +552,8 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 		ret = NF_STOLEN;
 		break;
 	case FLOW_OFFLOAD_XMIT_DIRECT:
-		ret = nf_flow_queue_xmit(state->net, skb, tuplehash, ETH_P_IP);
+		ret = nf_flow_queue_xmit(state->net, skb, tuplehash,
+					 &flow->tuplehash[!dir], ETH_P_IP);
 		if (ret == NF_DROP)
 			flow_offload_teardown(flow);
 		break;
@@ -757,7 +848,8 @@ nf_flow_offload_ipv6_hook(void *priv, struct sk_buff *skb,
 		ret = NF_STOLEN;
 		break;
 	case FLOW_OFFLOAD_XMIT_DIRECT:
-		ret = nf_flow_queue_xmit(state->net, skb, tuplehash, ETH_P_IPV6);
+		ret = nf_flow_queue_xmit(state->net, skb, tuplehash,
+					 &flow->tuplehash[!dir], ETH_P_IPV6);
 		if (ret == NF_DROP)
 			flow_offload_teardown(flow);
 		break;
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 46a6d280b09c..b4baee519e18 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -124,13 +124,12 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				info->indev = NULL;
 				break;
 			}
-			if (!info->outdev)
-				info->outdev = path->dev;
 			info->encap[info->num_encaps].id = path->encap.id;
 			info->encap[info->num_encaps].proto = path->encap.proto;
 			info->num_encaps++;
 			if (path->type == DEV_PATH_PPPOE)
 				memcpy(info->h_dest, path->encap.h_dest, ETH_ALEN);
+			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
 		case DEV_PATH_BRIDGE:
 			if (is_zero_ether_addr(info->h_source))
@@ -158,8 +157,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 			break;
 		}
 	}
-	if (!info->outdev)
-		info->outdev = info->indev;
+	info->outdev = info->indev;
 
 	info->hw_outdev = info->indev;
 
-- 
2.47.1


