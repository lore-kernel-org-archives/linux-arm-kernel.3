Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49541D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; b=i17lZdhQlsp41c2PLjnZGom8ds
	ICE/mbBZM4DDZWbnteniUkwKYTvhkdRNsvItOYepBaMz8RKULeGOdivMXRNsnmUPcwh96Cnpw01b9
	tFGIAIs4oVb6kTmM0FAUazFTXJCCsLlwh19fCJ/VxsAaKOfsRk4Z2vZupp0ylafqA2Ru+qNwcSuwd
	chZiqYIvstkj3c0YEs2l93sDuHK37tyR/WNsP8YdP42wNawu7zAIhhqHF/UnSvM1qzUdA1VJWz2lQ
	6Tya2IJT6Q9Wcefm1VhAqT2cojJVd+NQHZutKOFyGXTs/glAWT9FZjOmroEUWvQj5sFWRN7Z2muG8
	ila1feyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVCR-00000009mLs-2yoH;
	Fri, 19 Dec 2025 07:46:56 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVCM-00000009mL1-3vmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 07:46:54 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766130383;
 b=IRZEwWA8F8bDhFgBpDJK28DxSe1nXWlkY5/1J4j7TLobkuf6QuMYL1cz/JaU7NQr4Ibp0pTT
 4k9RnHT3hD0+kPbvHlb7qPhi+O2h6P2iroWfbyyLaPDQSsMpXEhE5ZlKr39KCDyK2ptahjm6AvM
 ZsipRINauqt+Ruo9Fp/gvNSRgj9oVJXQiz3RNsy5GZ3y/EoiT/isRcOVYyfP0jN7ba1BePve/a3
 521qGaqm8fZVfUCjT+kW95Fokj+y8byFb+HBdJMI/2yjAiQ0fJu/9bfysbwf/9GPE188uICB0nb
 iA0LvC4eP24giaZdhBK60hxsc1s3LwXXUg1ja58Cd/WEw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766130383;
 b=je/UusY6nyAXhn8KBgJjxQwHDH4kcajey02G77Z54oWVJBYd+2MBT9o1FcxBD9BX1enI+N74
 XsMY0NPZau/QDc92WwiNE7oz0JP2XEZgqUnu+srmHRbn/yatlW3aVGxmVSKP9US4V7zKKqyJYeM
 a7YUbeppHTiBoj7MZjdL4gmDnW29Hx7j2ANeTVHC4MSfpXNcD568C/q8BEakVHMTNuDfa6+TjqW
 xIxELoDDL1wBJSkqLxm5XIoT+iCI/8fs7g82yn+Mi2egVoJnbRxIBWC/88qIwA+oQVifGHFyQpN
 kYBkLTAA5uBybQ6LL+tHekJ3Xs4XK9AShxvbPJSvt6Xig==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Fri, 19 Dec 2025 08:46:23 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C0DFBCC0DAC;
	Fri, 19 Dec 2025 08:45:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode
 to schema and example
Date: Fri, 19 Dec 2025 08:45:57 +0100
Message-ID: <7637686.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <3210190.mvXUDI8C0e@steina-w>
 <20251218190841.pmn3kwghq6lxsfl4@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4dXfjM6trLz2nJ7p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f6d1fa41e90d3fcf88d8c9a603ba697f
X-cloud-security: scantime:3.688
DKIM-Signature: a=rsa-sha256;
 bh=Q1abUH1CXgHaEMujIjDYzavepPIEdL4AH5/kt7YuC1c=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766130382; v=1;
 b=FWYkdISHG35jVadgX/JcD7YAskZeAoSGBZpkpDh6R+R2M03+e0eaF7Drpzqvt53cAhBAJVkz
 C//2iizSoubQHIhy2NNALnQEAQEgDem0w6OpGazczYqxHMsnT6yKOeC9Iz9M+6pEKKuVmbhmYPX
 sb4MdNWZarwXuTNxR4nrlzGX9NhY9MWD7/1sYBG2gJ9MQfJpaOD7BjNbVsnpkyNS+LWxoh49JFH
 3ba9ONA35p0xUcrEVLZfN4dX8JyLXKjJi7UsRGTtRCIJ4A84bVbWTfTeVxNyUyOiAMK8WY5LmTg
 ZJpsTHNbR9Y1jS2EyjydloRz6T7DdaQukg/oR+ExLxjnw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_234651_377952_F3221619 
X-CRM114-Status: GOOD (  45.26  )
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

Hi Marco,

Am Donnerstag, 18. Dezember 2025, 20:08:41 CET schrieb Marco Felsch:
> Hi Alexander,
>=20
> On 25-12-16, Alexander Stein wrote:
> > Hi,
> >=20
> > Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> > > Hi Liu,
> > >=20
> > > sorry I didn't fully answer you please see below.
> > >=20
> > > On 25-12-08, Liu Ying wrote:
> > > > Hi Marco,
> > > >=20
> > > > On 12/02/2025, Marco Felsch wrote:
> > > > > From: Liu Ying <victor.liu@nxp.com>
> > > > >=20
> > > > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register wh=
ich
> > > > > configures parallel display format by using the "PARALLEL_DISP_FO=
RMAT"
> > > > > field. Document the Parallel Display Format Configuration(PDFC) s=
ubnode
> > > > > and add the subnode to example.
> > > > >=20
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > > > [m.felsch@pengutronix.de: add bus-width]
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++=
++++++++++++++
> > > > >  1 file changed, 92 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-=
media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-m=
edia-blk-ctrl.yaml
> > > > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108=
b492bcbabc8a560d8e707cd 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > > > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-b=
lk-ctrl.yaml
> > > > > @@ -26,6 +26,12 @@ properties:
> > > > >    reg:
> > > > >      maxItems: 1
> > >=20
> > > ...
> > >=20
> > > > > +            properties:
> > > > > +              endpoint:
> > > > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > > > +                unevaluatedProperties: false
> > > > > +
> > > > > +                properties:
> > > > > +                  bus-width:
> > > >=20
> > > > In v1-v5, I thought the output bus format can be determined by the =
sink
> > > > device(a panel or a bridge) hence properties like bus-width were no=
t needed.
> > > > But, if this property is really needed, then reference video-interf=
aces.yaml
> > > > since bus-width is documented there.  Should we reference bus-type =
defined
> > > > in video-interfaces.yaml too?
> > >=20
> > > You're right, the bus-width should be determined by the connected pan=
el.
> > > But there are cases where a 24-bit panel is connected but only the lo=
wer
> > > 18-bits are muxed. I added the bus-width property to handle this case.
> > > In the end most users don't have to specify this since the correct
> > > bus-width is coming from the panel bus-fmt.
> > >=20
> > > > > +                    enum: [ 16, 18, 24 ]
> > > >=20
> > > > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP=
 supports
> > > > below formats.  It seems that the enum here may tell RGB888, RGB666=
 and RGB565.
> > > > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> > > >=20
> > > > 000b RGB888 -> RGB888
> > > > 001b RGB888 -> RGB666
> > > > 010b RGB565 -> RGB565
> > > > 011b RGB555 -> RGB555
> > > > 100b YUV -> YCbCr 24 bits
> > > > 101b YUV -> YUV444
> > >=20
> > > This enum is about the physical bus width. RGB565 =3D=3D 16-bit, YUV =
=3D=3D
> > > 24-bit.
> > >=20
> > > That said, I don't think that you need to specify the bus-fmt since t=
his
> > > is coming from the panel. As said above, my itension with the bus-wid=
th
> > > property is to provide integrators (dts-writers) a possibility to lim=
it
> > > the physical available bus width.
> >=20
> > Mh, isn't [1] exactly about this? Not sure about the outcome at that ti=
me.
>=20
> Thanks for the pointer, I wasn't aware of this discussion. I skimmed
> through the dt-bindings thread and I agree with Rob and Maxime.
>=20
> We do have the bus-width endpoint property already. This property is
> alredy used by media and drm bridge drivers. Why not making use of for
> this simple bridge driver too?
>=20
> Furthermore I doubt, that a simple drm-bridge MEDIA_BUS_FMT_* convert
> driver solves all the problem in a generic way for all platforms, all
> connectors, all routing options.

Nobody knows what new hardware comes up with =C2=AF\_ (=E3=83=84)_/=C2=AF
Anyway we already have a similar problem on our MBa6ULx mainboard.
Current downstream workaround is to clone the display timings but
change the bus format. See [1]. Although I would like to get rid of it.
This is just the display connector on the mainboard causing the shift.

Best regards
Alexander

[1] https://github.com/tq-systems/linux-tqmaxx/commit/777c02480182d3054264a=
aaf80e1dbc40a02cfc1

> If the i.MX93 NXP-EVKs in [1] would have connected the upper LCD_DAT*
> pads instead of the lower ones, there would be no conversion needed by
> the PDFC bridge driver, albeit the physical bus is cut to 18-bit width
> due to the RPi ext. header limit, which is expanded to 24-bit again later=
 on
> via the Adafruit board panel FPC connector.
>=20
> In such scenario the output width of the PDFC has to be 24-bit else
> you would lose not only the two LSBs but also the two MSBs for each
> channel. I tried to visualize what I meant for the blue channel:
>=20
>                  24-bit PDFC bridge
> 		 ------------------
>         +----+----+----+----+----+----+----+----+
>  LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
> SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
>  HDR    +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>           +-----------------------------+    |
>           |    +-----------------------------+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>  FPC    +----+----+----+----+----+----+----+----+
>=20
>                  18-bit PDFC bridge
> 		 ------------------
>         +----+----+----+----+----+----+----+----+
>  LCDIF  | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  PDFC   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>           +---------+    |    |    |    |    |
>           |    +---------+    |    |    |    |
>           |    |    +---------+    |    |    |
>           |    |    |    +---------+    |    |
>           |    |    |    |    +---------+    |
>           |    |    |    |    |    +---------+
>           |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
> SOC_PAD | xx | xx | D2 | D3 | D4 | D5 | D6 | D7 |
>         +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  ext.   | xx | xx | B2 | B3 | B4 | B5 | B6 | B7 |
>  HDR    +----+----+----+----+----+----+----+----+
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>                     |    |    |    |    |    |
>           +-----------------------------+    |
>           |    +-----------------------------+
>           |    |    |    |    |    |    |    |
>         +----+----+----+----+----+----+----+----+
>  Ada.   | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 |
>  FPC    +----+----+----+----+----+----+----+----+
>=20
>=20
> The mapping can get quite difficult for a single SoC already, just by
> using a slighlty different HW routing (the upper D[ata] pads).
>=20
> Therefore I would keep it simple and device/ip specific (in this case
> PDFC specific) by making use of the bus-width. Specifying the bus-width
> property could be also wrong albeit it's the case physically, as you can
> see in my above example.
>=20
> Therefore the bus-width property must have a good description.
>=20
> Regards,
>   Marco
>=20
> > Best regards,
> > Alexander
> >=20
> > [1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.=
com/
> >=20
> > > [snip]
>=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



