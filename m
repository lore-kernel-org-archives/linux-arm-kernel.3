Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37784CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxpBdJOKyHxhngHMSjEG8dbk7vjw3wQLT/ZIoSyljj8=; b=3w82+UzqHZj1OGKz4AIJzw+4cj
	cl2PujovHV+FB8OnPph0HsLfJgxZcx4PnUD436yaXQKjioA2RTuV7rwt9uGOLO1Ud32X/KAd2P2aq
	4BS43+XBtV1CHkaI/I11HLedL+39lo/p+enfxV+Ue44RryY6YVsBLk/1ajxN8C2Lz9zMqXCydYe2n
	SUwCPSlUvVA3GLI+ILU6/b29QDfkER5La52eRsjlt9kZvOY2S/tXutlf4wxxr1yA74YE3NAzgKMT0
	twPSFebit53TSSjoLWAr3ZarB/wlIPpaK0ZeSFdLrgl+pXN/jZeDh2poyH8hcB4qOga5tZCcQChPn
	6dv1RJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiyF-0000000Fwti-0vuN;
	Tue, 28 Oct 2025 12:38:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiyE-0000000FwtP-0idY;
	Tue, 28 Oct 2025 12:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 371A661F8D;
	Tue, 28 Oct 2025 12:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF00C4CEE7;
	Tue, 28 Oct 2025 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761655116;
	bh=Sgz9LM+rIzEejdNuUc0XX3Frhog1qNK56KvIynP1aZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwQ6yHAd1upusPVwE5p+extaxEraz/6D8uln43vA20qkPH8j3iCntKEBGAaVql/8Q
	 8Gy+UemAF2VbganZ3h9uwOojrtdW9/p/ZsfZWUHKLmRC2cUOVkXeHglFajnxSjcrYN
	 /mNFBPFkbx/fNUMxCUwVgKp3Ds5a2jMjHw4j9oUx8Kw+BPhmWADMdwEhfWOUQMQ80h
	 mB+YHWfKzYHYzNt4tjHZPJW2yCsBQejaO/xw6r/H8odaXC9erZ4H1bc6f6foMwvNci
	 21ZeNhAPIdCYn72cAS/vENim2yYkoK0h5pntciSTo1F1t8M/iW/QQjEBoBrDOXp2+z
	 zoKiEZKXcxa0w==
Date: Tue, 28 Oct 2025 12:38:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Derek Foreman <derek.foreman@collabora.com>,
	Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
Message-ID: <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A23rxmyNw6MilB90"
Content-Disposition: inline
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
X-Cookie: 40 isn't old.  If you're a tree.
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


--A23rxmyNw6MilB90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.

For the past couple of weeks we've been seeing various instability with
the graphics drivers on the Rock 5B in -next, the most common system is
that we get faults in code that looks suspiciously relevant to this
series:

<6>[   17.353368] rockchip-drm display-subsystem: bound fdd90000.vop (ops v=
op2_component_ops [rockchipdrm])
<6>[   17.355237] dwhdmiqp-rockchip fde80000.hdmi: registered DesignWare HD=
MI QP I2C bus driver
/ # <1>[   17.357803] Unable to handle kernel NULL pointer dereference at v=
irtual address 0000000000000098

=2E..

<4>[   17.372390] Hardware name: Radxa ROCK 5B (DT)

=2E..

<4>[   17.382082] Call trace:
<4>[   17.382317]  drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display=
_helper] (P)
<4>[   17.383003]  drm_bridge_connector_init+0x658/0x678 [drm_display_helpe=
r]
<4>[   17.383612]  dw_hdmi_qp_rockchip_bind+0x35c/0x4d8 [rockchipdrm]
<4>[   17.384159]  component_bind_all+0x118/0x248
<4>[   17.384550]  rockchip_drm_bind+0xb4/0x20c [rockchipdrm]
<4>[   17.385034]  try_to_bring_up_aggregate_device+0x164/0x1d0
<4>[   17.385528]  component_master_add_with_match+0xc4/0x104
<4>[   17.386008]  rockchip_drm_platform_probe+0x1f8/0x31c [rockchipdrm]

(from today's -next,=20

Unfortunately we haven't managed to point at a specific commit, it looks
like this might be triggered by multiple serieses interacting with each
other.  I'm not sure what other information might be useful here?

--A23rxmyNw6MilB90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkAuUQACgkQJNaLcl1U
h9AC5Af9Gsb4c9sm1p8qLFIcW6aNDsp2F5861XAQCPph+mfIxTF3n6q/jQj+eH9b
/cUphOwQBRLk3Fw4QeeqaFrdnJ0iB0wTMqmI5G9O1qhAPxNN5bT3KpnJr98CRDho
GRIy4XrxxbNA2JaKX1J8lLkSdacR1Yb5hbcUqH4a2cwpbxWhod9+wkupjvzIwuRg
hA8sU1Wyn/d5MvG5W9oTBwPpwuyFDUlk8cKs9zpY0pKUw0TEt6+GXAjLitxraUJ3
SC5uzQI1896NYBjZ+mH11kVTb3TtIqmNn5DL3UkmXBQF+px6Am8U8jSb08GMVuiB
dOojB0KL8DVxYUUnxdeQFnBNT46FKw==
=38PJ
-----END PGP SIGNATURE-----

--A23rxmyNw6MilB90--

