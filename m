Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ED2D60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi0AlNa47OjnLX+zdNkH8pnYspHiUC9rPn7VlkLtCao=; b=wcZo5TIAU74WamLh7qjCU1cHsq
	CKgiKPS60U53j39nlBdYUYyNrhn8hHLO540/bHHWjOfJzI6voHVFoXfB9ePBb+kaLXAsqvAyDXd/F
	NU8WlOIwRRg8DI1C5oUeVAvRgNtV58Z16htngYh8KLsMu5tLS0V15O/h5qEurtqEuPWoOSy3hUjRH
	ix7ExIULYSb7puBz81mMTq2lLsCM4U8qaTpUa8T8XjiSSc1ZMZeVIKvK9RARvNnDj2CouLTu6W3Su
	GaoVG2PHBW3xPTpABMr/5nkdogqvIjjEMOIjRE0AhFutkKPuGPVv750BS9N3KRuwpkOB4Q/jov0KL
	RqKKKaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLO1-0000000C20a-3aS3;
	Tue, 19 Nov 2024 10:23:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKO-0000000C0zD-3uP1;
	Tue, 19 Nov 2024 10:19:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso95606666b.3;
        Tue, 19 Nov 2024 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011563; x=1732616363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi0AlNa47OjnLX+zdNkH8pnYspHiUC9rPn7VlkLtCao=;
        b=Cy1SpyIeakMgCjk0zw0pqV7l8VL25SV8YGgknn0vV2D4YaHpEl+osgiCdeZ5vTGbgH
         HnqRzEER0U5plJj7NmOYoHvvWjeJLkkqKjcEck2p4FbINYlVEQqTUYBCkmAmb0fQ48Kg
         d/0q/NYzZY9GrERIBB+d6PtpcnLzdhRGimJ2ur1YaO9bX6zXRV5cuoeySISaMDK4N3bx
         csu88t2Wqi9hMVamuvUkDA09kVhBJ1F571qo2RfA4rNoYRiupVkgDEO6cqbpicNwB4Rz
         SsWrOkN1jb+f6RNtDw2fT0P3tUfUNEE5+vP78Dna2yP+r0DNNDsmU/ZrbCpM58F9so1o
         d65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011563; x=1732616363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi0AlNa47OjnLX+zdNkH8pnYspHiUC9rPn7VlkLtCao=;
        b=fag1KYo6x2BwyBykUFyBdkLatx6idSTwHMTjWUarDBjHhJfwfKCb8CdZA/GHrlmYf7
         MN7yo8YPyYctABJv+GkF87M5G2T0FQUfIk7eH0Xw8gc5SHWWbJwqH2y70QH+fyNQBp7w
         GOKXTNL1zzA+Yg8ACePyxZWhGfc4uighR5ROmx/z6XVuiqweC771eDQLvkAVPqAtMHhx
         LrOf0AD8abcxBwinR0J1bIMIyvRHlS1SrF4buAuMShaOtBKZQ0VTfWeOO7npqtE7UmHh
         hZvFlgNPjJAWXX4JjoOF8HpELMm1WAVj3YyKAuDHjO/JBR0JfBISWAyTda77ADkigFmZ
         tOBg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZqmBIs3xfCrt6uDbFjkMGhzy2JjeXgeqK47CYO0Pqp/8STTpQG2O77yjRqKzW/khs7Io5gIpVNE/VESmScHU@lists.infradead.org, AJvYcCVqeh6sc0OeSIb2yvJgJJEdVgkwNRpHghUi0K8uxMzjdFqWjHx4Zw+59QiQHvTUUJDxK3GF4Qo5vZVZ9HT6PtY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXPMkocfjUlyXsuJO6I9swoi69fFf8q8iuE8Dp+o94GpDEYE5J
	ky7d/7ZQm9Qm84/A9TdeWFBQfVo/CCtfdaXEjFO8r6AZsOLUtOyn
X-Google-Smtp-Source: AGHT+IFgtvvx9QxVfYb+i/eHHWDw6v24GqRwyxuBvltZN8tRLFnZjBJN+NHnVp7SFNVLDR7NZlEVpg==
X-Received: by 2002:a17:907:96ab:b0:a99:ec3c:15cd with SMTP id a640c23a62f3a-aa483552e2amr1511647266b.54.1732011562657;
        Tue, 19 Nov 2024 02:19:22 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:22 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 03/14] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Tue, 19 Nov 2024 11:18:55 +0100
Message-ID: <20241119101906.862680-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021925_013189_0C1B8F71 
X-CRM114-Status: GOOD (  12.72  )
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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_chain_filter.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_chain_filter.c b/net/netfilter/nft_chain_filter.c
index 7010541fcca6..91aa3fa43d31 100644
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
2.45.2


