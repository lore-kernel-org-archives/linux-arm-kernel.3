Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355F4E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=; b=w/CnUdvxcW9lRNt/xHOrVHpFQI
	Ud8yufDwqtq3m/Ln8/2WZQpi+4+bchbmriNS9c9p20QTWVWHEX8IlqLwMDVVCjLkAEjqp9VnA75bC
	2Qjpn9XoKX5gFT4B49wpG2x9MSOIZ+nxq/qO6TcjZkKgAPlka1CPyrD+2MfO/TXndGS1FtedGudc9
	mMoUvUrOVIwB5QsyPXOyxSXFwdtkE+bicgFnpSPtUtntoYaVPzJjU4oii0VaSoGuLj14eU4hp/5lv
	gVv70eNuYd4P7zE9jCE37731MM9m9NOyhJ7smor+w8IVdtrWKSNH+w9mX3F2rxNLRE8Hw/JNVG38/
	3+0m+fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwx5-0000000B1ZA-1Pkz;
	Tue, 10 Dec 2024 09:54:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwoz-0000000AzHE-1J9I;
	Tue, 10 Dec 2024 09:46:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so6017544a12.3;
        Tue, 10 Dec 2024 01:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823983; x=1734428783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=;
        b=FodVs6rvXOP+tFTAfpRHG+SsLc5mmxTZ4oeOkjeyj5cmpzDO2XqlacBGAm6FzuQDll
         M/UYcCbrVoCMOgvn/450oUOcR8YZ7T+8F5nfnhxXBtvfaA/f1RpIjk5bFTQsHoxtSBVa
         1suoksiQtUcBRdhBnsMpMnEBuv/oIBt5duKp1aORtpiXXWvUs+ZPFZgvn/hXh4goX4Ux
         a9jw2EzelLIquA/dOMNa6eSRJeSjeEo6eP9dHuwzJXJ+ta6yqh3gfHZMp2mSH7ueYe8o
         oKW+pg97e7nSNp65JZIy8ZIEpX+LrhTLAS+WJpLmPzqJShhW+CEZZKLoOWFpIhGEPaSO
         AnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823983; x=1734428783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pk+qY6px5gG3FxqwFvW1Op3xt7LAoxtK3/4BHj1Cflg=;
        b=qGK2tnlhC+JDBCHWyUNdDbkOBK8aFqmV0aKlyUilRGIHhJ2lOGq9rwiq/BbIRHbipl
         K5O8rIMZav2YrdXDumZ6Hei6DM/R3fRM8Tt/2w7SC6OCzKuUW7o95XC1wnnHTIewQcun
         EbhEtYNR3hkQK09OmNRH3oYlQA2xIOpLXEYfCOiA87F2Bx5Tv6E8zVVb0Y6aIJy+55XR
         D7m8g4WTvG6Xl4ec3G/HJJ99KPrXkwUU/rDrmfENqPFklo9chWwyyK8hau11pNEbk9Ny
         pteFoN/H8x66+aJD2lYgW7k0mBAfrjBB5ida8GgCVhyRpihuctMXcRUkSq4ylROtlxYg
         2y2w==
X-Forwarded-Encrypted: i=1; AJvYcCUmYMgkZoG8YFSaZo/Nfr0iw+I679i8Z7QX9HwayFO97Lg1xFuSY2nAkDZzoNayP7muyDRFaR+K+oJODaS/9sjt@lists.infradead.org, AJvYcCV162cw9ZZeyvxWIxPuk0LTJhJkI/Vx9/oF/o2QaXNQRHLv2vG57LFxBx2/FMb7XM1qM9mRZiEij1FJROBiB+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXD1uGveRlHFer2tN77gnq3YgkNrs1vH0EpPF+yEdZVbQ1h5st
	na5poN4aerL75uIhZeoQWVNk7tA9DyBypT5yE4jjfkDuNrAc8oIp
X-Gm-Gg: ASbGncvk9vCGjieS+jxH6EdGyc5CR4RYBfw+lRo6Z8Zon95IPIuZX+2+8vNXoU+YXOE
	+90nYssFOX0b8ykT/cO5ZLlTwNGPIjp5nIgdjq6vQS2WY/ayoKWd3RnrvDoxi+zINwaL9ktbNwS
	mXrPhO1WG5tr9a61XI4F9+o1SgifuB+JD7Y4TkHp/4SzD+aujqVGwDOz1bORd8yXRi/q8+j9q3o
	HxV0B0yHNoo/50VzYOR1pNpvMgt8F2I70ZcODAjkjBg/CFbTh1XNGktgWG6/BnT39evJcUqMP1K
	ecqGYaYK3Hy7390em1NHUIiv1peYtoWuxabLlWnyyD/QENvIbwua6bpWXQHK9pXnR8BR4eQ=
X-Google-Smtp-Source: AGHT+IH4EN2bl4nM1hM4vW3lNE4AbT4jAUoKGNPh+jpctdHbiWVvzXPjIW3iNo8T8bSk3yNngjltIA==
X-Received: by 2002:a05:6402:3484:b0:5d1:2440:9b05 with SMTP id 4fb4d7f45d1cf-5d41862e405mr4691569a12.28.1733823983340;
        Tue, 10 Dec 2024 01:46:23 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:22 -0800 (PST)
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
Subject: [PATCH RFC v3 net-next 07/13] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Tue, 10 Dec 2024 10:44:55 +0100
Message-ID: <20241210094501.3069-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210094501.3069-1-ericwouds@gmail.com>
References: <20241210094501.3069-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014625_347736_936DF46B 
X-CRM114-Status: GOOD (  11.83  )
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


