Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED620CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8V3hIJFvUgVjg0/tUj7NHCN4G/8vGDXw+L9NVOOC8l4=; b=IAxt99D/dDF0+Qub4rUOXs+mc0
	9VGA46CD9Wa1Pmv/PO0FxMvCZeEZ9I8yDU9mYQEHYsGciHygNfM3s/BD8Y4JeEvIfdfiQa+h7272b
	8IAEGUYG54q13RvTBQ7TL95Z3u88/MdIdlqiNkMx/QVAQZ0DtcWKmCgemlFIEMsGntQfGc1dgYSEv
	TD/1ISfpiBGc7LAB9fhALxkz+/4njFkQH+jfVT1686rH0D3HpoTXHvOE8XzDuJRXHqAYBnEaztChK
	hovJ+b3BIDVrcnKkoO8939SJBlfh/P/8I08HZXcUAH7Yw/n8d0S1iLLTKnrOg/GmdSKWt9c15/AtX
	PvZV5E6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOPb-00000005JCH-3oBE;
	Tue, 02 Dec 2025 11:19:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOPU-00000005JBl-2foO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:19:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7A2F4C17B75;
	Tue,  2 Dec 2025 11:18:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89707606D3;
	Tue,  2 Dec 2025 11:19:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C9671191942B;
	Tue,  2 Dec 2025 12:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764674344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8V3hIJFvUgVjg0/tUj7NHCN4G/8vGDXw+L9NVOOC8l4=;
	b=d66PwGmR6xFbSkXchCyHcaQzFN5GVfO0AyQo/yODXfML8MFJHVb0alTIT5YUTicejcOvx4
	WDFeB0rvweqZyxxHICzE+GJbKYhzXn/S7QGhfXb8QP7Wyri9kUPa1RRK/AxC5kd1lyfrHh
	MQC4tkv0f6Dh67I+pxemljbxllZ1m6dtuqhGriKAHFtr9RjD18MfgIge+QugD3v9DbyhLC
	sL9V3E2tlzC1fQ6Fdo+4GK31D26/trGGWTlMZ3OWOYVuLwdDe/CgNbWPGvm6QRncih3lsQ
	krrXozHuRqjPvJASDOxJlvad8izQr/VZJXsOprzRGc3PQXTN7wimnZbgIn1VWw==
Date: Tue, 2 Dec 2025 12:18:56 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miguel Gazquez
 <miguel.gazquez@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, Jyri
 Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@bgdev.pl>, Tony
 Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 05/21] ARM: dts: omap: Bind panel to panel-dpi instead
 of ti,tilcdc,panel driver
Message-ID: <20251202121856.0da62885@kmaincent-XPS-13-7390>
In-Reply-To: <94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-5-49b9ef2e3aa0@bootlin.com>
	<96b1b7bf-ddbe-4213-a201-dc89cf2998dd@ideasonboard.com>
	<3bc5bf92-05c3-4841-ab28-9bab2bb31cd5@kernel.org>
	<20251202104244.59a9e83d@kmaincent-XPS-13-7390>
	<d7515cd3-5488-4d15-82dc-d2b98cfa2bed@kernel.org>
	<20251202114416.09624a4b@kmaincent-XPS-13-7390>
	<94e254fa-289d-41ed-909f-1742cfbb2690@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_031908_839243_232BDFA8 
X-CRM114-Status: GOOD (  28.48  )
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

On Tue, 2 Dec 2025 11:47:40 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/12/2025 11:44, Kory Maincent wrote:
> > On Tue, 2 Dec 2025 11:28:55 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >  =20
> >> On 02/12/2025 10:42, Kory Maincent wrote: =20
> >>>     =20
> >>>> Stuffing DTS change in the middle of the driver change tries to hide
> >>>> impact, which is not nice on its own.   =20
> >>>
> >>> As it needs driver change before the removal for not breaking things =
it
> >>> can't be done at the beginning of the series.   =20
> >>
> >> And that is the problem which should stop you there and rethink how to
> >> organize it without impacting users. DTS cannot go via DRM. If that was
> >> your intention, that's my:
> >>
> >> NAK =20
> >=20
> > My intention was to raise discussion over the ugly and legacy tilcdc-pa=
nel
> > binding and what to do with it. But it seems you don't want to, that's a
> > shame. =20
>=20
> I don't see how you get to these conclusions. I comment that putting
> here DTS in the middle without any explanation of the impact is not
> correct and this one alone I disagree with.

Because you didn't replied to the first line of my answer:
"Yes, I know this but I still wanted to try and begin a discussion on this,=
 as I
really thought it is not a good idea to add and maintain an new non-standard
panel driver solely for this tilcdc panel binding."

But indeed you are right, I should have put more explanation on why there i=
s DTS
and binding change in the middle of the series. Sorry for that.
=20
> From that you claim I don't want to fix things...
>=20
> DTS cannot go to drm, which means you either need to separate the change
> and make entire work bisectable and backwards compatible for some time
> OR at least document clearly the impact as we always ask.

The thing is, if I split it, it has to be in 3. One for the of DRM bus flags
support, a second for the the devicetree and binding change and a third for=
 the
whole tilcdc and tda998x cleaning stuff. I think I will go for one series, =
with
better documentation.

Now, what is your point of view on my question. Will you nak any binding
removal even if the binding is ugly and legacy and imply maintaining an
non-standard tilcdc panel driver? I know it breaks DTB compatibility but th=
ere
is several argument to not keep it. See patch 6.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

