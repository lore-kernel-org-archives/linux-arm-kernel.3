Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D65DCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 06:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrUdE2khAdlf1/MsWrHbA7qdAiwyidVJ+i8uJKDW1Wk=; b=U7vPztRPuKUOA/ocVwBxF/Y5i4
	Z+63u1U3tTcUa4/wdCeWLRjhd/MCPc2I0NN31vyIlsl8P/vq3oYNc2EMhZksEXI58mGvWpiIRA7Ge
	0G/72oy6tZGgIxxGpDmSOAGl2IHHNLukFc7bussxsiMvwnvq9Z1w4i//itlTXAdP0Gzja6BPQ7MXE
	wVVdHurF4rzkUROydDo4C/Bd+5S0w00j5G6+gCazRf07ihmNXrWsyo/kvd2p+OZoreMxAQSC85TXB
	vgtwYMc8StH5OUSGvxbvTkR2hKHL/Fo4vNqIexyQvUdDwdZfNqibXjIPJsVmvw6yq7BOciWmKRXYU
	y0EnnNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAcv-00000007vMZ-1lXz;
	Thu, 01 Oct 2026 06:50:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAcu-00000007vMO-3Hpr;
	Thu, 01 Oct 2026 06:50:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D07E1601F6;
	Thu,  1 Oct 2026 06:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020551F000FF;
	Thu,  1 Oct 2026 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837443;
	bh=WrUdE2khAdlf1/MsWrHbA7qdAiwyidVJ+i8uJKDW1Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q/e1gTPSrCSD68j7AaM7kzhCj2ouy4/v4QCOpa4HPL95utDNjJDwaZcZ5yGt5FqHT
	 dD9PdDvoB5wopVPaRUq1UAeYloJJeguRywdsCqjCiiKB5cxWI4vPLwYkY7+3LZtATD
	 KmVg3PbwmG1y5oDsWEQPpIJPN2OQb+UI+VrOfR3kxc8KHogXvmB8fJraf4V0sqQ2Oz
	 vAgJ6b627+BtkKxmUT/wjiJH6AUNYmTPfdyuQSm0oPlybPjUoP725ioqJLOgWUMbq7
	 tEA/EsJoAied51k1DcbyvxC6A3+5Qr44rstP7rVsk6lSHACIUtf8vJgXinZravVGlZ
	 cvLpKC2jfGAfg==
Date: Thu, 1 Oct 2026 08:50:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
Message-ID: <ar4CRTMQGs5_nGKY@houat>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org>
 <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kw273bz54geum3wd"
Content-Disposition: inline
In-Reply-To: <828c9108-2db1-45a6-9301-19159a094301@linaro.org>
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


--kw273bz54geum3wd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 03:37:58PM +0200, Neil Armstrong wrote:
> On 9/29/26 09:55, Javier Martinez Canillas wrote:
> > Maxime Ripard <mripard@kernel.org> writes:
> >=20
> > > On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
> > > > On 9/28/26 21:48, Benjamin Tissoires wrote:
> > > > > On Sep 28 2026, Neil Armstrong wrote:
> > > > > > On 9/28/26 19:24, Benjamin Tissoires wrote:
> > > > > > > On Sep 28 2026, Neil Armstrong wrote:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > On 9/28/26 18:22, Maxime Ripard wrote:
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > Panels in general, and MIPI-DSI panels in particular, are=
 pretty
> > > > > > > > > difficult to support and require pretty much a panel driv=
er for each
> > > > > > > > > panel produced. Most of them are pretty simple, and requi=
re an opaque
> > > > > > > > > initialization sequence that is usually poorly documented.
> > > > > > > > >=20
> > > > > > > > > This creates a tension between OEMs and distros because O=
EMs will
> > > > > > > > > typically get a new panel to react to a sourcing issue du=
ring
> > > > > > > > > production, and thus need some swift turnaround between g=
etting their
> > > > > > > > > new panel and it being operational in the OS. Distributio=
ns on the other
> > > > > > > > > hand can take years to ship a kernel with that new panel =
driver.
> > > > > > > > >=20
> > > > > > > > > To solve this, I followed the example of HID-BPF and wrot=
e a panel
> > > > > > > > > driver that will rely on BPF programs to perform the panel
> > > > > > > > > initialization. That way, we can ship the programs separa=
tely from the
> > > > > > > > > kernel, and with a different lifecycle. If this driver is=
 accepted, the
> > > > > > > > > plan is to have a userspace component started by udev to =
identify and
> > > > > > > > > load the right BPF program for the panels found on the de=
vice.
> > > > > > > >=20
> > > > > > > > This is kind of late for serious applications except if we =
manage to
> > > > > > > > solve the bootloader to Linux display engine transition.
> > > > > > > >=20
> >=20
> > Besides what Maxime already mentioned (that most general purpose Linux =
distributions
> > built the drivers as modules anyways), it doesn't have to be mutually e=
xclusive.
> >=20
> > A simple panel could be supported using this BPF-based driver and then =
a panel driver
> > added to the kernel, if is found that some applications need to have it=
 built-in and
> > earlier in the boot path.
> >=20
> > I don't see why this would be any different than HDI-BPF or other BPF-b=
ased infra,
> > such as sched_ext.
>
> I don't want to add a supplementary maintenance burden for the sake of us=
ing a cool
> technology which has serious drawbacks and dependencies on user-space eve=
n if looks
> really cool.

Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
you can have a built-in panel driver that works without user-space
intervention. So this is not a topic of discussion anymore.

Maxime


will work

--kw273bz54geum3wd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCar4CvwAKCRAnX84Zoj2+
dvcSAX49Wfvd2Nx91Qlv77RICWSMxTGFolQVADy53gvu7ebfWo/lEDg2wmMLUV5U
MkA52hMBgIONoBjDpHdMNV7byAvh44CSyrq8DcktEoCEF8a0dOoxQJ5lKBLZgdH2
o+5/ElvokQ==
=5iv0
-----END PGP SIGNATURE-----

--kw273bz54geum3wd--

