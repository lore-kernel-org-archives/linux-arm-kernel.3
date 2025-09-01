Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE88CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vJCwyEJMaV7jf9vetzNdL36/dHPCCjOdasvmwhEZCQ=; b=wbGeXS/POb+V7tDfG36QavSDN/
	t95C2RBOAeHDiohwVW6CJbOYY5Jb4LxtyDvOCadlv2O9sQ8kMOUuvhJyINQEGgV0/eN5cnNRLwMFT
	TdrugItvPHwk/qJrHDH9dKkoIwr9/OspdTUQYmEsDQgoU34mDEqz115EjwQVULkri+/SV/56v4Omk
	44AgFHfSKEFPb+WST2IzYGtE33RRsBPrxIHF9uNxfVDczwdV1l01lGbUDfjMy0coWkZ9PFKoN8No3
	ODV0qmXXFRh323IjjcX09MyOPZsGvmFEHfNC1spuJ5Qk+zGeq4Z7fT0gd1A+vbbaCohF3FxCLm4DY
	MDoDh6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszMj-0000000BUeU-2UxX;
	Mon, 01 Sep 2025 07:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyd8-0000000BPHn-23rK;
	Mon, 01 Sep 2025 07:07:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95214601CF;
	Mon,  1 Sep 2025 07:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36AAC4CEF0;
	Mon,  1 Sep 2025 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756710425;
	bh=t+EbY02dYwHMIRuwPA5LMX8oq95JwdclceCsg6WGxsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5XeNc7Cv8GxToCWwX2Wxf/Wd6+4Qx6COMqHte76KADDpb+1z8AKRSxY6/EQkZsgR
	 XU68REjcq5ar0q/5UboMi/cxrMF+TtEIR/lmNmC2jKNclSCAOkiIkggT37yW0Nz5l4
	 rm1oNIGdwRJ83ZPkjV3V4smIHmG0XyUrsKjkTXLMSfSd9rhIsqNJ25AYmZf0bLVLqC
	 /BJm/0E2s+8zmuE4ar/44x3lc4owarPZsOPbPGXuGOIeiatzWgOPmRLL6mVuSF53eN
	 ta3VK1kmgw6yrtxVWfdHJUMBg3Cc7UrhUCP6ozK/Xl59CGRh5NZpeSd6GC8KBBz9lR
	 rJmN+CkJNRR6A==
Date: Mon, 1 Sep 2025 09:07:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <20250901-voracious-classy-hedgehog-ee28ef@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ma3smgpulpnwz33z"
Content-Disposition: inline
In-Reply-To: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
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


--ma3smgpulpnwz33z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > Hi Dmitry,
> >=20
> > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > It's not uncommon for the particular device to support only a subset =
of
> > > HDMI InfoFrames. It's not a big problem for the kernel, since we adop=
ted
> > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > problem for the userspace: we end up having files in debugfs which do
> > > mot match what is being sent on the wire.
> > >
> > > Sort that out, making sure that all interfaces are consistent.
> >=20
> > Thanks for the series, it's a really good cleanup.
> >=20
> > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > packing it into the two GHDMI banks. So the supported set there is
> > 'all of the currently well-known ones, plus any two others, but only
> > two and not more'. I wonder if that has any effect on the interface
> > you were thinking about for userspace?
>=20
> I was mostly concerned with the existing debugfs interface (as it is
> also used e.g. for edid-decode, etc).
>=20
> It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> HDMI also have those. I don't have at hand the proper datasheet for
> LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> generic).  Maybe we should change debugfs integration to register the
> file when the frame is being enabled and removing it when it gets unset.

But, like, for what benefit?

It's a debugfs interface for userspace to consume. The current setup
works fine with edid-decode already. Why should we complicate the design
that much and create fun races like "I'm running edid-decode in parallel
to a modeset that would remove the file I just opened, what is the file
now?".

> Then in the long run we can add 'slots' and allocate some of the frames
> to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> salvaged as another generic one)). MSM HDMI would get 'software AVI',
> 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> want to use). Then the framework might be able to prioritize whether to
> use generic slots for important data (as DRM HDR, HDMI) or less important
> (SPD).

Why is it something for the framework to deal with? If you want to have
extra infoframes in there, just go ahead and create additional debugfs
files in your driver.

If you want to have the slot mechanism, check in your atomic_check that
only $NUM_SLOT at most infoframes are set.

Maxime

--ma3smgpulpnwz33z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVGFgAKCRAnX84Zoj2+
dllrAX94GZ81N40ectCnxYcKj+nZpN6UcMWR8EYDih6ILK4w0J49eNzGARVXu+eF
lwB1CJoBfjdbnsga9yVjeXCFRH47XfORMMFpd6RIh/AoUJ7fu6AYlLvYNrTwxgRE
sw4U5RZ1qg==
=g974
-----END PGP SIGNATURE-----

--ma3smgpulpnwz33z--

