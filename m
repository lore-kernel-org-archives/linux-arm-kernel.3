Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22617C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=; b=HdOFo7VM3Wx9bFo9OxwWs7moz6
	OY12w0yOLRRh7aGjx9xhnCjeAkk5OjflIULMyl6WaHu1WIpIALRnEYT/7QAi1LYYM9unarFDcxjld
	hOwzObQb5dKX+08mqLX52j87vO2YSom5Nh9oMqOgCrKvpL5eC+GYjTYv+VR/QmTNUFsZt0+x7X6iZ
	Tny/J/MM/bk+4BdaoZVHnAFD8OrVP7N654hEAGyNENJoxLrYXklWirxxwystfeMsZCiOP2Is8wJqv
	TpfdlyMWxnq6d3BiKxStdK1Gijq3tB4+E78IxV6jcpFWGVskjUzLzlZEX60mKZBnCh7ysPICqixCK
	lwaMBqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th5Iw-0000000EiJZ-26gO;
	Sun, 09 Feb 2025 11:16:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th5D6-0000000EgY3-3s6P;
	Sun, 09 Feb 2025 11:10:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so391162a12.1;
        Sun, 09 Feb 2025 03:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099447; x=1739704247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=;
        b=BpRmv91Qn4JbZOmXMT+MfppsyxjfTdoxeIgt4dCFHmpH8FKAJeCaBSFdCjleVWxV4R
         vQILFU8BRU6aClXQgV5hQh6hMVIlfJo4XlWr8Q6207EzDyH7HeXaZo6Iy/9mH5NefxG5
         gAykPVBXnIC6JIq4AIPw6EDZ9JiIhOc9z/wQLkYaTMT4N4tQ/8eFVInBpvEvIgGA5zwa
         9VdOoqoC4fbSbOiwx6T6qWokShHsVVZiqz77Zb3E5H0GS164X4I+3i5yuFr0uxr5+KBi
         tQJ6CFcX3hVR+pHaW6zh6NaZA0MRvYf8DDYcTmeVDVjibaoJv3eeLyQwl8hsRzuxEdGj
         ivHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099447; x=1739704247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rhlCg4/52AHm6e8tJsmpQptNUxepmsLI5spztxpn6c=;
        b=pWtLVaJGSNKUwS5SPobYhAfSPuQVRaTgepnHgbKJTncRXE2p7omdy2FzBTJhoMfJ+o
         3vfDjU+bhVHDej5DhivuZLj3NSRm32K4gkTlc6ZEyDAFnZSzkY+a5aguqKISiV0ZU33a
         evmdV+j8D8gE35aB6L+rcuaonwrW5gC9pZQuQsT2+Atn5qIgXs2lSLinZD26E/jFhYRc
         SUKAPQtJkaDp/7Wjh6EF7dgiw0eygika4ec856J374UbH4PG6jvyPfXbabIcKA2Z0ikK
         WOAMya3aGt2JYxD6QRraQg+6hCCE2HeGCaYdcGEfaiZDHhUpfiEnjzzJkvzpN9lhWuNA
         ix2g==
X-Forwarded-Encrypted: i=1; AJvYcCUz56qrlwLp7MtTv7SoI6iDMcFSOasfT6U9PI0Op8x5yY9D25Piu8ky8HepJu2B/hIMD1bL/R5U4boUZ6laz18=@lists.infradead.org, AJvYcCWNwS8R0A3Fm0axUSKJUaS6TNwxlkeF/69vtw0ptkXc6XzxhdjwF3b98kXavGbe6/d6IFiKzK9O3ahJQPfn1y92@lists.infradead.org
X-Gm-Message-State: AOJu0YwHjbroNOGpslVRrzsJHcUzCKgHc+WZpE/YSHxe87VYt0AF1+2n
	Ens5Pe4L8Gze3/saUO3/VGaWytUpsCe7P/+1Ob7SBEebgPpaTXFy
X-Gm-Gg: ASbGnctTp9ggL25USYf+naNW0+7DdhGMtrzPNgig77YxQor3CBIjQzkYtneFQ14Img3
	DqehzKVhJuSHimLtwzg/ZMSuXD9OpISPcJsWagMXqdfps9uIaCE4wBihlOuNaQuSBGvqP+CcUHp
	vi19YWlWOZr+DKcruRzYf6gImG2SGw7XuwUSon+RHm7kfkACNWd7wEe6k1oeTreFJu0LuoCTJkS
	JNKq7xLOILTGQsjpxnAgitWfYlWnz+Z4BJ5cECDDyUBXM6ekPZ8EDPNVOKel6V2coIDWtb+2N0K
	yY7VghgoNhhY4ogYPmXgtWcnCC9PEG95nbKFFEnnCTJutmBEbbmni6NihLW7hv8y0b8eHYGqhA0
	iiILN/63afTKVPlSIxlh7sVjgE8RCWD6y
X-Google-Smtp-Source: AGHT+IEJGx8wQoo1dMKGJULnbHYNaXYTUKaNfqX5z4+uVPE/Bt8Onuv1jKMr9kAQ8Pgh/X+AOmc+8w==
X-Received: by 2002:a17:907:c04:b0:ab7:e71:adb5 with SMTP id a640c23a62f3a-ab789cbe4f0mr1245719366b.35.1739099447174;
        Sun, 09 Feb 2025 03:10:47 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79afc7452sm357516366b.163.2025.02.09.03.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:10:46 -0800 (PST)
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
Subject: [PATCH v6 net-next 03/14] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Sun,  9 Feb 2025 12:10:23 +0100
Message-ID: <20250209111034.241571-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250209111034.241571-1-ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_031048_963469_E0CDD884 
X-CRM114-Status: GOOD (  14.22  )
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

This adds the capability to conntrack 802.1ad, QinQ, PPPoE and PPPoE-in-Q
packets that are passing a bridge.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/bridge/netfilter/nf_conntrack_bridge.c | 83 ++++++++++++++++++----
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index 816bb0fde718..4b4e3751fb13 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -242,53 +242,112 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 {
 	struct nf_hook_state bridge_state = *state;
 	enum ip_conntrack_info ctinfo;
+	int ret, offset = 0;
 	struct nf_conn *ct;
-	u32 len;
-	int ret;
+	__be16 outer_proto;
+	u32 len, data_len;
 
 	ct = nf_ct_get(skb, &ctinfo);
 	if ((ct && !nf_ct_is_template(ct)) ||
 	    ctinfo == IP_CT_UNTRACKED)
 		return NF_ACCEPT;
 
+	switch (skb->protocol) {
+	case htons(ETH_P_PPP_SES): {
+		struct ppp_hdr {
+			struct pppoe_hdr hdr;
+			__be16 proto;
+		} *ph;
+
+		offset = PPPOE_SES_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
+		ph = (struct ppp_hdr *)(skb->data);
+		switch (ph->proto) {
+		case htons(PPP_IP):
+			skb->protocol = htons(ETH_P_IP);
+			break;
+		case htons(PPP_IPV6):
+			skb->protocol = htons(ETH_P_IPV6);
+			break;
+		default:
+			nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
+			return NF_ACCEPT;
+		}
+		data_len = ntohs(ph->hdr.length) - 2;
+		skb_pull_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		break;
+	}
+	case htons(ETH_P_8021Q): {
+		struct vlan_hdr *vhdr;
+
+		offset = VLAN_HLEN;
+		if (!pskb_may_pull(skb, offset))
+			return NF_ACCEPT;
+		outer_proto = skb->protocol;
+		vhdr = (struct vlan_hdr *)(skb->data);
+		skb->protocol = vhdr->h_vlan_encapsulated_proto;
+		data_len = U32_MAX;
+		skb_pull_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		break;
+	}
+	default:
+		data_len = U32_MAX;
+		break;
+	}
+
+	ret = NF_ACCEPT;
 	switch (skb->protocol) {
 	case htons(ETH_P_IP):
 		if (!pskb_may_pull(skb, sizeof(struct iphdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = skb_ip_totlen(skb);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ip_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV4;
 		ret = nf_ct_br_defrag4(skb, &bridge_state);
 		break;
 	case htons(ETH_P_IPV6):
 		if (!pskb_may_pull(skb, sizeof(struct ipv6hdr)))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		len = sizeof(struct ipv6hdr) + ntohs(ipv6_hdr(skb)->payload_len);
+		if (data_len < len)
+			len = data_len;
 		if (pskb_trim_rcsum(skb, len))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		if (nf_ct_br_ipv6_check(skb))
-			return NF_ACCEPT;
+			goto do_not_track;
 
 		bridge_state.pf = NFPROTO_IPV6;
 		ret = nf_ct_br_defrag6(skb, &bridge_state);
 		break;
 	default:
 		nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
-		return NF_ACCEPT;
+		goto do_not_track;
 	}
 
-	if (ret != NF_ACCEPT)
-		return ret;
+	if (ret == NF_ACCEPT)
+		ret = nf_conntrack_in(skb, &bridge_state);
 
-	return nf_conntrack_in(skb, &bridge_state);
+do_not_track:
+	if (offset) {
+		skb_push_rcsum(skb, offset);
+		skb_reset_network_header(skb);
+		skb->protocol = outer_proto;
+	}
+	return ret;
 }
 
 static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
-- 
2.47.1


