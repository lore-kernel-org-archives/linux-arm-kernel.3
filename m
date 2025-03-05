Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303F3C282E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=; b=4ckr4rBOaMEjHXPsrYV+b99fBn
	pwGsjEALxtF0HAnEAKRSycHWbd1YdH+ChTLd+gXdWEHrUcxJGlUz69mjvh+okrYwed5dHYKD8fTpG
	LpoXHaM9G8cUn+d0NB6U9qjXu0uIQlEes31Xe/vW96kH6zMgAQQFaGrtR/gR37xIFArVsA33oCOlo
	8HqzUfWE1YGY7z/PlMa6td2aNYI+7U+hGD3l/sB/vFVKrlxmKhr1tkRBpCXr1CHipPXrkKKq0k1RB
	7BjCoQFQwCwHX+tWgHR82iYBN2MdyZQVVqAmu71SUqJDsldoiPRP5zdKPxHkcRQNVYb1TXvcG4zis
	uLcVBhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmcC-00000007nzW-2B3Y;
	Wed, 05 Mar 2025 11:08:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0y-00000007gRk-0qy9;
	Wed, 05 Mar 2025 10:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=; b=HexuGPujvtpNEaOhWVhWPsEBuM
	U6hpjBDkeS5GSXh9AZ8dwkeDcFxdMASLiutRMaCd/mlIfeOHyDZdjGhnIP0UofySQ/wS2zRE/qbiE
	lF1cGz3mY36ai4pHJQumoBPA/xt7TCYWDskDRkcuqNifA43TGC6he8Jqpi1XYZx/TCYUH2tdLHv2v
	6J3/JylQ3cYvQM3Oq5ldBB8pqM6K6jteg4yhxYALlg541WQueAAfIG0fj7xzV0aQzbePPVQ0NtUDY
	54JHoPIS03hJFzkGOXL7dqq/TVhTfR7zjt2OjV8vwZVWRUMEMgJIxZJ9eSUIHWR5rChDnSDqinSsT
	f0zc9e3A==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0v-00000005IpK-1pej;
	Wed, 05 Mar 2025 10:30:11 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb37dso5638211a12.0;
        Wed, 05 Mar 2025 02:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170607; x=1741775407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=hT+p/5GnS56IRIdTcn57Vs08g/tNVdfPSVp/zOYE38yYdUsUw2YMoive1BB0UDJoa7
         gx9liqAMAcrhhhw+vQMcZoqaFNVkgj2lUblULsrJ0/jxcuimjFLWrvU7i24cNsClP/rY
         9iCXZMl7TSPJrZgwdt8V6zoq5N1kfleQA4vuIofoMTHrYQNjx98WrhJJ7bpfrDw4+q+f
         8XGd9X2JBOdn83ljhZTB3s8yHGW50bwJAam3nMEz4Xc4SrP3+yzzQv2ds8RuXx6mn6HS
         7ooqjhJXtmN0ldosYTrbzJbmjAz/t03A43OMc/0FjbfW55nxWVp6k+OvxmrSjCJSYy/c
         +jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170607; x=1741775407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3xV3TA0ockrC7/s5OEcRj/pNoR8pLIoTTKhN2eYQLw=;
        b=VCaLsFK+2pSsf0myzR11/XRB5rfWK81XZeznx8H5YKj2EATcSYomsMkPkiCoxthAL3
         rVRf1+NQMMeNaSvxWpM42UyhEa3Crq/65CiOB3A2mkdZ6KcC3ZpJz58aJ+/F97clKgTX
         z5TtlJs2DPJwAB5RZpybwgbepb+aPP8e6P4XWwh+daY2oNtngsNqIimbFjqrPNNjFdAL
         7IqKFTJknOkNknzLcgLxAIaYdrnSkdrswKExSOHHgU3GuMQ3zNCoD8lSfRSsfbwgn/X/
         C0yGyJW3Pa9HCW7bBLMHJCEdox897MHMrYeWQTd7Fe5mN8gPSEOpoq8fJbpjYuTu3PBY
         TbPw==
X-Forwarded-Encrypted: i=1; AJvYcCWMYMNalilr+jLZUi2JhGE4vLCypY/iZKIms8qPF/kRVO4c7iGJR95ZftQ9KdD69xFD63G0e03ZXHHyLAN9Evg=@lists.infradead.org, AJvYcCX3twvh1uIxZclg9nFKX2hnFtHkVG8/24nm/AOcAsYlFi7ERssQ2mZPOo6R5p2eHGQRBaTGWC7mLFryVogVe0rL@lists.infradead.org
X-Gm-Message-State: AOJu0YyR1G2zx4fobyD+MpuE6N1gPcV4rJdeW5zbRa19S5SwcVH65DdL
	7q55K+OeYcQNFLP+NWn0KkA72sszSJo8aBcDIYiNVXdaH6yuBIAG
X-Gm-Gg: ASbGnctZUbvPleNADbSgLFBX66cvMT2ppjgiUzNCbvfM95qHjmV9mzz5VuPOXn4OokO
	Jox09ethR2r0HUw1UAj4xVCGdIihyce/tlrwnovBBZ6aenxEBdEJtr6cHrnomaHzcCz3sxgiJbK
	X+2LmnkZlF8PKAim34obcJOYClp3bkvYI5F9btcRm1ReQvvkKxlXgzzD40w5mylYe6Ux6a1JppK
	M6V7zGzA1KA5K92iTRRCI7snpbgFIwKcnXm7j0t51yUaqIBkjNCJU2ktU14VEPvScc+BANW2x2U
	vMWglai0PckebPD2YSmLuxQizGWx+/Kj7xW6IHn83/2cxkwX8cBQrCHxoVVsDE+f9CKq0o8Uk/L
	ieJqsUBqI8naXUitX2edAD6/vlu8Tmw8wamDQMp3jmHVPk9uBsO9oWL2es3WXbQ==
X-Google-Smtp-Source: AGHT+IFiJqR8AW9q4B4jV0oBAldSkpb3Cory3PfYPngFhkXoybiZBDs5zVQJdJ8Lft/VnBuwHJUAJQ==
X-Received: by 2002:a17:907:8b97:b0:abf:4892:b6ea with SMTP id a640c23a62f3a-ac20db37c07mr294449866b.25.1741170606779;
        Wed, 05 Mar 2025 02:30:06 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:06 -0800 (PST)
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
Subject: [PATCH v9 nf 03/15] netfilter: flow: remove hw_outdev, out.hw_ifindex and out.hw_ifidx
Date: Wed,  5 Mar 2025 11:29:37 +0100
Message-ID: <20250305102949.16370-4-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103009_488371_8E8165B4 
X-CRM114-Status: GOOD (  12.53  )
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


