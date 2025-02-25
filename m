Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD71C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=; b=Xdt1iASI70DtbpcIhCgMkknIcC
	dDmsIOICL7zDJ/dG9+R5vGm1Ma3S8Vwx5pCUifPN7+Hajy6Xa0LpbTSqsTSs62f8DXG43kc7BgV3i
	a0GH3h4R9YZ7iAwS9rFichWdgw5QONUJmgW+PyXxn53cXsaUL+MtkK6TjEkc1VYAqffyOUeqYLmoy
	1sxLrRVlYUH/4BIdlXqD/OOGy5R0ofvlRV7QrtBQOAprXVZiHBbj2CfpRjKTo6bFcxNndO5kaW2+o
	iUxDJHE+Kte3nBewsw4K+27eEL2+hb/9SkfsqkDyeD/9BsKLNukHAiukVin/CajeR4P9iu6GqzX6W
	PvNh1/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1y5-00000001RkX-0RSu;
	Tue, 25 Feb 2025 20:55:53 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M4-00000001Kfk-2H14;
	Tue, 25 Feb 2025 20:16:37 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abba1b74586so882276666b.2;
        Tue, 25 Feb 2025 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514595; x=1741119395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=nc7qv9Pp5eNHjGqLE3quqUQkKFLHLLvkCQvbJ2avRb9SZoy148J91UOWoPQIa1cbJu
         h2020sKRVA0Af/4YDQ/LoaAOLceeKEOpZKVyHYgdkJPOVEnk4pibOJIT9YW7mCBb1IL7
         QvL8AH512ZYFG7jQA/g+Az32HsW1bu8JjdvGXFdSSssRLNf/laxkUQqoDXSmf3Yn/SuS
         tD4kx7R0366UZmBJ6C4CrqYv8r6WH/5PlKRjOeBBLo1DOhj4y+Ay0oWv1QUbrdOL156E
         v0BPad12ZEd9ZBXyvaTc7OOJja0ZtueoSsbpT+GyHxUElFtij4aID4gBKDzCIzN41nUG
         d3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514595; x=1741119395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=gdxEElFNhxHxZNn42hqWEK7h8kQ0AuwrCvO1IFLSwzPR/0d7gBtQeOYQj6lIZLuQiL
         6VX1zRigOde5qonv+CBqcJyHFfBzURZ7FEBpywb78LR9yR40RuU9nXp75EWs3s2jZ3YJ
         0HVGGi8Nhf916rpO9YHmQL16CeokTtuaDjhG3swMX90PtJ6C/OhCEPol8RunX0ISjNgZ
         XnVIc1ve2122YiQEWKHYwHRC4Iyk0Hb1Pr/7cQ5Xq04Je5mqWTkb+BrQejQLw0fyy/qN
         cG9NQuDo3AMZWfTIkVYBsmctAiDcoWDwMelpNyUy1D1d2DurxetWB91WT5nOrvMPphd4
         P59w==
X-Forwarded-Encrypted: i=1; AJvYcCWdiN6nW5YV1Qvm7NoMxvAeysvkdM228/GxDBiWIiWbKsrhKdBdj+WhbSJ8bWvVO/lYV/xhZm5jiz7eO30w3UND@lists.infradead.org, AJvYcCXHOC5piKnXsvlup2271+POPcjJwu+z3b8ql0IlG2Q06gimZUujVdsPxGMi7O4Gna/14tk1O6laH8yqbjtf/OM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmNs0MJZmj/nYguNM6GAzPbnh4gQbN3YlnXJzq9oJNGIcMpLU1
	3bgXStucvLFEAagPVerfRIkGhrQpepNO6A2oIKrziaa53iMxOhYX
X-Gm-Gg: ASbGncswWV/piwViE5E5jBuT8Og10Y+rA3tklJTKm4pOCxCGFGvX1fxqHqcQxBGHXNU
	LdV4ZFXZ0BEc/O0G7RNznQyMORoMv2HriRSTCuaX9E1xQ0NknWJigCjp8j3zWpu1s1GSqkgTqck
	vXI8Acxf8faTL/9cLDD4jVZpetbpdTzJn6QhTO/m6Wi9OUhlUZEIyMCUOmRNvAJ4CzC5cMHlK9t
	JMQ+36fyCAdepOcZJnhXtLk8insknogUOULBnW0z/KWf8wf5VJhKMRBaJyGdrrBIqAUmXMWgpcK
	3RrY+9/kmhf8tD62xceLkEPjlapDGP4pXEMHrB8tuFmLlMK0+GOCO/gdbWIjxWjh/q4KCV1Wtfj
	1IDPkKi1B1xjysC8UMo9Jd77W0jUWI/pmqRGF6n+CwjA=
X-Google-Smtp-Source: AGHT+IGqtwnhdQCtSmqLRlPPBdMfue3nuq7Am6Qo/bcDgts/ZRrpNQ6gtoEj1aOcPx9OCd4I+DxgEQ==
X-Received: by 2002:a17:907:1ca4:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-abed1076c86mr522915866b.50.1740514594765;
        Tue, 25 Feb 2025 12:16:34 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:34 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH v7 net-next 08/14] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Tue, 25 Feb 2025 21:16:10 +0100
Message-ID: <20250225201616.21114-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121636_578462_85C4BFC7 
X-CRM114-Status: GOOD (  12.23  )
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


