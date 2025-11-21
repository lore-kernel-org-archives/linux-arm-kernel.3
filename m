Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B234CFA47A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3tJvLsA3nwHU5DlF+mbLwpZA3aTkQK4IJeCwZ9snx8=; b=pcZrFtFJb758g32PbjufICIBvU
	YzJPN0CeAxFSVjOGL5ATHg+0Om5QthsYj3HjSUxWq/h7CMg/pGpDf6V+HqlN3HPtdxVjU68ARSt/m
	ZEi0FyCpTa1yeiHxjWTibIFmkjcTz5qDuTsVSHp/DPJgveX8T2giMmf13JLsHWJHfJm1cKcJ0tdBM
	OA7oIpUEh8CSIzymdQWp1HW69BuWR6N7Ml1+Bl8Z5/3/jj2qCT1pPgCttEwEklXy1YpTDu9CAehCV
	9RZfgGecTeKS4zh+f/D0puKZk/do7glWlOGNwkl61rO6bNP/5ICbkiuME/lALVBmuCye1P7SVm8gb
	MuYM+Ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLYH-00000007yGp-2mwV;
	Fri, 21 Nov 2025 07:27:29 +0000
Received: from mx-relay93-hz2.antispameurope.com ([94.100.136.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLYC-00000007yG3-2jOj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 07:27:28 +0000
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3tJvLsA3nwHU5DlF+mbLwpZA3aTkQK4IJeCwZ9snx8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763710031;
 b=ihoGT6QSo1220JZFrePr3fd8xmuW6AB8ARyZHLyeIrEabQM4HHoWizBwXcWiYmvM/7T4bnRF
 IYkOOibGDbmazLfPdT9KcP4DxSBDwTt6sNq/flMiztf80QF337CeT3a6qwp9irV/Y0JICBMLp7c
 jkM4P7M0XFKH1SpODFyngoXvv0mU4o6i9z4GVEeFfVZ+X2F2KDM1n9kHWi2DvekjEj0NBDor2Iy
 sBRJY/JVHlhnIKKZFjooYLGaFBfLhI6zWGO6VWauPEgm5LHUceQAXMH99M8LAZ6cv+yDyeRlUv0
 kBkEKTSOww2i0y+abjVrXXQ6DwcN1txidFFRKEM/WCnTA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763710031;
 b=FCbOEaLmlh0oG+PYbHzPQwCApNCF4566hqI8k4rdyKbokbEC1fMJoyYdxf7Q5x/863SlaEBT
 SaBv+R4D6f873Jr1K4yZnyFP6WaTh4tLZ2Y3siesfTNCRWZU35iSqzjCpxV6YoKRdsEGX9MyR5Q
 NiuZf1IJpMr4sGweBbKzi9m0BLHZS6o0hibFEYveWy5LEedKsHUvF5+CIYSmsXo8/vRr96ganRq
 m8Aor3q8Ix0RoKif75EO1ZvezMLVZ/C5rgGaNyRJrGt2FtxX2o4CoRg7RhSw4NxLe8+90D6Clmm
 z5LK8EyeHV01L339c/WTQbb6U1jGB1qpRK9x0/Qkpq40Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Fri, 21 Nov 2025 08:27:11 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D12E6CC0CB7;
	Fri, 21 Nov 2025 08:26:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0 for lpcg
 indices
Date: Fri, 21 Nov 2025 08:26:54 +0100
Message-ID: <6219606.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251120214318.347483-1-Frank.Li@nxp.com>
References: <20251120214318.347483-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5062970.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-body-digest: 85f9472f373959296694e824be05722c
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dCRcJ4FP5z4QZkv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 89040410fe253a30377afa8de9f8e326
X-cloud-security: scantime:2.154
DKIM-Signature: a=rsa-sha256;
 bh=k3tJvLsA3nwHU5DlF+mbLwpZA3aTkQK4IJeCwZ9snx8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763710031; v=1;
 b=hqzDGKXm2ardJDpaH2C46gZ1am4S5erJIgCEu496OHVCKoeTDmgpJ5sp/lcBf2GAcFg6bLrc
 HvOZd+8lhxdd19f0SCcNKDq56u/NO8QXKvt3Y/xNMdYTSV52r5Z7rrjD2NZ/SH18G2ODJN/rC3w
 o3GaK7xH2gHhH5cw8EsCqQdCMgG+JkjzMqi0GhXfFo0hfSnwHUXUxX+aMYDiBEg/+/4wc0Y8MZi
 VNdZ8BWaKJYnKWsgmvezmLVSivNkFgrNb5D6p2DR4+Pr+8/xtjTOH62Fsy+E2wfih4UCDX70P4R
 Dq078BELGM0mNeO6m/Ey97/n1NB0GbG5p8fl1osd/KtsQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_232725_064136_772AE07C 
X-CRM114-Status: GOOD (  17.95  )
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

--nextPart5062970.31r3eYUQgx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev
Date: Fri, 21 Nov 2025 08:26:54 +0100
Message-ID: <6219606.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251120214318.347483-1-Frank.Li@nxp.com>
References: <20251120214318.347483-1-Frank.Li@nxp.com>
MIME-Version: 1.0

Hi Frank,

Am Donnerstag, 20. November 2025, 22:43:18 CET schrieb Frank Li:
> Replace the 0 with IMX_LPCG_CLK_0 for LPCG clock indices. Although the
> numerical value is identical, the LPCG input is defined as
> IMX_LPCG_CLK_<n>, so using the symbolic constant improves clarity and
> consistency with the LPCG clock naming convention.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks!
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/mba8xx.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/=
dts/freescale/mba8xx.dtsi
> index c4b5663949ade..78f5dfdc5cc8a 100644
> --- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> +++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
> @@ -225,7 +225,7 @@ &i2c1 {
>  	tlv320aic3x04: audio-codec@18 {
>  		compatible =3D "ti,tlv320aic32x4";
>  		reg =3D <0x18>;
> -		clocks =3D <&mclkout0_lpcg 0>;
> +		clocks =3D <&mclkout0_lpcg IMX_LPCG_CLK_0>;
>  		clock-names =3D "mclk";
>  		iov-supply =3D <&reg_1v8>;
>  		ldoin-supply =3D <&reg_3v3>;
> @@ -336,7 +336,7 @@ &sai1 {
>  	assigned-clocks =3D <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
>  			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
>  			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> -			  <&sai1_lpcg 0>;
> +			  <&sai1_lpcg IMX_LPCG_CLK_0>;
>  	assigned-clock-rates =3D <786432000>, <49152000>, <12288000>, <49152000=
>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_sai1>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart5062970.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmkgFD4ACgkQaS+g2M0Z
/iUgUggAtEtgpzATuowAJMkBiof/iitCR7c15FBQ+YaxX5BIvfh29ytr6z25ak3Z
UJhAW2KamHXI21LGIDS6C2VFxJGmNhaZcN89VlEnVoy5IBbqvbWp+2wrWHrPfE67
xm7D/JZh0U04dJOqNbVIoe+SyxGfToEV3BAI3diSkHSmivdHyqVDxWyhdCWp+FR6
ktG4DKP/YNXjzqzNLP+LsSrkbUQqbY45jOjkgL26UlzZVXUmPvm8asTvCrPfUfsf
plaF4ynO9tbyjzEo5ubwFn7F2ynIvdHfJdHjSRJBoseWuVNVTfspue+Tu+Fp1JU3
B3qWpQZXo05V4YjY+JLZpW8BC7gY2A==
=vWvp
-----END PGP SIGNATURE-----

--nextPart5062970.31r3eYUQgx--




