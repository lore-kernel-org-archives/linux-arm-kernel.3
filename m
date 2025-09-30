Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131D1CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK7IzL1Zeq/fJP4hvapyJAwCkjX9uv/grEB82ocyfBY=; b=EuMDfNUMqGInaqj3RjCpkZkRxG
	pKqkvWjmvQ2dnmLKNEP8oesinWgUcHk2hbdS2bWSXdLGNa1J6I1ORPafTdT9oIozCSKZ9lPtjVg0Y
	39xM7dOc8bi5WjsMo130dSbLz7ZmtOhF0i5idlMHdAg5qv8WDqjIaYI/N1gXcpl4CQw9cqgZyAiFy
	fgNNDh0do+sNEEUKKkz3jFgUK1zRad0LJ0Q1kBEREsEfS7qtSGH8ItVyH0CsE2soMFYwa1dFzDqJq
	DTU3OjOJPlnyfMZY3XBtOCsUxEl86PiyJi7sOtMtGVOQTBwwsfBxSA99BIN9gYT2B/9226xlrzuXi
	ipaGJ/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Zw0-00000005Kpo-0HVn;
	Tue, 30 Sep 2025 12:58:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Zvx-00000005KoC-1wCI;
	Tue, 30 Sep 2025 12:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759237097;
	bh=RK7IzL1Zeq/fJP4hvapyJAwCkjX9uv/grEB82ocyfBY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gcYdA31z3d8lq1Z+J4heKJjd3YHupC16bCknHdbE//P24BpkKFtBvcBap+Y5TivUM
	 PIbnRy3tuyWV6OOpNx9Vky7JOar0NAh3GgPZRNDDhxT0nHX0zPr/nSjVEk7MyPTJr5
	 7LsNdRFaov8ohJVsCKD0auKP+cmLvvU3Y9KYIFXnC3t+vUg+KrVkxaAY/fmXpwH/kz
	 xo7/4oKSVpXOfOHTH4vEmWAw89TFR5up42x0/At7HOJTo2MkSg3wdVMplSX0tZptkm
	 Sm6B6sozNSU3eDguDfCV2b/LQ0gA/RUoyc5Un1w+PDQgD0EQXOkeaK7SD2HPPY4byi
	 J3j6JaZxi7AGg==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1196917E0154;
	Tue, 30 Sep 2025 14:58:15 +0200 (CEST)
Message-ID: <2efcfe19bafd1276e9fc71b72e251443f313d693.camel@collabora.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: Anthony McGivern <Anthony.McGivern@arm.com>, 
 "bcm-kernel-feedback-list@broadcom.com"	
 <bcm-kernel-feedback-list@broadcom.com>, "florian.fainelli@broadcom.com"	
 <florian.fainelli@broadcom.com>, "hverkuil@kernel.org"
 <hverkuil@kernel.org>,  "kernel-list@raspberrypi.com"	
 <kernel-list@raspberrypi.com>, "Kieran Bingham
 (kieran.bingham@ideasonboard.com)"	 <kieran.bingham@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "linux-rpi-kernel@lists.infradead.org"	
 <linux-rpi-kernel@lists.infradead.org>, "m.szyprowski@samsung.com"	
 <m.szyprowski@samsung.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sakari.ailus@linux.intel.com"	 <sakari.ailus@linux.intel.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>, 
 "tomi.valkeinen@ideasonboard.com"	 <tomi.valkeinen@ideasonboard.com>
Date: Tue, 30 Sep 2025 08:58:13 -0400
In-Reply-To: <20250930101626.GE25784@pendragon.ideasonboard.com>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
	 <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
	 <20250930101626.GE25784@pendragon.ideasonboard.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-0L4H1CrQYwSEJYFcjhYv"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_055821_854114_76DBE850 
X-CRM114-Status: GOOD (  28.44  )
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


--=-0L4H1CrQYwSEJYFcjhYv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Le mardi 30 septembre 2025 =C3=A0 13:16 +0300, Laurent Pinchart a =C3=A9cri=
t=C2=A0:
> On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
> > On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
> > > On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
> > > > Introduce a new type in v4l2 subdev that represents a v4l2 subdevic=
e
> > > > contex. It extends 'struct media_entity_context' and is intended to=
 be
> > > > extended by drivers that can store driver-specific information
> > > > in their derived types.
> > > >=20
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >=20
> > > I am interested in how the sub-device context will handle the
> > > Streams API? Looking at the commits the
> > > v4l2_subdev_enable/disable_streams functions still appear to operate
> > > on the main sub-device only. I take it we would have additional
> > > context-aware functions here that can fetch the subdev state from
> > > the sub-device context, though I imagine some fields will have to be
> > > moved into the context such as s_stream_enabled, or even
> > > enabled_pads for non stream-aware drivers?
> >=20
> > mmm good question, I admit I might have not considered that part yet.
> >=20
> > Streams API should go in a soon as Sakari's long awaited series hits
> > mainline, and I will certainly need to rebase soon, so I'll probably
> > get back to this.
> >=20
> > Have you any idea about how this should be designed ?
>=20
> Multi-context is designed for memory to memory pipelines, as inline
> pipelines can't be time-multiplexed (at least not without very specific
> hardware designs that I haven't encountered in SoCs so far). In a

I probably don't understand what you mean here, since I know you are well a=
ware
of the ISP design on RK3588. It has two cores, which allow handling up to 2
sensors inline, but once you need more stream, you should have a way to
reconfigure the pipeline and use one or both cores in a m2m (multi-context)
fashion to extend its capability (balancing the resolutions and rate as usu=
al).

Perhaps you mean this specific case is already covered by the stream API
combined with other floating proposal ? I think most of us our missing the =
big
picture and just see organic proposals toward goals documented as un-relate=
d,
but that actually looks related.

Nicolas

> memory-to-memory pipeline I expect the .enable/disable_streams()
> operation to not do much, as the entities in the pipeline operate based
> on buffers being queued on the input and output video devices. We may
> still need to support this in the multi-context framework, depending on
> the needs of drivers.
>=20
> Anthony, could you perhaps share some information about the pipeline
> you're envisioning and the type of subdev that you think would cause
> concerns ?

--=-0L4H1CrQYwSEJYFcjhYv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaNvT5QAKCRDZQZRRKWBy
9H2OAQDYJU61T/0h1wzEwZ7iddu/tUyOjwcMugwELYj4l1qfdQEArPd23oj/vi4j
GiESd5rvRJN2+qKwpQh3Nn1Jvkrefgo=
=mobG
-----END PGP SIGNATURE-----

--=-0L4H1CrQYwSEJYFcjhYv--

