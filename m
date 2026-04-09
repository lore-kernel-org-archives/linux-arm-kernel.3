Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3883FEA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Irwspz2ps88dKeB8+U/y4ym0gir6HScvO8JojpWj/6c=; b=mT2gK/iGFyReRUVQQA6weePrT7
	mZ1hwnptDJobACKuCEwwqSvIAoV/Z188Aw8beoO9KCQyu48TIGPm1UkFL/OOrfV36x88KYfpQbwnu
	M88/9oaqG15R0+SeRw3mLRIYCz+L1mv9RG3NyaMhhy6nJHg8bIEIFlXTDAK+GncdDj41eT7Vhh4gs
	KwRYHLqXNJE86MDgxDOn09843x/2/I5eCZRkWMpKQb41MLU/Lju6HTfHAp735IeRlW1V/OxLPKeI0
	Zo0/Es9Z2JvZ+gz+JIswVLphYnEU0KFVPORQcYTfSK9bR8YlDnLmJD+z9XDA0obs/2fe5fuqFtlP1
	w153XwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp6n-0000000ARNy-3BYv;
	Thu, 09 Apr 2026 13:07:45 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp6i-0000000ARLS-1uT1;
	Thu, 09 Apr 2026 13:07:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wAp6a-000000001k4-1gBy;
	Thu, 09 Apr 2026 13:07:32 +0000
Date: Thu, 9 Apr 2026 14:07:29 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: [PATCH RFC net-next 1/4] net: flow_offload: let drivers report byte
 counter semantics
Message-ID: <15636456e2bb94a565d139333e586ce5b63bc8c2.1775739840.git.daniel@makrotopia.org>
References: <cover.1775739840.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1775739840.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_060741_746940_6E0A87A8 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Hardware flow offload engines count bytes at different points --
some report ingress L2 frame bytes, others egress L2, others L3.
Add an enum so drivers can declare what their counters represent.
The framework can then convert to L3 as needed for conntrack.

Default is FLOW_STATS_BYTES_L3 (zero), preserving existing
behaviour for all current drivers.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 include/net/flow_offload.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/net/flow_offload.h b/include/net/flow_offload.h
index 70a02ee143080..7f5ef29b3abce 100644
--- a/include/net/flow_offload.h
+++ b/include/net/flow_offload.h
@@ -541,12 +541,19 @@ static inline bool flow_rule_match_has_control_flags(const struct flow_rule *rul
 	return flow_rule_has_control_flags(match.mask->flags, extack);
 }
 
+enum flow_stats_byte_type {
+	FLOW_STATS_BYTES_L3 = 0,	/* L3 (inner IP) bytes */
+	FLOW_STATS_BYTES_INGRESS_L2,	/* full ingress L2 frame bytes */
+	FLOW_STATS_BYTES_EGRESS_L2,	/* full egress L2 frame bytes */
+};
+
 struct flow_stats {
 	u64	pkts;
 	u64	bytes;
 	u64	drops;
 	u64	lastused;
 	enum flow_action_hw_stats used_hw_stats;
+	enum flow_stats_byte_type byte_type;
 	bool used_hw_stats_valid;
 };
 
-- 
2.53.0

