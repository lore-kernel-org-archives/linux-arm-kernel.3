Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83FAD0C619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D34ZQYAA4Xy1RlM6CHhSVEaUwrAOhpkBAO+draaH9ns=; b=PnnawrG+T6kUXz+VB+Kh1lV99G
	heR6H/voD3oDu68GP5N+VP/0XYSF4hELFiA4E3d8mqh0AxJ+YTUUQktIo1vkwDzpMSaw2MTh9M0PQ
	QYILM+oRqYktXmEP+aJ8yc7pcmgTsGS7eDJDEmweUfYF4OP72It1gFT6WSJELxbG5fFvpGKgO2okr
	EZh8+UE5p7cNwCPdSSZCjE7EW7n7rWscKT5isiNeWKRcg3Fb4ygnicP+pITInF/Y44Ji036Xwx8IM
	9Coxp05vNu3p28FPYbPVXjpxWZULSL0J2Xsqc+REQDrphPNHjB6roABARB2z6CbEacNjmEKnMISPA
	H7KaZYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LJ8-0000000412m-12PJ;
	Fri, 25 Oct 2024 14:28:54 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Krr-00000003umV-06Gt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729864843; x=1761400843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D34ZQYAA4Xy1RlM6CHhSVEaUwrAOhpkBAO+draaH9ns=;
  b=bKSoGy630WlIx2G9NHPxomiuKjH+SoFPHJx96COGxpuypn6JMnVThu4M
   /iSGZl5+XAndjfgf4h7HsBzsbVeHwP76XcXG69ztWtr6VgN354AlDpxuY
   nd/WT//IAk4H1lWnRx14Xh04/+5wleuzHWdKeEiIaufYslRetnMbyZzhN
   APt4TU9oYaCpVMpQx4YWQ6Ivy211FPzlOEj7TlaL+9ax0js+EHfHF4LFY
   SgdsGtxS62Ik3PpzK7cwyoXkswEUAv8r1VzbL+czOGR1Uuh8opc/tJexS
   qTLpvPbc39RMHbUJVDXDOuyw2I2ZPUGUs61peUPPJR7etYW4nqqq5TyL0
   w==;
X-CSE-ConnectionGUID: RJyKPL4TQG2I7atbNc+ajg==
X-CSE-MsgGUID: TkxXlj06TlWhC036/duQ9Q==
X-IronPort-AV: E=Sophos;i="6.11,231,1725314400"; 
   d="scan'208";a="39677654"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Oct 2024 16:00:40 +0200
X-CheckPoint: {671BA488-1-21611FC3-DAD22B0C}
X-MAIL-CPID: 4622FD0EE2930BE343E156A47A186DF3_4
X-Control-Analysis: str=0001.0A682F1A.671BA487.0021,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6297B1644A4;
	Fri, 25 Oct 2024 16:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729864835;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D34ZQYAA4Xy1RlM6CHhSVEaUwrAOhpkBAO+draaH9ns=;
	b=Uui/qTukAHJ7VFZhUcAlQ+OVdccdApCQQcklWBFNMNz1WGm7oXncKjOxbu7Baidju+3IqA
	53U8ocywj33gbEYU3/JQsNkduuC5UBPIM0ZrkXDFsb7r/rKT32rpt+iBkk0HEBwJG3fXMv
	MK6xfnWgo6wUGHhRTKkG21FIvzsH76vQfdp0ckeQyxQSU9EPGAlWtChUw7tsp738Mxm6pX
	+98C+aJJ67rL6U2G7Nsf1nEPL8CFYWx1XRf5YmZ+JiA4DuM6ld3uhoWcv51PN/fh8D+nAM
	fNdDhwwJBFAwZzhvGiIYYof375B5oisxCpL4y/fQ8oK3drHPa7cV+de9//SVlQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix coexistence of output-low and output-high in GPIO
Date: Fri, 25 Oct 2024 16:00:33 +0200
Message-ID: <2005735.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
References: <20241023210313.1390767-1-Frank.Li@nxp.com> <CAMuHMdW-tXFYSfTerb-eYmmbJHYN9xNyiGMPoeGArmDnAajUmg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_070043_898364_D18BE70C 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Geert,

Am Freitag, 25. Oktober 2024, 15:52:58 CEST schrieb Geert Uytterhoeven:
> Hi Frank,
>=20
> On Wed, Oct 23, 2024 at 11:07=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrot=
e:
> > Fix the issue where both 'output-low' and 'output-high' exist under GPIO
> > hog nodes  (rst_usb_hub_hog and sel_usb_hub_hog) when applying device
> > tree overlays. Since /delete-property/ is not supported in the overlays,
> > setting 'output-low' results in both properties being present. The
> > workaround is to disable these hogs and create new ones with 'output-lo=
w'
> > as needed.
> >
> > Fix below CHECK_DTBS warning:
> > arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-u=
sb-hub-hog:
> >    {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-hi=
gh': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']}
> >        is valid under each of {'required': ['output-low']}, {'required'=
: ['output-high']
> >
> > Fixes: 3f6fc30abebc ("arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR =
overlay")
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Alex:
> >         I have not hardware to run it. I check dtb output is correct.
> > ---
> >  .../imx8mn-tqma8mqnl-mba8mx-usbotg.dtso       | 29 +++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbo=
tg.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > index 96db07fc9bece..1f2a0fe70a0a2 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
> > @@ -29,12 +29,37 @@ usb_dr_connector: endpoint {
> >         };
> >  };
> >
> > +/*
> > + * rst_usb_hub_hog and sel_usb_hub_hog have property 'output-high',
> > + * dt overlay don't support /delete-property/. Both 'output-low' and
> > + * 'output-high' will be exist under hog nodes if overlay file set
> > + * 'output-low'. Workaround is disable these hog and create new hog wi=
th
> > + * 'output-low'.
> > + */
> > +
> >  &rst_usb_hub_hog {
> > -       output-low;
> > +       status =3D "disabled";
> > +};
> > +
> > +&expander0 {
> > +       rst-usb-low-hub-hog {
> > +               gpio-hog;
> > +               gpios =3D <13 0>;
> > +               output-low;
> > +               line-name =3D "RST_USB_HUB#";
> > +       };
> >  };
> >
> >  &sel_usb_hub_hog {
> > -       output-low;
> > +       status =3D "disabled";
> > +};
> > +
> > +&gpio2 {
> > +       sel-usb-low-hub-hog {
> > +               gpio-hog;
> > +               gpios =3D <1 GPIO_ACTIVE_HIGH>;
> > +               output-low;
> > +       };
> >  };
> >
> >  &usbotg1 {
>=20
> Note that after this, there is still
>=20
>     /delete-property/ disable-over-current;
>=20
> left, which does not actually remove the property.

This is true, I noticed myself. As this patch does not concern about
disable-over-current, it still is an improvement.

Unfortunately there is currently no way to fix this right now. This is a
boolean property, which is impossible to remove in overlays.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



