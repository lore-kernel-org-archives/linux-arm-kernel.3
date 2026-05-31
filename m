Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901D0CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9rjo0uDpY5uOKWII1aHKHLcNjvUubFe9nbeybaojHw=; b=nctRjfQmb2xCzZXYEpRAokyKAk
	eia+OtZ4LFRS3bLqojN16mjMAdZAtDHZeh7RjAAlR9pxM8dgJ5l01skTZztyVAXfj+Cq8/43Wfskk
	l4TUbEs+i4GXYlQlEq+ScVhMBifYEPaOMSUNhavgVH2dWpQCPYHnrd/YiypYPeq3pbIsIOVsbmUHO
	qimPHM5k+PC/efW9XNv7I5bfQNQwWXWdYMGwge0dOJvzR/UdMs3y9Fh54ySp0tv8ohMZPuVy64uVd
	ZH6wO703M+l/o2OelHbLzB2b/2NrLb8oN6TeATzvMXeVrhNabT+izzmSVJWXmUrvIK/mNEUTsHPBn
	pkgEqjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiRk-00000009ioG-2LYw;
	Sun, 31 May 2026 15:51:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiRc-00000009ijN-0Ub1;
	Sun, 31 May 2026 15:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3254435AE;
	Sun, 31 May 2026 15:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7E21F00893;
	Sun, 31 May 2026 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780242679;
	bh=E9rjo0uDpY5uOKWII1aHKHLcNjvUubFe9nbeybaojHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FCQyMR+BmiAlMu0IGMLBtDbPFzgmn90ePPGAJ0g0z0eKsafjNUcJd7A8SrR1Eo7eT
	 NNzNeDgK/XpAiBUGPx3lpIPGyrKsuGjRgaZmubmU9sKe6gYMNFFvZLPN7FNw2xtRem
	 ZXdDvBYVPyAA52yxHw8vNl2CyHH/R771AnaCeGKmSTao5YTBA5dVANCyVVRKTPT5yw
	 Hpq8czi1U/qgztENmZdnNy3dvxFVZkNWd7ATztee9U2I0c2LAw53eqIT9fjqUVBMz7
	 /8HjTANpWlLf+vA1k1+ypBLNxdbQ5Zz7FJPivk61DCpDOq0kKYr6YaAW2NRF85yWK5
	 pMApZ6ZIkJhJA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 31 May 2026 17:50:34 +0200
Subject: [PATCH nf-next v3 2/6] net: netfilter: Add encap_proto to
 flow_offload_tunnel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-b4-flowtable-sw-accel-ip6ip-v3-2-56a2826f3279@kernel.org>
References: <20260531-b4-flowtable-sw-accel-ip6ip-v3-0-56a2826f3279@kernel.org>
In-Reply-To: <20260531-b4-flowtable-sw-accel-ip6ip-v3-0-56a2826f3279@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Shuah Khan <shuah@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_085120_200717_F04DF62A 
X-CRM114-Status: GOOD (  12.15  )
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

Add encap_proto (AF_INET or AF_INET6) to struct flow_offload_tunnel
to allow its use as part of the hash table key during flowtable entry
lookup.
This is a preliminary change to support IPv4 over IPv6 tunneling via
the flowtable infrastructure for software acceleration.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 include/linux/netdevice.h             | 1 +
 include/net/netfilter/nf_flow_table.h | 1 +
 net/ipv4/ipip.c                       | 1 +
 net/ipv6/ip6_tunnel.c                 | 1 +
 net/netfilter/nf_flow_table_ip.c      | 2 ++
 net/netfilter/nf_flow_table_path.c    | 2 ++
 6 files changed, 8 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 88a5c7f59891..2c97cc60807c 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -902,6 +902,7 @@ struct net_device_path {
 			};
 
 			u8	l3_proto;
+			u8	encap_proto;
 		} tun;
 		struct {
 			enum {
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 7b23b245a5a8..4d406801ec90 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -118,6 +118,7 @@ struct flow_offload_tunnel {
 	};
 
 	u8	l3_proto;
+	u8	encap_proto;
 };
 
 struct flow_offload_tuple {
diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
index ff95b1b9908e..5425af051d5a 100644
--- a/net/ipv4/ipip.c
+++ b/net/ipv4/ipip.c
@@ -369,6 +369,7 @@ static int ipip_fill_forward_path(struct net_device_path_ctx *ctx,
 	path->tun.src_v4.s_addr = tiph->saddr;
 	path->tun.dst_v4.s_addr = tiph->daddr;
 	path->tun.l3_proto = IPPROTO_IPIP;
+	path->tun.encap_proto = AF_INET;
 	path->dev = ctx->dev;
 
 	ctx->dev = rt->dst.dev;
diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index f647e687ae4f..8202b33b4f19 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1855,6 +1855,7 @@ static int ip6_tnl_fill_forward_path(struct net_device_path_ctx *ctx,
 		path->type = DEV_PATH_TUN;
 		path->tun.src_v6 = t->parms.laddr;
 		path->tun.dst_v6 = t->parms.raddr;
+		path->tun.encap_proto = AF_INET6;
 		if (ctx->ether_type == cpu_to_be16(ETH_P_IP))
 			path->tun.l3_proto = IPPROTO_IPIP;
 		else
diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 9c05a50d6013..49e9b0308763 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -198,6 +198,7 @@ static void nf_flow_tuple_encap(struct nf_flowtable_ctx *ctx,
 			tuple->tun.dst_v4.s_addr = iph->daddr;
 			tuple->tun.src_v4.s_addr = iph->saddr;
 			tuple->tun.l3_proto = IPPROTO_IPIP;
+			tuple->tun.encap_proto = AF_INET;
 		}
 		break;
 	case htons(ETH_P_IPV6):
@@ -206,6 +207,7 @@ static void nf_flow_tuple_encap(struct nf_flowtable_ctx *ctx,
 			tuple->tun.dst_v6 = ip6h->daddr;
 			tuple->tun.src_v6 = ip6h->saddr;
 			tuple->tun.l3_proto = IPPROTO_IPV6;
+			tuple->tun.encap_proto = AF_INET6;
 		}
 		break;
 	default:
diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index b9032dfe3883..4d01212d6614 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -128,6 +128,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				info->tun.src_v6 = path->tun.src_v6;
 				info->tun.dst_v6 = path->tun.dst_v6;
 				info->tun.l3_proto = path->tun.l3_proto;
+				info->tun.encap_proto = path->tun.encap_proto;
 				info->num_tuns++;
 			} else {
 				if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
@@ -274,6 +275,7 @@ static void nft_dev_forward_path(const struct nft_pktinfo *pkt,
 		route->tuple[!dir].in.tun.src_v6 = info.tun.dst_v6;
 		route->tuple[!dir].in.tun.dst_v6 = info.tun.src_v6;
 		route->tuple[!dir].in.tun.l3_proto = info.tun.l3_proto;
+		route->tuple[!dir].in.tun.encap_proto = info.tun.encap_proto;
 		route->tuple[!dir].in.num_tuns = info.num_tuns;
 	}
 

-- 
2.54.0


