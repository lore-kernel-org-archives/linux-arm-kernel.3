Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E923CD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmyTq2q+hM5yLfaOwvV4mt3DtxhrkyZjZ87SLQzIRvc=; b=vq1jhjo5YCJndV9QVo9xVdkWeE
	Q525OpCzFz1GuPKf4F5mckRYa3TNgztWKqXxYxci7nBi0EumqkxUMwn1/EaRU+wkU8z2FGZ5DkSQQ
	3+UL1c5ZEQHuYwzahZod+CC5OaPOhp/6lDc2JQU9Kz9tG3R4Fl6v5ZkxyK6p4v3Xk7+EQ1Dj/JHSU
	mHR+lB7SQXtvU+pStFn7iv20euPYjm6S6zGVxw3b43dpB2hLx/R+GKk2RLZeaNvEiSVAkbiBimMx8
	sFYRaRMwN66QKR3OUo1WSHj5GPUCXxtm2PU087pTvJ4mp/vbplUoJxrAJC/DbX3xYpq7TnNQuNomM
	R7qTlkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7Hm-00000004KGI-3Gz4;
	Mon, 01 Dec 2025 17:02:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ7Hk-00000004KG9-2rMf;
	Mon, 01 Dec 2025 17:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A07CE6014A;
	Mon,  1 Dec 2025 17:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5905C116C6;
	Mon,  1 Dec 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764608519;
	bh=bmyTq2q+hM5yLfaOwvV4mt3DtxhrkyZjZ87SLQzIRvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jr7StedPEyC4/M1t7fb11w5L7eX7EwY91G07P7AMGijfckxto+L1WhwGZsjlsXYIY
	 oPOBlsHBliJM+a+Ck+s95tJX7dUkcTP5pveCNFp/krPg4vR0LXWKAYEHPMZFH7BnSa
	 w/jmhdgHtlBNuR767BlzygS7X3PXNC6OjSXYaqFQBISNpnI6dO3zRh4SkdSFewBq7X
	 zREFhG+p8OGRGjPPiSi80gwvkw0y85GNS/W5tNjwqV7H9L1DBf2eLGS8ArX4PFGdca
	 NRClciXygKLJ3Mf0U36BtEe3k+YhGpk6jI8Jy8BC6oYJJRGMbYG05OQchgkdz3i2TA
	 5RsxeDtcuuY4Q==
Date: Mon, 1 Dec 2025 18:01:56 +0100
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
Message-ID: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
References: <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nhtgib353qneclwb"
Content-Disposition: inline
In-Reply-To: <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
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


--nhtgib353qneclwb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > So it's not really impossible, you just need some hardware and a day's
> > worth of work.
> >=20
> > There's no reason these should get a pass, it's breaking the spec for no
> > reason.
> >=20
> > > > For SPD, It's really not clear to me why atomic_check should do tha=
t in
> > > > the first place. Your initial concern was about exposing infoframes=
 in
> > > > debugfs that wouldn't be used by the driver.
> > > >=20
> > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > whatever is in the atomic state, what's should we force drivers to =
do
> > > > that?
> > >=20
> > > I really don't think that drivers should mess up with debugfs on their
> > > own. Making atomic_check() disable the unsupported InfoFrames makes t=
he
> > > picture perfect: the DRM no longer tries to program them to the
> > > hardware, DebugFS files stay empty, so the whole state becomes
> > > consistent.
> >=20
> > In the "bridge has no access to infoframes" case, there's really no
> > infoframe. An empty file is "the infoframe can be there but isn't used",
> > not "we don't have access to it and can't report them". Only drivers
> > have those infos.
> >=20
> > If we do split up write_infoframe into multiple functions though, I
> > guess we could create the debugfs file only if the function pointer is
> > set, which removes drivers' involvement if you don't like that.
>=20
> I'm fine with not using HDMI connector framework for lt9611uxc.
> Likewise, I think, it's fine to have empty files for the infoframes
> which are not being sent over the wire for any reason (hw not supporting
> it is one of the reasons).

I can't think of any other example in the kernel where an empty file
means that the driver doesn't support something.

Maxime

--nhtgib353qneclwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaS3KBAAKCRAnX84Zoj2+
dpehAX9df8UFvZVN58dQXWwnBnuke2vOU1UxT4zbhxIdR/6V/O2rER74TkmbviQv
h0HIhF0BgLOgEP5gmSlL9xZCFl5EWhJpy16T7ozKZGULaHEy/3NJR+/SzYOZmLZ5
yR5aU4SDRQ==
=m4w1
-----END PGP SIGNATURE-----

--nhtgib353qneclwb--

