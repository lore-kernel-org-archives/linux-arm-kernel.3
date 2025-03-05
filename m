Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B764C28B21
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=; b=ZgJgrwvv2eIE89u/Br4QlHkVpU
	w/PbT7KmHODMk4A9W8ELzKXN8SsqgJQk/Dzp/Ah5JmBOTRYTrJ8ukFrENq48uJk93mNec3aMf15SZ
	n/idNa5RniSrcI5/cMolz9bMe0e8fHh3CjRGqjE9lPLRLuWeaoF12xCrDFf41JpFqXF/lnYAOIiVz
	5SV3Ls32Ga9pD0svBPku617CqtO/5AVdJ6NICUxntjNyewkZxJ3/jRc6RMZbSy8GJymvQegBrWiCF
	aGCYSJ5LXRHgYI2Ys3IKx6IZMfRWQtrjN3wl8V7BSp5asdRgSUmqc1ayqc3aC1HMFxIs3m+Be0ckH
	HIXgUKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnhy-00000007zSf-1uhp;
	Wed, 05 Mar 2025 12:18:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm12-00000007gTm-2PzZ;
	Wed, 05 Mar 2025 10:30:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaec111762bso1221726166b.2;
        Wed, 05 Mar 2025 02:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170615; x=1741775415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=faCcyBdykmJnZQX56xtRGrtkdYowMl8J0eN7fDOZOy51wdQga/aNMtcrJjrWgPPirw
         QAra1ZWtdn2uMyDFJUovE0CUszqfVhFLQNVN6CAhNErOCtRAjmOGJYN5SGTyOvFYNMyl
         thyuRS/e24/3Wv9G84/NIPFbkZF5K9/wKvqOomRKddsGo6IaRKo22BJk2kXvw9INK/cu
         zg9qGxs2G5B9ALUoAGLlRLgsZ/nX/wUCImGRDiy8nQbwQrY4Hs0jB00VZvmYJ1ZbHnxV
         e5fAwYr4aZ6K+M5aXJ2EH35+SDxxhJ5NZBamg1sjH0CC/wGZgsBSox0PtBgZ7rwwwCaA
         K7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170615; x=1741775415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/OfFtkDCpNUsNNnB4udxCcQxzWSEZIHYYoj3YjYWKw=;
        b=fbugmmgbDi2gv6Le5bVW83mEYCRZI/yrdEruJImr+J7SNwWWjx5hOPgPQUMNJWtsLk
         UNtYPcHRUBjzxwcUc3ko0ExUTh1f7xtF7Xjhh3/E24HX3gHCjffQJckyVhOTd9u7hYYS
         EjP7xox9mpIUbS+eBQ3yhlTI5ACI49Uj/d3Kx5KGaGzUyDZZCQXkhE6B6XSBFwRV8B5P
         QOz7IRDC9UWK98l0a8+7i8OHmEhEOIR1KRrmfk8gh6T5eRjpiZBOLEOzK+MASkCR8xH5
         wtkAeocQJ+DCr5FI74CoJpz5PN4zCfKWHbRHOt4JIgVo2IdTvm0GoyZYLDLthttA+qmD
         Uj6w==
X-Forwarded-Encrypted: i=1; AJvYcCVn6v37qDs07q7A3TmDGL5guO6rrUg6g4Hhw5DKcLa+lwKp91s3U0o2vFa9QV9pwv118aOGMPQ+Fpv1CG17iYw=@lists.infradead.org, AJvYcCVy18JRwUYvNz/egR/CoKy00Yx/WZ2s2J4sIG7hfnNLuOxP4ofS8lj9TyzENgx7iNNaxNQxVhgpLbEApqS9pRS9@lists.infradead.org
X-Gm-Message-State: AOJu0Yya7KNMtQtrfwKtQVpCfDH4gCePVfZlw+o3l2GmA4jmL+Gri2YC
	TEzHZ/UWfXTgItZlNo8/Xe5xNmn1fVGNxLKY94Ceet4wYtHdYHcl
X-Gm-Gg: ASbGncu8krKtKyXlT401QVhZ3+MsafoWEpo6adMSPnQ7rWqdPZdLy4lEaw/Z2mjHwSb
	v91dE1YllmvvgzWkSZSlfUiCIcwCLWtvlnQ3PWhj1T8kuiLa5YnTaMeeCxhMSiGTGKb8l5OlzkO
	9DNgdAZHg9lkCv5nv9Z2Ru+9achy2GofqWqGd+uvfH0zLDthOZYtIigYG6qGqICf2pW7Z6YdUJb
	5xazxGqupZw0ZaryMY5dTurdBmnXhuhvo5xLaHKWqymSyiGtTLsd7SMJwnB+Na2b/jsJmxSt4Dk
	RyVeFn0jl4NXSECuAQZCfSCvR35H4E5vAXRi+fMpQzfX35d2Klj/1MgiqR1mrcMb4J74l3Qo9Ax
	VtGpgKM44chavsn9OM3Jn4cEdGQTEdkAbg+t59xVQ5nO/MIuSZDcXyX8F3zM7JQ==
X-Google-Smtp-Source: AGHT+IE4FBEQwtKjza4fXvfpF7ocHLI/77Iaa2ed5/2y+GnUe2UR6+/DugyKaB64GhmbWBt7MA+dgw==
X-Received: by 2002:a17:907:9726:b0:ac1:da09:5d32 with SMTP id a640c23a62f3a-ac20d84621cmr283526366b.6.1741170614628;
        Wed, 05 Mar 2025 02:30:14 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:14 -0800 (PST)
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
Subject: [PATCH v9 nf 09/15] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Wed,  5 Mar 2025 11:29:43 +0100
Message-ID: <20250305102949.16370-10-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023016_612982_2DEEAC26 
X-CRM114-Status: GOOD (  12.07  )
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


