Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB044C5ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoASHULOj1vozuqj9V/9+URbnQ3Bnp/3j5Mb40dRzo0=; b=vuFqVE0v6rQ/OHFnd69oVPnq+2
	LEGuxIHu4ezZd91rBe8HWL1zC5EhJcGHjigUPDKJTnSWHCPZvih/DLwMq4sBPR12HxrfeaqvJut0D
	VxVdSAAd8Zyn/SMBM08RxSh3O1qQVNKnCToucfgAalpGqfvBgSFtiPhrLk/Zgurk9yixWSfnNVwIx
	2UQB0pKdWhzqn4wUmBNzoprsaw/vWkvrX0WNWPoFbPICKblNcCrR0qCgbsv10mIGeJbZEXKAs4Hbn
	EK4zd9vrxt3SINpfUpZjCxIYFn8gzIB3TQmtD3rxIpOhPLIin0aWngpeEUZ+j0QCAHCVlIhNO4KFu
	AQMsIupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsS3q-00000008lON-2Zs6;
	Fri, 07 Aug 2026 21:25:02 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsS3n-00000008lNP-2MFG;
	Fri, 07 Aug 2026 21:25:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786137881; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ksZychVbw2n+eubmInaiHiHYw50EWx36WCpv1G2BVO1faIuq4X0LYL1DQhGUrCTzNRY3SjwQThDkEXSXN0sfcCor4SSVXWsosFVvBGgYCmvDpkl513JHCoNUsuPqjnyo17I4f/ILv0guAfQjktw7h7HxpeKQDvNWnLUfkWnKM5o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786137881; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZoASHULOj1vozuqj9V/9+URbnQ3Bnp/3j5Mb40dRzo0=; 
	b=BcRMJ1qAClCR3WT46fEjsuhhB1Tgv3Ikk7HjNLZBqfacdIGs4ATB3vhbxqkORF6YXFEgYZ7UTm7bNkd5G+amV2s0mnYyOI4wcDRjsSGF3AbBWxgtrhBPjedP2whckFNktQ9XaOVzZnEF29/oKksVX3v/Fk4DXuvTvjA+VmV8Bjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786137881;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ZoASHULOj1vozuqj9V/9+URbnQ3Bnp/3j5Mb40dRzo0=;
	b=AlexDaPcWpw5s/ioB1Iub7+BHcN6IfOoJy7Mf7ExnanIIpYMxj178fetg2Ch/8Ep
	fflz2yc+YS98+iDsr/U+PdWgAc9tMmlmh4Y3MKCd1w+/oB8WSNEg6v1Egb9s1qCZHez
	VmcyLjBFFxJkaDdDIDJsQXP3SOmpONviGfkgVMLY=
Received: by mx.zohomail.com with SMTPS id 1786137878934900.0847172293252;
	Fri, 7 Aug 2026 14:24:38 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 7794E180895; Fri, 07 Aug 2026 23:24:35 +0200 (CEST)
Date: Fri, 7 Aug 2026 23:24:35 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2] arm64: defconfig: enable Rockchip Multimedia drivers
Message-ID: <anZLfCCBIaqoTSKe@venus>
References: <20260807-rockchip-defconfig-additions-v2-1-cbb8eef87be6@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmqxeakl45xeaoje"
Content-Disposition: inline
In-Reply-To: <20260807-rockchip-defconfig-additions-v2-1-cbb8eef87be6@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.134.37
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_142459_652375_5E9A0F0D 
X-CRM114-Status: GOOD (  20.39  )
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


--hmqxeakl45xeaoje
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] arm64: defconfig: enable Rockchip Multimedia drivers
MIME-Version: 1.0

Hi,

On Fri, Aug 07, 2026 at 06:38:19PM +0200, Sebastian Reichel wrote:
> Enable multimedia related drivers used by the Radxa ROCK 5B (and most
> other RK3588/RK3576 boards), so that all hardware is supported by the
> default config.
>=20
>  * RKVDEC - RK3588/RK3576 video decoder for H.264 and H.265
>  * Sony IMX415 - Sensor used by the Radxa Cam 4K module
>  * Rocket - RK3588 NPU driver
>  * Verisilicon IOMMU - IOMMU used by RK3588 AV1 video decoder
>  * Rockchip MIPI RX Innosilicon D-PHY - CSI PHY
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Changes in v2:
> - Link to v1: https://patch.msgid.link/20260806-rockchip-defconfig-additi=
ons-v1-0-6b1d8baa0bf5@collabora.com
> - Squash all patches (Krzysztof Kozlowski)
>=20
> The Verisilicon IOMMU defconfig change has previously been sent by
> Benjamin as part of the IOMMU series, but did not reach upstream:
>=20
> https://lore.kernel.org/all/20260415072349.44237-6-benjamin.gaignard@coll=
abora.com/
> ---

I will send a v3, which also enables CONFIG_VIDEO_DW_MIPI_CSI2RX as
that change apparently did not make it together with Michael's
series.

Greetings,

-- Sebastian

>  arch/arm64/configs/defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 654a102cb5bc..5faccf00b897 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -939,6 +939,7 @@ CONFIG_VIDEO_RENESAS_VSP1=3Dm
>  CONFIG_VIDEO_RCAR_DRIF=3Dm
>  CONFIG_VIDEO_ROCKCHIP_RGA=3Dm
>  CONFIG_VIDEO_ROCKCHIP_CIF=3Dm
> +CONFIG_VIDEO_ROCKCHIP_VDEC=3Dm
>  CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=3Dm
>  CONFIG_VIDEO_SAMSUNG_S5P_JPEG=3Dm
>  CONFIG_VIDEO_SAMSUNG_S5P_MFC=3Dm
> @@ -949,6 +950,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=3Dm
>  CONFIG_VIDEO_HANTRO=3Dm
>  CONFIG_VIDEO_IMX219=3Dm
>  CONFIG_VIDEO_IMX412=3Dm
> +CONFIG_VIDEO_IMX415=3Dm
>  CONFIG_VIDEO_OV5640=3Dm
>  CONFIG_VIDEO_OV5645=3Dm
>  CONFIG_VIDEO_S5KJN1=3Dm
> @@ -1063,6 +1065,8 @@ CONFIG_BACKLIGHT_GPIO=3Dm
>  CONFIG_LOGO=3Dy
>  # CONFIG_LOGO_LINUX_MONO is not set
>  # CONFIG_LOGO_LINUX_VGA16 is not set
> +CONFIG_DRM_ACCEL=3Dy
> +CONFIG_DRM_ACCEL_ROCKET=3Dm
>  CONFIG_SOUND=3Dm
>  CONFIG_SND=3Dm
>  CONFIG_SND_ALOOP=3Dm
> @@ -1611,6 +1615,7 @@ CONFIG_ROCKCHIP_IOMMU=3Dy
>  CONFIG_TEGRA_IOMMU_SMMU=3Dy
>  CONFIG_APPLE_DART=3Dm
>  CONFIG_MTK_IOMMU=3Dy
> +CONFIG_VSI_IOMMU=3Dm
>  CONFIG_REMOTEPROC=3Dy
>  CONFIG_IMX_REMOTEPROC=3Dy
>  CONFIG_MTK_SCP=3Dm
> @@ -1785,6 +1790,7 @@ CONFIG_PHY_RZ_G3E_USB3=3Dm
>  CONFIG_PHY_ROCKCHIP_EMMC=3Dy
>  CONFIG_PHY_ROCKCHIP_INNO_HDMI=3Dm
>  CONFIG_PHY_ROCKCHIP_INNO_USB2=3Dy
> +CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=3Dm
>  CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=3Dm
>  CONFIG_PHY_ROCKCHIP_NANENG_COMBO_PHY=3Dm
>  CONFIG_PHY_ROCKCHIP_PCIE=3Dm
>=20
> ---
> base-commit: 2d578cd590adc2133aa24496afcd7c3f7f9ba36a
> change-id: 20260806-rockchip-defconfig-additions-3ef855c4d32e
>=20
> Best regards,
> -- =20
> Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
>=20

--hmqxeakl45xeaoje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp2TQ8ACgkQ2O7X88g7
+pr5wRAAkt6Vna3WeMs2KAJurkH52nGPslCIrA0pnif8Wyrp0SDx1WJLx6WsZ+xx
A5IA4+vsHuJDPlapYWFHWnUT//8PmKB33ZjuQSNQy3pxba9Yk6gp/LJbFOCtIZ3K
xx7qDIHoSAVB2FKBuM79GD5+9RrcfVIOD6hj3fFWHErRKUpVARxYwFTimfgrZt2p
+neuca6TXK+JfcpGm1WEIgRNTEYj37gybP5p+TARM0Iea6K+RupTELKTBRQUHLuu
0faNhQQzbVxdwdqYQ0/qxdhjsNygFYksl1W/6+RPIyM4Z9IHuor8Rl9ZOJsSKxwY
kqIAUrYdst1DoWB/34sFpX7KmWvrM2DGL2KgIXYAEvPW3OBBKVygPd9yTgnozEOZ
mRH4Nrybf0DFmSp9a+49/hiTZIbocWXWFPLp7d8m0EylXqvVoIKaGh9vbAQ7WCTd
+Tw6XrtonfXmeuNOhInPDO4zISlMHBBZZ65nJkDhgo0EjY+j+jiPg8WKlQfXyK03
qW2LIMc5YJFBYMSMh5Olrx1XD06EhXGE+k8yXJc+xJqermVqhcaeNAGf7wHkPt3O
0m3t4Furv0IsPd+V4CykTtgtRzFPwiwkjvG+fH6VhjrCXvu/WWAtSZwG1zBgnJi/
I9tOZzYP551QCaH/EDFM5l4N6AGLtuA5T6XKjWlQVUVkyTDfc6o=
=N2d5
-----END PGP SIGNATURE-----

--hmqxeakl45xeaoje--

