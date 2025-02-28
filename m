Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA71C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=; b=gOUR/rcmwx9uFDS5ybjgY7pBT8
	jCZNBSc4A3fhaIEYoI80AIUPWr065TAs5zRSKguM7VUcgB5tCKBG7qyHCHNZ7f+wz6rfEdIOrrDpE
	adDX+PcDOwznVhyhZIreiIsy3YA/OtD8oKAyfVgbCiX/D6hxATZzlR2xzqe9LBmgohqvOlbUE7aZG
	rI4wJl/BMtcefBJWp+iS8qBDxm5IorrdFy2hArzC0ozQUxzhCBsOHGA2kfoWvNxSOmtk2P6Mi8J2U
	irsL0dkjdVjBmkvb6F6dPj9jlg6vgbHrrIxfr5MljIcqRRFshhdHplnp0x8YrTWw/6qSs1LTpMu8w
	oubtZNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to73O-0000000CcZs-3tIs;
	Fri, 28 Feb 2025 20:33:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mc-0000000CYLy-3iTJ;
	Fri, 28 Feb 2025 20:16:32 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso392493166b.2;
        Fri, 28 Feb 2025 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773789; x=1741378589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=c8yXZPzYRMBjb7XXciFZwkSekdfFMYLIm07Ku0jdd97QII1JHuc+Eiw5/8zUFfen8o
         4mvFMCPgfD4BA573lZEJTfMPydp/IfER5iKKQjcQKw5TRix9OHO7f1MnSxGXTFiqiju2
         fCqGh7UbvIEjuBbooakwnIyh8b1YucJOlLY5MTWkJpej/xfJEy0/P3Wk4h7lAJbAN01e
         C3ypLw6c+Y0A6lBLglBBdtY3R9O1yfmHoyZtGB65rVsUg0qxdHZN6DTBIf6G5HwyBqqh
         vNOGS3wXPwD2zuyq/7J3bvk/ZUAcvmyE7cMKaj+38FbeJXNWpZk9fd/Hx7RVXT19FZ5f
         iVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773789; x=1741378589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=L+8rAzeYL45k6JbUduhjTlCQnxukaBifL9N+xXG1pl2gIS2L4V/V0nm1UrgzvkIsVa
         E8Wtm/svbrPfmoiOJbp3+yEH9oZLCOeUg+O3KP8axpFKtwVadJ+i0K82dfzA9Wicki/Y
         EPC4nh7anauLdDx07zT3MEV9K3ZZDOCmh+gBqtlAvxjis5B5B5bAW9awkcR3iySvEM8B
         +4VQjT9eTf97PGNj5esGT0jVGsgU6mJFXLrHVZ1jNN7VY8f6VmecuJkPB4NJsk+P2Zk3
         V2ZWXBrToMwku6jYZmXTcpvM8zzm76oRQ/gU1JyYL0qdwfNHw7fMmAss2m2Qugfqy0o/
         SXYA==
X-Forwarded-Encrypted: i=1; AJvYcCUNjJck1ymDUi81T1yms69c0MUigAn48X0kBW4v8HHzR75iS2nLOYuqZ5b+hyzoXeXnfxySyTZ94H1vJM6vo7bk@lists.infradead.org, AJvYcCWglyYnEPobFlk9OlzTsf61WL04pOoVmLWbadAnvzXXx4lT0auvwlAD5rfZMsqUZioR6nzsfIe4MwJetauLGGo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmOLOFGuLo0VO3SBfDUIXdpNtXcM4iNJp3s9fgcOb6WvdSbPEH
	Wnt2rnl/MWpBk3EnzrGR3Oxhgz2j8kncfJdXannRFIgNZRjzkbHI
X-Gm-Gg: ASbGncuK84qYqW/x7s4gSGS45ljfji5bh0RNQlFybov5twsgzkjem9IjpX97Ur6EJI7
	/q5abbXh8Ih8/do4+lCOpv7lRlpUsOwU2n8XesOnhcPZlx24LvRinzXpajA7NHQZ3exYE0D69BY
	sIcZHBx3dcw/4+uzZZNWEmBIp3v2b/VKiOJ13PyvgKujZ+CJfySxHsCRqgw0j1vK6EF6xiY6Obm
	9lNPWg+r7QKtyf8uZKempNsdOFMgJCQbwKqepD/QduH9zORsdNCq3SPCEpkC5ggGjNSn6Ol6z3S
	fBwHKpbvBvAweg0pWyqVa/pJYaCHBWR8ITEq2mKsSOfDmmeZtv/rLvyUs3pS+WLaWe/PqmE1TTh
	V6SZDPT4Mp8t0eVGGMU8qImzGlLOKC4mcimBy8IlRqO6vj5mXbg0dCHm9QudR5Q==
X-Google-Smtp-Source: AGHT+IEQAXatFYtUv180Nd/vAAtHbNFD7uOybxHOrydax27b/c3kzdKVO8+x7rEp/205E7ETT5lLSg==
X-Received: by 2002:a17:907:9620:b0:abe:f8c0:c1ab with SMTP id a640c23a62f3a-abf265d3be4mr498901466b.46.1740773789267;
        Fri, 28 Feb 2025 12:16:29 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:28 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
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
	Ahmed Zaki <ahmed.zaki@intel.com>,
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
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v8 net-next 09/15] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Fri, 28 Feb 2025 21:15:27 +0100
Message-ID: <20250228201533.23836-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121630_922256_AE62F9F6 
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

This will allow a flowtable to be added to the nft bridge family.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
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


