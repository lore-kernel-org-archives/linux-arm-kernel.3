Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01F0CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2tRUQgRwBejUhg1cYn+oCvO34Dh5HeYuLe9vbd7LI8=; b=pb7q/HO/vMj8MepCH8TU14v88o
	JXOpCKsLhzov48df5/6H117fmY46AQ4Fvow0KQKMQNtNMjRUePlkvh9hbDuOGWz2cDEalcDssk3pJ
	07iS0LcrsKylDrtlyrRysAsb4UNNSZsBQazNZb0t0PuWOMHCn44lGk4CRM6K6MLNpRkCueZrti4VF
	4VRfVFg/2W8cwImpNiRidmrtOT+2YGFlxyfx/yfc910/xsvJMtXqYIPgorwtfOVSCTcpO4H4UeMzw
	5pzTDdEpmkYt8H1ndhXUKVRjqfmxF0M7TbiaK1QhOoPcNaiWkJVTCBB8bu+knsNo+o1Jitc+Bp+kA
	rzjlsK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiyD-000000051mK-1qBs;
	Wed, 20 May 2026 15:36:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPiyC-000000051lp-1P7o;
	Wed, 20 May 2026 15:36:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7028360008;
	Wed, 20 May 2026 15:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EE51F000E9;
	Wed, 20 May 2026 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779291387;
	bh=a2tRUQgRwBejUhg1cYn+oCvO34Dh5HeYuLe9vbd7LI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmxflIBqTEPMrZ+FGAoQNKSPX0MdonqQ8oPlwrBuupAyWh8MEA/9OI5MpxCzJm1wM
	 QODUBzFOQ+Oqpwp9I0lQMxZvcd1zFDdeVNBxcgdL686H736PWU/zRbBoQb1Kl22FPi
	 i4qJixTzCo5BEpVWY2XJ73Zh6vOIVWL3qRqzPhkzxkuHhTEAvYwmBdyU0oOCZVfXwg
	 lMWx50jMpnZaXz6Uje8rPeHsmi74KdcPe4EgDvG5SIZSjwxWtLI6lA3RaiobMf5UoA
	 nnTsPH6T+Liog+P/nQw9U2klbHKMi4zQwsKkZzUXeBSYhx8sT6ROmC425Uu734bObH
	 b1VY5rjrZbHVg==
Date: Wed, 20 May 2026 17:36:24 +0200
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
Subject: Re: [PATCH nf-next v2 0/6] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Message-ID: <ag3U-DmEWiwcH0uB@lore-desk>
References: <20260506-b4-flowtable-sw-accel-ip6ip-v2-0-439fd427726e@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1SQHS4FsUVyGc0Q"
Content-Disposition: inline
In-Reply-To: <20260506-b4-flowtable-sw-accel-ip6ip-v2-0-439fd427726e@kernel.org>
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


--y1SQHS4FsUVyGc0Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
> IPv6 and SIT tunnels in the netfilter flowtable infrastructure.
>=20
> ---
> Changes in v2:
> - Fix MTU check in nf_flow_offload_forward() and in
>   nf_flow_offload_ipv6_forward()
> - Add SIT sw acceleration support
> - Link to v1: https://lore.kernel.org/r/20260505-b4-flowtable-sw-accel-ip=
6ip-v1-0-9ac39ccc9ea9@kernel.org

Hi Pablo and Florian,

Any update about this series? Thanks in advance.

Regards,
Lorenzo

>=20
> ---
> Lorenzo Bianconi (6):
>       net: netfilter: Add ether_type to net_device_path_ctx
>       net: netfilter: Add encap_proto to flow_offload_tunnel
>       net: netfilter: Add IPv4 over IPv6 tunnel flowtable acceleration
>       selftests: netfilter: nft_flowtable.sh: Add IPv4 over IPv6 flowtabl=
e selftest
>       net: netfilter: Add SIT tunnel flowtable acceleration
>       selftests: netfilter: nft_flowtable.sh: Add SIT flowtable selftest
>=20
>  drivers/net/ethernet/airoha/airoha_ppe.c           |  14 +-
>  drivers/net/ethernet/mediatek/mtk_ppe_offload.c    |  13 +-
>  include/linux/netdevice.h                          |   5 +-
>  include/net/netfilter/nf_flow_table.h              |   1 +
>  net/core/dev.c                                     |   6 +-
>  net/ipv4/ipip.c                                    |   1 +
>  net/ipv6/ip6_tunnel.c                              |   6 +-
>  net/ipv6/sit.c                                     |  26 ++
>  net/netfilter/nf_flow_table_core.c                 |  14 +-
>  net/netfilter/nf_flow_table_ip.c                   | 386 +++++++++++++--=
------
>  net/netfilter/nf_flow_table_path.c                 |  16 +-
>  tools/testing/selftests/net/netfilter/config       |   1 +
>  .../selftests/net/netfilter/nft_flowtable.sh       |  78 ++++-
>  13 files changed, 402 insertions(+), 165 deletions(-)
> ---
> base-commit: c1e5127b577c6b88fa48e532616932ae978528d5
> change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--y1SQHS4FsUVyGc0Q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCag3U+AAKCRA6cBh0uS2t
rPv9AQCAeVJ4LW3/ZIxsIiBE3XnXj6UlIBCD6SYxGD9HVjHqTAD9ETIzVKrKIpnn
TWQXuXJqNaEhL7TTPrv+698yNy3I2QA=
=eDma
-----END PGP SIGNATURE-----

--y1SQHS4FsUVyGc0Q--

