Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1106C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FLJAhf+HrQPx1nb1Lq2j916SVxv3SASnYd4Z4gcWXQ=; b=A5kehDJVb/oKpdekEez11OHJaZ
	3717co2lJd7eosepUOWBtxCxtSJkm/g507GcibmFr4+sitGDuUIY0gPqse9UU/TPEqO+4GJ1AubCp
	XRkz11+4Jt4tKVuGhsQZAlgf5xY/d+x/JwM6codid1bcIMSKf6epVoPUlkIWtt1HaInoQcRpHqpzl
	tzCu9urQ7Ws2dvdoId4ZcXDKyVBVWKmrk1Mn/5ndo16QU6wT7XU0QDjBTYNutKpibu6wMSRRbjl05
	We/VL+q8DPju7ulUXAsBGdlOYPpSn4tMYYehNfqcchbmM67jMJ6ib1KEMy1+R2xjVeDTG21/QZ5Hv
	Iz0ELfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIle-00000005qFK-0jsY;
	Fri, 10 Jul 2026 21:28:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIlb-00000005qDv-1qme;
	Fri, 10 Jul 2026 21:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783718893;
	bh=/FLJAhf+HrQPx1nb1Lq2j916SVxv3SASnYd4Z4gcWXQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IlRps4195ioPuhR77He7Agm5J2N8mUoRfqy3CKrjQ/SPvZAm0BFKk7ynTzMekg9RB
	 y4/l+uUm/vsSAoEIx0sBmU7RsGuaQzg+UMSi2WMLM7glUU7i3uFzCMpghPZC5grOSW
	 SlmQ4hnbLd1BXXQr6Te/xmt+7kiEtMZaeR2x67gkOMoUXe/t3Nrvceh8XRKYG3rBYf
	 xYweIL8xRJjpIKIY116SkqXE90cIbxVjESQlpOd+1n47WRxEJ2wl6Uy5X4kdmUnzNO
	 Rrq6mSe2KPkWy66YPKLZW4zdrwkYMzAzHxZilxeiegwFf79W+L7IPjJg2GtqRlmmC+
	 ubsVW08qV+jRQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67A0F17E07A2;
	Fri, 10 Jul 2026 23:28:11 +0200 (CEST)
Message-ID: <8eed484696b34d828d7df92557c30ae5a6343e80.camel@collabora.com>
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, Paul Elder	
 <paul.elder@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, 	laurent.pinchart@ideasonboard.com
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com, 
	dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
 sakari.ailus@linux.intel.com
Date: Fri, 10 Jul 2026 17:28:10 -0400
In-Reply-To: <a6a32617-f3c9-4cf2-b020-daecf7ec18f1@collabora.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
	 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
	 <178229758404.3075020.12553514371020830845@ping.linuxembedded.co.uk>
	 <178237578321.292172.5229006087283359591@neptunite.rasen.tech>
	 <a6a32617-f3c9-4cf2-b020-daecf7ec18f1@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-gw40z93wvCRsLGCi92mT"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_142815_657550_25A9A39B 
X-CRM114-Status: GOOD (  24.27  )
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


--=-gw40z93wvCRsLGCi92mT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 juillet 2026 =C3=A0 22:42 +0200, Michael Riesch a =C3=A9crit=
=C2=A0:
> Hi Paul,
>=20
> On 6/25/26 10:23, Paul Elder wrote:
> > [...]
> > > > +// TODO figure out locking for when multiple drivers touch the med=
ia graph;
> > > > +// maybe macros for shared versions?
> > >=20
> > > Do you mean for when drivers are trying to change link state directly=
?
> >=20
> > I meant for all the operations that act on media device. I'm not sure w=
hat
> > there is because I didn't really find anything significant, and I found=
 some
> > action point from some meeting notes somewhere that said "deprecate med=
ia_ops"
> > (not assigned to me) so...
>=20
> Oh yes, for some reason this ball ended up in our side of the field. But
> actually I think the media_ops are not much of an issue, as you don't
> set them when you create the shared media device. Problem solved, right?

If we effectively don't need them in any drivers using shared context, let'=
s
find a place to add a BUG_ON.

Nicolas

>=20
> > If there aren't any then it's a non-issue, but if there are then I was
> > wondering if we need to return the shared media device to the driver (a=
s
> > opposed to a non-shared regular media device) and use shared versions o=
f media
> > device functions that have locking.
>=20
> +1
> I would recommend that just to be on the safe side. And I think I would
> make the shared media device an opaque pointer to make sure that there
> won't be any monkey business.
>=20
> Thanks and best regards,
> Michael
>=20
> >=20
> > >=20
> > > > +struct media_device_shared {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct media_device mdev;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head members;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head links;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head list;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kref refcount;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *removed_device=
;
> > > > +};
> > > > +[...]

--=-gw40z93wvCRsLGCi92mT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFj6gAKCRDZQZRRKWBy
9JLiAP0UOyPyCM16q6zkWSDCSo9l3pmjTa8NL/r1+uhhmnE//gD/ak5D1OcaSFHo
5DM87seeiJSgCkDLAviyDaSDng88TQk=
=n4/E
-----END PGP SIGNATURE-----

--=-gw40z93wvCRsLGCi92mT--

