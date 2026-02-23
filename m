Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAC0EA4FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9Ky2tikbQrXH6nE/bcaFG4UkGoK8WeG4CEzg6RRfEk=; b=O57RjwO6RRsgIpAHtjUzKwY5xC
	dmvqJnr1NnSuTtbjgDMVnGPkYo1eoJoQ6HWHn0l+V9hJzVAzvdfOqkb7kb3CrXNiCdIUC0WZfcLfu
	KJv9FM+xWU8sl40+vXeJ+4GP3Kd5IysKQ+9YyeI6yzlj0NU/m7t3YxVBcH0MI9bHB/x3RFnxvWhzw
	fAemucrIf8khp8/e7E3sTJWbb0a0iL8+sw5IYcDFjOS0klEdYLIFctvRxWBlrDhmnENbG82iRgv/n
	9ZBwucKVA1StsMo7Q2SSUlY8aabwbpXxnIApMFpgGWkRCNNz4YXL4Roa81qC853TQzmNV8iQPJhKh
	IZ+J2GMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWyy-00000000TGg-19eE;
	Mon, 23 Feb 2026 14:32:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWyv-00000000TFg-3XaU;
	Mon, 23 Feb 2026 14:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771857124; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qnp/tCfWMy+Zx6gDf+oqRIG2FxJ0247p2dyKPTCpkJWTcbKzmUlCUX8KyDnh7BZrzS9qp+vDvl3ys9bG0uorBDg7YMn6PajDnxt++ghsHBoz4vCXXj+VviP4CQdZgr3dRI7dE2YMv0vuRrX71XIqz6HePG6SCzAVgqR9vPS24uY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771857124; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y9Ky2tikbQrXH6nE/bcaFG4UkGoK8WeG4CEzg6RRfEk=; 
	b=foI0fE6w/20v43NcW+nCTQwTKtHnm7M00j/anLPoFP0DMlzwta7ybQAoV/j4U0rU2iQIfBRIebB+kdORfzeIQuvKso7ln2Gcl9Sn4tyKmEX94M7rbIZ+4QQuutPFEeU0EENyUZ0916M+70uAZdgPzDJlw1k3K8XXKJgjX/5cnVs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771857124;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Y9Ky2tikbQrXH6nE/bcaFG4UkGoK8WeG4CEzg6RRfEk=;
	b=OKA4VPxJsdY02OUBQGgv2Elz5PuMdu/o7VZ3a+eCBRTcKDty7avuyOkkqola6gZv
	q/3q3FLa4wyVcOByHVP4L45VMrFs4hwgVBRoC/SnFGoZ+mOyj2B/TztIsZIBrKFcE7y
	BFvkVPf620BSHkuG/ZAJzzC2OevP1PWuWM+I+9qw=
Received: by mx.zohomail.com with SMTPS id 1771857121477746.2205484461174;
	Mon, 23 Feb 2026 06:32:01 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 964D91806CB; Mon, 23 Feb 2026 15:31:56 +0100 (CET)
Date: Mon, 23 Feb 2026 15:31:56 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	kernel@collabora.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
Message-ID: <aZxkDGzEQCCLKR-M@venus>
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="itcbjeav5ybt5pwy"
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/271.848.75
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063217_934898_65D7B739 
X-CRM114-Status: GOOD (  18.94  )
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


--itcbjeav5ybt5pwy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
MIME-Version: 1.0

Hi,

On Mon, Feb 23, 2026 at 02:25:05PM +0200, Cristian Ciocaltea wrote:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
>=20
>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@=
27b00000: simple-bus unit address format error, expected "27b00100"
>=20
> Provide the register blocks in the expected address-based order.
>=20
> Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder=
 on rk3576")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

This fixes this warning, but instead creates a new one, because the
reg-names order is fixed in the DT binding:

   reg:
     minItems: 1
     items:
       - description: The function configuration registers base
       - description: The link table configuration registers base
       - description: The cache configuration registers base
 =20
   reg-names:
     items:
       - const: function
       - const: link
       - const: cache

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index 49ccdf12ef7e..45eb0d053a6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
> =20
>  		vdec: video-codec@27b00000 {
>  			compatible =3D "rockchip,rk3576-vdec";
> -			reg =3D <0x0 0x27b00100 0x0 0x500>,
> -			      <0x0 0x27b00000 0x0 0x100>,
> +			reg =3D <0x0 0x27b00000 0x0 0x100>,
> +			      <0x0 0x27b00100 0x0 0x500>,
>  			      <0x0 0x27b00600 0x0 0x100>;
> -			reg-names =3D "function", "link", "cache";
> +			reg-names =3D "link", "function", "cache";
>  			interrupts =3D <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
>  				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
>=20

--itcbjeav5ybt5pwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmcZNkACgkQ2O7X88g7
+pqeDhAAlYxBRUJxwv8eUtRISXOS4Uo/uuzeb2WoFPuk7Mn7UFi1cw4E2+9vmXjj
Yia6EeAig3c3DkMkDZf3Gc+9fsRsiKXNFf/fvTk35cmwVdDjwfqJMAk6kCDUNSKZ
reaJdFUjfadD7ON92dxDDEyw81Pg6eqEaCYGwKwx+/mzLlsRWlgxWuB8sFsaCAK6
exiSCUb4hb5SWmV9GeYRmQe8BWRlM4LvZfupk9G7zoq4C6ztKIeZxH7Dr9DgGrIX
ElTngR7vjsnTmUM5FNnawPTM5S36t8Gy0JZXtNx4W1b5aL7T7mkzLaZPuDF46+pt
FsXGmyMM7J2kSX+MSMNeIgjwWpV2xG10/Q4RmXCCjatIyKLO8r2cvrPtADBi7Ag4
O+zxuM4gj5b7fW+2braOXPLv62ElzAx/g8LAWSQ8rdnvTbfmCivxU2u+RiM+epTr
Mi1ydpkI3KrpYS6WzyOpSqCTkD9eITQSCkbHXh7ycb4g5oD1AVcjl7Y7anuZB/vx
QYo1mqUsmwsOeeOGHDU+LWdIDbs6HS+XbTYCitmnnx4U8sUdR2SmvZidQ4G+c4OZ
gV9WC0pmwwPgMVvlwZcG80kpvggzj9fLNQr/ULljSc7TLZ/5OUnXaY9GWywAhZUZ
6OMBsq1Y/JSSS2UEx++9h0G1MsIwtcboxOBnJ5aVXb/Ua6cJTjI=
=uZOK
-----END PGP SIGNATURE-----

--itcbjeav5ybt5pwy--

