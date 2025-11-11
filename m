Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAF3CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsITilBXp19OSMLNyHWtGaOi0EfIBO4czotRu+0gH3o=; b=Cu76T5rSpAy+AEM1b/IQMKlhE8
	B6FQsFmtazVZt7vF8PmPEgxXrHijfLBbLFpClu3gPepL2l1VOcJZ33HfkEQiwBX3E/FoGcXGtQbVh
	w3vAl0n7yBj1aKPVzoqv46IIpIuvzXBKCSP28mhvlZs9CJeUcCytauOPE5/BWEtM23XANOUVmAVf5
	y3bRx6LBkuKu1Pg2uEsB90R2hJFTNPsuasPYQ5iXukyVe66oCWJ5z/lnN4YXhp9v01W1s4w4t+fix
	BNJwicS7wEzS7W2K7NvykGO/FuDYKAtT/8Sa9pb7mOq0OJEwaRi9HkCf30oEvKJFGxPhbBQ0WFGsi
	GCs8evLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsig-00000007Zyj-1tk5;
	Tue, 11 Nov 2025 18:03:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsif-00000007ZyZ-2d0M;
	Tue, 11 Nov 2025 18:03:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84E73601F9;
	Tue, 11 Nov 2025 18:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B8BC4CEF5;
	Tue, 11 Nov 2025 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884232;
	bh=mirE0FVC1aFCsQq2eMehFBIBONouR+WUmeEdSPLLXaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoxZ2qITmDCIv3Aw71Gtor6BXmxZ1wnoHiUP/IBntzbdAFxQ9XxovK8QSj2aDPfZf
	 8IqPCAlCuq0F29Cbyszl60cwbOySqlX8Rj5fwBoLkDonymsRi7FtTTer6S+8EI4kqM
	 /ut0BcYpYH4KdK4sZNYt0ARyTafsLbJsT2J1vKYwJE48dIlDpf49nt492SCsRajbeb
	 N7w7bHAXlZp2gWqVuLabvi9TMqJAmHGuMrDDhb1WkFwSw2R9+XPQRX4y7EiAn/1Y0P
	 pkrI36WZ83pDlW7P7nW0wY6+KaIUsVMglj8ztkQuZyvx7fRB8f45cARtGA3HLG7lmq
	 XpVhTSucBjALg==
Date: Tue, 11 Nov 2025 18:03:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 8/9] arm64: dts: mediatek: update rtc properties for
 MT6359
Message-ID: <20251111-heroism-greasily-fb01345ae609@spud>
References: <20251111070031.305281-1-jh.hsu@mediatek.com>
 <20251111070031.305281-9-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wFCZWHo1MJf80ONG"
Content-Disposition: inline
In-Reply-To: <20251111070031.305281-9-jh.hsu@mediatek.com>
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


--wFCZWHo1MJf80ONG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 02:59:22PM +0800, Jack Hsu wrote:
> Update properties of rtc for mt6359 PMIC
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
>=20
> ---
> Changs in v7:
>  - remove mt635x-auadc.h
>  - remove fg nodes
>=20
> ---
>  arch/arm64/boot/dts/mediatek/mt6359.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6359.dtsi
> index 467d8a4c2aa7..fe737254c091 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
> @@ -302,6 +302,9 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub=
 {
> =20
>  		mt6359rtc: rtc {
>  			compatible =3D "mediatek,mt6358-rtc";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			status =3D "disabled";

Okay, this looks a lot better now. Still missing an explanation of why
it has been moved to disabled though, especially since you just go and
re-enable it (without adding child devices that use the address/size
cells).
pw-bot: changes-requested

>  		};
>  	};
>  };
> --=20
> 2.45.2
>=20

--wFCZWHo1MJf80ONG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN6fwAKCRB4tDGHoIJi
0uoFAQDNm4ule8p2MhE3JjSHzEvgFm4U+PmD7w7D5a6po+6lFQD+MjosiBlNJq1z
mhXOc0fMS+qD6LGsDwugFT6pPQ4lzwA=
=+aBt
-----END PGP SIGNATURE-----

--wFCZWHo1MJf80ONG--

