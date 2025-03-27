Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90266C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5N17KOsgfd5tU8QCiBgB2dYYl62hiU+7Jh0VcyVGqQ=; b=xDW2P7aIiPFBw+GC43m4uJBYmW
	4q5ux/wKvtmk0XZ9GWxB/YtH8eUYFyO8RpGfEBzFAyuCilKF1ULhCq9W5tNmeken0CR5qNA1mLEtx
	YrrbxsRqNX3L1YCzlthKNWF9uidhLUxudQtNpwkxH3aM6LN7jKUrAyqpM6Hvg2X+geFK4RLK5Nqph
	KwX3jrZzhlrUWEYVxbSQl/1czn/dRPnovSNvUmmHVhmDyVYq4wl8vksumTaSEpSGoyFXEqCdFmAC4
	dw3a/ZueawX/Z+TZovVLlBjMfC/Vtajp+MM1gK7sCERqufa0QXogp0gr3GhyTZR2w8vGZQ/JX23DM
	9RHx57qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txp3Q-0000000BLbR-3Jf3;
	Thu, 27 Mar 2025 15:22:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoyu-0000000BL4k-1z8i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743088640; x=1774624640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q5N17KOsgfd5tU8QCiBgB2dYYl62hiU+7Jh0VcyVGqQ=;
  b=qkoqU/acPs9wmKi4KFbIdsyxZNpwyAhXtsCL+bZtrt7LhZG2JsI5U7h+
   DNYeLfh6KZbLdtqXePtRW1You4xLrTok7voRDwmatukSuolDMnAg/K73S
   TbokSgFMqlrklvIDWTtDiIgxMYV/KZUw+ltB+WHgnHzQ7IyX6IHuJQ6h6
   t5gabzzvACHIM+BoICS+RkWz1pbFOQI88WtPlQsYlqKjgK3CQDei4ix3J
   dQbpNMB8+/pchcsSh/GXLTZmDaf8ts8msd//MRYSrwHbdil2fLrdiLuTu
   WlQ2AS4yysWhPDy1DD6q7gdWP1EYPYyRSeh1huR8bBfW83+mmUejY4l+Q
   w==;
X-CSE-ConnectionGUID: zFpRplEPRlihr1sVJCWn0w==
X-CSE-MsgGUID: VhuchQarTSmZCCqKjJv0nQ==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43200592"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 16:17:18 +0100
X-CheckPoint: {67E56BFE-25-2417938-F0170C2B}
X-MAIL-CPID: 9D2C94109F316BB6688BAB2DCFEC054B_2
X-Control-Analysis: str=0001.0A006378.67E56BF7.006E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA52416C5D9;
	Thu, 27 Mar 2025 16:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743088634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q5N17KOsgfd5tU8QCiBgB2dYYl62hiU+7Jh0VcyVGqQ=;
	b=gazNy7g5HlLQhl60V7ofVmlS/b8twdF3ZC9kSnv5Wz7NV3mgX/0oINBbyGumnGGYfqE8sR
	RWOZbtNhO+a1OL30b6x3ZdfojCxQpv1vENTaIoxIooUn86g9uqO08Ph4azErd6VOhj5BE5
	fxDq9slGOJTnHprTsSav7tmW2sl9N7XAZTaIGxkbtLHgWL8NvqCTCSngkOJ6Ati8/OnnOV
	nX4sNGntFocf4mDFyWfhHv4ekGPo0/OfTeenaso+O+ixdUMJMAw7hMzYTVhBpKjys2ayUt
	EwieziGJ+xpKb/6wYjj7s0mWGo6uhIxHTUAz31JADuhe1ABKrPmrktTidGUb8A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma
 TM070JVGH33
Date: Thu, 27 Mar 2025 16:17:09 +0100
Message-ID: <3347513.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z+VoEI9Ep3izRKBJ@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-5-alexander.stein@ew.tq-group.com>
 <Z+VoEI9Ep3izRKBJ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_081720_811196_0633B36E 
X-CRM114-Status: GOOD (  20.99  )
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

Hi Frank,

Am Donnerstag, 27. M=E4rz 2025, 16:00:32 CET schrieb Frank Li:
> On Thu, Mar 27, 2025 at 03:41:10PM +0100, Alexander Stein wrote:
> > This adds an overlay for the supported LVDS display tianma tm070jvhg33.
> > The on-board RGB-to-LVDS encoder and DCU graphics chain are configured
> > accordingly. Add the missing power supply as well.
>=20
> 		      ^^^ missed?

Thanks for the comment. We are touching English grammar here and I might
be completely wrong.
IMHO this gerund is describing the power supply is missing the whole time.
In contrast to 'missed' which indicates it had been missed (just) once.
Anyway I don't have hard feelings.

Best regards,
Alexander

> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm/boot/dts/nxp/ls/Makefile             |  2 +
> >  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 +++++++++++++++++++
> >  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  1 +
> >  3 files changed, 50 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls102=
1a-lvds-tm070jvhg33.dtso
> >
> > diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/=
ls/Makefile
> > index 225a7665b8ad1..7f96de6f80224 100644
> > --- a/arch/arm/boot/dts/nxp/ls/Makefile
> > +++ b/arch/arm/boot/dts/nxp/ls/Makefile
> > @@ -8,4 +8,6 @@ dtb-$(CONFIG_SOC_LS1021A) +=3D \
> >  	ls1021a-twr.dtb
> >
> >  ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs +=3D ls1021a-tqmls1021a-mbls102=
1a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
> > +ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33-dtbs +=3D ls1021a-tqmls1=
021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtbo
> >  dtb-$(CONFIG_SOC_LS1021A) +=3D ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
> > +dtb-$(CONFIG_SOC_LS1021A) +=3D ls1021a-tqmls1021a-mbls1021a-lvds-tm070=
jvhg33.dtb
> > diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds=
=2Dtm070jvhg33.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a=
=2Dlvds-tm070jvhg33.dtso
> > new file mode 100644
> > index 0000000000000..e9708f3c67403
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070j=
vhg33.dtso
> > @@ -0,0 +1,47 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> > + * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > + * D-82229 Seefeld, Germany.
> > + * Author: Alexander Stein
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&backlight_dcu {
> > +	status =3D "okay";
> > +};
> > +
> > +&dcu {
> > +	status =3D "okay";
> > +
> > +	port {
> > +		dcu_out: endpoint {
> > +			remote-endpoint =3D <&lvds_encoder_in>;
> > +		};
> > +	};
> > +};
> > +
> > +&display {
> > +	compatible =3D "tianma,tm070jvhg33";
> > +	status =3D "okay";
> > +};
> > +
> > +&lvds_encoder {
> > +	status =3D "okay";
> > +};
> > +
> > +&lvds_encoder_in {
> > +	remote-endpoint =3D <&dcu_out>;
> > +};
> > +
> > +&lvds_encoder_out {
> > +	remote-endpoint =3D <&panel_in>;
> > +};
> > +
> > +&panel_in {
> > +	remote-endpoint =3D <&lvds_encoder_out>;
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts =
b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > index 27a55fa638128..80dae0c09542d 100644
> > --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> > @@ -147,6 +147,7 @@ hdmi_in: endpoint {
> >  	display: panel {
> >  		backlight =3D <&backlight_dcu>;
> >  		enable-gpios =3D <&pca9554_1 3 GPIO_ACTIVE_HIGH>;
> > +		power-supply =3D <&reg_3p3v>;
> >  		status =3D "disabled";
> >
> >  		port {
> > --
> > 2.43.0
> >
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



