Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0BBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 21:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6Zuc9nBtsAF5rvw642Tnqzo0PSeKI7DzfHaK9Cvsxc=; b=HU9dhj5vM8yDDXwhZYcw5r3XuV
	OROE6kxSjOPvYudkiDKHzyX7cvRWgh76FwbzjeaZ3k3Uz8ZPvMKMxXKWQ7IMCBjNlkvXxXoBIYTbI
	gMNFvzH0/CSdZM0LWvwuN//GDwvQlUFPC2kasWOPOYedNleTN777EL64PR6fKShHD4jB9ws6XguOS
	M4r6SQQl5vlFj5m+cNizHyK9fol7/S7wlCrjojOUvBWWabzRiDusYL4pL41zREFUCEb77U3N0FP7D
	Xm51RYDu4lB/KKddQwCwI4Ypk30UFtx1MrctsTFuDXLisHQqv/+oOHl9+y+oBXTcEPieNlKBjE8EK
	VPF0TdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyGt-00000000kyZ-2uxZ;
	Mon, 21 Jul 2025 21:42:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyCo-00000000kP5-1yYo;
	Mon, 21 Jul 2025 21:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55F52A55DD7;
	Mon, 21 Jul 2025 21:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845E0C4CEED;
	Mon, 21 Jul 2025 21:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753133873;
	bh=vux3ljHQL8fINu3c42OPgphrlmfOj/Zy4tR5XX6EUKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikMcdFsOXsniDPlwnCm9s0WBgVm7AhZSiIVBtQ2F2Wq/5Wx9q66k6m5aFWIcCS5Or
	 aVPwKoEGEbw8Ti2J2QNRUVdyh98CUdrBp6U4eMkRA7daYn90+b0ceqNQnHPGYacTAu
	 PokDc6V6oTuz3DGNfh040y59WIoQR7o0nAOPBRcACuLDGkkTg1y7RzMrkoE0jrfapZ
	 6V3oCj/fLFprr6w+etUoIzWIe2GyXcjcClF4OJuCvDpkvugGeWtbSkDwdxQJEs0Mn8
	 qSWcLjzdverDlDPda5J5hXKhnoqUbtxEPhJJeJrZngkgGMZi/eOlR0GbrFu8EZaNFF
	 yw/pi3FG4Or9w==
Date: Mon, 21 Jul 2025 23:37:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v4 1/7] dt-bindings: net: airoha: npu: Add
 memory regions used for wlan offload
Message-ID: <aH6zLo17TOSZID37@lore-desk>
References: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
 <20250717-airoha-en7581-wlan-offlaod-v4-1-6db178391ed2@kernel.org>
 <20250718-sceptical-blue-bird-7e96e3@kuoka>
 <aHoWY6iGN-lJnu60@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hDFEHIRXI0z6CbSS"
Content-Disposition: inline
In-Reply-To: <aHoWY6iGN-lJnu60@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143754_636195_DFED9AD1 
X-CRM114-Status: GOOD (  27.66  )
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


--hDFEHIRXI0z6CbSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > On Thu, Jul 17, 2025 at 08:57:42AM +0200, Lorenzo Bianconi wrote:
> > > Document memory regions used by Airoha EN7581 NPU for wlan traffic
> > > offloading. The brand new added memory regions do not introduce any
> > > backward compatibility issues since they will be used just to offload
> > > traffic to/from the MT76 wireless NIC and the MT76 probing will not f=
ail
> > > if these memory regions are not provide, it will just disable offload=
ing
> > > via the NPU module.
> >=20
> > That's not what I see entirely. I see the same problem I told you alrea=
dy.
> > of_reserved_mem_region_to_resource_byname returns error ->
> > airoha_npu_wlan_init_memory returns error -> your other patchset prints
> > big fat warning in mt7996_pci_probe().
>=20
> Is it ok to use dev_info() instead dev_warn() or do you prefer to complet=
ely
> remove the log?
>=20
> >=20
> > So all correct DTS now gets a warning. Warning is a state of failure,
> > even if probe proceeds.
> >=20
> > I don't understand why you can't make it fully optional, so also fully
> > backwards compatible.
>=20
> I am completely fine to make it fully optional, but can you please explain
> what you mean here with 'optional'?
>=20
> At the moment in mt76_npu_init() we first look for the "airoha,npu" prope=
rty
> in mt76 node to load the NPU pointer running airoha_npu_get():
>=20
> wifi@0,0 {
> 	compatible =3D "mediatek,mt76";
> 	...
> 	airoha,npu =3D <&npu>;
> 	...
> };

According to my understanding it is enough to get rid of the dev_warn() in =
the
MT76 series in order to avoid any backward compatibility issues. Am I wrong?
Moreover, we have the NPU phandle in the MT76 DTS node in order to check if=
 the
reserved-memory properties are mandatory or not (if the MT76 node is config=
ured
with the NPU phandle it is expected to have the reserved-memory properties =
properly
configured).
If my understanding is correct the NPU series does not require any change (=
the
only required change is in MT76 series). Since the current series is marked=
 as
"Changes Requested' in patchwork, do I need to repost?

Regards,
Lorenzo

>=20
> If this property is defined in the wifi node I guess it is fine to assume
> even the NPU memory regions are properly defined int the DTS.
>=20
> Is it ok to use dev_info() instead of dev_warn() in mt7996_pci_probe() if
> the mt76_npu_init() returns an error (e.g. if the "airoha,npu" is not def=
ined)
> or do you prefer to do something else to make this process optional?
>=20
> Regards,
> Lorenzo
>=20
> >=20
> > Best regards,
> > Krzysztof
> >=20



--hDFEHIRXI0z6CbSS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaH6zLgAKCRA6cBh0uS2t
rG2RAQCuL5YPTsDFkr426LnD5RkvUOkMsaYTElmnbIYT4uE1UAEA0n0KABJw+pOs
JmKHhsz291dIAM3tsXOOyatOEJIqFwc=
=83D7
-----END PGP SIGNATURE-----

--hDFEHIRXI0z6CbSS--

