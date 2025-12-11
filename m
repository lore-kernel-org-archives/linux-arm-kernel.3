Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0597FD41C14
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZVCcNfKSTt2Hd14gUawnCXPs39wl8U5m2GxT9YHICY=; b=F3R2EeJKF3XiC6TuXND462FTNH
	jcoU8QEnF+hqZJyIXuQQkhowSoYZAz+6ebbXevIZJU6JzXVGIb6nyc42+7sLPxIouLhRt0ibkhC+Z
	rc/IzPmwTfBTmdgqn7SNvXXLFf2Qi304I+CrMOd6yPfjqGJbDZeBRus5yTBI6+g230Qn50vImbm/D
	FsjPVeXtT7Yz9hNdx+j+mYlrWo/2+qJRJCyQXifLn7NZZ7tyP8oAIBy9x2Ycnt3qdXITfgDEyOy8J
	ZpIlq7o3Y3p6X29S9gybpIUB4wvvoyhelTuNzttgT838hy1FtY4RaGDr4YeGWrq8fC2AHg4RwZyGY
	uGBVooDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdAA-0000000GRuV-3lFE;
	Thu, 11 Dec 2025 09:40:42 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdA6-0000000GRtg-3gXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:40:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 17EB01A20DF;
	Thu, 11 Dec 2025 09:40:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF0096068C;
	Thu, 11 Dec 2025 09:40:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14F2B103C8D53;
	Thu, 11 Dec 2025 10:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765446032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WZVCcNfKSTt2Hd14gUawnCXPs39wl8U5m2GxT9YHICY=;
	b=N8BY+0RW1/KCWSmz1ejzT8wkU32hMHoROWuSW1FXKVX56lJPTLnrOG87aYRBJX3eLmwdQz
	ElonbiZKTB2yohpJE+9k8TDVw2t9dMGuu4ov3c9BVvflGTXLZViwe/G9lROCs1KMjA5Cg1
	HqAOW3glYucmbg2jWQCfC+vmSqV0f3bRAfIGwFYLKzsrZIZn5PifwpK4SdhZWFCK8zSDep
	NJinbhnm5mFm/zI9m2xrgrfv6TFXNgAyWJZmSCZG+MROAk2te2haBPin+EoimEwAAmRl4c
	665fBJnGyGTn7KpP/dBIwnBN6Ey1VxFEPONWoRQP8/KCoFPe22GeYDOR7es8FA==
Date: Thu, 11 Dec 2025 10:40:24 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 03/21] drm/tilcdc: Remove simulate_vesa_sync flag
Message-ID: <20251211104024.1e7d5c42@kmaincent-XPS-13-7390>
In-Reply-To: <DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
	<20251126-feature_tilcdc-v1-3-49b9ef2e3aa0@bootlin.com>
	<DEUQM2HNEOQU.3K4ZPL44GVZAJ@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_014039_074590_F146CF48 
X-CRM114-Status: GOOD (  21.49  )
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

On Wed, 10 Dec 2025 19:10:45 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hi K=C3=B6ry,
>=20
> On Wed Nov 26, 2025 at 6:35 PM CET, Kory Maincent (TI.com) wrote:
> > The tilcdc hardware does not generate VESA-compliant sync signals. It
> > aligns the vertical sync (VS) on the second edge of the horizontal sync
> > (HS) instead of the first edge. To compensate for this hardware
> > behavior, the driver applies a timing adjustment in mode_fixup().
> >
> > Previously, this adjustment was conditional based on the simulate_vesa_=
sync
> > flag, which was only set when using external encoders. This appears
> > problematic because:
> >
> > 1. The timing adjustment seems needed for the hardware behavior regardl=
ess
> >    of whether an external encoder is used
> > 2. The external encoder infrastructure is driver-specific and being
> >    removed due to design issues
> > 3. Boards using tilcdc without bridges (e.g., am335x-evm, am335x-evmsk)
> >    may not be getting the necessary timing adjustments
> >
> > Remove the simulate_vesa_sync flag and apply the VESA sync timing
> > adjustment unconditionally, ensuring consistent behavior across all
> > configurations. While it's unclear if the previous conditional behavior
> > was causing actual issues, the unconditional adjustment better reflects
> > the hardware's characteristics.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Only few board currently use tilcdc not associated to a bridge like the
> > am335x_evm or the am335x-evmsk. =20
>=20
> Have you tested this change on any affected board?
>=20
> The change looks good to me but without some testing it would be risky.

I have tested it on few boards but not these mainline devicetree as I don't
have them.

I have tested a tilcdc with tda998x bridge (BeagleBone Black), a tilcdc with
ti,tilcdc,panel panel (BeagleBone with LCD cape), a tilcdc with it66121 bri=
dge
(new Beagle Bone Green Eco board with HDMI cape).
That's all the boards I have.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

