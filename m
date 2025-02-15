Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92A8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drN/Xok8UudjMurUXacPKQ2++MI+GHNgJsb1gQKHxmw=; b=akGHFjRWeq+t0SqwVh+9LTGNyD
	hBdeIa0bDl9YRThNgwmW2xuaGDDJsZ7ja8ywiSPBC1zIYqU6dtV2F7unyUM/KFHbxjN1HWysNo40R
	NQa8C1/KbZMid1G7IPMJz6RhJAR2t/9r6dVNw+21OpHvi/p8vdBYEvMmwKK7X0MOE2WZwiTX18oO7
	SzAsXk7IoEXiaR05tYfv5/WTKJGz/pY4Cv2BYk4SSuQsO2m/cD+jMAN9f5QT3Sbwu8RQvyujFIr2z
	q/RLXBzcEbJTTlCpYNFxuMCaRFUljGw0cNu1BbvIahjhWBvZCEa1lTCzOeTDcg7uxyGeUXld1VgKU
	mjUZwIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHeF-000000005hF-1UkB;
	Sat, 15 Feb 2025 12:51:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHcm-000000005Xl-3qBu;
	Sat, 15 Feb 2025 12:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8520A40362;
	Sat, 15 Feb 2025 12:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BD0C4CEE9;
	Sat, 15 Feb 2025 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739623822;
	bh=drN/Xok8UudjMurUXacPKQ2++MI+GHNgJsb1gQKHxmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI7OwbBejVq+s0MNcjVR0OO68WWGeU3nLMSFjv/iooPZQkFgekvtYlJVZMHL4yhGu
	 X+NvMH38mriKk1PDUcyHjwbzECOAXrRCBNn9U36VXx/c8m+LhK9r+9CyTE6RYI4i18
	 r1pLW7R4TInPKnEeFX9WUG5PqtfWIPuLmmuUoi3E8A0A0/4ZupRtFx5ykSkJfxoWU1
	 JSSIsK/AtdQvdtCF3n/UYl3JTA4Hs4cA70QyCuK0IzY+i8/ZvMd1HSVZ2fGkRVyFmc
	 3KBpadsxw7ag6TDN+7Q0Rn0JRDwxVXa6Ic4DnHHR5HSm4OAwa2yr2Q1DySe1dJlh9Y
	 F8vI+B2Os2Bpg==
Date: Sat, 15 Feb 2025 12:50:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
Message-ID: <20250215-scared-clothing-942f9bf3d039@spud>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud>
 <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
 <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2DqldZNjQ+dLYWFk"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_045025_088602_05D33EAD 
X-CRM114-Status: GOOD (  21.77  )
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


--2DqldZNjQ+dLYWFk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 07:25:59AM -0800, Doug Anderson wrote:
> Hi,
>=20
> On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
> >
> > > One think that's always felt a bit meh to me is this id number stuff,
> > > I just threw in 666 for meme value.
> >
> > :)
> >
> > > The whole thing seems super
> > > arbitrary, do any of the users of this helper actually put meaningful
> > > values into the id parameter?
> >
> > In example changes I've sent, no.
> >
> > In other simple usages (those using container_of()) of the auxiliary
> > bus, I think there are a few that uses 0 and 1 for 2 instances.
> >
> > I guess your question is "do we really need this parameter here ?"
> >
> > We could remove it and still address 90% of the original target.
> >
> > Keeping it leaves the door open in case the figure above does not hold
> > and it is pretty cheap to do. It could also enable drivers requiring an
> > IDA to use the helper, possibly.
>=20
> FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
> you'll need the ID value. ;-)
>=20
> There was a big-ol' discussion here:
>=20
> https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.172918=
0470.git.geert+renesas@glider.be
>=20
> I eventually pushed v2 of the patch:
>=20
> https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.173384=
0089.git.geert+renesas@glider.be

Think it makes sense to have a "simplified" wrapper for the cases where
the id has no meaning then? Not really a fan of the drivers coming up with
magic numbers.

--2DqldZNjQ+dLYWFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7CNhAAKCRB4tDGHoIJi
0tAUAQCqnRPkOySGXu//3wT8OcQkfE+e51feUW6fi3X49on2qQD9FeMpjQKlnQ9Q
UjJ/Rxce6BMBO5o9ndbm21Ie8SKdSAY=
=owAZ
-----END PGP SIGNATURE-----

--2DqldZNjQ+dLYWFk--

