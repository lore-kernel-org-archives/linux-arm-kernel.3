Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425E1C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=; b=4iA0rrY6PVy5ANkwsLIZaOFejn
	N8gblw88afQL0DAlZG2dlNHobxP5Uv4+3krd8Qywmmx+fiKgdHbCEWf/NfGOjDl45OTCyM8UCobV0
	BL5LoMirHg0O1xqd8GhF1cZC7I+6m6ZPd04jmx74QIAAr31qkI/x4F/IjtchojHWHRGkfgyaZH2vK
	oBS3PA1rpVqu23egIapxuvM5PAPmJHfv2h+/qjvUc5WHupy1qPJNnPrK+jgt6faSPCh2nlwIfjFGG
	ZaXog3i7JOMlfsMmlo8azgizzzWr19aGlgVs5qLMHpSAUV0A+Sk7wYvjTrPGu2JpA5Nl9muQRpsP2
	gbcxkisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7ZV-0000000Cg7u-0N7t;
	Fri, 28 Feb 2025 21:07:01 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mT-0000000CYHy-3iXi;
	Fri, 28 Feb 2025 20:16:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abee54ae370so357715266b.3;
        Fri, 28 Feb 2025 12:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773780; x=1741378580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=aXag8VbfvbL7fwGwo1x1bWHjst9AQaYRLYkBattUnOgfNRtlN9OiiukFYGExtYP6Ca
         7kYrSGuIy33cCZvSvsx/TvzBFiWABL7Iaj9NtyLY+R1kPCSrzEXZio5s+DQ2PM3xo/AR
         DXyY7jr9fm055adx0wI/3yZp/h3i3MMMLHrasBU48j0cF52/W8rvTZY4+81p3p1DlUVX
         I15zkBUMjA6Sj8aU/we+/zUJyGjNw4cxaHYurO6r+OwDxIIcjZpc/ha4+HzGLtqzOIAt
         a0u5Tbz/HV1CznND3Xy+F6+4q5GwibaMjBC+APqQf6vBK12p+6LpHD7UctTYNBFVg31Z
         7FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773780; x=1741378580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=lt8MPhR0il7nSkCSm6QddfLG0CFeA6HrG8XAfwAQ8CtLCL8d9X/Q1wnwWcCeo3gGyt
         KAolBhEw2xo5H3pGNT09wS19mHLKFo4Qnj3DdJRJ6e/20KDu82xEFGIPxwQHzwpnIZp6
         2K8W4dfNq7gJ/gwoK2HMW1Ho0e9O1ncW+/b3iyBg4SlWWdkF0SeBloCXiVSv/QL2gFNJ
         slwMSERlD9Gvperj56t1u+s3JOGJwHSu0S84jTr9+gkXX4YEXRQ3/AlLxTcD90rxChV3
         3oL4Ddm6Lhb/f2VYpUd6KfIabx/TdxLPPzZsXUVHo9sMv0d08OlGbKE1lqDJO8FtE7y9
         y9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmnVYwIBK9FJYwBbCl8nu313OHau568UMZT/Vs6Rh+COyV7+2yHh4q7L9HEcCH78MCzqHIPL67ccsdW8YH3DFi@lists.infradead.org, AJvYcCWEKvHWofhO/fxh+SedSoxxSV+8LmRf4dodRJ218YTUoJGt+L9mYEEU1jQV1LQuudueMWXPgaTJVRxpT2ITihU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqvaGXZZC6hrCH5aLnBufTIS8RsN9OTK11dJEjkkBKsGck3mWE
	wrnqvDMCeqe4ESaTb9E686Id5LrIPRJfqdwak+/uxhqkSEs0ksBF
X-Gm-Gg: ASbGncvyIrGuPoyT9Y+GUf7NhYJXxxkK/lpOWkCznFUjKaP11u6pLbJBddPF26PVrQl
	TGwSv+RA2Kq/+Io7fdDebr6ZlIoLCOH6gs17HM7RwNEGG7x14Jn92N1EucroNNduEvJzzsqq14e
	3KTttdzk/8SxVVbByVh7mRu2Raerm07r6qCmr5MrgiC3JOA8f16V8N513aTQVY5iTs55FZHK1YZ
	1c3OzAkO/va1Rz0YM032CXjZ1NuJ7bsXkp8NmrUnvyx102VKCfaMFVQB+TKzZIaQWuc/u9EqlsX
	xcMpNLFgrWBKhJDwVkqtul2bWpAYn2NexEkdNXTbaezBoX/P6uq0LqTVq86q2HTYFmpOXfZXdqx
	jsFfqgJXXmMDEzqnLIgn+n0duN4N09ZDo034gj0Mv4jQ=
X-Google-Smtp-Source: AGHT+IEiUtc0XSpuKyIKeLozoVWm4Sd50Qjo2FMlO/4dpvxhs03yVO3P9mswx5jt1Mq2Z2AMyoPXJw==
X-Received: by 2002:a17:907:9408:b0:abf:19ac:76d with SMTP id a640c23a62f3a-abf269b9a91mr541954866b.51.1740773780345;
        Fri, 28 Feb 2025 12:16:20 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:19 -0800 (PST)
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
Subject: [PATCH v8 net-next 03/15] netfilter: flow: remove hw_outdev, out.hw_ifindex and out.hw_ifidx
Date: Fri, 28 Feb 2025 21:15:21 +0100
Message-ID: <20250228201533.23836-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121621_935751_981A4D35 
X-CRM114-Status: GOOD (  14.85  )
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


