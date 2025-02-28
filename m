Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB246C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGr0DGFtdF9vUQZNuQxbjKzErqMA9pCa8F2vVWAZr6U=; b=EBFQ3/p8zhfPz0zRQjuZgBZ5c/
	etIpD0/Iwnz/Aa1oE0FMv2x5XShbHTaUw14xyyaYeBkuLuGt6OX34rotiP84ymFuxAumDUvTv7ffg
	cq7B5QgNqYCFkwy3esWksJqQSVKpqWBeJYRAHaIXp3dGOWN1cleYVw9yHadGC68QLmGvDBoW11aWU
	eF89g9cPANaIzNgBdpZX4kuAQD/ZYm1+AE3uy0cs0tztsYHvf1SSLMWo1NfWWjzdQO44MkLJpXNuX
	sBzMAxAAlhCIjgFdBCbrdpgDVcbWrNOdV9LG0zAZ/1UwwWaZogrIMu6c6nHzRCaoQVqSr6JRkxAYh
	5XWgj29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7Xz-0000000Cg0i-1Z2v;
	Fri, 28 Feb 2025 21:05:27 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mT-0000000CYH7-0YLs;
	Fri, 28 Feb 2025 20:16:22 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab771575040so642978066b.1;
        Fri, 28 Feb 2025 12:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773779; x=1741378579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGr0DGFtdF9vUQZNuQxbjKzErqMA9pCa8F2vVWAZr6U=;
        b=d8VXEV/bWrHqlQr6FtJF9I+w4/vSmGafM7uU+HbSQOd/LEMCkHKFJZS8DkCFpkSRNG
         DSsVyVQmxrvuvhQ180bS6Zy/tekgFT9njXM9DnJhqEsvpUd7B3tVgQ5iDiDCqumw/yWK
         BvDnS9iwZUwbXT6oGjLMesElYW3ix45k0TgAknlo3xkBNsGncDczSwQDOB9yCZcOvKh0
         cQxicHpT8YJ1JC+DyHEE1Ot4YzMzoC6B5dhlL8hBiW5QSMHrsiLcuL+zNqHNygXgNBxl
         RE1aCGETixleWW0KUHiPguudRaf/0QCTxZGJfD6QBZfZqjlHSYZVzB0IStN/569vj0hT
         sXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773779; x=1741378579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGr0DGFtdF9vUQZNuQxbjKzErqMA9pCa8F2vVWAZr6U=;
        b=l0HzHwxvNK7T2Pn0mprJ9COwzILTrQ+tyLRAGzQdH/e49cS+BMQmIaz1skgWhvChfK
         qffB1o/KgfZpjSpBZvRk0axHdQ9O6yC/VS0oeKGXF41ZrrB2dAw3ryjwcX1vEupUlv18
         RtHR6GpFDKNrMzxIzyzMT/WhlPPsysJo0JdwT0HuBdlGygUIeoSMyKE+I4fHQarE40Bo
         IKVKBnGgAl+ZCGB5+yyHbCSOsVPpvCChpJyJztlYmltroqZereDnpWYCBS2tQMiYz1y0
         r+N+urAP54Xhrkk70X3tRs8uhjaKsKmY1I/drDIV9J7OSjtgNJFFDm7DFw2qbGuzadfk
         hgmA==
X-Forwarded-Encrypted: i=1; AJvYcCUXEpUlUhoQOddg0K5CwFwtlLXcCJmfKvLDOhLCSSdOaPrPpdrlhs1LywApyeGavltmr3Mna0Q7FE1z78aq2p4=@lists.infradead.org, AJvYcCVdiWUpY+rHZb2lAJhkjYF8YrpSufpmnxhouzEy9B1qKFClNTSYySHMkfQdCGbbWN1jv9GqOgiqDweXNtxmEvTa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyt7VKkifST/ZqoQo+UIQHLOU9tnSWCZDoj+amNUeO/kw1hf0k
	N8TA7gK56D4uPIqIyrsC2DjhM7hFmkmehlLsQbMklw1+vqTm+o35
X-Gm-Gg: ASbGncvPtNjRxjqzUkaqc0S8Z4UfcGfAW2FIW54DA/QGeLF4aK2UeLD5VBnA8LLf4MO
	RFdFKNPPxV3sSuFQXNR3NEWVIJBW6MDqoIEOoqGgSNgKPjQQa6DTst2RM/sG2rOrJzQOECN0U0f
	NSNttSIGj06Z0ZgtKgpgVKuXlnxkR/YFOM3vSQ0OBr/qH9dOJCkE83X9CbcZZMBfu/+mBh7O6gt
	M7HJhRkdGE0tpuCG9RQwgUUndumPtDfFzvuGAETC8aCEx67sUrsRu/WHUliH/MeUuF+NI1u/Emx
	AD1xMyUXSYTVpUv9Be7B/XcLE94gIul5PnRsy8oJ+6iHPdrXiofnTcK5zq+SRg8PVTunV+vlfOV
	sgs1weQCWqB8kGcRtv/FHDx86JNX599eBTEnO6vCTJww=
X-Google-Smtp-Source: AGHT+IFSsO0D6FLoaTBr5CsWmwmRlLw+sSkoUxgYwd46U2pqe5KcLEx75Cg5UhavDa3o6cjGcNQ8Ug==
X-Received: by 2002:a17:907:a4c7:b0:abb:af33:d0ac with SMTP id a640c23a62f3a-abf0605eec7mr944542066b.16.1740773779092;
        Fri, 28 Feb 2025 12:16:19 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:18 -0800 (PST)
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
Subject: [PATCH v8 net-next 02/15] netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit direct
Date: Fri, 28 Feb 2025 21:15:20 +0100
Message-ID: <20250228201533.23836-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121621_177680_3E9218E0 
X-CRM114-Status: GOOD (  19.71  )
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


