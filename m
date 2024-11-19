Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1006DD60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6bOSx9F0JYNp5qomZcy7h/raSRvVGKNY4mEoIJa6U4=; b=X0LacN9sg7LRZx07B2yfzra1Tl
	9OMcvknHDU0/6snI18HjwzC6GVYLr7CAaHRlCzcSbkBzVSb0exe3kBk5tnKGsBLEvXY+yppVdY5ba
	laWWTcV0yYNE7DoGRkCOTEtePHgDuMdlDbJvkqRnSJr2vi38CZlHs/mL0akQDjAz9ZQTbbq/cGOwp
	2i3GCAs827hd+tw+VTquxXcjh2RQ35415gZzKpEWKFd91hkMyJfbiG0ioy5sqC5ilPk+2klwvyZ03
	iQxsFYumpY41TPgGhwEGAP3vXevqlb9IlooBTEJYskQMLwHgG6sgIo4XMx2avhPL0RKoLV81tzjq2
	jRD8uX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLSZ-0000000C3Hg-0PfT;
	Tue, 19 Nov 2024 10:27:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKV-0000000C12e-127B;
	Tue, 19 Nov 2024 10:19:32 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so784723a12.0;
        Tue, 19 Nov 2024 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011569; x=1732616369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6bOSx9F0JYNp5qomZcy7h/raSRvVGKNY4mEoIJa6U4=;
        b=OWTHLu4YCwa+ShepimCOa8eduFyiHYGbTw7zVmhvHLrT62bJUNzbUXEBgkHvXCXzqy
         8K7Ld/h1BizV2Ay+hHsEWsD2o17fCTUwTCm6/KmIlSg3xb7DKXxxkKWMRi7J7VofJB+l
         7aVB2hCUpesCy/5RDgGIZzcOBWA04tJfnsV7H/4udWl+MHhL2IdL0zq08xrXwAtcWdDP
         N9w/uoMeUSpLoYcURKqGLaxZJZmVN87J0xqCDfMRJ4yEwVOnBidT82Dy6ED7iKfUzR2W
         rVHCQVWXyXQ0GvjLaGsvBUYz18XoUoM8D7scDxd0FXQSbPzzf1t6kh5IgCB8mp93Hj3E
         oK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011569; x=1732616369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6bOSx9F0JYNp5qomZcy7h/raSRvVGKNY4mEoIJa6U4=;
        b=uCNIFjvuJMqoEJCy4apLIpruxZ898B7LswLwd1s3E5WUNy75qjHZqmKL+6vvXcGypI
         ioUNyUNGkAp3nYrbg/+szmNh9QN0TGGmp59lQ9poddlku/IcxS2wityplm4JEEpFqXKw
         dzvrkaNZpIgD8pnF05lSQRdwNLqe/XTLgC7v4T1aK63Q+WdZe8gqxQxjlt78dZQk4XPK
         CHylbNgebHaNh8wHjHzbgLOgJIFw/YtM8ZQhj2pRGYziMZZgaZiGzMJAG1VluOVlNLAW
         Z4A1mjTPuEcvO+RnAR1xZmZfWjRhdL6694JE9Jp6c8pBvso5i1HB/Nrf/eqREuwzeSwE
         MQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU88rozoJ6mwgjK9wfkoqPSBZTkBdmM9PDVhvx5bll3d64wnUtSw6vStJS/EDXU/0LUiL+dA5UckAg+3NxiB0Y=@lists.infradead.org, AJvYcCWavmLiFmaGHQ73eNkvpN+PyEscO1P6sHSFUjKq4gDLz+gVbIK83/Pa2ka4tC2ln2PDTj1WUSYzh123v+Vy0vf0@lists.infradead.org
X-Gm-Message-State: AOJu0YwYZLRTEoG7lHf/xOxSJ1Mn6R9/DnqzYkBOWSvPVbhJ5o/C7JMR
	QJ6OV/Lzr0ptXbAduwDQBOn9OTLwwchV5xCd/7Zpjv6O+jhkXtKJ
X-Google-Smtp-Source: AGHT+IG4oWs8UOYUh0SfCm6s9PZ7edWvV+3g/BCD/rQGn8EB4n9k2Znl8dCuVvZlTq+Io1pQtKbeBw==
X-Received: by 2002:a17:907:2682:b0:a99:fa01:2b72 with SMTP id a640c23a62f3a-aa483489f31mr1130230666b.33.1732011569157;
        Tue, 19 Nov 2024 02:19:29 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:28 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 08/14] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Tue, 19 Nov 2024 11:19:00 +0100
Message-ID: <20241119101906.862680-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021931_281026_CEB1F9D2 
X-CRM114-Status: GOOD (  12.65  )
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
2.45.2


