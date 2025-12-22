Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1939BE674B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcPyVo/INbG+mgbLBjB/e28X/tzSMYtvIP/ykLtkGFg=; b=hj0rGVwdNKboDAsfJBLYacaii4
	TyHYK9W8y/YoFY6gJdKsWUF28maupg553369nvEGgxjwYNK7AVz/mbMBgHyefmAhJpt8F/pXJqrGC
	o9wXyf5lkgQkfqEP9P+VGsVgIByUlr744p2oueLrNy9L+1/n/2JYNtzhmUZ+qy/6l5eRi/1cHUUGb
	hUgb4eO1GUOp5JP8X2cNGw/pVmPyOltqftrVCBbgB0fFq2un3SlBYj7o4NCPnYbh5di6TT3mcw4TJ
	J1lt/sztaLYTq+mFoVkJh3q7xCDStu6wiY/ANTkFV3w4kRtb3uSMerww+V3i7tFtnWhic9Cz2W77E
	4L/Ig9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfxY-0000000DoBJ-1RQJ;
	Mon, 22 Dec 2025 13:28:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXfxW-0000000DoAb-0m2t;
	Mon, 22 Dec 2025 13:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766410093; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L1/IFsv93jm9dJPfOH5z5exRx8KEx9Y8Eox/Zlu2ucOjCqwOzUjxdx6KP5IPWa4riBbXda2jmEBVd9YmDlEo7rltJ6/NQAB0hgYeTRjcGW7UqrNR//zyJBn7VFhGGGvB62MXApRXART6ndGVu2eniKDUKReI0H832FRCLr2vDs0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766410093; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XcPyVo/INbG+mgbLBjB/e28X/tzSMYtvIP/ykLtkGFg=; 
	b=XYLFaN+IIL/Dp8El9QsMlCTLpVLPDOFxnKsCnPyZQ6XIxqLG0oQQTshhR1+g9L101ICKJBoR4a9PH4OyvGWHdlzp7HtlF8oyj5x8oKQyCqV4z02eQi9xwcQ0aRSzjBKk+ZrRDfkNoFWm1gdiI/Ht9xlnlrteMRZfx7uKLnJL7YI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766410092;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=XcPyVo/INbG+mgbLBjB/e28X/tzSMYtvIP/ykLtkGFg=;
	b=XoJusC6uNbe5XnHn1TU9hF55SAj9huta4r9Xv0+kf8fGsn59qFkvmHi0Qar+f0mk
	qXWZBzTsx4ACT7cK/E8Ix37vC172EN2tlbb6dnh3BxlR596v+ffpwZBk8WI79J/WcVK
	gAXIa4KCVuTf0vxFgHtcWSZ9k6jFDAjzB00ydlDY=
Received: by mx.zohomail.com with SMTPS id 176641009056882.95030986245024;
	Mon, 22 Dec 2025 05:28:10 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 34ED0180421; Mon, 22 Dec 2025 22:28:07 +0900 (JST)
Date: Mon, 22 Dec 2025 14:28:07 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: fix hp-det pin for ArmSoM Sige5
Message-ID: <aUlGrcNAwp9AK8Mc@venus>
References: <20251220100010.26643-1-amadeus@jmu.edu.cn>
 <20251220100010.26643-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mavwqnpbh2afphvy"
Content-Disposition: inline
In-Reply-To: <20251220100010.26643-2-amadeus@jmu.edu.cn>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/266.382.52
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_052822_464763_2167A735 
X-CRM114-Status: GOOD (  17.62  )
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


--mavwqnpbh2afphvy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: fix hp-det pin for ArmSoM Sige5
MIME-Version: 1.0

Hi,

On Sat, Dec 20, 2025 at 06:00:09PM +0800, Chukun Pan wrote:
> Although the hp_det pin is not used, according to the schematic,
> the headphone detection pin is GPIO4_B0. Fix the incorrect pin.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---

Apparently all of the public schematics (board rev 1.1 - 1.3) have
HP_DET_L connected to GPIO4_B0. It's also easy to see how the wrong
pin ended up in the DT: the schematics also added HP_DET_L as a
comment to GPIO0_D3 (which is actually connected to TP_RST_L)!

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/=
arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index 392ba83ab05a..a0d8f52a706f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -812,8 +812,8 @@ gmac1_rst: gmac1-rst {
>  	};
> =20
>  	headphone {
> -		hp_det: hp-det {
> -			rockchip,pins =3D <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
> +		hp_det_l: hp-det-l {
> +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> =20
> --=20
> 2.25.1
>=20
>=20

--mavwqnpbh2afphvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlJR2YACgkQ2O7X88g7
+pqWog//X+vOJzl7Gh9baLrsAMP1sxkw4DPfvqF0IvGB7q5lqKZVfRcvE68kskwA
zbp+frT64ebUM0dQ8F5jdYoy0AnWQvuO48aEg3P4QnQByU5NZ7KDILQuJByonHzB
VcWhh0FCuxhs8iPE5EJ3U2aUKDO6110nfskA3+wkeXJDy5S5DEZCOnaiaVAeaW5M
GZ3fRdtz3OvJFbUGvKFDTTRfCS9O9EKdZwBETEVLa/rID+M/i1qYnjHi7DxOf6tP
YO0rDyEwK3fyWuw2TzbuK2flvtzpS06lNco4pQrKInCfbrHGxI9VpguF/wo0lxim
XJAj4fbJt14Csfpycjr91sCgBEf3Q3jiDv465ZvVTX2KF8oU047JsCQs0kh6VD1k
ihWm/Fgi+O7D4CWvzMBLztcjnxvG8zGPUNRfD0HLs48jUutM+xobROO53qcm8DWO
AwpgNXGH7ZmZYkMRz9xPnutX5NE9FGOOQhMMIeC/NutbByPoZZ2uei/0hDx7OFst
izCfG3MAHzl0Ze8b49tZTUOQ73vzieAFE/f7ffrUbdX9qR0yKoGP9Dw5R4giOVqC
QHyRqWC8Xn31X5RlOYQAaeYg+Yk/Nq8TRxzXU/Y5mgwe0FM04qIfFLpQIJo9usHR
LOdEtyNMv/DC/M4yqRISba6qV4Xs0EZzakBVYHFUhkQNoNLxpcs=
=GMVl
-----END PGP SIGNATURE-----

--mavwqnpbh2afphvy--

