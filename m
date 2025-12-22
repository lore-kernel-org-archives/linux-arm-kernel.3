Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB46E674B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkKu+9+jYP9nuseT5iH6tA6Rgk4e8wwX3XyCsgeyjiA=; b=4gbn5mqqZ8v3lFbdgVxCejIJO0
	qXP3RLOE2VLA75mGBiUMRYAhTb57Fhm/6yUyvJpI75qiaY7SayREXgJwuvHZN2+CSRaYdZIecya90
	ayiJgvc1yz/O5pglRpdytisQqM67Htzm0iKnkUiI8h06vZFTSwdpda5+mLFMgBxo+RNd5Diu4Rnsj
	nBl2TikV7cGGJoDNluoUYDzvTYFCoi/GycHIbXetx72zV2E56d3wDvC39IrgXeNSzmyRxJFYPwvaQ
	sllAS+D2c7/d5+gRQsq1pgePCZt+swZjy9WmnPUAeEyW6+zjdRJYjhMpPODIebAwLuYuk+pbjp0cH
	fCVXgLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfum-0000000Do00-1ul9;
	Mon, 22 Dec 2025 13:25:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXful-0000000Dnzp-11cc;
	Mon, 22 Dec 2025 13:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UkKu+9+jYP9nuseT5iH6tA6Rgk4e8wwX3XyCsgeyjiA=; b=aOIvdLMkp3MravRlALTjEHemV7
	eFMXJYTQTd0orSvDYLAutmboiR8edqOq7YrDl46mqzMGfMQM6fnCmywgqzKCEyTNKYqmPwEtiPDFK
	Z+v5LvMwOl815uJr2UHswN87RmPNZ7fvC6dYNZUpljTn8BdioMagWGi8GdLPjbmrscGgWGw0ymLql
	tEGlg2ePYMe62WAilTNpoIzT4X+WsUPbLb0GxlxydEYcBrPn5jrte6D+LjLA2TmEdegV58jft+/u1
	szR3MsLhhCtZQJFyAJCAHodPBFvKrAUMFx/cjkqINC7ijZywdZKUOaDu0CmvUfsc9nAO3EjZc/qAj
	+49sKqew==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXf3G-0000000F20q-4AOq;
	Mon, 22 Dec 2025 12:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766409903; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c+Z93QpcfHesOO97mynYUGkc9xrKLrso8ILtdtzBtu8ZCqh/0Ob2rOYTIjSNu6yoTweQl7E/i2sfc45/4FOfjJiPlxpCg4XXRthvk6aD4WOwmpafqG9w3VMgeBz9RPfcbIXAQjvmFDAt4yDMjGSwZa00cRL031wSGlb3Y6a8HHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766409903; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UkKu+9+jYP9nuseT5iH6tA6Rgk4e8wwX3XyCsgeyjiA=; 
	b=ejieEUpX7nHdpc+r9u6rzxuWYfxP1Ql/S/3O4NXKaXP0g/8rgJpLBmB/ES/FmiRXVK2+YNDSSUJrHLAabPzyjeedpbg7h9LVLwIrmlSCSuyfr88QEj3HqQbWB/VE2StIntPiwyfRkI+dDlDLxd9kAjAO5R+r5NCOpIlWxtiVTC8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766409903;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=UkKu+9+jYP9nuseT5iH6tA6Rgk4e8wwX3XyCsgeyjiA=;
	b=hUlu/r69leKWJdLf2wYh4hepEi8kHfB1a7rIcSE1yFM86BFmP2rHtPfjSZYsBvFN
	2AIHE5FG526VYG4dxyEYEWewqy8ksFinpw6N/3MQDFVJMpJ/nkZuYCGo+QJEEFnMFPy
	Ir/zissG4s1+FD2kgYvF8PAmpyv99O+abvQhMiEY=
Received: by mx.zohomail.com with SMTPS id 1766409901397690.5053360104508;
	Mon, 22 Dec 2025 05:25:01 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 9D32C180421; Mon, 22 Dec 2025 22:24:57 +0900 (JST)
Date: Mon, 22 Dec 2025 14:24:57 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: remove rtc regulator for
 ArmSoM Sige5
Message-ID: <aUlGPGFYYf8Ndn5D@venus>
References: <20251220100010.26643-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4zvrrqo2paksgxc"
Content-Disposition: inline
In-Reply-To: <20251220100010.26643-1-amadeus@jmu.edu.cn>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/266.382.52
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_123015_409648_9BA788C0 
X-CRM114-Status: GOOD (  15.91  )
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


--l4zvrrqo2paksgxc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: remove rtc regulator for
 ArmSoM Sige5
MIME-Version: 1.0

Hi,

On Sat, Dec 20, 2025 at 06:00:08PM +0800, Chukun Pan wrote:
> According to the schematic, RTC is powered by vcc_3v3_s3.
> The vcc_3v3_rtc_s5 regulator does not exist, remove it.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---

That's true for all board revisions that have a public schematic
(1.1, 1.2 and 1.3), so:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 10 ----------
>  1 file changed, 10 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/=
arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index 3386084f6318..392ba83ab05a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -156,16 +156,6 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
>  		vin-supply =3D <&vcc_5v0_sys>;
>  	};
> =20
> -	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vcc_3v3_rtc_s5";
> -		regulator-boot-on;
> -		regulator-always-on;
> -		regulator-min-microvolt =3D <3300000>;
> -		regulator-max-microvolt =3D <3300000>;
> -		vin-supply =3D <&vcc_5v0_sys>;
> -	};
> -
>  	vcc_3v3_s0: regulator-vcc-3v3-s0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_3v3_s0";
> --=20
> 2.25.1
>=20
>=20

--l4zvrrqo2paksgxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlJRqUACgkQ2O7X88g7
+poaSA/7BTJMdVFTQwTR1IPZ16ROOZ3W7/y+6Yh2XxJrD7tqpAbD8yCP0VNxAYr0
YPcI4Bj2XDNCXZFu264NSB0ZFCbA8ZMdVcxa6raHElOJZ2UkutF5ZDEVtTR8aW+d
abMz+yx1xQ2BW4o+tkZWkHs2Qcwbq8SkgDc96Mqx832+FN9cM6wgHn/qnaBAlfga
CWucPY17ElMRPaPCjSre5290qnOXNeqn5Jj5EJq2hMh+A9OLWyTm7bh2rP6uskXS
76L9+6mjH+2swVXGRPLfx72tkasXmO/HA8G9DobZ8ZejE1ocoVs14+vofZaLzLjy
FK4qh8HsZp530RTsfzkF/DwIv0VkTqd6/dhVdSDro583Qr5JCc6TNRHxdILQKFkW
ayvn9NIikq+c5IskB/KKSQm6/JMfXj7D0DSIyYdHj9nF7b8zDt8gTRkBshty50eu
DFJan56BvVxVaL1cbecSfAjmmCnPeRwDOM7U+qI/G2qCw2JGZ3biHZgA4auWWIQ/
11B3OirJDAvSGCDG2VlXwkZ9WXH8Nm0iAhYITNBOipiJJ1bxvvTSq4/CRd+gR68g
v/zMDHx9XLcB3a4VvxPHpPLNXA/fyQ3JIWEcl22QMConaRiwl4yF9OcOohSm/lpy
YlYVCyShnFjajvOIsBjgvBw6rNBJRlYDadoKyYEIkiFSLlnjyK4=
=kfCP
-----END PGP SIGNATURE-----

--l4zvrrqo2paksgxc--

