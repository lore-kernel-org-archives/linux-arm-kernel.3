Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BC0CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k236eWi+M5Kl1aDNRgsPv/grlHCNH6C+N1amhk4LcOw=; b=bwUwBQymUR90KpoxqTV2DFfUMD
	uOe/oAaL70zb+Okf44eOQrmR1vC6krMPOewWxKPB+N/ZMFnoE+gf5Qts7R9N2ujIFNmB6z0HRdqvt
	2P1i4QWREHyBEy4RryqT5wAEmPMEwp42kyS6nrszFM+x1P/RU1JF6hhsoh4/z1FkiHmYSp3VCxA9G
	nUUM98lctjIQI3pENT2L0R5cQkbuthu0w6H8P44/LcAyPngCMWo3E2CP0hAA//W/0b2MEDbmFH23G
	BX/VKhE7IYCy+6wXNMhwuyEzwXMOsnjLZOuuIGHBF65/5ZN7NUlUzAKwowdb7ViGqaatVS21sz8YZ
	CmlfuqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS1b-00000002ZBf-3Uw6;
	Tue, 29 Sep 2026 07:13:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBS1b-00000002ZBR-01Te;
	Tue, 29 Sep 2026 07:13:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AE84602CA;
	Tue, 29 Sep 2026 07:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4E31F00893;
	Tue, 29 Sep 2026 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790665993;
	bh=k236eWi+M5Kl1aDNRgsPv/grlHCNH6C+N1amhk4LcOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TcWJc2OVhQ+OIxvo7yTo3+t3eCUNHfFnKvWsbDnx/x+DCJmJqafvbFi3yTGdO9Qz5
	 QZt5FW2m1vQB528/lLWlixZgPaVL6meon9ULndYSbwLcenzgFQKPrZsktUJLfpBjQU
	 5KjrXKmKS2Eb2YG7U3f4uR02Z9O8I84RmYWMyyBaXO0IDV/YW+lP+mxqDiMnz//Pdt
	 H6b+KMx/LIncykx3CeOWDp0BFQEr2cdjxuYe+YPDN5yDBsNKK2TM31saZTekPzwGOA
	 J6movutHxJgScZVaASTSimb6UH2x8wH4QP9+lEIEjGSahOxLIwTqmEKbD04qBNX2VK
	 mVlLKF7ClacEQ==
Date: Tue, 29 Sep 2026 09:13:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
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
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
Message-ID: <artgrTe6wvKxnUOG@houat>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="m73zwlja27vosc47"
Content-Disposition: inline
In-Reply-To: <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
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


--m73zwlja27vosc47
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
MIME-Version: 1.0

Hi Neil,

On Mon, Sep 28, 2026 at 06:39:58PM +0200, Neil Armstrong wrote:
> On 9/28/26 18:22, Maxime Ripard wrote:
> > Panels in general, and MIPI-DSI panels in particular, are pretty
> > difficult to support and require pretty much a panel driver for each
> > panel produced. Most of them are pretty simple, and require an opaque
> > initialization sequence that is usually poorly documented.
> >=20
> > This creates a tension between OEMs and distros because OEMs will
> > typically get a new panel to react to a sourcing issue during
> > production, and thus need some swift turnaround between getting their
> > new panel and it being operational in the OS. Distributions on the other
> > hand can take years to ship a kernel with that new panel driver.
> >=20
> > To solve this, I followed the example of HID-BPF and wrote a panel
> > driver that will rely on BPF programs to perform the panel
> > initialization. That way, we can ship the programs separately from the
> > kernel, and with a different lifecycle. If this driver is accepted, the
> > plan is to have a userspace component started by udev to identify and
> > load the right BPF program for the panels found on the device.
>=20
> This is kind of late for serious applications except if we manage to
> solve the bootloader to Linux display engine transition.

Virtually all "generic" distributions are shipping the panel as modules
today anyway, because anything else is nothing but impractical. But
maybe you don't consider them serious enough. Also, applications live in
userspace already, so can be ran after this driver would be initialized
anyway.

> > This driver is fully functional and works with both 5" and 7" Touch
> > Display 2 panels for the RaspberryPi. However, it breaks away from the
> > typical panel driver in multiple ways:
> >=20
> > - BPF programs can only be loaded by userspace. This leaves us with two
> >    choices:
> >=20
> >    * We prevent the driver from loading until the script itself is
> >      loaded. This has the side effect of preventing any other output to
> >      be used until the initramfs is ran at the earliest, and possibly
> >      ever if the loader isn't installed for example.
>=20
> This adds a dependency on user-space behavior and if somehow the
> initramfs doesn't load for a reason we won't have a way to display
> an error.

Yes, if an error happens before the DRM driver loads, it won't be shown
on the screen. This is already the case for any panel driver today on
any major !embedded distribution. And with built-in drivers, this can
also happen before or while the DRM driver loads.

The solution is always the same though: load simpledrm first, move to
the proper DRM device once it's functional. It still works with this
solution.

> >=20
> >    * Or we probe the driver all the time, but only report it as connect=
ed
> >      once a program has been registered. This is somewhat unconventiona=
l,
> >      but allows the other outputs to be functional, *and* allows the us=
er
> >      to force the output if their panel doesn't require any
> >      initialization or during debugging. I chose this solution.
>=20
> Both options are not really great...

Feel free to make any suggestions

> >=20
> > - It's not a panel driver, but a bridge one, which is also pretty
> >    unconventional. This is required because panel drivers don't have
> >    access to a detect callback that is required for the above, but I al=
so
> >    think that the recent work from Luca blurs the line from panels and
> >    bridges and we'll end up going that road anyway.
>=20
> On this point, DDIC _are_ bridges,

I have no idea what a DDIC mean.

> but in the current panel API we blur the line between the panel and
> the DDIC. So being a bridge is fine, but in a general way we lack a
> proper way to describe the display/panel/monitor independently of the
> DDIC.
>=20
> At first glance it's a nice driver, but moving the timings into a blob

Let's not kid ourselves, it's *already* a blob. We just sugar-coated it
enough that we can be happy and call it GPL.

> moves something into possible proprietary binaries with possible
> closed licence and distribution restriction so it's a downgrade for
> the same of bringing up a panel faster.

We can already make a proprietary, out-of-tree, panel driver today. That
being said, the only license we allow for BPF programs here is GPL, so
if anything it would be less of a concern for this than it would be for
regular panels.

Maxime

--m73zwlja27vosc47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCartlBgAKCRAnX84Zoj2+
dqpsAX9ijj8Z64VcCaqKnJ4Lo/1d/9J5/M9PC5fiO6TitAuSIb3LaOEQBIr26yrs
/d/QkF4BgLd/UwC/5QeWZ0LyE+B9yXAqojMbHWgC6MCfuVW5GkhowZ6O3eEVFkIp
3RTmkdPM7Q==
=8v7b
-----END PGP SIGNATURE-----

--m73zwlja27vosc47--

