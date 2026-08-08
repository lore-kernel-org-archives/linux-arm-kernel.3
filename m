Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE03C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9wS2G9ikcTSrII5ExVfyKoau4nL9ReZyISSD20eurU=; b=zN9lQV8kPMPvtUeuf7vkIro2kS
	klpOPdWMfNIqq+NOkFiOOIYg4VjFXQQaodLnZ88gmHLJvkTjzob0isH20UQJmVVSSK132OZg3oY3M
	ExG+vCopvQDaWVr5Nw5yrJoOa2JCwB5qWep5xygP+OYd9SZkew1Jin+KZQNthABL/430MjP5nRtS0
	zwuDSHeeoCQjNLzmcJFANPTBqsCb7mwbbxRxMl/w7mtLJNz4MqskD3DDfNw0AOhllrNQAVZVaHnOR
	eJO+Ew/99RGK0PJarXmCVh8kkI6X2Mm8yBFSAljR0qgqr9jF6fq1svLxaaY1slc0o3IVdTRwzWs/F
	kVocT6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsnLw-00000009hZs-0dvG;
	Sat, 08 Aug 2026 20:09:08 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsnLt-00000009hZU-1cyg;
	Sat, 08 Aug 2026 20:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786219728; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GDlm+rmu9WD9uWZii/tTzpe2SxZZEFwO+PzBiprHnBeZXIDd0Xe43fDC2cU9OxRECS4HnxIxWOqI8ptcCO8RAzWbMzRt2dGwvu3HL0TOCa9E+u8xD19I7O+LljNU58XXEhenTnlFTWEgfcPoPEhAgxGZTh+TnNi+zj+eP1PaQis=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786219728; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q9wS2G9ikcTSrII5ExVfyKoau4nL9ReZyISSD20eurU=; 
	b=SL0WayZtBrWAYcv/R1rHtQgMqgVm0SEl32d+eyfCNUeFywfzT2h/eZdhgcl0U5cWuNjTd2NdFLvtC7/KAvMaR28FrEXJP7RxqY3ifDVCTIUt43fOQ7trwf767C6gbiD8ueZnYU/lkvZ3kmswgjVLAyHJdhs1MJUZ1RS18YikV3c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786219728;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=q9wS2G9ikcTSrII5ExVfyKoau4nL9ReZyISSD20eurU=;
	b=T01cQZS9sCS2YIHeDjOi9yaS0b0w8P88o/F5TZ0PdhftRf4gRFvLdFXkLQW85CvF
	RgryvWAUFW/HZQT0zpcjqtxkjpMPGPpz58mIiFoycze2uqy7oMy5W5JoNZJKgSsmNd+
	pxPibjDrxcT5S2Z8I/wXyGhZD+ZIIHggPTHzLVlY=
Received: by mx.zohomail.com with SMTPS id 178621972499174.23958232166342;
	Sat, 8 Aug 2026 13:08:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id BE373180679; Sat, 08 Aug 2026 22:08:40 +0200 (CEST)
Date: Sat, 8 Aug 2026 22:08:40 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3] arm64: defconfig: enable Rockchip Multimedia drivers
Message-ID: <aneIb96qCkxKkGxi@venus>
References: <20260808-rockchip-defconfig-additions-v3-1-0ed67877e94d@collabora.com>
 <5738059.NG923GbCHz@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjfwptiibl3r6yux"
Content-Disposition: inline
In-Reply-To: <5738059.NG923GbCHz@diego>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.208.17
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_130905_514260_AD02E8E5 
X-CRM114-Status: GOOD (  32.03  )
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


--tjfwptiibl3r6yux
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] arm64: defconfig: enable Rockchip Multimedia drivers
MIME-Version: 1.0

Hi,

On Sat, Aug 08, 2026 at 04:06:03PM +0200, Heiko St=FCbner wrote:
> Am Samstag, 8. August 2026, 02:42:26 Mitteleurop=E4ische Sommerzeit schri=
eb Sebastian Reichel:
> > Enable multimedia related drivers used by the Radxa ROCK 5B (used as an
> > example, the config options are relevant for most Rockchip RK3588 and
> > RK3576 boards), so that all hardware is supported by the default config.
> >=20
> >  * Synopsys MIPI CSI2RX - RK3588 CSI2 Controller
> >  * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
> >  * Sony IMX415 - Sensor used by the Radxa Cam 4K module
> >  * Rocket - RK3588 NPU driver
> >  * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
> >  * Innosilicon CSI D-PHY - RK3588 CSI PHY (one of them)
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> I'm not sure what the actual rule for defconfig changes is.
>=20
> In some past thread I remember (hopefully correctly) Krzysztof saying
> that the arm64 defconfig is not supposed to be a distro-config, so
> enabling each and every driver was not the goal.
>=20
> On the other hand, he did not repeat that in his reply to your v1 ;-) .

I think its worthwhile to have all board related hardware features
enabled. I've seen too many complains from people that XYZ is not
working that turned out to be simple config problems. With the
defconfig supporting the full hardware there is a known working
config that we can point people towards.

Apart from that KernelCI uses the defconfig for its automated boot
tests. Having full hardware support helps to ensure the drivers are
working as intended and do not regress.

Last but not least the enabled options are consistent with other
platforms. On the video codec side Qualcomm and Mediatek have theirs
enabled, Hantro is also enabled. On the CSI side the Cadence
controller, NXP and Renesas are enabled; I also would expect the
Qualcomm X1E config options once the series from Bryan O'Donoghue
lands. There's also a bunch of camera sensors enabled, which makes
sense since CSI would be useless without them. The only new thing
is the NPU. I argue the main reason for that is that this is a
relatively new thing.

> We're at -rc7 tomorrow, so it'd be 7.4 material anyway, so enough time
> to get "complaints" I guess ;-) .

Correct :)

Greetings,

-- Sebastian

>=20
>=20
> Heiko
>=20
> > ---
> > Changes in v3:
> > - Link to v2: https://patch.msgid.link/20260807-rockchip-defconfig-addi=
tions-v2-1-cbb8eef87be6@collabora.com
> > - Also add CONFIG_VIDEO_DW_MIPI_CSI2RX=3Dm and update commit message
> >=20
> > Changes in v2:
> > - Link to v1: https://patch.msgid.link/20260806-rockchip-defconfig-addi=
tions-v1-0-6b1d8baa0bf5@collabora.com
> > - Squash all patches (Krzysztof Kozlowski)
> >=20
> > The Verisilicon IOMMU defconfig change has previously been sent by
> > Benjamin as part of the IOMMU series, but did not reach upstream:
> >=20
> > https://lore.kernel.org/all/20260415072349.44237-6-benjamin.gaignard@co=
llabora.com/
> >=20
> > The Synopsys CSI controller defconfig change has previously been sent
> > by Michael as part of the driver series, but did not reach upstream:
> >=20
> > https://lore.kernel.org/linux-rockchip/20260522-rk3588-vicap-v5-0-d1d1f=
5265c56@collabora.com/
> > ---
> >  arch/arm64/configs/defconfig | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 654a102cb5bc..49f836ba67a5 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -915,6 +915,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=3Dy
> >  CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> >  CONFIG_VIDEO_AMPHION_VPU=3Dm
> >  CONFIG_VIDEO_CADENCE_CSI2RX=3Dm
> > +CONFIG_VIDEO_DW_MIPI_CSI2RX=3Dm
> >  CONFIG_VIDEO_WAVE_VPU=3Dm
> >  CONFIG_VIDEO_E5010_JPEG_ENC=3Dm
> >  CONFIG_VIDEO_MEDIATEK_JPEG=3Dm
> > @@ -939,6 +940,7 @@ CONFIG_VIDEO_RENESAS_VSP1=3Dm
> >  CONFIG_VIDEO_RCAR_DRIF=3Dm
> >  CONFIG_VIDEO_ROCKCHIP_RGA=3Dm
> >  CONFIG_VIDEO_ROCKCHIP_CIF=3Dm
> > +CONFIG_VIDEO_ROCKCHIP_VDEC=3Dm
> >  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
> >  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=3Dm
> >  CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
> > @@ -949,6 +951,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=3Dm
> >  CONFIG_VIDEO_HANTRO=3Dm
> >  CONFIG_VIDEO_IMX219=3Dm
> >  CONFIG_VIDEO_IMX412=3Dm
> > +CONFIG_VIDEO_IMX415=3Dm
> >  CONFIG_VIDEO_OV5640=3Dm
> >  CONFIG_VIDEO_OV5645=3Dm
> >  CONFIG_VIDEO_S5KJN1=3Dm
> > @@ -1063,6 +1066,8 @@ CONFIG_BACKLIGHT_GPIO=3Dm
> >  CONFIG_LOGO=3Dy
> >  # CONFIG_LOGO_LINUX_MONO is not set
> >  # CONFIG_LOGO_LINUX_VGA16 is not set
> > +CONFIG_DRM_ACCEL=3Dy
> > +CONFIG_DRM_ACCEL_ROCKET=3Dm
> >  CONFIG_SOUND=3Dm
> >  CONFIG_SND=3Dm
> >  CONFIG_SND_ALOOP=3Dm
> > @@ -1611,6 +1616,7 @@ CONFIG_ROCKCHIP_IOMMU=3Dy
> >  CONFIG_TEGRA_IOMMU_SMMU=3Dy
> >  CONFIG_APPLE_DART=3Dm
> >  CONFIG_MTK_IOMMU=3Dy
> > +CONFIG_VSI_IOMMU=3Dm
> >  CONFIG_REMOTEPROC=3Dy
> >  CONFIG_IMX_REMOTEPROC=3Dy
> >  CONFIG_MTK_SCP=3Dm
> > @@ -1785,6 +1791,7 @@ CONFIG_PHY_RZ_G3E_USB3=3Dm
> >  CONFIG_PHY_ROCKCHIP_EMMC=3Dy
> >  CONFIG_PHY_ROCKCHIP_INNO_HDMI=3Dm
> >  CONFIG_PHY_ROCKCHIP_INNO_USB2=3Dy
> > +CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=3Dm
> >  CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=3Dm
> >  CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=3Dm
> >  CONFIG_PHY_ROCKCHIP_PCIE=3Dm
> >=20
> > ---
> > base-commit: 2d578cd590adc2133aa24496afcd7c3f7f9ba36a
> > change-id: 20260806-rockchip-defconfig-additions-3ef855c4d32e
> >=20
> > Best regards,
> > -- =20
> > Sebastian Reichel <sebastian.reichel@collabora.com>
> >=20
> >=20
>=20
>=20
>=20
>=20

--tjfwptiibl3r6yux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp3jMEACgkQ2O7X88g7
+ppX9BAAnkHJ0Nem7d+s3nQkqNNCsxE5uRvhV+id7OHMsJaD2CCwpiBf6VeHBnTh
ajBl8lC723gd9HY/rI42VAQiT666XEZYN3NVdacCqyZQvKjBmgyeBfvjMAyZg2k5
FK/eDbaXq7HjQUV7s8gjxBNYTQGZD+kRDBcoS+FVN8Ezb8ZxBRNdoRBhULsNoPar
eBxTKostPjmlgJNngJXuT+GheptvpWAn674jw0dtEODx98YWThgHht3l7NXbIymV
FvEXqeGWYuQ8A/uBHw99wVQsZ8w+oH7qdaZOryLVrBx3SDZZvDTsCrA2nx9dMDuZ
f5bL6+zatLtGD1C2iC4yFQbobJRiqjxawKA1yRxTl1OQnPYrJbQ8PTpy6IhA1aU8
YX1GMD0b276TnEsK0wB4lvP57wUjVkLtTmcgxDEtAEDTZpPsgrkhlBUywQKRlnW3
9/NuSBMwCrwe9zFvzKVUNI8j9kS37woI04L0oA1iVoUQGrWgY7WK8s/Z0941vtI/
KjcW0izWM/3vRAluYPSe5/lRLM/n/I830ucrqdEEN7/CPDEQoSaHAbsw4PL1E9/k
89fEKZ4jlXhnyTeMgZVyZBpcKsA879fpgrcMfLyrqAPmgTgSwgaeuVd/zUUa+kZ7
g5MJhOE+SDGczHISEjmLB+EEPMFjBDFRjKrvcJ19yezxYvsbiSc=
=v/rM
-----END PGP SIGNATURE-----

--tjfwptiibl3r6yux--

