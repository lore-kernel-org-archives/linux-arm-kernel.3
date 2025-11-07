Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B459CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk5OfZS4JLmgRhgsvjlhaRVTQhIGVSqHJQeTx0J3LiA=; b=DWxXpLsu5lqkuBg/y8vRkBspkO
	PayA5UxtsHzHmwDYH49J8oMNsWdGivz5yso8lydUlrFyNFYGv3ikRuXNKrvNS/ntYjcAJ1kBKT7+t
	gqkKvvtuHpou8R2Fr3T/k+5R7JIRjAu+XJhb8j2aLutyeurp2u3n289ZRqh/p7+r0/jU0WZ3dwTcS
	E71Uj6Kb58YTjEy1D/4WH6E3Rl8eprjAaHMoyBbQodSYUNchqF+Or/uJaxX69X4gxihpkWryCpQrE
	jP1bra9WsqGMCitQrA1HCBk+otbL/fKCgRLy9ATj4Zq+B4G4ydORhqgdqyDkUBWZXD4bt99s8loKS
	WfiWpJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMXY-0000000HPHb-0q3n;
	Fri, 07 Nov 2025 13:30:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMXW-0000000HPGm-2d6Y;
	Fri, 07 Nov 2025 13:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 483B361904;
	Fri,  7 Nov 2025 13:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBECC4CEF7;
	Fri,  7 Nov 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762522205;
	bh=ayKu6qJSzYXCMxqqx8+O/4F+Us8bRURTI3A5cDLYypM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcqrujjBziW2PnvjdzfKWfsqY1cKDz8qMBny0eqYuge1EUE++z4ZhTutoDCsjA94n
	 KkiSqfoFGO4WfZXdFy8weoDhV+xXAnay9BLKUeO+7PKRwt6E8gydq6tTYoI3K3lDer
	 9nWaOGAv/rWit2dT4Xo1tFkNRgDRAhrv4bPDhNdF8ntAK2J53etURMCQYizPMR8qT8
	 csdH8NFU/wPa+btDAlr2avZwcem3bXmBB9emaTc3kTfl3hguiSh2sKHSwXacic7jTn
	 bOhPZlS04R0XcFZhHDWHoCJFjWhPWZ0ZdF9RKoVtj5eXxkaiQqleEPrvT+iKR+DRfY
	 A+Lyy9rTz1X7Q==
Date: Fri, 7 Nov 2025 14:30:02 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add TCP LRO support
Message-ID: <aQ30WmbN_O60vEzl@lore-desk>
References: <20250610-airoha-eth-lro-v1-1-3b128c407fd8@kernel.org>
 <CANn89iJsNWkWzAJbOvaBNjozuLOQBcpVo1bnvfeGq5Zm6h9e=Q@mail.gmail.com>
 <aEg1lvstEFgiZST1@lore-rh-laptop>
 <20250611173626.54f2cf58@kernel.org>
 <aEtAZq8Th7nOdakk@lore-rh-laptop>
 <20250612155721.4bb76ab1@kernel.org>
 <aFATYATliil63D5R@lore-desk>
 <aQR2Z51Q45Zl99m_@lore-desk>
 <20251031111641.08471c44@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IjyweC8QavTyUWhR"
Content-Disposition: inline
In-Reply-To: <20251031111641.08471c44@kernel.org>
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


--IjyweC8QavTyUWhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 31 Oct 2025 09:42:15 +0100 Lorenzo Bianconi wrote:
> > > > Hm, truesize is the buffer size, right? If the driver allocated n b=
ytes
> > > > of memory for packets it sent up the stack, the truesizes of the sk=
bs
> > > > it generated must add up to approximately n bytes. =20
> > >=20
> > > With 'truesize' I am referring to the real data size contained in the=
 x-order
> > > page returned by the hw. If this size is small, I was thinking to jus=
t allocate
> > > a skb for it, copy the data from the x-order page into it and re-inse=
rt the
> > > x-order page into the page_pool running page_pool_put_full_page().
> > > Let me do some tests with order-2 page to see if the GRO can compensa=
te the
> > > reduced page size. =20
> >=20
> > Sorry for the late reply about this item.
> > I carried out some comparison tests between GRO-only and GRO+LRO with o=
rder-2
> > pages [0]. The system is using a 2.5Gbps link. The device is receiving =
a single TCP
> > stream. MTU is set to 1500B.
> >=20
> > - GRO only:			~1.6Gbps
> > - GRO+LRO (order-2 pages):	~2.1Gbps
> >=20
> > In both cases we can't reach the line-rate. Do you think the difference=
 can justify
> > the hw LRO support? Thanks in advance.
> > =20
> > [0] the hw LRO requires contiguous memory pages to work. I reduced the =
size to
> > order-2 from order-5 (original implementation).
>=20
> I think we're mostly advising about real world implications of=20
> the approach rather than nacking. I can't say for sure if potentially
> terrible skb->len/skb->truesize ratio will matter for a router
> application. Maybe not.
>=20
> BTW is the device doing header-data split or the LRO frame has headers
> and payload in a single buffer?

According to my understanding the hw LRO is limited to a single order-x page
containing both the headers and the payload (the hw LRO module is not capab=
le
of splitting the aggregated TCP segment over multiple pages).
What we could do is disable hw LRO by default and feed hw rx queues with
order-0 pages (current implementation). If the user enables hw LRO, we will
free order-0 pages linked to the rx DMA descriptors and allocate order-x pa=
ges
(e.g. order-2) for hw LRO queues. Disabling hw LRO will switch back to orde=
r-0
pages.

Regards,
Lorenzo

--IjyweC8QavTyUWhR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQ30WgAKCRA6cBh0uS2t
rGZOAP9M9uVRlJXXgPl6G+OORxGKlgdXBTOwtW4DApLOp26PCAEAl8At5F9pJxhs
BkRGi+/l6PhGdLpVmqI64CnAKZ+btwE=
=OyjG
-----END PGP SIGNATURE-----

--IjyweC8QavTyUWhR--

