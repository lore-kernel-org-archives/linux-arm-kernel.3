Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D072AE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoUO6pQ0vn1+CceIy9BstLi27T2zXhzpZrFaciePhSA=; b=4fk48Yv5JAa3moykrRnYWOR5pz
	Et6BaQFsxhjPRJLvLXrknz2mZFxeFTxCBCJ+IZ1Czm0Q8W1YR5NiOc1XRQ8f3IMqDqpOQKkIfcNFN
	Wi0nZbFnW6/f3jqwoEu5utOze1Y/dJ8sOVyVRyf1leN5DxzrQm0bI/swz180XNHMCWJo/6OUBWoFY
	5i8jPadmC74lKCiUNHXFfCprwEL5iC+Et0Qmq1vmbD3z8abq6Vhq3eHl0Lj8IafG/lWNRetIHMpRL
	Eg+EhZtc1owGt8IWPSKNI6YjGPV9eV7Cl3jN+MwiNO+mRvdMnmbbIF1AHxmxmgULYZ0NUDBLHbLcj
	7LEhHjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGbp-0000000H7Fg-3gdi;
	Thu, 05 Dec 2024 18:29:53 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGYT-0000000H6tS-2ht3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:26:27 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7b667e13949so65988185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1733423184; x=1734027984; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoUO6pQ0vn1+CceIy9BstLi27T2zXhzpZrFaciePhSA=;
        b=JDtCTThpkim1mAP0IEHoB6AQXWQqJ4xUa6Kgcpbg7ukln7oPkUrHUT10v40tM4Wkwt
         lANJgy6/KaRmWs2fKCqgLTz0v9BHRu4eWsjEENEQqY4PfJ8fou/QwU4r7Zb3wMxJME08
         7nzdYUBsGtIijd8GNUPhN4f295bBrAqOezRqO0eD3tuCVcNQceDphu372gVLpSkQ63kd
         LncPjEOTl228jRqxjHmpTCbRfMDTy1HpmC6cbvjPa3DiFIPeSDJospgRcZAZ9vpR+ZQU
         j1tj1nr3f4GvMbiBCX7dr0h6kjlktBWKxer6ypLbUsMkkymfL3t2fjDmXbP23S2WClq+
         nw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733423184; x=1734027984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoUO6pQ0vn1+CceIy9BstLi27T2zXhzpZrFaciePhSA=;
        b=GYoP9j+89smZSiSHguKydmJOyt1GzLsfG0ySRljfwRHpPcAFuZjiJOhwuIkqLgSC4w
         GdMcLp92Xeeqid7fg958o7XJ46BQ4lZpz8pwxDtetn7osUVFneD13Dgyu0vbp63Zou9h
         6nXAX8tyr5r1GWcCK5feOKCrfPXj7c48f5+Ywp8TAfgyBb6SpZPHIwvaLzM+MQI7HH5J
         p4f4XlNeG8qxRaaV7exLG6HZ9egA+w6AKct12jRMeC0/PaXygKFdFv9w5V9vUPun+los
         ECisHhBNw7jOWIFstvX5/36aGik4BmtzY5Ys1vuC0IAR87ryTLgQHYTvMqgifDh1dWdi
         t+Og==
X-Forwarded-Encrypted: i=1; AJvYcCVkodt26k/eYKTfD8YNCqPdbD3i3pBpvSGFhSYpfD163I/E9rLVfRH6nebz6IYPDAU6E3Pfqbn4/Poz1hj4Vm4b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh1h6SkWWvsVcrEtY/lWauqz2sIRSq/7ac0GQ01/TqgNNXukON
	JYEJNSuWu22B5BKaZStHa3bK1ARdN2D/2a0cQ9JJlFiuWHS5O6eX685xw2y6D9s=
X-Gm-Gg: ASbGncu5BtsFElgUFFejWiqHcHqGroqQgF2NSQU8KU2t3HANP/e8d7msuGByzy1Lven
	y5u6WxS2jAX/85YlhBfqNvQfj6rmGdc0jDGiG3ghHpelJctFznvkfR7lqpkVyLo6VeX7R2449LA
	2jcKXak+g8sSkTX0e2PpM786+DdK+0yUKtP97G1cLMWNJ5mv5MoqHw+85NxI7CFYj8q8Z1hQ909
	xO7OUdggdlU3BhvmZ5UZuWmP0tPxnaPAAohH3mFc+7WrnjlTW0=
X-Google-Smtp-Source: AGHT+IF7C9Gtarg7lsRgFlLYcqYfSdzEnblrvPPksqXAjwHiA/qI3nTSUHdTXLYCfa+90Cswhii26g==
X-Received: by 2002:a05:6214:27eb:b0:6d4:2fee:c27b with SMTP id 6a1803df08f44-6d8b7395fddmr140735286d6.27.1733423183998;
        Thu, 05 Dec 2024 10:26:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da6b54b6sm9020216d6.62.2024.12.05.10.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:26:23 -0800 (PST)
Message-ID: <cf7b66d0671e223263a7d33b6e519850a5ff2fb5.camel@ndufresne.ca>
Subject: Re: [PATCH] media: allegro-dvt: Moving the current driver to
 subdirectory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Michael Tretter <m.tretter@pengutronix.de>, Yassine Ouaissa	
 <yassine.ouaissa@allegrodvt.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Michal Simek <michal.simek@amd.com>, Hans Verkuil	 <hverkuil@xs4all.nl>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  Gaosheng Cui <cuigaosheng1@huawei.com>,
 Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, open list <linux-kernel@vger.kernel.org>, "open
 list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)"	 <linux-media@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"	
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 05 Dec 2024 13:26:22 -0500
In-Reply-To: <Z1FrT3gBWE5VgMOS@pengutronix.de>
References: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
	 <Z02SLI05JhNDtXFn@pengutronix.de>
	 <abshbp4blqxasxvf4ibumtfqcr7hytehmhzs2yag3nfpbcl47x@ndjg7al4iysk>
	 <Z1CC_PQF8hCzmPoQ@pengutronix.de>
	 <46tabetrggwplddtssags6eyjcd6x7znaquerjg3z5a63ykle4@z5fqzikwv2o4>
	 <Z1FrT3gBWE5VgMOS@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102625_883353_57B70E97 
X-CRM114-Status: GOOD (  45.15  )
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

Hi Yassine,

Le jeudi 05 d=C3=A9cembre 2024 =C3=A0 09:58 +0100, Michael Tretter a =C3=A9=
crit=C2=A0:
> Hi Yassine,
>=20
> On Thu, 05 Dec 2024 08:11:48 +0000, Yassine Ouaissa wrote:
> > On 04.12.2024 17:27, Michael Tretter wrote:
> > > On Wed, 04 Dec 2024 14:44:31 +0000, Yassine Ouaissa wrote:
> > > > On 02.12.2024 11:55, Michael Tretter wrote:
> > > > > On Mon, 02 Dec 2024 11:26:38 +0100, Yassine Ouaissa wrote:
> > > > > What kind of conflicts do you encounter or expect? It's kind of
> > > > > surprising that your driver would conflict with anything in the e=
xisting
> > > > > driver.
> > > >=20
> > > > The current "NOT allegro" driver support only the ZynqMP (ex : ZCU1=
06/ZCU104 ).
> > > > And the upcoming driver, has support for many platforms.
> > >=20
> > > What are the supported platforms of the new driver? Does your driver
> > > support ZynqMP, too?
> > >=20
> > The upcoming driver is not using the ZynqMP, it can be used by other
> > clients including Xilinx.
> > > If there are enough similarities between the encoders, I'd happily
> > > replace parts of the current driver with functionality of the upcomin=
g
> > > driver or reuse the infrastructure of the new driver.
> > >=20
> >=20
> > For now, we do have only the decoder (stateful). the encoder is "in
> > progress". We prefer to have a separate driver core for each platform.
>=20
> Thanks! I'd like to wait until I've seen your patches before agreeing to
> move the driver to a subdirectory. Maybe even include this patch as the
> first patch in your series to give a full picture of the new structure.

I wonder if both you have the same definition of "platform". For me it soun=
ded
like "a driver per SoC" and that is a big no no.

For stateful codec, what differentiate them is the interface with the firmw=
are
and state machine used to driver them. If these are incompatible with the
generation of design on ZynqMP 104/106, then splitting the driver is the wa=
y to
go, even if the new interface could endup on older SoC through a firmware
update.

This is pretty much the direction taken by Qualcomm while moving from Venus
interface to Iris interface, and on some SoC (platform), this is just a fir=
mware
swap and different compatible in the DT.

Nicolas

p.s. Yassine, its fine to state that your driver will be "pre-sillicon" tes=
ted,
that helps remove the confusion. Looking forward seeing some code of course=
,
that will also help, from there, Michael will better judge if there is an
overlap or not. Mid-ground solution exist, like creating allegro-common.ko.

>=20
> Michael
>=20
> > > >=20
> > > > > I'd like to see how you plan to integrate your driver, what it lo=
oks
> > > > > like and what conflicts with the existing driver actually occur. =
Without
> > > > > that information I don't see the point in moving the driver to a
> > > > > sub-directory.
> > > >=20
> > > > The upcoming driver is not using the parsing, conversion inside of =
the
> > > > driver. Actually the new Gen of ALLEGRO IP does that.
> > >=20
> > > Sorry, I don't understand what you mean by parsing and conversion. Do
> > > you mean the mailbox messages or the NAL units?
> > >=20
> > > Can you point me to some repository with your upcoming driver? I'd
> > > really like to know what's coming up to have an informed discussion h=
ow
> > > to structure the directory.
> > >=20
> > > Michael
> > >=20
> >=20
> > Yassine
> > > > > >=20
> > > > > > Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> > > > > > ---
> > > > > >  MAINTAINERS                                               | 2 =
+-
> > > > > >  drivers/media/platform/allegro-dvt/Kconfig                | 4 =
++--
> > > > > >  drivers/media/platform/allegro-dvt/Makefile               | 8 =
++------
> > > > > >  drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 =
++++++
> > > > > >  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.c    | =
0
> > > > > >  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.h    | =
0
> > > > > >  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.c    | =
0
> > > > > >  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.h    | =
0
> > > > > >  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.c    | =
0
> > > > > >  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.h    | =
0
> > > > > >  .../{allegro-core.c =3D> zynqmp/zynqmp-allegro-core.c}      | =
2 +-
> > > > > >  .../{allegro-mail.c =3D> zynqmp/zynqmp-allegro-mail.c}      | =
2 +-
> > > > > >  .../{allegro-mail.h =3D> zynqmp/zynqmp-allegro-mail.h}      | =
0
> > > > > >  13 files changed, 13 insertions(+), 11 deletions(-)
> > > > > >  create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/M=
akefile
> > > > > >  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h=
264.c (100%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h=
264.h (100%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h=
evc.c (100%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h=
evc.h (100%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-r=
bsp.c (100%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-r=
bsp.h (100%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{allegro-core.c =3D>=
 zynqmp/zynqmp-allegro-core.c} (99%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{allegro-mail.c =3D>=
 zynqmp/zynqmp-allegro-mail.c} (99%)
> > > > > >  rename drivers/media/platform/allegro-dvt/{allegro-mail.h =3D>=
 zynqmp/zynqmp-allegro-mail.h} (100%)
> > > > > >=20
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index 7292e4a1ddb8..d79efe6f8992 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutro=
nix.de>
> > > > > >  L:	linux-media@vger.kernel.org
> > > > > >  S:	Maintained
> > > > > >  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> > > > > > -F:	drivers/media/platform/allegro-dvt/
> > > > > > +F:	drivers/media/platform/allegro-dvt/zynqmp
> > > > > >=20
> > > > > >  ALLIED VISION ALVIUM CAMERA DRIVER
> > > > > >  M:	Tommaso Merciai <tomm.merciai@gmail.com>
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drive=
rs/media/platform/allegro-dvt/Kconfig
> > > > > > index 2182e1277568..9bc7e99788b8 100644
> > > > > > --- a/drivers/media/platform/allegro-dvt/Kconfig
> > > > > > +++ b/drivers/media/platform/allegro-dvt/Kconfig
> > > > > > @@ -2,8 +2,8 @@
> > > > > >=20
> > > > > >  comment "Allegro DVT media platform drivers"
> > > > > >=20
> > > > > > -config VIDEO_ALLEGRO_DVT
> > > > > > -	tristate "Allegro DVT Video IP Core"
> > > > > > +config VIDEO_ZYNQMP_ALLEGRO_DVT
> > > > > > +	tristate "Allegro DVT Video IP Core for ZynqMP"
> > > > > >  	depends on V4L_MEM2MEM_DRIVERS
> > > > > >  	depends on VIDEO_DEV
> > > > > >  	depends on ARCH_ZYNQMP || COMPILE_TEST
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/Makefile b/driv=
ers/media/platform/allegro-dvt/Makefile
> > > > > > index 66108a303774..04727c5f7ef4 100644
> > > > > > --- a/drivers/media/platform/allegro-dvt/Makefile
> > > > > > +++ b/drivers/media/platform/allegro-dvt/Makefile
> > > > > > @@ -1,6 +1,2 @@
> > > > > > -# SPDX-License-Identifier: GPL-2.0
> > > > > > -
> > > > > > -allegro-objs :=3D allegro-core.o allegro-mail.o
> > > > > > -allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> > > > > > -
> > > > > > -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) +=3D allegro.o
> > > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > +obj-y +=3D zynqmp/
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile=
 b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> > > > > > new file mode 100644
> > > > > > index 000000000000..a8ddb9cf93a8
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> > > > > > @@ -0,0 +1,6 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > +
> > > > > > +zynqmp-allegro-objs :=3D zynqmp-allegro-core.o zynqmp-allegro-=
mail.o
> > > > > > +zynqmp-allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> > > > > > +
> > > > > > +obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) +=3D zynqmp-allegro.o
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/dr=
ivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/nal-h264.c
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/dr=
ivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/nal-h264.h
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/dr=
ivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/nal-hevc.c
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/dr=
ivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/nal-hevc.h
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/dr=
ivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/dr=
ivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c =
b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> > > > > > similarity index 99%
> > > > > > rename from drivers/media/platform/allegro-dvt/allegro-core.c
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-alle=
gro-core.c
> > > > > > index e491399afcc9..8895d7755987 100644
> > > > > > --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> > > > > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-=
core.c
> > > > > > @@ -31,7 +31,7 @@
> > > > > >  #include <media/videobuf2-dma-contig.h>
> > > > > >  #include <media/videobuf2-v4l2.h>
> > > > > >=20
> > > > > > -#include "allegro-mail.h"
> > > > > > +#include "zynqmp-allegro-mail.h"
> > > > > >  #include "nal-h264.h"
> > > > > >  #include "nal-hevc.h"
> > > > > >=20
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c =
b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> > > > > > similarity index 99%
> > > > > > rename from drivers/media/platform/allegro-dvt/allegro-mail.c
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-alle=
gro-mail.c
> > > > > > index aadc947a77ae..88a98f9e5d00 100644
> > > > > > --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
> > > > > > +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-=
mail.c
> > > > > > @@ -12,7 +12,7 @@
> > > > > >  #include <linux/string.h>
> > > > > >  #include <linux/videodev2.h>
> > > > > >=20
> > > > > > -#include "allegro-mail.h"
> > > > > > +#include "zynqmp-allegro-mail.h"
> > > > > >=20
> > > > > >  const char *msg_type_name(enum mcu_msg_type type)
> > > > > >  {
> > > > > > diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h =
b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
> > > > > > similarity index 100%
> > > > > > rename from drivers/media/platform/allegro-dvt/allegro-mail.h
> > > > > > rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-alle=
gro-mail.h
> > > > > > --
> > > > > > 2.30.2
> > > > > >=20
> > > > > >=20
>=20


