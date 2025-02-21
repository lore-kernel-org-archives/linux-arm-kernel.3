Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9624AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwGaWXHhQHmpp+8YimtJQkbVyBouNYjRbDtM3LP68+U=; b=dBqTTWjyyBWK7JZgOTFMaOlR6a
	d8xhUPc95LX3n7/tYh+v1GydK8zC9tFN7SNcZPjWDgv1jMCS1cuAlRYbISxXzWjV4AROemKFfPGUY
	zeMeK78GhtYC6Ihk3w4ApKctIcyYuWGiBgYrn0FMWk/GpHLoOaefC3tAb41JF0vUluax1SVlY2uWJ
	3+1ah+US6AjGKQDQjKWDuoxudkeRDcxixDzxMrxdxL6vhJfAdgbNvcrs1hTLa4PwRsMxxxbEWK/di
	MO0pLrHweKbhzGYm1GZ/ENPj6EDlHuiOVMcVymtOFatWhv4S1O7oF7172W6aV6fyD4MwdvJEoG+bk
	p5r8q6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQO1-00000005CSe-3Uwx;
	Fri, 21 Feb 2025 10:36:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQAI-00000005A04-0hVT;
	Fri, 21 Feb 2025 10:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 713FF61189;
	Fri, 21 Feb 2025 10:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CB3C4CED6;
	Fri, 21 Feb 2025 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133309;
	bh=XGK2u8TzDSVYk6sYqHcLEUtV1chH/9Nf1/m1rp6PLFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvcUqRO/wdyzQqZ5+SB544WaloOOKDZNuHTBCKvW+7CKs50oi/U8PLV45rCydbztx
	 eI03a66HfPq+gU/kWT3snjZAMEzAdno1YL2FwkdFu79HZY60KB2YVpGSd7lH05mpfq
	 NEOHRSOBFjmBUin5DC+CUoLSCFl1pNq+hwQGu4bJSC/TZnd1VJeFJ5+Nkq/anr72XT
	 Srd42611UD0zqqp3wNGozkxmgbOhJEvmsPB6lJf0UDrGa6yfMdgLE4xos9FNIm0eyj
	 739Y04BzEU5Zc5miWg53unjJMXGzla/6gHq6nZvheOQXrmMBKyUwu56ZJ9n9q7Efib
	 4TjYeFeJhLMuw==
Date: Fri, 21 Feb 2025 11:21:46 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH net-next v5 12/15] net: airoha: Introduce Airoha NPU
 support
Message-ID: <Z7hTujrG-zOiBcZe@lore-desk>
References: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
 <20250217-airoha-en7581-flowtable-offload-v5-12-28be901cb735@kernel.org>
 <20250220143839.5ea18735@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RxJWLYxefS/CP3b0"
Content-Disposition: inline
In-Reply-To: <20250220143839.5ea18735@kernel.org>
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


--RxJWLYxefS/CP3b0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 20, Jakub Kicinski wrote:
> On Mon, 17 Feb 2025 14:01:16 +0100 Lorenzo Bianconi wrote:
> > +static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> > +			       void *p, int size)
> > +{
> > +	u16 core =3D 0; /* FIXME */
> > +	u32 val, offset =3D core << 4;
> > +	dma_addr_t dma_addr;
> > +	void *addr;
> > +	int ret;
> > +
> > +	addr =3D kzalloc(size, GFP_ATOMIC | GFP_DMA);
>=20
> You need the actual "zone DMA" memory from ISA times?
> I think that's what GFP_DMA is for. Any kmalloc'd memory
> can be DMA'ed to/from.

ack, I agree. We can drop it. I will fix it in v6.

>=20
> > +	if (dma_set_coherent_mask(dev, 0xbfffffff))
>=20
> Coherent mask is not contiguous on purpose?
> Quick grep reveals no such cases at present, not sure if it works.
> Maybe add a comment, at least ?

Ack, right. I think it is wrong. I will fix it in v6.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--RxJWLYxefS/CP3b0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7hTugAKCRA6cBh0uS2t
rANTAQDEQ8k7BX7x63iA2wmUooQvqpv1wCUZnNUKVcwf10KapgEAwCZGXymtR/Vg
ssK3jSJEkoXsWRojYyqODeH7VvJcfgA=
=KhfQ
-----END PGP SIGNATURE-----

--RxJWLYxefS/CP3b0--

