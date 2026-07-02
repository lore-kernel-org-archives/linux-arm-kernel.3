Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21439C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNS4tqccb04+QtS0h43Z588lZs7oUTCl9VD/wpTFlbQ=; b=41W7E59vZ4QB2RMZC6bhLmoFLb
	UWyDwf818gc15K83z1tj40H61BGfCsWQjioCZLn3Ql0x2xc+dzC/NZrbuUDmfGHo8sa3ZZMjrxaq2
	CK2cVDrWkUQhvhgaCMDb/aLx3cfcvax7sXqrWPH24Gp36FUHWbeP6X+ze4X9YmXFMMXi2QxFMgffd
	D+SqQj5Eccqti9NODdXCLwJ4D2qE16BOQfw/UaOiF1JHnbRniHcKP1A1vDZiucO+GqDNwvva+z6GW
	nRPRcQdhtKcHaphilEva/ZRP+diyNoCTwnXgYFQhL3u8UwJVZpY3hcFsHesjtseQWfTKjkfiJCinC
	nrxKoXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMZP-00000005IOg-3dbN;
	Thu, 02 Jul 2026 18:55:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMZO-00000005IOK-1flp;
	Thu, 02 Jul 2026 18:55:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62880601CF;
	Thu,  2 Jul 2026 18:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB9B1F000E9;
	Thu,  2 Jul 2026 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783018529;
	bh=fNS4tqccb04+QtS0h43Z588lZs7oUTCl9VD/wpTFlbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NacNS6bg/nGPS5YUVw5jH76wz5YShTWSyyE8s+P9wfrl2yzgf4tTqcvZHd84S/7Dg
	 DDaRntRlSXAQmnWC9ElrOfi+TuWSbnb7FQi3I4Te4lO1VsC4K6hrneeJsRSTr2B5hG
	 v60VUaXomKc6i8I8XKVWIzjnJsOPFhn0XrSMskbWikxlCGMT2LKUKUChoG6CXUGT5h
	 koccK0yAKwj+292C599zTt87zjQ+SsCFkTAFkjKlxCEFClwz47A+xtLqXaKv6pEn3h
	 51yzH/sYvncroPFkvHbxw8GTs8sxwIWGve6jNtawVKeMepHRu8pziEf52iuZ80c7LE
	 4SHH3bL6VawbA==
Date: Thu, 2 Jul 2026 19:55:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Kyrie Wu =?utf-8?B?KOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Irui Wang =?utf-8?B?KOeOi+eRnik=?= <Irui.Wang@mediatek.com>,
	"rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	"tzungbi@kernel.org" <tzungbi@kernel.org>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"haoxiang_li2024@163.com" <haoxiang_li2024@163.com>,
	"ribalda@chromium.org" <ribalda@chromium.org>,
	Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Andrew-CT Chen =?utf-8?B?KOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20260702-parlor-disband-fdc2f049336c@spud>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
 <20260603084045.17488-12-kyrie.wu@mediatek.com>
 <20260603-pentagram-unleveled-8729d0003aa7@spud>
 <6cb7ae4a09d476a04ceefca50564646712ad391b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JdEKl3bSogEo/Lcd"
Content-Disposition: inline
In-Reply-To: <6cb7ae4a09d476a04ceefca50564646712ad391b.camel@mediatek.com>
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

--JdEKl3bSogEo/Lcd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 05:39:24AM +0000, Kyrie Wu (=E5=90=B4=E6=99=97) wro=
te:
> On Wed, 2026-06-03 at 17:14 +0100, Conor Dooley wrote:
> > On Wed, Jun 03, 2026 at 04:40:41PM +0800, Kyrie Wu wrote:
> > > From: Yunfei Dong <yunfei.dong@mediatek.com>
> > >=20
> > > The MT8196 decoder differs from previous generations in several
> > > key aspects, most notably in its use of VCP instead of SCP.
> > > Additionally, the MT8196 enhances codec capabilities by supporting
> > > HEVC Main10 profile decoding. To accommodate these hardware
> > > changes,
> > > the binding constraints specify a total of 12 clock inputs,
> > > consisting of 9 decoder clocks and 3 VCP interface clocks,
> > > along with 2 power domains covering both the decoder and VCP
> > > subsystems.
> >=20
> > I'm pretty pretty confused by this statement about constraints, since
> > there's none added?
> > The vcodec-dec node doesn't even seem to permit clocks at all?
> >=20
> Dear Conor,
>=20
> I apologize for any confusion my commit message caused. What I wanted
> to convey was the hardware differences between the MT8196 and previous
> ICs. If you feel that the VCP and clock information are not suitable
> for this location, I would like to rewrite the commit message as
> follows:
> Compared to previous ICs, the MT8196 supports a 10-bit decoder and has
> a decoding capability of 4K@120fps, using a dual hardware decoding
> architecture of LAT+CORE.

Sure? But your comments about the constraints are odd and I do not know
if that means you omitted changing constraints when you should have?
For example, using lat+core only permits you 10 input clocks but your
commit message talks about 12.

>=20
> Thanks.
>=20
> Regards,
> Kyrie.
> > >=20
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > ---
> > >  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           |=
=20
> > > 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > > decoder.yaml
> > > b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> > > decoder.yaml
> > > index bf8082d87ac0..74e1d88d3056 100644
> > > --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > subdev-decoder.yaml
> > > +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> > > subdev-decoder.yaml
> > > @@ -76,6 +76,7 @@ properties:
> > >        - mediatek,mt8186-vcodec-dec
> > >        - mediatek,mt8188-vcodec-dec
> > >        - mediatek,mt8195-vcodec-dec
> > > +      - mediatek,mt8196-vcodec-dec
> > > =20
> > >    reg:
> > >      minItems: 1
> > > --=20
> > > 2.45.2
> > >=20

--JdEKl3bSogEo/Lcd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka0GAAKCRB4tDGHoIJi
0gcwAQCtMtUoW/cbg4OpVaaf+u+0oq30lr9mkXMb60IDpSgRaQEAsdk2ey0KDekc
nYS63SVumLqJUdoy4hxVqlFifZehUQo=
=16wN
-----END PGP SIGNATURE-----

--JdEKl3bSogEo/Lcd--

