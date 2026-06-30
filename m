Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE26C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=; b=RtczueYzEsqSYM/x5lbdEtcAjU
	o6Thf4ec5sCR4bTvU+ar0Ewoo4e+SwroxnCpgQBBC/dZp5Lc/SFoJxQ+TxADfIARuYFmvrQQVsRAO
	ZNr1pJxs0DH3EGF6fVZdNjvDo28QP0/Iy+DdGLZ7TaCS53+HEdMrgT2+9oM3iJa944n464MjRg/vd
	63pEnEOWmznKkQt0F9JHVfR5zJe3ilLa5WwQiL715M9Nc/bU1p6tp+qni5bNHIZVhLx2MRk0rwRrl
	98z1iDladByOe2Uc7LGp6YGsTEIZaJQGZhf+kJ0xeMuC/AKvKXThx0WCSd24egzRBQAjOTuiTJrP9
	RvhkHotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQN-0000000G3Bm-0E86;
	Tue, 30 Jun 2026 06:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQC-0000000G33A-17s6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=; b=CcytKWacxSEj/5gEpnUq8sph4M
	tJmh4I/ABFwu/CzWbJYtwHUlYaHGdJPQopayr3cgNGnHCHZe2tpaXAxmBDKXVcL4Nb3L5rp44xx2h
	bEAuV5Gh6jPAEcgnpHxTw2UkgDsVsRp3aLAY71QwfcJNuFsqREjpVWUsWPdszs+QXlXp0t0Fe7OOj
	Pe6xfD1JwkYBgLdgx+wa1GdmuxktMF6YPg6QImR/5nKjOlQEgs1oWJyXk++nrnvyF7aEE2c9fTjgf
	2KDWKrYPoxxgwCvWMLXrJspmQNQt7+xzbrvLB5f5DJ0KHLxTg4c/Apj0+WUU1VP2OO6lzotT5s7uT
	K6i9Y/iA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weSQ1-00000001aGG-2Qef
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1613377f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802684; x=1783407484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=qeZObdv9bR5jFStyNV7SnMfPY2upVeak1TMZnpdeXP8fZ+HLDdc/ThdDcpc1D7lTFR
         8uTjj7UIFVUStJDg6zi3cv6PXHnBAHa2j6DLkHFpA6PlWdINTUBGaZCevJHiWR/9lCPk
         FanXN8DK/Xnh3OrOzsVKabMA75Mkbz4nU8RMMLlR1QGXlBJq9keXeAb3XvhUYoFyNEHt
         ZFg9bBX6Yn1rqbCzoDW41LeZr4YuUonqHv2uqyr6bG4hIDmTD0EILuiWNNSEi/uJWzKj
         n7LIhGqp3aP6t/VOXdqJisXohfYa4UWHojDFZFX1SHxjx35tIi4EedIjoPPKxczqLPw4
         gT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802684; x=1783407484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=rpKhOJrT9WUWkGPMogY2Ws6xjj7bkUq/eI7UPRyOq5sDMog/+kue//lLEpyIW9v7dh
         YSpnCMqFk7O96iZK9VmmOsD2U8CAx7ghUbKtsxhwVwOKNFY0RLcqOCrzYpQBpANntcVH
         qr/krpOvtxHd7Hypc2x4T7rHOoz6Ny3yxc2sHz386kBXuH2G2j0Qlj9QYFOjnXrGgO8k
         dAJAqylJUu95TbYHksuTsOUnegHyu8DpCLSAwuWClE7VrgfSApsjLo4sDPWQ310aoj4v
         Wjv2RTtXa7l+azzCQUVjQsiwv4YjKmWm/fhNMFpA/3qnHv5ely7pBMY2YYvlIX3zDNeH
         vv3w==
X-Forwarded-Encrypted: i=1; AHgh+RpOiUi7uwrc+Vgh2xt/PKrnd+kgCJefL7oS/pCKiVRi0QxLF8F/ELxHyekxABuUHImFw90uFwxNhQm4p4JUC9/f@lists.infradead.org
X-Gm-Message-State: AOJu0YzTVbTMkGXTxnbl/bz1OXaBUSushvaQVXOiICvJYjqRg57S7KWx
	aKaaKaXcL84Sa28u4FVrzVj5GFVL1JLrai8kNv9FQljzb1xC+uqGlbZg
X-Gm-Gg: AfdE7cmeMxoSdh5wfl1GOHS0rAkTkHd5SuNXoqQZcSsJAJJHHp//trgHaPSQOtaj9vz
	1VG/6pdocNjO9wy3fn6uK3v9T9FE27OQp9Jag1g/Zck5NfEDL7jUIELVRt878r9cK8vC2UN5aQK
	kazkFr6AMwYJrKA03PpdLn7wZmg0cb3mEk5zFhjW3dSVMJr0I86G85duvsBF4jmQhKf7lhMTPL8
	BRf/r0PkbCaBhibrlhiUmeWdJij88tnNR7k21dmrwyi1CnE3KDpecnnUG0nIEStsryXZEyP8XId
	1gMRthkF0Uj2aq2zgglOzi/ZNRhs6UzNlLGl0IBGc+uMZHv+6swtR/nxX3qKLOizJOGTdGpS9PZ
	CRjCEPfl2EqP3jTL8qXz1GM2IPqpPskuoI6vIycVcH+FpAW5JL0Nudw6gw2TlGZFLWSsmw2Rggr
	KH+cqT3eg=
X-Received: by 2002:a05:6000:8e:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-47552a67d8bmr2211230f8f.33.1782802684104;
        Mon, 29 Jun 2026 23:58:04 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:58:03 -0700 (PDT)
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
Date: Tue, 30 Jun 2026 08:57:35 +0200
Message-ID: <20260630065735.3341614-6-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_075812_665303_EBAF0770 
X-CRM114-Status: GOOD (  17.46  )
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


