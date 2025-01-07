Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE12E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+WwlYEDG0HLvBd8VAnV5F5MIiHlMD5bJhzWof6nBUU=; b=zTioqtDQTQs/LrNNQ+gCu5Leol
	f5+lDEQUJr92KckuWW+5p81woJo6DCHjZFZZQC0NpIbN6aXFciXY3dF6E+Jf8OpmJTc9wH1/hWZeP
	QetWdAecHWw2MhABBkcDbi+T8M/Bt2L4O/uiuK67UcrCaGruziZvk/RU2McLzJIAN3fFwKrngst23
	anqRFe0gO3+C8vp+Znv8pGR8XtHwcPp73Adxf4V/sGewC7KcJ2y0V6cpMRSbOm2b7C+e06tTBd+ix
	zZkjD9XAyDhasIWFpsGJ+8TQPi505+tbmyd/EVnAt1PVdXqUEarAlcAHLveC3pycKxZL6oF1q6uDJ
	NzBKgVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5ar-000000043iF-25N5;
	Tue, 07 Jan 2025 09:09:45 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XK-000000042VI-1qS5;
	Tue, 07 Jan 2025 09:06:08 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso412644a12.0;
        Tue, 07 Jan 2025 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240764; x=1736845564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+WwlYEDG0HLvBd8VAnV5F5MIiHlMD5bJhzWof6nBUU=;
        b=Kv5CXnKrBXcwuKbJjSba96oL4/aDen42G6Gd5eMd9i1AsEp9F2Ib+84oPw19ncKh4a
         N4k1waDDHUlC/UTjuI5FyAMAsAxe45JiPP4iOslMfbiFRAJBUWANaV6uwtkAGBciNzlg
         /az8d3AouMzC62pPLP36M/6+wdkdufhq/bLIZOmDSBk6tuZaGfvP4OuG8O6aUTNMEF2j
         TN9oW+FEcydhRPCGGrjPhiKafBnZvUb93oQqbi6VSdPB85O/0DG6Fyojycoyo/xRwuJr
         CflZWuMkm1Su+8sr1MfSM9gD2GelSVH+JMwF/5t5pm1B8ysrjzBGqN9MUIYNiNql+yYt
         yHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240764; x=1736845564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+WwlYEDG0HLvBd8VAnV5F5MIiHlMD5bJhzWof6nBUU=;
        b=f/WYmLeg2psjj+nEWKU7tY5NJsNHrXK/+zg2RKNykqoXECXK2WnP1hB2IUpGX/8cHj
         qKUS8KpUqlX3e2u/F5pV8K8M0R2kFfdiQ4LA4qJ03k6WBrNazdH1ZxGaZlPxCpeBKL0E
         N0JrEi/HExIALJZ099I9ZEosQFdHVN9NT8nEuHVY3x+bI5mL1FObfMbBXEL8lA9rfwXc
         mRtz6AImw6J6e7BvOOfaAU8Ee2/vwxTZ0cntAA6eBTYKjQqK3mQy3Ov9AFce4m/TMGSO
         sgZmaYoEqH4vOUp7IAvTTb0E7/9rCDKlJ1Ny6z8W/Q0aZ4nU+NC0fb3hpDIMG5ncRmLI
         eyRg==
X-Forwarded-Encrypted: i=1; AJvYcCXBkxhMd9LavMpWeMoRmeRXFBrM7WU1r+fNro05sXLtxVrVSyGTGhe7wI5xAFndFW4FRZEKTKToYhkVywa614vA@lists.infradead.org, AJvYcCXZE1eE3q15WwsOlEhxtFDHnRwfOvW7wupP0EohjdTs+coZ9WzT72g5ChICHz3njmn+X86iNHGenRwmr74ZL4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWCV0a33oR5J/Mu4MOO5LG8tuvr6Gf14Ywdmt394agMrW1cIG
	uKwK++OLMy+KHXmJHaWoWIgoue0GatRbz8lbwastQaXVmd5+GfCg
X-Gm-Gg: ASbGncvWUBUzw3/Xw77M5EceqHIwnPWDd3Fhw95YLY+CTNSm1ni+TYmCu31pIQOFmJU
	ux73XK1ygi57AYWybUVcpLXVDDbeULAHHX9HMQsyUOTRrmzgjlliSD97wECfTdooNvM+i+jcnd0
	r+T7+kDl0uKKlMPiLdPiPIqDxRV8BARVarzo1Z89xXBE41DHe3s5SosKy+XhuGl/B+3p6xfF7za
	QX3RCRqL8vvObYAZNJTm5h9C3bNxfpU2olGHDf+DHiDzVEmZahOf1gwvjRkZ3/p4WPiDH4MoN+f
	baKJUd4m99is/0gi5qTCYYTyGd2sBDg/P5J04HCQhT1jmMGEW3gVU984FPydNqqPLXiq8QkO3A=
	=
X-Google-Smtp-Source: AGHT+IE84iozQuTG7YLPXSHPMUD1Jp0Hd82dBIjkAMjnqzFh19j2OWr5/GOeKdXGrKNPV87nRB5Drg==
X-Received: by 2002:a05:6402:524d:b0:5d2:723c:a57e with SMTP id 4fb4d7f45d1cf-5d81ddacfeemr57802207a12.16.1736240763963;
        Tue, 07 Jan 2025 01:06:03 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:03 -0800 (PST)
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
Subject: [PATCH v4 net-next 02/13] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Tue,  7 Jan 2025 10:05:19 +0100
Message-ID: <20250107090530.5035-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010606_476903_C5F732BF 
X-CRM114-Status: GOOD (  14.16  )
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
 net/bridge/netfilter/nf_conntrack_bridge.c | 88 ++++++++++++++++++----
 1 file changed, 75 insertions(+), 13 deletions(-)

diff --git a/net/bridge/netfilter/nf_conntrack_bridge.c b/net/bridge/netfilter/nf_conntrack_bridge.c
index 816bb0fde718..31e2bcd71735 100644
--- a/net/bridge/netfilter/nf_conntrack_bridge.c
+++ b/net/bridge/netfilter/nf_conntrack_bridge.c
@@ -241,56 +241,118 @@ static unsigned int nf_ct_bridge_pre(void *priv, struct sk_buff *skb,
 				     const struct nf_hook_state *state)
 {
 	struct nf_hook_state bridge_state = *state;
+	__be16 outer_proto, inner_proto;
 	enum ip_conntrack_info ctinfo;
+	int ret, offset = 0;
 	struct nf_conn *ct;
-	u32 len;
-	int ret;
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
+		} *ph = (struct ppp_hdr *)(skb->data);
+
+		data_len = ntohs(ph->hdr.length) - 2;
+		offset = PPPOE_SES_HLEN;
+		outer_proto = skb->protocol;
+		switch (ph->proto) {
+		case htons(PPP_IP):
+			inner_proto = htons(ETH_P_IP);
+			break;
+		case htons(PPP_IPV6):
+			inner_proto = htons(ETH_P_IPV6);
+			break;
+		default:
+			return NF_ACCEPT;
+		}
+		break;
+	}
+	case htons(ETH_P_8021Q): {
+		struct vlan_hdr *vhdr = (struct vlan_hdr *)(skb->data);
+
+		data_len = 0xffffffff;
+		offset = VLAN_HLEN;
+		outer_proto = skb->protocol;
+		inner_proto = vhdr->h_vlan_encapsulated_proto;
+		break;
+	}
+	default:
+		data_len = 0xffffffff;
+		break;
+	}
+
+	if (offset) {
+		switch (inner_proto) {
+		case htons(ETH_P_IP):
+		case htons(ETH_P_IPV6):
+			if (!pskb_may_pull(skb, offset))
+				return NF_ACCEPT;
+			skb_pull_rcsum(skb, offset);
+			skb_reset_network_header(skb);
+			skb->protocol = inner_proto;
+			break;
+		default:
+			return NF_ACCEPT;
+		}
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
-
 static unsigned int nf_ct_bridge_in(void *priv, struct sk_buff *skb,
 				    const struct nf_hook_state *state)
 {
-- 
2.47.1


