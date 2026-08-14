Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0FC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcLA+9NxXaZ0Z8qAWG9RrfMqZWDWTvs48FyXhXFFOCg=; b=iLmNq8bIA8s35cdEm5v7+hdJHd
	kww3ard0tmPcYX3qXqxQlFSE6+hlRL/Yr5wcp8LX2ay2DuzjTXKIb3pKfBTVjNXYBvd2IoBuiRPlP
	q+xmwr9WFJTM4J+RwAVtEVSATUF5na7CeY9i4p8bSr3x7mPuDRYtSbVoY5le4nJttY9In5VZV0Asc
	8KFKok5SjkSEY61l+XO4xY1zspvSO7HlwzUdQya1u62sfsXJh+9Dd+OoITZpqo4uoKhTUVdStrAO3
	fnDu14b/1wjMp+7wXCnGRwRCeYFSlr/MIAaganjGes3Rel5A3TDE0J5v67sR2k56vWgh+YuL1KEhi
	XZii3QXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuswm-00000002nTk-2XVg;
	Fri, 14 Aug 2026 14:31:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuswk-00000002nTI-2eQT;
	Fri, 14 Aug 2026 14:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786717902;
	bh=OcLA+9NxXaZ0Z8qAWG9RrfMqZWDWTvs48FyXhXFFOCg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pfUKVYmbkxlA+SMcEC8ybrcIQqZtCcqxkwdD4V+FUYhiI2NHNLPCg+n18pYPmf7CN
	 g6CISMdt6CDVXaBKviCpMUoXDjyx6YdG3u/oSCsc4SSXvioxGl0ADHjxP7apIUmz6W
	 8EIZDrCsa3vR1aq9Ot2u8zgQ2jZFh0GjiHZFxPHcU3Ymc2kUvXNiNoqEnnXqLxiai6
	 UqjulyZxOj3rl6/shuSU0DLi3oUNlIs0RKMXKcOfgn1jthZdJS/GvZjtKLwHmKEByF
	 GrWyw2zbA8vVSoY/ffcom4AJCqtOTVO7nWjCyaFQt8/lN64ighUUkHTqh9qQVFH756
	 UZZI+qsDcohRQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB00617E07B5;
	Fri, 14 Aug 2026 16:31:38 +0200 (CEST)
Message-ID: <dcb6ecbd6184c01861c7d36068abb266df4587c5.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "fshao@chromium.org"	 <fshao@chromium.org>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=	 <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "fanwu01@zju.edu.cn"	
 <fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"	
 <jacopo.mondi@ideasonboard.com>, "haoxiang_li2024@163.com"	
 <haoxiang_li2024@163.com>, "tfiga@chromium.org" <tfiga@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=	
 <Andrew-CT.Chen@mediatek.com>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "ribalda@chromium.org"
 <ribalda@chromium.org>,  "wenst@chromium.org"	 <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "kees@kernel.org" <kees@kernel.org>,  "rongqianfeng@vivo.com"	
 <rongqianfeng@vivo.com>, Irui Wang =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?=	
 <Irui.Wang@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=	
 <tiffany.lin@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "benjamin.gaignard@collabora.com"	
 <benjamin.gaignard@collabora.com>, "matthias.bgg@gmail.com"	
 <matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "sebastian.fricke@collabora.com"	 <sebastian.fricke@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, 
 "laurent.pinchart+renesas@ideasonboard.com"	
 <laurent.pinchart+renesas@ideasonboard.com>, "hverkuil+cisco@kernel.org"	
 <hverkuil+cisco@kernel.org>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Date: Fri, 14 Aug 2026 10:31:37 -0400
In-Reply-To: <44d9ec5c5f856b378f745fae8bd60aa4730df044.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
		 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
		 <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
		 <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
		 <c8ab26c2edfa4ee4fbbb83faf5f54547f252464f.camel@collabora.com>
	 <44d9ec5c5f856b378f745fae8bd60aa4730df044.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-1Pa9FEAnN6BDVnhiPDGq"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_073146_835593_3B8DE3EE 
X-CRM114-Status: GOOD (  18.58  )
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


--=-1Pa9FEAnN6BDVnhiPDGq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 14 ao=C3=BBt 2026 =C3=A0 02:38 +0000, Kyrie Wu (=E5=90=B4=E6=99=
=97) a =C3=A9crit=C2=A0:
> On Tue, 2026-08-11 at 16:22 -0400, Nicolas Dufresne wrote:
> > Hi Kyrie,
> >=20
> > Le lundi 10 ao=C3=BBt 2026 =C3=A0 03:05 +0000, Kyrie Wu (=E5=90=B4=E6=
=99=97) a =C3=A9crit=C2=A0:
> > > I agree. Since the platform data is introduced in the MT8189 patch
> > > series, I will move fw_type to the platform data and make
> > > mtk_vcodec_dec_get_chip_name() derive the chip identifier from it
> > > in
> > > the MT8189 series.
> >=20
> > I'm not sure I have captured the plan correctly. Would you mind
> > clarifying ?
> >=20
> > Nicolas
>=20
> Hi Nicolas,
>=20
> Sorry, my previous reply was unclear.
>=20
> The platform-data refactoring will be included in the next revision of
> the MT8189 series. That series depends on the updated MT8196 encoder
> series, so I need to wait for the new MT8196 encoder revision to be
> posted before I can rebase and send the updated MT8189 series.
>=20
> In the updated MT8189 series, `fw_type` and the chip identifier will be
> set in the platform data for each compatible, rather than being derived
> by probing DT properties. Consequently, the DT-property-based selection
> shown in this patch will be removed.
>=20
> I will make this dependency explicit in the cover letter. Sorry again
> for not explaining the plan clearly.

Thanks, this will be helpful to handle follow-up series.

Nicolas

>=20
> Best regards,
> Kyrie

--=-1Pa9FEAnN6BDVnhiPDGq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCan8myQAKCRDZQZRRKWBy
9AjrAP47W1O0MlybGV5nddQLSeB987/IQrb90AsBaMHCuSPMNwEAqHnDqWue4hCg
bIF5omk88zNifV9lAU/7JgU1KPCuiAU=
=bcq9
-----END PGP SIGNATURE-----

--=-1Pa9FEAnN6BDVnhiPDGq--

