Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF87C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=; b=GafFuG24/Je1DaYWh1LyPHyVWm
	gt6PDiqKmeG1LVVMy9pL1FUuMfredDOowQNQHl7RoeSO++KmwgO4rZK4yPwuQAmtNKw4MknHw+1GE
	Q8PFOLRxkEK6gb0Od7Rj40JNWWuEqP0hfrRZ6IBLzc/UP2rijFoJ38FKcboFzZdDsHdg9VsDu/Azy
	TFtUw0rLnQrfO7311vNQdbloBAzvfhvHvHJah1cr7PoPBMrk74A/jjSFaGEAvTephPweEktsZk+0u
	49mMY6cle0lYgzPpkkwk7sDlMgjK7gSSBLht0rmnJ+AqjFM3hprDRwxoCvObYIhANwo8OM6wy4dc6
	uNOYQyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBBI-0000000EZTd-26VM;
	Mon, 29 Jun 2026 12:33:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBBA-0000000EZKI-0yMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c126eb4e228so83504366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736414; x=1783341214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=lbW0j5tqgN4VjLuP2GIYWkCSl/Se2LLAQmg7F8s7CZasFLWm2ptVDMJI6rnfAMIq9E
         9IK7s8UntgzEQdODzlmY/GwBias8vwpoKHaRESR4zptc0WAilTxMCNsVAXOwS5MnL93p
         UVHe9Xqcdofb0NNemwo+vgqsf9DYyx7A8MTJk22reZJ+GMUHw46FtSudkg+Z1bk5yOAP
         CnaT1Bw0p/WpdLvm1DZBNnUDhy8KXBh1CqSFmGSWV4xlzKB0h5noBsJZAicrdD/B+SH5
         tS621RUh4Yw1RjTbHaofom1N1eD/3qIoMgDq5TVbGiyxK0LkpF8P8kjtI4tNMWcI2xuN
         MX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736414; x=1783341214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=kPzo3RPQ9ptmdl1MjfUuDjyEQweMaCqpt7iUEzccvU/FUVvFlwQs0yGXZKiiQfL0G4
         BBget6If7mTgm5oWYCJJeL5yR+1fcMfTGuPnRU811hrruShtitI/rL1a0HbD4VRT7xXL
         N323fp1/a5g97Tw8wG4vDQEwIDnD3+r9jds198c6wT7QP6xtqUqzlzzgUXHJOn8TYcqw
         +Pu1Q8Lyc+NXMLm6aEvgIlSaNSjTXdU1j2uhGihq9qcAfCFJe4O9ZT1VL6l8aK6iK3nx
         7+04h72C1xTAN047NUCQjvOldwfaJA9kFWO0Vtl7PApFOzb/SZg0dxJPafZ8eBKeynuI
         rE9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq2kNrI/ZACIlgCegzivF+oBODbHxjNzYrwgCNYbFNuSVFRjXpler3emDReI3JLppAfu8yshM/WpZdxPpn3BA65@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq+5pYxdMU53or8awgUSF18jKtxI9yyZHk6Wz6l/uyu/L48cKz
	ZQ/KTa5WqRjy0reSSEwn8sJCBNraW2BynDBkLtadzV7bbzVAxUg5zQ4p
X-Gm-Gg: AfdE7ckUGMQPyLzjCzTbxpPAF6LB8v/RWE8FuExgZpf5cO+4qNHXThsK5niU3g4qeKD
	bnlQYdz1wHIcfALqgaA6r+eAgYUMc4UdxNlf125G3JvchvgOXwXcIXMS0oQ6urF4RVehPoExH47
	qKOpDgseL798dh9CW7xiHTi4R7WSuxqVYe9vatxgx6eTfAqrxQV18NBnMXTa0NWgsWZuupHNgD3
	bBcyp+oEcbLGqGRlOmVGUqYxDcEuSIroQ+Lb3ZFEeqTpcUH9+8t+5iUW5N4qkZ7lOAyC0tlcd7u
	aUVoPQPCThMJZ0oDKGCE3HBuvnyLP7JbuBQ4qwuFXIUQg6IOveWf6NkiTitVj5ciakDxKQXMAC3
	0p7ScvqNVZKzPsnWu0YD8/Kml9siV9Jv3+h1jB3VH8L1uc/xN4BDzDPZaasIxRROD8lpYlGjP8N
	vM8pTUaqA=
X-Received: by 2002:a17:906:f58a:b0:c12:34ec:ad25 with SMTP id a640c23a62f3a-c1234ecbf2bmr445790166b.65.1782736414123;
        Mon, 29 Jun 2026 05:33:34 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:32 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 5/5] netfilter: nf_flow_table_path: add VLAN passthrough support
Date: Mon, 29 Jun 2026 14:32:53 +0200
Message-ID: <20260629123253.1912621-6-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053336_312837_7F47D149 
X-CRM114-Status: GOOD (  17.55  )
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

From: Ryan Chen <rchen14b@gmail.com>

VLAN passthrough packets can be offloaded when bridge-nf-filter-vlan-tagged
is enabled. When a packet has a VLAN tag and the bridge does not have VLAN
filtering enabled (passthrough mode), record the VLAN encap info so the
hardware flow offload entry includes the correct VLAN tag.

Without this change, VLAN-tagged bridged traffic cannot be offloaded by PPE
because the VLAN encap information is missing from the flow entry.

Enable with: echo 1 > /proc/sys/net/bridge/bridge-nf-filter-vlan-tagged

Based on a MediaTek SDK patch by Chak-Kei Lam <chak-kei.lam@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 32 ++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 580aa1db3cb4..d15c425c88c4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -17,6 +17,7 @@
 #include <net/netfilter/nf_flow_table.h>
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
+#include <linux/if_vlan.h>
 #include <net/route.h>
 #include <net/ip6_route.h>
 
@@ -136,6 +137,29 @@ struct nft_forward_info {
 	enum flow_offload_xmit_type xmit_type;
 };
 
+static void nft_fill_vlan_passthrough_info(const struct nft_pktinfo *pkt,
+					   struct nft_forward_info *info)
+{
+	if (!skb_vlan_tag_present(pkt->skb))
+		return;
+
+	rcu_read_lock();
+	/* when bridge VLAN filtering is enabled, the bridge handles the tag */
+	if (netif_is_bridge_port(pkt->skb->dev) &&
+	    !br_vlan_is_enabled_rcu(pkt->skb->dev)) {
+		if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
+			info->indev = NULL;
+		} else {
+			info->encap[info->num_encaps].id =
+				skb_vlan_tag_get_id(pkt->skb);
+			info->encap[info->num_encaps].proto =
+				pkt->skb->vlan_proto;
+			info->num_encaps++;
+		}
+	}
+	rcu_read_unlock();
+}
+
 static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			     struct nft_forward_info *info,
 			     unsigned char *ha, struct nf_flowtable *flowtable)
@@ -326,8 +350,12 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 		nft_br_vlan_dev_fill_forward_path(pkt, &ctx);
 	}
 
-	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0 ||
-	    nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
+	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0)
+		return -ENOENT;
+
+	nft_fill_vlan_passthrough_info(pkt, &info);
+
+	if (nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
 		return -ENOENT;
 
 	if (!nft_flowtable_find_dev(info.indev, ft))
-- 
2.54.0


