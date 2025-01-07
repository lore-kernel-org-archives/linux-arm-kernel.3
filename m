Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC44E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=; b=AMmzycLJLBlBCl1beTWdBkIIh6
	hEB1CUUcgNes4zFAgQbVYXHzuoR6EXwmdxEfJKjm8bWlm5wZzKkFwk8ReQM2vRBAXGLK/CHGRTtRY
	VyX60U61MGkqhh9+Csy25t1CQYEKoJRgomNR8yMfozzGGSIZn9tM59xp2Dzg5WSwH7UkoPCe63hld
	8Vuh3GLWqgLqCe2aaR4BsEoOMVlPZcBcE4hlfVpnKCy7Rr8Yn9FTM+eEZ9eE0ht1VhXpOu63xyOWr
	c+SKK3MMYCtDcFi2pW8aFRsaCCJGq+75v47mArClWZqVbE0ZcaZ17EXKub57/ciSKmuaMaQ0hmKZn
	lQrVQKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5gf-000000044p1-2gFu;
	Tue, 07 Jan 2025 09:15:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XR-000000042Zg-49l2;
	Tue, 07 Jan 2025 09:06:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so27119005a12.0;
        Tue, 07 Jan 2025 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240772; x=1736845572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=;
        b=JXNJ1Pnyhlhh+B22TMjdaM/c1mVt/5MIWTNxNjU9LaH0vcScLeSCHVsb2X4y3Bt/pm
         jeNE8N3fR2qjtJBY6xxSFbJLcRFhKEzWchVVtbUk7VDYe2+uGhh5ikWuh4D5qpSfvKCL
         J+g/ta94dMpTvBP5QzZtbqpGKg8g+oTS7N227TA+2O6Duzhr86N45MMqcQ81spkGrtyn
         VcnJbw+Ugq9p1pERrBMCagZEw/wEPfkhdrc6EYOxS9i+kRiPwYwzg/MC0T0MSCBChBiK
         sMPl+wsIIiPAJ9AIsKrRMFq5lld/Ps8WVt2xKWwxKmtKCQF2hVrpm8iMzSEECrC75Tea
         BC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240772; x=1736845572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=;
        b=UCh0Vs8oTeMPOUVtExhn1YM0QeZ7MZpco8vKweFi3uAp3/Ha4IxMzyaBAXAequUdzE
         zThtcnuaa+0kg1apd54eA8kYxjJsstsy+d3DyTELvvwSR5vW3B2JVO8gGP/2FFGvl6nL
         hElgZB/Sw/rCcEf6mC/U3KQGxKRc0aoAUi4YFJ5KiOuozB9+0Y3WsBPtMnjhhUxYBQNi
         29I8lyayV9oQWr4cqCwX2iNjYdcsQ358VDrcRHEu0Wlb8bte1HYAskpk3TatBkY5EWCl
         WbZxVBbyhkc9LMPIrgZIm5R/ANpZRMHEF4qqX5pXS/PFOYZXY8zxSR9QQ2SFGCaHgF9Z
         dV1w==
X-Forwarded-Encrypted: i=1; AJvYcCU6NXeeIBQ8lg1lKCsJygIAiHeOgTb3fPSHbV8a/vIczXppFtV2lQoiWzvOO+OjcAZ9QLwLXM4/CYC9jhTQNq9U@lists.infradead.org, AJvYcCVzkhK7n5FhCQbUkG7pq7PqpvfGX0EU/HTjPU4PKnYRXiah/CmZXY4T9FBli8SVRufdb3mF+0P88Mpl4eb5fcM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWdPYW4B+unwPdrj5xXgveJc5AQ1vHrTqE+uCZg4Zzl/Dkf3yi
	FPVZ2pDEKeAd+AjYc4CPPDqHFQwOHQaL6t0KaQN+38x+S1DaNAt2
X-Gm-Gg: ASbGncv/lVDq8le1YnXnOsSXoGCGTRQbR6lH18HXe1H/JaFKEbOZGAV6d7EH6BFfsaI
	O6KsZh70FsE+8ZfoTQb4m8nAkUq/2Rsx5GMO38hnOhAvQzE2kT4rxKbo/uEXoO+h3AIljhAt1hk
	r28sTQIGaa/Azx+0rLPHqdrm2lZ2dnOzT2QXMKQjHcYLRyuzyRQtrQqZVw5BGDgBuWeFpHi4zQ8
	2NZ8RP/QfZmDb22wEZJJNunisCUE5vmNn31uvlUUnf0nv37EQt+Zyl4zr/4CyCmKkZQeFB63DXl
	z3Lfjyo0+/HiTQkalQiG9zFugChgWajWc6rR55UMY+Y+ffzmsQwoYVE1kCRrb5kSW8Yi/0/ovw=
	=
X-Google-Smtp-Source: AGHT+IHcdg7P37o5nMvJ75yJzAoKxUItlEfQvHhKvQ23cSiQG4/81rp2XgnxG7pSjApH8tUEJOEr7g==
X-Received: by 2002:a05:6402:35c7:b0:5d2:728f:d5f8 with SMTP id 4fb4d7f45d1cf-5d81de16998mr67591761a12.27.1736240771891;
        Tue, 07 Jan 2025 01:06:11 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:11 -0800 (PST)
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
Subject: [PATCH v4 net-next 07/13] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Tue,  7 Jan 2025 10:05:24 +0100
Message-ID: <20250107090530.5035-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010614_027085_FB42868C 
X-CRM114-Status: GOOD (  12.30  )
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

This will allow a flowtable to be added to the nft bridge family.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nf_flow_table_inet.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_inet.c b/net/netfilter/nf_flow_table_inet.c
index b0f199171932..80b238196f29 100644
--- a/net/netfilter/nf_flow_table_inet.c
+++ b/net/netfilter/nf_flow_table_inet.c
@@ -65,6 +65,16 @@ static int nf_flow_rule_route_inet(struct net *net,
 	return err;
 }
 
+static struct nf_flowtable_type flowtable_bridge = {
+	.family		= NFPROTO_BRIDGE,
+	.init		= nf_flow_table_init,
+	.setup		= nf_flow_table_offload_setup,
+	.action		= nf_flow_rule_bridge,
+	.free		= nf_flow_table_free,
+	.hook		= nf_flow_offload_inet_hook,
+	.owner		= THIS_MODULE,
+};
+
 static struct nf_flowtable_type flowtable_inet = {
 	.family		= NFPROTO_INET,
 	.init		= nf_flow_table_init,
@@ -97,6 +107,7 @@ static struct nf_flowtable_type flowtable_ipv6 = {
 
 static int __init nf_flow_inet_module_init(void)
 {
+	nft_register_flowtable_type(&flowtable_bridge);
 	nft_register_flowtable_type(&flowtable_ipv4);
 	nft_register_flowtable_type(&flowtable_ipv6);
 	nft_register_flowtable_type(&flowtable_inet);
@@ -109,6 +120,7 @@ static void __exit nf_flow_inet_module_exit(void)
 	nft_unregister_flowtable_type(&flowtable_inet);
 	nft_unregister_flowtable_type(&flowtable_ipv6);
 	nft_unregister_flowtable_type(&flowtable_ipv4);
+	nft_unregister_flowtable_type(&flowtable_bridge);
 }
 
 module_init(nf_flow_inet_module_init);
@@ -118,5 +130,6 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Pablo Neira Ayuso <pablo@netfilter.org>");
 MODULE_ALIAS_NF_FLOWTABLE(AF_INET);
 MODULE_ALIAS_NF_FLOWTABLE(AF_INET6);
+MODULE_ALIAS_NF_FLOWTABLE(AF_BRIDGE);
 MODULE_ALIAS_NF_FLOWTABLE(1); /* NFPROTO_INET */
 MODULE_DESCRIPTION("Netfilter flow table mixed IPv4/IPv6 module");
-- 
2.47.1


