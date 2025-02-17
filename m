Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830FFC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43uJaFV1XaLbZY2gv7/aOGMZi9iFcy4zO2iAFZvjvgE=; b=q3e7l5dFNZh9stUwMzsYBq6uYa
	Nv/oBpcuuCZoknttCHgKHSefThzLoaogjv7m/3piXax5Et3ukOX8bWfUNJO3fpcJbLaqhb2/9d/Dy
	nyWJlPDGJX6H0J5pq4aAWsZ3o0UpxeSRa/ruk/Oyf81aNv5+kBtkBzEzasVsH7/Qf5VSSwFnpGcsN
	gd0o3P0hAGjKbCbLlhBCGcuETCtOagzlGY9erJIIsSFEBnuRgeH7H/hUW+DDC/GtJ7EJ5/Q8RlAEA
	lYTIvbdwU1fTk9bsC00E9ccbKhuD0MlSK3GWh63m1YQPdDldOT9brVz16sas517H91p7OD8gUHjuz
	pm+DmhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8xT-000000063ij-08Ln;
	Mon, 17 Feb 2025 21:47:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk8u3-000000063JC-07eB;
	Mon, 17 Feb 2025 21:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03C9A5C5926;
	Mon, 17 Feb 2025 21:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CFEC4CED1;
	Mon, 17 Feb 2025 21:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739828626;
	bh=fV5/lqWGfh3qpEkBAhNmPg/nL6+cObQOKlclxbrkpOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJGvcCNcA8GLdHDvn3WwlK7TrNUMxGChJ0q66aeKYBrluYRzx1WlJ5LnEHjc35A5F
	 fMP6AgLITZvBbJ/HrQ7tOkyNwg5weamaB5uTbC9rcOzDC+qwVb7NOp/8deQGwvYgHT
	 KJyjqcF2+iAM4SLpFNhuvrdNoglMFcplAJo2wUXL2dBoWf1kHNLpsMQ6pHHHvqp38c
	 /YmZwGKnU3ydlL1R9GGNfMhbuxdE0rp0lSQ1O1Rh90AV7AMtgQaMFAVtIS/YjlzDwG
	 dD/VFYtxX7ZwTSv98QBsWCqRkU1coSHAZ4WWuE20mSpdmbE3I5LPEA7zXhU8rlgIlG
	 K2qlgEGf4ztdQ==
Date: Mon, 17 Feb 2025 22:43:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v4 16/16] net: airoha: Introduce PPE debugfs
 support
Message-ID: <Z7Otj0v0PSKy8nSH@lore-desk>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
 <20250213-airoha-en7581-flowtable-offload-v4-16-b69ca16d74db@kernel.org>
 <20250217184416.GQ1615191@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wuYdrUezw6LFqrzk"
Content-Disposition: inline
In-Reply-To: <20250217184416.GQ1615191@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_134347_189248_80E94A16 
X-CRM114-Status: GOOD (  21.87  )
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


--wuYdrUezw6LFqrzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17, Simon Horman wrote:
> On Thu, Feb 13, 2025 at 04:34:35PM +0100, Lorenzo Bianconi wrote:
> > Similar to PPE support for Mediatek devices, introduce PPE debugfs
> > in order to dump binded and unbinded flows.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> ...
>=20
> > diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers=
/net/ethernet/airoha/airoha_ppe_debugfs.c
>=20
> ...
>=20
> > +static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *priva=
te,
> > +				       bool bind)
> > +{
> > +	static const char *const ppe_type_str[] =3D {
> > +		[PPE_PKT_TYPE_IPV4_HNAPT] =3D "IPv4 5T",
> > +		[PPE_PKT_TYPE_IPV4_ROUTE] =3D "IPv4 3T",
> > +		[PPE_PKT_TYPE_BRIDGE] =3D "L2B",
> > +		[PPE_PKT_TYPE_IPV4_DSLITE] =3D "DS-LITE",
> > +		[PPE_PKT_TYPE_IPV6_ROUTE_3T] =3D "IPv6 3T",
> > +		[PPE_PKT_TYPE_IPV6_ROUTE_5T] =3D "IPv6 5T",
> > +		[PPE_PKT_TYPE_IPV6_6RD] =3D "6RD",
> > +	};
> > +	static const char *const ppe_state_str[] =3D {
> > +		[AIROHA_FOE_STATE_INVALID] =3D "INV",
> > +		[AIROHA_FOE_STATE_UNBIND] =3D "UNB",
> > +		[AIROHA_FOE_STATE_BIND] =3D "BND",
> > +		[AIROHA_FOE_STATE_FIN] =3D "FIN",
> > +	};
> > +	struct airoha_ppe *ppe =3D m->private;
> > +	int i;
> > +
> > +	for (i =3D 0; i < PPE_NUM_ENTRIES; i++) {
> > +		const char *state_str, *type_str =3D "UNKNOWN";
> > +		u16 *src_port =3D NULL, *dest_port =3D NULL;
> > +		struct airoha_foe_mac_info_common *l2;
> > +		unsigned char h_source[ETH_ALEN] =3D {};
> > +		unsigned char h_dest[ETH_ALEN];
> > +		struct airoha_foe_entry *hwe;
> > +		u32 type, state, ib2, data;
> > +		void *src_addr, *dest_addr;
> > +		bool ipv6 =3D false;
> > +
> > +		hwe =3D airoha_ppe_foe_get_entry(ppe, i);
> > +		if (!hwe)
> > +			continue;
> > +
> > +		state =3D FIELD_GET(AIROHA_FOE_IB1_STATE, hwe->ib1);
> > +		if (!state)
> > +			continue;
> > +
> > +		if (bind && state !=3D AIROHA_FOE_STATE_BIND)
> > +			continue;
> > +
> > +		state_str =3D ppe_state_str[state % ARRAY_SIZE(ppe_state_str)];
> > +		type =3D FIELD_GET(AIROHA_FOE_IB1_PACKET_TYPE, hwe->ib1);
> > +		if (type < ARRAY_SIZE(ppe_type_str) && ppe_type_str[type])
> > +			type_str =3D ppe_type_str[type];
> > +
> > +		seq_printf(m, "%05x %s %7s", i, state_str, type_str);
> > +
> > +		switch (type) {
> > +		case PPE_PKT_TYPE_IPV4_HNAPT:
> > +		case PPE_PKT_TYPE_IPV4_DSLITE:
> > +			src_port =3D &hwe->ipv4.orig_tuple.src_port;
> > +			dest_port =3D &hwe->ipv4.orig_tuple.dest_port;
> > +			fallthrough;
> > +		case PPE_PKT_TYPE_IPV4_ROUTE:
> > +			src_addr =3D &hwe->ipv4.orig_tuple.src_ip;
> > +			dest_addr =3D &hwe->ipv4.orig_tuple.dest_ip;
> > +			break;
> > +		case PPE_PKT_TYPE_IPV6_ROUTE_5T:
> > +			src_port =3D &hwe->ipv6.src_port;
> > +			dest_port =3D &hwe->ipv6.dest_port;
> > +			fallthrough;
> > +		case PPE_PKT_TYPE_IPV6_ROUTE_3T:
> > +		case PPE_PKT_TYPE_IPV6_6RD:
> > +			src_addr =3D &hwe->ipv6.src_ip;
> > +			dest_addr =3D &hwe->ipv6.dest_ip;
> > +			ipv6 =3D true;
> > +			break;
> > +		}
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> Perhaps it can't happen, but if type is not one of the cases handled
> by the switch statement above then src_addr and dest_addr will
> be used while uninitialised by the call to airoha_debugfs_ppe_print_tuple=
()
> below.

ack, right. I will fix it in v6.

Regards,
Lorenzo

>=20
> Flagged by Smatch.
>=20
> > +
> > +		seq_puts(m, " orig=3D");
> > +		airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
> > +					       src_port, dest_port, ipv6);
> > +
> > +		switch (type) {
> > +		case PPE_PKT_TYPE_IPV4_HNAPT:
> > +		case PPE_PKT_TYPE_IPV4_DSLITE:
> > +			src_port =3D &hwe->ipv4.new_tuple.src_port;
> > +			dest_port =3D &hwe->ipv4.new_tuple.dest_port;
> > +			fallthrough;
> > +		case PPE_PKT_TYPE_IPV4_ROUTE:
> > +			src_addr =3D &hwe->ipv4.new_tuple.src_ip;
> > +			dest_addr =3D &hwe->ipv4.new_tuple.dest_ip;
> > +			seq_puts(m, " new=3D");
> > +			airoha_debugfs_ppe_print_tuple(m, src_addr, dest_addr,
> > +						       src_port, dest_port,
> > +						       ipv6);
> > +			break;
> > +		}
> > +
> > +		if (type >=3D PPE_PKT_TYPE_IPV6_ROUTE_3T) {
> > +			data =3D hwe->ipv6.data;
> > +			ib2 =3D hwe->ipv6.ib2;
> > +			l2 =3D &hwe->ipv6.l2;
> > +		} else {
> > +			data =3D hwe->ipv4.data;
> > +			ib2 =3D hwe->ipv4.ib2;
> > +			l2 =3D &hwe->ipv4.l2.common;
> > +			*((__be16 *)&h_source[4]) =3D
> > +				cpu_to_be16(hwe->ipv4.l2.src_mac_lo);
> > +		}
> > +
> > +		*((__be32 *)h_dest) =3D cpu_to_be32(l2->dest_mac_hi);
> > +		*((__be16 *)&h_dest[4]) =3D cpu_to_be16(l2->dest_mac_lo);
> > +		*((__be32 *)h_source) =3D cpu_to_be32(l2->src_mac_hi);
> > +
> > +		seq_printf(m, " eth=3D%pM->%pM etype=3D%04x data=3D%08x"
> > +			      " vlan=3D%d,%d ib1=3D%08x ib2=3D%08x\n",
> > +			   h_source, h_dest, l2->etype, data,
> > +			   l2->vlan1, l2->vlan2, hwe->ib1, ib2);
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> ...

--wuYdrUezw6LFqrzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7OtjwAKCRA6cBh0uS2t
rOPEAP9+/F0RFgMoQ0v35rX2VDR696DE6FoGDfgFuWkgme4QIwEAvv1IjrUHIdRu
8U1RB+R6NcBYpY09go8lwjjS2DAvAQE=
=kYTW
-----END PGP SIGNATURE-----

--wuYdrUezw6LFqrzk--

