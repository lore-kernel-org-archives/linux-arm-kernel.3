Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98A7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=; b=uPCl/bBozEOkfi4C4Sw+Rqu4M3
	w+8HGqaIGgKc/r/3xJQ714nY4AL0pbCi6zgR/6q0a7HbD+tbJlA8P5wajh6sJZH1CufAF9tRxMcBz
	0Q+ChMvyreh2J7SH03zZ7nFqr2zJ+iZjCO38cS3oBFR3z+wL9s0f9AzqY6pigdO44BPa/ceyP+q0L
	4/nYNd2t7u2zdz54sXXvyFrzctNm2S2HLvaG+E/fkjR9rE/0Cqz5OdkE4IOf6XYNoxmJFZV4h99io
	XWd0UG8xpzEjgGedbKHXKS1mTehcegElNRrUQcd3ieX5WBgJ4EEZvwZlgSTOTlMmdRHXEuk+cKZDt
	6B7kWp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1p6-00000001QaJ-2AkH;
	Tue, 25 Feb 2025 20:46:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1Ly-00000001Kca-0rCm;
	Tue, 25 Feb 2025 20:16:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-abb892fe379so911887766b.0;
        Tue, 25 Feb 2025 12:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514588; x=1741119388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=eT00FkwtOm3oNJ4/N70wso75wmv3upA/VqrKVSfZithoT9CC8Iv2y5etI5kilIStG3
         KABpx8o1Y6QsIb4wT4KwHLWqc4t8XhR14E2PJalljUtbRqioh9Us1Ql3GuDwAo6GrZ7W
         yqJp89vHImP8QnxYfU6g3wk+HkGJQPBOQnchuSZhO3TWcCqrq/XbSEK4LaOiRRgusSR5
         mXepIG0bVGm5b8EUsjMouiGXfRehVhNtRRskFk9D2ltV6nXCMaNq+9pFZ4Mnw9v/v4bQ
         CnI3+fHYfua5PgkVqoZ1ZuUM3qr46yM2jLytH/1mHTDBiQZZu6B6gWsXwstATUHPDDr/
         fvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514588; x=1741119388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=Natv0RXEghkGfDEWA6LNya2yxPFh61C60p1mIXYT9gO9b5XrP1r/rbYkWl1xXYkUX+
         7mm59iXYSgq/qSMIk+450pAHRwvr2V26hUF8Mx5nzhlh1c5Tx8LD8ui7PUAV1su2DZaT
         GpUYrIo7oBcx8uUlxLK09T27uInSlw8X7V4KMfJOKs8tYkSyAk12SBctI8watPwGOfu/
         ysADpLADeDTUN8spLYlaBj5L/zqkf1vEl0rQRZErO5c1H+i1dfL5+Q6dn94x9Ial5MYO
         D+qwJX/iaCjEUvHtRAHv/8J5qGudedtUoC49HLMvsTMEvxYypv1FwZL2ImdEFa9pYysE
         zHVw==
X-Forwarded-Encrypted: i=1; AJvYcCUzN3esBrujxlQUr42dHPXcwjB1FZbfvPTozpTeXzfXsx3gN/7TanODiM+5aVx/njNRFaq1U1p2jN3tVDGMYRY=@lists.infradead.org, AJvYcCVfacVtuiaTiDLn5mNkgAW0SJYlMqSQgTfhMv1ia1YBNd5e5krV1Q+PFEmMOnt0Lh6Qv/PCjcKYaPoYsXSbj5S3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv1WiqlwKPfsiAForUfn30Py3baEeCfswh+LMBMjjLMTWjSQwJ
	/3ruiqy4sRVPcAx6IW2/zNxkD4fq0MvIYivyWHl4IfW6FbnQ25l5
X-Gm-Gg: ASbGnctRgUGXIknHKiZJSCE0SDMwY6NsgR9kMI0W0ejUhrfxmOTHp2UsnLMgLSNGngA
	wou18s6CR5bqa2h/eV2X67dWNKhKvdGugmyyhTt7w6VbQbLmwYcIisoSX5TvbiKEsqXGhQmfDAJ
	s8exuGqwNS4fECBvCQj/AG3cLcAIJmrKUjsUYke4lDtL10qbVSqetfkQJV92c31eXq7fwoT1JMj
	bOco/Ef5tgDSRjsY35J51DHlDGDyrGeaQ+RF5XwHKuJGBDD073Aq/wYpnhYDZumf8qnPeyoGPEZ
	U23vxCUt/1KDUIMrWKuQuPtHtPVgbIG6xtcR+xvUEdB3InimKI+xVFoK/FxcHfB0UClwJp3rQm4
	jUg16zPke0pYj2ZBHMax5wXreFGc7winx7tFEy1njpb4=
X-Google-Smtp-Source: AGHT+IFi5xh5+qQVymlO946K7Lt3PSU8gs3AiUL8uPpi5lpGCGAduFw1hnHU+RygxLF/r/WZYXOsOg==
X-Received: by 2002:a05:6402:2812:b0:5df:25e8:26d2 with SMTP id 4fb4d7f45d1cf-5e444853ee3mr10719586a12.5.1740514588315;
        Tue, 25 Feb 2025 12:16:28 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:28 -0800 (PST)
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
Subject: [PATCH v7 net-next 02/14] netfilter: flow: remove hw_outdev, out.hw_ifindex and out.hw_ifidx
Date: Tue, 25 Feb 2025 21:16:04 +0100
Message-ID: <20250225201616.21114-3-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121630_243470_75023098 
X-CRM114-Status: GOOD (  15.27  )
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

Now always info->outdev == info->hw_outdev, so the netfilter code can be
further cleaned up by removing:
 * hw_outdev from struct nft_forward_info
 * out.hw_ifindex from struct nf_flow_route
 * out.hw_ifidx from struct flow_offload_tuple

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h | 2 --
 net/netfilter/nf_flow_table_core.c    | 1 -
 net/netfilter/nf_flow_table_offload.c | 2 +-
 net/netfilter/nft_flow_offload.c      | 4 ----
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index d711642e78b5..4ab32fb61865 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -145,7 +145,6 @@ struct flow_offload_tuple {
 		};
 		struct {
 			u32		ifidx;
-			u32		hw_ifidx;
 			u8		h_source[ETH_ALEN];
 			u8		h_dest[ETH_ALEN];
 		} out;
@@ -211,7 +210,6 @@ struct nf_flow_route {
 		} in;
 		struct {
 			u32			ifindex;
-			u32			hw_ifindex;
 			u8			h_source[ETH_ALEN];
 			u8			h_dest[ETH_ALEN];
 		} out;
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 9d8361526f82..1e5d3735c028 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -127,7 +127,6 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 		memcpy(flow_tuple->out.h_source, route->tuple[dir].out.h_source,
 		       ETH_ALEN);
 		flow_tuple->out.ifidx = route->tuple[dir].out.ifindex;
-		flow_tuple->out.hw_ifidx = route->tuple[dir].out.hw_ifindex;
 		dst_release(dst);
 		break;
 	case FLOW_OFFLOAD_XMIT_XFRM:
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index e06bc36f49fe..d8f7bfd60ac6 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -555,7 +555,7 @@ static void flow_offload_redirect(struct net *net,
 	switch (this_tuple->xmit_type) {
 	case FLOW_OFFLOAD_XMIT_DIRECT:
 		this_tuple = &flow->tuplehash[dir].tuple;
-		ifindex = this_tuple->out.hw_ifidx;
+		ifindex = this_tuple->out.ifidx;
 		break;
 	case FLOW_OFFLOAD_XMIT_NEIGH:
 		other_tuple = &flow->tuplehash[!dir].tuple;
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index b4baee519e18..5ef2f4ba7ab8 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -80,7 +80,6 @@ static int nft_dev_fill_forward_path(const struct nf_flow_route *route,
 struct nft_forward_info {
 	const struct net_device *indev;
 	const struct net_device *outdev;
-	const struct net_device *hw_outdev;
 	struct id {
 		__u16	id;
 		__be16	proto;
@@ -159,8 +158,6 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 	}
 	info->outdev = info->indev;
 
-	info->hw_outdev = info->indev;
-
 	if (nf_flowtable_hw_offload(flowtable) &&
 	    nft_is_valid_ether_device(info->indev))
 		info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
@@ -212,7 +209,6 @@ static void nft_dev_forward_path(struct nf_flow_route *route,
 		memcpy(route->tuple[dir].out.h_source, info.h_source, ETH_ALEN);
 		memcpy(route->tuple[dir].out.h_dest, info.h_dest, ETH_ALEN);
 		route->tuple[dir].out.ifindex = info.outdev->ifindex;
-		route->tuple[dir].out.hw_ifindex = info.hw_outdev->ifindex;
 		route->tuple[dir].xmit_type = info.xmit_type;
 	}
 }
-- 
2.47.1


