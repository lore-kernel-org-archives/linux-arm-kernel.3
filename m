Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AADC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=; b=zsTg95SkGF6IhVLkxOpCDVoTWB
	Ws5hK57xB6C+zlOQVVe0/OHhiwwHdQ/xrfwLE3iU2axQxZL54ZXgWC3+HlaVht2yCerxPFRD15RBc
	krwk/331+UP8WhqLLwyjhkpfUpNS3W1cJk8t2vkHV+9aiJIjLi9xsB9BVgNTArciVP4m2gYxgnEVI
	bezkEXhVPajyqXkmwSAuaha/z87lSUI6uS3mSu5PnHwSrF4JLjkf2vqEL6DDtG5GpuWWgZmw/6bvE
	U4RgBDY4fKrYPkF7alxeU+qxEfyGjfpFa4VYAs43TOUUi9/eiIbCCu5mA9u+UXYCgceonx1bhuBEG
	p2I0gA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5KI-0000000Eiaf-3kgx;
	Sun, 09 Feb 2025 11:18:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5D8-0000000EgYk-2sZd;
	Sun, 09 Feb 2025 11:10:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so337511666b.0;
        Sun, 09 Feb 2025 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099449; x=1739704249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=FTqYt8q+7XJIHujUDlv/f34ctJZBuA7+sbnA05qBV0OTxV5dBbK5Bluf69GVbx+dM8
         vNJ+rFzh8oO9yoo35oT4LMPMF5h0bptFe/LectJYM+wkHKBa4qoO7B/BKMNdkyv2zVo/
         vM+A9i4W909seSijnvKRks0aZTvSOvS6P1cKY2vyQ2B3qUalbSgv4NvIn8RbwPuGiJkS
         2jsmrPcYDFocURna86/5h9wsSmbUdijZeUaK9IUIvxKOfW4sJujM6+ErQR4u8bq7AEL7
         oDIBk+yE4zTy4ztqYmUoXksL8gnYPiW8r2x/YQBNkZ5PRTlE2KKVIAUf5AHP6SrrKr2+
         R77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099449; x=1739704249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukwtTV0ExXBJKM7v4LhbJXSMG6hQJqW8GgzzDxNF23M=;
        b=vc6xsKYqKWRpzinYYB9CsAYjqMvfqTRxRrFbvEtNn+etJClDAxkFdPsZnID0BMtdWS
         0iaIPON/oAUA/6Vnt2npgKEOxq2WRUp98mQzUMqUeACFoE6Ca1WMxcvpxtZShRdfiJIl
         0MJTcb7C9qkYMuhxhhTy8Ssbm1RJLCZct9JQ4Fc9ZU/omhLsxrNuorkohJrpoAmF2XZ5
         eJsIIrhv6VFoRnKEiBDMHwfUEZ2Fr/SwH9J97W2SbCQMUFRsjRw82Hnp2aEaUXTaIOdj
         YrameqmrQPIUbrk+gkWqgeVU13UWZ5eirxVRDJFgo521eSI7NkqlExPDa46p4DVnfsHW
         YDoA==
X-Forwarded-Encrypted: i=1; AJvYcCWcFZBxs0l5IVp0FXVWNwku5r5dZXj3sC4jPc75sUVCXmKcXqsMiM/4d/Wl8YWYOcK8VYqs/X7q4P8DY/wwIV65@lists.infradead.org, AJvYcCXDxRQKVJWjwuQGjy/og2neVdCo3+33y6VYcrmUZRkRndyGYGE18ydmSBryPTW2ATMbyzCxHj2vTee8bTDoMb4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUlWv6fS2qm++zCji5hMeZI6XfUY0UVZAEAzEkeHn9zi2vj7oR
	IsLPDv+/VWHxW64cGsYc0BflfMRUjWfw5BkUNrN7WDkpT9skr/j9
X-Gm-Gg: ASbGnctW6cv53tfWeSQWaccldjPDOnosT9nb+dnZUAoBaYwu6AOGNt6FmmZTaEszsbW
	c+pCnarYh4ySh1H6tWS3BDWZDcEC9CFOjIvu9GtPDrj6DiNvE25rbLUTSwZXitOFBPGE19RXSnB
	5Pwr7eUL0Iw5iTm7vbZzJ0fzyMTlnzPz0OfJUHH94FMfTf7/EnFNnrFXbJoFW9v5idS13aapyZn
	6PJjdACPAM7UklLXjfOddqh+yp1N9rODr6fGQDAlppm00JmyT0V8UWniZuYFJ8kde3VvCE+gQsD
	JsYA8SBIypRSFNvGnNHWOddYnlwZLQaZr+1n0L5e7ZBFOPLGfoKYT/ohrMjvMdoiIx3FIeqVeFv
	hzTtH0MAR02czrN++ohrUx6EBTf4V3AFK
X-Google-Smtp-Source: AGHT+IFQ0RozlZVD0Ur8OeqIX9zHHE/nY2BIcLmW4b68G+IKqL2kYQbbZ+HNgEJWAQaRsfBoOg4giA==
X-Received: by 2002:a17:907:7f08:b0:aae:fd36:f511 with SMTP id a640c23a62f3a-ab789d3431bmr1087121966b.47.1739099448924;
        Sun, 09 Feb 2025 03:10:48 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:48 -0800 (PST)
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
Subject: [PATCH v6 net-next 04/14] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Sun,  9 Feb 2025 12:10:24 +0100
Message-ID: <20250209111034.241571-5-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031050_727857_AE7EE81D 
X-CRM114-Status: GOOD (  12.18  )
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

This adds the capability to evaluate 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets in the bridge filter chain.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_chain_filter.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_chain_filter.c b/net/netfilter/nft_chain_filter.c
index 19a553550c76..7c7080c1a67d 100644
--- a/net/netfilter/nft_chain_filter.c
+++ b/net/netfilter/nft_chain_filter.c
@@ -232,11 +232,27 @@ nft_do_chain_bridge(void *priv,
 		    struct sk_buff *skb,
 		    const struct nf_hook_state *state)
 {
+	struct ethhdr *ethh = eth_hdr(skb);
 	struct nft_pktinfo pkt;
+	int thoff;
 
 	nft_set_pktinfo(&pkt, skb, state);
 
-	switch (eth_hdr(skb)->h_proto) {
+	switch (ethh->h_proto) {
+	case htons(ETH_P_PPP_SES):
+		thoff = PPPOE_SES_HLEN;
+		ethh += thoff;
+		break;
+	case htons(ETH_P_8021Q):
+		thoff = VLAN_HLEN;
+		ethh += thoff;
+		break;
+	default:
+		thoff = 0;
+		break;
+	}
+
+	switch (ethh->h_proto) {
 	case htons(ETH_P_IP):
 		nft_set_pktinfo_ipv4_validate(&pkt);
 		break;
@@ -248,6 +264,8 @@ nft_do_chain_bridge(void *priv,
 		break;
 	}
 
+	pkt.thoff += thoff;
+
 	return nft_do_chain(&pkt, priv);
 }
 
-- 
2.47.1


