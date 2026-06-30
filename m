Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5007DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QDs7p8/Xz3WWuXQy2Gd1QNRcYz9tg+di8ISRSUsTm4=; b=qsFQMWg4Bih4qdKbaNoIhnQlEM
	9LzqrYYeEY2Ei6iSbcuXJ3RZ1ivhwo9sUDs3UO/aqUXFpG9dH6vKJz+hxuGI++JaafEywBRGcxXI4
	owUQjOXJEohGtZyLQ1tPfn8cGnfJ/Bk7qZyBQawQ/O4pqMtAvGxv655SzjiBsVhU1qg5HxqvfdSKR
	ZT7CZDnkjYaLSzhm4vtHbB5GdjHDSWCDOiR5A0zfdZQE9BqqjviLWehfAO/ryb1tpnghmQ3w7Nxkc
	FI9/Fr/zEdB07R0lMjZnIao5WP0fQkdh7IQlXBYTEua+tPukfsvRN7DejF/GGdA8SHSgs8OmHvj6B
	RKD+2spg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU68-0000000GIIq-0LaH;
	Tue, 30 Jun 2026 08:45:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weU66-0000000GII4-2xIf;
	Tue, 30 Jun 2026 08:45:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2QDs7p8/Xz3WWuXQy2Gd1QNRcYz9tg+di8ISRSUsTm4=; b=BOTdGUILSIncJOj3iK+AGkWolo
	sfmMtwhakGT7sTmvhmqYCbRhGVyIH93qX21TrpFz+tUa/HKmNmkoCetOFxSFhs3uTqI1/vGsWZo6L
	bzCPrjd9++pvG5xNFM0TQ1GsCkvXSSnBrEjoFU4trnDfSEzQLL7FHPaD1Dwxdt47+uy0dnJ+EQy8/
	gB/l5630HOooGDPXIIjUf+xxdjeXMXvr9fvyWK0bzay8usZSqPTAwWbBbi90D/BEngxaiy1IPY3pb
	Arjb8P/1xSdZjr3qsr1ycVfH6YBaarkPNq0pwgvgT1pljY3hA8azZYKQZvbTmQwQdLGFOQX1Z2rHW
	CRFlVesA==;
Received: from mail.netfilter.org ([217.70.190.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weU60-00000001fnh-3kVX;
	Tue, 30 Jun 2026 08:45:36 +0000
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 7B7476019C;
	Tue, 30 Jun 2026 10:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1782809128;
	bh=2QDs7p8/Xz3WWuXQy2Gd1QNRcYz9tg+di8ISRSUsTm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIr3D04DQLaD3VEweCFcD8bAzLB9Sl/otEDmhxRtRCmCNg6UZu2BraOttxuCB4JjT
	 avuVGtmT8XalBIQAmnTtLDX5J55yPos9H13ACWCs0qUcMZ6dArTLHKO6YwBzpN3S9S
	 o9wuW8B2U/1+mSiv5zGQq8ngt0YaHRNIdTh9cdrWYUCtVVuvpOIA1IjdLJ9HKcMSmr
	 xAgSuxARDNG032H5+cvRHSIaRJ0qAIPYj/kCSb7pQmhV7DZ+fSTR2pffNRQgwodbwb
	 XwOLSrAF1oel/uY8RvUEQ2rhNL9QBPbV093oDVGXWTpPKJf3F9a2wQT7NDyuqK1Q/o
	 IVuSOBQN2VrPw==
Date: Tue, 30 Jun 2026 10:45:24 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, fw@strlen.de,
	phil@nwl.cc, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	andrew+netdev@lunn.ch, razor@blackwall.org, idosch@nvidia.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev, coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, rchen14b@gmail.com,
	lorenzo@kernel.org
Subject: Re: [PATCH v2 0/5] netfilter: nf_flow_table_path: L2 bridge offload
Message-ID: <akOCJI-2kAAwOQzz@chamomile>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_094533_995174_CBBB94C7 
X-CRM114-Status: GOOD (  17.97  )
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

Hi,

On Tue, Jun 30, 2026 at 08:57:30AM +0200, Daniel Pawlik wrote:
> This series adds L2 bridge offload support to nft_flow_offload, allowing
> bridged IPv4/IPv6 flows to be accelerated by the flowtable fast path
> without requiring L3 routing.
> 
> Background
> ----------
> Hardware flow offload engines (e.g. MediaTek PPE) can accelerate bridged
> traffic but require that nft_flow_offload detect and handle bridged flows
> differently from routed ones: no routing table lookup, MAC addresses from
> the Ethernet header, and VLAN context pre-populated from the bridge port.
> 
> v2: Fix missing Returns: tags in kernel-doc comments for the three new
>     bridge helpers (br_fdb_has_forwarding_entry_rcu,
>     br_vlan_get_offload_info_rcu, br_vlan_is_enabled_rcu).
> 
> Patches
> -------
> 1/5  net: export __dev_fill_forward_path
>      Refactors dev_fill_forward_path() to expose __dev_fill_forward_path()
>      which accepts a caller-supplied net_device_path_ctx, needed to
>      pre-populate VLAN state before the forward path walk.
> 
> 2/5  net: bridge: add flow offload helpers
>      Adds br_fdb_has_forwarding_entry_rcu(), br_vlan_get_offload_info_rcu()
>      and br_vlan_is_enabled_rcu() to expose bridge state to nft_flow_offload
>      without requiring inclusion of net/bridge/br_private.h.
> 
> 3/5  netfilter: nf_flow_table_path: add L2 bridge offload
>      Core of the series. Adds nft_flow_offload_is_bridging() detection,
>      nft_flow_route_bridging() which avoids nf_route() (fails for
>      bridged-only subnets), MAC/VLAN pre-population for bridged flows,
>      and a dst leak fix. nft_flow_route() becomes a thin dispatcher.
> 
> 4/5  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
>      Fixes zero-source-MAC in PPE entries when a bridged flow traverses
>      MT7996/MT7915 WiFi WDMA hardware.
> 
> 5/5  netfilter: nf_flow_table_path: add VLAN passthrough support
>      Records VLAN encap info for passthrough-mode bridge ports so hardware
>      offload entries include the correct VLAN tag.
> 
> Rebase note
> -----------
> Originally developed against OpenWrt pending-6.18 patches by Ryan Chen
> <rchen14b@gmail.com> and Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
> Rebased to current upstream: path discovery infrastructure moved to
> nf_flow_table_path.c in commit 93d7a7ed0734 ("netfilter: flowtable: move
> path discovery infrastructure to its own file"), so all netfilter changes
> now land in that file rather than nft_flow_offload.c.
> 
> How to enable bridge offload
> -----------------------------
> 1. Load kmod-br-netfilter so that bridged IP traffic traverses the
>    netfilter forward chain.
> 
> 2. Enable netfilter hooks on the bridge:
>      echo 1 > /sys/class/net/<br>/bridge/nf_call_iptables
>      echo 1 > /sys/class/net/<br>/bridge/nf_call_ip6tables

This requires br_netfilter which is a no go.

Sorry, but we should really target at the native nf_conntrack_bridge
support.

> 3. Register bridge member interfaces in the nft flowtable:
>      table inet filter {
>          flowtable f {
>              hook ingress priority filter
>              devices = { eth0, wlan0 }
>          }
>          chain forward {
>              type filter hook forward priority filter
>              meta l4proto { tcp, udp } flow add @f
>          }
>      }

Yes, but br_netfilter makes no sense for nftables.

br_netfilter was made to fill gap at the time ebtables was lagging a
lot behind iptables in terms of features. And getting ebtables on pair
with iptables in functionality was not feasible either, because it
required many new extensions that were specific of the bridge family,
which probably was not a big deal, but it also required to get
the ebtables command line tool on pair with iptables userspace, which
has received more development attention/effort that the bridge tool.

All of this does not stand true anymore with nftables, where the
bridge family capabilities are at pair with the inet families.

I am looking now at the native flowtable bridge support, I will get
back to you with updates.

