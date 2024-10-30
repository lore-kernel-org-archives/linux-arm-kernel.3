Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8DCD5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/tzjbhXfaCqhSMKgESsJft8b8FSTl1t1gy6bCBE87w=; b=K9oG367bho5IX7Z1eF1jwKCVC2
	W88S7AAHl1L/7lvQkORVqLrbWUiwVWhZxuzoasd2bBqJctjIYNL+gz3aiAjGIy/9isetuJiIymm4v
	unHG3ELN+jy4u4mBxiEyx5aP4exVuRwabqgeyFme0gYE4dFyt2JazkQUsEzGTX9oxou7MDBQ5HEqz
	LMkzLsPxxRbnBW8ojQascwBrHMWjo97V28U4KP5N225s3y+M/TE9eYbfV626GFa+CWRItkXt0pDjz
	q8HIB4zf/0855zKfzoQezA7VpD93AyuKYP9a4KVOtIJzmIQpWyo/qIC6hflaLQgqAciuDvBOaKDJF
	prQErOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t667a-0000000HaQd-1cDt;
	Wed, 30 Oct 2024 10:40:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65xs-0000000HYRE-2aBn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA55A5C3178;
	Wed, 30 Oct 2024 10:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E7CC4CEE3;
	Wed, 30 Oct 2024 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730284211;
	bh=fEyGQG5p+/Axzk94LPtg9MyYLs8WiA+7sDPOBdC8nuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPBom++Ip3zXbNr4S9qX5JpImsDxqHoTocohiCaoOx5wNTJbiARb4bC/qMG+xkcKl
	 4bo9Z5yrvUKpiXeTjblCmlZFumY+okw/Vt7mCFA55EdghPH5Za2gM3Pd4VOqUoihoM
	 RC1xYCQrttOvZlsb/YnO8yx8rwmJMkz4dkArPco2y1Naytv1uKPyxf+rLmFiNnWqL4
	 hLvcUJg2ZZj271QMiXn3eMmS3Gk3eUI74tYuVqsgFHmT1D26eR4bwwRZoXeSi29m2C
	 o24VUlOK0cedEcwP3X/B28lsMehPiZZsJvfrGYvPA5SwkdJ/67vIoYA0QMo/YjPKne
	 u3uClG+jbjG3A==
Date: Wed, 30 Oct 2024 11:30:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Message-ID: <20241030-hypersonic-tremendous-tuatara-2bbeb0@houat>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-4-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jdfa4z4pqzuvoooj"
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-4-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_033012_766463_DAAABC83 
X-CRM114-Status: GOOD (  17.00  )
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


--jdfa4z4pqzuvoooj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 10:37:30AM +0800, Liu Ying wrote:
> Multiple display modes could be read from a display device's EDID.
> Use clk_round_rate() to validate the "ldb" clock rate for each mode
> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>=20
> Also, since this driver doesn't directly reference pixel clock, use
> clk_round_rate() to validate the pixel clock rate against the "ldb"
> clock if the "ldb" clock and the pixel clock are sibling in clock
> tree.  This is not done in display controller driver because
> drm_crtc_helper_funcs::mode_valid() may not decide to do the
> validation or not if multiple encoders are connected to the CRTC,
> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
> parallel display output simultaneously.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Note that this patch depends on a patch in shawnguo/imx/fixes:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2024101703114=
6.157996-1-marex@denx.de/

I still believe that the root cause of this issue is your clock tree and
driver setup, and since I've asked for explanations and didn't get any,
I don't really see how we can move forward here.

Maxime

--jdfa4z4pqzuvoooj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyIKrAAKCRAnX84Zoj2+
dk5eAYDDyKjKmenLlLXrE7PF5+02MCRjxjyPZUPeFcxn9WqZwrqLx6hAeRNfTD1I
fBz39NEBgPedANzTVocrGaKTqjaLuKN1UWpfFGVqf9OjORjTtsRTq+Rg7VBMH8ER
7Vm4WtqjxQ==
=QcTM
-----END PGP SIGNATURE-----

--jdfa4z4pqzuvoooj--

