Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD50E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKIHos904u/55jjyV61JBBioSUFkR0jZBzN6/oqpIaY=; b=Cu7g5Hayzjl5C/WaPzHaGP6bRf
	BNBLz1sW2lBSe23a0SFQmQFh2snpObbbVTN6X6ftFHMJwhkCeoirB8w2VAeg/TiPKfMdOMq3IxYBw
	0ZQAQsOSEazLv+irZfGjgQdZoB5Fx/m9/HXIwpA3b+IM/AVZ1DttH0Um9xqRhc5ebCaVhW60BCbIM
	WYHK6Tp5kSxnZl7FiI0BWC+WJOPgSguwOFrYH+UpFhmitSWzgpQXAklEH/fWqrwh/MEvIO7+SUN7z
	954POv3DyFXH8r9zz4LcbCIQyvjsWv4ACdT5nLBkBCSndBvU8otpY6mPGIcgf6zi9HUe3J4h2bq/6
	oZ/932xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwsy-0000000B0SZ-1XM3;
	Tue, 10 Dec 2024 09:50:32 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwos-0000000AzEZ-22U9;
	Tue, 10 Dec 2024 09:46:20 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d2726c0d45so8124183a12.2;
        Tue, 10 Dec 2024 01:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823977; x=1734428777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKIHos904u/55jjyV61JBBioSUFkR0jZBzN6/oqpIaY=;
        b=iX/0AwL+L7AmlEx8uFT2x9JPlo2rvHSToTVZUWU03mHngRofKA+5hgM5xdrwES6kS7
         0bYuG6SamfCNwjf9DY5Lv3sM6lAMr0U0alil+Ox4DKgPHb1GmL/0NnyX86PYa4wEOUhT
         yMoVywKAi4nu1UeN7AkYAuxz9yi3kdRUxoqtU3CymhHcA4ul2WuassqZ+T//i4JFbZmJ
         4bgA7+cq5gyQv7BhAOI7ex6TinYnOTOhbsUZbiWpYlMlb2YKxrhLF0fA4hCnjRJMV0RF
         LIGzgmyLRBZYvC3ika2/VFXUTkLX6MzSbw3hfNdTWCIOtgZcef0iRoL6xyLVx8uqeRrs
         /Dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823977; x=1734428777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKIHos904u/55jjyV61JBBioSUFkR0jZBzN6/oqpIaY=;
        b=P73M5K2NdsDw4i5liq2IDiw29wMrLHdTpC6fvae4Mg6asHRMZpO4WpAjmcYnlaC9ok
         k0WgXtNSyfaKCsT+1Xh9l0jiodaEoxxCx/1t5RJBpfFLZAXU2nAKh/D1iOLFSCN72Aas
         GyptfHoHFVMYLh0HBsy4ZChsksM/DbEhdNet+eWZbkdaV0mxoWFIF5EMizdlcGJuvqCI
         zEV7l0p7vfxYXhvVaduZYtA/z+WQv6OJvrnEYyd6T0WSxgfBE2rduElC4zNSbigQuPeR
         GVluSovCzMhy7a5eBsWgYPPtHKB6F2eG5qWhLrthuPuLgb5zqW15M5UalVLcmCzghodD
         y/jA==
X-Forwarded-Encrypted: i=1; AJvYcCW+OMqG9XBfplZBoK55IQ8/0wKGoSHGyPj2hRbta6FW6ldEGWIh7GnAgguJ4Rvdh+nNtzVX5ByeQ1zVqn7hMTo=@lists.infradead.org, AJvYcCWherCsdgYO04P8hwAh7r/8mMZ5nQPMvdr9TSEjpM02SaQ4+0HKl188nNTgWM4nRv3JSSjKr+Ato6H8vbnKqAv9@lists.infradead.org
X-Gm-Message-State: AOJu0YzOd9RXocI2zZEikC3yy5KQzKSEPQC3lmu54lXoIEEinuuOxuYT
	9GE+vuL40zQQBjHua+lzm+mDIYK/otyYJTD8BXtkOtt61EVTAFKQ
X-Gm-Gg: ASbGncsTT9nem8qKfKy6HAh6GnK2X4zmRBnvR4zHfjire3aJ3q79HZR4vValcbO7kWP
	CI1TIEDpy+rfCNtZlQSQt5ClEpI1rCHMiYqM4Pj5CF/oPOUCKaz88mynUWosIZqfQYUY1B894K2
	08r4aRr5DTto2zsMJwOYqj45PAkbPDExrQBr6E7oM+HXgxXrmnWoRPUJbpZKR1Yna6iObbts9xk
	ExxPWjnMhARMmR8zA7OQKaIHn0Kx/mZTrgG2Y132D9oo6EV6si5KyPPvwDw3hiaqq2IQuezvHuZ
	HbLJ6uvM6NyaNqM6je6gUtYeFIBWctJW0J60/Owii3cbG4V9M7pO5ukk9g08CgpL+O839Ng=
X-Google-Smtp-Source: AGHT+IEEUrkGtJfTGOQCwFkl/sxLKxNiujiQKGJAvLJ8Ua0u8uaifo2lDidZZxTSL8EGmSiw468ajg==
X-Received: by 2002:a05:6402:13d1:b0:5d3:cd5b:64da with SMTP id 4fb4d7f45d1cf-5d4185f81d8mr3897445a12.23.1733823976507;
        Tue, 10 Dec 2024 01:46:16 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:16 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 03/13] netfilter: nft_chain_filter: Add bridge double vlan and pppoe
Date: Tue, 10 Dec 2024 10:44:51 +0100
Message-ID: <20241210094501.3069-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014618_670094_C0D0C0CA 
X-CRM114-Status: GOOD (  11.91  )
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
2.47.1


