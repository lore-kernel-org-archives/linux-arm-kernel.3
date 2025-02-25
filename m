Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=; b=jvGWQR8g6lQQtRnafhAUvNoomy
	MV4ucmTTmroGRi23q1ig++vs83IxFqPnAgEGotMxNXBx0Il3oQVUOnCHdbDeX6qQQJ0hQZBwPrFc6
	4W0px68dS7/2U09bKKlF6LmEprGVROkxB2cIEtI0wyeMFDtAR0912eYx+CKk8lDomKFHcSf2r4JO2
	wtuJGVxiSI+BJTQF9pqd4mOEBDZ1KXgBcIVFnZ0YYRAlOyu7B/rA2WSoaAJE/p3wraGf2cdtEwaKS
	Uf9u8kz2FDkgnLo04WhMYqWE7vfsulxoUf2I1IvX4XcqDR3/g5Z5fnHE6B8NqcqkyZDKS8k237Dw0
	HjACuDSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1wa-00000001RVo-2ovA;
	Tue, 25 Feb 2025 20:54:20 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M3-00000001Kf3-0ivb;
	Tue, 25 Feb 2025 20:16:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aaec111762bso407725166b.2;
        Tue, 25 Feb 2025 12:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514594; x=1741119394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=EjGJd/JMGyYrKQ58H0RcjEBiZ8ZII48zJww5m3tKNWvZ2qlZu/Kjtkq/i/He8G3MuI
         r27NU6pOje2OIZk1BfhoGt2MMYg+7I46ODJw9/HGo5Tzz15FiCCqJk/64DwGcHtCK52H
         AKnNRetFg16ZmsJzZCn34e/mE0QXVntGnBKHjXa8qNp4C8Mwh8kpy+ElYOWi4PMeJKSb
         FbrzH9ysX/H428QTnRx55D5xsA2O68Cb5a+91J5XOb69/sPAaaM8U0UxYPewKOAJAdMA
         F785WJBtlTop9I/B2KEha7WXYaMrqVWyYLsc4BFh+ngg3uAJy4R81B+ZvaE9aIYT7aBG
         hwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514594; x=1741119394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MAJ1+kbz8lZ4YwPg+OV3VOfAm0Jd01XhEIX1QeYwh3U=;
        b=Q7puNcvOpW0OaUHyHnAVDmZFrQSujUs3Z4ftUPnTewMMOYrTaNCzsUtXXA7Sni476h
         bJRyo1gFvBIunt7HDQ5ZpuFUoJN4mqlwU1HoYrPqsNs0JGVUzhIVnTG+Tm2ZcclU2dlH
         IaBfUyZ2WEGfd74qqqppAD/0NK/tKJbViLeOhx6NtMTt7Yo9xEjZ5l09Bb9lIzr/6iBZ
         78lo7ZSc4LNG3CDnMWrNcWr2gU/czvtUdSojk+XaxOj5Ncs7VSNlCvP8NZ6pyuU4hlc0
         Ju6W9k6LdJKrXjFCtk9zQemCtAUQVk2JZDip7jnhWp63BwB8LsYgPYfYMCACWvOEVxNF
         E+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPFJazfcxhhb/CNuBPeZ2Yqq4F8+7ZKzhgMp6cRpLB3K0RgyEz2BCQ56hhXMJQXZ0+v+JMooV2xzJxg4Vcp6s=@lists.infradead.org, AJvYcCVwKmx3L6q1EUQrSGto8i0dOAYsL/GNQImwy6NqJ78ntgnYMIEFXcBx3xbeBIwlussxrZ4SXZQtHY+GC0oB+UHR@lists.infradead.org
X-Gm-Message-State: AOJu0YyUv+oNL2SEC5Tdi/0XOviYObCEMV5YevVP9rdHWHIBzUbuhXQa
	fcdT+0VxsOpxmvV1wZn5Y/powfznJYGn7awii/Zg+aj+ttepmTUx
X-Gm-Gg: ASbGncuxVZ36ykYVfxAJSzS/BSuXU69n0ymVDySLo5O2kJFhbxg7DuWdY5yUifgnUU+
	OshPjVSOMFUHmdJgEhQQp3bye9b8xc6ewqS6VfULHYIBSYb7kjDA28r0emWPkfjAxYMd15bxr9Y
	tlzY8TqcfiR2LswrqoOIvqXlvsF/0Wje3S6L6wSsPN2nVixO4SdXrkmJmUmX2oyOmkbEhjKrDYh
	ZRdl53wvNt/pc+dmmHZ+0Jjbe0OsMBInzzm23/ozkBQIzwtu71bHIyUENZuP4OdnKsyBXwWCz73
	iO2QlWYdlrHnEQk5DcOipfNHSIS0PrpEUXY83+JxG8CxTttOaJzeT6t0c+1WwqwrOJv2cr0s+Ss
	9wEis779JSRuU0ZDHW4RU/PUXrr9uBY0OFJPcEhKgK1k=
X-Google-Smtp-Source: AGHT+IEwV1DfGXJRPjYjfUai9IFb7gVR/sM912MZVVj4qwykjTK4A5haj0vlM9CKbuHOZqsSxaDDSQ==
X-Received: by 2002:a17:906:3181:b0:abe:ea93:2ca3 with SMTP id a640c23a62f3a-abeeedfd836mr54526066b.29.1740514593664;
        Tue, 25 Feb 2025 12:16:33 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:33 -0800 (PST)
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
Subject: [PATCH v7 net-next 07/14] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Tue, 25 Feb 2025 21:16:09 +0100
Message-ID: <20250225201616.21114-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121635_220264_5E8619B7 
X-CRM114-Status: GOOD (  10.77  )
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

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h |  3 +++
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 4ab32fb61865..a7f5d6166088 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -340,6 +340,9 @@ void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
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
index d8f7bfd60ac6..3cc30ebfa6ff 100644
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
2.47.1


