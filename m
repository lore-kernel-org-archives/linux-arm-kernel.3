Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A4C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W02+miOc40enO8Kk7fWVAuXmWTmU4/GB4n7lg/BSofo=; b=W5m2MtHj/JYwPHJ95x6E4geIT/
	jz9Mujhz1OMpCtKKw64UTM7RyAVI9G/mjTPHY3iKWAyuKNJ7/EKBBQLlF1h7wLQrrzEumn9W2EEkw
	TslykAXsDTcNGcTsPatUcypVJ4Dl+O5t6USG/LrDeDb5IRtjsOfxfKBib0JupctpLMTOA58kxUImx
	TDtW+xQmEIZWgafw7uxojuNLDP0pukEYRLQOvnOcDhR5PM44poK2kt9ch2vf5ixeQlqqkxkDL7t/q
	gfREmzpduTzAmi+fhCvB1Fn+DZZvfeNJh1Bg0pRwywL2szYsbKubSap+AdZSmj2Y56Ms69HKQgPje
	h2FdS9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KlQ-0000000BQP7-18wn;
	Tue, 01 Sep 2026 09:26:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KlN-0000000BQNR-3CtV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:26:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c25b3c641fbso134171266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 02:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788254799; x=1788859599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W02+miOc40enO8Kk7fWVAuXmWTmU4/GB4n7lg/BSofo=;
        b=Vy2epx3El2SxtdTkrCC/t9NWl/SKnl2P+W96D7em4cwVnQwui6i+vjbaJCEV39XgcR
         rkxaF8dpW52T/moAE5VzLbJwwQzsCnoz3RUwIsDJjmEXX5lq4PiZUCstqV0GYVUHtOhK
         rv4/kdpS0xhBysIT6O6HRjac5gWE7J5/fBHXauWOv+iuhj5S8eLu/IdDEAoCstqe+AED
         /8VLWQj2OsMv1+iYlgK6fnIuGM5vCQUuE/aRKmiDgjVfY6WAHB+A5POcGIJZYAguPyzp
         CsqOu82JWN6ylvu4GZOtrt1zzKREB0gkXZniSvqBuYrhVNqAm8D9ZPVPtqg4OzTftMnw
         6lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254799; x=1788859599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W02+miOc40enO8Kk7fWVAuXmWTmU4/GB4n7lg/BSofo=;
        b=m2we6kDs7qIqhFQNQozwwODuxx/w6Wdg4iYIAnbvVyg8h5VsDv1npRepj4jMxFZG3p
         O/HHHt4wGhE6xttshm6Pf3wiIwBtowlV4IDyjVvhB97w21V/QM9rCjTDb9xseLNZjxEZ
         tTP8PzCVupfgGlTwpmUB0Z/IZwmEXg/Q5o8pu4BCNNR+M94ETblT4x193f8DWmY9AJJp
         i8wUv/N+9XMeAUCIoACYutKoMm+zfnQTdoVwyjXf4owt8QZ7m8g1Q4CU4AtxfwueCSN4
         UNi1UuObmCIq7qhwu3Mmkb+OwVzR8lKJDbJZe+5yZavnntqUyMz2nD5Korg0LC1P2xRD
         0tBg==
X-Forwarded-Encrypted: i=1; AHgh+RqeIB6hxqdEKWj/CLEGZI9HwGmj3zsWmUFhVijU3+YM5tSuwpToRAvzKc2jPD7KQuknynnCEIPOKJCwpdE1pPEr@lists.infradead.org
X-Gm-Message-State: AFuF++kXdDj1HPXbawMb21pvTWf3OglrI1VAoYvmbEZ6fJBdvPBXu7R/
	e5dj8aX12t7XM6ahcsdT1dxmK1ycifVI5Bp7aNusP6tffklYwPSaErwQdOT8KGWhcA==
X-Gm-Gg: AR+sD12LJzW0RGzCz9DnVyE5G0UjqyQfTlmde2RwfmRywFxruv01narX1yzaT3mz13l
	Y6uTo7JgsuvZFmzhOG8oGL2XKnD/hVfqwy1yvn4jdktOLX135LMnXYByC1JxOWbjjr49mxp71gh
	+yu+Ho0XecJbQO+XoH62Gyvn1+q5eDMMOKvXchpvjC45CVruseqrr9s0fHcB09bj+X1TzJa7cqY
	e6j1Y6RHmf/0WqdBlCFgI0KAiRSIVkKBJF6Rbf12v3Mk1c1P4+8jA958y2nZnRxt0+6f4l+d2pS
	oHhAS4WeM/pBv6j5qepmhjkR3fxUrMpaL0XTy0kQMWhSEE3J5UqbikrGEyZGahI/yptNRV0visZ
	b63/KnBeVwt7OymM7dSvc+iaWQk9o5wgbAdXlbeDjqctAzE+KfL4Od+6ML0BDQQsnEk+dwL7AK4
	vVmrj8/Gn6Ng0pGHwT/L2cyj2VbMehaQGBxS0I6u5RRcJs9L9ccjBtY92OTCfes7VxgL6Oxnss4
	VK3S0dsxf5kmS5gAovi6atdGVQsJECgYFXMsH7qp+wIixy6nVdsfCXV92WtUbbI4gXU1LS0I2t4
	y0RhxvKBBySNZWzo5LQ8EmexIRnrUTB7f+gAYK6cLgK3oVu25lcSkVtWow99ho7A6eS5YJdvgL/
	gG8mUQE6wjO3wUbfftQaB++y7RmWS50/lzaFSJXtczw2d+r6lagEdc+qMr+WfrK72p2FyB+Da
X-Received: by 2002:a17:907:1c28:b0:c25:2d27:5652 with SMTP id a640c23a62f3a-c25b3cc9a35mr447457466b.11.1788254799343;
        Tue, 01 Sep 2026 02:26:39 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.129.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb965sm574724766b.49.2026.09.01.02.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:38 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Phil Sutter <phil@nwl.cc>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next] netfilter: flowtable: carry a priority into the offload
Date: Tue,  1 Sep 2026 11:26:32 +0200
Message-ID: <20260901092632.369248-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022641_841922_90E366CF 
X-CRM114-Status: GOOD (  19.61  )
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

A flow rule handed to a driver describes NAT, encapsulation and the
output device, but not how the flow should be treated on the way out,
so hardware with priority queues can only fall back on the DSCP the
packet carries.

Carry skb->priority of the packet that created the flow and emit it as
FLOW_ACTION_PRIORITY, the action act_skbedit already emits on the tc
path. "meta priority set" before "flow add" then reaches the hardware.
A flow without a priority emits no action; mtk and airoha, the two
in-tree consumers of these rules, ignore the new one as they do
FLOW_ACTION_CSUM.

The flowtable holds one flow for both directions and the expression
runs once, so the priority applies to both; per-direction
classification is not carried.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
The consumer of the emitted action is a DSA driver for the IPQ8074 PPE,
maintained in OpenWrt; measured there, "meta priority set" ahead of
"flow add" places offloaded flows in the port's hardware priority
queues. The mtk and airoha hunks are compile-tested only. The new field
grows struct flow_offload by eight bytes on 64-bit; the entry allocates
from its own kmem_cache, so no allocation-class change.

 drivers/net/ethernet/airoha/airoha_ppe.c        |  1 +
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c |  1 +
 include/net/netfilter/nf_flow_table.h           |  1 +
 net/netfilter/nf_flow_table_offload.c           | 11 +++++++++++
 net/netfilter/nft_flow_offload.c                |  7 +++++++
 5 files changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 92611802801e..2afce76ad131 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1161,6 +1161,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 99b28aaa7cc4..4ee99e8e4a34 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -378,6 +378,7 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f,
 		case FLOW_ACTION_REDIRECT:
 			odev = act->dev;
 			break;
+		case FLOW_ACTION_PRIORITY:
 		case FLOW_ACTION_CSUM:
 			break;
 		case FLOW_ACTION_VLAN_PUSH:
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index f2e2771f188f..23218c8cbc3d 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -202,6 +202,7 @@ struct flow_offload {
 	unsigned long				flags;
 	u16					type;
 	u32					timeout;
+	u32					priority;
 	struct rcu_head				rcu_head;
 };
 
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 801a3dd9ceea..caaadffc2563 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -696,6 +696,17 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	    flow_offload_eth_dst(net, flow, dir, flow_rule) < 0)
 		return -1;
 
+	if (flow->priority) {
+		struct flow_action_entry *entry;
+
+		entry = flow_action_entry_next(flow_rule);
+		if (!entry)
+			return -1;
+
+		entry->id = FLOW_ACTION_PRIORITY;
+		entry->priority = flow->priority;
+	}
+
 	tuple = &flow->tuplehash[dir].tuple;
 
 	for (i = 0; i < tuple->encap_num; i++) {
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 32b4281038dd..dd3ac2b9c963 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,13 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
+	/* Whatever classified this packet before it reached the flowtable also
+	 * describes every packet the hardware will forward in its place, so
+	 * carry it into the offload rather than losing it with the software
+	 * path.
+	 */
+	flow->priority = pkt->skb->priority;
+
 	__set_bit(NF_FLOW_HW_BIDIRECTIONAL, &flow->flags);
 	ret = flow_offload_add(flowtable, flow);
 	if (ret < 0)

base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
-- 
2.53.0


