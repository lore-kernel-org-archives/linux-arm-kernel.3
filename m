Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89005C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNtHvKbNGd7S/FDxlX6GLzDuGpZNFkHJSzYPKzyRdM0=; b=DhgM1ejlAY7VP3OKtggwHQMAjN
	JG0DbrpMiVDgnkMQ3KifJz99Ax3bQHDPKW2ICYQCSfCb/3gpKm/S0V2ymz1ZZLsOAZiKGsbc4+d6P
	h8BnFOCwIXPvosX3V8OljbSskdyUfeX8S53x9zwJ6Vhe0xBSuQJULICcqDwnXZgO76xW6ipP4Kcet
	MHbL3BjIZ5CunUlSiJ+PVd8i9mYNnXBZ7921fF5L0iMub78n/ocSCuqrlHodgEj9UTjFZIanAEtej
	cIhWRunTwfT5053gj45+mJ+u51sP+pdph7+uBsunVoIsEEA0pWasBaxxJG+HjYlgs0sOFi98/NM7I
	cd5+/WMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufx0H-0000000CWCF-2vfC;
	Sun, 27 Jul 2025 08:45:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufwxk-0000000CW35-2t5K;
	Sun, 27 Jul 2025 08:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBC265C5597;
	Sun, 27 Jul 2025 08:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BB3C4CEEB;
	Sun, 27 Jul 2025 08:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753605749;
	bh=1FBsq3RJo4viUjTTcy8YHS5y2gw/+JTmgv3W+/1sNcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DkGPnJijKVgVkPNWynxQoXYQPWllTcSUGGm1qWoE2LkOL7WW0DJemmcv9Sj6aSeQl
	 2ytVgW4bGL8CsGWfW+FIx/I8QYszufxSMK8hh0Ah0BnOMX+sHtXUwXDxRHTen1yKgk
	 Py/RDpfVRcdEaWqIq4GLu2tahKmAaJ8FwgqL2ewnWQp2gdFG+HzdcUZ+XAedM0xRYG
	 mXiiB0FSelfP5TrkzMo0oHwChQ/NCqmBmmq3Oqx94WNz042sqzXVttjVubxMfEq2/n
	 3hgDKXKo1WrAMyBMu5RDFezLkTt1rf6WPI8Qhm1J2sDUnUHZRW2DIkEW9eLEmiemqT
	 PDPtR5mqBBWZA==
Date: Sun, 27 Jul 2025 10:42:25 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v5 3/7] net: airoha: npu: Add
 wlan_{send,get}_msg NPU callbacks
Message-ID: <aIXmcUCQe7-gm9--@lore-desk>
References: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
 <20250723-airoha-en7581-wlan-offlaod-v5-3-da92e0f8c497@kernel.org>
 <ff106cec-7e63-4475-a0e6-452bfcb823b3@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KcwatzaRMwMSfQy/"
Content-Disposition: inline
In-Reply-To: <ff106cec-7e63-4475-a0e6-452bfcb823b3@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_014232_814994_D9924203 
X-CRM114-Status: GOOD (  19.13  )
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


--KcwatzaRMwMSfQy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 23/07/2025 18:19, Lorenzo Bianconi wrote:
> > Introduce wlan_send_msg() and wlan_get_msg() NPU wlan callbacks used
> > by the wlan driver (MT76) to initialize NPU module registers in order to
> > offload wireless-wired traffic.
> > This is a preliminary patch to enable wlan flowtable offload for EN7581
> > SoC with MT76 driver.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >   drivers/net/ethernet/airoha/airoha_npu.c | 58 +++++++++++++++++++++++=
+++++++++
> >   drivers/net/ethernet/airoha/airoha_npu.h | 21 ++++++++++++
> >   2 files changed, 79 insertions(+)
> >=20
>=20
> [...]
>=20
> > @@ -131,6 +147,12 @@ struct wlan_mbox_data {
> >   	u32 func_id;
> >   	union {
> >   		u32 data;
> > +		struct {
> > +			u32 dir;
> > +			u32 in_counter_addr;
> > +			u32 out_status_addr;
> > +			u32 out_counter_addr;
> > +		} txrx_addr;
> >   		u8 stats[WLAN_MAX_STATS_SIZE];
> >   	};
> >   };
> > @@ -424,6 +446,30 @@ static int airoha_npu_wlan_msg_send(struct airoha_=
npu *npu, int ifindex,
> >   	return err;
> >   }
> > +static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
> > +				   enum airoha_npu_wlan_get_cmd func_id,
> > +				   u32 *data, gfp_t gfp)
> > +{
> > +	struct wlan_mbox_data *wlan_data;
> > +	int err;
> > +
> > +	wlan_data =3D kzalloc(sizeof(*wlan_data), gfp);
> > +	if (!wlan_data)
> > +		return -ENOMEM;
> > +
> > +	wlan_data->ifindex =3D ifindex;
> > +	wlan_data->func_type =3D NPU_OP_GET;
> > +	wlan_data->func_id =3D func_id;
> > +
> > +	err =3D airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
> > +				  sizeof(*wlan_data));
> > +	if (!err)
> > +		*data =3D wlan_data->data;
> > +	kfree(wlan_data);
> > +
> > +	return err;
> > +}
>=20
> Am I reading it correct, that on message_get you allocate 4408 + 8 byte,
> setting it 0, then reallocate the same size in airoha_npu_send_msg() and
> copy the data, and then free both buffers, and this is all done just to
> get u32 value back?

ack, right. This is was the original approach in the vendor sdk.
I will fix in v6.

Regards,
Lorenzo


--KcwatzaRMwMSfQy/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaIXmcQAKCRA6cBh0uS2t
rFrAAP4yzHsHYDp6pps4peenrqug/hiwFirsQerZGdFYZscxxgD/ZPuKL0EPUbb9
du8EkSKxgOkHAkO0SUXlzjl0Dc4R+Q8=
=TBNx
-----END PGP SIGNATURE-----

--KcwatzaRMwMSfQy/--

