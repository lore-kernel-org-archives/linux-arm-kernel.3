Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9C7D30CE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHBYeueOqFpt4Agp3p/anXw1jafjMamStjjeOnNMbD8=; b=vuCiC8jfVwDo4CDiuCEaO3xjtf
	T3XFvrKNgR6LCRb+6SJR7rF2odnfg4M+W/o+glzEwkqnOMAJS+gVtMZyYESH9hP3um0pXq+FyI6MM
	SGbwLO1qt5IQ6NqDduZXZ/xlxJk7QyDgRu2D7N6zcoIaj3T8CTHP9k4ENz7Ye7DPayqSHTxKwWGoG
	11/qzfwsC9bzk9yq4QLdGxyIVISHzT63jIFBV/HFJSysiAauAD7tzOh6gNM+/+suQ57OC2hfRYhP8
	uMIy9UkOIX+LpCfL1xWUBeCE69w2ecnoCvw3XYRRAO0et9FnX3vY/hlG7UeDtyl6ILDMkLsuoOqyC
	9Dcrfq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmBJ-00000007m9h-3fO3;
	Tue, 13 Jan 2026 21:44:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmBG-00000007m9D-3YAk;
	Tue, 13 Jan 2026 21:44:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768340630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l0WuONUE02bm6kJBK+49JHXfvEtd0LAUtlh8OeqXtrsajWOxisuIwi9vYET/F3bxSR3PNjMlqGEusD6yM8g++c6ILKqP7Rvnd2W2e825IQ8EopqhFTtfaZPrnnPFUTENQl1DV55YrHCwrtb8tiKlFdE9YGjLCj5grsAzg/PphKI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768340630; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QHBYeueOqFpt4Agp3p/anXw1jafjMamStjjeOnNMbD8=; 
	b=SYdShVrwJvyHDvrKXGcRxXvLuhmsce3mR4WdPYr0rOUUdFTjFRmII3Z3CaTlk8LRp8VrPwmV4n9Erwu4MezMUdi/QN2iX5N7Chb3h6E78fHH0OsYxGxoZMHB0z/EoZCFNdH9zK3iFJi6lAdeUoI2JYGPs+T7ITrkgAPJFqPkoj4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768340630;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=QHBYeueOqFpt4Agp3p/anXw1jafjMamStjjeOnNMbD8=;
	b=ONVo5bmMIeFAeQDNjZJoS1GrrtSjrJ+hAWW94uOjHjGHq4SGXtytQqx0scvlGrMh
	HHqVz31t8RHQKGD5iZ3Mm9H5N06mHGPHfHsId8ExffR7ItXmcaqQ4LEws94GRQ0ch1v
	AoZtUBRy3xUrFXibZVPyW7seyom6j+qTdL3l6z/I=
Received: by mx.zohomail.com with SMTPS id 176834062782856.444600686903414;
	Tue, 13 Jan 2026 13:43:47 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id F3AB3181010; Tue, 13 Jan 2026 22:43:41 +0100 (CET)
Date: Tue, 13 Jan 2026 22:43:41 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, dmitry.baryshkov@oss.qualcomm.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cristian.ciocaltea@collabora.com, 
	Laurent.pinchart@ideasonboard.com, mripard@kernel.org, hjc@rock-chips.com, robh@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: Add DisplayPort dt node for
 rk3576
Message-ID: <aWa7M24CNaC6iz4K@venus>
References: <20260109080054.228671-1-andyshrk@163.com>
 <20260109080054.228671-6-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fi3utza5uiabvpxq"
Content-Disposition: inline
In-Reply-To: <20260109080054.228671-6-andyshrk@163.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/268.322.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_134403_428935_71302711 
X-CRM114-Status: GOOD (  15.74  )
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


--fi3utza5uiabvpxq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: Add DisplayPort dt node for
 rk3576
MIME-Version: 1.0

Hi,

On Fri, Jan 09, 2026 at 04:00:48PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> The DisplayPort on rk3576 is compliant with DisplayPort Specification
> Version 1.4 with MST support, and share the USBDP combo PHY with USB 3.1
> OTG0 controller.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index a86fc6b4e8c4..a153c3976cb3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1446,6 +1446,34 @@ hdmi_out: port@1 {
>  			};
>  		};
> =20
> +		dp: dp@27e40000 {
> +			compatible =3D "rockchip,rk3576-dp";
> +			reg =3D <0x0 0x27e40000 0x0 0x30000>;
> +			interrupts =3D <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>;
> +			assigned-clocks =3D <&cru CLK_AUX16MHZ_0>;
> +			assigned-clock-rates =3D <16000000>;
> +			clocks =3D <&cru PCLK_DP0>, <&cru CLK_AUX16MHZ_0>,
> +				 <&cru ACLK_DP0>;
> +			clock-names =3D "apb", "aux", "hdcp";
> +			resets =3D <&cru SRST_DP0>;
> +			phys =3D <&usbdp_phy PHY_TYPE_DP>;
> +			power-domains =3D <&power RK3576_PD_VO1>;
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				dp0_in: port@0 {
> +					reg =3D <0>;
> +				};
> +
> +				dp0_out: port@1 {
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +
>  		sai7: sai@27ed0000 {
>  			compatible =3D "rockchip,rk3576-sai";
>  			reg =3D <0x0 0x27ed0000 0x0 0x1000>;
> --=20
> 2.43.0
>=20

--fi3utza5uiabvpxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlmvI0ACgkQ2O7X88g7
+pqGeBAAgSIlurnmjn/ludGRWvRQic6y7Frdz87wPJMlJunZdxA1iDokPIlfv6BW
UHnKxecSag+yanMjJB/pGuzCRzfIeqz0GQa6mboNnDlhvbGG+Gp8hTCXhQllOo9c
1AvqKwhOpXpEfg7Qx/RTy9kp/lWvteCXw30GIy2ninhuzsLjypYNg7dZtEC7pNax
ppxDTtkSwZ2rKRfVDis/rGLja2mDtTn9lNxoEidAVRntddxLu12/rseOj/AeooNo
RDTGM8Wn66U5i5ogVxfuDdr4N1yZDGZxk8iI35uZgFfFHQeYpy/EGPoijj+nwsX8
+2No89u6MnPG3MqNmPzrZMns+D80zAkH4WOo5vOsCq2tHspWieUVx3U3py4DUKnG
RDVpkDbSIZuTPRGFmcQekIIzrUJgPcxfDpLiOQ03Iq5M/sPkS92w7m0EH6vq5XkA
KKTyeJrhq/qy3B391KtFRnuXquA3Wq2pxsfjIbMjV2BItt4V9Pc0zM84fRsRIJcX
s4fyN6IxSrQpODIgo7P7NSezcAyX/KyEaHspoYzcZI+CZO/luM5+a5ycNoBbznwk
9pdSI25ZlnwS+/PWrtAZzonFtZnczjoPXKqNLUyvve/EGDDtetevss2JYG2G8xzW
5QrORuh/s0apFAYDhKK1+uI8pZb+UaaoT3FX6o0yYFibp5Xhlso=
=Bik6
-----END PGP SIGNATURE-----

--fi3utza5uiabvpxq--

