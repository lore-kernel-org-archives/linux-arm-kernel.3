Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D750BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2V47s0eeSIvGJBOTuqeV8jHVOB+1VLuJ+K/KKhfb78=; b=lr2KgMDfbxRAT89EO0W2bOus5Z
	d1oJZ+0AFsmJXObopIdAw6O0ltNXYhy9UhMcRTltYo0g9/fLupAfQw6KEZVbX7jdL7HZlJYAlha0K
	2IxbWDg+bE8KcTRnQjOMv2Y0MWTFe8j7/k0zARBEzmmkTGHDAjpNRqGq+076b1d8ZNWoMrDZNuOpy
	4cfFGnej8EZ8FHLDf/BpWs9EGNPGUVamifJP7f1JR9Y7kqlW6o89vZHBL1lJWrSsb+RCbxLqjjS1u
	tbk7UcL/Yg+AxiZaMDY/hL7SGK2r56zp+m7sm6QzPILaRiBzRJuCI84fP/oP8zyRHwEwjDiMtEmtx
	S0FufKXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYM8-0000000Di2U-2QQI;
	Tue, 17 Dec 2024 14:15:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYEp-0000000DgRB-0K3O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55082A40A5E;
	Tue, 17 Dec 2024 14:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E9AC4CED4;
	Tue, 17 Dec 2024 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734444469;
	bh=NHRPgt9wZuKfaDWbuJvrt8FxIJ18k5TlIbXw6qXpATM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdqrvRksl62YTEOQQxP1LPgHv/7pPyNLtnne7/dp54gk73TTLTzdxItrRyyzkQ51f
	 rou+tPY6lfyrmFkCJMrDQRv50YppGFwlUSS7yKJv/4un61EOQ/5UNMUjH6j9MyfWgk
	 q2odp09139vKJtO9tl/Ivkiy3EXrOckHr/ow0qIjmBllbamOm6MQLFbR8TSsNuVnFm
	 fK8McHqaQbbWxsXeZj1/kQARRFtkrrx7MRDBvePedetWl7mMu2n8WSLl6lX05XPQm3
	 8aI1ZmIWHsPE/WpoEOn6posksLs2CyZwLgVkmlS2x/+QQME+5B/v9UkgDFj+Q/05I3
	 EPc+wFXCS4k/w==
Date: Tue, 17 Dec 2024 15:07:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	arnd@arndb.de, nfraprado@collabora.com, marex@denx.de
Subject: Re: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
Message-ID: <20241217-uppish-sapphire-dinosaur-4c40a2@houat>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hu6r2ojwiq6ufs4p"
Content-Disposition: inline
In-Reply-To: <20241114065759.3341908-1-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_060751_279128_443ACAB5 
X-CRM114-Status: GOOD (  41.95  )
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


--hu6r2ojwiq6ufs4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
MIME-Version: 1.0

Hi,

Thanks for the description, I have several questions here.

On Thu, Nov 14, 2024 at 02:57:52PM +0800, Liu Ying wrote:
> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> i.MX8MP EVK.
>=20
> Since IT6263 DT binding and driver were picked up from v5 and landed
> in drm-misc, this patch series contains patches almost all i.MX8MP
> SoC/platform specific.
>=20
> Patch 1 is a preparation patch to allow display mode of an existing
> panel to pass the added mode validation logic in patch 3.
>=20
> Patch 2 is a preparation patch to drop CLK_SET_RATE_PARENT flag for
> media_disp{1,2}_pix clocks.  Patch 5 depends on patch 2.
>=20
> Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
> the next non-panel bridge, that is the IT6263 in this case.
>=20
> Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
> "ldb" clock so that it can filter out unsupported display modes read
> from EDID.
>=20
> Patch 5 adds mode validation logic to i.MX8MP LDB bridge driver against
> "pix" clock so that it can filter out display modes which are not
> supported by pixel clock tree.
>=20
> Patch 6 adds DT overlays to support NXP adapter cards[1][2] with IT6263
> populated.
>=20
> Patch 7 enables the IT6263 bridge driver in defconfig.
>=20
> Note that patch 3 and 4 depend on patch[3] in shawnguo/imx/fixes.
>=20
> Since this patch series is related to another one[4] authored by Marek,
> Maxime asked for a proper description[5] about the exact problem.
>=20
> Admittedly, it's a bit complicated.  Here, I'm trying to do so and explain
> a bit more.
>=20
> [ Description ]
> It's a clock problem about shared i.MX8MP video PLL between MIPI DSI and
> LVDS display pipelines.  The pipelines are driven by separate DRM driver
> instances, hence there is no way to negotiate a dynamically changeable
> PLL rate to satisfy both of them.  The only solution is to assign a
> sensible/unchangeable clock rate for the PLL in DT.
>=20
> Admittedly, sys_pll3_out can be another clock source to derive pixel clock
> for i.MX8MP MIPI DSI display pipeline if a particalur i.MX8MP platform
> doesn't use audio(sys_pll3_out is supposed to derive audio AXI clock runn=
ing
> at nominal 600MHz).  However, for i.MX8MP platforms with audio features,
> the shared video PLL case has to be handled and it determines that the ab=
ove
> solution(unchangeable PLL rate assigned in DT) has to be used no matter
> sys_pll3_out is for display or audio, because the separate DRM driver
> instances really don't know if they are sharing the video PLL or not.
>=20
> [[ i.MX8MP Display Hardware ]]
> i.MX8MP SoC supports three display pipelines:
>=20
>  -----------------------------           ------------------------
> | imx8mp_media_disp_pix_sels  |         | imx8mp_media_ldb_sels  |
>  -----------------------------           ------------------------
> |  osc_24m (fixed 24MHz)      |         |  osc_24m (fixed 24MHz) |
> |*-video_pll1_out (video)     |         |  sys_pll2_333m (sys)   |
> |  audio_pll2_out (audio)     |         |  sys_pll2_100m (sys)   |
> |  audio_pll1_out (audio)     |         | -sys_pll1_800m (sys)   |
> | -sys_pll1_800m (sys)        |         | -sys_pll2_1000m (sys)  |
> | -sys_pll2_1000m (sys)       |         |  clk_ext2 (external)   |
> |  sys_pll3_out (audio ?)     |         |  audio_pll2_out (audio)|
> |  clk_ext4 (external)        |         |*-video_pll1_out (video)|
>  -----------------------------           ------------------------
>              ||                                     |
>  -----------------------------           ------------------------
> |   media_disp{1,2}_pix       |         |        media_ldb       |
>  ----------------------------- mux+div   ------------------------ mux+div
>              ||                                     |
>  -----------------------------           ------------------------
> | media_disp{1,2}_pix_root_clk|         |   media_ldb_root_clk   |
>  ----------------------------- gate      ------------------------ gate
>              ||                                     | (LVDS serial clock)
>              ||                                     V
> 	     || (Disp2 Pclk)  --------      ------------------
> 	     | ------------> | LCDIF2 | -> |       LDB        | -> panel/bridge
> 	     |                --------      ------------------
> 	     |  (Disp1 Pclk)  --------      ------------------
> 	      -------------> | LCDIF1 | -> | Samsung MIPI DSI | -> panel/bridge
> 	                      --------      ------------------
>                               --------      ------------------      -----=
-----
>                              | LCDIF3 | -> | Synopsys HDMI TX | -> | HDMI=
 PHY |
>                               --------      ------------------     |     =
+    |
>                                  ^                                 |    P=
LL   |
>                                  |                                  -----=
-----
>                                  | (Disp3 pclk)                         |=
 |
>                                   -------------------------------------- =
 |
>                                                                          =
 V
>                                                                     panel=
/bridge
>=20
> * video_pll1_out is supposed to be used by video outputs.
>=20
> - LCDIF2 + LDB can only use the *same* video_pll1_out, sys_pll1_800m or
>   sys_pll2_1000m.
>=20
> [[ i.MX8MP Display Drivers ]]
> LCDIF: drivers/gpu/drm/mxsfb/lcdif_*.c
> Three LCDIFv3 display controllers are driven by three imx-lcdif DRM insta=
nces
> separately.
>=20
> LDB: drivers/gpu/drm/bridge/fsl-ldb.c
>=20
> Samsung MIPI DSI: drivers/gpu/drm/bridge/samsung-dsim.c
>=20
> Synopsys HDMI TX: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>=20
> [[ Problem - Shared Video PLL Between Samsung MIPI DSI and LDB ]]
> osc_24m, audio_pll*, sys_pll* and clk_ext* are not for video outputs,
> because:
> a. Aparently, osc_24m runs at fixed 24MHz which is too low for most displ=
ays.
> b. Audio subsystem may consume all audio_pll*.
> c. sys_pll* are system clocks which are supposed to run at fixed typical
>    rates, e.g., sys_pll2_1000m runs at 1000MHz.
> d. sys_pll3_out is supposed to derive audio AXI clock running at nominal
>    600MHz(i.MX8MP data sheet specifies the rate), see NXP downstream kern=
el:
>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts=
/freescale/imx8mp-evk-ndm.dts#L19
>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts=
/freescale/imx8mp-ddr4-evk.dts#L25

Is there any downside to using any of these clocks, aside from the fact
that their rate must not change?

Also, if they can't change their rate, why do they have
CLK_SET_RATE_PARENT (sys_pll* in particular) ?

> e. clk_ext* are external clocks without known capabilities.
>=20
> So, the only eligible video_pll1_out is supposed to be shared between LDB
> and Samsung MIPI DSI in the two separate display pipelines if sys_pll3_out
> is already used to derive the audio AXI clock.
>=20
> With the shared video_pll1_out, drivers for the two display pipelines can=
not
> change the PLL clock rate in runtime, since the pipelines are driven by t=
wo
> DRM driver instances.

What is the typicall frequency on those pipelines? Could setting the PLL
high enough that any frequency required by any of these pipelines can be
accomodated through a divider work?

Something like you run the PLL at 594MHz, and then most HDMI frequencies
can be reached by a 1, 2 or 4 divider.

> [[ Solution ]]
> Assign the PLL clock source(s) and the PLL clock rate(s) in DT.  Disallow
> display drivers to change the PLL clock source(s) or rate(s) in runtime
> including LCDIF driver and bridge drivers.  With sensible PLL clock rate(=
s),
> typical display modes like 1920x1080@60 can be supported if external HDMI
> bridges are connected, and panel display modes can be too.  Also the unne=
eded
> CLK_SET_RATE_PARENT flag can be dropped for media_disp{1,2}_pix clocks.
> If needed, bridge drivers just call clk_round_rate() to validate clocks so
> that unsupported display modes can be filtered out.  Although the
> unchangeable PLL clock rate disallows more potential display modes, the
> solution works for single/dual/triple display pipelines(OFC, hardware des=
igners
> should pick panel/bridge display devices carefully first by considering c=
lock
> resources).

I think it's a reasonable idea, if not for the hardcode-it it DT stuff.
If we can manage to have a fixed setup work ok for all display use
cases, why would it be in DT? The clock driver seems like a much better
choice to me.

Maxime

--hu6r2ojwiq6ufs4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2GFsgAKCRAnX84Zoj2+
dqQLAYCRSDLH9Dk0IbJPl1PnlpU1xkDY6LSYkVLWuS23g3GMCrbH9gGpziHKzx9l
ziOFGckBf1rzk1R/u3ruFBm7DPVqwUbT7KGPmGeCy5xWW+5wrDtunG95cZqOq19p
3g9fbpNyzQ==
=JMAM
-----END PGP SIGNATURE-----

--hu6r2ojwiq6ufs4p--

