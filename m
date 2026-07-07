Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCDCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaDuq1ZB1HflLrDzdt+OV6vrfoAZsFjA2zyfOAaYkgE=; b=QN99bjdhB09ysiNCQwcctXl+Pw
	wuC0b2fSPlUJHT/FztI+w2rVGzDdSEkhvkr7QG82JXfmABvTq+1ZSKuBb9Ft6ms/LHgRdxpvwmgol
	DelRt4TY2Mb7EUeFfaidkXXvKi3zRMld2Whq/wfqGi4PbCXpCA1q4rWybSDC1aCE1OvnrJ5281EIu
	sz682E3SsiPnlbSfLJ4P8DM6Iru7Kl/6N6+H4Cw/13e/0CXExrvfK7sjRxGEEdjUz8sGi8XlIoEa5
	C1/U8tbLBFBCVPl1f2UypveO1wq/UH25RlNS8duW+PRDnBt6oZtf4neT01XXJ1gUh6Qr7XSsVeCtt
	9tw4vQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8cV-0000000FSie-3e2f;
	Tue, 07 Jul 2026 16:26:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8cT-0000000FShw-2s3o;
	Tue, 07 Jul 2026 16:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AA7540BBC;
	Tue,  7 Jul 2026 16:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B171F000E9;
	Tue,  7 Jul 2026 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783441561;
	bh=xaDuq1ZB1HflLrDzdt+OV6vrfoAZsFjA2zyfOAaYkgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CYyP7Mf4+GN9JppbBY9CLselE708FkBS7NaTpa1ICCH0kPty9sSTKl2ceN25EiSJB
	 f+vwZpciH0whckwTcU4M8zGYtWzdOdGvzCBArGAagQ/3KeJmfZGopKUXTKUBF8e3OC
	 srz0EXlTtlhOzcfztwb3jJ3XietlHsdhwt2UunmcVg+h7jdYqAzHu0JDcgj6Rk4aIL
	 z7gMtD3mENFrZC7bTrMgsXJrbwZjJdTP3X+362B4RqKqXRhji9DdgZW2vmkKO0xp7J
	 iAyQgBr9rX3CuDaVcNR5RqsYZZq6UVzRJtY5NXGrJKQg9YzfDPKaMuLIudP9umfRry
	 KaRS7V12x2hrA==
Date: Tue, 7 Jul 2026 18:25:58 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH nf-next v4 3/6] net: netfilter: Add IPv4 over IPv6 tunnel
 flowtable acceleration
Message-ID: <ak0olot-8WTVrtGB@lore-desk>
References: <20260703-b4-flowtable-sw-accel-ip6ip-v4-0-00398cd12382@kernel.org>
 <20260703-b4-flowtable-sw-accel-ip6ip-v4-3-00398cd12382@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KpcLrKuIJxPbhAqD"
Content-Disposition: inline
In-Reply-To: <20260703-b4-flowtable-sw-accel-ip6ip-v4-3-00398cd12382@kernel.org>
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


--KpcLrKuIJxPbhAqD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

commenting on shashiko's report:
https://sashiko.dev/#/patchset/20260703-b4-flowtable-sw-accel-ip6ip-v4-0-00=
398cd12382%40kernel.org

> Introduce sw flowtable acceleration for the TX/RX paths of
> IPv4 over IPv6 tunnels, relying on the netfilter flowtable
> infrastructure.
> The feature can be tested with a forwarding scenario between two
> NICs (eth0 and eth1), where an IPv4 over IPv6 tunnel is used to
> reach a remote site via eth1 as the underlay device:
>=20
>     ETH0 -- TUN0 <=3D=3D> ETH1 -- [IP network] -- TUN1 (2001:db8:2::2)
>=20
> [IP configuration]
>=20
> 6: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state U=
P group default qlen 1000
>     link/ether 00:00:22:33:11:55 brd ff:ff:ff:ff:ff:ff
>     inet 192.168.0.2/24 scope global eth0
>        valid_lft forever preferred_lft forever
> 7: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state U=
P group default qlen 1000
>     link/ether 00:11:22:33:11:55 brd ff:ff:ff:ff:ff:ff
>     inet6 2001:db8:2::1/64 scope global nodad
>        valid_lft forever preferred_lft forever
> 8: tun0@NONE: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1480 qdisc noqueue stat=
e UNKNOWN group default qlen 1000
>     link/tunnel6 2001:db8:2::1 peer 2001:db8:2::2 permaddr ce9c:2940:7dcc=
::
>     inet 192.168.100.1/24 scope global tun0
>        valid_lft forever preferred_lft forever
>=20
> $ ip route show
> default via 192.168.100.2 dev tun0
> 192.168.0.0/24 dev eth0 proto kernel scope link src 192.168.0.2
> 192.168.100.0/24 dev tun0 proto kernel scope link src 192.168.100.1
>=20

[...]

>  	struct nf_flow_xmit xmit =3D {};
> +	struct in6_addr *ip6_daddr;
>  	struct flow_offload *flow;
>  	struct neighbour *neigh;
>  	struct rtable *rt;
> @@ -844,25 +872,41 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff =
*skb,
>  	other_tuple =3D &flow->tuplehash[!dir].tuple;
>  	ip_daddr =3D other_tuple->src_v4.s_addr;
> =20
> -	if (nf_flow_tunnel_v4_push(state->net, skb, other_tuple, &ip_daddr) < 0)
> +	if (nf_flow_tunnel_push(state->net, skb, other_tuple, &ip_daddr,
> +				&ip6_daddr) < 0)
>  		return NF_DROP;
> =20
>  	switch (tuplehash->tuple.xmit_type) {
> -	case FLOW_OFFLOAD_XMIT_NEIGH:
> -		rt =3D dst_rtable(tuplehash->tuple.dst_cache);
> +	case FLOW_OFFLOAD_XMIT_NEIGH: {
> +		struct dst_entry *dst;
> +
>  		xmit.outdev =3D dev_get_by_index_rcu(state->net, tuplehash->tuple.ifid=
x);
>  		if (!xmit.outdev) {
>  			flow_offload_teardown(flow);
>  			return NF_DROP;
>  		}
> -		neigh =3D ip_neigh_gw4(rt->dst.dev, rt_nexthop(rt, ip_daddr));
> +		if (other_tuple->tun.encap_proto =3D=3D AF_INET6 ||
> +		    ctx.tun.proto =3D=3D IPPROTO_IPV6) {
> +			struct rt6_info *rt6;
> +
> +			rt6 =3D dst_rt6_info(tuplehash->tuple.dst_cache);
> +			neigh =3D ip_neigh_gw6(rt6->dst.dev,
> +					     rt6_nexthop(rt6, ip6_daddr));
> +			dst =3D &rt6->dst;
> +		} else {
> +			rt =3D dst_rtable(tuplehash->tuple.dst_cache);
> +			neigh =3D ip_neigh_gw4(rt->dst.dev,
> +					     rt_nexthop(rt, ip_daddr));
> +			dst =3D &rt->dst;
> +		}

- Does this logic correctly handle cross-family tunneling like an IPv6-in-I=
Pv4
  packet (SIT) being forwarded out via another IPv4 tunnel?
  - SIT support is added by a following patch in the series.

>  		if (IS_ERR(neigh)) {
>  			flow_offload_teardown(flow);
>  			return NF_DROP;
>  		}
>  		xmit.dest =3D neigh->ha;
> -		skb_dst_set_noref(skb, &rt->dst);
> +		skb_dst_set_noref(skb, dst);
>  		break;
> +	}
>  	case FLOW_OFFLOAD_XMIT_DIRECT:
>  		xmit.outdev =3D dev_get_by_index_rcu(state->net, tuplehash->tuple.out.=
ifidx);
>  		if (!xmit.outdev) {
> @@ -1112,8 +1156,12 @@ nf_flow_offload_ipv6_lookup(struct nf_flowtable_ct=
x *ctx,
>  	if (!nf_flow_skb_encap_protocol(ctx, skb, htons(ETH_P_IPV6)))
>  		return NULL;
> =20
> -	if (nf_flow_tuple_ipv6(ctx, skb, &tuple) < 0)
> +	if (ctx->tun.proto =3D=3D IPPROTO_IPIP) {
> +		if (nf_flow_tuple_ip(ctx, skb, &tuple) < 0)
> +			return NULL;
> +	} else if (nf_flow_tuple_ipv6(ctx, skb, &tuple) < 0) {
>  		return NULL;
> +	}
> =20
>  	return flow_offload_lookup(flow_table, &tuple);
>  }
> @@ -1140,7 +1188,11 @@ nf_flow_offload_ipv6_hook(void *priv, struct sk_bu=
ff *skb,
>  	if (tuplehash =3D=3D NULL)
>  		return NF_ACCEPT;
> =20
> -	ret =3D nf_flow_offload_ipv6_forward(&ctx, flow_table, tuplehash, skb);
> +	if (ctx.tun.proto =3D=3D IPPROTO_IPIP)
> +		ret =3D nf_flow_offload_forward(&ctx, flow_table, tuplehash, skb);
> +	else
> +		ret =3D nf_flow_offload_ipv6_forward(&ctx, flow_table, tuplehash,
> +						   skb);
>  	if (ret < 0)
>  		return NF_DROP;
>  	else if (ret =3D=3D 0)
> @@ -1164,21 +1216,38 @@ nf_flow_offload_ipv6_hook(void *priv, struct sk_b=
uff *skb,
>  		return NF_DROP;
> =20
>  	switch (tuplehash->tuple.xmit_type) {
> -	case FLOW_OFFLOAD_XMIT_NEIGH:
> -		rt =3D dst_rt6_info(tuplehash->tuple.dst_cache);
> +	case FLOW_OFFLOAD_XMIT_NEIGH: {
> +		struct dst_entry *dst;
> +
>  		xmit.outdev =3D dev_get_by_index_rcu(state->net, tuplehash->tuple.ifid=
x);
>  		if (!xmit.outdev) {
>  			flow_offload_teardown(flow);
>  			return NF_DROP;
>  		}
> -		neigh =3D ip_neigh_gw6(rt->dst.dev, rt6_nexthop(rt, ip6_daddr));
> +		if (other_tuple->tun.encap_proto =3D=3D AF_INET ||
> +		    ctx.tun.proto =3D=3D IPPROTO_IPIP) {
> +			__be32 ip_daddr =3D other_tuple->src_v4.s_addr;
> +			struct rtable *rt4;
> +
> +			skb->protocol =3D htons(ETH_P_IP);
> +			rt4 =3D dst_rtable(tuplehash->tuple.dst_cache);
> +			neigh =3D ip_neigh_gw4(rt4->dst.dev,
> +					     rt_nexthop(rt4, ip_daddr));
> +			dst =3D &rt4->dst;

- Can this branch incorrectly cast a struct rt6_info to a struct rtable
  if an IPv4-in-IPv6 packet is forwarded to another IPv6 tunnel?
  - Double tunnel encapsulation is not currently supported.

Regards,
Lorenzo

> +		} else {
> +			rt =3D dst_rt6_info(tuplehash->tuple.dst_cache);
> +			neigh =3D ip_neigh_gw6(rt->dst.dev,
> +					     rt6_nexthop(rt, ip6_daddr));
> +			dst =3D &rt->dst;
> +		}
>  		if (IS_ERR(neigh)) {
>  			flow_offload_teardown(flow);
>  			return NF_DROP;
>  		}
>  		xmit.dest =3D neigh->ha;
> -		skb_dst_set_noref(skb, &rt->dst);
> +		skb_dst_set_noref(skb, dst);
>  		break;
> +	}
>  	case FLOW_OFFLOAD_XMIT_DIRECT:
>  		xmit.outdev =3D dev_get_by_index_rcu(state->net, tuplehash->tuple.out.=
ifidx);
>  		if (!xmit.outdev) {
> diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_t=
able_path.c
> index caaf48c5fd2a..5e84b7f18a26 100644
> --- a/net/netfilter/nf_flow_table_path.c
> +++ b/net/netfilter/nf_flow_table_path.c
> @@ -216,12 +216,13 @@ static int nft_flow_tunnel_update_route(const struc=
t nft_pktinfo *pkt,
>  	struct dst_entry *tun_dst =3D NULL;
>  	struct flowi fl =3D {};
> =20
> -	switch (nft_pf(pkt)) {
> +	switch (tun->encap_proto) {
>  	case NFPROTO_IPV4:
>  		fl.u.ip4.daddr =3D tun->dst_v4.s_addr;
>  		fl.u.ip4.saddr =3D tun->src_v4.s_addr;
>  		fl.u.ip4.flowi4_iif =3D nft_in(pkt)->ifindex;
> -		fl.u.ip4.flowi4_dscp =3D ip4h_dscp(ip_hdr(pkt->skb));
> +		if (nft_pf(pkt) =3D=3D NFPROTO_IPV4)
> +			fl.u.ip4.flowi4_dscp =3D ip4h_dscp(ip_hdr(pkt->skb));
>  		fl.u.ip4.flowi4_mark =3D pkt->skb->mark;
>  		fl.u.ip4.flowi4_flags =3D FLOWI_FLAG_ANYSRC;
>  		break;
> @@ -229,13 +230,14 @@ static int nft_flow_tunnel_update_route(const struc=
t nft_pktinfo *pkt,
>  		fl.u.ip6.daddr =3D tun->dst_v6;
>  		fl.u.ip6.saddr =3D tun->src_v6;
>  		fl.u.ip6.flowi6_iif =3D nft_in(pkt)->ifindex;
> -		fl.u.ip6.flowlabel =3D ip6_flowinfo(ipv6_hdr(pkt->skb));
> +		if (nft_pf(pkt) =3D=3D NFPROTO_IPV6)
> +			fl.u.ip6.flowlabel =3D ip6_flowinfo(ipv6_hdr(pkt->skb));
>  		fl.u.ip6.flowi6_mark =3D pkt->skb->mark;
>  		fl.u.ip6.flowi6_flags =3D FLOWI_FLAG_ANYSRC;
>  		break;
>  	}
> =20
> -	nf_route(nft_net(pkt), &tun_dst, &fl, false, nft_pf(pkt));
> +	nf_route(nft_net(pkt), &tun_dst, &fl, false, tun->encap_proto);
>  	if (!tun_dst)
>  		return -ENOENT;
> =20
>=20
> --=20
> 2.55.0
>=20

--KpcLrKuIJxPbhAqD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCak0olgAKCRA6cBh0uS2t
rI3NAQClQS3W+Ft7PA84x3n6YiTHeu7fpbuZ5bFy/w/e7uXuhgD/RyZixGGKm2Qr
cNBbhlAS61B4HSxfpr27WoCCykRS+Ac=
=gbZe
-----END PGP SIGNATURE-----

--KpcLrKuIJxPbhAqD--

