Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427FD60D1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdMZzUqlItAKYCipC8R7CKRW4bj0To7qOhyuRvVgeD0=; b=y9yHYBSZNWwTmeU/z/bUBlqnZN
	GPGy+Fz6AUlz/YlKs7sr+bAvoLRhhPugElyxx6zPHZ+Zl6OgpMl1OcI73xENalZMyLZSb9JIPtDW8
	hin+MKSwYOyDiSpKV77dyLHCs3+wOaWAgpfD+MdSiOAts/CNnO50Zl8hy+BPU6KtnpyIkHuqHUKcc
	Mengjqwl9a8M0rwW4wGHgc3S3K+toQP6gb7PazjvixHVxuzCkgizABxkKy6hzPkFozw+Vkhh/LLbB
	4ED1CJxjyGLfD+IPhrlNlh+8woM5dqocJHkXYqEojtSWLJYsX2cdE30UrVQmB4Ua7Pb6Rx3ZAqXl1
	UyXLZCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLRf-0000000C32b-0Zoy;
	Tue, 19 Nov 2024 10:26:55 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLKT-0000000C11x-2zee;
	Tue, 19 Nov 2024 10:19:30 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa1f73966a5so605799366b.2;
        Tue, 19 Nov 2024 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732011568; x=1732616368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdMZzUqlItAKYCipC8R7CKRW4bj0To7qOhyuRvVgeD0=;
        b=QSPLT6Q3zIXkTSkCDgc3fes1tSjHPJ2716LeTkj/D2MFDD8+WmW3n3rxnECjlpupue
         iBNwwTS9VRu3SuvZWeNVq6N81xJ1fOICgYNijX3vg1FrL7XTAeUP4+6/rBWVTcj7UvsW
         lgjYYnJ4JPbQfL09qtG+9LcmYjVt/mPonuKHiiRBnCkrpIv1xCFx32dVTYfcbGF7Vsus
         iqts1R+eJLchMHmhnW6gPnWRPRykSjePpVOgqM7ikVcAejewjEGHegDjKdeSXU3CoMUP
         J+I5W2h8hkKQZYXl5ACD7YjmR7lmYTMoUP6kb22IAFT+slQcaUnJ0YmtbATJyNy0nIpN
         84Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011568; x=1732616368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdMZzUqlItAKYCipC8R7CKRW4bj0To7qOhyuRvVgeD0=;
        b=W98wFW1ljennu+jptRxCZR67xDAV8YSUs7fcTMQNN+OzLtobJe/DwtM8UyM1AUsOXZ
         dPge6r0+6wzFEQDJQKxncPc+pppLioNG6srU2wEMyI5vKQnOZbYz+jGlqUcAKnzJVcgs
         oenXtFD01SMPGdFGpvrM5FzdqIKqsmsYPfaG7yI059B7fzgHPHxIPc77lsqSdn6BsN3g
         4M4L90EyGi/fMOnYRya6X48StmqhrBjkGwFSKFQUFD8VDtbAKmweHwAHoquEv6WS9rlZ
         FYWhpyStqOzLbRMoGdlVgup+yHVBJmeldN+O+GNhR3s1Y4RzHKGs+lBOl09vFeSUfMTI
         Q8ow==
X-Forwarded-Encrypted: i=1; AJvYcCUHicgO1zQASTmqNVjnOWqco7G0PiTY4mioqKJLU3qI+gLH1HPH/bZOiY7tV0F+5HicCsO10TjuKXKCCWDW7Eyk@lists.infradead.org, AJvYcCVJT6Xd8TYwGjdbJCoicYUmyxR6+IE2lhK4yYvH7iac5XCErkngoINXtqRbdVNWIbvRwzI0wjjkkTbnNEdeHaE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG8nB1MDMveXdb+jr/VRSn+ppi0pU9ShD07PtCGszP3Ut4x3kS
	Hq76E+SgKxmQgQFKPzjXYjk+a5T5LRv2a8l96FqiSA7G8XYhbX1o
X-Google-Smtp-Source: AGHT+IE5L4vgeqmlwvDR/7799c7w2L3XGWClbNm8n2h6VzOovB3/FqcYwFKbh7Ag4naigGnLrOKLJg==
X-Received: by 2002:a17:907:7f88:b0:a9a:7f84:93e3 with SMTP id a640c23a62f3a-aa48341a1c8mr1497903766b.14.1732011567950;
        Tue, 19 Nov 2024 02:19:27 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e081574sm634875566b.179.2024.11.19.02.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 02:19:27 -0800 (PST)
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
Subject: [PATCH RFC v2 net-next 07/14] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Tue, 19 Nov 2024 11:18:59 +0100
Message-ID: <20241119101906.862680-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241119101906.862680-1-ericwouds@gmail.com>
References: <20241119101906.862680-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_021929_748959_68208E2B 
X-CRM114-Status: GOOD (  11.19  )
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

Add nf_flow_rule_bridge().

It only calls the common rule and adds the redirect.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h |  3 +++
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index b63d53bb9dd6..568019a3898a 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -341,6 +341,9 @@ void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
 int nf_flow_table_offload_setup(struct nf_flowtable *flowtable,
 				struct net_device *dev,
 				enum flow_block_command cmd);
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule);
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule);
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index e06bc36f49fe..5543ce03a196 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -679,6 +679,19 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	return 0;
 }
 
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule)
+{
+	if (nf_flow_rule_route_common(net, flow, dir, flow_rule) < 0)
+		return -1;
+
+	flow_offload_redirect(net, flow, dir, flow_rule);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nf_flow_rule_bridge);
+
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule)
-- 
2.45.2


