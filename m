Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EAECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7rlWuW5HmCRWkyliG+Fe7oZxOntPeBtOlfbi+K1Wpc=; b=E2LPPkI5/nOQ+IIA5JIJHsM2is
	dVWIr3S9S70gxy6wXj2TIhUnRK1nQMKsHUTQgcQ2UdDR/ED2gNKhUo4ms/zi1lYegnUiIRlVsdwZB
	WJdByHphPsMHRlP3Q/wvgileMJVL+TrHOOiWICS5MkE3PDiZWSliCGVufXefP+TvzFYgYzaAxzxgg
	2Usc0G42L0bLG2+a319+KnZfN4UKn3GHjaJe+Au73LjubAUuGOXdsoB3s3/I7k5WSwPg9K+T7/enY
	LuB3DZMdnVpvOa62NG70GGhSn+ToWSeTB0HdP5hfHP0ytGxPM3YwZd3GGVNA7OKi8U+Pl7Y8HVMeg
	vfZ1MX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoTq-00000007q4z-28Fx;
	Fri, 15 May 2026 09:05:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoTm-00000007q4E-3Cy0;
	Fri, 15 May 2026 09:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778835910; x=1810371910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JF3uZsy6llHlDV7C7vLRRmWCmal9y3CobKnloKpst78=;
  b=ZJLs4KcruAf40DLEE7vJTivHTBR4tb4kI8omSBSouzZZ7Z2rlrR4PXim
   Ona2PF9OpHVsWaM4U4wBHBNM89MdcQqy2KmihXIaNaqDNH1XyChd1YP1g
   ZaFfopK9Ijy88vTB2vaK1dIp3iCPz3OVLlFdU+oyZkIxLntc+f+jY3/77
   /sqqL4t74/YBwCvnnZCmk4WiC9wuFJZ8E3yKw7RjOedBBJpS2+jhQw8ht
   9LwRsiINbM6q9LL9o6D5/gmBBw/AvILR9x2a9vvR3cbYP85ToGsKqBUFq
   IOUbt1Mr5i1vsrUF3asxbox+ca2J5tBWMKyrw7rd6Ly2EpGSgzJrlN7xM
   g==;
X-CSE-ConnectionGUID: aBy8wa7JRn+FUchmSVlp4w==
X-CSE-MsgGUID: fbVAwTCTQfC/IGhAcLgkpA==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="57964607"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 02:05:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 15 May 2026 02:05:08 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 02:05:03 -0700
Date: Fri, 15 May 2026 10:04:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Damon Ding <damon.ding@rock-chips.com>
CC: Conor Dooley <conor@kernel.org>, <hjc@rock-chips.com>, <heiko@sntech.de>,
	<andy.yan@rock-chips.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrzej.hajda@intel.com>,
	<neil.armstrong@linaro.org>, <rfoss@kernel.org>,
	<Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <nicolas.frattaroli@collabora.com>,
	<cristian.ciocaltea@collabora.com>, <sebastian.reichel@collabora.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <luca.ceresoli@bootlin.com>,
	<dianders@chromium.org>, <m.szyprowski@samsung.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: rockchip: analogix-dp:
 Expose inherited properties
Message-ID: <20260515-confess-hungrily-4f64ce0d8de2@wendy>
References: <20260514070133.2275069-1-damon.ding@rock-chips.com>
 <20260514070133.2275069-2-damon.ding@rock-chips.com>
 <20260514-upstate-sneer-0b6e78682798@spud>
 <2f653664-27e9-4632-97e9-8b59cf7e585e@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JTEOF7u1knQLxomm"
Content-Disposition: inline
In-Reply-To: <2f653664-27e9-4632-97e9-8b59cf7e585e@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020511_064951_CC0182ED 
X-CRM114-Status: GOOD (  25.88  )
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

--JTEOF7u1knQLxomm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 11:57:58AM +0800, Damon Ding wrote:
> Hi Conor,
>=20
> On 5/15/2026 2:16 AM, Conor Dooley wrote:
> > On Thu, May 14, 2026 at 03:01:31PM +0800, Damon Ding wrote:
> > > Expose the inherited properties from the base analogix-dp schema
> > > to satisfy unevaluatedProperties constraints.
> > >=20
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >=20
> > Given it's unevaluatedProperties, not addtionalProperties, this patch
> > shouldn't be needed?
> >=20
>=20
> When I remove both the top-level data-lanes property and those explicit
> "xxx: true" property entries and run the dtbs check with:
>=20
> make CHECK_DTBS=3Dy CROSS_COMPILE=3Daarch64-linux-gnu- LT0=3Dnone LLVM=3D1
> LLVM_IAS=3D1 ARCH=3Darm64 rockchip/rk3588-evb1-v10.dtb
> rockchip/rk3588s-evb1-v10.dtb rockchip/rk3399-sapphire-excavator.dtb
> rockchip/rk3576-evb1-v10.dtb -j4
>=20
> It results in validation errors like these:
>=20
> /home/ding/drm-misc/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb:
> edp@27dc0000: ports:port@1:endpoint: Unevaluated properties are not allow=
ed
> ('data-lanes' was unexpected)
>         from schema $id:
> http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
> /home/ding/drm-misc/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb:
> edp@27dc0000: Unevaluated properties are not allowed ('force-hpd',
> 'interrupts', 'phy-names', 'phys', 'ports', 'reg' were unexpected)
>         from schema $id:
> http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
>=20
> I suspect that the properties defined in the child binding are
> overriding/masking all the inherited properties from the parent Analogix =
DP
> schema.
>=20
> Is there a better way to fix this issue without explicitly listing all
> inherited properties as true?

The example in this file uses most of the properties that you mention
above:
    dp@ff970000 {
      compatible =3D "rockchip,rk3288-dp";
      reg =3D <0xff970000 0x4000>;
      interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
      clocks =3D <&cru SCLK_EDP>, <&cru PCLK_EDP_CTRL>;
      clock-names =3D "dp", "pclk";
      phys =3D <&dp_phy>;
      phy-names =3D "dp";
      resets =3D <&cru 111>;
      reset-names =3D "dp";
      rockchip,grf =3D <&grf>;
      pinctrl-0 =3D <&edp_hpd>;
      pinctrl-names =3D "default";

dt_binding_check reports no problems with this node, so I think the
problem might lie elsewhere?
There's no edp node in the dts you mention above, so this looks like an
interaction with something that's not yet upstream.

If this is required for the rk3576 edp, then you should include this
patch in the rk3576 edp support series rather than this one anyway where
it can actually be evaluated alongside the node it apparently causes
problems with.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> Best regards,
> Damon
>=20
> > > ---
> > >   .../bindings/display/rockchip/rockchip,analogix-dp.yaml    | 7 ++++=
+++
> > >   1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/r=
ockchip,analogix-dp.yaml
> > > index bb75d898a5c5..896ded87880f 100644
> > > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,ana=
logix-dp.yaml
> > > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,ana=
logix-dp.yaml
> > > @@ -50,6 +50,13 @@ properties:
> > >     aux-bus:
> > >       $ref: /schemas/display/dp-aux-bus.yaml#
> > > +  reg: true
> > > +  interrupts: true
> > > +  phys: true
> > > +  phy-names: true
> > > +  force-hpd: true
> > > +  ports: true
> > > +
> > >   required:
> > >     - compatible
> > >     - clocks
> > > --=20
> > > 2.34.1
> > >=20
> > >=20
>=20

--JTEOF7u1knQLxomm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbhmQAKCRB4tDGHoIJi
0hL9AQDMzOGCBAaj30x0MldbIEzDvxHY9JZ/Hr59JunC6U0AhQEAhrUYE74I+05k
njcJ1OaOANoefame5d09LLbMsepD7Q4=
=jYCg
-----END PGP SIGNATURE-----

--JTEOF7u1knQLxomm--

