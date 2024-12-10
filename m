Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC21BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+WwlYEDG0HLvBd8VAnV5F5MIiHlMD5bJhzWof6nBUU=; b=Za2g0RWiO7HD3hz9c+yKddISAW
	coNHwYrb5i1CCZdDLLpOed5xj/IE8fZL3OTBYngmv0pCVkXLfg/t0FeT7NBDrcih8qT++C4mXsquw
	TmoTK2LTYxzxUkR7ufbskEqK9boQIg3lw/L3IZaA/6Co6ZBymkkdaecYHZt6ac297+dEACr5TSMPO
	UGEGYR4+YjLuLsI1DyNQ2wDLnY+UME1OJvRQ1ZUAz3CbOCWnZImzkQqhjb7eShQB2RyM9d0ikDVaH
	jEGBPZMMsou37CQj/+5MM4HfsPhaOIInJHQaJI04YDRXkP7jCVktI+TD0PxGExMLHh0wC0rLoe7cG
	X8fzYJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwrw-0000000B07w-0fbt;
	Tue, 10 Dec 2024 09:49:28 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwor-0000000AzDs-0gso;
	Tue, 10 Dec 2024 09:46:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so4470701a12.3;
        Tue, 10 Dec 2024 01:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823975; x=1734428775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+WwlYEDG0HLvBd8VAnV5F5MIiHlMD5bJhzWof6nBUU=;
        b=BPKL66eN9qP3QEBuctBxnI9aUvXp191vAB3mUseK1TwzlfDsFqprzSaOXN0Tw75GPk
         AfnPbII6DTYpKmcx8HLQojp7d0ViwsiJG76jxgNwTK0ZGEGdgjZjPf+/HWX+OzJSkRdh
         XwinJMbhQDImREw5oKdE8xDsZprdQxPfxa3KIxLeOngI9nWwZhJOFZCRdZk47/DUuJvw
         C1A0ky7G3O844Bb9Le4hEX7bVTDJ9eDuGGFWrvGhYlKoluGgg9OMH9fSpO9et2EpuL5I
         taGa8Ca3Hc0CrAyVpn7ToOYoU6CaCenvvY7rcK8csx2iCifSFocrt49LZ6XQBFoA3YFY
         Njig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823975; x=1734428775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+WwlYEDG0HLvBd8VAnV5F5MIiHlMD5bJhzWof6nBUU=;
        b=V10yQtm/3uxuSdB8kjv1CIAfUDd9nbJxhDj9xypQ/6LMysn3haRbkf99namp1m1+6u
         ibxnkRhBuMJmRKD9xwBTXyAAUGpSDnJgbwiA0dHdVezsYBew0jbH8x59G8uQZA1az4i9
         HIZI4D66Vl87vIeJtB6r5F7T9AZmxeDN3wvAkjW77JqLBqT1rowc9jUx2CqHOSUpKLqb
         1GMGk/Zaf6eIwsasRCFGxjqr8IyYElBbb8bBBGsJRBuACveOA/j/Sf9t4WmYbrmdPzKg
         xG1MNUdI59SnEPeTeCYWg+z9JqI5JajgbFFIFf6uJ98dgZP+5HgHbjvF9mH7XLBrHz4u
         Y6+g==
X-Forwarded-Encrypted: i=1; AJvYcCVMYuU2jJcuXzQXjvsjfp8SueAH/DgXnT02gUJvOTpDvuTylRTN9AgxHa3qkDsThLSyJc8oeOpILvxCvbEMeyDn@lists.infradead.org, AJvYcCXO0a+bc0XDY7FcElz36j2dLj+1Utf/DJuMvl28tMxoWJvtkD+129boToS5AaBPUWJxHKWUsa9WqJG383nhshs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh/TfLFri887vsc39MqMKhzyFgpgVOG9+oO/Eb0ECGGdnhfwzw
	VaUiRGbE0bA0NHuJpNWu1YsEgW3488PzY9+TIYM/nNKChODGE/or
X-Gm-Gg: ASbGncvfHbyM3kip+a1FV0nT63xMR5kcypvDemy0H8Txh3/7JZnU2XOgMeKBgR9iTTd
	vpGRksU0Eh7oi15Z1CrYdjKv2FmYcSlSeais2pYKWcjdvOeLHZkiosEQyjXIQYFwiZYuYtw1i2A
	t6r4/1blGUF4y+3GxW9URXECLrgrV2G+u2hDqcN/tXSduSF+A/t4xrsGPS2G5QPQYhf+bI2lcIK
	FvaMoCIIhqKndKUiiz/q2CTz2J3CqRtreycPGJaFtzIWIqFsKizdrmI9vNuY2ebnJycy7dG8Oau
	T0xZf9W/ByuHlQ4IPbnBbH1/BLFRoLRQoTB92g4FvD54Yk6OZBAPeN3b6WmGmNHWRxjyykA=
X-Google-Smtp-Source: AGHT+IFN3njHf4zlSvRJy82iqOt9EgBaVK0pDLpNl3FfM/NqTtRAx0hFLhBw6GAH1TXoonBsNWdlBA==
X-Received: by 2002:a05:6402:2550:b0:5d0:bf4a:3dfe with SMTP id 4fb4d7f45d1cf-5d3be7f01e6mr14645479a12.23.1733823975128;
        Tue, 10 Dec 2024 01:46:15 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:13 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 02/13] netfilter: bridge: Add conntrack double vlan and pppoe
Date: Tue, 10 Dec 2024 10:44:50 +0100
Message-ID: <20241210094501.3069-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014617_217153_12E581EC 
X-CRM114-Status: GOOD (  13.68  )
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


